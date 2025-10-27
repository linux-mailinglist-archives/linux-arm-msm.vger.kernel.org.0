Return-Path: <linux-arm-msm+bounces-79066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8846C11DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB95580B6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E4E34CFC5;
	Mon, 27 Oct 2025 22:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nchRCO+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37234CFBC;
	Mon, 27 Oct 2025 22:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604534; cv=none; b=SNaB0aPcYLnHio9Je0rJ5G912VU6WtkEuQkic+TM+XHgZdvPeGQhDGagF0ZAlmA9eh3vQfI0tRL3oRxVqdTpAaSRTroh+cpZv9kQyR3xVrjFsHLVizNZe2K3oC8Y8vn3rXw4i39b8QY+xDUX0j86ivSU2V2dKv+lZAKrKXcz3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604534; c=relaxed/simple;
	bh=0juTfvWl/fSd2M2bvo6irY37X67zQvcJoovH643CYQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGCNSfmbKN4AvUR2SwmFVpADX0TJhhzN9DzHMVh2r5OGGy/v4O9LfNJMGm3y9MyYyK9au6KschDAy6W96Lh7Ykhvxgjb/wISkufY26k42lWd6zQ8LvKccF2nhHre+0fyIdixaAoYZJj0ursaitCxFMtMTVmWjvTbvkY2yaCral4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nchRCO+I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2601DC116C6;
	Mon, 27 Oct 2025 22:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604534;
	bh=0juTfvWl/fSd2M2bvo6irY37X67zQvcJoovH643CYQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nchRCO+IYh4jftBxwPH2VBPN5z2bOAv40sDH3gqfjQPGr6qy8ZjBvcTqIc/OFFZ3m
	 mIJuBIBmRejd3jJMs559hqxF2G5eis+Lc21IavmK218V/e1JkSD0jRM6SnUa+4+CTa
	 Q6IIbyHt+eXUSgeG3eU+Gb9Glc6ZnmIKoKfCXO6KHe4TGbwxjmUpNgUsU0ZiE0cSSq
	 vULjfR3OIoQ7Qk84RlNnfgN8q1lLD4TmkwnShJi9HRmpUKo/1S9xbiUj+UCYxl3i9D
	 4dBfYegvPSmMJl+Go4iyFN7tw0eSePTpgLv/69oQltAH7UKGVolANg3lBC+KAJRGqU
	 eQsGpYR+F1Tkg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-pmics: enable rtc
Date: Mon, 27 Oct 2025 17:37:26 -0500
Message-ID: <176160465237.73268.15387905802713977074.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017-add-rtc-for-lemans-v2-1-0aaf174b25b9@oss.qualcomm.com>
References: <20251017-add-rtc-for-lemans-v2-1-0aaf174b25b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Oct 2025 10:56:55 +0800, Tingguo Cheng wrote:
> Add RTC node, the RTC is controlled by PMIC device via spmi bus.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-pmics: enable rtc
      commit: 84ff999ae402b977c5518d0471fe9c4db453d6a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

