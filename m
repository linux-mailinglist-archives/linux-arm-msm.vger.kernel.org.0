Return-Path: <linux-arm-msm+bounces-27190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF493EC6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B281F257F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F33E1459EC;
	Mon, 29 Jul 2024 03:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds3zqQjK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06261145320;
	Mon, 29 Jul 2024 03:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225550; cv=none; b=i9upnrumTVSegdu+cKRApu3fa6BYToOXRlx0vuwrVlLWGNbI5tMzQxyazuFe7lh+i0pPRdG8NQ0CU/jBIU19gO0l0sWUJdwBxAsiQM7OrcnDYdauVekleijjpkOcJPFN1wIfI+l1Ta+S1/zdXFQq2xggTRHlql7SJY0jcLah9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225550; c=relaxed/simple;
	bh=QsVvXcCHZNxRL5RZ+daszDVZggo7dXOXTjWKQdt6jS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbOhgnReUqkziT0yvmCSq2bI86Ymjkwr3wtTydiq6GG+C6aQtC9XDcptKSGcBYihxROd8JqlLZQUHMvposuy8ZlKpXlH9WqKDGCh2B5KNcgQQxCtLeWSq+Yz/FuS+FrZrcVrCvHILYT/tRY4g+WL8a8zs/h8YDH53/ceIw1eCSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds3zqQjK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF64C4AF17;
	Mon, 29 Jul 2024 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225549;
	bh=QsVvXcCHZNxRL5RZ+daszDVZggo7dXOXTjWKQdt6jS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ds3zqQjKqBKvrRLcqOQAe2iquzCNVOs+0nThdoYtAy4k6LWNOKLD9eAHWjqdxyxLu
	 c74LY8FmWMn02L2HoLIZ0qke4JmViAZfraKZAvIGwllLtoC2JPKQJpdBdlJDef3YvV
	 b3DxAnc5GxNgwRHFEcwTfURNax9FtB3V8RCg3P/vqiv+9fIYHOEpuyv2mI1OXTZrxl
	 dDp8WcguJ/4/swTodSAAzmPFAVccxfOVMI0ayJ4kl11+pf2BGRIXIsOOfHvmG9M9OG
	 n+/xDCffsMrVs8tpjVLw8YBSy6aU+MNPciqTh8z89Tby2gQn3SzNgLujJVHxn+VdgY
	 KUlrX/VUDhlKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] drm/panel: atna33xc20: Fix the Samsung ATNA45AF01 panel
Date: Sun, 28 Jul 2024 22:58:34 -0500
Message-ID: <172222551304.175430.2591366335166834304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Jul 2024 14:15:36 +0200, Stephan Gerhold wrote:
> The backlight of the Samsung ATNA45AF01 panel used in the Qualcomm X1E80100
> CRD does not work correctly with the current display panel configuration
> and drivers: It works after boot, but once the display gets disabled it is
> not possible to get it back on. It turns out that the ATNA45AF01 panel
> needs exactly the same non-standard power sequence as implemented for
> ATNA33XC20 in the panel-samsung-atna33xc20 driver.
> 
> [...]

Applied, thanks!

[4/4] arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
      commit: 10f98bb9d98137b544b00abb4f9df45e9be7878d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

