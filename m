Return-Path: <linux-arm-msm+bounces-107445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD3bLkfMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:08:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DA5399AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1482331A9762
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A683B2FDD;
	Wed, 13 May 2026 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ar2RB/7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kR2ho4Qe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB163B2FC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698546; cv=none; b=bqY0WZBm3M6/XPULfRlam0xvKjuU8nWCyPFnU0u9OLQtvgYC95n5zGFtmDT75k3UxazVl5tnLx2QgUskL3tXtae9ODYdAdpf5JAnJMSE/vFTO1o00NyLPSjqkfei1tNEpqdv14tRTojrMs6d7c7MItjJpYZRo+HQYIvN17aeboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698546; c=relaxed/simple;
	bh=gX2VPLHTZhyrvzSSfWdb3W8j0HsjVo2XFl8qfdJyUTI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fh0izv4xG23xNZPac7JKE5lWxyuWdmVsxKSXcVDOtpzSwXtQEU4+NFgLeEdHHPAdnPU01a5rPqlpC1CXUckPdvNtcOE8E1iKOudnreWZdLmY0Se4M/egBHH3mvt3Jmu/UCMgfnLqRaOtAl/KAXR/7+rbmBId8jjXJjp578EL66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ar2RB/7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kR2ho4Qe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuPP93995764
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eTrq8siob5eSIxdFaUvdzUSIbYohGk6NzsnHGf4/bU=; b=Ar2RB/7YO/VYrQ/T
	2ZWI47UDVU8G5Oc+g8V+ZRUtTxAsF8X4Tc7RsycwlHidv5xIw6k68x2ptomAaLA1
	cVqp/FZ4J+rhUgH8NWP9FmKg79Yqqb/jztdtBcVWGXSsGOatpCMjjlfNgJovNyaA
	aV610sVO+jGd079tPghnZ/KPZyYT7Mps7xQexYPVwhXl3VXL5dLe+1dgO9XuCxQw
	JwRc34u/jbuwwmGt89zE18IetpyDg2LHsOICJ0kJUGGVw7+21xSpLnK5knOUaPWZ
	Ww7Bp4VhRqtN/nBfTWlFf+rg5aBmek9HQCc3Gy0/6Ehx6PBCM8Tf+31bP7hIs5HX
	Ne2Gjw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urgu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so4336816a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698542; x=1779303342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0eTrq8siob5eSIxdFaUvdzUSIbYohGk6NzsnHGf4/bU=;
        b=kR2ho4QeUsuTQqyHMVUosv3RiyYJjZBAHwhKos6IgHd2LCf9uqIVrY7YrfeV9AavOn
         qKvJriDal1MdUZvWcv8f//Af85oNnXegZ+skdDAeNLmdbgwxaJGe/u6zaOcdPXoRYBdi
         39ktPpI+XeMd/5SgRR6G4vTVXg/8Soqcbu9kmUaXac2c4MhwqQrNUlQ2UYqHv55uRxEb
         nfV68Ka4CEcj5QdMNqlOxR60gD5CvsCmS5MeoJk/xdMMVhrYmoSYHAjogSkvlkj11fMV
         PeryGGTeT3vkSWNH/sXK8/ahz+2C2XfzbTeP6cx8wEIFCHVokNvhoCuoK/GMUFtnAcjZ
         EuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698542; x=1779303342;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eTrq8siob5eSIxdFaUvdzUSIbYohGk6NzsnHGf4/bU=;
        b=RFVbjhBto8MlrQ7PFjGZi32kd4OsZG08wcSNP0mE33wIrV3q86Kg35NjQ6h6wfPYQD
         iAk5LbvcI0/+FvBEqlB3yXh2q5TXRX1VIl+tpEO+vbStdiWMCGGAeDJevgVMU8Crwy5V
         iCm4Y25/qCjQFFwFXhoA9fjpqjmHUPUqknbEOBLcx9uENhfGm/+qtKHqYmJx4TA0PzKM
         d21rn1CcNtWllyDTfxn9mU5ziA6OcB09HfhOXjeDg1CFW7yvUsiXpmCDwNtIuoJCWLzd
         NjQEb07QE17CaAps7pKJtFJ8SnGxF8ZJgw+zEBuRAuhn7u1JY8P+w00JOaCOxenPLcgz
         /pyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MNU7Fq51F30PZbVNqzaqEiQ73PX+t40Ukk4siknOFEq/nli/DjXMG56e1QKE2oZh3RB7VWeAYoscFqHf8@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOItM4CmZ0ALI+f3lhf5kQKf/PGO9uJR/5xPO+DVthmZY74Tp
	uX1WorDCHDvfyoxRJ7AqdCerr2p7mTjDX7auTQITQ7f4F//D95FghNteYK/v7kgkeJUIPLXEkHp
	zE3x6/S3iF+BZ9aemNoSsVl/wA0opT2Xx1uN/WZcHgZrwFpcXiuQi1LgF8RxXAeD5e2Wm
