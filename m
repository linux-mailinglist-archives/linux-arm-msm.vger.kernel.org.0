Return-Path: <linux-arm-msm+bounces-35709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9799AEB25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9E6D1F21117
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C371E0B6F;
	Thu, 24 Oct 2024 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEAESeog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF41D1E68;
	Thu, 24 Oct 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729785334; cv=none; b=GAHSCd3hZnjU1X4hMjWqY3QbHcMsa98maCz6hWkuW2KaaQdXG8R1FZZRexbE5rbjpxzHmiWnvgT65HYePhIE+3eqrI9LFmfg1RZtSxmujZ1QSoq9TrOvCm/HEtar1n7E3Uae00WTt2r2nf5UCXSbzbW+8qSrquZ6x7f40IMiNK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729785334; c=relaxed/simple;
	bh=up5tM66yvBHtUg5sIFHZfzrixU4QG+l7uS/kR/VJb48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GOIXuqPptULmoyIneAsm00WB/5lYocvHHJ9FMZ6FqMQDgXJGoiZW/LgTDdeNwgWqmmP6M5dP1VERDzNm28hQLOi/ZJsygDckPLM0GwTwlIDWfP1D+NcloLOzE/GPwP6lUCFQyRhxKyv+QWkvS4zFwfI0O7oI81vi3RA46PMOjao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEAESeog; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F1FC4CEE3;
	Thu, 24 Oct 2024 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729785333;
	bh=up5tM66yvBHtUg5sIFHZfzrixU4QG+l7uS/kR/VJb48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nEAESeogULDRKC8BlZE2OWKCihGeN5uCoGtXhu273FzSYQ2im1Qyuy8IfqhFlLuZc
	 aTfnuY3k46ltcBKLOeUuxLJ789xKyWEOWPV8eO+O/6Lih81iC9k3NKH+gJaAONS7Cl
	 jivbsyKE+w/a4O0JokZ6qNGuUMXcQzfzdwbntaZbS4QP39KA4QGIK2EU9yFlAlXW9d
	 8Xch4XDDGb3p5xzfl8lJIWhlCakONfuTQzGj60SHkewNqWmtlwGZAkj5F+1O4JbaOG
	 Ys9Czvx6toHuj+sdS96641xra0xu1JUWFTl6JUh708GynhxSSb5T9YNbX+xOMg0Tn9
	 ksdaeLxWd74mg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix up BAR spaces
Date: Thu, 24 Oct 2024 10:55:30 -0500
Message-ID: <172978532615.301927.5097701528707896429.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710-topic-barman-v1-1-5f63fca8d0fc@linaro.org>
References: <20240710-topic-barman-v1-1-5f63fca8d0fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jul 2024 16:07:23 +0200, Konrad Dybcio wrote:
> The 32-bit BAR spaces are reaching outside their assigned register
> regions. Shrink them to match their actual sizes.
> While at it, unify the style.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix up BAR spaces
      commit: 7af1418500124150f9fd24e1a5b9c288771df271

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

