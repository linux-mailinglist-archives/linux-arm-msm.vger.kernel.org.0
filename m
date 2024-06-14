Return-Path: <linux-arm-msm+bounces-22758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C4909450
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 130A92843CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8594C18F2E5;
	Fri, 14 Jun 2024 22:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEcSOIyc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560CC18C32D;
	Fri, 14 Jun 2024 22:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405346; cv=none; b=JN+yzVL4CoyIIVHs7GHeii2leTrwc/PjMBiN8YjKOTl3SKsD2pncDzXfqnGWGTcPjIwXBuKl+j93enalj7E+vfm9j72+ebreSu2z1/HvaeSVWxAoOJKrlSvSZzQM/l4hoTkPjVYMbO2UZq6PPReuIG7xK1lr/NlxBfIjLl5LyIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405346; c=relaxed/simple;
	bh=i6dknFnTfldCT6oUpLF2xAQpS0wYG49JJc8joCWSqUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RsUfvwih21IfJO43HXHRW/+ijXmk81UoSjYdc6e/+hKkFkZePLlV/gAqTys1YJ5HKcTd51mpR68+it5dkTSvuAz6a4KbiRCu8ZWAFr05fqoUdJtCEG8QDOYz2TD97hNVtmhvH94lzww/e8fbZ9ODPjLyI4tBnYvLoJBe5nm97EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEcSOIyc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB94C4AF49;
	Fri, 14 Jun 2024 22:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405345;
	bh=i6dknFnTfldCT6oUpLF2xAQpS0wYG49JJc8joCWSqUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EEcSOIycWNkCwsTyIP0H/0Diopnmvn9LB83CEyrgiKQxxvq04/BDZsQhCUPQZOD5O
	 on7eR6ph6YQVjk0QJ8o0hfAHu/w2tPylwtTvE30yW3JH8CkwK1dADpp57COMmV5xkC
	 7nChrhE6/hWgzBbzJLf2UHBFg2Bau/mLqmjNlIHrHWSUBSOGMtbXX8elxksLS599Ss
	 QYaniR21moJP+7GnM/Td2CQ8+vL+WhLfIwryWkFDiiDI50GHQ6BqcUmytzWhhgBMEs
	 eAhJG5w1UbFoZ7o0TpRvyH+yxRHJUKFwEtgAnvWvyJqYzD9NkTmC2lDcKrh1i6DxHe
	 BVOyyTQAGPNlg==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	Luo Jie <quic_luoj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com
Subject: Re: [PATCH v15 0/4] add clock controller of qca8386/qca8084
Date: Fri, 14 Jun 2024 17:48:54 -0500
Message-ID: <171840533350.102487.17045571208038502513.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605124541.2711467-1-quic_luoj@quicinc.com>
References: <20240605124541.2711467-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 20:45:37 +0800, Luo Jie wrote:
> qca8xxx is 4 * 2.5GBaseT ports chip, working as switch mode
> named by qca8386, or working as PHY mode named by qca8084,
> clock hardware reigster is accessed by MDIO bus.
> 
> This patch series add the clock controller of qca8363/qca8084,
> and add the clock ops clk_branch2_prepare_ops to avoid spin lock
> used during the clock operation of qca8k clock controller where
> the sleep happens when accessing clock control register by MDIO
> bus.
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: branch: Add clk_branch2_prepare_ops
      commit: 7311bbfff31c4961c57d94c165fa843f155f8236
[2/4] dt-bindings: clock: add qca8386/qca8084 clock and reset definitions
      commit: 80bbd1c355d661678d2a25bd36e739b6925e7a4e
[3/4] clk: qcom: common: commonize qcom_cc_really_probe
      commit: 9f93a0a428606341da25bf2a00244701b58e08b9
[4/4] clk: qcom: add clock controller driver for qca8386/qca8084
      commit: 2441b965c4c7adae0b4a7825f7acb67d44c3cd38

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

