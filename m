Return-Path: <linux-arm-msm+bounces-17340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 721828A3182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 16:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4CDEB24BF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110A814389D;
	Fri, 12 Apr 2024 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lV9Mid44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DD55C3E;
	Fri, 12 Apr 2024 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712933364; cv=none; b=APfWQNAArcxTHTDfvsFNCSRQePcxVPoF7Gt5TloxkJ1xtL9LzaK2oKvi5//pdZgc2hR9XhNk+lxRwjVAHpNanOB4LpeaEbheVtMxr/igIg9AZB6oS08cdHLcLOyhFZJdwKYgTuTYP8t3pv1F5Ge0+Dx+Al/SXMe5kti7sriWGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712933364; c=relaxed/simple;
	bh=VfyCjp9SYi22ZtLoSGO8b6l41+8emN2vMNAINPYpelM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qKjIDB6UkYsxms5REsAZSKpZKNy5gXLhOmjdbOxAdu9ZZZudtTzSpGFosZqGmlsLFcTF4e/ZSkHSzW5yT90BMHv6XNjXGLUwxJySSj1w67TcP9/uG/l6EG4jpOxBK9EkfqwGZjx7kyJULTIy6uaR723kN4eH49cwitRmjy7PmHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lV9Mid44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C73TGZ014138;
	Fri, 12 Apr 2024 14:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YuOigx7oeB4RyJSzO7hm2LaTFu+Zor8U1lcP+8PaPBs=; b=lV
	9Mid44BEPc8Fyjs+ze2kmQ4qAklRMnrGBpf3qJfqIvngBY0BT3tsSWR1m/2ZXYuG
	dZPdB+go0WojcsJJ7tdcP2Lr+LTFW16jzg9aIkjPq/aSdaWOaHkWojq6+E9ImObg
	1QZG7YoxiFFDexVwhuDYbUliGEIeLDuTfqRxigLv+LbBA9EweBIqbzf9CK4MF0w5
	2KUGpZcXjGGdJ2f3VBMKyGihm7ZZ+bkuNwCt2IzhdSDIOUshV1QQuJwzxKdFIScg
	NB8wvcRTNWpkyHLai8ubsmgKlvCgtELgWx2gMlS+K93OR2CuFZN870KLqPj9029f
	pQl3P5A2Bh6ti6EeMQSw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xf06pgvp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 14:49:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CEnFhB000390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 14:49:15 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 07:49:14 -0700
Message-ID: <2c82d551-91f6-8165-dc75-d6e81b9b8504@quicinc.com>
Date: Fri, 12 Apr 2024 08:49:13 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk
	<linux-clk@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>
References: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fPGY-k3eUc0mn3KakD1CAetIdzifN4k0
X-Proofpoint-GUID: fPGY-k3eUc0mn3KakD1CAetIdzifN4k0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_11,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404120107

On 4/10/2024 5:13 AM, Marc Gonzalez wrote:
> Video decoder (venus) was broken on msm8998.
> 
> PH found crude work-around:
> Drop venus_sys_set_power_control() call.
> 
> Bryan suggested proper fix:
> Set required register offsets in venus GDSC structs.
> Set HW_CTRL flag.
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

Reviewed the documentation, this is all correct.

> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   drivers/clk/qcom/mmcc-msm8998.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
> index 1180e48c687ac..275fb3b71ede4 100644
> --- a/drivers/clk/qcom/mmcc-msm8998.c
> +++ b/drivers/clk/qcom/mmcc-msm8998.c
> @@ -2535,6 +2535,8 @@ static struct clk_branch vmem_ahb_clk = {
>   
>   static struct gdsc video_top_gdsc = {
>   	.gdscr = 0x1024,
> +	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },

Checked that these (and the ones below) have the proper bits in the 
documentation to support this.  Sadly, the documentation does not 
mention using them, so I can't really tell if this is required or not.

> +	.cxc_count = 3,
>   	.pd = {
>   		.name = "video_top",
>   	},
> @@ -2543,20 +2545,26 @@ static struct gdsc video_top_gdsc = {
>   
>   static struct gdsc video_subcore0_gdsc = {
>   	.gdscr = 0x1040,
> +	.cxcs = (unsigned int []){ 0x1048 },
> +	.cxc_count = 1,
>   	.pd = {
>   		.name = "video_subcore0",
>   	},
>   	.parent = &video_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL,
>   };
>   
>   static struct gdsc video_subcore1_gdsc = {
>   	.gdscr = 0x1044,
> +	.cxcs = (unsigned int []){ 0x104c },
> +	.cxc_count = 1,
>   	.pd = {
>   		.name = "video_subcore1",
>   	},
>   	.parent = &video_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL,
>   };
>   
>   static struct gdsc mdss_gdsc = {

Overall, seems ok to me, but I did see Bjorn asking for some commit text 
edits which I agree with.

