Return-Path: <linux-arm-msm+bounces-80892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0E3C447B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 22:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B695188A7AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 21:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752DF22FDEC;
	Sun,  9 Nov 2025 21:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOQyAIom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3NpP0HZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6478F2B
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762723782; cv=none; b=nCrq+0SVnA8gcsU8xz/kSw1cVbRvHHhZyjvDsL221xv8vqLelBjjMqHftyEm8HTzTQ0emxr6M2JoHNT+0IN87YN1aY8DA9lqU4O2mJq/v/FEncXSTDvSGjcQZmCzsCKnKTkSghiFpLt/AZDV0v66JCMY5z49XjzhvoGNZ0DF9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762723782; c=relaxed/simple;
	bh=YKRFzAQU2yviHCep6w9J7Yc9MhUTG3/YbYdXnwDQk1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAWxtZNo/nUFptgRfc0YHOGnxmiPUQetkUXbDg8g1AHChl8lYJ14ZVz3lG/HTNjFfuneHcpowBonCS/yqaKMDcsxTbMj2ucKJsLc4CzHensLvejhOfjdPFdrKrrYIWa+odGIBHZk4J+6vYAc4+AUDrWfCug7yRM8AoF0mrNsdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOQyAIom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3NpP0HZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9LNqbo1372021
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 21:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y9+qULSDBdRkc52X/nmwRInE
	9RrGB/j6DPLmA8vUbxc=; b=fOQyAIom3Rs8eKzkvAyIAobupLsvhG2DgBKYl5jj
	z0gj/WYngV3/dgTvFnFIlPiOFsjUzRn40M1lMNg75vO2nkFuA7S2wBEkqCYEJtXq
	nF02lSodMkyGMIYbpG9OLMJIfmOjYDQPz/AWeYd2kldA/0FzvYr48uE5cVm5sKJa
	tZCTsHs16Q+wq8CzEEeyHADXRLlsAVxghNPWiwbyJO4CUH96+zZ0j7tlLDpaQqf/
	1NJrB3VW2c1YNNcRp6quF1Iu7X8o04vft2nLIS9Fp55B8hoICKzSNWRkq6w/BAx4
	wWQcVnVYwNkxtovA9q6k3u3ovphesBW/XT4xn14PQQPaKw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs7apv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 21:29:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dde32b5473so876022137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 13:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762723779; x=1763328579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9+qULSDBdRkc52X/nmwRInE9RrGB/j6DPLmA8vUbxc=;
        b=c3NpP0HZREBHMYvDa7ukR5M+Q5jXRU9JdZTsA946HCUGGy70EfjVyMjXpeI8uOflXO
         oq+DO36pLb/BNZ1bMxC9Y12SVxHL1bw6kVsukATAhVwd9MLL8lTiOuWHBKVeJwiFTBvQ
         k/IOs3ygqj4tK9CHmfZ3BpHHzSeuVqqONqySigkE92raHsLQ+YtoGBPHUcq/TgylSX/x
         9mNuR3Dq3K8ftOFhPiWcs4oeyI2AmWhp6p6Mum9Qaf07PEYEuKUEyMJXQOv0uw7Luh9F
         0IPUG7QwW4hcUhYP4On+fTozXQqzwc3MJdlz86VneW+InFnJXeg9ZC5n2CODKvPk150s
         dPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762723779; x=1763328579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9+qULSDBdRkc52X/nmwRInE9RrGB/j6DPLmA8vUbxc=;
        b=ZGDl48x+006nOfMU73GXEtwihA6yJFfxj/nT0TYAe5l1fkX4jfQv1ovUx6fEj1oBfi
         /p2pKJ8PEWpgjCzxMFs37qyBAl4M8LtSQU6FvVPoy8TGoEFdjjMypllPxCvn6cWaCg/P
         ivy97s4P+hOPHGfMKiaDApcZnC7fRDUY0UxXwF7MLyJW8g67t13AvfLxi0wTmRgofDlV
         deo5bwQZBRHUZeLrW36gvC0XX9SL6jjFWuw/7BYB26jdOhrlUnIwsBLFr25mJJyMaSrs
         NYmbrR3A9yMQD/3x/9muC5kS9tNrPnISEi9sgWzU8yNfeo8++hLCbFzBGJeUHpC5xQi0
         3uxA==
X-Forwarded-Encrypted: i=1; AJvYcCVulG9iyhhqvGMPZkmn2upJKjgPGqcb35mzt0FVYEUbXLwlccJDdAh7dlPzLAOPIjTeVsjciEQjAXHd7ePU@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtysog1euiu4kOmDPbpZDN3HJo0LOGDOQoMmc71sdmNJvag0/
	ctZGa+IYaXIFMZorQHRfvgz4hEgw+LVgziFRN6LmiCgxMI2o24bekLeYJsaF+vG384o48WvrSDZ
	wu/zjtSbkIMUwYnd2qDs8zhwKHRsdQTXPoiTy129wIsdC6KR+/d114MRS0XHbI2KgTctz
