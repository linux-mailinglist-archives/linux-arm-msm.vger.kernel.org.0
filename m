Return-Path: <linux-arm-msm+bounces-103096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAaCKN8O3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:54:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9A3F8482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CC2230CAE73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724EE3B95F0;
	Tue, 14 Apr 2026 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN4fs6if";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYqI8wFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7B3C13F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160155; cv=none; b=piagaZykT3W2vjEgMJKHxR0JTONXCacB6/5lD16r0pk6IAjk3YDkIh/4ICSnpeRZ0cXa9r37rzQiTumyD0B/K9tTaTX8h12QWfmyrkElqonwYhfRZdvQZPC8Tc7FgUk3Tiq9n3nf703fHFjXZldIPuDJCltyIKWO3X3YXH6kYew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160155; c=relaxed/simple;
	bh=wuR5JFSajf2hkwoeFulviUjvuO08ypSrDi52MURLwgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUQzePk9Mpd9fV+rBKdBfVfk8jZ4eayk/3w2kY/xT43LOMonQ4S3YthUJDQecu6vD2ebc80dMy8uPYaP4POvnVxWv3X3EGTSwAf+i4KzOj20N5QhmQBC8+zwUQW0J6nODF9ZCVijtBN37e3R4iFifjZNBrYaW+3LuEid3+xqjsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN4fs6if; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYqI8wFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6JA6W3425651
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=; b=RN4fs6ifLIv6rZsQ
	LoIAJ9rZxdiE/7u9kXiLMwxNmB8F9sODkK7wI2G4oqj2x1OV3Wueyi0HK4G42Y90
	NlKQEgtRFwCKpgCpcBngKB8OKBWlMVSStt+eEBfIrf8JRJ0KQuy7cdTNTonGNi2g
	f5tw7w6POQyJ3MyElq2NHQ1kJREiFhxeEv5JzYWg7bGXC2NZ5JMpJWVdIcDYVzxS
	/+RVVjJ/Jz2XW//wVq0ghOvm7DDFWE8HFNUpbvcv+L1s3FcwAIs+1iBcx8vrXp7A
	o1dGqWtY6BATjb8Xzu1bxudEsBJr7OecdfZzU7FU0NwUgTwSbgJ5kYfYn1jFLdEg
	EyoQXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fa5sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:49:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca2eeac85so10423846d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160152; x=1776764952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=;
        b=hYqI8wFTAGRnhFyT5BrIw0KD5RJkqexSv2BzxJwlGc8HVw9mM+Oi/OBodtV7YZT497
         4tk558HQFE5huHFdAOAB4/asGqD8/6JmAmY8cJJl+Tuf2CbKGmcoKierQlaOlR3LUb4D
         SaHHyfG0TyFyBBdd8u/OEJeCRZUmmCVy2Sxi/PPyZmRdhpnn2JDhRlJgImBsSpXYDDIU
         aIzhAl1w63OnX2fioEifhfCII+V2uylFuvcq2f+v94jIZCuVLbSW9KRel83YX5LJitoY
         Kl/Ta+CqhSh1OJYFaUHW+DrD827At5Jx65hXd0NMXwu5cwbn+UI68yM2STGY/UVzAnZU
         /ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160152; x=1776764952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=;
        b=TMikPVey2Iqjz1da/9eOieN6OoIBsRM2yvIsVj9xH76Q+bIJFjJz5EgmdUKb6AxFNL
         QF0DGxQvjp3Kp38ITaMlYQM4sFsFVPcE7BHRGZ9WTKh2QD7ENUYU8SGolDiHhXbb6TwH
         imDn49AOLXgtJ4LSYJZkQom3YbLaf3hD1WflSar3IJjKwbrT1VjSfXo6/cUv8ja3nCiA
         CPhjwszXtWf2lvS83XF5cMClF310TMwYNWM0i7xn5JjnCrH2QKTAi6LxPEnGkuOgd1lf
         KwcUmeq01W7GhPC6uPH4vv85JUuTmva6zPhWrsUEgLLYFhrIRzaWMO9KXN/+6tFTkCSP
         Pftg==
X-Forwarded-Encrypted: i=1; AFNElJ/+65SIc7zAndV9VvInbzKE7PaMyay2wvgMbYGZXzpTzrAA/E4uSiwPmVyysIFzt6hKQN7/QamR+O9DKxgQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9tu6ucpGRhvathMnBhwJc4YDqAUMz0fpFUfzbvcE0G67CHuOP
	LP3CWbwRmkmU+VHugsEBfVM6dCHg+IuwV1IL+nsowWds5Uea0Ds4IWVNps6448sj3dg0wNMiS+X
	1MoP+r+DRw9d70NTqbMRuE/DAaSJZySihmCW+YEF/q7NAUrCcDMs96Wd4OuVNYVuTjzBa
