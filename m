Return-Path: <linux-arm-msm+bounces-82397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECB1C6BD0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 23:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD4B64E391E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 22:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99D13081D8;
	Tue, 18 Nov 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WG1okD3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A90189906;
	Tue, 18 Nov 2025 22:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503670; cv=none; b=qVIRL1RmQIhjvXR0iga1YUEBKgGNmE8iLa4+WuIQZfeWnUO5Ntans52HjKZmx1LC74gemIGbsESyj1WxGO9OPzQyR9CFnlDnioEPTVrCCLIKIFSwzRwhB4JbRqTKimZPHYvQEt5WBkmoj3Ekcdkz9OELbWIlGqSHkkPUWcqRF04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503670; c=relaxed/simple;
	bh=Wfxb7j9J7f0Bmrk6k3DPKg4eyoRDEdLqadSfKk06jhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ODpVF3LH9ihSrUjG7jyRawadQXKF5WCQ4AMoO+oz7CBsKtE3qG8393YpiXvX9+HaIntWcUMa/naysULpdEuMD725Qc0A9kNzz5UbasilUWYeHyqvk5J0z2mNBYIV/XKIqV0Rl/X+wtV+idC4NnQl8haFVgHa5SukG6aDORD0viM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WG1okD3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BCEC2BCB2;
	Tue, 18 Nov 2025 22:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763503667;
	bh=Wfxb7j9J7f0Bmrk6k3DPKg4eyoRDEdLqadSfKk06jhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WG1okD3Z7l7HQwbIg95oLC0PE/tThWgj4KrtYYw+A4oAJjadKlWcUpPqW2GPyEstK
	 X0+2p/T6T8+WnP5QzQ9s1HTU4QBMW+a58sXwM+KJQIERpTkdLd+SggcZBdeBAp8KIb
	 7QFwPO/PfY4ZEHmX86FirJm168wbufFgC5AmGXLwAmoYcFRqnY+mdmhHZWD+xYlek9
	 OIUT9b0f7fmXCvdotWbGcR+L0k9QDDoOSYUqRfsXISC9CGBFKH+LXnz6rX/biqKJak
	 rMgL7J/GSQ2tZwDIJ9nN8u6B3XiREDHy9lRj5AzImNOXNeqHuzMfP0ztwiWI4Evn0X
	 lq5Mwyv8RKYcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v2 0/3] SDM630/660: Add missing MDSS reset
Date: Tue, 18 Nov 2025 16:12:32 -0600
Message-ID: <176350395161.3382332.13806197493961299097.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 16 Nov 2025 04:12:32 +0300, Alexey Minnekhanov wrote:
> Since kernel 6.17 display stack needs to reset the hardware properly to
> ensure that we don't run into issues with the hardware configured by the
> bootloader. MDSS reset is necessary to have working display when the
> bootloader has already initialized it for the boot splash screen.
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: mmcc-sdm660: Add missing MDSS reset
      commit: c57210bc15371caa06a5d4040e7d8aaeed4cb661
[2/3] clk: qcom: mmcc-sdm660: Add missing MDSS reset
      commit: 0a0ea5541d30c0fbb3dac975bd1983f299cd6948

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

