Return-Path: <linux-arm-msm+bounces-97881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JVNC1/Pt2mDVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:37:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F42971DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6670030071CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E27A38657D;
	Mon, 16 Mar 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/PkFDeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTriZICZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B44A35
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653706; cv=none; b=Q2yIgn0ib2j3Ek9mxfm1OOc4LKy6RrtiGHUyOdohe1nQSNhWO4OvDEqeQNds/V6Kx2LM+7QrbDTY2jMl532RZP5aTERsEtUXYYRIDhX35QADJbSh80HGSVYBCB5pb95zKiZEhuZ6F9qDz1KRw++hFaLxm4gMEYAO18MJx9qolaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653706; c=relaxed/simple;
	bh=4r2iMJNnjHizHuoua26v+38XXw7c1p7R6XSQ8WsVbGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKSFXY01nr74PTwRmCKOv3/uVTKDJFUN/kIH5LYvF+oBll5EFSgPtCGCO0yiQi6LSkjnnBdSe99uEb3yWGtqMQDnp6NHj3g4dbDU9NfEzS9UZC821H3LtKGA7Fh4f5bSAnK4rzGIWI/uMiUu5kCof35jl+g5rO7JnnrbTaWQxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/PkFDeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTriZICZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64efU1282074
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=; b=U/PkFDeBlrTsKB4C
	6YsBXWqQLQNNKucxb4AjteIqyUsG8InibHHx6ZMbPsEHm3s1HGtUDQt2fukXAI/i
	V9XJXMqCRWxJ9/furxhpWWH0hrEWX1uv6n35rKXt93ceeX7jR+O2MfoivZoWdbe3
	Mktc3TXJHl6eUHdW06qqkfjP5NITEW3AznvFj1vCT0mBJhEauqWHJeVL1v2zf+5R
	848vXObuf59Ise8YjfczNFrguqYdJ/D7ge3dHodfA8iPDDUJ+Rsn+GczS/rWdrMj
	Chr3Jv0eRUZ+jQ8WyKf2NXAknettViT57x748EZ88KUQoriLMGMwBqhlQlua4dpL
	u7JHow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc4yhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so284431185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653704; x=1774258504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=;
        b=ZTriZICZAqaMAdvDiWGWDrzsripmEcJfg9YGRvmXK2uYi+bm3ZpYQTG55Qjd1lBpsK
         WD2ZDDvH4zu1YqxxOGP3+gW2XwbsQSUcmIHJrED0gK2Rv9oQPeYro7BJT8Jm/EidMX7Y
         7q+h2gf84CkVthQME1CpnPls0GzD0lk/kUgDQzeYa3siI6nd9ZwlMAtcj8awx7XVJs5O
         kqtd/0uJQbkKXZxXW/b0kNFZ/G/FeTNfgBC4C6Dbkpqbp/dZBideSQPM0GcAecbYmqc5
         lpzlRcpjDLpkA9Uto71X8Ef3OL1HhEsmB6V0Qbx8C7VQbawUrdwjlGa6C3C4duSaXojb
         kGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653704; x=1774258504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=;
        b=CMjrzpD8TrYDgdUsvpezOQtkzJCh09wK4Sqv7WoGB5omgWgh/wXeREdtWEyBD1wuN0
         d4tjKFcJUNsnJwf5YaJ5G22Eh2PVT9aZXWKUiIadcqPWcqqgstsXfWk5cpP+8HGAFxih
         mA1o2DC4fPAPTaTpa+1ZTXzQPdGnRSafjul8u7KizwGOaZpmfgV0GqiKNBTUSh2HyR6J
         YvMrjCgKRj6utrtoxBihP9CI2Q78ZzwYGmoSy3lE9DjiMhh62J1nXVtuEhL3IbS6zZ7U
         XsmHRVZ8Db7Wp+ujgtsqf1Di4ypF5MZT44pAp69evFcJ5J4LdexrBljyk4dxOnm4hLn/
         X0QQ==
