Return-Path: <linux-arm-msm+bounces-79072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F1C11D79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE4D188D2AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2B034F46F;
	Mon, 27 Oct 2025 22:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSavhqI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609F34F46A;
	Mon, 27 Oct 2025 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604540; cv=none; b=DT4pfnSlONwlUygvx2f7ZWJXWQWCPTFq2RpfvSav3OoDd8L7gAoD7s1WsEEc0wKwd7WbK6/9PJcKYX0PutcJdySan05i/o39bCH4WrmFpCWLS2n12ZS3NRnSEMUvOaLqtPbQVDaE8KgZh1FPPl5Z1WIDAJXgDQG92fCQyUQZbA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604540; c=relaxed/simple;
	bh=hqjGe5PNugeulAzW+sGHKBeDQl5vOiOI1uFyMfibwdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eSgRUqmtn2aBKRe9mARJfd0ApIiEwoDrIOFrI5IK2C9KnodmHwQfaENLN1AJG86ov/q5yrc367AyQSutPzEi09NiFgHmm4ZrZev0X7SUm01lkJTKDxl9egCo09YEHJZte/LGMcJD8+DWCGYZH0t/foM8LJ53iJgiKrZQeMlSQnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSavhqI0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A13EC116B1;
	Mon, 27 Oct 2025 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604539;
	bh=hqjGe5PNugeulAzW+sGHKBeDQl5vOiOI1uFyMfibwdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VSavhqI0MgqnQsceuXrtawcYjHcWzuzJzpqXdTvfRe2HkVRJaPH4QoeJsopo/FZKz
	 mZd5O1FpSLU0BjlPeq/taw4Ygp6imJVYLD58RtzwZiAmJbLjUB2GLnOUqOdO2dsTFo
	 quV6lJp0UDJn4XZSg0+p37mr7flv5DJ3H6mhn2yQHGgqDK9zVSKFpz/8N+OFEROVN5
	 IjxArJiJOsMqpeVWSpeS03YmvA/dd88f90hO+/AsJ5NOb3UW1a1C1oSqPAA8zz9qZ1
	 u19M8+46zb/6iMlEBR5vsiFv7lqvBncNgFe0jddT2aKlvedJUXUEvUOOGS8nocqAbN
	 Wttbr+Qcwjq7w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8550: Enable S5K3M5 image sensor
Date: Mon, 27 Oct 2025 17:37:32 -0500
Message-ID: <176160465220.73268.6446600226895504960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Oct 2025 02:54:57 +0300, Vladimir Zapolskiy wrote:
> Enable Samsung S5K3M5 image sensor on SM8550-QRD and SM8550-HDK boards.
> 
> The compatible property of the S5K3M5 image sensor along with the driver
> is added in a recent changeset:
> * https://lore.kernel.org/linux-media/20251012231102.1797408-1-vladimir.zapolskiy@linaro.org
> 
> Vladimir Zapolskiy (3):
>   arm64: dts: qcom: sm8550: Add description of MCLK pins
>   arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
>   arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card overlay
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8550: Add description of MCLK pins
      commit: 78db965913f70f72a71dd41992dd7885fca6084c
[2/3] arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
      commit: 3f857377578740f73fbead7f154a56db20e05f82
[3/3] arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card overlay
      commit: 08ce5274038ae7ad2b9e90bbcbeabe7548ec425b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

