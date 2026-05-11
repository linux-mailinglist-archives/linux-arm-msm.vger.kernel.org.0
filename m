Return-Path: <linux-arm-msm+bounces-106967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAr2FZEFAmo3nQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:36:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 509585124F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03DA4303F081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D928835F5E1;
	Mon, 11 May 2026 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5PhapsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGuib/fE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA93D301B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515937; cv=none; b=adsNM19gmmaDjK1qK5i5u2DV1TkQLH1u064fbatYT930qhqOY8skQhZXkDNPNDuzagBonsAPGUes8rbzIF5sG+c8VuimTpCPitUz4oWvpe8C904AF09CAkIODpHplqYvSvavi27cXrj0uucalsRQNuQ3i6Y0uh6N5WxYDScU2Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515937; c=relaxed/simple;
	bh=XSyKF+TTyJA2FxSDi/562C2tGL28+vNYmdnWMwoVRj4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OpZbKRcILP8qm9E+jt/RvDV4WnARD2AjeUAdhNl18AmjtWv8XfO3l/a9mtT+EGbRkK0w7p6y/BgU0ybA9yeouET0eRkcTEgfxqLIAnFqHBVJI6AJejMvN3uxd81130F3v4F2/TibYGZUycD0ROfu8dG3AKRSFsAwsYM5S3UeU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5PhapsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGuib/fE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BDG0og453236
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bQ1uOY0G1kkuHO8Jn/3OlwXnnf2PYvGcudQO7cwuFjg=; b=B5PhapsUP6cpzv0i
	2NKupFdzbgp864AOGJj4SyinIzdCXX0lORktUqw7L1Ncqhi0k0Q0ZKIVqUq5arWK
	zXUx21ys2j67y/FBh+KmMcUQh6jYqfpemPFqcG5BzFCdwfrXCoRl7Kpw+ksDUJUE
	xPY4a9oRKHiHfxGyiNaBLFvaLU39bt8xeqYboniYgzajlcg1vuaeEYSF8SRWyWBX
	MTMoor94Xdk6IFJ7ToB5P7naHFwFvGeC8sawGC3qvV6s3nZfYibEWRoJVu2RkIKP
	kcNY8smWmVXuNi7oeifH5GNYpsqZOPvD2LukBxHmGh6dNPSOGfMMFixWoZnHculz
	smbtTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag6j4f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:12:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so80444195ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778515933; x=1779120733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQ1uOY0G1kkuHO8Jn/3OlwXnnf2PYvGcudQO7cwuFjg=;
        b=iGuib/fEFoGyRFg8XPSICb3kdx2PsVBewNiuyCTb22MIP5UP6mPpP5z2Au2BWYygYT
         kaLR7VyFZ9rqMVeqf1O/DlZCDNBAlannF5/Ghe6KVVL73B/3uw8GE8To1/Jyx7Ckv8dl
         o5L5pr4q2B1+5C4FGuQmCeF9sdPXkZlrxhW4ADpn76Ly4v4pbnmGiDCXUePU9xHw7hmB
         KHyZu/KnJcWXsxvZ/vefmfArTn4pspQGUhgeedFpnqxQYVLMfctSmfd8konp2V7ulZXy
         MH62BjnxSgiZ6TNnETFpArwqyehCFpM7yjZll7WWWCHHPG72yUuYtYKI3Yb+BLhXX/uw
         w1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515933; x=1779120733;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ1uOY0G1kkuHO8Jn/3OlwXnnf2PYvGcudQO7cwuFjg=;
        b=W9TbFXQAcRPUmrweOLYwvdcynLCkiqLJg4MzY0TtrhH8897h+7h+KQqk9+nyFnq366
         FANHCSr2/QgB3u+8AjDbn9UNgZYRUj5uaUTZgUWqFH9m6uwhVbSkC6mH3dPKF7qNfzYZ
         CaNrzdGUB+HK9u2uUZuhccnos5vL2jr3ea5deRkvavRep0A28I5qvFTcdv5pHf8QYLs4
         XuhO1si+JmE5sVbc+5AdQZ7miY4f62ho88WXN+vXr4/OmirVYy7MIuwN/ZfofV1y9BON
         Pvu2ff+E8tJGGmDmIdYa/Qu6jek1freG0nP9HMMPT+d6Enq/HuGzAJ2h/1vC1yUQXi22
         atnw==
