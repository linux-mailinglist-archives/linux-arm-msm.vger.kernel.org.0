Return-Path: <linux-arm-msm+bounces-81508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 492DFC5598D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 04:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6372C4E45FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 03:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F8A296BB6;
	Thu, 13 Nov 2025 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3SxdEh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDj5KVIi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3645274B23
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763005834; cv=none; b=ZoV6iySdia27WXGtIDd66pCP/XMI/rgaxTGgzu6o4uNcnSS2jZpI66dG57Kq7aGmTmVRbFb558L9P5fGuMw3zx9zV96CP2+BxEs9cgH6PEXUEpgZ2XN19S4gkXOnpEU/JSMalaX2wfEXDG9rm5iT5kJPDzuXO1E0Av3OyfrP9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763005834; c=relaxed/simple;
	bh=ApgxYi86HOjwkB9t8ICvCXOaL9Z0Rzqi6CJ+ls2Guvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dK54eDNFynQoGUN9Y+eVaJGtJ42JB9EFfQbrygZf9ewMBVkgvc92q3QvSlXY4Ka4FHHIfV1TTktglLrjHPSxqn+FdBMotmCNCTyH4kFD96414rdOuVSC1NniKRkh7IeWarExbhNWRp77JnrMHqUmU0bW0qCFPv+bU8al4/3c/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3SxdEh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDj5KVIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11JEo2909817
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vvTqxjY0uLJN26zmCg4YTJ3J
	aEBP3xx+24biRA8g7d4=; b=e3SxdEh0gDpU6yvFyLiqUqbzbes9FGIhbT4bkFQx
	fMIeMHr6gYnLHCeF01oujCjTjL33vBreqhl8viou8Xe+uY0A9pXxNzuo06w87C0f
	XdNrKrpc6SWaJBYdU07k84CnS37e/n7Ne/ja2dz+wMAQh8T8Pw5pxTcPDkQvFmhh
	Y8WwR+mkV8vi1v1LJq6iZxPi5Az/SjxontYJz04vId/J2oyOBBhJ3729p2yoFDvW
	CNyS2fEu31KMpYxsekXnFbA4btzdNvmc+LP/WUeHs96r/s3s0vslX+8+BAqpofCc
	qJgqdDvXgCqiq4AMqK99O9T8FKkJsNhyWhbZZm1jxLwVNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acygm9fcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:50:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb7c81e0fso12367261cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 19:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763005831; x=1763610631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vvTqxjY0uLJN26zmCg4YTJ3JaEBP3xx+24biRA8g7d4=;
        b=ZDj5KVIiURJVlbfBQsktV96eiPcO2PrlEBb/MvcV4UPoIUlg/jUVbpDrQfC01tLFsY
         VQTx4U7MB4KYqCMrfmy810Ub49QjUao85WC+H1JJss9MEqJtvP4c18mQ0hVNkdZn/v/j
         dDyT3S8K+690M/UjVsQJCvILxluH69ghrOhi2v8zOzG6BOEvD3tL7NISLiUrt6OHnoTG
         4u4aAhJJm7p62q1r1eWbOnydXkFGVnf8yAylNH8jxP/SW6YelZgQCdZBCvOzR1nkzFLE
         E4qiWHa8tP3LmzC/gmlky8HoIpI796ekCsXmB1E8NxkdRGyWjRVLrqzBn82Oh1culwq8
         zXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763005831; x=1763610631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvTqxjY0uLJN26zmCg4YTJ3JaEBP3xx+24biRA8g7d4=;
        b=nEAMbxZimGqrONNzN3ezAgpJylhmRkv727Akw6XDijxpmaelc20Lp+SuUIqaN/lgpo
         4uFvABXgpuIkCVJ8iHt4egK7mkdCxqdSc4a+y4s29Ap1jRJ26aFm4lEUNuOFddOU1x9g
         xjJJ3VBGsTW32lM8BE8OGqZbLXqIu4QyFuQofSKsyIUB9lXi8JKPlswkFT670q5VCt+n
         0CA6NUqo5XUoZSlXPItSN0C/SMEqdLZKXWZPn7nKX9LtUZwE8hFnu7xD6kqci/KnM3fp
         C1Evk1NKLHZtWW61LhkDNsutRHWO36WhPL5wjOAgbia72ZSIvgcPnmOCbYkvbHGVuwD3
         mcWA==
X-Forwarded-Encrypted: i=1; AJvYcCWQgVmmPEfeNMbxMONMON+pWjPEzUD1JMp6uEswCB1ayBFAJDl6CPIBDe2HAJozkJKhH3NL/nnsGhuRlYli@vger.kernel.org
X-Gm-Message-State: AOJu0YzafGRZMOx//QKe752ENJPHsF3kS82/fDyuovv5B1ODC18qnNUk
	VgmzkruYJ1c6Gjx1fSV7r2Rt1nKCFUwyvg5eFjrtzX+a81dCcVevawK+zEj/sQzUAWQ06nRmwTk
	wLVwn97qAjKGj9d/HalCsXO6vZnoIMb629aSxGqIlGDaUku4xEjha2YMcZ5xCkhIx/CVX