X-Gm-Message-State: AOJu0YydRd2TIHo/2JWFOSb6BgK9ppsaAEBCLZoQPKSWxlhrtE0woUDC
	I1LsqFVTr+gU/kJMRiPpl/Y0gMl8NZB41otR8+KL0CH8rMMPucN3Ej/Q8qCbpvoFoVwjK20XOKS
	mvYH6QSVnbjob6G4xA0oDy255H2lPghej11NA5CJa2rB4YPpAeQv+/F24QjYBC8y3EUlr
X-Gm-Gg: ATEYQzwb74M3t2zmjxLdZRhF7Pd1IAt57Vc0vf3+FJY4WityY/3kMlg+REP/Zbq8gTF
	9D5GEbHuAmpHZaI1B8VGBBVpxGd5gHOZeEUl1xYss1BWGN4Md/2JAQZYcq5MUQ/SERjbt15glRn
	La7EFkjjsujB8vps1+q4AkdX9XMZaleByIBIZlHaGYsTJle1bqIMwIK32tJuhgNC7BNviTT2gh6
	s/q/FaJZYp1rrjqnsSp7RDcVzxK0b0p8bfmd45d5UNzPYmA8WZG7bf+U61qlHwPS6GWT0ZEA2Rk
	vS7Hp1luPTHQ46uba5aBN08r5Jgxxrfy1rlkbY+tJTL8s0m64Jd+qCNo4my2VV36SVRsonQZl3j
	yX9/q+Hb2EIk+AZTzgRyun9P4hdRbI3448CP05rbuNE4m5RxsPzdcvuReTOiQKm0hekfjcUun4v
	4ZEwQ=
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1232410585a.7.1773653704206;
        Mon, 16 Mar 2026 02:35:04 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1232407785a.7.1773653703814;
        Mon, 16 Mar 2026 02:35:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97cb0d2df2sm45121166b.54.2026.03.16.02.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:35:02 -0700 (PDT)
Message-ID: <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:34:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com>
 <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7cec9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4Zt3pBCKRviRSeEyxVwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: dNLxllI1cE_ZUgM6hcUuPYVkuAjXY5FJ
X-Proofpoint-ORIG-GUID: dNLxllI1cE_ZUgM6hcUuPYVkuAjXY5FJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX69Nj61b6q+qS
 0tK2x2pK17cPb2NqiKBe9WVvffKWkMjsqDyrqZ8j784dxQ7TcaM2ALj2LzeI42lSEklYOCe4Hdj
 JMjkxQoizx/RE1FJc6YpTweow5ik3X/og/vqbCRrBgNYRnMxS+9f8aIX6V2olGD2kHeLmwdk7Rq
 dji9MWHLa+0Nu0KsDNHVYXuKl9GHY48DQvnpZGWHNLCkjCild7nhIAvY/jMnM27ek6cGf2Dmnsy
 AAReBg1XuQy3qsHmn9CTk+yri8tTk5JQutymtYfX65GGe+v/eCWQcOh0eI68CevG2eSV47uQLXh
 6YuzUqEnrHwBsRVf3b1EoIFZhDvD1IebHJTBQVwBOE+P37juoOXp4Z+mkV/SNt/9XUmZYfbwyT4
 O8v+Gu1/NxtmMlNc3TO4qRW0xFScr/zpHpu/r2oXY331jV11+jY7P24GSIQjLG8UsEOCeh7g5fb
 5uqFq+5IYouNTLUDZQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97881-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 887F42971DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 10:03 AM, Kathiravan Thirumoorthy wrote:
> 
> On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
>>> rdp504 board.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---

[...]

>>> +    firmware {
>>> +        optee {
>>> +            compatible = "linaro,optee-tz";
>>> +            method = "smc";
>>> +        };
>>> +
>>> +        scm {
>>> +            compatible = "qcom,scm-ipq5210", "qcom,scm";
>>> +        };
>> OP-TEE *and* SCM? What does the former do?
> 
> For OP-TEE, we have use cases like getting the random numbers, remoteproc PAS and few others.
> 
> For SCM, setting the download mode is one typical example where OP-TEE doesn't come into picture.
> 
> Please let me know if this helps.

I think it does, but it's odd that OPTEE wouldn't handle both

fwiw +Sumit is poking at OSS firmware for other platforms and may be
interested

Konrad

