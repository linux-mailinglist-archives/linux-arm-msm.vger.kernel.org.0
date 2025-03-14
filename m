Return-Path: <linux-arm-msm+bounces-51503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 636ACA61BE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C564B17F935
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4778228CBC;
	Fri, 14 Mar 2025 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLE4olWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9E227EA4;
	Fri, 14 Mar 2025 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982526; cv=none; b=HGL3tnhbmA40hyLUSuJokKB0PA5v3i3i/2mp3B6KhVr//GNy85peApktK3QzEyj0op2xGjwSRWqI9MQZRJ76WOAMr4IrastdgbhVRG66SCLfUonEKu28WyHxJDq99dZ66iDS+VMeD/6pH09sRfWjODUc9sHknmdJtj1YDRKjmOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982526; c=relaxed/simple;
	bh=E3t15luok7XrXT/SJfU1ZljKlG6U6URW0kwet+wyPoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7NsiYPEiXWJhsCZpe7k4370DNMFx0Ctdm0wP4RnOH58nNvetUVdZzPmdQsGqe+D1Zhjr3bOBFsHYgDuduV6Gyhm/LsjBBlnRtJqPCfJL/uq6tOH7y7m0CBG6MBFZRCQxtLl8AQkyy0qHAEFCveCif3JxQP4rI+Ss8GeOttYvJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLE4olWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD96C4CEF0;
	Fri, 14 Mar 2025 20:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982525;
	bh=E3t15luok7XrXT/SJfU1ZljKlG6U6URW0kwet+wyPoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLE4olWuH9MbP10R49RkGCnbocKb18DjKo0oBvrLeU0hxg5aUbgW17SJVO0D5h7qu
	 VczBsUjX8KP5PcwYMEDIn8DajEtCfXfahwt1vokBXV80jPPd8ZpJTRZ41PdxBB5SOS
	 OCzOOiz2NQ9i14E1Wc42VnJiug3hgMhWmV1d4+LxLxTgiER/InZpP7qfwMx3kbifnW
	 9PofctZ8Xbom8gM2aC/iTSzScy0qPKtjyZFBqvJVnHpVxDmckyKYgAbUYr3wC2o9v9
	 WWaLpF7I+1wrvXpplh/yEcGYhrR0Y2ZtR5w3jyb/M97eaubyo6/6x4E+TLTOwkdtB9
	 5gy13g6UtNFcw==
From: Bjorn Andersson <andersson@kernel.org>
To: devicetree@vger.kernel.org,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] dt-bindings: power: qcom,kpss-acc-v2: add qcom,msm8916-acc compatible
Date: Fri, 14 Mar 2025 15:01:17 -0500
Message-ID: <174198247889.1604753.4205064877911870592.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20240710155226.130086-1-rayyan.ansari@linaro.org>
References: <20240710155226.130086-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jul 2024 16:52:23 +0100, Rayyan Ansari wrote:
> Add compatible for "qcom,msm8916-acc", used in msm8916.dtsi, to the dt
> schema.
> 
> 

Applied, thanks!

[1/1] dt-bindings: power: qcom,kpss-acc-v2: add qcom,msm8916-acc compatible
      commit: 65f330ade7daec740ed8dbdf33ccfbfcc5fbf5c8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

