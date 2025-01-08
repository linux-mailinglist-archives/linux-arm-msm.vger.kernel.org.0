Return-Path: <linux-arm-msm+bounces-44283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E574BA05124
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18E0E7A0F4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB900198E6F;
	Wed,  8 Jan 2025 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mG3FXJm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9204152196;
	Wed,  8 Jan 2025 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304775; cv=none; b=LTmLnhvFkCpKN8OOOQF6dWopy8mOaTtfLRxXVfgoYktN/hUBqI8r/QZQ9bYjVJlpH9dPMju290jnLRNl9nfWz+QH5g1TGjgqIERVFEEccf2Av2N6Xx0ClVqyA6OHl8McfEjRx7YOhuHD7U1LdogjP7rA11f9CWlQWmA/y/BEC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304775; c=relaxed/simple;
	bh=QDv28533d0uXLEK+wrB1KSFzljGnvpBOkcSfiyARGuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VelbgHgLLDbOJIEOiA9/YvyJkbr1Jtnd5wElOs7YkrqL0wbMJ/al0Mbl9Ci9B/hzt/+Uq4vQ9qfVlFagwRbyBcnkUJAq4hur64kcHSguQFv//yKWVrudD49FAdJ7298y95s3ASSPY5yWvlfNR1Axp3eDS7mcFjfPvMtyfT+kJp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mG3FXJm0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378B9C4CED6;
	Wed,  8 Jan 2025 02:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736304775;
	bh=QDv28533d0uXLEK+wrB1KSFzljGnvpBOkcSfiyARGuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mG3FXJm0hTEFBdBrgkgOrrSb1O/TIetNEcKJn06RfvruNLeaA1rcEdOEs1tnbJBXE
	 gCliKUsEohJCAr2fEyTFyBflQEqfw9e8xgr2IMwAG0rVtS6ND4p7nyD8nGUg8hloz7
	 5zEr5dpYTYgTVJELPQUbCLHtF11qFar7mj66bssQuKoJnmia0xq+CC80CFcPrwGLe9
	 +cRl9cgtlH7xkeH6w5S7DDyillXko/VS4x8Efos7HOwmxVBfPz7xVCqpjLXSUhGGqX
	 XRI/sEyo+Y4K1lz8HKI+Ad1KVO/EIQTKO8OeoaO+Y1LNbLCx1ho7ENShRe5F9jDq+S
	 2uISLs/2wcEHw==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 0/2] Qualcomm sm6115 LPASS clock controller
Date: Tue,  7 Jan 2025 20:52:45 -0600
Message-ID: <173630476482.101108.4425253140041761852.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212002551.2902954-1-alexey.klimov@linaro.org>
References: <20241212002551.2902954-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Dec 2024 00:25:49 +0000, Alexey Klimov wrote:
> Updates from previous version:
> -- no updates, just resend.
> The same version as here: https://lore.kernel.org/linux-clk/20241101012247.216825-1-alexey.klimov@linaro.org/
> just rebased and re-tested.
> 
> This is one of the required dependencies for audio support on sm6115 and
> its derivatives SoCs. This was written by Konrad Dybcio, however his linaro
> email is already invalid. Konrad suggested sending it as-is and keeping
> him in c/c. Some updates may be still required, for instance the
> maintainers line in DT bindings file.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
      commit: 030de8eafdcbc3d6c087bddb5450aea2b29520e5
[2/2] clk: qcom: Add SM6115 LPASSCC
      commit: b076b995e225b0e9c345b015a182352221334c3e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

