Return-Path: <linux-arm-msm+bounces-34885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F389A36FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BA0F1F22F42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799AC18755C;
	Fri, 18 Oct 2024 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXBNxpwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A507186284;
	Fri, 18 Oct 2024 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236088; cv=none; b=lStNj+IP/6dLnDotf/dWBMrXosYrAbuTHeDkAXPNRmptnYYUFV02MX+aSNbTGHVqgWQzPM+ZjbVKYwUnD21KnC6yYR1n8duHIJBb0DaxKRSyOhSTEI7WTg1WH51EARHFlVGDzZHjj6+FqwXUyCT+kroORwQQDDhTqAqWTP95D+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236088; c=relaxed/simple;
	bh=gjhO2fB4TN7F/i0LDb8ZvEwTCFrjhrrk/Q2kozKnmMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFy1e1EWSjzr8V/+mE7C5zPf3TWihZL6PhCpGHFOYJc/r9XmCsVC6TcrgwVFEWeMPG+3KT4joJDthODwr8HA/UerJF+8jj1PKuCR3BTvVVocA/UKs0CzCw91tEXCVdtFsxqbvLH6cYbVqnV2w+HGw+9qVEZxB4C7JfaIqOB0ukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXBNxpwi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0003C4CEC3;
	Fri, 18 Oct 2024 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729236087;
	bh=gjhO2fB4TN7F/i0LDb8ZvEwTCFrjhrrk/Q2kozKnmMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXBNxpwiIieoRgLIqpXdCdV9gHoUYIgPfRveR5QyrXxiPe2Yd2pEUZfTRbgYtJeas
	 PFELF97cXHpDPeY2f7rpJs2KM7cCPy+8W3SvESoVyoeJTlY67WQHBPcJWJjt4SSDjM
	 mn/RUQjmYfgEaIy/GJOQEtbUuHikZds/PqFsrr0XgLZvnKULx22YKeUTu7uqnuJQQi
	 xlBHcBmKKlsVjT/3vrQlgL7qal/uAjveg2w24YxSV74WPEHms/amCReCd1l8ThdiBW
	 lJ6fZQd44TqY8f3rizON6+CbyBWrcyM8tk7sEJgxejARGOJmEe586EKmbGFP5v7Yyp
	 9q5KJ8s06iPAA==
Date: Fri, 18 Oct 2024 09:21:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: Add SAR2130P compatible
Message-ID: <shzy24hayj6ee72pwc5lxk7yflzawx5f3uaqql4fwb55idbxci@qgi2fr7pvb5m>
References: <20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org>

On Thu, Oct 17, 2024 at 09:16:38PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the Synopsys DWC3 USB Controller on SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


