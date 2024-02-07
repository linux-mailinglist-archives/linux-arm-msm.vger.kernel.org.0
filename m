Return-Path: <linux-arm-msm+bounces-10042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3984C3E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 05:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D096328A5C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 04:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A901E4A8;
	Wed,  7 Feb 2024 04:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmb5mWBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957A512E5D;
	Wed,  7 Feb 2024 04:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281216; cv=none; b=ZnpPrzWh0y7htLNqih70RHVqS6r1BydDfRoa6TEiikhwKxziSPBpCnh56dullG4ZwDcGDPrjdQvhxprpQpMq8ZgsDbXFT97Xim7PMCiDnvFRMhfPh2e0wfpo8ejuD6eK5S3EHi2/2lojg0qQVNLOIYG2idWrU6M7XmDcsJnlbE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281216; c=relaxed/simple;
	bh=CfuTQkxQHMgYQsckiTRGhKI0Ngzxboqqb2pmlujQKmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jnX+41eZDTHxO60hKoZwnQ+2mHDw+DZXX+kJKdfiZGtMsIjNwjvLOWz1XfcFpsfHZaKEH6ZBVQdPfS7LcUxjihGRTac383zCcFqK1BP5R89Tls2ii8sUuZRnkDP4VOqSXpCSjpbSE/EQqz3tL6fYWu/pERxSElWQxdN6yFzAd2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmb5mWBC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E888C433A6;
	Wed,  7 Feb 2024 04:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707281216;
	bh=CfuTQkxQHMgYQsckiTRGhKI0Ngzxboqqb2pmlujQKmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmb5mWBCldb15vZqrGKNEF+U0A7Ti2TScWqa88ExCJhEQ+QjQeijQDj2o3J4K/oO6
	 XvOIJ8lNeOvmUWCbWXH5XWjA7KgUbQB8yGB1VAnTcNtGuiu3ubSaP0uYrEIpHQGgvB
	 s0w54EuhokwuxuItF1vqXDgILV8r6ffh0R+bCzI4EVxCwVEHUq01vCJVwAm3DhwODC
	 SUe9KwF7HLmDfbTclo+GQlFATxPc+fx+efjNvsx+jZuhruTxd48Ui2ShJSfAdk5UkE
	 R7o/mnJBQ+WDqmZ+97wFA4TIJLkETtO7EJI4flmOmuPHF8OT+YsoI+Kaany3QzU2Je
	 QWxs+UYoBMizQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qrb2210-rb1: disable cluster power domains
Date: Tue,  6 Feb 2024 22:46:19 -0600
Message-ID: <170728117687.479358.11800231801149831015.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130-rb1-suspend-cluster-v2-1-5bc1109b0869@linaro.org>
References: <20240130-rb1-suspend-cluster-v2-1-5bc1109b0869@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Jan 2024 18:48:08 +0200, Dmitry Baryshkov wrote:
> If cluster domain idle state is enabled on the RB1, the board becomes
> significantly less responsive. Under certain circumstances (if some of
> the devices are disabled in kernel config) the board can even lock up.
> 
> It seems this is caused by the MPM not updating wakeup timer during CPU
> idle (in the same way the RPMh updates it when cluster idle state is
> entered).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qrb2210-rb1: disable cluster power domains
      commit: 7f492d48f08207e4ee23edc926b11de9f720aa61

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

