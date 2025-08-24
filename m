Return-Path: <linux-arm-msm+bounces-70494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF59B32D10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8BA820772F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB7820F07C;
	Sun, 24 Aug 2025 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5DHQEL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60F1C8616;
	Sun, 24 Aug 2025 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004165; cv=none; b=Rxuinbm9kZr3opc7iY289f5D6PhkI8DaMrhk2tGiMCTrA3inZqrtU1CPcs1g8z1E/j+ndvZMvfM36yTCQIYmYRdMFYPcGZ9AwcwLomEC6crAoZRAPCRrQk4bkO2HX3NjXQW/Vr3W0ORmVSRZETQOR6cTeZhOHA92CqHVoj2w7AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004165; c=relaxed/simple;
	bh=ioej93QYzzFyI61JZKNLwSHcS50BW+0HgC3/p3pua/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q6TEQ7G1kzyyhg9WaEiCl2985fulUqjJ1zn1xe+XkSVS8I9Jh2XEw5s7KweGTjpwl6kkGDkaRFRBubu3kbhlZhaNiK56+k0qH3MBwdIR3sjPKFgp7urWup2gnzFuW2AsY+QXpnoZpzuqOu2xbX7jxIFOYvZnwx67dIwQXCfmKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5DHQEL2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84349C19421;
	Sun, 24 Aug 2025 02:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004165;
	bh=ioej93QYzzFyI61JZKNLwSHcS50BW+0HgC3/p3pua/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z5DHQEL2VwR/JioKb5CCgbD+nVQVgdOm3oG/imgq6JIU+AkThl5HZqp3r17IkjUtn
	 OG3NF/Ox8z0dnAz0Z8O6hxA6LgIiJjPB/Ath0/w3Tnjiu+/x888iNMQURFOjirYmCn
	 XeQX+ZzS+DdaJNtM9aDsThM0n3enSHyjszs3LMmk7BtptpUK7XDQWtT/svfVQphmBt
	 6bnc2dyOfraPNeCZyFRxtb14/D8YWoS0X626QhuEXHmmsEUQbZLYYFaftX24AiPPY0
	 rVxyrK7qYsZT+1zgxPQj+KVe+KTPZ2FqZq/8avdtE0aq6sv6AMW6mQiAUsXPS7i73f
	 qwVRFXk62sw8Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6150: move standard clocks to SoC dtsi
Date: Sat, 23 Aug 2025 21:55:37 -0500
Message-ID: <175600415283.952266.11074774618732107057.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250816-qcs615-move-clocks-v1-1-bc5665d6e1c3@oss.qualcomm.com>
References: <20250816-qcs615-move-clocks-v1-1-bc5665d6e1c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 16 Aug 2025 17:00:20 +0300, Dmitry Baryshkov wrote:
> Follow the example of all other platforms and reference standard clocks
> (XO, sleep) from the SoC DT even if they are defined in the board DT
> file.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6150: move standard clocks to SoC dtsi
      commit: be541b843114d5c92f89b367b51f5dfb76a99124

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