X-Gm-Gg: AeBDiesCA3ak5IvZIVpox5ksw5VQvntTiskK4GInBEAixnQBEW+B5a+85bt9JdAM8Ps
	7vE9e90ddFr8oDcbkDT72A3u2liHobqvoPGMe9OsTROW8SbQuVdt3ogQyO9JuhnvVcJgMIzh5P+
	QeE6N7sC5m3rS97nOjvOX7l9sQ/ObsNut4hX7dtw0kv/eQC10VekRFhdunJz8nBwNqbH6ilPBB7
	rh6fOEW+fwa39U48ZyDzjXT9eaZjk4Se31AlnbK2IPpkOgcJhIXfEeghMnVpdO27KG6O7GRbEix
	cewMh2dh3Vgqm4GFFbOd9B+engr39OrXTwT6UT+j83Bv4Yrr6ADpavB3EzYDnWe/dTRx9XchIGs
	pQvWaTsCj494dpIadO61dPS+vGycTc/LhPoWo72MtDjRN9kmjH4xwXzd4/xqghSXZD523e9E8sz
	Zw6YD/4q+rgsH0Rw==
X-Received: by 2002:a05:6214:21ea:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ac85f82b45mr181121196d6.0.1776160151836;
        Tue, 14 Apr 2026 02:49:11 -0700 (PDT)
X-Received: by 2002:a05:6214:21ea:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ac85f82b45mr181121026d6.0.1776160151365;
        Tue, 14 Apr 2026 02:49:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a44sm386708566b.52.2026.04.14.02.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:49:10 -0700 (PDT)
Message-ID: <1de1a366-a325-428e-9dcc-1333bb85ed82@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:49:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: Add power sequence for Glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfX3FDfJqa/12US
 iOIfutEX2fJpCv5h0xFg2r5a0H6Z40AIZjhf363ypWm8vwRQR0Xd8S0o4a5EQa1RSizdOWutgxQ
 0DT9bkatlZNjeq4iFu8ztifNWsXX1mtZZExo2YOSfgODCU0ptA+1KVQHicE9sPB+T4wF+x3/qG4
 vyz+qSa2rtSSjSILvqnXqbvD+KikXZSdAJvORi8HraxTZOq6lvs4cQcsGVBvwqPijkEO0DJ9DVQ
 hF1iaPLvexkbSPLt64G5//U3vLAfPGBP75e2PywwnhevZOtb6Q/NBkFghDEp0CSEjlpvnkk5MXA
 b+zUfC3XY4i1SH8XBeIdBXsBQ9Q9pQAgmGdGzsgSvDFgsSc1ztxjwyNEaA0C8aMINMwPCptYYTI
 o4F3yvhrUliNx5P4nkKhQAwVdTCtzVkFg4NqC0NELVa3lvDkUXOeAsY7orJYGAEzfE0LhFrW2lA
 iw9+BkDKZw5ztt5ANPg==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de0d98 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wrwf7AeaGIUVrLbmntoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: bGX8ZyRWQ-D6d-tjmsa5D82Vzp0W2bkq
X-Proofpoint-ORIG-GUID: bGX8ZyRWQ-D6d-tjmsa5D82Vzp0W2bkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103096-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AF9A3F8482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Add power sequence hooks for controller, vcodec and vcodec1. reuse the
> existing code where ever is possible. add vcodec1 power on and off code
> separately which has different power domains and clocks.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   9 ++
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 123 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>  4 files changed, 140 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 30e9d4d288c6..e3c1aff770dd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -61,6 +61,9 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,
>  };
>  
>  struct platform_clk_data {
> @@ -208,6 +211,12 @@ enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
>  	IRIS_VCODEC_POWER_DOMAIN,
>  	IRIS_VPP0_HW_POWER_DOMAIN,
> +	/*
> +	 * On Glymur, vcodec1 power domain is at the same index in pd_devs[]
> +	 * as IRIS_VPP0_HW_POWER_DOMAIN. Alias it so that the Glymur power
> +	 * domain table is indexed correctly.
> +	 */
> +	IRIS_VCODEC1_POWER_DOMAIN = IRIS_VPP0_HW_POWER_DOMAIN,

This feels really fragile..

[...]

> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(4);
> +
> +	return pwr_status ? false : true;

return !pwr_status

Konrad

