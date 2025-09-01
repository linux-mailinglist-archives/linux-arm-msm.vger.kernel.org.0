Return-Path: <linux-arm-msm+bounces-71453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25FB3EEE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1A7166442
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B5A345722;
	Mon,  1 Sep 2025 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcGHIgpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA63451DA;
	Mon,  1 Sep 2025 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756160; cv=none; b=DDRUBKWJRpoPawk9xXWFOLof+GV56fgaQOh8eoWy673FjEVw9GHgAwGjnOAgro4taF4Fpxlmyq0pvxk4m4S9ygys4apg0Yz+IQkiV65JUQNYZg2ypRP0IbpLVkSej5c+YNcc19Eunq3LxjT8CY0KTLoepAdFcjJj38J6MA/Rt40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756160; c=relaxed/simple;
	bh=hWweElT7djCbTed3PF214V8Goh3Wcz0qNLBhwdlVtk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJYi0sUkp49AHInLGN3JP0/LUOLg/vXRsCm7lSFCe+WmCWWMM/Yo7VmNZyOQtwSX+b339BhZMwbgH4bYAMJXMXiFCTBiVUq5hu4i52P3GEvJaWT7ig+3cInyZ3vQz5juBQdBOVy/9cENldASnUWPrjavhsTAoKGgrMycCPJ2F3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcGHIgpD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADD7C4CEFD;
	Mon,  1 Sep 2025 19:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756756159;
	bh=hWweElT7djCbTed3PF214V8Goh3Wcz0qNLBhwdlVtk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcGHIgpD8FTBPmeuaDgp+Jga7Qn7N3xmuqOJMTIutgiJs9+8Z+TZR5xAAh7WWEvWb
	 a2ikQ1wXfaMVzabqbY7NXJsCxzEdZSRIEaOglnWAg2vyj0OcZ/EAyHSoRXpYjlE2wE
	 wfQW6IyEbYFHn7kgxcCttToXvqBJhTCrcyzJNMxQvhC4gmn6OdW+MUyMwv0KMMwoDN
	 mSTnUBqDSVzcm1HntvxwP0suzEid8kcN7s0SM84zWO0p2y2Lc6sgoBYlaYMR2swFMH
	 bOCfRCzGVu/UUD09eaN5gNavnz2lS6568QeNU8gUkHRAAPmgVX2nX/mgUfbswMV/jk
	 JdEot2hjZQu/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] Add Dell Inspiron 7441 / Latitude 7455 (X1E-80-100)
Date: Mon,  1 Sep 2025 14:49:15 -0500
Message-ID: <175675615152.1797303.10228710316796433483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716003139.18543-1-val@packett.cool>
References: <20250716003139.18543-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Jul 2025 21:26:56 -0300, Val Packett wrote:
> Since v3[1]:
> 
> - Applied R-b tags
> - Skipping the eDP panel ID patch now since it's been applied
> - Fixed the last remaining '-names before -0' order issue
> - Changed usb_mp: keep the unused PHYs enabled in the DT
>   (to let them go to sleep), like how it is done for the XPS
> 
> [...]

Applied, thanks!

[4/4] firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455
      commit: 30ee285f1e3cdc88ec7010abeaba0cbed800bdcd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

