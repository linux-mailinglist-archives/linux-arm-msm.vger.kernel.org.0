Return-Path: <linux-arm-msm+bounces-35333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02469A98D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90CEF284ADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79CE132114;
	Tue, 22 Oct 2024 05:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmUcAecz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889377406D;
	Tue, 22 Oct 2024 05:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575925; cv=none; b=Pkcnt7iPaVe6mEfu9HGdbasDxbAzhYC4sp3zok/o6qlv95N7byI562XE+aqrtiGfKTNSq80zPeVbtzHGHqn5yFPPtKgZeye7+1JzvoY9S0foWpTu73XRekCA42O3WwGeULJ33EFBYvxlKnungSDDLa58dtcO6bMHyUFJU2Hm81s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575925; c=relaxed/simple;
	bh=cEboKyUu5mz6vBnjkqxkUHv7xHRAJzZrS5soKaeqo9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOTjHEfo5Qq7C37gPbuBVmgehZoUJZVrnX7zLcxKfOd8AhbDjixlQJjdJp6BK7AtfmRjwKN0NYYy8mWhY/+NcUEwKoD+1Ic6y97lRYt+6bV9PY3Yt6wekVLtvYWHkwf46pF25NLyXoJQ9NDRMxjKZk9HERTvJZH988hy8LhDaT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmUcAecz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C685C4CEC3;
	Tue, 22 Oct 2024 05:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575925;
	bh=cEboKyUu5mz6vBnjkqxkUHv7xHRAJzZrS5soKaeqo9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmUcAeczns72tVsyg5UECqosb6x4JmzL8aahyURKFdOBeUC/NWnPqfznET3XNIH0i
	 Rr99Ug+su0IYpRHb3O38bn7ko6bVD5lzMM11fQaVMQ1UYJ6oDtjUjCEsKD2U4URWZB
	 7DxmcXK5LBvk5pKy6NXqUaNGJR69dZ/+knK4EL95QK1lz4PIIiVLEYyd1+VGj4Sg2X
	 aVgMNMb0Y/OljzPejOATVGeomazmKWLuiYnn9X48rL4IbrUmHiYdlR6sx0l4wpMxcz
	 v5f/mU0DBN4zaEmqhm9xcDuimV07wGIG96hMEydoOh5y7Aq9S9KMAR+on4cuXxoEtE
	 +Jw6PlrRS6fTQ==
Date: Tue, 22 Oct 2024 07:45:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add
 SAR2130P compatible
Message-ID: <caermtfrsfkiybw3lgqzvhp5l6lj4zqk4jt3w6sd3xmu7pbz3t@xl63v4zagx26>
References: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
 <20241021-sar2130p-phys-v2-1-d883acf170f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021-sar2130p-phys-v2-1-d883acf170f7@linaro.org>

On Mon, Oct 21, 2024 at 01:33:07PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the USB+DP Combo PHY on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


