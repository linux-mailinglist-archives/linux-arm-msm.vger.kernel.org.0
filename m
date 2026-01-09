Return-Path: <linux-arm-msm+bounces-88228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4454ED08160
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B510C300F5A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A786331213;
	Fri,  9 Jan 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxQnQQuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4mdZVHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CCE358D0B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949596; cv=none; b=fLV4KsLopw6IPuuY/+IgoD4JI/19gqSZAZow+XQuY4AQoasFsArgsf7baOob4XA6Qrd/qVi6YVwDwpR2G1VHoyWsKyI5NhsXQzGv/3BtJ4MmXM/gYVRTY161scL1WRvk2T5S6IC8WOu9GLhX57dFloqYGMJwmwTh01oU65/LmI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949596; c=relaxed/simple;
	bh=fWqgP7eSi1KUIjxhrWcDi21Hb4l2pDe5rmdIVAWgWPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGloaWfKQ5KoqBJyFhTwdzWcUqSsw0wBONdxDXs1kFfgHqVyLsvMen8Em7YzPdt0KCc2bWZeLfgiOjfvbwgvqt3BPi62BNUqv3HZgcfe+BXAMeVFVAasBzwH7vxZ3GDQyFAp2o4UR1IKWfgt9CijRaWSd/RSteg39TrRiCChvcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxQnQQuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4mdZVHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095SCCV1701852
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=; b=MxQnQQuoXitKlChq
	l6q7BSifxiV8rH5QEvjeFOrhempCtgTZ+u7ooGB/UhvHfgEfbqxdC6yxub6E8Or0
	yVjrRcxF+ffMhmOKd4z+ERj0g0kpPitgJGPsk4mgbqKegMyM1uZaCrGjOsEUhx9k
	KhAfUKLGpS94BXJzfEpLTJErc9b/8oNC+3uGpoysoODh+lj/154yHOSRdmZsfHx2
	iHCPpriFcXjxgVFZR3/vaaYFbcAAJ35tWqMWLuvQR8itwMbWK1O/lxxHrM2EvN1M
	8CwtGZq9JJp9N4yrgFwZsRcEj3zLAZpE1aNmEC2ah5L7RqMez9ND+vsQHRjh7o4B
	LSb6iA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaaqhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:06:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bbb6031cfdso119249985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949593; x=1768554393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
        b=G4mdZVHz1sph11p9Q4jbviw6W+84YIc3A2OUy1stUPTsSkxeU9wsywmrL8LAQI45yl
         bF90n4M/90DHMkqBlC7CaUdvkZ5P/689ajm9BYMjVqCkWVGW2bE6N3gS879ZYTSc5MQi
         A0lR6PSQ+Jx1PtGmICJuIg3aGZQJ5LW/tP9n/WCqN6+/hBFJv4E5fmiDH3PvCzk1aAIE
         T7opjhsVrcwSC5IZw7ZwwzmtnBl52X+MBgnd1nF/1r42aeuXWfKrjxfYLBWYd5orBDLB
         1shx9ISBiq0p3ji9bex46MbGQjngG/zbizzD1adrBeyHFF5FLhIMROkHZcxBAy8izomt
         qK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949593; x=1768554393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
        b=pRF2ixG/s0DS7DZlCaN8yaimGhwQTb0MLSsGF4UsO0/T3WU4vLMSNALm+BXyv9fOIK
         gKYIkzk/ih6531dEopLLKXWZUXZEKGYKgvf2clj6NQS4GHQYNms8jUafWLIi4U1HwS6T
         snYS1aqK3Dve40BAKu5CpdVrZ5jo+NO687gMB+/Aprxe5wohpb3Iis7rHvvuALjp7a0J
         YmZ3crQw1Vu48IxVZx12e9UK1imKM3t++0LI/r++1BH+/GJ8/mDCewdE5XmHJyvMzk1n
         MlC/jlW31B7jzPSPAwKQDt5NdJ7I516hCULO9V0lrB793KKHuELhwr5gdqIquROX7wBj
         9tIg==
X-Gm-Message-State: AOJu0Yw2zctxs5bzG5RnrByjVCxsa0LPHanqomSjTY8hr4RY0RHGwvXd
	NxPqaNXCWSSPCUsEH6fNt151oNb+VHns/SbPPJZneZ6AxFK6Ml579SDJhpZFsIJgyF24XY2CIWa
	ds9HIqlmDqCG/2U7aahV/0gTAdqvEDGwK/1a0lFFmQeVTVTYlSOkxdnIvJiPT6nJWLTow
