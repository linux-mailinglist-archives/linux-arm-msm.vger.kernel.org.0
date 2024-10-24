Return-Path: <linux-arm-msm+bounces-35701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1249AE98B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9F71F23440
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA23D1EF921;
	Thu, 24 Oct 2024 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK3VlL7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54D1EF0A3;
	Thu, 24 Oct 2024 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781983; cv=none; b=YW7nZUUOdHK8uajE0cigMWRWLhhm8s+cqHSxM9o8YxR2FRudOM/8pY0AwwEj/Nku1btI9HSw49PYtqM0e1poDvjYnBvd3l/ZnSoL/I5/fxv46LnscwxROlb3a9XTXfyAo1kjCxGZfiI2IBL4TfQpGIrYWwjtzo2xFwyFE4QVoVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781983; c=relaxed/simple;
	bh=0Hv/7Co6R2EZ8AvfgB6ZSzRb5pHaAEBRjh3gNKx0QuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QKnPkfjao+TVmTFV5aereMPA2y5Je0awFIz+jckQtxrJwcdCRqneHGmQUa2CVwoTQrJMJyANipVTFOet+hNU7ovZCGBXb71V5uCS2VhuSwzQkTSr/S443NukqVkNRdCtHUB7zaatYAfnI8QwHiygO8D7zwbhZh49PL4tzE7voOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK3VlL7m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEACC4CEC7;
	Thu, 24 Oct 2024 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729781983;
	bh=0Hv/7Co6R2EZ8AvfgB6ZSzRb5pHaAEBRjh3gNKx0QuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CK3VlL7mM/Al2glV243oNxz00GSGYOSjyNcHWVdsrLM5gE7mGRjlfNjeKsaX2D/Bj
	 WIGhvzrPQHnHhEV3nU5N7I0+xzpiJ9revWz5FLYsrn2PZQT1UlhxIZNwUr7l7XOYNK
	 iJY0Oyb5hppMOeIV5t909Wt0+VRfVmm/aLS8pUl06iybO0f8LbfszBRcCXptfYASTo
	 +S7y0HgTIPI/yWnaM/tgGeUNp3dFe9eYHm0Jvvc00LVi1WRvJbq9rjpvA9aa3VCexL
	 pa1Z0oMYCg/zm+ZflpHn9pQ2pjSsjS3OF9TS7EhcraLlswTyhlIdcp5byZJhrD5CqX
	 x0gYeEsuePfqA==
From: Bjorn Andersson <andersson@kernel.org>
To: sboyd@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: quic_varada@quicinc.com,
	quic_srichara@quicinc.com
Subject: Re: (subset) [PATCH V7 0/5] remove unnecessary q6 clocks
Date: Thu, 24 Oct 2024 09:59:31 -0500
Message-ID: <172978197052.296432.13730841752162916405.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
References: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Aug 2024 11:26:13 +0530, Gokul Sriram Palanisamy wrote:
> This series is a revision from V6 of MultiPD series [1] minus the
> multiPD driver related patches. REnamed this series to keep the title
> relevant. Will post a new series for remoteproc secure PIL driver as a
> dependant series which will rely on these clock removal.
> 
> - Since the new rproc driver will use the secure APIs (scm) to bringup/down
>   the rproc and secure OS (TZ) takecare of handling the clks, those clks
>   needs to be removed from the kernel. since thes patches were already
>   posted as a part of the MultiPD support [1] and some of them were
>   reviewed. So picked up those patches and review tags as well.
> 
> [...]

Applied, thanks!

[1/5] clk: qcom: ipq5332: remove q6 bring up clocks
      commit: bef2902ffef85959cd3d80b62c7e5db73e2b5815
[2/5] clk: qcom: ipq9574: remove q6 bring up clocks
      commit: fa1d525404b6e78d97b17749af72a314060c2934
[3/5] dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
      commit: b3aba04883de872488e5dabda199427b2bfa0395
[4/5] dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring up clock macros
      commit: da040d56031976144740bddba942485999f6a16f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

