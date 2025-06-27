Return-Path: <linux-arm-msm+bounces-62710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D79AEABE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B77B91C40E65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF89381BA;
	Fri, 27 Jun 2025 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvWJwdqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AF62BAF7;
	Fri, 27 Jun 2025 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985227; cv=none; b=V57dTvTQiP3FSCP6xQEE0R8HV6hJ5YAkoK6VigH365kb4o3LMPWR534HnwzzjJeLesU2qoG1YRywj1oGNsRqSgSfC7TCQCXHmRh2MRI8m2BoyhQTrKxK5wfjjwM0W1m4CqS8yr3vrdzWs0DCKxLoeUFsmvU5aOCSmsnQfzQ9GZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985227; c=relaxed/simple;
	bh=f9xFZ64ZazYnbLcMEuHUS/mLu2nEZaRiRv2AuGm800M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gPPPyFRYjCoyebb2cqkayGmbx1BANT5ajPZbu3lQLakm98AeJPQYbW5a6A61M0O/kQiGg4UXUh8M7cCNyk0b5UB/CCzKFSNV/7PTu76NqsNyLE4sy65uamHu7MNQVvYK2uzMjgeO5+PHECz0FlA+43DjcONH3e25M8bjrDFGIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvWJwdqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A253DC4CEF0;
	Fri, 27 Jun 2025 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985227;
	bh=f9xFZ64ZazYnbLcMEuHUS/mLu2nEZaRiRv2AuGm800M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nvWJwdqy7TwhmBM9D+f5VSB0SvOc1HrP+YkKvTPGB7MLFGqyNlAC7qi1wwrDHoyTW
	 wJy9dkBUwCIm/1VHf1fEXy7XYZOBZ2jxT5pM18Bnp1dmqf94L+d3Vsh8CD+NNA+/Sj
	 KxlhUfIGeXSfrqCkSGd6Ye/AWk0Sk7NBz/sfzFVQPpYc8+4pmlIuXtPOiDsFs4HNnF
	 EcIaDXxcFRpegrWL1QbqAy6joYt+IYEuDf0ye2KqsX4fWW9KYlpn2qgRKs2uCIEUVd
	 QxNBXjk6doje1WEurdmNt+YZx63isDnKzE/2pX9FHKPRMaI2XoYmV5soe5CQBDXygq
	 yGJ260AOYwoRA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
References: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
Subject: Re: (subset) [PATCH v2 0/2] Fix tuning on eUSB2 repeater
Message-Id: <175098522656.106297.12274853092906224270.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Jun 2025 10:26:34 +0200, Luca Weiss wrote:
> Update the dt-bindings to remove the 'default' tuning values, since they
> depend on the PMIC and are not guaranteed to be the same.
> 
> And add a fix into the driver to not zero-out all tuning registers if
> they are not specified in the "init sequence", since zero is not the
> reset value for most parameter and will lead to very unexpected tuning.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom,snps-eusb2-repeater: Remove default tuning values
      commit: db9f3e3ff9347a233a17eadefae9c1b29ec8f3ed

Best regards,
-- 
~Vinod



