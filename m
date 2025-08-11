Return-Path: <linux-arm-msm+bounces-68553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A2B214A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 755B13E4714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2490F2E426E;
	Mon, 11 Aug 2025 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1F+HCGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9C42E425F;
	Mon, 11 Aug 2025 18:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937680; cv=none; b=MjaTNEukdLqRToRiu2dHtVknfbIteujGHfzhzQClaRm7P75Fe57ARSla9FbTNP9bpqjnGBQkK91uadjV9RnKAth1qDT/6wzVk0EdLUVkcfbB98/bdMKeqe16dPe6Z7Az0J3+OzIJhJFw8LimhiUHLc9oD+4Q38bQomwKCCbuBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937680; c=relaxed/simple;
	bh=RVSBmJaPaW4sp7Q1+ersLm/JvQT3GegCIpW08lHccqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4iKM/cn6onWy4OSgRDzyuMEW8kAfM67F2YWjlg8d6d484lepiICgQHR6PjgDhIkKguMJGVV927KOOnfVQ1htuTGtRhFjYJ5z74FO21xWeD+S8ojFFYDWZUDVTmFfpd2V/GVz7wW6un188H8gWk/O+LnRXa+5LErh93DtYd8vrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1F+HCGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE91C4CEED;
	Mon, 11 Aug 2025 18:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937679;
	bh=RVSBmJaPaW4sp7Q1+ersLm/JvQT3GegCIpW08lHccqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1F+HCGaYEOr8Keqwx6ecgh1Rf5yWYHHEm+xQhD8Mq+HFKsWxNyM0llNMROCrxgQK
	 hbywYshTIkBEM9+xeOlrxOMU7qjTW6ziQD8v09y5v1cKKyFZv79ilejNg3I0x/zBEa
	 2+QefHiezZVge7tOddJ+S30+cwiFs9yUWpqMVM/E1cXC2M/2ntTN7ZGbQtq8zCnMK9
	 URck0pukfoCjn8d40phITNYfgPw2GTpzKWK0AjLSxSk4QX+AP6BiLA1STn90eXOt6c
	 vqQB/ZrxX0B4uijXDH7MAzUPiBNlJ7zfeNF3npZ+tfUnQ+WbhWmBoy6zHPM5gdJygS
	 QltXEzQYUowWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Honse <calcprogrammer1@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey support
Date: Mon, 11 Aug 2025 13:40:58 -0500
Message-ID: <175493766112.138281.6310281799049896691.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
References: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Jun 2025 23:45:44 +0200, Luca Weiss wrote:
> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey support
      commit: 9da3f7add96708103c4cf1817d4bda97ea12b1d4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

