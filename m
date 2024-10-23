Return-Path: <linux-arm-msm+bounces-35501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 250CA9ABCAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B491CB23675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A92F13F42A;
	Wed, 23 Oct 2024 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKYhFPKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8FA13DDB5;
	Wed, 23 Oct 2024 04:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656973; cv=none; b=agfAdkLPa1CVALufkml7WP8NcDVRNYaikeZPUIgUOnnqkKy3/t4Oi5iy5LXvi9W4d7oiLTCMOBfC1/OdipCigX6Iiuu1Gf4vjPxHLLaGzAjeVtAdHUNYIFIVOx1XZQ8Tp36xhe8mty3JEkyOBxHlDWrwMvSjvcIs5UvlQ59f1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656973; c=relaxed/simple;
	bh=dVPXntp9Ii6he5VLT8uK50sWHi563nQFcIEeSjHXga8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBqUqg6RmLjuQiRsgNrUOT8J6TG9FgW7+wSxH607E1btTZxqZU0MNfg5z0yjkuv00s+QajX0qAT8S2uKrVH+pTrTYwTIHGpxAoORqoC7Urs3+cZUByN3d2C6liKkhsB+cLfKZF+OjXuZ9eOGK6xqBVp6tTid+V5/WddsjqRTOmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKYhFPKi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E040C4CEE7;
	Wed, 23 Oct 2024 04:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656972;
	bh=dVPXntp9Ii6he5VLT8uK50sWHi563nQFcIEeSjHXga8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dKYhFPKiCYy4W7QftTy0Z+cm2JMmxafYQ1QAJ5iWbyR4+ux4HX47v9iRNUfn7HQl+
	 TIXtFKmB1yOhDFm6Su164x9Jl889XkNzz1yUSYqD3EwTlvVR/kqxNIkUgEzS74iQfc
	 PpWfg2mXVcRa3uTPhFNB7xQ5z4YwE7WuUPu3OfJKoHokp2jXlMmhvXGB17Eko652aG
	 XXicL9lImjIFff/CZNr9Dy2rVlH88ZvSCqyDV2ZwsgVJaj18gI2uArlpXAZ0k6BFSC
	 C+WBYyqSbbAv7J4yZA9WUpiJHxKpjWAC0hw+TdCZUh8XCF3t/4I15zIKbnpuhXwDuV
	 94ZSQUwRZ1pXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: add SoC IDs for SAR1130P and SAR2130P
Date: Tue, 22 Oct 2024 23:15:49 -0500
Message-ID: <172965696418.224417.11844510429148187702.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018-sar2130p-socinfo-v1-0-b1e97ea963fe@linaro.org>
References: <20241018-sar2130p-socinfo-v1-0-b1e97ea963fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Oct 2024 19:32:35 +0300, Dmitry Baryshkov wrote:
> Add add SoC IDs for Qualcomm SAR1130P and SAR2130P platforms.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: add SoC ID for SAR2130P and SAR1130P
      commit: 3b3214acd7f2dd506924cd57ce6e380cdaede423
[2/2] soc: qcom: socinfo: add SoC IDs for SAR1130P and SAR2130P
      commit: 3fa0104ed2f11e7f4b26bcdd82f9a45b983813c3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

