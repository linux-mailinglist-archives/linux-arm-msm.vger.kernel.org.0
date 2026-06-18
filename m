Return-Path: <linux-arm-msm+bounces-113703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVqBDAS1M2ouFQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:06:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7469EB23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="UXK/RJ5O";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RUmJOjZo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113703-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113703-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70CB53013272
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBC4380FE7;
	Thu, 18 Jun 2026 09:02:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C69366822
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:02:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773342; cv=none; b=gFEeCEDNawAjcaDrRQ8FmuH+0SwlBlaBkAVxjSyhiPjgNty2AJde2lV7uZtVDqOUTEF06bnFu9jmCBZLHKu3LcIbsHya78QVROb5MzkgXKQI5yCzHp6So5FeC0xrWLInsl2NI2jura3MkBzF3cQZ5WT+tO9Uiz3DEC2TbGhBr1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773342; c=relaxed/simple;
	bh=rduQ5cDDUs+1VxSVyf2EIpzvLr7nMgBuKcN0Q/MsFTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReI7yzk+BRfkSo7Dz9g4NYgwhM5fH85F6AIXyNIpz7MI9Zxp8tZhNuWm67rdpFuxyyYp552dijjnvfrjQF6J3lwtw32s9Hx94mqPvZIk+eWGmgAWHrfqZTTASAr1i1p9+3oTEyJOT4U+4S1JDHtwXzQ4TwEUmVLeSMlB8w2eJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXK/RJ5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUmJOjZo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8E02v572798
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zG+uYr7MKERBLpM0IqjmUHCsQpSpbWlGR+RiEAniXaw=; b=UXK/RJ5OMv6vsWJH
	ItapsX1fNItw3vIt5kJ8iv6jyQxSoLT9Brt3f8zpp34FWPTYJes88D2R8CYsVTGz
	OKaW/ehMv6ALgiQ+Es7ghgb7jJWDJtzxGuNfigSyP4pIuP6dqMBvLV1TUo9TpIuM
	XWNjE+Pb6IcZZrPY3Ejyjh0Vj3WUZrwBreeu3/7iDB2bxuK2tA4fmP1ebMljDcny
	qGBjjnTc4cO0rcfOnKCO9JUEGYhHhOCSfAih7OkrTfAM5fiaUTUBfZr09lZN3Ukn
	hG7osY77jGW7V0R4uqqNb44gDtt1Y2JFprIKqrkE82O6cJ1dti7nwBMfOSMOYB75
	Nmrc9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt53gst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:02:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157263095fso19199985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773340; x=1782378140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zG+uYr7MKERBLpM0IqjmUHCsQpSpbWlGR+RiEAniXaw=;
        b=RUmJOjZoANfzcXs5HtZ4gNaYTegOz+r2rUGO1cBt4Eoovem3jZBdKPOBjD3cOrvBAz
         1KBhYUYo5b6JLvvpWBN0FPj0a6lXkVay+sz18XTBYhToX43ocgpFF62w2jS1wUF/6Uwb
         sRxqp2mg8Peur/1TWLa4ga4Em8Jl/E8KWHhkS+wf+8kHkkTpHl6D0h+Wa9D8KGKrV+g5
         zK6GsK8kqEaxY5VgpoeDxuj9ZCVmwJYM1JnqwypJ/UqHyAdOHEbAY/wD3Y24hqOzwDfU
         Cso34F7+Y9Q4wSzWHQMQBvLla7kNDp6SHnpnVkxGmeLLK+ge4c4SvAM3a4V03nW6o9NQ
         MZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773340; x=1782378140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zG+uYr7MKERBLpM0IqjmUHCsQpSpbWlGR+RiEAniXaw=;
        b=oFhxdvXAO6ZpIXch2J25PK3FU1H66oVGMElwbVfpwhbtePVpNy+JyPC27B1WhfBSHA
         EaWRTmYGU7EtA+mdd46eg39S6hVgoQdl2oeAFPPnDAWfH0kSWm0Qq/Xff6jTEqyiyrh6
         xC88gRJVKeAOvgChBUJ280/GE7BI+QWG/GxD6vqdM8LnK1mj2noC8YXqlhqCCBkuSgXW
         pvKoeCi6yODflq+UK1SAFF/nvw0FD+1Qq7f8j5YxJWSnIHlm/euojg26WbPucnZGgjr0
         /w6ZNgJlat4UXSaHfViPAOtHK1bCHsViDotoN2yIdpGv7KJISML+7TRbqxb5G5n32Sua
         RvYA==
