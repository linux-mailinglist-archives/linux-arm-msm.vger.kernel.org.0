Return-Path: <linux-arm-msm+bounces-27816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1D94669F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 03:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28BC1F21E6D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 01:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F10187F;
	Sat,  3 Aug 2024 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNsX/9XT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6554C74;
	Sat,  3 Aug 2024 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722647112; cv=none; b=mSy62ibTbArfpIfdSQm9U605R+uz24MSxXl20cN4V9C1oarjGAtx5TBbdw6zmxj2QlbeZb64tDD9X/nDjJcEEmS2TMMDpb8inz2OotBsZfplbE2rqdn560gohJiyAGc2faU85EQPUkF0WDCH7wafY9MYXRHYWgJyZFpHKTPbz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722647112; c=relaxed/simple;
	bh=bPaCeAClCPNjr6qV0PXPIM+GypEa4zfQWJr9KZ0baWI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=k+zutGqn0vpqEhSrDvMgcSKAQKE7XDHDZIM0rMcv3RXTvIuSkJjHJZ4wxhGT8j3SGtvlrZqOfEhJ66jG3T1IRDEmgZ14utApv+gSNLlu/N18LBR/5RRcXkagQYDpaf6wz2fpyU09TyNHifegSjtzyn7R7qHVtrA7Jy9OkTpm5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNsX/9XT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2C3C32782;
	Sat,  3 Aug 2024 01:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722647112;
	bh=bPaCeAClCPNjr6qV0PXPIM+GypEa4zfQWJr9KZ0baWI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rNsX/9XT9F69gHJ9VJp38rB2XgrESLnvtGHFQRc2D5IrHy8eIP3wrhIao32kN896W
	 9zkvK/PCVTJTqmajxjkjhEDcA7ozh38lOnTIO93rkOQCwHJXf0Ccyks+pzZ1KkuhP8
	 /U6BjVBUr+w4ZygS7H+VXsYU/bsDxdplej01bv8jmBP5gBCglf63sEU7l+5rb8RePY
	 Q2TTKhjzU7i8s/ZVSu7dguFblUySkXa++B2U4QUV9dHHsC2ZM1gAGU+17GlwDs8N8f
	 lVlCVhT2CSLrkzeiTvRSPBt5dXKqpP9J+juwPKPNsId0BtM5AEamPVS5UfSzSKv0am
	 4eXlK+uI9ZgUA==
Message-ID: <ff92343652a998b97981e63ea5dc301f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240801110040.505860-1-quic_amansing@quicinc.com>
References: <20240801110040.505860-1-quic_amansing@quicinc.com>
Subject: Re: [PATCH] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
From: Stephen Boyd <sboyd@kernel.org>
Cc: quic_devipriy@quicinc.com
To: Amandeep Singh <quic_amansing@quicinc.com>, andersson@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com
Date: Fri, 02 Aug 2024 18:05:10 -0700
User-Agent: alot/0.10

Quoting Amandeep Singh (2024-08-01 04:00:40)
> From: devi priya <quic_devipriy@quicinc.com>
>=20
> Update PLL offsets to DEFAULT_EVO to configure MDIO to 800MHz.

Is this fixing a problem? I can't figure out how urgent this patch is
from the one sentence commit text.

