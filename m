Return-Path: <linux-arm-msm+bounces-50241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C86BA4E8C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C4E817A37A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3732D4F9C;
	Tue,  4 Mar 2025 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0fIf5Lk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527AA2D4F96;
	Tue,  4 Mar 2025 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107630; cv=none; b=JUMAVnB6g3UG7LSMUWkaBy6JrFZwgrgMH6HMe4YzQwEaQlOKUvUK+TL3OwuARtN3Sr28xvZaQHopfbvzgR1BhfgonWm0VNz4HJFXEYCJMNeswlmpGjvpsq7OlHl3mEa9niAXhbdPwXGAYePXXhQdpbY+GrQtfyIEnKA3PbkVNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107630; c=relaxed/simple;
	bh=lyFxQ5IUjLDopgDR0aTUQqnUDoqT73OFpGJnb/ypW6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWetOvX98QI7nplKFGgJw2T6z76vh1DBsqlv38cKDlNEI+68+AMm+XDQQkXhwj19ptMwIlE2xQopkaTPIxpp2gODAzKG6HxircKyXes5Rrj18/W3VnVhtwtKaXOTkPUD7QmTcUDx4T703BC4Wf8JqOwDe57pySMXNQxmKXfSwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0fIf5Lk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A59C4CEE9;
	Tue,  4 Mar 2025 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107629;
	bh=lyFxQ5IUjLDopgDR0aTUQqnUDoqT73OFpGJnb/ypW6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h0fIf5LkCU9N9fJ3OjaUXhJbxJZiy8QDgvpM/5qUhT+SbcgVQf7xS9x+MewDRrAA5
	 Cs+ZHyiyJPK6v4Ooz4ASgIIETr4HpbhF2VEbogo5QrfhE4ZJApVgx+hVO/s41y6ty+
	 t6MSOfntiWZR6TUwbFFVyn5MEqUU4h2iXMlurtAGkDIe+pKhO6jBh3ffN38uQHbRNy
	 jjr/wuMF2BnCgTpJV9N6wyXrcwPALrSn5uqcAuC9OSe/LNVcirmJSKlFFR6968Lj4q
	 pQkXEXxupvJ4rSJe3MtNdqzRud+Jt3GeT8ImMlNcAzSrckRkt7uJyyosvgOm9yBzRT
	 rvhmsMzpC9xRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Date: Tue,  4 Mar 2025 11:00:16 -0600
Message-ID: <174110761303.741733.2522984900645480505.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217-x1e80100-pwrseq-qcp-v3-1-a0525cc01666@linaro.org>
References: <20250217-x1e80100-pwrseq-qcp-v3-1-a0525cc01666@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Feb 2025 18:55:23 +0100, Stephan Gerhold wrote:
> Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are
> derived from chained fixed regulators controlled using a single GPIO.
> 
> The same setup also works for CRD (and likely most of the other X1E80100
> laptops). However, unlike the QCP they use soldered or removable M.2 cards
> supplied by a single 3.3V fixed regulator. The other necessary voltages are
> then derived inside the M.2 card. Describing this properly requires
> new bindings, so this commit only adds QCP for now.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
      commit: d09ab685a8f51ba412d37305ea62628a01cbea57

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

