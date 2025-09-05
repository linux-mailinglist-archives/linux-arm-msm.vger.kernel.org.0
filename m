Return-Path: <linux-arm-msm+bounces-72344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D279AB45E75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 18:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769853AF50C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2334306B2A;
	Fri,  5 Sep 2025 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C50OPR7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B802FB0A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090637; cv=none; b=rjWwyetRPPfe3u1JM5HDCq8i/0CVGK+C8pVcMVk6XexYEMxjrFVKzanQhhV6WbAdB/86LagczbWX++EO+osIExFaBdR+o/bQCoXG1QWKAefTFv/UJkUOqRlFoUFxz6bKRwYJFrD7LWMBtvHMtiATV1s+js8jrDgaG1i4zUviELM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090637; c=relaxed/simple;
	bh=Jwq5Cmuwq0xKoPb8D5Y+WDIT0WgPSbIA0dAerV9mjcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYe3zDraOFq8JmD3x86g9je1FAj4TihOmjVCoVfZaeGSiDt8fay1Pj0oms5WwBGILxce75OkFwa88hoRogekU16xoPFzbONDpXwdt/MwhwdQCu9Aky809iiFLL7XmTVtu4244tnn5JtJtMntM7sacDapbdeJ/Fa0a2J6mZksTdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C50OPR7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GRQ8F012198
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 16:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=suqflfzPR+pi7AQ5LgBM/gjS
	VWHsISZIF8XCQ8+m1Fo=; b=C50OPR7JbK6QmAO/hk0Gi2t9QdrxrrPXlfZljFgS
	zhxnNYCwJxIFnuO4x/Xg+EOca5PyZRjxrBXHwTh9KZUwhomSL7JOB5eAsQX3S/5Y
	uNvBg/ikrOuO0YayepymIyM5vZNnnr6cEoA8xkb4Rxly2fm5u6T7V3C0a6+vMVN6
	J0l1ud37ZTFqFX5Npdo4mjvC8OQPcB31dsnQRs3AF+1GIge6Ty6pzWM4L/95y4Gd
	MvmBTqiRa/6HGpyROCYFbHMzUPMkGGtlPfvv4WqoFmHfAjaR78wHAZuMtV8efEZr
	TXbPU+VbJjPMynxbyMm1lTcky0JsZasFs4we8Fs2SNkwCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj84r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:43:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72048b6e865so41639976d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090634; x=1757695434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suqflfzPR+pi7AQ5LgBM/gjSVWHsISZIF8XCQ8+m1Fo=;
        b=pv4ID7rQYJRMvNY+LcD3UsyGR3BaJZMDzhCYJvYBba9FaVHj/8BXf39sUNuhyPHwf5
         n+bn/9S1XhOsAYCmY0157DE69cHfPzVrPQGtQoPAK6mabaHQ8R+/exNjKYq7fIRuX7kb
         gkLiEqVpLJMe4Xvs6w6o47ZNAI3M4JbU5DRve9NuON+5/f7y3ZnltX1/zGzr8Tt2W8RP
         VqSZihraQ5M9CK/7FpiGkwX1TswQNDHIvbZqsqWN0/QgFqQ4alutZ54ZcuKonZHEpRWm
         RDMJX8YMwBHrSC3cWqulG0fg7SCXZexZCvmN0eFTHw08m3iyHEsLZpNLtZNjBPileSX0
         c5lw==
X-Forwarded-Encrypted: i=1; AJvYcCVkiHo5uHEQIeKee0q6Ugo/8HzQzkUseAa1T5KGerOKACiWKtJV4jZVM9kUxQn6tPHfXg9p7zw8t+r+vWPH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7L+lzoVni5BTZvXuZTpGNx3gznOtJvsbH1ESgmFLoprQaH4xm
	TX2PsLazxK5hed5yIjRev0TfUkQhIG9XTdRCF52vvry/zZkRv27xSdbr/BOHBfwyxSWHMVz4Cqm
	mo1ntxnsCGQe+3Cr/uDtfnI1bkbqVxTD1ad9Ghp5C6pTDww0HigZ/UjCR2TNjMb8tLT0P
