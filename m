Return-Path: <linux-arm-msm+bounces-52948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 600F9A7779D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2813ABCE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149F71EDA35;
	Tue,  1 Apr 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S5ehKMvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575D71E47C9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499279; cv=none; b=DC/ngA4RdaZUCNywfkB5iyx7XTtejePW7wkYGpc0fZbGPiErjoJ8ML8rANL9ytZGbzF2lXWAGG8n4BgJjSa3GE2idnJsvUJ9xEtiPFTWb8Mt0II19QGP6Di9be0EV+sDZQAVmrEhaeFQnNVediIxv6ST5cgpUmMxAEg+kqHCGdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499279; c=relaxed/simple;
	bh=RJoHvXDsIZvB9l3jHOyIDYifkc1Xst2MoP/1/AsTk/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Oof1UDcL4IuyIDmwLzCtP6R0GmJDEOfLh+BEK536jypYlVgyTF01v7PmTFNHEETP0r7ex1gPspVDXXVEDX1jpr/bJP/+5nZCb2h6//c8N1+Gz1+yzcPFz0P+jLs9oOz2IPZ0qmpq5jHIKtzlqJnebzS49Pr5NslOz6nO1vW/mx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S5ehKMvz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5317MfpV024541;
	Tue, 1 Apr 2025 09:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ResRo196iBQKj1aRIIxBUKZqoxegBgtT7mgkWZ++F+g=; b=S5ehKMvzlu5RFeF5
	LTYaAfgKakVFUP8HIrrEGuB+vJhsOVE+WnMqTMMF2Qs5wmxgBbfch8j/u73bMurV
	DqgIEpLtgPJKEgTFgOLReaRoYSbPT4+j+spTVngOjYJ21s+NS7J8q1LSUkWhJHPm
	wMURacM/pOuE1GfiJWTZXrZfk3JHPJ1mTVWM0TT3EH4jb7wYyKxHFTZpsDSYhP3u
	XC5srB0SjHKOynqKOnH11DzYuO5uHbqRksKK6Mmw38fBR2biWizw0ivE2CawG9R2
	w5NkLPc7WcZTaZcpFDuBsq8NiCarhjxZd5DKxQIUfTjlq5idnBQifmU1f+CdCGPA
	hRURTQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyred3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 09:21:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5319LCen013697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 09:21:12 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 02:21:10 -0700
Message-ID: <9edeecac-008a-ed28-a029-9fe2278c12c4@quicinc.com>
Date: Tue, 1 Apr 2025 14:51:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Venus probe issues on SM6350 SoC
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
 <bb733204-ad6d-8487-ba17-b38cd9ea1ac0@quicinc.com>
 <49f8a822-4df4-0a61-b342-bd6c418314c9@quicinc.com>
 <D8V4SZVFFHGD.17Y9J8WFKNHYY@fairphone.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <D8V4SZVFFHGD.17Y9J8WFKNHYY@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0wh3i4DhMRMH1FDRHCXYfzWv3Z8krtqq
X-Proofpoint-ORIG-GUID: 0wh3i4DhMRMH1FDRHCXYfzWv3Z8krtqq
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ebb009 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=qC_FGOx9AAAA:8 a=H_dRFrkqm2XsUE8M0GQA:9
 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010060