X-Gm-Gg: ASbGncuUJuA+YybNNIszxrU7L+YziruFksxC1anOSpiJgsJ2Gy5kRPxZThL6ucJV++O
	MEFfJAv8npPAehvK/RGOu3JdDxWYhp1mM7wkA3xgFMoZcNegHEQ30+GODqAJNJZigAZT+/JCvmS
	Edou4AHr2iDdINdOTMaMsbyV5DP1D7Kpdgj4+V1pwIzhn2ljhTlVqhFSq0ZEYLxZFXPGGeRfAWx
	ZsOBdbrAKJISYvUPvAHwE6h/XTM32TV9+oUUTc/ZKOWib26RkwGjN3Vxsni3st7pFd+X9K7LXUa
	LNLhOCTTO1SUV+oInqdCkJD0IFBGU24ujeOrqKU6rqFB859idHtZ6SXoQuHjibT0b2GchZlw77Z
	nb6MqofXh6e8EYUSWcz5Gmx8XfaC9w7YqnalF4s6rbTbZ/oNFvepcAUzePjSggwVWN17u5zMhYd
	YBJIDpPjuzTDaF
X-Received: by 2002:a05:622a:201:b0:4ed:b55b:674d with SMTP id d75a77b69052e-4edb55b6a65mr26511501cf.59.1762722999268;
        Sun, 09 Nov 2025 13:16:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEH8BiFfw+ts2f53C6zCXeNgfkClVAFT63zGR6OYEJ0OIG9wp5dnSJCliqhgGeg5aYM484U5w==
X-Received: by 2002:a05:622a:201:b0:4ed:b55b:674d with SMTP id d75a77b69052e-4edb55b6a65mr26511301cf.59.1762722998839;
        Sun, 09 Nov 2025 13:16:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a01a029sm3324582e87.35.2025.11.09.13.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 13:16:36 -0800 (PST)
Date: Sun, 9 Nov 2025 23:16:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v3] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
Message-ID: <2uvinljz3gevbusjrz3bzi3nicelv3t6a64gliv4mdv6cbllvp@fz3qbyukypho>
References: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
X-Proofpoint-GUID: Ba8QxRXP-VoOlJh70JvpqQx1QBSQOcUO
X-Proofpoint-ORIG-GUID: Ba8QxRXP-VoOlJh70JvpqQx1QBSQOcUO
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=691107c3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K7FOPutcZWfKzoRN3qAA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDE5MiBTYWx0ZWRfX/VVFqqF5Y4XN
 mOUbLLfa6jja9lPJpHtaFl/yCWqaQDUXEBKfSgKDgN7vVyTDI5fj4t2Ix62L/eILXM3GHR9Yown
 3qJY0nanaZv6KBttz2F7c8OzS/NilHrkCMxzT526sui/Nen0vRQx/ZF+LIC20EdZfKqo9p+SL3l
 QeCoAkJAGty/Pih+XzjT9Ws2bXmSLb+vtTT3sGO1b3GcegFT/tEwE1wwPsPqnOLo9b6SBGMgtdJ
 UjLV4xMsYhqJWwjuCsvCK83FQR2Q457FvCCkvjvaEGlljldctazNHKMmA3LI6Gg6bLfYWhZJA/7
 q1KCbaMcCaYRsLXsC6v5S3cx74jUB2Sf4aJFcYRTsdDFq147bTgw+2nbE4gVDsxP4lDbsRc9Ovh
 imDC4fWUXv2rpjP47bSDkBL22SE+lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_09,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090192

On Wed, Nov 05, 2025 at 11:17:37AM +0530, Dikshita Agarwal wrote:
> Improve the condition used to determine when input internal buffers need
> to be reconfigured during streamon on the capture port. Previously, the
> check relied on the INPUT_PAUSE sub-state, which was also being set
> during seek operations. This led to input buffers being queued multiple
> times to the firmware, causing session errors due to duplicate buffer
> submissions.
> 
> This change introduces a more accurate check using the FIRST_IPSC and
> DRC sub-states to ensure that input buffer reconfiguration is triggered
> only during resolution change scenarios, such as streamoff/on on the
> capture port. This avoids duplicate buffer queuing during seek
> operations.
> 
> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dynamic resolution change")
> Cc: stable@vger.kernel.org
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Changes in v3:
> - Fixed the compilation issue
> - Added stable@vger.kernel.org in Cc
> - Link to v2: https://lore.kernel.org/r/20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com
> 
> Changes in v2:
> - Removed spurious space and addressed other comments (Nicolas)
> - Remove the unnecessary initializations (Self) 
> - Link to v1: https://lore.kernel.org/r/20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com
> ---
>  drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..7f1c7fe144f707accc2e3da65ce37cd6d9dfeaff 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -91,12 +91,14 @@ int iris_process_streamon_input(struct iris_inst *inst)
>  int iris_process_streamon_output(struct iris_inst *inst)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	bool drain_active = false, drc_active = false;
>  	enum iris_inst_sub_state clear_sub_state = 0;
> +	bool drain_active, drc_active, first_ipsc;
>  	int ret = 0;
>  
>  	iris_scale_power(inst);
>  
> +	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
> +
>  	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
>  		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
>  
> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
>  	else if (drain_active)
>  		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
>  
> -	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
> +	/* Input internal buffer reconfiguration required in case of resolution change */
> +	if (first_ipsc || drc_active) {
>  		ret = iris_alloc_and_queue_input_int_bufs(inst);
>  		if (ret)
>  			return ret;

I will repeat my (unanswered) question from v2:

After this line comes manual writing of STAGE and PIPE. Could you please
point out where is the driver updating the resolution in the firmware?
And if it does, why do we need to write STAGE and PIPE again?

-- 
With best wishes
Dmitry

