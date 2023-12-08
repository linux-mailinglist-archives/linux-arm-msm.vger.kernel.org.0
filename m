Return-Path: <linux-arm-msm+bounces-3807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C480998C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD571C20C67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB721FB2;
	Fri,  8 Dec 2023 02:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhsuP/qL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A3A1FA4;
	Fri,  8 Dec 2023 02:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71012C433D9;
	Fri,  8 Dec 2023 02:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004001;
	bh=C4X0usRvU4SfNeCQDVnHklxdxVogajuqYsj5EA8PLTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EhsuP/qLqzU09UVyqPJv6qVzvYH6KqJzocZId2ZFWF/ZfGN8r3I2qedC+fXF8+CRC
	 2NHrZLWFoCxYSlZNB4KRG5dxW562DeoifTB5h6OMf4oGoaydyBLuwjCoCKeYriejjv
	 dmquoSqUJQwnuRtcflYf/l6Oujnxa3yMml7IzeMMHgfPn2FtnbXTR/+ttB+z/qGt3N
	 ijHzqBcNYho8zX0nfWEfo2mllD6PYoWeBwNgpN35xqI3VcFckoF7m3aO+66cSQQ4Pm
	 QQE9cwqQDNws+D5bpYvf0bOG6krddzh90DlLXJxShLTFuJyLILb7mXpe0+ETIq77xA
	 RfFMHO9RKpaCQ==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dmitry.baryshkov@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jonathan@marek.ca,
	quic_tdas@quicinc.com,
	vladimir.zapolskiy@linaro.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [RESEND PATCH v4 0/4] Add sc8280xp CAMCC bindings and driver
Date: Thu,  7 Dec 2023 18:57:26 -0800
Message-ID: <170200426913.2871025.848912452747333557.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
References: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Oct 2023 11:53:41 +0100, Bryan O'Donoghue wrote:
> v4-resend:
> - Remove erroneous "--in-reply-to" from git send-email
> 
> v4:
> - Resend of v3.2 addendum as v4 for tooling purposes
> 
> Link: https://lore.kernel.org/linux-arm-msm/20231024093919.226050-1-bryan.odonoghue@linaro.org/
> Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/qcom-linux-clk-for-6.7-camcc-sc8280xp-v4
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
      commit: 9bd07f2c558f9c7d41f3761df3e93bd9ebaa0d4f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

