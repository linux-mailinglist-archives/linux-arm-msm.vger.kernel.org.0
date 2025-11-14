Return-Path: <linux-arm-msm+bounces-81755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27FC5B210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86560346C1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C9C2550D7;
	Fri, 14 Nov 2025 03:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axPgykiz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbcLr7yg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650EE236435
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763090943; cv=none; b=gjEJjr/MQKRKmMduS7UqVQ5NW5nYOAJwqB7qRifiBZoGdbSH9hVKZNw/lwKnNQRpn5fzW4wkoHe2NnNJrdCE/g/rJFPerQcmET37R6qRhhPu08IG0ysVUCvQBHrUx4nnR+fA0kJ8A1kj1cTuHarOdswYvxlKZSUO6hIrX6s4gbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763090943; c=relaxed/simple;
	bh=fndrMVIgWBFCr+Uy7wqtAY2KxbgmCTdMGUgMpsV7XHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df6C7PN7nbn/FNMxUGEerus6PZYAbC+dS0Rl5mkU0ZBVHPYRy9ayqeGNy3irSj3ySBfLEZ2YTPo49jdos1P7zZm0B6cZlzYe6+5YA9jwnAMwgUXoFAPijO2XwaiEvQulGaP4AZU4/0QAAnrdOZYEnpf5zcUJtMC/JW23kFOp9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axPgykiz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbcLr7yg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaviD1427247
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RLRw/8dVIKPFbjXbsiu9Ydm6
	Vif2q5juqWK5v1uJ/mc=; b=axPgykizL1fKSlToHCbkuIH2SXqajaUjnIrpDbwA
	d3pJUNB0H2yHEtXm//G16z6EHmb0G99bBb2e4x7jOXFr+oZ3kRQdFKYGXv75O0ft
	wl97bF1s4AmGf/uY46hjGHDWbuxDKQxk49F9O1nJeZltjQMf32gvDYu5xkRX2NDa
	xn3CoJ0d2XljhoPJcBPTnuZxMmlvl6Z5+IhGiQj66M2vwyzJh7hlhViFo7cUq7KW
	HvxdJXNoY+o0oVKPASBXG5pkirUlmXwEGoO2MlGn8b/8kBqaAnWGT6kYasin/PLA
	95QTN9tzUK07K6KZKy9QEQrz+meAQGZuSlK7uuw7hUbrkQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0my8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:29:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882380bead6so45085046d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763090940; x=1763695740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLRw/8dVIKPFbjXbsiu9Ydm6Vif2q5juqWK5v1uJ/mc=;
        b=hbcLr7ygQb9yPkNdH3uHO7hVT3FT/OOMZYc2IbnKlc3qhyfPdo5DSirBh5hnfHjhXW
         kRZuOznEuLoImWbj+KwmqQ3o9Sv+/DMZOtfRA6pzoyPdWmw6uyyhP0GHXoknzGPo/crk
         ir/5QPLUxx69tVoPeTM172wtUAE323Rr7GAwt4I9o0CT/sAsw/5xBgN9suCJvewnhMQp
         tfGtA8kW+ouF5dq8HkqDr4ZN0zOkGF+tuEIYT6a6+R3al+ZSozHP7g3JIVmQ4m+wboA9
         352H6tj68x2QIRly6RwXyKs+5mI0x9bVuXKy4nb1W0MdjZaz17m22TYEnWhPk5wTLnWY
         DzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763090940; x=1763695740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLRw/8dVIKPFbjXbsiu9Ydm6Vif2q5juqWK5v1uJ/mc=;
        b=Cnvz196vMaag3FdhtTXGU98IA0X/Mmw2s8jHfqbLjFxHTR6M4LU53VBWXyCHVY3Dcv
         diZrS3BdyQa63VmKO3r+fgpwriAviu4xCPEe80xHRlCSm8CPovUguVdEZRsLbdVWDAr4
         yPS9IoMtaW4P0WXImVDD3Fh67+2KZXA7tnbAifwxeGkXhLv4/zXSdqHI2RMaphg2MgB/
         3rGwW2NfjxCqn1H1M0H+qfsmtOSD0/aOksjvAX4KcHnMT/5yry7hNvKIdgwcOeQ1639G
         j0dWv69FcRHEebt82vQQrRdWF/UIIiUiOPSy04pO899exK/BGKjhzUrdv7elPbpegzEB
         hEXA==