X-Gm-Gg: ASbGncsl0ouxxr+HWmBzC5UHQKtoZ7azJvnOJ2pHoAIuDuQW97jFxOIFiCsilj+6ZOK
	xkVD9pWzT3haWRhnbWbWGSWDABQXUUpgG7EsAr+KVKo5/7C6rleDr++3ZIuVo6k37fiCLIviw3d
	4pnJQd3qRZKOP9vscLIq/r2zNqfgoQdLNK6U4nydJuqmPoKBuVA6UWMLSxu/LDjtcak4sGgKsfL
	9B/ybrJUdOgdsPEQurArI4WGcNX8S5FI7kpgK9Z1fxniJQE/gMngn5c34s+M/cISYJCXGdrjrya
	XrwXLCQeoTWEtWPp5LskGIoNxrfBXsf1CypqFYcB6qruizUMGD5QwkKXO7c/mJTMbaQ/ILJq4ER
	6Lgda4s2xZYxo6zDlEvnUaRLxwvyrCgMxpbxD+LqdlHP3MqWbJ+Ev
X-Received: by 2002:ad4:5745:0:b0:734:8eac:353e with SMTP id 6a1803df08f44-7348eac384cmr17846616d6.36.1757090634173;
        Fri, 05 Sep 2025 09:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhHOlrH9tvNA1dTB5GEq9RQjj64EL1qdRc5r/I2S1MBiKCWxrLuvxLGgufouv9wUmgFBGc7A==
X-Received: by 2002:ad4:5745:0:b0:734:8eac:353e with SMTP id 6a1803df08f44-7348eac384cmr17846066d6.36.1757090633478;
        Fri, 05 Sep 2025 09:43:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace8068sm1807051e87.79.2025.09.05.09.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:43:52 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:43:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 09/12] ASoC: codecs: wcd939x: get regmap directly
Message-ID: <qly2mvnlrmsoy3jds25i532etwcnljewic3zcc5dbm36nolzlp@macsnqtd3hqw>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-10-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-10-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX4jYUVTR3/odC
 Br+L436EM1FGFZPHDtfBuJB0goUnnCHlZRTakiIOkCz6qFTZtYHlokzwCWQ2re+AOT/ZjFVrfSy
 DUcVUpKw+xO9FqDEVbE7JiiwFa2pqpV6i5VUtsd8mr24Zna5urn42j9Zb2ndUKz1E7joM1a8GOU
 WFIQ5Dmal1LqKhxykHo02+7aG75grx5fCrrYLL5AUVV8ZVYOvf72xspr5Z1cdEpnVBjqFnynF+k
 CaPF7SRnSoeY3nrWmv7h8IrG3yrCmCSJKl01sqw8lYv/CPDkWInBtAiuB6NGlyxKJfce1Y8vY85
 rxH9tQvGv4kPycFDLTLN1YsBfSgWWt2812L/aVQuQ4n91AkIPRTJNiSPyD3T1W/sb5I+TJbda2/
 Qlo9P28r
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68bb134b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4rFx_9ibI0NpJ5H6q0gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: U7261eYl5KpSw4k_a4cYaSEPNFHVr7tm
X-Proofpoint-ORIG-GUID: U7261eYl5KpSw4k_a4cYaSEPNFHVr7tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On Fri, Sep 05, 2025 at 04:44:27PM +0100, Srinivas Kandagatla wrote:
> for some reason we ended up with a boiler plate for dev_get_regmap in
> wcd939x codec and started exporting a symbol for this. Remove this
> redundant wrapper and direclty get regmap.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd939x-sdw.c | 9 ---------
>  sound/soc/codecs/wcd939x.c     | 6 +++---
>  sound/soc/codecs/wcd939x.h     | 6 ------
>  3 files changed, 3 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

