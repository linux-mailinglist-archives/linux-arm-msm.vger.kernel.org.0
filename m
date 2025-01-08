Return-Path: <linux-arm-msm+bounces-44286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00564A0512F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FBB118831F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEBD19F11E;
	Wed,  8 Jan 2025 02:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKrdTiLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041519EEBD;
	Wed,  8 Jan 2025 02:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304779; cv=none; b=EadzpkWwzg5Dvxoh/rgitKYeqoHSLcaKY0bzLOZbWWGnjmis6RRJwkpd3nONzB1KpnYLUlvIJXQCQw+m1Yh/NqBPGoS36EajkUaAd8l/xhNNBkKhDjO9zrvySN3crvBpUbc7DWVv7Wv2G+kJa/gnjOvKjjOS7RL5Zvf7L/dHkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304779; c=relaxed/simple;
	bh=b4fCvkl3uhYqf25MsohfZkB7z8xKS/5w+LHCKT0ogZM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IfxybSMHNhxKM0UXVhrmvsGe1Ixvzr3W0pvwQ65aahOK3B6LsN9rf3p6R9tKZsXIfJDs8in7RvYcXS5gSGjiwOP3jkv5BhHNkKRGO44OINpkkmQyBJo74872y4TWwqBwi0b4yp6Zh4eZvqHmWQ1HwxZBIxJo7n1tK4/lwvqEYdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKrdTiLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EA0C4CED6;
	Wed,  8 Jan 2025 02:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736304779;
	bh=b4fCvkl3uhYqf25MsohfZkB7z8xKS/5w+LHCKT0ogZM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RKrdTiLCojvzzqn91a64Bl6v0NJi0dXoaQoZVqUpIcYQaJyNLP2hnH8eVyMZXcD0S
	 BvRIf9ZeBtSHPtW0Y1wnjLnzOkJEzNm57Xm5EWOZEfabKup9XJwI5FEl8hJWcUxcEw
	 oWtyheb9hnCE3zl9RAzmIicI/cUtdHR9l8wIO2HFC6HKfxaQnujqOfJlvYyRKakfSg
	 ipdqi6Wx+Q3UaxvT17qyipPjiA7HFfQn9D/xBkPaAKlKIF0gj9Em6cSWnMxqoXWMgE
	 E4HUP/CebNKvp0xlnyA39hm1AysVnOKZvzQbKOQcGzb8ao+U7rvMQlqY9kechjBXkk
	 pPKQJojcIT7Ig==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/3] qcom: ipq5424: Add LLCC/system-cache-controller
Date: Tue,  7 Jan 2025 20:52:48 -0600
Message-ID: <173630476476.101108.12953046253443479376.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241105102210.510025-1-quic_varada@quicinc.com>
References: <20241105102210.510025-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 Nov 2024 15:52:07 +0530, Varadarajan Narayanan wrote:
> Unlike other Qcom SoCs, IPQ5424 doesn't have multiple instances
> of LLCC IP and hence doesn't have a LLCC_BROADCAST register
> space, and the LLCC & LLCC_BROADCAST point to the same register
> space.
> 
> Alter the driver accordingly and add the relevant entries for
> enabling LLCC/system-cache-controller on the Qcom IPQ5424 SoC.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller
      commit: 9e2ca54195af42bf2b52a5c6349e0a751b1828b1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