X-Forwarded-Encrypted: i=1; AFNElJ/SELNhRrULZ5AVs55Oe9O4U7d2GFmpNtt2htaMmIn6hgvfrdIYIZyHYGIEXwQ7V9PYAjqrPNNry1ry3j0a@vger.kernel.org
X-Gm-Message-State: AOJu0YwzggKUeuqBJDxSB+LifIrBmafIVBz6VR9UntWNtceaU1neV+WH
	5vdFT/aMLBTkqZCBAqbbxmJfROqCdosJk1mDNDWVFtRTCg+pU9j2EoaCQ34gJx2N3ZLo+84UtV5
	kXFxg4oB2FL0m9v1sNTDuKuF+CQW1BPXfmpzBQIKLhQNbmZh/ZBPVTQdcywsIHBz3Y5Cl
X-Gm-Gg: Acq92OEeukj5qL4k1xfImNBv1xpkM2/CAKm1i+IA0YeS1l7ML+iW1T8hcGA73M5cSFQ
	RBzr/ZTWw72HMSLr6ww7OwItPnOnEAm2lbku/12WlmzlfMKn6KUdkE5wDDCDfwvUQ3bq67vlx0S
	aCjokrrk419XqDWYpqNDnqVfUDsr4PcDPnbjXeR9yVr95peIfCZOZXCDD5b/zAJ41C5cP+zhDgG
	it/KPiO3wIgmRt1wF3UJX9wGQRTpf5IHWcsLj8poI2dVKDDy3B1//UgySCHiNUcrYLop1pgu5+I
	NuaKW1zbMh9XU8HT/633TK3TKxtNtU7Cg8TJIZ8UDbd49rNvl8yM4MHXrJV4JYBd8KSpke3F2Ow
	bS2Vsks2fg3LK2IBBvF4zzD0wnzZRChhnoOM=
X-Received: by 2002:a05:620a:2a04:b0:915:e7bf:e6fd with SMTP id af79cd13be357-91f28983cd4mr241037685a.2.1781773339706;
        Thu, 18 Jun 2026 02:02:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:915:e7bf:e6fd with SMTP id af79cd13be357-91f28983cd4mr241035285a.2.1781773339297;
        Thu, 18 Jun 2026 02:02:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6df9bsm951221066b.35.2026.06.18.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:02:18 -0700 (PDT)
Message-ID: <9fb8f4e1-81fa-476d-93c5-b82bf40a2c12@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:02:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add the tlmm driver for Maili
 platform
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
 <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RcFXgK-TpR1hO883GpHgh1IdEgY0u4A5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX7/6JpHrI+GKn
 j+aYPbfgCgk8GjnHZABZmujca70EuqgAJNoGb/K42l6ycFVMVOUpfH8A064AcAGDqcRVyNCn+Hj
 M18p9i/OA2fQgRo5xmEWDOX0F8M2UZc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfXzLCLuMa97+jN
 KR/7Xxqp42STPhod4DCIhLITnjXT61qOR3kNuN+HfDpDAbsFLixILQL+dWq37QiGd8p3E+7ulbB
 5dEOTpqJ019Aw3wmyIJiqH8V1mN0/LdMxszyWUOiUIoQ4yFYomj7MxnN+kUcAfS6LJLBeGhOtxl
 JuIGmYOx7AgGT3QdrFglyDseeFXoVg43tNdz5AB1Y++xA6BHIDFPC21f3wJgv+tf6/LgDMci2YJ
 1B5jzqfDZCxXXjhh2b8Po9EeAFUpt52ThwLc5KZKjql5QXTu83burAyo0hbhdtT9/rBpacWxNgV
 PlbvMvfIr1q1lMZ/HbIqZryD9+v+S8D/Zi4Bk6wKo+Vlnazw7WDE7P3xvo3l22P0lLHtLf6gXbu
 8uPMORlyuoiRHfcWrJOw4fLht4Fq3uUXpAXIpqzMUDLnUbR0YdQeWBdKcfz4WfwonOXmZca804n
 shEMldpug7rbJHxqoVA==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33b41c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5G9UlDZQlRkejQDSHd0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RcFXgK-TpR1hO883GpHgh1IdEgY0u4A5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113703-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DB7469EB23

On 6/15/26 8:55 AM, Jingyi Wang wrote:
> Add support for Maili TLMM configuration and control via the pinctrl
> framework.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

[...]

> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

Let's drop this comment

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

