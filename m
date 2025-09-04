Return-Path: <linux-arm-msm+bounces-72079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FADB43F53
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D47B188758C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF5A3375BA;
	Thu,  4 Sep 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzLs1jLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809CD335BC8;
	Thu,  4 Sep 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996544; cv=none; b=TlzPLM6kQgHO6M0TyHmME3kbBbk/jqaM0T11CXyxsrdGMe5JAyT7AnCKfxuGK4gOJtv8UKhZx2tkyP5JXq9VoS53ssgwMI9UbUzywpomjZyi5C+OMrMXrQGEUR4XquTGboc5stW4o+RWGQadcCEthFu21LR7S5+9WH39J9O2Spo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996544; c=relaxed/simple;
	bh=JHSvbJN9XyO7iXA7BkLL03mfNXZPxjof/6gragZbhAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHgWLT3+kX86Nqu4BHEt4H/ItDOpXd703If8N+F0Cyayk65Fx6vaoWtog4sZZW681iePa7hwMdz/sKJxvg+lYcxyVJ4DIyAporQp7vODoppEt6mntuoSL2AOgh/xkugbf3XgAW+oBsdNEteCzWLOepZWH9LpGYoe26XthlCCUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzLs1jLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A61DC4CEFA;
	Thu,  4 Sep 2025 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996544;
	bh=JHSvbJN9XyO7iXA7BkLL03mfNXZPxjof/6gragZbhAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzLs1jLZB0047pCneh/THFDnUvUx0qgo22u5C1M2PqLYEFTGgXgp3J6am7+L7aycn
	 Qjp6kh8RNqZpvL2WNAFRVMSdY2ZYZW1Xfu4hlXAfgwGUkk1Tq917XyffuGv9hFYZmd
	 zPKZP9dTOogXQ48Q9Ib5NXe73YdfgbbPT5Tn7/dJDVnFhbbTDAzcQXI6kmkWSjY4GJ
	 DVKu7StTXJiBYtc931B/sD2KCisSC0NwsjQjDPZ+d5gwhMfRpatI0SGIIlaTDv7Cun
	 rLHaFtp7HlO94oCawfqAUn3TsdfHF+4p6UVeAeuLZh+YJnyKv4slU9YOrClGokBg82
	 54vfXnpb6rohA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add support for Display clock controllers for Glymur SoC
Date: Thu,  4 Sep 2025 09:35:36 -0500
Message-ID: <175699653015.2182903.5847736371433718879.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 29 Aug 2025 13:28:02 +0530, Taniya Das wrote:
> Introduce the support for Display clock controller(DISPCC) for
> 
> Qualcomm's next gen compute SoC - Glymur.
> 
> Device tree changes aren't part of this series and will be posted separately after the
> official announcement of the Glymur SoC.
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: dispcc-glymur: Add support for Display Clock Controller
      commit: b4d15211c4086a8a6d670cdba9649112fed67f86

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