X-Gm-Gg: AY/fxX6AAlAyVr2h8K/WY07vUHwhpBXskihFn6rdo/Wjly4hQo+91IFF3F2znNhak+S
	PhRCS55x2wCWDyAfBERJU2fsO6YPcbvsq1BeUY7FZo9jsWGHm0+iLZoNM/jdh8R4TMqae2kx9yT
	PsHj9HKnZdKmDwwBZkneAasLD3dZOjLo7T3uj7FaL2qZgLAe/qEk8sozX+dmYQY5xFOJYJlu9Xy
	LYxnLsOEj2C2IO7SwtqSrr1fk5nHsecymJqm7oL7rPR5+WCzm2O2SrXXpfKFMEW+STFoKUvCnkj
	5CQI5HAUdnkyQNP6kqV/O1X9Jn5r/CAHBpyf8+5ZQDteNFflBJMGMN1BHp90shfO8ro+z+dfVBm
	tYqpFvydHvswc1MZJqsyne2CsZ6Kg9SBIjhuO6+0g2gFWB0sKQXg30IeBAq8INPqeyUo=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr885987185a.10.1767949593058;
        Fri, 09 Jan 2026 01:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNhlqG1qVA0WeSBPAv41iXJojsZ0EgDiNOaWVzG9AckeDmRxc+YXyNI/94n7ZKvJNWAxmdPQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr885984385a.10.1767949592559;
        Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4479sm9806221a12.1.2026.01.09.01.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Message-ID: <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960c519 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=xIqhFIF2P0JOsuq1WLcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vk0s4fBEwfh7_JKR6rMu0Tfn4c1W1ujP
X-Proofpoint-GUID: vk0s4fBEwfh7_JKR6rMu0Tfn4c1W1ujP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX3c7I5DbnkYZk
 LH59YtkDIjKoaTjjzI9IbBsdWDIhQINfHB6eXkdPskmpantshFSkrCz4NyIMeXA/WRStqBXPqvx
 8C52Tt3qre2ULjNPhsIANNKisOuANS1iE0CfNI6s0gcu/tNiI9Cn7p/AqLCmg5yiJt6GCWr/EzZ
 vx0e8bmjv2xpF4lT2dl2Wy/RiZJIgveXRfsaUn6TwHtLcFNabM8xluDRQ8WPgoxSyc+zIMeQRJs
 m8ir0zam+ZvNbpm0VvEAtdCDa+C/tN9vfRODxwaZ05THKW9I7PWQGZAqhAqOe1MIyGD2Q7p4oLe
 9EYQgnMccHmKJNU4FOEySAhoRCQPFaCt/iOlp92pPECCHfDlKdR4DXagsdEX4NLHCY/P2yvtxOQ
 GSMa61vLFipBZXxpxzOn+P+12nF/ftXkFY3hMVXhOf1rD8ZhVAtB0v7d85IQW3o6mW+mmaYYiDG
 UjJpQqDnUQDWx5ImCAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090064

On 1/9/26 12:29 AM, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> The zero division happens if the else branch in the first if statement
> in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> zero and it is not possible for LLVM to eliminate the else branch since
> rate is still not known after inlining into msm_dp_ctrl_on_stream().
> Change pixel_div to one to make the division well defined in the
> presence of an unsupported rate, relying on the DRM_ERROR print to
> indicate the error to the user.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cbcc7c2f0ffc..e4731c059ed8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  			       bool is_ycbcr_420)
>  {
>  	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
>  	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>  	u32 const link_rate_hbr2 = 540000;
>  	u32 const link_rate_hbr3 = 810000;
> 
> ---
> base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
> change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18

Dmitry, would it be beneficial to throw an actual error when the rate is
is mangled? i.e.

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index aa2303d0e148..4f710b8e6bc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
        return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
-                              u32 rate, u32 stream_rate_khz,
-                              bool is_ycbcr_420)
+static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+                                 u32 rate, u32 stream_rate_khz,
+                                 bool is_ycbcr_420)
 {
        u32 pixel_m, pixel_n;
        u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
@@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        u32 const link_rate_hbr3 = 810000;
        unsigned long den, num;
 
-       if (rate == link_rate_hbr3)
+       switch (rate) {
+       case link_rate_hbr3:
                pixel_div = 6;
-       else if (rate == 162000 || rate == 270000)
-               pixel_div = 2;
-       else if (rate == link_rate_hbr2)
+               break;
+       case link_rate_hbr2:
                pixel_div = 4;
-       else
+               break;
+       case 270000:
+       case 162000:
+               pixel_div = 2;
+               break;
+       default:
                DRM_ERROR("Invalid pixel mux divider\n");
+               return -EINVAL;
+       }
 
        dispcc_input_rate = (rate * 10) / pixel_div;
 
@@ -2458,6 +2465,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+
+       return 0;
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2525,10 +2534,11 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
        msm_dp_ctrl_configure_source_params(ctrl);
 
-       msm_dp_ctrl_config_msa(ctrl,
-               ctrl->link->link_params.rate,
-               pixel_rate_orig,
-               ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       ret = msm_dp_ctrl_config_msa(ctrl, ctrl->link->link_params.rate,
+                                    pixel_rate_orig,
+                                    ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       if (ret)
+               return ret;
 
        msm_dp_panel_clear_dsc_dto(ctrl->panel);
 


Konrad