On 4/1/2025 1:12 PM, Luca Weiss wrote:
> On Tue Apr 1, 2025 at 8:55 AM CEST, Vikash Garodia wrote:
>>
>>
>> On 4/1/2025 11:47 AM, Vikash Garodia wrote:
>>> Hi Luca,
>>>
>>> On 3/28/2025 8:52 PM, Luca Weiss wrote:
>>>> Hi all, and Vikash and Dikshita,
>>>>
>>>> Konrad Dybcio was suggesting I write an email here, maybe someone has a
>>>> good idea what I can try.
>>>>
>>>> I've been working on bringup for SM6350/SM7225 ("lagoon") for the
>>>> Fairphone 4 smartphone but have been stuck on getting Venus working for
>>>> a long time (~January 2022). Essentially, whatever I try probe fails
>>>> with the following error:
>>>>
>>>> [   41.939451] qcom-venus aa00000.video-codec: non legacy binding
>>>> [   42.162105] qcom-venus aa00000.video-codec: wait for cpu and video core idle fail (-110)
>>>> [   42.167037] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -110
>>>>
>>>> I've double checked the videocc driver against downstream, the videocc
>>>> GDSCs and their flags, compared dts bits, checked basic driver bits but
>>>> I couldn't find anything to get further than this.
>>>>
>>>> For driver / compatible, it doesn't seem to matter if I use sm8250 or
>>>> sc7280 compatible or actually the struct I created for sm6350.
>>>>
>>>> I'll attach the log with some extra debug prints below.
>>>>
>>>> My git branch for reference: https://github.com/z3ntu/linux/commits/sm6350-6.14.y-wip-venus/
>>>>
>>>> I didn't try the new Iris driver yet, mostly because as far as I can
>>>> tell, VPU_VERSION_IRIS2_1 is not yet supported there, just IRIS2
>>>> (sm8250) and IRIS3 (sm8550). But I'm also happy to try something there.
>>> The good part if IRIS2_1 configuration have firmware support with gen2 HFIs.
>>> Since you are wiling to give a try, let me or Dikshita share the firmware with
>>> you in a short while, and with that, you can directly try SM6350 with IRIS
>>> driver. Given that we have already validated SC7280 with gen2 (downstream
>>> version of IRIS though), i am quite hopeful that SM6350 can be up with iris.
>>> FYI, iris is having just the h264 decoder at this point with RFC patches posted
>>> for VP9 and H265 decoder.
>> Pls try with below firmware bins on IRIS driver. We can debug from there. Hope
>> you have the access to download the binary.
>>
>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware/-/commit/56035bf6edac7eb4d2867528c598eb646ee68651
> 
> Hi Vikash,
> 
> Thanks for sharing these binaries!
> 
> I've signed them with sectools for my device and tried them first with
> the venus driver.
> 
> There it looks like the firmware doesn't load at all:
> [   44.798028] qcom-venus aa00000.video-codec: fail to load video firmware
> [   44.800367] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -22
> 
> Then with iris driver and qcom,sm8250-venus compatible while it does
> seem to complete the probe function (I see a print I've added in
> iris_probe before the last "return 0;"), the phone crashes.
The approach to update the SM8250 platform data to bringup looks good. Could you
share the boot crash stack as well ?

> I have the following diff on top of iris:
> 
> diff --git a/drivers/clk/qcom/videocc-sm6350.c b/drivers/clk/qcom/videocc-sm6350.c
> index 84c6a1fcb395..504dcaad897b 100644
> --- a/drivers/clk/qcom/videocc-sm6350.c
> +++ b/drivers/clk/qcom/videocc-sm6350.c
> @@ -111,7 +111,7 @@ static const struct freq_tbl ftbl_video_cc_iris_clk_src[] = {
>  	F(240000000, P_VIDEO_PLL0_OUT_EVEN, 1.5, 0, 0),
>  	F(300000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),
>  	F(380000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),
> -	F(460000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),
> +	//F(460000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),
> 
>     ^ this is because my sm6350 opp-table only goes up to 380 MHz, SKU 0
>     can go to 460 MHz but not SKU 1. I didn't check which SKU my SM7225
>     is.
> 
>  	{ }
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 5c86fd7b7b6f..d958a6540949 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -61,7 +61,7 @@ static const struct icc_info sm8250_icc_table[] = {
>  	{ "video-mem",  1000, 15000000 },
>  };
>  
> -static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
> +static const char * const sm8250_clk_reset_table[] = { };
>  
>  static const struct bw_info sm8250_bw_table_dec[] = {
>  	{ ((4096 * 2160) / 256) * 60, 2403000 },
> @@ -72,12 +72,12 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>  
>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>  
> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> +static const char * const sm8250_opp_pd_table[] = { "cx" };
>  
>  static const struct platform_clk_data sm8250_clk_table[] = {
>  	{IRIS_AXI_CLK,  "iface"        },
>  	{IRIS_CTRL_CLK, "core"         },
> -	{IRIS_HW_CLK,   "vcodec0_core" },
> +	{IRIS_HW_CLK,   "vcodec_core" },
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8250 = {
> 

