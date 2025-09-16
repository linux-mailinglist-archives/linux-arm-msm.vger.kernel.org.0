Return-Path: <linux-arm-msm+bounces-73766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F40B59E7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A2957A206A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CD231FEE1;
	Tue, 16 Sep 2025 16:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1f9ggeW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AB28D8D0;
	Tue, 16 Sep 2025 16:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041904; cv=none; b=nrh3sr5C6PDPxr1VVsH7wqzEd6IHy+ShpzSDgnEiVvkjTBC7ApPre2v8nWmKGv/Us8xhrw1XmIhrp4QbBopQ2QQXE4eILkqnqEtZydOpABoJIqJoY9Wkjb0lauifhUhgLwSM4/XkHRUSPt4OIaDnp28NZcYOHMwlyKdQCirkMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041904; c=relaxed/simple;
	bh=kiLPzlJClREUhmDGqktzGmVahfw3q7Jt3zfwACtpeZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SE3ghfd7z5sjeLiA81cRLVlG1VoQkEOqVtLkCwacgBV3F/N8HohZDcQBYXtSFhtKho2o3y+ls6396HT+DOqXCleORodVpmDhqbxt8hNUWEbgAe3hvk6Sdblnt7RKa9Sk0cza+9mdZlETGpwMVTL06OkgDqkGBsNL9RC1qUeiwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1f9ggeW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17721C4CEEB;
	Tue, 16 Sep 2025 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041903;
	bh=kiLPzlJClREUhmDGqktzGmVahfw3q7Jt3zfwACtpeZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P1f9ggeWhli3JdYKtb3EVFyO5pYsc5tI3e9rjwXtN+qGSX+l8xtvvPyvpybvxGpj+
	 rlDQjv07maOWPBX6oIaw8I9Tr4d/YEzqLKgYj3mA3/e8vdIp/B0g1vnn3meQCCMljq
	 eOY1KhLEE9rJSQPdzuyIprXZumea9ZXqZVBVNmIzlfRr9rNNdLHaXPpTMB+VNA4ALG
	 EoOdeAWnKCmdrKBiFL2cqzIXC8uR9MOcmKAFMYI6CuvHgfZ1xz/IU0DfpqrVfOfDl8
	 INbJGaQC2JR+t0ciQvxZJGr0SwapaUZaWQcbe6GGKx/lBO2VofvdefLwpxn1qwjW7/
	 xI/Z+N0VOaj4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: Fix reg base of frame@17c27000
Date: Tue, 16 Sep 2025 11:58:06 -0500
Message-ID: <175804189846.3983789.4948907477569067061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915200132.774377-1-alok.a.tiwari@oracle.com>
References: <20250915200132.774377-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Sep 2025 13:01:26 -0700, Alok Tiwari wrote:
> The frame@17c27000 node uses the wrong base address 0x17c26000.
> This does not match the node name.
> 
> Update the reg property to use the correct base address 0x17c27000,
> which matches the node name and avoids the overlap.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150: Fix reg base of frame@17c27000
      commit: 9feef33b3f18eb370364a5838ed14baba10f3368

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

