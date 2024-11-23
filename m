Return-Path: <linux-arm-msm+bounces-38926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EE9D6A29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70372161835
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308502BD04;
	Sat, 23 Nov 2024 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTRv2N5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB017C2;
	Sat, 23 Nov 2024 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379603; cv=none; b=Q7Hd7JT6kEGZL7SJEceq/xx4WwTAaivaYfc/Q4JQeL8mgKhYwMQUFjU0e9HcQBWTqCRY5PYEq/POPBDlqGGGCCB1bNHP+v7B9ZhR3eAs78YfC/N6MP9iIgaja2hMtWg5qUXdG2Dhh/8Sh9v8igb4a0ibZEdkv9YFlr/ClWF6soM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379603; c=relaxed/simple;
	bh=jtPaC/8V83pmoo1oI3ijzttqC3sYVafXEh2XKPi5yfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTM4pV3m+pKWtC+PWswQ7+2MmiVz/knJwGgUYAgnsenx5t6eXaCZZ5BKhVf86Ne8H9o3a63Ba7mSoIWy5XpJo5vAvwHMf6Nh/6nsvrCf+bBBmEhFfKDXkSkd6k4KOazkmf+nSx/MMV08g9CzSMN9TJqOWIA0IZdwZXKzy4WPxtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTRv2N5J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C906CC4CECD;
	Sat, 23 Nov 2024 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379602;
	bh=jtPaC/8V83pmoo1oI3ijzttqC3sYVafXEh2XKPi5yfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTRv2N5JqwcFG9f1tFHGlmYgoPRmipvpGqC3nYE1pCLWCkjS93krGA5KbsHYlEaBT
	 Ek5MxsgfBDbBe2PRbuhBV7PLeLjqFF4zq2g0iva3v31JuIRjcuFq8rz4loNPzIuo4Z
	 qf8OVBM8VnshsF3yus+mJoOe3mnHUz4JcP1qWRsLvvVpOOfZRB+TPD8AOZSdXEbQNV
	 95CmPxi3MYkyTaZMVX3vbvaW8IN8IhUiG66BV3CzFs1xVHBpTfcnpHVx9XcM80PsWn
	 wUyXlNF7yFHzSQKBDMiL+TFraxbK/mQj5W/19Mf2HAP+nQj7ibnztD1jDHhxCNzDnt
	 2MYUrD7z40Ftw==
Date: Sat, 23 Nov 2024 17:33:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
Message-ID: <domsicrb6edzobtqhc4ql5guaz6rphc654ugp34ulhuuy3hmwr@x5ievo575wnj>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-1-a0bff8576024@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241123-asus_qcom_display-v2-1-a0bff8576024@hotmail.com>

On Sat, Nov 23, 2024 at 01:58:53PM +0100, Maud Spierings wrote:
> The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
> It is similar to the ATNA33xc20 except it is larger
> and has a different resolution.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


