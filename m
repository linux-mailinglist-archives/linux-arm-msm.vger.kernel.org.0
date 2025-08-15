Return-Path: <linux-arm-msm+bounces-69414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BBB2882B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 00:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9183AF4E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 22:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA3525EF82;
	Fri, 15 Aug 2025 22:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQbe3/TI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EBD2153C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755295619; cv=none; b=hHQGegT3TNgM3rgs7JS/O8PYQFfc1D2uJLlovwU+GEEqfig75A1QQrf/wt/ReVhrV1V9nirApG9SJktgMwu2Pux5MYs4tCez4YVu0cbkRsowGMz6qr7pmi8ymcGnfjy8fai6d376W9yW6vcWl3esF0emsiOP/UycdgeX1Gba9J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755295619; c=relaxed/simple;
	bh=uNKzVkNJFpozNWtvy1jhRUT5jNUMWuz7qE+T0XvLyk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4bp3MjwybMpXfdX+bkpFjEGtBMIHO3XAc7Kt8zQELOUREwjULC7luyy+KpTo+z3iwhb95WptmR2ODCiyKsS2bKAlWHNPateJw778tWPy8BE/Ws4mlzeNChMJLxLwP8ZqZo8svcg3qCstRYD0kIVepwQc87xPkpy5F+U9rzD2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQbe3/TI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ07L018435
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VOBIKSyTfLYVpO5P26VZ5Tfy
	QvJf2A+s0orIIhlOTIw=; b=hQbe3/TIh+Lx92wl90eOtXPQKSM0HZOoEu4cJ4xR
	fpf8n/RoDtHl3iPO7262sn+6mMNyyJWrAju9JRRwXquA68rRhVLM4hGTy9x3IACn
	p5BGUOrJhGs7s82uXVo2hMh+8PsMKNrf47Vwmm9r0FNcSESzE7RfsNREJLu9iesa
	KpQbKBztmQDLZNuDJdwCaKpHgnrI3sX6oW4ETIHbKwe2X16d7u+njg9YlQphjDcY
	+WTPnGX+zhSySjSni3w7pcs78tkACQ3vrbBgD3CXXilaMxfKGQOlNhWyz6jsqrmN
	ajcIrilAo2hQtW69VBbWmpJCOPZkr6wPlWO0ahMo/s0JkA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9s0yqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:06:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f6346f8so48414556d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755295614; x=1755900414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOBIKSyTfLYVpO5P26VZ5TfyQvJf2A+s0orIIhlOTIw=;
        b=VHug+NFaSnuYsugLzrOI1ooAVL8FB1eap4de6P9SHJQ64JvULUzylp97cLRe/feu5L
         5f29Ea16pIvURpHZQ8KZek2wIp+hs0nNMrnnHQX/k9EhNGzJ9M+WcMPckNC4UF7+OSTr
         5OCWDG5QQLpzahQbr8WtkSgWmdnqJ36FesqDYZz0Of0+w/a2ZRKm1zfv5P2CHeSI3jqm
         Tq+MIKA40DOdEPAksdVPuSqxd4+OOXm4X8JMcqW8dto3I8c8IFj6mkq3doxVZnaTD0uI
         c6siXUnyw134ndszLxxqQrBbxIF7BzPxrKc9xBiubVj/fUMZb++gkLlamDs4+yhnxDil
         FKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQSzKCaKEWjr7hJyP4FZAJLcSwyaGKbcnNg7DB5ByqQnC/rd0gpjTx2+OiFmD/pPYBudS2kNl05O//fVYS@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+I1ng3A/mf0UqgNJBwchADSu3I/5j84n7erR8NVHz1rowmhD
	NZRPB+p664CH8CPSEF4ddYxD9mbYIOFiYiCd6wwXdYspRIId3f0dwsFwjHcYhefJzmq9fJNFKkv
	+daybS9Ox/+HEsPPpmLfmWXqJ4/fNgI4XYAV7Ti3ZN0pE/ghNmtrEZUkz/fo+sBJkSS43
