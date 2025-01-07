Return-Path: <linux-arm-msm+bounces-44190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FAA046C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E72C164DCC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59181F9F5A;
	Tue,  7 Jan 2025 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUnwOeVO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F91F9F4B;
	Tue,  7 Jan 2025 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267966; cv=none; b=RK/Gs1qul2neCjBgl5OIqvzSwsx1VwUZBaXBr62sLsGm4/gBOyIhOHrDTCo72Ck2C7pXXSZshrITGqxHtFm2dUYrhahr0cvov8+AB7L00fBrfTGgrLURoxMJovYb+H/RHs6TNdoLYI8hE5kzzUmw0CCk4RBxQ0sqWeiZkvzzgu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267966; c=relaxed/simple;
	bh=YalzOIgb/S8G4eFzp1WQxGEpc8crU5MBZgHZHs1fIco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MeKDjXx1YvdYT+nBwi4D2mSHXRbyayydBe83CW/k8h6OvFXwDJRlq4lCTU1B3OQ7w4wn+Z90bx4/tthpGkK9dvIDXX8agGCrZO1bBPpdjOBuYM6e4fchKsWgK3FZug1o/FsKP82zms3CiMiK/RHfuZVyeEXhImUoIgia4sFmEJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUnwOeVO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D2FC4CEE6;
	Tue,  7 Jan 2025 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267966;
	bh=YalzOIgb/S8G4eFzp1WQxGEpc8crU5MBZgHZHs1fIco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUnwOeVO+lA3nxNGv6k8StedigMImSeqj+e+xvYns43ZhEAWMtH1cBK2RUejqUHQh
	 2gD6HXjb7yE1gkUEtsvYIb1ox0TogkESYo7Y2rwWmM+vZvhCpRGLH+HcW7ThznT5mk
	 lso7wvgLsnQU21yx1KnUGmicnX/dvMk0cYmY5zsVuy4y1BUZAPbO9NqhXyCEgetADT
	 d+ru5JLvxR2dqJmJrI0bcCWihhmO5dL0+tTA8PTXq3TW75K2S6KO1BF/1NesQdB623
	 IX0hn62TSdEQbxf6jDBgrJaLwwJ2c56QiS5HeE51jn5r6YCcJvVBK8lIJOzqDWOjuW
	 boi6/eBLPFV8w==
From: Bjorn Andersson <andersson@kernel.org>
To: ulf.hansson@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhupesh.sharma@linaro.org,
	konradybcio@kernel.org,
	Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH v5 0/2] Enable SDHC1 and SDHC2 on QCS615
Date: Tue,  7 Jan 2025 10:38:54 -0600
Message-ID: <173626793405.69400.2154688101885924121.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217101017.2933587-1-quic_yuanjiey@quicinc.com>
References: <20241217101017.2933587-1-quic_yuanjiey@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Dec 2024 18:10:15 +0800, Yuanjie Yang wrote:
> Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The
> SDHC1 and SDHC2 of QCS615 are derived from SM6115. Include
> the configuration of SDHC1-related and SDHC2-related opp,
> power, and interconnect settings in the device tree.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
      commit: 8009de059f8693142c651980cef07668917971c2
[2/2] arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2
      commit: 50f54d4fa3f4827d824b971485b0691e0985d0ba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

