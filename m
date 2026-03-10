Return-Path: <linux-arm-msm+bounces-96669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCFhGcEesGlygAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:38:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 286EF250868
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F20831A61DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994003AC0FA;
	Tue, 10 Mar 2026 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFDl7XMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVdHt0n4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E43AC0E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148920; cv=none; b=M9EGgm/ph0sGl/skpuZ+R1YMgoavmmz/pKWyNy2oVaDLQoc5yldcpp3WpEqZQGKB3PVF2oIsoLKcSji2G/5o/nOFCvUS3tBJ4C/QUPKrkGdTK0Gi0RIYPODJt0NzfhsmziPuVxUkEGxcqbrNltCVF713A04E54+rhrt3UjKY8WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148920; c=relaxed/simple;
	bh=kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCY3yODQEsG/mukAAdeoLiF8DEkoLLAv8cbCcczH+87Pz7YUu96Gy/8F5sxlP1GuM0n3S5ZnSq5FIyo5pKn3TKM+ImYoitegl1fqcL3QFzyfia5iJPKOno4uSxtIjbJUcSPGVJQo/64HnGIlbRbyBpq3j+OT8on5NRPxAOtFz2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFDl7XMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVdHt0n4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACb2P53760660
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=; b=LFDl7XMui8mrfhXp
	7e3MMWa7nO6wCN4UfzViV3l5E7cNrudkkhVYcE307hcvDdirQ3XHB7N/ORPRV41t
	b1FgXQXHgoi794XdY7db5jmnflHQNjAuHrCDeNTbw2VDqAOXPlx7h715P6axDTmy
	HXT3mFT5wae8OgQGjf1AQ+5U96Y/mY4wqGPN2Zz06Ot5ff6TT/o0FDwNod6hEl9A
	0J0RGl9GJObV6SqU6Bxd0J7L1HwBPXGaAJmYuXNS1eZnVJPfzBkANnoHPiruXASB
	ShYaRm57Ak0pgpAe+MRQj63JuSjwUmE+cZUQyM0CvF28DC8R95OaqqDV42PknNJj
	hWTWpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ug6b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:21:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd93c91075so66552485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148916; x=1773753716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=;
        b=WVdHt0n4f4/zNUnyZ4iGJm4lMmYdSFv2THlwujL/JmMPoCqVNSaqCLRaJ61vUlmaN3
         VoZM7G9ugl2rVvBO3G29HtOl1mUGaQjd5FmOTG/VEyAijbk17p4us7+60ttDPjGjksDK
         7DUlelYmMiziFntNlklt81YaXuF5s83vE7zCbAnZZ+ByJPdE7k9xRb426bWyX6YVzwYq
         u3R+zRkqFomTImFbJyQRirTD28ChZLpjQy39fbUnhfFaYqrOAVBe2awyEEw9ajR1bjR9
         i496XdBxbTdV6pBIFOtUjv5YienRqEp9IWFLDVXilim2q/ZpfT9GaSxQ9WULrzNkAjo4
         qUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148916; x=1773753716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=;
        b=XxEEULldElG+RRPOCUCW8feYsH8Oqx8NnffA0vgbf5q2j/YPlc/pJBGuh44UhZc0xr
         ldIvWdOmIjn2BkiqehLlVRgSwcfkcnPTmNiT6n/16c7BFH9ar6INj0PryIaCXTONPK+y
         O3wXEXwASCLYTn5JP3wSk2iaS8HRJ4siUZZYJnhNyQmAzwbxlhcbq8gy7RygrGo8IScC
         tjBVHKdjFH9MrByMorQTwpU87Yh7CtYhFI6qQQ8oKLhsaYTeCZk+HCkYNf7sSr9YGLJB
         r8wXYsu/zAnW2VkVrPvwf2gHgiwd4DaImldJUzyA27N8mjAwhFigIUfU5S3aWHrOBkoF
         2cYw==
X-Forwarded-Encrypted: i=1; AJvYcCV8cQSOyf37WvfVkc9PsNbSum7a5s4Mw0WbeQJONH2tjyrjFAnYRbaBN2pdC+Wwv+4DMhp8WP5jduNIKMEi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GVNsiKMBbIPm/y2/8vFMGQx7IstQ/BKMQypjIfqsEMmAuDOJ
	EaXlM7Z+FyiXpM3YUwaui3u0pS304Q0OakG/hahWYhJ++MrWjhPnzh0noGIUksk1N1pZD/+o0Jd
	dYpXwOR1Y9ahHnTor8fntuw/tsVE1kz4qgbaVAaUvIKhESeyqFiQw1ovVsgZsxCXwGGHP