X-Gm-Gg: ASbGncvrNDWgTLGYyiTB/iFqNDW/8YXTUI0P97x2ikCI1G9Kz8R99TnPfAyPmtB4pbM
	RLZeHf8bhzWMmLT8w2eRgRUnXGJO0ce/r1RK8UEnvnCsEzA/LocfXb2PNGt2u/ntUQwLunbCNmW
	Xv8EduQiLEULMJ/DlVXAbQWW/LGT8hF1OJyMEkSCgmY0yMlYJ7IppIC0jmhPpSuh3O09ys1tCth
	JylwII2ts68/cVd35hcjJ8+uhtT+yqZsV3Xo5IDVqXNB/JS3U3HsHdPckVqd30k4Ob21jyhaGG6
	LGBm24gSsHrNKoES9jfNwA6ipqi8N7H6C3S90UNaO15nHDYtQX2yBwGmUfPVNtVc+TS2xqsViWP
	HPM3BBly+nR5IaOb4HVUlZ7VR21HycX5DkKNEDhWZhMbYzUhti0Ra
X-Received: by 2002:ad4:5bca:0:b0:709:c997:a81c with SMTP id 6a1803df08f44-70ba7a9a7e9mr46893306d6.17.1755295613594;
        Fri, 15 Aug 2025 15:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9G6CXo1SoIyR7ep7jAxw2tGGksasdF1FtsJDXuZig6dOv6C+t0MATUifhC4YEo48+4WrwAA==
X-Received: by 2002:ad4:5bca:0:b0:709:c997:a81c with SMTP id 6a1803df08f44-70ba7a9a7e9mr46892696d6.17.1755295612991;
        Fri, 15 Aug 2025 15:06:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc6a3sm517416e87.102.2025.08.15.15.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 15:06:52 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:06:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add missing
 pinctrl for eDP HPD
Message-ID: <pmhy2ogyorelllgandehtzlen64tzegp5pc6fkg7al7xzjcb2h@lq4lpaaavr6j>
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
 <20250814-x1e80100-add-edp-hpd-v1-1-a52804db53f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-x1e80100-add-edp-hpd-v1-1-a52804db53f6@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX2bYqodow1BYX
 ktZrBJ967A/FcGyY5msrZLKmKsiUWOrARdB4TbctFCmvAuE41zMgYglYFNJyekGtF5Cy+A0NgDQ
 WKmznlrCH64FLji3eGfVAlm9HjN5VPtGxsHrw5tci5X0l/IDggIzxNg/GTuoNyUhKDoz1BPa11G
 VLhIr8MBSl9E3V2hnMdUNPZ0fWkUJL0bv57BkweLdKCZB5gLG/GBd0LlalMn6GtpMjKH8cQvcgB
 PBktNSGc6DeMNYuwwd97MUVqHPzaq7Qss1BWiLd+pXQZjMvLlN+W9fhTWJPbVFDu2LFFOP8pemO
 pbloULKKpL99BmEkiohY9YQOeMIlKmRd7zSFaAeDw0TNKi7SXgdIh17WquKY5loXNSDniUFHwsK
 h8pvqUMq
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689faf81 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=18jjl7SCHLW6QrnkuXEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _SAQShrSE9gHyuSyqI8p_rV8vR-goxn_
X-Proofpoint-GUID: _SAQShrSE9gHyuSyqI8p_rV8vR-goxn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On Thu, Aug 14, 2025 at 03:30:28PM +0200, Stephan Gerhold wrote:
> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
> 
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>  ...
> 
> Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> bias-disable according to the ACPI DSDT).
> 
> Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..613c675aac296f931293a1ba3d8506c6663bad21 100644
> --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> @@ -1001,6 +1001,9 @@ &mdss_dp1_out {
>  &mdss_dp3 {
>  	/delete-property/ #sound-dai-cells;
>  
> +	pinctrl-0 = <&edp_hpd_default>;
> +	pinctrl-names = "default";
> +
>  	status = "okay";
>  
>  	aux-bus {
> @@ -1236,6 +1239,12 @@ cam_indicator_en: cam-indicator-en-state {
>  		bias-disable;
>  	};
>  
> +	edp_hpd_default: edp-hpd-default-state {
> +		pins = "gpio119";
> +		function = "edp0_hot";
> +		bias-disable;
> +	};

I think this is common enough. Let's maybe push this into the SoC dtsi
instead of copying it to all devices?

> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio70";
>  		function = "gpio";
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

