Return-Path: <linux-arm-msm+bounces-83513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026CC8BC4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C19F4359974
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 20:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C63343D86;
	Wed, 26 Nov 2025 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfJ/Dv2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF3343D75;
	Wed, 26 Nov 2025 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187525; cv=none; b=IP4y3nQf7Ify+uNj7D1fXRX4Y7wZ3v7Oo39rFQutryEhs0sMKlASFkj4A12AiAR/N+E7UiLnv0lKLosz3IFI2u2UQCIfueuxfqkjpasXfBeIwu6HV3Ea2fAjheuYTJvR7K4G4TEuUxr6EMWHaNFkxExpgENt0BRPv1rAg1zKZbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187525; c=relaxed/simple;
	bh=fxXewd0db+LlmRCyNbx297Vyzwp0eMZwFvVWYmB/k8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHpn8shEUc3RMgkHKVPYIVUrhS2tGrVX3PQGPOrYkcCdZK3WluphXHMrvK02oYhkI3zCFtxr6dwx35CcpQvwRDeNzqTpAkQhofLHMWovTRRvjUDsLyx1lAqaosC9bStcoAtttjA3iy8Jq4t7jNzFf4OKOq/IKI+cNrbY9C6Odok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfJ/Dv2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120B1C113D0;
	Wed, 26 Nov 2025 20:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187524;
	bh=fxXewd0db+LlmRCyNbx297Vyzwp0eMZwFvVWYmB/k8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PfJ/Dv2lUtxnTl1tOt4ObOmTbOCeeGWnLoCGYguu8am5L1Y8vkbbmROL+qzyCazdV
	 1xzEh0Mw6a5OueOnxbUUNPukXFWdvBUKnvvFEbGsZADJKFY3/2m/+pes33chVfAtnR
	 pG3Esztr2aQLAdc/X+5FkgsJ9zhHANMKEW5ERlw8zz9CVgCPs0XNrLGtdUcGuO7ep2
	 bOqWF0rub+kiT/nNRsH1+RzlYvC/FefIzX9IkmUbuHpbWeRVpnuyOmwlk8Bgv6eD0u
	 wh7c6Xx+vlm5phZtRXL/7D1eA/RXOLnBDN5umOkbJ3zHFEi8Bu26oI+LYCS/6sUhDJ
	 BGLfVpb++r9zw==
From: Bjorn Andersson <andersson@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: mathieu.poirier@linaro.org,
	srichara@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] rpmsg: glink_native: fix leak and cleanup
Date: Wed, 26 Nov 2025 14:10:46 -0600
Message-ID: <176418784421.1591314.5207437260242000484.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 11:00:41 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> This series fixes a rpmsg_device leak in glink_native, and also adds
> helper function to remove some code duplication.
> 
> Am not 100% sure if this behaviour was intentional and not allow
> rpmsg-char interface to work from glink_native, but by the looks
> of the code it looks buggy, which is why am sending this series for
> discussion.
> 
> [...]

Applied, thanks!

[1/2] rpmsg: glink_native: fix rpmsg device leak
      commit: a53e356df548f6b0e82529ef3cc6070f42622189
[2/2] rpmsg: glink_native: remove duplicate code for rpmsg device remove
      commit: 112766cdf2e5ea0a0f72b0304d57a6f74c066670

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

