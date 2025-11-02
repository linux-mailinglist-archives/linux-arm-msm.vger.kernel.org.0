Return-Path: <linux-arm-msm+bounces-80021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1518C291B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 17:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB683AEE8F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 16:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C842322ACF3;
	Sun,  2 Nov 2025 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkOrx1lk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9191134D3BD;
	Sun,  2 Nov 2025 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762100092; cv=none; b=ZYVvIhN2wsIKQfh2mIReQ0tWSL4nX6ADnZGv+1zrBBfo8gkOOZLmM49UnY4p9bzjWdeNLz6gYTSekfHen4gs7M0CHMREw5UC39dJ8M7kSv3eShHORenuPxuQTh30O4ympwI1DvPdXPGrfYqhfKLdI9axQJNePMEczCZ0k7ELrsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762100092; c=relaxed/simple;
	bh=YUqRHQELM0tbK0mIPrtE/xPKcwmnubLy1UEc9uaO1NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJoPJ8FBgFW1Y1y8a38ahBiTcwj8JV2xVfJFETodigLWBjRi0ML1kS/wX+De+i9YPQGM0WU6VDY3ux7o5Kr+TGPtZ9aM9+4upN0rKDvjWe8blzpMftAJAgv0/9jF5Qsd7vXAZscgI0Ls1q9aOqyDVDlKlKycUEAHVddIr14+ARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkOrx1lk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE04C4CEF7;
	Sun,  2 Nov 2025 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762100092;
	bh=YUqRHQELM0tbK0mIPrtE/xPKcwmnubLy1UEc9uaO1NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkOrx1lkOnFfPzfJl6jBe9WM4OcobBNX/Q+HNie12rzKeYwO42uCWYDdGv7J6vMAF
	 ZD2dQkAWPeXrCx0rMtY8g65Wsinfey3e9SHc8nySDxaE96YggX7CIueNjoSI9tFATl
	 hpkp+2dqN2Z2rhtMWzFlhownypYMKM92ccGcfLE58rBCrLRMkwOHfcD6dx+eStCbbQ
	 ah6r7rMq6DlxbxCd8E03Ak9xuGnaJLTqhWD99tlfOe+lCWjgSdoGC2IHGakTiToFHl
	 yddfTDBNsI0fdyCiysHDEKWuRdmJjAGg/bSTYYEQ1LWzgdNZQaC/o+dwnWbZXLaEVc
	 vPCFSPeLunt0Q==
Date: Sun, 2 Nov 2025 17:14:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raihan Ahamed <raihan1999ahamed@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Lenovo P2
Message-ID: <20251102-little-alluring-wrasse-3a7b59@kuoka>
References: <20251031135506.214025-1-raihan1999ahamed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031135506.214025-1-raihan1999ahamed@gmail.com>

On Fri, Oct 31, 2025 at 07:21:20PM +0530, Raihan Ahamed wrote:
> Document the compatible for the MSM8953-based Lenovo P2
> 
> smartphone released in 2016

That's one sentence. Sentences also start with a capital letter and end
with full stop. Please write correct sentences (see also submitting
patches).

I already asked for this!

NAK

> 
> Signed-off-by: Raihan Ahamed <raihan1999ahamed@gmail.com>
> ---
> version 4
> - rebased on linux-next
> - enabled accelerometer sensor
> - enabled gpu and add gpu_zap_shader
> - add homescreen and one-key-low-power gpio-keys
> - enabled pinctrl for gpio-keys
> - removed explicily added tag

What? Why? You must explain WHY.

What is happening here? Did you even read what we wrote to you?

> 
> version 3
> - sorry for explicitly adding tags
> linked-to v3: https://yhbt.net/lore/linux-devicetree/20240226195516.174737-1-raihan1999ahamed@gmail.com/

What is this? Please use standard lore links.

Best regards,
Krzysztof


