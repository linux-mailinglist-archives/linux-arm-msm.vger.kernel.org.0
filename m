Return-Path: <linux-arm-msm+bounces-38687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D65509D51AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 18:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BDE428218F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 17:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5B01B86CF;
	Thu, 21 Nov 2024 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCE6hxrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DDB10A3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209824; cv=none; b=TaCXc3O+khrP9czVYZVOcuH9sGZiFifroovRidsYTcUnwu6OnOi1PIDx4ARR74lAHml+wUBHlBy8LDIPoslHfVGmuH9Xj/k5v0v1OGC499Qj776FN+5LESOkG0EUxMXgcLNEQWyGi5p7a4QS/dumr0zO+PTJidHgd4/fnGvKbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209824; c=relaxed/simple;
	bh=iBNhjFCDpKRTQH2Pa9QqQQCjVzMOzhs91G1qfusImRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWhwdGLrZ3WIFbeX3Pt3VRQjlJs4eTtef2AuEScNxTj4Kidpel0K8z/pMoDIHtaRHEELCb0BgQIQ2Y/SD44ZnJ/bmvDv1DQF6AOBEFGSn4TEuD8CPr7lCFgGRxkFNVEGsukm0OPfPmiNNEr/BLG6C28WY0jIx7jouyJ8zj7MoX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCE6hxrE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso1126512e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 09:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732209820; x=1732814620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Bx9m0NYVTC3ArzZdszszzOV9nbuxX3SN1ILoUcGqLA=;
        b=nCE6hxrEJW4ie8c/ZuhZa5GIS/1hxxZrH+bKbAJjAc3BDDJYVnRiissYoR8D5SDZbq
         it/VywnN7lhMZ7IZiXdueCC36ezFM2jeHmekn84i9PnaxIi+2MSceJ1b6Heh50LrYNi8
         pb9awfTx0bbcGGGlaiqTvEKku2NkNW87BaC3fM4qraMjs+mELm4T8RfUtvmd2TNAJjAA
         uhtNSuN5dyjTwE8nqU0+naj3+LLfUoDVX0GwWRQIcHjYYY2JN3nOv5n6sRqPDRExNTd+
         pw2+/aKimCAH42Aw4uHZiaeUZsnrqS3LcTS5/Qss8hO43Yg/Jycd/BW4Z/fxPrIrv1nb
         oQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732209820; x=1732814620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bx9m0NYVTC3ArzZdszszzOV9nbuxX3SN1ILoUcGqLA=;
        b=JypBnvFSATgeDbxFAKMhO02pVIbJOV8iiiPI0vSNBDPtZO5mMchOFSoHYwcnaJSEBM
         04zPeuHEgDU5fAYDNfxR8sxWHEOdJ8WXHQ7kPKQiduWbGG+TKxMfMkYXg6POFH+2mTPd
         +Pk3NlMWbTZUNhZJaFhhB8Y90k2TU6ktIcU1pYIKU6La86Jp60XkDafD5iujISpScCL1
         sViXcnWUVrtKk0aqjRzCZ2PesxlcOwkcFWeylFNrG4ZOAzWuP5TTpPoZkzmMHzseS7Ss
         fY7nn+ZNZ3opmz4teFLlWp9cf1hU8FB6oDIwmsDFbMejQ2c7+H2vYHJo4rZYvYE0pfBa
         /tLw==
X-Forwarded-Encrypted: i=1; AJvYcCWTWCt3gCl1zNw2AoSvkNKYt0cMVIxeH2z5rJM57V8h3DUFhOm7R9yAK1DCLHK1IfUjn9yANtvPK+V7w+YJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdxn/2JBbGRCAqx79JIzyeHMzYBO8KhjEK3iakHzz+K5sjsmHn
	9soIbIS4EUyLrCHcF85j7RUJH/bwJXelAUb1GheI0Cd3+hRZki8hkg8QaeuJrH8=
X-Gm-Gg: ASbGncuGRwRBFvT+vYndqhxl8X5ondyjMHvkhy7oWvEIvZw0pYTQ15sH/IKezfuatLU
	fmFY105CchlnVZSg0w7DBnqcN6Abl91SAwxtEi/DBEboJZzJIcoJRTJfXEg4whDbxt2I7C4RnJl
	my3fsm41DQGRYwMfgYi2H+5qgu2J55jpjzh5ITCcUznRd6V1Y4RKkwSGfnGhqcml7GxY7uEF6gs
	vAVCW2ZvkXlO7EoTGAoBJFVZ4qnTuIULqauoKVHzWh4WzzsmnuWZ5TEHVNMZUmPYlMbaYTG3WQc
	fs6nktJ/qibjoeqpgg/Y+Kh76Xwmvw==
X-Google-Smtp-Source: AGHT+IH/XSj++10aoySNlzzQLcgiL+7za6dnX0DKLcp3Sj+liy95mgnkIbfDUPV9rEtzoScDC0W0JQ==
X-Received: by 2002:ac2:4c38:0:b0:536:53a9:96d5 with SMTP id 2adb3069b0e04-53dc132df6dmr3274397e87.17.1732209820394;
        Thu, 21 Nov 2024 09:23:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2497f04sm20981e87.254.2024.11.21.09.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:23:40 -0800 (PST)
Date: Thu, 21 Nov 2024 19:23:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable Primary USB controller
 on QCS615 Ride
Message-ID: <nt366bsajm4vci6p76qj5bdzcfyutykc5yykkifajzpqnsucwb@lpotlu2ihocc>
References: <20241121063007.2737908-1-quic_kriskura@quicinc.com>
 <20241121063007.2737908-3-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121063007.2737908-3-quic_kriskura@quicinc.com>

On Thu, Nov 21, 2024 at 12:00:07PM +0530, Krishna Kurapati wrote:
> Enable primary USB controller on QCS615 Ride platform. The primary USB
> controller is made "peripheral", as this is intended to be connected to
> a host for debugging use cases.
> 
> For using the controller in host mode, changing the dr_mode and adding
> appropriate pinctrl nodes to provide vbus would be sufficient.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

