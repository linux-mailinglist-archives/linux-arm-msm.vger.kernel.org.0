Return-Path: <linux-arm-msm+bounces-80040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A61EC2948A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 19:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C752F3A856B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 18:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980782D9ED9;
	Sun,  2 Nov 2025 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slf4/HWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFF23D7D4;
	Sun,  2 Nov 2025 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106791; cv=none; b=kk+dt0vjyPbeGr5ZwJptQ4eZKUGsGM3nLNQmR+uxW0EuDJxucwgmkoEjMvBvkSPJkps+EtE29F+zLD1YcwsENbRUB/z0XthhuTOwU8xTw2hsKzbEQEOTqyxERioxjufuYYo+70lqE8EWja9DGcY5smVAED8reGmPY5sffgMc/fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106791; c=relaxed/simple;
	bh=sO+Jh9HQjKCryYD49NLsHv6pJ7RHd6oIeEOqxBspB8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OGnbKaePFE6j3QO0taJpSopGkkxJj2vGo1S7mYahOavjgascnah4YBdu9rWhSv0WjXmuXSNYAixrDHkpbmHa8OeBiPdUkVCzDaKRV9W0IbmRue3Xfcsnc3RSZ3D5OB2Inz4/3Yw82wsP8DbTqOxOODD8DGGQfgGTaYiXjW7u4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slf4/HWv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422A9C113D0;
	Sun,  2 Nov 2025 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762106791;
	bh=sO+Jh9HQjKCryYD49NLsHv6pJ7RHd6oIeEOqxBspB8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=slf4/HWv3e6Cnb2/B/6ssBPAc1peI+xvQ4RazINq0HQp77h9HKAR7uMfMGvWFAVlq
	 cyF1TOhPvjDjaCQpj4iJxh7nLqsvVBi6jnCJ79soA81rKND7hbyRy4klXqsTDXDpX0
	 ECr44DUXyDUF1ny1iRVdwKWp+uvLMsW67I3dyVZPvOAnpUiCI7mdHiQW30rmeyFhtz
	 pX7JyNmN3GQ11hZpD6G+X66AVgtjAvBd01QesCl3Txcp26uy3kB0ouUgRU7txQT8Ya
	 xh+6/YlXaV/r+REVdeHi7WeZ0BpuWoh1xVwbhuypsVaZt7RxViuq8NkeiWBzoGxycA
	 OjiI68Tld3r1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	Max Shevchenko <wctrl@proton.me>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: qcom: msm8960: cleanup and add missing I2C nodes
Date: Sun,  2 Nov 2025 12:09:48 -0600
Message-ID: <176210698639.937813.643585209118839199.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 21 Sep 2025 03:07:57 +0000, Antony Kurniawan Soemardi wrote:
> While working on adding support for the Sony Xperia SP (msm8960t), it
> was pointed out [1] that the msm8960 dtsi could use some general
> cleanup and reordering. This series applies those suggestions and also
> fills in missing I2C nodes that are required by several phones based on
> msm8960.
> 
> Changes included:
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: qcom: msm8960: reorder nodes and properties
      commit: df41d58048a51e0f9c9b7a3710349f23efbfe64b
[2/5] ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
      commit: 34fc20c4844454765c8ba32fdc006a2246a3f246
[3/5] ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
      commit: f239a394f91086bef632e145346e05fe65eb6914
[4/5] ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
      commit: 47f46fa7328b8429d4c41dd98e0268ed906ab50f
[5/5] ARM: dts: qcom: msm8960: rename msmgpio node to tlmm
      commit: d35984295d5ea5035c6255570716e68bdf826554

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

