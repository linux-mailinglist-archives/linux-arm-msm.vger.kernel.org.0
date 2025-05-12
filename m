Return-Path: <linux-arm-msm+bounces-57648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D949AB46AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 23:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE89A19E4C2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 21:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38DA29A9DD;
	Mon, 12 May 2025 21:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEtubNxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB29290BC2;
	Mon, 12 May 2025 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086560; cv=none; b=WCB/MMNzlqncGN5DynzFFZ3kyEDovnY/S/5EivaawWi8QkKa06YU50R/MUT7cBVQdt/yOeiI60EPBPSsfYfMjQYk+vT4hmElaPxjH6dk2XNRV6hTOavVl3uJ404tZ1mhPfIMFkH0ylInUENIWWeg8cQBsBB7eOvTUpsRVLp5W14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086560; c=relaxed/simple;
	bh=C3G81qrv7/1vX1M5v42kE//YoE6ndcm9EiYPLOoN2Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHlwL0qAJaPXOGgh6d4CGAJDd3fmtKZ8PCr6HEt+gSrZMrHokf2WV+pDeTDmjx+ZVC2QYc8f0wULc23qLDAaZB8aDDXkP6rd7g9dCCbzIjU94i68dnhJfw8iN0kq0E29DrcKEz5By+3y+6onRl1D6HRnbEjOSuZf+YZpbTQLIqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEtubNxr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F874C4CEF3;
	Mon, 12 May 2025 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086559;
	bh=C3G81qrv7/1vX1M5v42kE//YoE6ndcm9EiYPLOoN2Ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QEtubNxr+eEj63xi/ebEFe0eRwKoZZwIZFOt7BxtLa4kB9MWXlJOptYAbNhEq1xWc
	 TgxQOjUGcl0+ztD0HEMgcHbwn8rp5P3vMdaZywMT4+WpJgoFwXqoYKlyvdG9X1v9lW
	 VSYgw1AmVVa9nsB1gklZy1gFsQcUoehjrIIuoroauhyR8psHOQFfT8Cifh7s4XTNPa
	 JiCofIyn7VPc+CU7CdTxtmEUJRrDghrVuPkDShxi7B1F7m7KDru/RJHsof04DYbOpV
	 VHeLDUihKXSscRaEzAXCIH/W60foyvlC7FJUvnUrWbtXk6zD+E3cxw2B5OxH2jlX/t
	 H4w7lzNpyhZlg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Moto G (2013) DTS updates
Date: Mon, 12 May 2025 22:48:53 +0100
Message-ID: <174708642735.3671.12706246098012962690.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 16:11:05 +0200, Stanislav Jakubek wrote:
> This series improves the accuracy of motorola-falcon's DTS.
> 
> As a side note, I wanted to ask how to describe the Hall effect sensor's
> vdd-supply. The sensor's currently described as part of the gpio-keys node.
> According to the schematic it's powered by pm8226_lvs1, but I don't see a way
> to describe this as part of the gpio-keys node (maybe it's always-on because
> of this? Downstream describes it as gpio-keys too). Any tips?
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks, power-domain to simpleFB
      commit: cbcd04ab82c61dc777a4b56014292b9467f10c4e
[2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock frequencies
      commit: db6e3f2ba0bf6ad069347050ff62f29ef0d88b14
[3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132 to 5.4V
      commit: 7bce56fd73ee7264ed04418dab1719164e42f113
[4/4] ARM: dts: qcom: msm8226-motorola-falcon: specify vddio_disp output voltage
      commit: e41ece7cd173486f6767de050deb2d8f0882a82a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

