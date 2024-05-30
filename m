Return-Path: <linux-arm-msm+bounces-21182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B24EE8D5699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48ADCB25FBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE271836FE;
	Thu, 30 May 2024 23:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/J2OtCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8644318399A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113179; cv=none; b=cXO2HVy2QmVxcyh2ZMVDLYuVWq2Vac2gvAvp1O3iRK/q99JH3WcxraFJ8MKeubIjpUDlp4yXviRfVzYHYmWaY//JZGUvGDC1vgT69ISopKTQ01rR6oBPjIEBz/hsEzXR13nzq4jrEH3yfymc86ETEZnt/ZWEMFVPfDpxHdlFc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113179; c=relaxed/simple;
	bh=WNi3/u+gM5pv6zM5jVlqhRZxACAWD8ZrWuKPrDlprgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvNQI+ixu0AapOagl9DpYY9mhsUGaRn1+G2hOSVKcnhMSJt3MqGYpexKgFeuviODiP10oCXZWicNuUIEWKFZj8+D4AnI3bAr1+fbZzj1uTRk9pZlDYFRGWaj6aj0eydKiGSlkL3S236GXXfnlxGYP1FjLvlXiLd3a1QCGwcwRhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O/J2OtCG; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ea80a18094so15604821fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717113176; x=1717717976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8Onul56fdb6n0dzoriel8Ce/xm1MXtP6/fgkQgktDA=;
        b=O/J2OtCGveo9fnzLJqr3b/FzzekNaBHLo6wwTmd9oBl/3Hgw0cze6xS3Wc04luiGIK
         +HfzsTUJ/P5oyaug3ZnQhQYgiE6awWIV6XPHlJSYUiWZShUQxXeV2GpqkIhdUA1b/OBd
         mGar0Nr6oaOq1v3ZQnqCDX0gC4/4Jbz7A9dOdjFD/BWyHLH1eMDtgliFg0JXBKxFsrwP
         G0msgI2lVXmebfuekITNGtQqjp2kZYOloZXw7+CbElajhvxdOc50eK2/FCl8DyI6pVM/
         OMYtT7EsPiy+ECQWk6pZJ7X5BkggfthXJxBsF+fPPVXewmiKvuvpuYHE/cGXeTyLKVUp
         fr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113176; x=1717717976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8Onul56fdb6n0dzoriel8Ce/xm1MXtP6/fgkQgktDA=;
        b=h5BgnfC+LxxPEsq8kFtROOU+kzCo/ipIEHQo78yIcxhK/I0LB+6LQC0/uLo3neLEKi
         Iok0i4w5ZgN+LZTsxS+wrd5B4IaoTlWx5PEWXE0hJOmQ4r6OupVi5jJeL3SW3E6Mx6rk
         gb2uzNhXEXjvgX7FOl/T622tMl+EmOIHLckOkY5WSCxYS2uQOwIC/xHwufobclCe6pwY
         noEbnpGP66HktZd09bAgFT3xBnsRTO97CgQyl9WzZbhUhSu/KZTIN7yekI7BmQk5sSOw
         YnGKd5T8omHzi3+Ujmck11cIojhvWhOC+5Fqddw9YYdu7dfcN4mtRIxHLDPxrPB+frhu
         ALow==
X-Forwarded-Encrypted: i=1; AJvYcCWv2WUZ6PDZKGuynOxr/4Q5Zx5QpE0/iHSSZkofVtZSQ6dEUy2rkZselJaTD1PTU6Sof8XLH4he6TiJ5KXb1n6Ig1eoI3VMBFF3BmEv/A==
X-Gm-Message-State: AOJu0Ywfdd9Q0RUooqfpeG3TlktHhscr2M2/raytndCyRT8WBektvzmc
	+mqeY1v2+wGx5hwIBLuem/K/VBSeiRrsC5KFnBwZfZJ1QW+ANtrQj05C0z5a8gs=
X-Google-Smtp-Source: AGHT+IGgIbHLys+nEyhuOKfKkVv/+ts5JGNIzMvJ115J+XAc/x5LXoHO5tA6f50AF+HVPtmyaWWr2A==
X-Received: by 2002:a2e:be10:0:b0:2e2:1dd3:c521 with SMTP id 38308e7fff4ca-2ea84c0cae9mr11073341fa.1.1717113175631;
        Thu, 30 May 2024 16:52:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bb4a82sm1202081fa.43.2024.05.30.16.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:52:55 -0700 (PDT)
Date: Fri, 31 May 2024 02:52:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100-qcp: Fix the PHY
 regulator for PCIe 6a
Message-ID: <d3vdxydqllegve2zf46o4ubnfytgfpnkls27i7jq57vq3bxwht@luvuw3wprcie>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
 <20240530-x1e80100-dts-pcie6a-v1-2-ee17a9939ba5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-2-ee17a9939ba5@linaro.org>

On Thu, May 30, 2024 at 06:43:40PM +0300, Abel Vesa wrote:
> The actual PHY regulator is L1d instead of L3j, so fix it accordingly.
> 
> Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

