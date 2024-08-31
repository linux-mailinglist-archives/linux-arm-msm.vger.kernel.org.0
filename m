Return-Path: <linux-arm-msm+bounces-30330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B77966F04
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 05:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCD81F2303B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 03:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739C1136358;
	Sat, 31 Aug 2024 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBszon8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E30E61FDA;
	Sat, 31 Aug 2024 03:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725074333; cv=none; b=WBXhMTVYhfvwj3jq2txfe4KHJzYfoyL+iFO6VkI5JoBcnYacurioWuR5kVXkp6EwNqiOYopRebfaGnFiycBpUD1IghyVbSmTiBJu5U9GKgFbMUXajtqRco2xUPiJsp9f9O9jdKUzDcbkX66PFKIrmGOz/UgiIJ0c3qS8KCUIbwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725074333; c=relaxed/simple;
	bh=1xvvX8nGW9Yk2sPBvk44WXpp1oxAbBo8PtVxgg3kkgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QmvGopB7ASJgmWt5pjVj/7G4AVIWmVt/KqhTwjTxtNfpFRXqy3c/bq9qQgQK1t5m8jfZHTo2w6fB4cXKZfaH7xGKzXkGE6UTW1UeWQ6wh221CrN1I8ItsnHmFBQSntkt5vnoywL4DxvYjUibKCECA5LXVyJmLet4z90p7m72sc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBszon8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69C8C4CEC9;
	Sat, 31 Aug 2024 03:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725074332;
	bh=1xvvX8nGW9Yk2sPBvk44WXpp1oxAbBo8PtVxgg3kkgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZBszon8DF0RHiopG3H4es+SJhI/IhsJoWXby+uVeMBaxLFIxIc2wEds7HlMnLhVD0
	 25/DJdXmiDCct02zehCHEd2i1NUiIG4iYjHhfUpjgIruty8dRdyjB+CPxwJMJ+pkpJ
	 Ak7zVx7yuj/9KH7DerrAFrIfy2erpMKVQnq+3q3eaFZ4iUDXn5A8P3bZEcX7yJ9t1I
	 UIaltUanAA+m+2CKCFauOmos9bYGzzvEw6YEWyyN8KYB84oDYNkFUozwgYYJAADvg0
	 /IxK6avVNIFKctTIiZYMtt+iJv6MPy0z+8LxlWlRSp2SgczuAQihSADEhipKPq+XXH
	 We8kf92Mva6Dw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix PHY for DP2
Date: Fri, 30 Aug 2024 22:18:36 -0500
Message-ID: <172507431834.12792.6648009518755254915.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829-x1e80100-dts-dp2-use-qmpphy-ss2-v1-1-9ba3dca61ccc@linaro.org>
References: <20240829-x1e80100-dts-dp2-use-qmpphy-ss2-v1-1-9ba3dca61ccc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 29 Aug 2024 15:03:28 +0300, Abel Vesa wrote:
> The actual PHY used by MDSS DP2 is the USB SS2 QMP one. So switch to it
> instead. This is needed to get external DP support on boards like CRD
> where the 3rd Type-C USB port (right-hand side) is connected to DP2.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix PHY for DP2
      commit: ba728bda663b0e812cb20450d18af5d0edd803a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

