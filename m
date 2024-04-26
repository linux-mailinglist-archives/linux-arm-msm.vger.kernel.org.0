Return-Path: <linux-arm-msm+bounces-18703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3188B4100
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 23:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BC701F229A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 21:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5461C2C6B6;
	Fri, 26 Apr 2024 21:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RsfSLYYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823413AF2;
	Fri, 26 Apr 2024 21:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714165258; cv=none; b=AkzUi609pxLzAPJrqdEjpfJzRLCN5DV6DtZvTthJm9744R4HUd2Hky37Pe7e48kMWUFs/a1GrIb/IXQFKXcgFRq6MA6FOtGK2mz+oBSINoyoqbfc7awp7PlyK1Isn8HXL5ETprPPEk9JLF5MFRusIP+osdfdlfOAmZGddpLMghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714165258; c=relaxed/simple;
	bh=mwSxNS9IpFYm9lsRcWPCEkhA6/1tVhB4aTwJA4yZrlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mRkTw39FkBCosnaOSJRNmQFAqz9k+bCw2T/eaovQXpjHXDg/c+ujPD3dpLpeGoIkx6CCdj9n17eEfYV3byJzyf1QtnX7wO4M6nxOxdkE8RNcZUUdC6lZyu7pQEHrFXQNN6eZ6FyZHR3CCxOUfrQ+xGAXc3z0NBNaosP+qt+9ttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RsfSLYYG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QKML9B021126;
	Fri, 26 Apr 2024 21:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=r3QWDsY0sowI3c7HT1MO1IE1glGpHpow1jTLtMYno5M=; b=Rs
	fSLYYGDP5YHGopAc2+99PuyG16N/BeRZR4CJlkRGwvn+oeFbWmjL2LfS65jCiAM7
	2zodOonsmUxlG/cPLTQEtKJPrR4BWfIfDUcM+eubbvoL7c6mNG52TFq1jm3ZFR4v
	ndNROizvJHp+Yj2rT2JKGDWJVq/V65168AfpFfRjjw6Bo9eCOJxeJSmy5sXJ4p2v
	ZA18wUUuOyai88TOQgni6IGfVtiqcYqnwt8u2kPp7h2I07vQUUIuz9DjiZk2zhpO
	iZ8vRXaEOZtskUVMtAZ6lerX+lvgZHMq6IsXNEMf154pd1/djCh4Ey8x8D4973Fn
	+zFds0zkRltnr+qTt+7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xranmh950-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 21:00:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43QL0lgq029595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 21:00:47 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Apr
 2024 14:00:46 -0700
Message-ID: <7e77dd40-40e0-1a65-cf80-5e9ba6f584cd@quicinc.com>
Date: Fri, 26 Apr 2024 15:00:45 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Bryan O Donoghue <bryan.odonoghue@linaro.org>
CC: MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk
	<linux-clk@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7am_C2BM20Yvd82Ah_QRc5A9RFutyvY9
X-Proofpoint-ORIG-GUID: 7am_C2BM20Yvd82Ah_QRc5A9RFutyvY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_18,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1011
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404260147

On 4/25/2024 9:07 AM, Marc Gonzalez wrote:
> Right now, msm8998 video decoder (venus) is non-functional:
> 
> $ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
>   (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
> [ffmpeg/video] vp9_v4l2m2m: output VIDIOC_REQBUFS failed: Connection timed out
> [ffmpeg/video] vp9_v4l2m2m: no v4l2 output context's buffers
> [ffmpeg/video] vp9_v4l2m2m: can't configure decoder
> Could not open codec.
> Software decoding fallback is disabled.
> Exiting... (Quit)
> 
> Bryan O'Donoghue suggested the proper fix:
> - Set required register offsets in venus GDSC structs.
> - Set HW_CTRL flag.
> 
> $ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
>   (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> ...
> Using hardware decoding (v4l2m2m-copy).
> VO: [null] 854x480 nv12
> Exiting... (End of file)
> real	0m3.315s
> user	0m1.277s
> sys	0m0.453s
> 
> NOTES:
> 
> GDSC = Globally Distributed Switch Controller
> 
> Use same code as mmcc-msm8996 with:
> s/venus_gdsc/video_top_gdsc/
> s/venus_core0_gdsc/video_subcore0_gdsc/
> s/venus_core1_gdsc/video_subcore1_gdsc/
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h
> 
> 0x1024 = MMSS_VIDEO GDSCR (undocumented)
> 0x1028 = MMSS_VIDEO_CORE_CBCR
> 0x1030 = MMSS_VIDEO_AHB_CBCR
> 0x1034 = MMSS_VIDEO_AXI_CBCR
> 0x1038 = MMSS_VIDEO_MAXI_CBCR
> 0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
> 0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
> 0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
> 0x104c = MMSS_VIDEO_SUBCORE1_CBCR
> 
> Fixes: d14b15b5931c2b ("clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>


Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

