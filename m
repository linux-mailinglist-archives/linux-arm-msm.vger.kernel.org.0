Return-Path: <linux-arm-msm+bounces-77636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01432BE5530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA32C3BF36C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD542DC793;
	Thu, 16 Oct 2025 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRoQMH21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA132DC77D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645336; cv=none; b=PHI5xJM0qOLZGnKyoQQLlyUA6oJ81rUUQ4tv1vTl0WtyEeCZweARMgUESrDwRrFWrgb4MtGbj0LLaOs/uFlVsvCEi+opQ07eWhmAcUHKTHTWodiggeHqnlGqTHHP+O5KLuHTHUQzvmMxN/+qeUML2o9s7RnSinOJYcrOyqrawMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645336; c=relaxed/simple;
	bh=J+Zwp0E9tqCVCXtH1TLr3bcBFxCc5MDrmVDUvbChza8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrftigglwsgmRgyuErvLCJHnNpMQNUwKwfBnu3sRVH5DP98fZKb2LJb6erS/ymbf8lvrzv18W+dc8vR7EGCSZv4yXHWQC9ehFpADzwy0c4eUUMl4OxoUKBbKeroDpTIMJL1UpyfE0tWls3ws08o76jzGbxIBZjan5nsvb+5V8UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRoQMH21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GDWacV004155
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XW25WTUPjM0HYbFzO4qQOv0a
	rYQaTxvpGuWa+PN/BYQ=; b=GRoQMH214l9ZktR6yEwxRJNDcIkLrBGBary+WEiB
	gk568wNkQnbNtkD+GEL1hRkPTWZ/2dm4uFYIutRag5FBldkDVnAWfyXdr2+zYpbr
	qx1FYrJ4jOq3ppXR/hcqkq+JfOaBuHUAjRUToTk4TAHCykw8Euz4m9BqNQLBh/tG
	/g5mHJuHsoxuQNOvChjTXEy+l54mJM6APFKcXFcIFrSTuiTrba9o4mvG+mIGXyuR
	LU0RrLb5OVeep+Z9OjfIyzsNzYaiNpJxTeb7ZsQFfDHKXvliCzJjZw5In9jH7VFU
	hQTKA2+A3pLHJkUm1BXyp/86N9+KDx5TaelhK3jit4MsSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwuya6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:08:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-86df46fa013so508011985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645332; x=1761250132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XW25WTUPjM0HYbFzO4qQOv0arYQaTxvpGuWa+PN/BYQ=;
        b=hClozTR8t/dlBIo1he7GGTmt88S87MjKe7QSwabmrujB76kISDc6cF9RV4cu/SARwP
         za2zbEFoQfiILDzBctpMixBj2pgThvVROk80T5t8pcFLMUdA5U6CHaUOULchciuqAHIV
         YnkztWeDxKO2mGZGfVmO0GRLPwyTg/Xqc3iOjU813RFRSkp0IgOeZEXcjQuGTIkiTSXR
         7/dMqhqRzJWAizi82Bj4wIzFYt7qI5AtaoDf9d11Rw9XVEfsR2ZI1U8OwOCtWGaGmDPp
         ndKsg9D+iztgJYZYscw9Q7ngEV3cmB2Y1vUqel50vwpLGzJZjb4bscUCh2zbUrMDil+V
         974Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqPvJVAs+XLAzsBquQ0ptyMBMWefy81LejfJ29DueHN3DEpskmpwU9HFUYsxAR7kw702KSmt2Z8wgkICvc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+JBbRGOAP3ZyCuxkA2Qj5pS25yuJXPh+uG6XmU9kJMLcz+Lc
	SUpaJmsrzH2JPHUGMZB2tfceiR/4nv5KcmoktSzVd55rkWIssGm826GA4Ogjb2xV0GYwvpjGZ4T
	3T9HAzo6bwf69lfa2Jf1WSatHqM4MhzZXS4ZbKseGrKIkX05yikQT9hf4aNiewRQzpBGf
X-Gm-Gg: ASbGncuE4DkIuzc5WsOFsbqjctGDMbTM9F0AisE/an0ayZFxsKGpTcZ5Q/RRj+9TJFM
	EhOAFJMUdwVwMuQ3F6Tv2i5w73Ot5O3BmB1O+nPepg8qQP8sgijkltmNxL7HiCZO5rj/sS54S/t
	fOl/QQqFxvpHVV6OtazHvyE6m8X0zFMHC3fYPPNtkhwoAGXwXOMPfQtdC0k11dRfPP/kVuz8lwZ
	tLp3ugMWTrDZrVHFOVlhT0sWIUY55FalzzILl8Ors0OUrzEXKBmeECQVnTdiPzikurpfYZm4BhQ
	xX4f12N5fqN5G0v33j6brdTB3EeUi+lg9SkS/vcEvhqVCbtwjMQmUX0j4AE1b2rHoJpVHwsnDh2
	9heLu+7VqenKgcbio5yqNoPmPd0qtahmNWDKhPn/WuWGC9EuAJMWltXzb3A1YznkbADTagKB9C2
	DcGkICjezz/R0=
X-Received: by 2002:ac8:5fc9:0:b0:4b4:8ee1:7d98 with SMTP id d75a77b69052e-4e89d21c3d6mr24692901cf.8.1760645331606;
        Thu, 16 Oct 2025 13:08:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELwSY0pYfGnC1kz4S53qSyk4kBH14qSenJ7X/Cza61k+EVAgrYsjLisx7xZsfpWVeiZg6fEg==
X-Received: by 2002:ac8:5fc9:0:b0:4b4:8ee1:7d98 with SMTP id d75a77b69052e-4e89d21c3d6mr24692431cf.8.1760645331106;
        Thu, 16 Oct 2025 13:08:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm7293872e87.50.2025.10.16.13.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:08:50 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:08:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm845-oneplus: Describe panel
 vci and poc supplies
Message-ID: <62iuzoisxavlgadhz3gfrlwxqu6vl4gtlyrarjkmwihepjr4hf@nuzpsaj6jcg3>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX/y/V97Wj2k9O
 GypsM4ffx49yG1OWl/TyIvhPRcKC6ENdBatlqqPUB35RaZOt1cX5WMZqL4jztMdsmOlSY61/Wew
 EE8xpj1tkqd+LHtSolYETchp9DL/834gCfgkt4gvIK9fPxKbaB2N1GjBv1hqlEfePwNdtEoY07W
 yDuMWwQ5XiskacbsIjS/g34+aPnKjaoC8PXLV1qqVARwQ4k5Gx2zXBzsnYkfj+PCgFfbTu2AIJ3
 PzGIIElx8zVYibyfO7Pph5SjQsPNM854l3c7D3cuFOLC19B+2ssYkb7O173AN/tFqAazrKCuXB6
 349qoPv1B0X6X96ePI4Zsqtlm0yVs4S8cZG6dMSUAktnEeHgCgGbEPaFqZQWdCpNpb9dtEwOs7q
 EC/VWMsKMV04LoKMYOKKTJWfWPoUtQ==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f150d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=CJSKMeR5ttdQttduZpoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HS_MVczyZRHcSYqVfsueL3IAwJu9SfCy
X-Proofpoint-ORIG-GUID: HS_MVczyZRHcSYqVfsueL3IAwJu9SfCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Thu, Oct 16, 2025 at 06:16:57PM +0200, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

