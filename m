Return-Path: <linux-arm-msm+bounces-25864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F192D616
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 18:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7648B21CA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 16:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E7D194A6C;
	Wed, 10 Jul 2024 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMaxg75q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E1D1803D;
	Wed, 10 Jul 2024 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628152; cv=none; b=al7sCuZiKOLWYEfTy08mNC1aSnGtKJwG2QHwoic/VOKAOo9SKF3+aAVMOtJxa4M2QKICNMFvqg1upT4RIc7sqrLHRpKz/U8J49F5+0GSOvLAlK4x+w2eah3bemTIbvxYJDUULGjCDilB+S9zd09mCouiq6yu7EzVZ2JQYlAKKLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628152; c=relaxed/simple;
	bh=Y89/WY8lavOdGYJXlEhyTDXv6Bi38yp2eX7+OnkOJHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/oFSU6AdKy1qr/pDkG/rBaVON9Yw5h/YYFn0abYTNVbQFH9ifulBYJYN2Z31l236WC8HBiPCsvhl62CFlxw8wdrjrjrKcQhHjZo1eDmUbQVT96F7VQUbjyYFQrpqk8Rm4WNSAnlbuSUYiHbxxL+tWSD0cFiSuW0Wi9i2Fq9Z/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMaxg75q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEEBC32781;
	Wed, 10 Jul 2024 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720628152;
	bh=Y89/WY8lavOdGYJXlEhyTDXv6Bi38yp2eX7+OnkOJHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMaxg75qmt4ABmx/LmDAVm3Jm2sVASR3uIDZ7aVJ/JRwI+pP23r/b63F0sdF8491T
	 OuxNvH/zWEP4YKOEy0jWZJ7gaPQAr/mi199XzR75XUlXXWfj0QsmDiaFrReRZYe4eh
	 GIYv7AepbGkNGv3qahvXXLdq4N6dWUfF2wYpcSKqWifQRYQe2l9/zELes2qduSAuZg
	 OOTnwUnpp9LASZ/nSmMLeLUPSyisiRQwgtmlxRQdEXBhARiANlKzpxQ5v1i0pmUH6j
	 zihlKmhJwSBPKqb25wK6h9GAGjfzG9fGv96eo8fjlutbzykV8g+RCK7FuGuUqNYo0A
	 x+ZcVbCfBq+yQ==
Date: Wed, 10 Jul 2024 10:15:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jakub Kicinski <kuba@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-bluetooth@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, netdev@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 1/6] dt-bindings: bluetooth: qualcomm: describe the
 inputs from PMU for wcn7850
Message-ID: <172062814990.3211927.13043381327085522946.robh@kernel.org>
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
 <20240709-hci_qca_refactor-v3-1-5f48ca001fed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709-hci_qca_refactor-v3-1-5f48ca001fed@linaro.org>


On Tue, 09 Jul 2024 14:18:32 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Drop the inputs from the host and instead expect the Bluetooth node to
> consume the outputs of the internal PMU. This model is closer to reality
> than how we represent it now.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml     | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


