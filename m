Return-Path: <linux-arm-msm+bounces-65176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5844B070B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EE5A1885ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922832EE97C;
	Wed, 16 Jul 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHdcTt3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666F628D8F8;
	Wed, 16 Jul 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654908; cv=none; b=P8kT0Wo2a2VZoh3vl6zq/JgKC5/k5R/tWPNNfgiAD8rNQaWqH9menBEfL5PP2L0dNdUwYKc6wEVgCiAcC/cTM32WUZ2JFyu4lW087prerdjcfG80tPums5y8bO8z2tzUbg3dFoGOfYLps9exYXQoRnsL4hgCmPugckZaDxHe3yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654908; c=relaxed/simple;
	bh=3tGnqVq+bAySyxjKGiRmjzxoaIXBPRBjSc0jxGEtsAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfL2DfMN5fEMF7oIbcmWO8zqSwbQ9LKJZ/mK0snjyX7dsRmBl2ztT/Sis1NqZPvptP8vlaSVPPto030LRnfZCHaI0ahxlCkRzV6bR+Lla9i93oBZi45eAj5cySTVkHQ41/smfqgOerDPorfNWEXaPckz1r255HMZyUjqGl6STqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHdcTt3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7036BC4CEF0;
	Wed, 16 Jul 2025 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654908;
	bh=3tGnqVq+bAySyxjKGiRmjzxoaIXBPRBjSc0jxGEtsAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHdcTt3W7PuCo4tBcuuCHKOMiISx4YPVII2blkIOW6rXfCGpRj7/5DpvgtL9jybKN
	 mo40IgGJTjoE/fsaIMAr5huNYxEh5bZ4A1MY6R1atcCbSH6eT1Tmpf9MLIsuYqR7wp
	 NopIUScYBHEt5i5/OhVyi0QV0uUBJWODBZ8OeaSE9T5qOVGSLXAYaHmG+jWkDddQkk
	 QzxsIX7BY//0ZASAEzWs+7bAaTnfeHR9IQfHWjhzFrLgVoUwePss3g2ZU6a6RtvZ5M
	 taIGmkjxDD5Le4ETb7zJyq6Rp8nMAvoF2RO1uoeLNYr3qYyEI6JDv5dKdoyEkF6DRU
	 OiPU1HJXdKV2A==
Date: Wed, 16 Jul 2025 10:35:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: Add support for subsystem
 restart (SSR)
Message-ID: <20250716-fancy-cow-of-abundance-b38e09@krzk-bin>
References: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
 <20250716004004.311001-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716004004.311001-3-anjelique.melendez@oss.qualcomm.com>

On Tue, Jul 15, 2025 at 05:40:04PM -0700, Anjelique Melendez wrote:
> @@ -333,6 +356,16 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  		goto out_release_aux_devices;
>  	}
>  
> +	if (device_property_present(&pdev->dev, "qcom,subsys-restart")) {
> +		pg->ssr_nb.notifier_call = pmic_glink_ssr_callback;
> +		pg->ssr_handle = qcom_register_ssr_notifier(pg->data->ssr_name, &pg->ssr_nb);

... and that's srcu_notifier_chain_register, so clearly you described
Linux in your bindings which is obvious NAK.

Best regards,
Krzysztof


