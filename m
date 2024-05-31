Return-Path: <linux-arm-msm+bounces-21246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF78D5F4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2A8B1F2411A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC1615098A;
	Fri, 31 May 2024 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj65dYsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE8142E90
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150260; cv=none; b=Uq43gb4QhKQ7ftHl++FmNyE5a3O5kTq6nvLgSzp3N+DbqObxZqMG9WrjKQ93/njTNQvRmwKdr1XuKT0csZXmr7b9+zkK0xLAeyj0uPQh+N/dSHlfPlwMN/aFmTPkmkVVEhiwP/ZjfdaJC5M/IOYOxIPwbXw1AevkHt7YyiJLYQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150260; c=relaxed/simple;
	bh=tnRD7sL9e/kA8XGuXCsaCtTyUUayesmk1ggXHAKXSkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrEJ80IvsmTwXqHrfxaAPxGRVGc9f5yrq7ihq6cAITz4QV/CJFWFY2XbBz8Hpmn11CzSBHyLRec548qXnhx6lbEqd9+pUWjtUQAkRMoroSsoJ6SR4uTKlH9eE3EteN/XZMe1lTNI8Q/pPf8q8mC/4fkWis1ESmH5Dk3ReRwdJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj65dYsm; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ea9afcb22aso1455261fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717150256; x=1717755056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EV11PW9DzxNQQ9z9HVdv2A7IUH6ENmQkq+xllevX5g4=;
        b=Uj65dYsm8x7E9KDiZgCNWkbeWgvatir0FTHH0GhGUg5hxpBRyXgEIOjggHuYgLzXmW
         JQHDggYTOEy33vIZDlvvpN6rIWdPDZDB00zAwpg8a98NodRBteLxF+NDWOMN0oa3F9mF
         VFL44gMHM/02Pg5fe8Tl3+AceeQNYV8s/0y9EH1JbgUOnFtwiAx6+MYCMjAayDqCJyK+
         3gfMqpD1vRn9VtRKnQEBP1w9XngB2fFgZGVtsAf7EUVWEIR7WmkCtu3aZQsEmiogN7oF
         2DQFklb5oCH8gbTKYDH6mmqt8XoYl9ciwyrkqEpUJDCcRo8nleDRmOZ1d7wPPHvP6J3p
         6ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150256; x=1717755056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EV11PW9DzxNQQ9z9HVdv2A7IUH6ENmQkq+xllevX5g4=;
        b=p+9OeSohrKwqFr3iHkAZFvlXDV2VFYhOM4VCV1MYHD85h6gY/z/8D38VBJC8Pp2Sqt
         C6UECrqlC5dxb4ID3DfUH7uceXYH81yT7kAAGgjS+Tu012SH4OZKeY05MZJeeFGcVTKL
         f7GU23gPRELU+gYRavTo7CivmJoLtc07cOkdHruE50huQc1XayI0+i28CXMjUSsSa0Ql
         gAUE8A9YX6yCnhH/LtN9RlQpYK0QZjJwCoJpP3F3YatuoMp09wwViKk10Isc+cKUQXLq
         cG3SApni7lHLhG5IYvDUEM7xYUgwoxwvwzKhF9peMkYuFyonr98TT8xuA7jHAXPTlMZ+
         X1qw==
X-Forwarded-Encrypted: i=1; AJvYcCWXs0yzZgKophWF5u86aoHGF/b9FL+DxlR3m988yOKc/iXRdNEPcyGiPdyQAI6UgSIWFwSf12miSmiTkeFLtd/neUlpZC3czUgxPbppdA==
X-Gm-Message-State: AOJu0YwktAKM8FuW9BYjVnj8Pvcr+cNE2VEBGbCfxbFMpMIoYLSZSE+K
	YlA4Mo+P1krTmU4yytoIFckjTouPub2NRXgbGDv4DERWMp2YEr/MPDoC8ybEgVY=
X-Google-Smtp-Source: AGHT+IFwjLSq1dXXqxotR6iHo+8QNGAtdre+h/pLfoYmjU3NH6ag4dyD7Am7zOIX7WhJBsQ7bdeVuw==
X-Received: by 2002:a2e:b619:0:b0:2e9:714a:ef43 with SMTP id 38308e7fff4ca-2ea950c7ff6mr9040081fa.8.1717150256149;
        Fri, 31 May 2024 03:10:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9db52sm2596171fa.26.2024.05.31.03.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:10:55 -0700 (PDT)
Date: Fri, 31 May 2024 13:10:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kbajaj@quicinc.com, 
	kernel@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info
 region
Message-ID: <zbpb2cldfo7lcenqipkdyzgp3hmtsucebf45by2yb7r26uq7uu@uyypbs7ri5pc>
References: <20240531093531.238075-1-quic_tengfan@quicinc.com>
 <20240531093531.238075-3-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531093531.238075-3-quic_tengfan@quicinc.com>

On Fri, May 31, 2024 at 05:35:31PM +0800, Tengfei Fan wrote:
> Add a simple-mfd representing IMEM on SA8775p and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

