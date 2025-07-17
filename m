Return-Path: <linux-arm-msm+bounces-65372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75CCB084B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D9EA4736C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35E62147E6;
	Thu, 17 Jul 2025 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pupAp+oE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4205203706;
	Thu, 17 Jul 2025 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752732973; cv=none; b=krYw1gMJI9Ng9z+hHy6zFkAjIpWnaP5LGoSJAnXnADu8OgVI6sX+cNf4SJp6Of33zFRfxKx/yg5kzNKsT/56sRGbjcOI6m08kOZ61X/Z8k7GEtKZ2+nOTOUJmhrwxZe+oN5i/KUG9KRyo80W2Ot4S7kGJ6x7cVdLX4w0An/XOX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752732973; c=relaxed/simple;
	bh=RD1DcmL7087BHaQRZh6FWCmENE/3bjxGbxvFJPr/UzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR3gH5o8YdpPsDyp6jkXzYBXf60tWAdFEVvFY6e53tpkh3SI3mGsIUpERI/ThES+/0hNQQubuBcvLFYSmNQgwjVZwX77hrRe95+7hO8IYcyUBYNRasPVWCswWjMixSHdYL7PEe9ac6M5LjIxVHa4oVzru5kPBxmIF4pMNXGGo8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pupAp+oE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9CEC4CEE3;
	Thu, 17 Jul 2025 06:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752732973;
	bh=RD1DcmL7087BHaQRZh6FWCmENE/3bjxGbxvFJPr/UzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pupAp+oE+LJQPmTIuORHd6gyLFC3muoBDgBaW+c008/LCTsA/ahpxeAT3AeiZq4Og
	 z+Iap+hR+GDjVwMHB56LfE9zvDnS1By9crPXQpQhW8OqsZDIAUssVo5Gbs3vVhRLyH
	 09MpBNCGmilN+CwrPgt9M5GYZEdCYIZdWndRA22btC1MJv0F18eXtaMXq7QrVU/t+J
	 PkXxxfgA9egYRP9IOf8h3lnhfTRgjnBi3ABNBLM5GzCG5RJ4lvKkjosUMejqTw2N1m
	 pELsz7OwS2qvUu5jMZegKrpgTzx3HV6phcL6TmisUYDCWR7rKFrSuPfqfshOXyknD1
	 ebTw2D72I+Uig==
Date: Thu, 17 Jul 2025 08:16:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Violet <violet@atl.tools>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] arm64: dts: qcom: add initial support for Samsung
 Galaxy S22
Message-ID: <20250717-devious-resourceful-spaniel-6ffad7@kuoka>
References: <20250716231710.99983-1-violet@atl.tools>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716231710.99983-1-violet@atl.tools>

On Wed, Jul 16, 2025 at 11:17:08PM +0000, Violet wrote:
> Changes in v6:
> - Remove debug features (bootargs, etc) that slipped in the v5 DTS
> - Format and organize nodes correctly based on existing DTS, 
>  move "status = "okay";" to the bottom always
> - Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
>  from existing SoC .dtsi
> - Disable buttons, ufs and other features for later revision

How this can be v6? Someone (you?) sent last time v2?

Where is the rest of changelog? v1, v2, v3, v4, v5? Or at least lore
links to previous discussions and changelogs?


Best regards,
Krzysztof