X-Forwarded-Encrypted: i=1; AFNElJ9Og50NT2m2F4wmp4xCN+ugdsb2c5YdlgSq3naC1xqwT6nJ+jUAYReoUSxMRQDGHTr143iYYzGKBQm4Vcr/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4k/AG/9HGjeD5P3EITSTsd5neXnGn39TU2iK7Q3V74b6lVO6/
	9ALEeB7QOm1FTlyfk3kU69gXI/eXnvY+AKNwXlTyUY54utL+XjRuPunnjMeV3V8uryJIfPAetx3
	FgL6iyKd/5yz0Fv7FXm+Z+m+IKh6NeSHbXFMUDJNvlBVKcw1EDIFKu+1K7GQPH6ejW3mZErxyux
	Cp
X-Gm-Gg: Acq92OH4jdAlmMIous0pTfGbCzp1pbb2mN0X1tcYvjDR4eBQX3ncIhTUkWTC66pB8yY
	27m1SbryQluZt1It7Ow5gAsOPUHm0wi/c8IOp7ECZDPVRCQYR4BBo03EA14qaQu/2fh1qMtOT++
	bJP41Nxin1lJpJ67jTumKfW3EaqjeP/1vBL55UZtdLNqycKCIT2GAsLWhdivz7fZ1vqPlOZ/6Nv
	ENYG7QOhSwxAy3M5ocfVEuAG/gbI9GZJbwgzzMAdtaKOelDf3tg79z3soCP2FMSZ8/4wWEH5GAr
	lOZgqM9neQC/3p6NZY8iopAo7b+1zBInBCuQdEx7FYEEmRY2yN+PebFs26MkzU7FRFvEpUZEqFd
	geLQV8eMR5feYCbFEHDNln3NvtH7gTqsz8w7y8B7RwSVTSYLTkN3XI2LspsysZv1p
X-Received: by 2002:a17:903:947:b0:2b4:5f19:1d34 with SMTP id d9443c01a7336-2ba798b629amr267633115ad.17.1778515932475;
        Mon, 11 May 2026 09:12:12 -0700 (PDT)
X-Received: by 2002:a17:903:947:b0:2b4:5f19:1d34 with SMTP id d9443c01a7336-2ba798b629amr267632495ad.17.1778515931864;
        Mon, 11 May 2026 09:12:11 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm109901985ad.25.2026.05.11.09.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 09:12:11 -0700 (PDT)
Message-ID: <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
Date: Mon, 11 May 2026 21:42:01 +0530
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
Content-Language: en-US
In-Reply-To: <jqe3ilzqzajuf67hvp7nw6mak36qyqu6dz2oiwtkf6zwiyclln@ydtyd7vkudm4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOsJG5ae c=1 sm=1 tr=0 ts=6a01ffde cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cQ-hqyt-I-3aP16jzQMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE3NCBTYWx0ZWRfX4BcKpFYOkGpG
 FR78QJgm2FmSkEk8vFLspTMW+LbQh/QGTAj9W0HAvRMQ4lLgAi+CY+e7Aer6vsr3iyozs/uQN18
 ClY0IMG1pAd6OfFLH6UzAYobz6g7YtmdBZHNtT2ozy0Pv8sdGcVhwlsk3aAKzPMJhU14pSTpmSn
 ubIdEHDTY90RbTs+08HyHcDowiL8n3ZEh+agGSdap21d7K4BvEMBl6xUVoYr8z6BAO1BW9oYW9i
 1mDdyY/5E81IoMKvVsRvJHhM+4kPeHERZko0mJ3FM5IIYebrSPkwTw9qCUKhkTXQVbzy4MptGFw
 Yrye93UbRUdkGlZWi5pCzqzjEuzlnMncdIS+vJ8dcYc1Lw4c/8TK4nG892jnti+0Q/5dy5kYNYI
 SUUpb4GkYBQOSmh0dUsYOjkGyjg+bqex68YfBL8FM28MkJx1jdFcX6I3SLafEXH/Szh1YEk3d9b
 BW/g+gBd3DVeCC9PAXQ==