X-Gm-Gg: Acq92OHRaUx/eV8iJ3I5bT7GHsRerGdRlHGy/ycPV9pD2S6vgKqi15k1HmWsKKk2zPX
	H8yvmy+ZVrWL/IGOTBTMeOzMFXBBVOipmUE57iUE1KBA2ywZBYer8+RBbeHwFZ1jJziTVaoN/Q1
	kqDwLW6BHKhpaJoEGrI9ZdrydhBBhsnHHnX6xWRYT2MYWkJvCakrT/wqS4REZFJgL2XRzEXQuJz
	wy/lX3pjxneBBhdQzYNAbSkoyazzoMNoCRnWZ71HYtVKziYAvn/FeaJ3HbQ2FGLMqxDiJjvMqMz
	tfVE7VtZr/yRlob9xepq/xtnBmapy1BtV2lVkXbU8WfYu25/kHZcRU8hXWdTvSh8R/ZK8aHv5v9
	E3HPfd0fpvVrilcnRPdagdgqDYeUY42NRZXInGuvkrmqn33Vj6UQJ
X-Received: by 2002:a05:6a00:330a:b0:834:e882:3280 with SMTP id d2e1a72fcca58-83f05bf518emr4410519b3a.31.1778698542064;
        Wed, 13 May 2026 11:55:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:330a:b0:834:e882:3280 with SMTP id d2e1a72fcca58-83f05bf518emr4410478b3a.31.1778698541428;
        Wed, 13 May 2026 11:55:41 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm244376b3a.19.2026.05.13.11.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:55:40 -0700 (PDT)
Message-ID: <2b8e84ed-1f01-3936-0fd9-b5249ba5832c@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:25:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/14] media: iris: Add power sequence for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-10-7fbb340c5dbd@oss.qualcomm.com>
 <jqe3ilzqzajuf67hvp7nw6mak36qyqu6dz2oiwtkf6zwiyclln@ydtyd7vkudm4>
 <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
 <h2clkcgpr4uki3fq3kbdutsqc2h64hwf2ibtbrnjipilsnhk4u@w7645stdorq7>
Content-Language: en-US
In-Reply-To: <h2clkcgpr4uki3fq3kbdutsqc2h64hwf2ibtbrnjipilsnhk4u@w7645stdorq7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04c92f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Aj1sxsqqlx8X5QhbYpsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ixUKxq7oP5Oc27uo3vgLXjByP2IZi__o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX3qIueVLtA1ol
 9BwVfmf0gCEg0oNhZVpsTJRivs6BOtQYRDIdMLxbmPVvZSOwGu1YtCCi/Dd95vJju4a70WoYr/R
 u2ltWf7RTtMnqX+WGLaj+HwbczKL9nQcfAyKmeCusEnZqAbfdfm5hwl8Awzl4/vMmhidPsp+FNZ
 55O7GcvgSzIB+uflITMjZoY8U7omDGaRGu9efNqtcFE7AbSXLxPSRRx/MS59RE4+4TtpR4792gr
 XnPJDM/ddK5+R8ysOXx4tPnjJpmrFQ6OZqX79BB7AWcR/MOa29M3LN9AsH29mmII9ReLS5e4hvA
 k3jJi1ltsx0KhMOQ21khCegSh2G7zryBxv324sSHGyEPwA9gVyvYJwr7kBFA3QFhy94UE+d6cUf
 ZPDWDRRyPDJavgOfUnrs8+zBx4G2OeuQoZWbb4KoOtcA4Wtui85A0cJmT42AQQ9MmXc3/tlb3oF
 7VO2A4FEbo4VsM6W+QQ==
