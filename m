Return-Path: <linux-arm-msm+bounces-67840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD65B1BF68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADFE517C35F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4A71DE4CD;
	Wed,  6 Aug 2025 03:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzCGJaoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD543146
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 03:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754452027; cv=none; b=sUdeBLjwPf440NwoEoonqa/vFdIZrwJHJYZdOfy+I7IMc3jgHM/WqQmXY52y8SMSZsJT3BBs5Wycup4yjjY7IRxHkiBi0rNf6wTvYrgFWBOIee6uhDg7w88ELvYeGyErA52JY39ATYOcNsZjNroJeaVsgQP8VCYag2cc8tDzq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754452027; c=relaxed/simple;
	bh=SZNNbsaDOLAUvUge4L4R7nT1OmTDf0tURWgAzVUteLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF5k8e01Bv4yG3P0h/CgpukLNACmRZVYpVivXkC5R5WV0RzZQRzxgCaFpiSEJny+b9GUD6i+z/GGznobFNQaMHO+e45WwhpJQNEkID/k01Chz9YbVidtz7OxQX+XbebYW7tdJRTwG5d4CqcgKaPYwtXHJXH9FUpqy8YhS3n/RdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzCGJaoS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761fX1U029318
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 03:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uzO3gUvM2oUa6aLeaVCj3dH+
	MS759piHbjXm21lQVQ8=; b=mzCGJaoSZ6f1FgMO9zeG/iAb9tlRkfedI/WzWEC4
	LcHol/+wg/+ZmGqYtYExKN+kWeXgPNAnDtg7+NSuTtEFo6eTiSJ+82NQ4022vci9
	/ZZPLtUY9J03B1W7pLyDCk/C+3Vlw5NTkBwXkOy9/rnXC6vT2dV2bF5mQk/TBScH
	d9VD6cpp7NxN14fnq39hAg7sBv8X6RvRmxeyiLbuy0h9lsy48MIwCDw2wNrBlksj
	2PAY6PMSpoFvIKhwzv0b23KCPbDqyG7+VekHY/Z8D4CybckxEOcswoxN+sAkRBPn
	r90iR0zqHIBrTP5DYFUetO0iG+Xv9YvdSC0e8s4tgd3LDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7say1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 03:47:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e8100bef92so236811285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 20:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754452024; x=1755056824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzO3gUvM2oUa6aLeaVCj3dH+MS759piHbjXm21lQVQ8=;
        b=YbZ4uLR9lA0kYyGiF4Yjd5K0yxqOouo0w3bcG3KxTEU9C3X5Vg0jwrrrMHGk6IsJUH
         lzx4kl06eVj/Xhtm+lNjugGldv3gZ2PgDZDkRZcFyLlNffknyGktELe/vPaW9LaWwbmh
         I8hwtGAQiIm5WwaBSVDUHkzyMgx5SZrpfE1oJn9Ka3g8t48u6Gd3GKww4rCA6XVaFDTM
         SLZ7FVBVO4GsDuLBULn2eqhTiCTZx1E+Ue92gMPGA7Eohh1U4BYLnnRPLV8bzA+xli9K
         7yjiZqzlAWza1tHWS3zoAHNFfgwGOTQOuKVnoA79MphPo/+u+dm4nR2CR2qQvvFn75VM
         25Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWcOO9R2XBra1wcqqy2JSNFGkq4tm1IwPc7rUAi2BsR7yMbHOjzcCFcjP9Z2owhnmstrt91Lnssrz6Q3CMr@vger.kernel.org
X-Gm-Message-State: AOJu0YzkBnCtwR3r+6XC0wkYCtRy7ThxAbzCHD79znRiJKSoyt2t9p+8
	Td0rhMdFLLCw/BSMRH+KQTIZGTQvMFph0saXrcez+SuiLCIRZLzHFbn8/51cdIrWuiqCmMgZd7x
	DWJB7EKSScOtpRoUJm874VpWLNZfPXVxKvXu30UTsNR/HNvY80c34zS5YTx4ELaEcfXj8
X-Gm-Gg: ASbGncthQZnaVpl4+tScLVosQPe8Mdh94usNZaOqEUc42u0ktoiX8Vpe+eI8m9gyFnN
	IkqSKgPPXWcm0iJFlYOYampVmV77bPxvLFEj65eKvWK7+c/2IHoeHXupCT4FTX7TstMqDUH43HJ
	gSQhQZmKoA1gD/d36n0MySkNIBVqE/XQWDoHrJvPAZxLJ7sFbdr226mWsL+NAUq6GiOK301ialY
	zkrKestdVZk2zNnG/m3FzApWllGUTdsOlqmcSRV/QNdhqJL7uMJFNB1+bEsLgNdjWbWVAAtREAz
	/xhY+7Omvp2qvMTNcIbRwchIx3uuwAme36LhZ29H65WWC6TEo4eVmeRansvPLvpLEGJn/SnvrQ9
	y31TaLZhEPTd14GMY6fiaO4WJPsilF3wp69Jlw6I4SOQI0mKcZMh5
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id af79cd13be357-7e814eec6ddmr188020585a.34.1754452023480;
        Tue, 05 Aug 2025 20:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETZoK/bA2Y9Krb11P0NcogumIV9weE+6Fu9JMkAUX39k+KYb80V4r912KnrkZIKfzAnXHpaw==
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id af79cd13be357-7e814eec6ddmr188017985a.34.1754452022876;
        Tue, 05 Aug 2025 20:47:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88db2214sm2114064e87.177.2025.08.05.20.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 20:47:00 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=6892d039 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=q-PZGS4JpPPfnBF8F2QA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _YUlIV9n_DNJAFa2iD8CdTeWOUbVvArC
X-Proofpoint-GUID: _YUlIV9n_DNJAFa2iD8CdTeWOUbVvArC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/3NHcdl74iWI
 1BOhJDBaYloK+/4B5gpL/HfssaDwjt3IRL0J6/QjYhPCGt2e+f3A7RbZyNGZSDyLG9Vv15rori+
 MkESa8Yrt4A+Q70WaIRnL/hr/lAuvnXprtfbeumD1ep4zz2lqfhxwOQJQ4POicfqZDLMC1amk3Z
 aUM5x+8TjrOY8+l4og6jfu08KDdhqpu1VfbSGbvOayWqTRLeZ6gkh4p6AV1OQ96UpaiMb6RGiIX
 zTZhGcLeHlipwFzWpS3k0zZDwbQgvrCXtcdxe2qbDfILaOZS86gbNEDkVF3kmEjCiFSGI0Ru5AP
 r/97Cf0ng/BxMZNqcAFBOgvvW5hb8fixTB9BXFDXlE7SSA37hhoNPhl5zjzCwiL06Pbr3aFHMQm
 79RUiNDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Wed, Aug 06, 2025 at 11:16:46AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.


Typical comment: you've missed the explanation, why it can not use
fallback.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 2893f097df826a5f941fbb754fb4a96a1e410a70..f5930f29c91ec95e9182c7b8ee83c0549c6657cc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -186,6 +187,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-dp
>                - qcom,sa8775p-dp
>                - qcom,sc7280-dp
>                - qcom,sc8180x-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

