Return-Path: <linux-arm-msm+bounces-43417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1929FCD17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75DC81632B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447651E04A0;
	Thu, 26 Dec 2024 18:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZR7cLO1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1285A1E0499;
	Thu, 26 Dec 2024 18:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237677; cv=none; b=dK/c5GGo4/laby7bvDnCacBnY+7NmWCV4aLKaKgMBNlI6WNehIjY3U3c+ezO+n67NdYaCC6GrTwYWVHNY2C4PYZELl2boqVlk8MCf6Y0CQ3dF31feQ6GuI9bdxVVQxH3WSkSwZZRljnnMTpRypOW77ZvuSDxbs5mCuskAQcdE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237677; c=relaxed/simple;
	bh=xDPOWKVzJf/ByJqPshQMd7NypddYgG6wquYO8V6nH1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nvTTJ1eyp2SkEwP7rgT2pS6AUdOCzwGj1Zm2i92iFM0O2FjyGYBUNQNOETpVeV4WtiGFwUYa8N+0m12JU+bTwgcGwea0wE2PoWUqKrqhG+M0SFyDQ9MQRBGbzOHCCP953duZ2GybK96NbaCm3a8Wohhi8WHOdwHmabjuzaQRULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZR7cLO1a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC54C4CED1;
	Thu, 26 Dec 2024 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237677;
	bh=xDPOWKVzJf/ByJqPshQMd7NypddYgG6wquYO8V6nH1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZR7cLO1aYoWdxbokbfRKvFH2wxkZWBK3ikXEOWS/QNdjS1TB4/GwzgJYTIpFlXYJi
	 8e8nqWcTsmsHBG4KzXQ2KdjLKwq2skpLZk7MjQXFbX82Gm1l6SA1K+OfoyfpJMli4a
	 83foJUBaxmY9l8vaFbKlz8E63WkNMlc08I54UZ2ODPDgzei6i/+c4w2gORAyKKtWsC
	 d8fxECmz5zdRSMyjxxyXfSxkWdKtiC9SHzQvK9YiBmMbi/rCDbNDk1ZYOdeMx/1e6D
	 OpZEuBMrazSYSPYm15rDLN3cSmUf/nQlZdIh+frKz213+o3W5UqXnTR1iJHC0TGuqD
	 QK+1qfEqdfC1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH V5 0/2] Enable TRNG for QCS8300
Date: Thu, 26 Dec 2024 12:27:10 -0600
Message-ID: <173523761393.1412574.1384588834243703699.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
References: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 Nov 2024 12:13:15 +0530, Yuvaraj Ranganathan wrote:
> Add device-tree nodes to enable TRNG for QCS8300
> 
> This series depends on below patch series:
> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: qcs8300: add TRNG node
      commit: f1b359bdf0a51cc6a0a57279fa44b81d23ec28eb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

