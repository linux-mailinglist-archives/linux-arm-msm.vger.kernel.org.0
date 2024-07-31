Return-Path: <linux-arm-msm+bounces-27526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432A942D2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F240F1F213C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 11:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78A81AD3FD;
	Wed, 31 Jul 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiPKhL3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793D9200CD;
	Wed, 31 Jul 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424930; cv=none; b=qmt5ynWkvzEcQHPrMWYCR2YxnMp8ZfXnk5c11wDbN+dXmLd+iZ7ivrjqOdtUWcmhxzPJ1Pmu89at0M+06A28CY3waLVHkFtxkAQXQPcpQlDhdDuo+zhfHL4zDWR4gTz28p1xhd1aB34Z9X514OIlHVXdkBu3j2ij9nVuc2XwugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424930; c=relaxed/simple;
	bh=xbgfOjLhPYfLbq78ap/CMyh0N7StP6L/XfWRjUrx004=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATDRBPbMaBRCqXLQva3Wvf48RwveuY3XUcEI4WZG1LgNHWNEZU0jNMEuXRNDTEe9N0+xUVGMWEY1GRNJJArXMETl7opIF+poLXxe041xfC8UBRqinlX6v/2sk+n3Qm7Hx7HjWAaCDYgh2ORNIQVdJ1kvH5rmVUGksssfOf7MsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiPKhL3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D7EC116B1;
	Wed, 31 Jul 2024 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722424930;
	bh=xbgfOjLhPYfLbq78ap/CMyh0N7StP6L/XfWRjUrx004=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiPKhL3IDqChY4nwh2IQJcdCfhEAqv+9+F7wDbqfmkIuQrwPC7qUI3LyV0+5tXRFZ
	 8im6sHvv7qklWeKR/hWo1pw1CoSsntS5FuJTmT5O2njdSEEiKfNx402DIYC8uwUKur
	 e5xYlpswlKk8Af7NhNiaraz3Ud7F0rFfcwgVQ9NGTgtQOwQZL+DOPq3f8TF7NodwMw
	 /zA8vstkE8BE9qgyviGmAABBsRDssKj6B+CaQAhItymLpgg/EEfE+ZQbSAkHTDlbb2
	 5mCSwsa4zk8HR+XxHoy+Xi6P7WZRDat8yDTMhQCvDo3KJkhTR6hZB8+C5hrQgK001U
	 tYyNTf1W5u0Nw==
Date: Wed, 31 Jul 2024 16:52:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH] phy: qcom: qmp-pcie: Configure all tables on port B PHY
Message-ID: <ZqoeXUFtBq-F3x1V@matsya>
References: <20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org>
 <ZqO17rPoitKbUa_9@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqO17rPoitKbUa_9@hovoldconsulting.com>

On 26-07-24, 16:42, Johan Hovold wrote:
> One more nit: subject prefix should be just
> 
> 	phy: qcom-qmp-pcie:

I dont this so, phy: qcom: subdriver is better and used more widely than
this


-- 
~Vinod

