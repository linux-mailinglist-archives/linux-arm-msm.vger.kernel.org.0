Return-Path: <linux-arm-msm+bounces-4133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FAD80BE1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 00:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EC461F20ED2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 23:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC851F614;
	Sun, 10 Dec 2023 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGUP9mIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F81DDE0;
	Sun, 10 Dec 2023 23:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56030C433C7;
	Sun, 10 Dec 2023 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250480;
	bh=pcYMstoIya4cKH2fPcVBC1Lh+pVLN08VVEv4hGjqVzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGUP9mIhM9Lb5Y/Hi+UkXq8jgKuEGaFzScefYHwkyDinOYRMkO6Wuhk0v2AuIqcyB
	 qjsFVxUv5U0qKiaw/WiwsE68rJzZl8ZEV7sEcl1IhsVdPPkIQa5f9SvgVErzYM0jJ/
	 ky04g2icWMhq0MhGkVV/akf1wSVegYyRj7WZoMZtdj1voqMz3nS66/PbExyeJx6OVo
	 GmTCm9fMN9ULBFv0Wu23QjTSg7z7k0m+x7l7nsprzLNAQ06tR5Q8nMzNq6boZXi29x
	 KGhj/OLo0XcmjYo2zZb2M293FAIml5RAUN6dLFs+UkQFHIxcWcyJPr6M1EwwRauVVc
	 me4LggE/ALyOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/2] Small dtsi fixes for msm8953 SoC
Date: Sun, 10 Dec 2023 15:25:41 -0800
Message-ID: <170225073881.1947106.8831546766942369978.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
References: <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 Nov 2023 13:19:26 +0100, Luca Weiss wrote:
> Fix some small things in the qcom/msm8953.dtsi file to make dtbs_check
> happier than before.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: msm8953: Set initial address for memory
      commit: 24187868e195202c67c38bcc3ae28f9c6a663fb4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