X-Proofpoint-GUID: WSs3I5jQFVtlw-YD-3PmzvWhdrI_Feme
X-Proofpoint-ORIG-GUID: WSs3I5jQFVtlw-YD-3PmzvWhdrI_Feme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110174
X-Rspamd-Queue-Id: 509585124F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106967-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/9/2026 2:24 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:59AM +0530, Vishnu Reddy wrote:
>> Glymur has a secondary video codec core (vcodec1), equivalent to the
>> primary core (vcodec0), but with independent power domains, clocks,
>> and reset lines. Reuse the existing code wherever possible and add
>> power sequence for vcodec1.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 141 ++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>  4 files changed, 154 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 7d59e6364e9d..8995136ad29e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -61,6 +61,9 @@ enum platform_clk_type {
>>  	IRIS_VPP0_HW_CLK,
>>  	IRIS_VPP1_HW_CLK,
>>  	IRIS_APV_HW_CLK,
>> +	IRIS_AXI_VCODEC1_CLK,
>> +	IRIS_VCODEC1_CLK,
>> +	IRIS_VCODEC1_FREERUN_CLK,
> I think I have asked the same question while reviewing some other code.
> When seeing such enums my expectation would be that the set of clocks is
> more or less generic, while the platform specifics should be
> encapsulated in platform-specific code. Instead these lists keep on
> growing to accomodate platform details.
>
> Can we stop that tradition? Adding a peculiarity of the platform should
> not require touching of the generic code.
>
>>  };
>>  
>>  struct platform_clk_data {
>> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
>>  	IRIS_VPP0_HW_POWER_DOMAIN,
>>  	IRIS_VPP1_HW_POWER_DOMAIN,
>>  	IRIS_APV_HW_POWER_DOMAIN,
>> +	IRIS_VCODEC1_POWER_DOMAIN,
>>  };
>>  
>>  struct platform_pd_data {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 13fbb21c2182..ff90c375e805 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -22,9 +22,19 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>>  	u32 value, pwr_status;
>>  
>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> -	pwr_status = value & BIT(1);
>> +	pwr_status = value & VCODEC0_POWER_STATUS;
>>  
>> -	return pwr_status ? false : true;
>> +	return !pwr_status;
>> +}
>> +
>> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
>> +{
>> +	u32 value, pwr_status;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> +	pwr_status = value & VCODEC1_POWER_STATUS;
>> +
>> +	return !pwr_status;
> Add core as an argument to the function instead of c&p'ing it.

Ack, will pass the vcodecx_power_status bit to this function.

>>  }
>>  
>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>> @@ -254,6 +264,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>  }
>>  
>> +static int iris_vpu36_power_on_hw1(struct iris_core *core)
> Hmmm... And if 3.7 gets 4 cores, will we have 4 copies of the function?

As of now, none of the near upcoming targets introduce a significantly higher
number of cores. If that changes in the future, we can revisit and optimize it
then.

