Return-Path: <linux-arm-msm+bounces-20791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C118D2221
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 19:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC93282BFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 17:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6938B172BC9;
	Tue, 28 May 2024 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM+8Iakj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3919716EBE2;
	Tue, 28 May 2024 17:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716915777; cv=none; b=aJLt7qBItqj9e/WBGwJbJVa/gKxP9ojgWYrICtIpPWpu5wXAV5FJG5qFyXSSrfskn13l2P3d0GGocRzmB3tiXzOaLWSmx2aU0UdhEdI/r8pvQ2L1yHGuShtZUKOH2u5CbLT84c6FCYsaoqFLPi386C3VWdFmi5R4l26X8M6HmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716915777; c=relaxed/simple;
	bh=0Mvw/6Wc1O1BPPHSRjs2WkILTJox9HoSkCs8QZhCOjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADRKTxC2hg/2njre3ZNqnf39PPPFYFyEitKtQLfWT1nk9EbypAYKI20PNAe5zsGS9yVoxh7170Vz6zOH3TvcoEIT+mGj4eblXvduA1rYFlwRhGdFQJMyEa8smleucD/ZDTaVXlE4MFsaWb6oe7a+eINuhFAwlYKcxJjDo1+NteA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM+8Iakj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9B0C3277B;
	Tue, 28 May 2024 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716915776;
	bh=0Mvw/6Wc1O1BPPHSRjs2WkILTJox9HoSkCs8QZhCOjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PM+8IakjwYHQ9srlOP4rkHQfZVP7dJYcPU0AVdiwwmIPhYfvPcmrlglgLBmmSSmgJ
	 KFxLElgpRTtufgZJbDoW6EqCvbhP97YIxmQtRjc/SMOY7lsOiRVwqwID+DtvXu8hbn
	 T+E0Dy/ktB2wN3ngQwhPkyClU4UIuFYUirPUQ5YU7EDkUc1CQt7i29CWHjFov8+pEw
	 TwSC0J1UOxplwh30+ZBwlOInYaHAVoVtsQjEW3Qqd+dvCWKE6VQ1gzLGaFQcciSTH7
	 /y0va56M/f3qh5L4IvZq7DSde0huw0Y4fFaXn5v3OWhJ1b7SKM9XvpsFp6nh8QFUo0
	 vO6Xzsm55CC3w==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] Fix msm8974 apcs syscon compatible
Date: Tue, 28 May 2024 12:02:52 -0500
Message-ID: <171691576754.544020.4186119267546429168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
References: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Apr 2024 21:32:02 +0200, Luca Weiss wrote:
> Finally fix a warning about the apcs-global syscon used on msm8974 that
> has been around forever.
> 
> 

Applied, thanks!

[2/2] ARM: dts: qcom: msm8974: Use proper compatible for APCS syscon
      commit: c133cfc12cd717b72ce534477415446e1c33de47

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

