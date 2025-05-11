Return-Path: <linux-arm-msm+bounces-57558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B406AB2C22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 932BA3BAA1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F50326462A;
	Sun, 11 May 2025 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3Me6VQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394B1DD873;
	Sun, 11 May 2025 23:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004524; cv=none; b=gcnE2gUj/AMWN5khrdaC1P0lGi1DmGc1j5xtseCWIfkARxd9isSLcw+BZglaB2Dwj7qyj19gACGQGiw6T0Pvf/NYneQ20IiJSt1Kp0UEm9AdMT1vpbAueI4lnFd8VbZ4j6Jzm4A6Ww96S8chB6NwdRdfU0baKdtqPJedxwz39NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004524; c=relaxed/simple;
	bh=OtGk7e73fLyR+zN7tyhVrdION3z7l387Vys+tbkhEfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBKUMorHCm5YUhg/vpTQzHrg8fI16vut0CsKdCIn3myrWSbsnrzToxyFo57QAOm+ZDjnWk1kZDOqfAov0M3u6zl3sFWXAoHVxQLfq/Y8ovVagceTkDh9MqnFpLw8B/ygUbKK2TPizlaIZv9LvdDGCbihYeCnyCyR0aBUNX0TwNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3Me6VQi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C14EC4CEED;
	Sun, 11 May 2025 23:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004523;
	bh=OtGk7e73fLyR+zN7tyhVrdION3z7l387Vys+tbkhEfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3Me6VQiS95dN26SXIjhuEU0Y2sgwXmUpi20r4mZgxb83sztnHlqrrdZ7dnV8Xj8L
	 3HZOVhYP8FfEGQHHYcj6Gv+8KZtKJHqzT0PBfDiR6ruJhlQpQRt9ParHXB1j94pXLF
	 jhiMgrFldu374UUPi9jBcuxHI2kpbT7CIo8mztozZA3+Nyk/7i53E48CPw4phmao0b
	 1tfvL1Ah0QuPuM+ui/nFlo5uHkjXg2p3Qtam9tfSOLxBerf46MXICOjvXTItSWFNxF
	 P2ONBRxgszQrpgJKP/vaHWn0XhYLcuLxs4xeVOnxn2a8pI0EyuIStiBpodE01dfRg0
	 3HUZ1ajfolyVA==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Sun, 11 May 2025 18:01:39 -0500
Message-ID: <174700447987.10930.18174098523323137174.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: msm8953: Add interconnects
      commit: 6aeda4f2042711f99d63c5b7bf846c2bba711696

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

