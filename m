Return-Path: <linux-arm-msm+bounces-43382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 650249FCCA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28DE31883263
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D57E1CB332;
	Thu, 26 Dec 2024 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEFe9A08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405571BCA11;
	Thu, 26 Dec 2024 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237637; cv=none; b=Gw21BSexy6e7MO8hFJRWZ8PmHIefKxH8vufZgsVROd6qwwHIdM32kQhUFQMiG8TQjhfklCHAi18s7LHHJgXpD6hDIY/Wfo3eXVvp/pq5vw9cCuqdi0EjmEpqHZ+eSRg0xFd1UAkED6Oggkeazl03N+DdzvWearaQRya5bLMPqCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237637; c=relaxed/simple;
	bh=CWEZ6hq+seNPra6GWCgn2ouf1cl+n3/OE5AyuPS3Vjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U6h6ucqVKiV8aed0Ok2SvYc73qHPZsJ7CoM4b+RD/z0Tv3X6LqMys4OYxR7MqewoFsw+gTwjX6hFa4Ok+EvfXlbkGA4TrXYnit+/B4wE1XzYQHI2Mp9w5mdIuRfNSrIsmn6sRuBDq+/Q8J6ezreZRwyP0Hw16nGygTjpeXLuYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEFe9A08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2753EC4CED4;
	Thu, 26 Dec 2024 18:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237636;
	bh=CWEZ6hq+seNPra6GWCgn2ouf1cl+n3/OE5AyuPS3Vjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEFe9A08LE6XgmlkCeg7xtm6oqFJewsBrm6ctQdfaFnIbk1h7SwSUWbGK5Yf2evMx
	 jhDjhAxnd5FXBAAL6stVWMPdTgINHK18+CW5atAB/eUJ4WjUNq6djzG7P+mtsnJxH/
	 uMaZO+3eUB/afWlol78zFzPXNwXtwCJ7OoKrSqn8aLcjhz0gecF4GcTMKFNl1ukUQz
	 FZpUKpzTI5ESicGOY8goo+IzGxzMqWp2Tuf6NKWp3r8sG1BpOYwwLyVbsGvYVvJ4M4
	 B00XKwKmmoVhtDWFB3Hw7m6ncXy/ZeC784onAHb6N+psVLSpq1a1cCbgKhhEL82fJ7
	 YTNN5xXxeSyqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: qcs6490-rb3gen2: Describe LED array
Date: Thu, 26 Dec 2024 12:26:35 -0600
Message-ID: <173523761382.1412574.385248528052562265.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241004-rb3gen2-leds-v1-0-437cdbb4f6c0@oss.qualcomm.com>
References: <20241004-rb3gen2-leds-v1-0-437cdbb4f6c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Oct 2024 20:33:41 -0700, Bjorn Andersson wrote:
> The rb3gen2 has three green LEDs for status indication, describe them.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: pmk8350: Add more SDAM slices
      commit: 25262976260e63564adc40c6c9cc02fc8918e2fa
[2/2] arm64: dts: qcom: qcs6490-rb3gen2: Configure onboard LEDs
      commit: 703b23b802be6432059ad2b56cbee943f7c25865

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

