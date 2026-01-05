Return-Path: <linux-arm-msm+bounces-87480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C3666CF445F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FDE93013D79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122A5337B8E;
	Mon,  5 Jan 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5EPpjN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C64337113;
	Mon,  5 Jan 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622099; cv=none; b=Wug0/MtLEuaBzJ467sGLMFNeGDbr0wDkfWRgFd3tJGFcO3ERTaYkRdRdSrrq5O6aZcRjT/AukadCyFgixJza9qvEFtcZRJv5BvPj5CQTmO+idPKlpuFFPXkKl/q3Wk/2TL4IT6/emPY+8giB0nVyiuU6+UK4h2mVKWrJgbxLbRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622099; c=relaxed/simple;
	bh=3OV79LpxC1211GPFSsnQV2nefnDmApEq9Ljoz+ZHSPU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NapASt2kWb2hmEIg898t7GR23C8rFyH/hC1NHmSYIv1owUKu+7vkJ8Wl3WRxurKWJge0vCRsyQWUNZtH6p4qGv06ZqIZS3sB4wdV+W2tY9F4TfZZ+fEnoNbdP/PTLIFWNQcmyZILlYpumgWoGWgU1vqdapc8yPNtotXzpbfnwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5EPpjN5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CBEC19425;
	Mon,  5 Jan 2026 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622098;
	bh=3OV79LpxC1211GPFSsnQV2nefnDmApEq9Ljoz+ZHSPU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t5EPpjN5J78nqtG0zuooS1QPxXPRN1rTlj67vUox4CYC9oaotZXOKaUzD3LTYIfe0
	 HORy9nyLnTC0JXXpi11O2xOJCI1gZvk2nk9o/rrLvC5dXAqY2TKyqOp7HmMgngbshp
	 yKFXpmz/fTgt52yKnuhh34c2JloeYM3VNPxGkZYSXhytOZYRlGT31aIeePy6oJCC0c
	 ae7I8SWdn95aq8cIZ4UPugASlWs4mi8MokaRToUKdjMk8Fse5qzUY2YR2l/Cs53+sF
	 OEJcgAh5y9YpsNCSk9v7P91TeOoC74eu5Yi2h7Rf32Z+rCjTPvy2yKIXOHmLycqJ79
	 Y5Atqjdky1iQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable EC drivers for Qualcomm-based laptops
Date: Mon,  5 Jan 2026 08:07:27 -0600
Message-ID: <176762206409.2923194.14783444589092129127.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119082408.49712-2-krzk@kernel.org>
References: <20251119082408.49712-2-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Nov 2025 09:24:09 +0100, Krzysztof Kozlowski wrote:
> Enable the drivers for Embedded Controllers present on laptops with
> Qualcomm SoCs: Acer Aspire 1, Huawei Matebook E Go, Lenovo Yoga C630 and
> Lenovo Thinkpad T14s.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable EC drivers for Qualcomm-based laptops
      commit: 9f262627a90c3af102e066ad922e966d9f6fa24b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