>> +{
>> +	int ret;
>> +
>> +	ret = iris_enable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC1_CLK);
>> +	if (ret)
>> +		goto err_disable_hw1_power;
>> +
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_FREERUN_CLK);
>> +	if (ret)
>> +		goto err_disable_axi1_clk;
>> +
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_CLK);
>> +	if (ret)
>> +		goto err_disable_hw1_free_clk;
>> +
>> +	return 0;
>> +
>> +err_disable_hw1_free_clk:
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
>> +err_disable_axi1_clk:
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
>> +err_disable_hw1_power:
>> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
>> +
>> +	return ret;
>> +}
>> +
>> +static int iris_vpu36_power_on_hw(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	ret = iris_vpu35_power_on_hw(core);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_vpu36_power_on_hw1(core);
>> +	if (ret)
>> +		goto err_power_off_hw;
>> +
>> +	return 0;
>> +
>> +err_power_off_hw:
>> +	iris_vpu35_power_off_hw(core);
>> +
>> +	return ret;
>> +}
>> +
>> +static void iris_vpu36_power_off_hw1(struct iris_core *core)
>> +{
>> +	u32 value, i;
>> +	int ret;
>> +
>> +	if (iris_vpu36_hw1_power_collapsed(core))
>> +		goto disable_power;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +	if (value)
>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>> +		ret = readl_poll_timeout(core->reg_base + VCODEC1_SS_IDLE_STATUSN + 4 * i,
>> +					 value, value & DMA_NOC_IDLE, 2000, 20000);
>> +		if (ret)
>> +			goto disable_power;
>> +	}
>> +
>> +	writel(REQ_VCODEC1_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>> +				 value, value & NOC_LPI_VCODEC1_STATUS_DONE, 2000, 20000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	writel(VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base +
>> +	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +
>> +disable_power:
>> +	iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, false);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
>> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
>> +}
>> +
>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>> +{
>> +	iris_vpu35_power_off_hw(core);
>> +	iris_vpu36_power_off_hw1(core);
>> +}
>> +
>> +static int iris_vpu36_set_hwmode(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, true);
>> +	if (ret)
>> +		goto error_disable_vcodec_hwmode;
>> +
>> +	return 0;
>> +
>> +error_disable_vcodec_hwmode:
>> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
>> +
>> +	return ret;
>> +}
>> +
>>  const struct vpu_ops iris_vpu3_ops = {
>>  	.power_off_hw = iris_vpu3_power_off_hardware,
>>  	.power_on_hw = iris_vpu_power_on_hw,
>> @@ -281,3 +409,12 @@ const struct vpu_ops iris_vpu35_ops = {
>>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>>  	.set_hwmode = iris_vpu_set_hwmode,
>>  };
>> +
>> +const struct vpu_ops iris_vpu36_ops = {
>> +	.power_off_hw = iris_vpu36_power_off_hw,
>> +	.power_on_hw = iris_vpu36_power_on_hw,
>> +	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
>> +	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
>> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +	.set_hwmode = iris_vpu36_set_hwmode,
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> index dee3b1349c5e..bee8ae9b4308 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> @@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
>>  extern const struct vpu_ops iris_vpu3_ops;
>>  extern const struct vpu_ops iris_vpu33_ops;
>>  extern const struct vpu_ops iris_vpu35_ops;
>> +extern const struct vpu_ops iris_vpu36_ops;
>>  extern const struct vpu_ops iris_vpu4x_ops;
>>  
>>  struct vpu_ops {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> index 72168b9ffa73..e67d98b8c91e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> @@ -7,6 +7,7 @@
>>  #define __IRIS_VPU_REGISTER_DEFINES_H__
>>  
>>  #define VCODEC_BASE_OFFS			0x00000000
>> +#define VCODEC1_BASE_OFFS			0x00040000
>>  #define AON_MVP_NOC_RESET			0x0001F000
>>  #define CPU_BASE_OFFS				0x000A0000
>>  #define WRAPPER_BASE_OFFS			0x000B0000
>> @@ -14,6 +15,8 @@
>>  #define AON_BASE_OFFS				0x000E0000
>>  
>>  #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>> +#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
>> +#define DMA_NOC_IDLE				BIT(22)
>>  
>>  #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>> @@ -35,6 +38,8 @@
>>  #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>>  #define CORE_BRIDGE_SW_RESET			BIT(0)
>>  #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>> +#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
>> +#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
>>  
>>  #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>>  #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
>> @@ -52,14 +57,19 @@
>>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>>  #define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>>  
>>  #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>>  #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
>>  #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
>>  #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
>> +#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
>>  
>>  #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
>> +#define VCODEC0_POWER_STATUS			BIT(1)
>> +#define VCODEC1_POWER_STATUS			BIT(4)
>> +
>>  #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>>  #define CORE_CLK_RUN				0x0
>>  
>>
>> -- 
>> 2.34.1
>>