X-Gm-Gg: ASbGnctfce6ohWivPLBuZ6guxCQTetQK+bG8Y28H1Qsjr2aNbDZkbjxgLm0amWhjNnF
	dEKPRkwxDa1kVfm1oLHZmrjj9ME0qL71JnSwFSqCdt+ScrcnD7JT9OgS9+4/jkO2VXMlWl2JSA1
	eLmpKCx1kR/38XwlO6necwTI8oCV+G+6NtwzGDDbVt2rFyX6F48fRHQGBwyAdFqn9Whzm1ySfqX
	76HcgHMMo52QNq9TdezmBaTbK6TetGG9MNrsSC15lDAtBv6aUoqqkShrORbUrc5HI6bTnG2sdCT
	9HoV6wbbysJrg26qBVFx83JbwQqXa7vN0o2ZKD9brjMztk4Co3Jt3eyPb1u02x8Lbli6VjHdnTk
	9voSfJLnqBVUkgoZhdBQXvYRUfT1VruY8zntETRd4WXSkke7Bvs4qHO9dU4XiYW007g1NsZESkb
	fX5ZegjjKjpSwO
X-Received: by 2002:a05:622a:130d:b0:4ed:6032:f644 with SMTP id d75a77b69052e-4eddbe5441cmr73815711cf.79.1763005830914;
        Wed, 12 Nov 2025 19:50:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAdMc9Ms5ogZyKy+9znvlX5hIpbU9lzUUxY9/KHe0/crxn4EPl2IH8EBglGLkj0bpwcY8HrA==
X-Received: by 2002:a05:622a:130d:b0:4ed:6032:f644 with SMTP id d75a77b69052e-4eddbe5441cmr73815491cf.79.1763005830480;
        Wed, 12 Nov 2025 19:50:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804057b0sm123940e87.85.2025.11.12.19.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 19:50:29 -0800 (PST)
Date: Thu, 13 Nov 2025 05:50:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Message-ID: <knfknl26as6becjwg2noedxklty65i6bdixx4vxwusyswppdsk@vstzkn5xivnv>
References: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
 <20251112-sm8750-display-dts-v2-2-d1567c583821@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-sm8750-display-dts-v2-2-d1567c583821@linaro.org>
X-Proofpoint-GUID: r2TqKd9IiDDsd546x8Hr1odNPEOuw1ht
X-Authority-Analysis: v=2.4 cv=E/fAZKdl c=1 sm=1 tr=0 ts=69155587 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZB6lwbF0aVbjLvXVTRgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: r2TqKd9IiDDsd546x8Hr1odNPEOuw1ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMyBTYWx0ZWRfX7JlG4S+KelHm
 bXxeLJtLS7biH+sjEQ6oQjcYYseO2fNC3BcuZwNGCkPDIMH9Hq3lN5HUYdRPiOwUcNDpzGucb8x
 pxF4czoVKavKso2QGilHNMS81HUajbIR0K6r7uuumAZyqvD2Tq1iiFFlIWQIUuOBQqDcV+tiDn2
 nU7IRIABU8XTbcDHq8KIcv+6DYV8pWPEW6zGc8sLY1YsMsylDSwWXaq5wnaqL5EcqrnEi+Aenjo
 o1rDb9JHey/e8KnuUczpIW+myrwf0xWhAPTQ2ng/Ysol0tw3DrgPsNDLHTuvtOW92dK/OdfKtTl
 1IySZMHUNV1ani5wVjaI9crHArYO4YsmUR2lJPO2eSkkcL5lI+84ieeu3y3BG+B+vTmOoUcqk+3
 l7cU5GyydRrjZkOT4uIOG5vFxgeLeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130023

On Wed, Nov 12, 2025 at 04:02:39PM +0100, Krzysztof Kozlowski wrote:
> Enable display on MTP8750 board with Novatek NT37801 panel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 70 +++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index c8cb521b4c26..68644eccdbff 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -933,6 +933,48 @@ &lpass_vamacro {
>  	qcom,dmic-sample-rate = <4800000>;
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "novatek,nt37801";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
> +
> +		vddio-supply = <&vreg_l12b_1p8>;
> +		vci-supply = <&vreg_l13b_3p0>;
> +		vdd-supply = <&vreg_l11b_1p0>;
> +
> +		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
> +		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;

Nit: Is the VSYNC pin a pinctrl for the panel? I think it's a pin used
by DSI controller or by the DPU.

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