X-Forwarded-Encrypted: i=1; AJvYcCVMbf5jkCoApaIH5lRjBQI5Cufxe+0WEXPEpiTGS22oYfc3Q6CH6APxGDZcfU5Vab8TEwCDir7bhcucl+80@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy9x2zWtjQEIHSI5FjS9jSNQPljWK9ArIH5JqKQwXISfgPIxJm
	wy7DO8T7Jc3VDcZqlQ6JtmKdaYzVxAhjq6itmIWB90VmDCWF2nbYTqLWYzp3LmmR5dtPAt0/nTS
	/k5tUXw2wpIuqHqJOz2Yi/HEVnRZwb7h8rdWtVH/8qWnPaL0Pd1KXj59Mv7h260c8DQWOLhZgCo
	20
X-Gm-Gg: ASbGnctuZAiHbzQ4zM0i1VScZeca8wPxmEW0wGPkyF9w6W+JFjCJo8ACWJ1+/s+3dNE
	LTubM4yyt1grnf6MTN+py+cVOnu5t6bd/1rACHmizeHCYyurLxT6d3599neNXcopXyZ6WRMcvdH
	fcYFfBBIBaXeX4fFKcq29UDzfiVzFGpG83x3Br7T6Dp/24NCApcU56PnMooCpE/8bbktmtUgU5k
	XLxKO9mRdU+3xWRfFHGEMK8lWadwZ8pAlf7uyEjApOCR9dI38iIdZB5RQnF73gZFz75SJdFnTNg
	GcWunKQurjh/kWiLLgZtqzQPEuT3D0yF3fYSuZ6sBbO3JDhwiYpgt8Wtq8BEq+lEjfAbRrm+60R
	p7Zlm0eVYrb57iKulOtE14SVm8t7EdYvFRWlLlLeK7p9ooD4zmIjnHFmofCmU5Z2k7pVOZuMWle
	X6K8h/b9sN1yUa
X-Received: by 2002:ad4:5dcc:0:b0:87c:2b29:2613 with SMTP id 6a1803df08f44-8829269b835mr22681496d6.50.1763090940316;
        Thu, 13 Nov 2025 19:29:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNbTj5yJlqQBe/C642aRvl0/0QTbIg5WXKWttsGxdjFjPxIg4lzdhHzGLzAeGCFncoain0ZQ==
X-Received: by 2002:ad4:5dcc:0:b0:87c:2b29:2613 with SMTP id 6a1803df08f44-8829269b835mr22681226d6.50.1763090939800;
        Thu, 13 Nov 2025 19:28:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cef80aasm7121811fa.54.2025.11.13.19.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:28:57 -0800 (PST)
Date: Fri, 14 Nov 2025 05:28:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Add backlight
 support for eDP panel
Message-ID: <iwttmudtkcyzdgudxdwqlf7pcahbzsosvdmrkn7qngf3hp3mm3@bcrpmotsojqs>
References: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916a1fd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=flHQAINMbhvZ96ts1A0A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNSBTYWx0ZWRfX+rfdkPKdeYwH
 JklyPuNrL/o7JKQjYRk39ETU0B8BnCcXFcEPoPGLyyFsaM3mfeuCNK2ciUdmfXrpBHJ9YWEViuN
 ZQ+dnQh0U5iMDG0mJqBPlsF39/7jkx8eeXN9oUcqsiRqhcPoS/6LQw8XKYmcS20IRYRC1TzdbBp
 zCamMkdVvNUC3pGYeR76vAxHUTaaJugUNPzAf3MWEoRde101P0VZV20iVndIS2GloG+XXYenWLw
 b8tXQ5dgbhNxnqXtrjFZipl3X31Ym8tzy8uTasMxUz3fycrdyVTJN1FpiBNARkk4eNxysnuBB3V
 9x1YyYbyKTPGtBD0/m1fHuIQgtFF5ywwFjL+vzjrVCtiV6wOluDWYE0CSMeOYbkfTwzhHFqrTWR
 DT21l5/7FXjboughSbYZ5ukU52nhVw==
X-Proofpoint-ORIG-GUID: _6H8124uZLF4wNyBKVdtmKT4ewKkLRtw
X-Proofpoint-GUID: _6H8124uZLF4wNyBKVdtmKT4ewKkLRtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140025

On Wed, Nov 12, 2025 at 12:21:23PM +0800, Yongxing Mou wrote:
> The backlight on the Hamoa IoT EVK is controlled through a PWM signal.
> Aligned with other x1e80100-based platforms: the PWM signal is controlled
> by PMK8550, and the backlight enable signal is handled by PMC8380.
> 
> Describe the backlight device and connect it to the eDP panel to allow
> for brightness control.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v3:
> - Optimize the description of the commit message. [Konrad]
> - Drop empty line. [Abel]
> - Link to v2: https://lore.kernel.org/r/20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com
> 
> Changes in v2:
> - Add hamoa-iot-evk to the commit subject. [Konrad]
> - Correct the property order in the vreg_edp_bl node. [Konrad]
> - Link to v1: https://lore.kernel.org/r/20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 54 ++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

