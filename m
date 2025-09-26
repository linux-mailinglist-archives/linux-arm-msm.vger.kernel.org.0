Return-Path: <linux-arm-msm+bounces-75324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C2BA3FAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD843AAF35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18AD11CA0;
	Fri, 26 Sep 2025 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6lo/YR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDBE1C860B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894838; cv=none; b=cCfdofWJcdEUcSASrj1l5VOUrJNpAB34SGHF5cUQBYn9UJU767lszUtfr4rAo2LOoKqLbxInSZuAvMCx1CW3bCLhPcn6N6jk6mC/WJi7yxJqEfITm4x2riHWVofSF19hNuFpRSd3B8eqNoHZbA+Ih64ihAteByCH8Xrw20PM/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894838; c=relaxed/simple;
	bh=Yxg7XGt5rPC+H81WWueLAVNGB2r99E4KrZvcInmqOII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVv0YpPpR0gycdlFdcMSk/eBT87cptaDYaHb2eyPVCcZ1BqbZ1AJTUxxHTIWsh08PjzBkyR07san0CXOMlcvwfAHClZ8f0eD4sQs64qB0nTtnFFFfjx59sLXPxvSNUjtk3/G9YQOoP3aXpHUtGYNAzOZuh4hj/Ht4l27cKzYxaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6lo/YR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8voeW029627
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yi4YzfqCRhtpYtMSpi4c2pxv
	l7JbhY/mvPEjH/nHU/A=; b=Q6lo/YR9Xww7cyAqG2tiisx9896ylw2lmlhsi1kw
	ohTR9fLm5V8++Jwg6DlKftwyxU8ebwyPmtw3soLo+vY4/F9ttxvcrhDtHQNxZ2zY
	nbsGvln+/gULtI4PVzp+1z1xvWszL4ArwaJhGIUSWfkhjZAvyEloNWQ0bXyvoF1F
	p1+byedn7jC34PreGn9bOlTEB7B6jNgKG1/D7nuBuhNbwUxKtz00Qp/5gplFufs5
	z8aApQK0vHd7+PtPeKCTAKwjEX4rXbLvb4Yl3sIlnJuMdLNJQPnTowtr5VoJxVEa
	bKXXNrTASPK+FmJZNFw9VXEY7nQ5LNP0umsD/SUtD6VNcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db323186-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:53:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso49400041cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894835; x=1759499635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi4YzfqCRhtpYtMSpi4c2pxvl7JbhY/mvPEjH/nHU/A=;
        b=fNBvem55kGY076weSfdVoMLYXhPbqvEt/aZpzl9tnrcOMshT31Z+pe0iYr2s/BswLh
         pm35f5/W+edXnwtj2/qP4Fb4tkuaaAdU1xZ8/mj2Lb1STFyZAyCIqrtwGrvkmtocwb+N
         BuQELi+1sb9tvKOXvxloI6uwndHbPiS7tRjL+8S+uVGMvDsGSGYhoOLWPtLPekM717jj
         IULu9iusz3MnXyrK+RZkBJj5mWe5w4LBNJF7Nmx3wOr7Vh4Txvr6t6mXz2P1l7wyO9Fg
         zrjvaDP1trcn3iq2bf2aL9rHd8E+zjSJ2Wfm5QQpZHrSF3UUUMJuaXxQPWi4O7OyJk/9
         8P2w==
X-Forwarded-Encrypted: i=1; AJvYcCUxtvcVORovDc3oGEG2XGFoUBvfsjRZhCfxyeU496X3hZLVs1g84Jv7plowzbPYdxJ1O8uwbncGxrMYbjJw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/MquELZZVDES2J6IjvFNz5VqbJgdHHFYpYO0Rkeb344dz+eDi
	mxZiyIGx+FGNeiZTV03snNMT2g5/M7EzFpbIVZIrbcnpxyVlTBmhUj3Mu6Z6GY5iCwmWSUVq7k0
	1MLECgP2OnjAUOCNU4+wVM1r6+JYfDZiMrcAATB7Q7/JjIpNef8gzdtOYy8nOMqF6XNJN
X-Gm-Gg: ASbGncvbHmkvJ4gltya2Ab2bt+zXiWIzJyjfXsrFmxh4Zwm/NHhYGIG8bhMDevl1luV
	rszAu35Z00UW+jzKP+x6nmp7eTmJ89yHxbNbFHHsH0llF6CcaYPJgzwAcHbCLetEnsXI3WCpfkB
	dX8A5h7yXz7Ey0gI+iQWImro01xhxvteVG3khKiW4/NhIxn3eHB8mXlzkEbnYoSihNKId4IPwR3
	9NeijujN/L1npFWlMCahZy2Icj4G1I+WCZ0pdHU0zJIMrBOm2mWzL91fCd2BG4AAXVdCSHEaWDG
	4j/SHny6tFvsAa9Vt2di+dEQRWTTq9ttGyO8AoaX0jzSuUqVwJeebwnjxsFKZT7fZQ7UTEAFkhh
	Jfg2qYJtMzqUuOB5Nzt5sBPs6vhxNGtVZMcysn3ZaVKoOHQ5ZUyrX
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id d75a77b69052e-4da4b1406e7mr95494441cf.47.1758894834810;
        Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOQIkyN74txiM9v6NI3108EID0DXdgO7j0P2wRzxlXTBsHtrmHH2UgL3y0BBRZ8yy0boNzTA==
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id d75a77b69052e-4da4b1406e7mr95493941cf.47.1758894834250;
        Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583173d1c08sm1814560e87.147.2025.09.26.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:53:53 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d69af4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=bQGRJ9mVl6_deHTFyO4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HTNi7KDN_qWXhmBvYtBdxC7aEVkJlSkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX8F3VtJUj0rOU
 d9xJnDta3hso2rmF5k+PVjvuAMmlexrIuhoqvkKIMl3fJEbpjHoSYlNJF2trkErknMaLy3lL0Br
 7dLF4ZpDXPRraZ6QzP2apkg8NkqenLJ6CNNfjFUFEg/8UPi5YQyoMa8TuVgcQ239h7xY8pL6q4P
 3Q1Ag8XGc1iJpzAL06aT3F3YPR0iJ4QDqGuM/bNB64QcO4ROm/Sv8vqCwtcU5C0TxKzRSGj/kOM
 ANPegfIu1QKZvySTqI9zMIObq79fVCjr6WBwvCJGHratFCtUfejHXfp3+VpTEWJMqFhgtFcTk8O
 ajkcGRGIXGBWkc+kh+OUgl0SaZV1PioIzyKGAy5Ref9viojHoxlaIPECVfOrh8nMcrVPPCgqTJg
 C1Pk5cEU05kRK55ecx1DqSGtzwNo8Q==
X-Proofpoint-GUID: HTNi7KDN_qWXhmBvYtBdxC7aEVkJlSkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> This change enables display1 clock controller.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> index c69aa2f41ce2..d4436bc473ba 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&dispcc1 {
> +	status = "okay";

I think this one should be enabled by default. Unless Konrad or Bjorn
disagrees, please fix lemans.dtsi.

> +};
> +
>  &i2c11 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

