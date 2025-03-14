Return-Path: <linux-arm-msm+bounces-51486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79FA61BA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6080788034E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FD3210F4B;
	Fri, 14 Mar 2025 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nx0eDeD9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA266210192;
	Fri, 14 Mar 2025 20:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982507; cv=none; b=ZG3z0dctA/TtuzdruuC+n//QMo+x4GsKPjjKibjRH+tNPusACT7BqFeqx7FlfvUaZwkX+uZEb0Lj6PTf46Kln20/FGubN/GcgR+40vialCm8Bn4oNeOYujgW6DXgiZpEj50I/b5C1A2BMvI81jiYb5PCZNqkHDRneDm5B+AkNrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982507; c=relaxed/simple;
	bh=+5BNyET7Nd0DMfyabxWam/ZgHXGftIJ3KwPDMcYepuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qe5zRjnfgMw6LKOHYa4dkqBOT3S65UzOxTAM/KR0843LI0ANiErgyAXqljVxhsC6v0EJIgEAuy//z3YtCAQ5/RpIiwGz/StOm0Q/uWipos1TJJLqyPWwEr6saTDJivelCiM1SIT4jmiHeQI2unzO7t36kK6WKJQtwhC1sG5kzjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nx0eDeD9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A469C4CEEE;
	Fri, 14 Mar 2025 20:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982505;
	bh=+5BNyET7Nd0DMfyabxWam/ZgHXGftIJ3KwPDMcYepuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nx0eDeD97BGA9TVihpvZKUYmzIncOLbeQN6mup7nZZ8awBjYAebHT+W4XkgDUydGe
	 nBIR2jWTp2E8TfU+qFm9qaCdNpVp0jGTEEEnbeA2duHkbw2dKhQB0DX7+Uyw9PVG3q
	 28l6oHMt0I9LuiKInD6J4l8TCxwvMtIry7sEGJ5E92uaq+7BQXrjaMZrM7F4ptx7y9
	 CV278wC42omb/mzvm4ZUjFWBbSx45m9zJogXnYbOZ+IqvXQDppYDqJlNN0EJHNRFLx
	 YJr2ASovoGElKUUqKs0TzYI0nlNM6AOxL2CM3qkVbSUFld1knz1L0l8HliwzlTAcPK
	 Btwh5YbHHNJeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jishnu Prakash <quic_jprakash@quicinc.com>,
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_lsrao@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Fix cluster hierarchy for idle states
Date: Fri, 14 Mar 2025 15:00:59 -0500
Message-ID: <174198247880.1604753.1528173788448249349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226-sm8750_cluster_idle-v2-1-ef0ac81e242f@oss.qualcomm.com>
References: <20250226-sm8750_cluster_idle-v2-1-ef0ac81e242f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Feb 2025 12:21:27 +0530, Maulik Shah wrote:
> SM8750 have two different clusters. cluster0 have CPU 0-5 as child and
> cluster1 have CPU 6-7 as child. Each cluster requires its own idle state
> and power domain in order to achieve complete domain sleep state.
> 
> However only single cluster idle state is added mapping CPU 0-7 to the
> same power domain. Fix this by correctly mapping each CPU to respective
> cluster power domain and make cluster1 power domain use same domain idle
> state as cluster0 since both use same idle state parameters.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Fix cluster hierarchy for idle states
      commit: 778dc0f876c70b3d781a49981560ec88e1b7083a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

