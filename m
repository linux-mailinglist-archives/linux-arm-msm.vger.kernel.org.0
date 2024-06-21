Return-Path: <linux-arm-msm+bounces-23509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D258C911B13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 333C4B22534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBDC16C850;
	Fri, 21 Jun 2024 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icKG0jlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4751422D5;
	Fri, 21 Jun 2024 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950301; cv=none; b=Ug9ei9lutWlAAhZaEvQswMDjWSO0hNnXIuU1TGzWU/WyaKkL3p9MyldmAPgAZS3uxQSDdVv0YD870DYZnFrj12d/XLW/Sw76jy66Rffua3OOqxIFa5rrM3+ET8qdpQlYYj0YQz6ovn3RoUDTy4q2g5kyE+xj+kIM5KDfVuVEWqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950301; c=relaxed/simple;
	bh=vkZV0pdGgJiMfMy55Fj8wepD/h9GndppcGIcMV5oiXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIweSdHdMyF9Du2KWf9vnGWZJGKZTnEztx2Fe1IAorLatHdVYQoVgSh56wQdBVjn36aur3YYOq48su4uC2c5UX7mU+OUJ/BcKQq+G8fuR0jbtaid1Bdz9qr8FsldTN1pgugC5csMe9GnuZj8Q3INqCaTqnpIeXBCtE5a3zDSmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icKG0jlh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE04C4AF10;
	Fri, 21 Jun 2024 06:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950300;
	bh=vkZV0pdGgJiMfMy55Fj8wepD/h9GndppcGIcMV5oiXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=icKG0jlhiG1+YpSgzuiFxpMRycfgo6/ijk+lXf54s6Y7yQS6QCWdvbY/fzIo/AC5h
	 Rc0VnEkE8ggpGqIQCbL91I0LDmLzjfpj9uKXnVO7gOZxYuRcyX3U/UU+jWVxh8o9ph
	 5yuv94ilWoqpg+k5RvIqGwS2QuxF8xS1ViXptXmsMgjv2o4tgdq2Pg2lvdC7ReyuRJ
	 y2ipWRWhCx+JfBHuokp/FxWz6C4dOCq0gnmEQxNCYHTSVfAzZpY7wJxvkGJ5fHCNnm
	 2rC3qG3W6imgqCXBg6zjjujqwrAXyvOOzN+DcAElXgngn5Tz/Sf6qdHFTtIgcB8F2c
	 PTPM9/q9AKxTQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Caleb Connolly <caleb@postmarketos.org>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Name the regulators for QCM6490 Fairphone 5 & SHIFTphone 8
Date: Fri, 21 Jun 2024 01:11:22 -0500
Message-ID: <171895028802.12506.5589187790199098753.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
References: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Jun 2024 15:30:53 +0200, Luca Weiss wrote:
> As per individual commit messages:
> 
> Without explicitly specifying names for the regulators they are named
> based on the DeviceTree node name. This results in multiple regulators
> with the same name, making debug prints and regulator_summary impossible
> to reason about.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Name the regulators
      commit: 4c3849513fa1b4d9f6fbe08ecd65e2d6ae19c1fb
[2/2] arm64: dts: qcom: qcm6490-shift-otter: Name the regulators
      commit: e160c41b96b6d6f38b8646e3c914c630da21e105

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