X-Proofpoint-ORIG-GUID: ixUKxq7oP5Oc27uo3vgLXjByP2IZi__o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130187
X-Rspamd-Queue-Id: 668DA5399AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107445-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 7:19 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 09:42:01PM +0530, Vishnu Reddy wrote:
>> On 5/9/2026 2:24 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:59AM +0530, Vishnu Reddy wrote:
>>>> Glymur has a secondary video codec core (vcodec1), equivalent to the
>>>> primary core (vcodec0), but with independent power domains, clocks,
>>>> and reset lines. Reuse the existing code wherever possible and add
>>>> power sequence for vcodec1.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>>>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 141 ++++++++++++++++++++-
>>>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>>>  4 files changed, 154 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index 7d59e6364e9d..8995136ad29e 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -61,6 +61,9 @@ enum platform_clk_type {
>>>>  	IRIS_VPP0_HW_CLK,
>>>>  	IRIS_VPP1_HW_CLK,
>>>>  	IRIS_APV_HW_CLK,
>>>> +	IRIS_AXI_VCODEC1_CLK,
>>>> +	IRIS_VCODEC1_CLK,
>>>> +	IRIS_VCODEC1_FREERUN_CLK,
>>> I think I have asked the same question while reviewing some other code.
>>> When seeing such enums my expectation would be that the set of clocks is
>>> more or less generic, while the platform specifics should be
>>> encapsulated in platform-specific code. Instead these lists keep on
>>> growing to accomodate platform details.
>>>
>>> Can we stop that tradition? Adding a peculiarity of the platform should
>>> not require touching of the generic code.
>>>
>>>>  };
>>>>  
>>>>  struct platform_clk_data {
>>>> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
>>>>  	IRIS_VPP0_HW_POWER_DOMAIN,
>>>>  	IRIS_VPP1_HW_POWER_DOMAIN,
>>>>  	IRIS_APV_HW_POWER_DOMAIN,
>>>> +	IRIS_VCODEC1_POWER_DOMAIN,
>>>>  };
>>>>  
>>>>  struct platform_pd_data {
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>>> index 13fbb21c2182..ff90c375e805 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>>> @@ -22,9 +22,19 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>>>>  	u32 value, pwr_status;
>>>>  
>>>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>>>> -	pwr_status = value & BIT(1);
>>>> +	pwr_status = value & VCODEC0_POWER_STATUS;
>>>>  
>>>> -	return pwr_status ? false : true;
>>>> +	return !pwr_status;
>>>> +}
>>>> +
>>>> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
>>>> +{
>>>> +	u32 value, pwr_status;
>>>> +
>>>> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>>>> +	pwr_status = value & VCODEC1_POWER_STATUS;
>>>> +
>>>> +	return !pwr_status;
>>> Add core as an argument to the function instead of c&p'ing it.
>> Ack, will pass the vcodecx_power_status bit to this function.
> u32 core, please.

core is already used as a struct iris_core * pointer in this function. I'll
use a different name like pwr_status_bit for the u32 argument instead.

>>>>  }
>>>>  
>>>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>>> @@ -254,6 +264,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>>>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>>>  }
>>>>  
>>>> +static int iris_vpu36_power_on_hw1(struct iris_core *core)
>>> Hmmm... And if 3.7 gets 4 cores, will we have 4 copies of the function?
>> As of now, none of the near upcoming targets introduce a significantly higher
>> number of cores. If that changes in the future, we can revisit and optimize it
>> then.
> Okay....
>