X-Gm-Gg: ATEYQzwQzT0WoTLdYd/VzjZdtFxp/UVjqn37QM5E80EeDFj4lTzMeP7ojanDjIxS1Vz
	Kbm0fOgIWCSbrWIUP3emABzaKHIExn3oHELOGEtNyBeStCc+YjqSK1n6o4tEgUhjfGPntSBi6a4
	v4fsE05crD4LKsasCm1giXb9Sx+awiYhJKs/ndtDyUCPJQbt0gFSKjOWp18Nf9KFSzLOxiK6whc
	4AKKMzmrLHj4GPZ5Zdxb8b+9JlyEvzterinI63MJAZBEXeTaEPi9Ekx1T0xNVQryYMsXkM9NDhK
	PufprPJvEqpIyHisPPDT3WuhKlRru087xsi1L5CD8202ZaOdPP15SfS+VLWKhUDRqlP1lGc0B1r
	nViuAOlP88fsanARZvIu22nLUaoi80jLeKFZ9e2eHWjM6x61Gae34V9IuVTILnRBYrYCj0nMzJw
	2Od6o=
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr744006785a.7.1773148916386;
        Tue, 10 Mar 2026 06:21:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr744004985a.7.1773148915952;
        Tue, 10 Mar 2026 06:21:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0cfsm2719556e87.43.2026.03.10.06.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:21:53 -0700 (PDT)
Message-ID: <a9658d1f-556e-4a58-828c-1d97e227dfd0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:21:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
 <fabedbb450f409aa0aa415151de0263b@mainlining.org>
 <2255b753-4d40-4e49-a89c-22ee939c51d1@oss.qualcomm.com>
 <6665244d82ee8776826a7f6a4e64af99@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6665244d82ee8776826a7f6a4e64af99@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: q6poUtqpifa28Lh8TCzhnu2yyDAPpTTg
X-Proofpoint-GUID: q6poUtqpifa28Lh8TCzhnu2yyDAPpTTg
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b01af5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=txOwCwh0rWGkxaMTvjwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNiBTYWx0ZWRfX4U3ZzGwOAqPl
 CgRUcX8ddmL4JCu84l4qa5Cjl4H1a5AfnTBJWWd2S17gxu2MaOlTSIKreqzpCidj18iXW3N+Ri4
 vQtK6k0VGzA9ORyn5XnaPmY2PqpEE9MxUi7/6njLcRH0ZfoEOwmuPuTQrLMLE8ywcV66n+qiANx
 CG8pa+Cgy8qpuBJChn4/66ZolMLoEz0rIkccBXlV/QBbg5R6C1wpcF8qIZVh0REaEztvzwik64o
 QaSTUm0NOmF225gKTFtKUpPHz0up3brVY0W6lXM5rq5LEW5a7fRXjvJeQ/B0Z47K9YtLLlWh7jQ
 UK2VaYHQdoGWwQyiNbjTtuJYplrUONLjAakukQdz3NWSeCyGyrfXF3RlX9dCM5sL6MqzUilNuYJ
 rBskk5lGHT6eeje5LAsLhY90q/DYaKSMtOvrFOQG3sWQs0KkocGXvncsJo6V3Zq6eHoGYSCSj09
 dTPLvXqCZ9JUa9QO2tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100116
X-Rspamd-Queue-Id: 286EF250868
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96669-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,mainlining.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 2:11 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-10 14:04, Konrad Dybcio wrote:
>> On 3/10/26 1:57 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2026-03-09 13:55, Konrad Dybcio wrote:
>>>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>>>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>>>>> it can be commonized for avoid unnecessary code duplications.
>>>>>
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>>>
>>>> Could you please try adding the following to your gitconfig:
>>>>
>>>> [diff]
>>>>         renameLimit = 999999
>>>>         algorithm = histogram # or 'copies'
>>>>         renames = copies
>>>>
>>>> and see if this generates a shorter diff?
>>>>
>>>> Konrad
>>> One more question should i rename msm8917-xiaomi-riva-common to msm8917-wingtech-common,
>>> they are wingtech devices. Which naming is preferred?
>>
>> I think xiaomi-riva is easier for people to associate with a phone
>> they may have in their drawer than wingtech-s88503
> What about renaming just the common part to msm8917-wingtech-common?

I think it adds more confusion without much benefit. Probably none
of these devices have been released without a Mi logo on the back.

Konrad

