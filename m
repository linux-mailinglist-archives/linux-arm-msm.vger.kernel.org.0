Return-Path: <linux-arm-msm+bounces-57559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80FAB2C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D060E177821
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80C5266B73;
	Sun, 11 May 2025 23:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8ZDkPC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F70266B5E;
	Sun, 11 May 2025 23:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004526; cv=none; b=F7g8Rm7Hb9oIjzpivsvl3CvCPmEXntsvlqKcgNfK0yxsdUvbwpOR2luiRdEBaBfpUQqKPl3XgWRsusY//TD+KnSJ+LA5Qty+RQiLIoDXdh6VvKo7jo5/IEje3yIQWnA6F+5SMJ4RtDbZTnZoTvbELWwDElOkGyWRdqy7ItD5/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004526; c=relaxed/simple;
	bh=M/X5D13f4bfVuNJs6hSpynUg1N/X+dGJUGW5gQ7uwlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7ZMOEKqBRZUKbbNz7aWrOa1cxhw7kSlF+JnYMEtK5fjy1/i+J5RgC3OOfbWZV16CExmwy8V4fzEMaeOZOmXyFjlt641kNKl4KNESDfKAaw0009oB1Wjo38bcGB9ld27d+1m483++2LVwwLrQDLvYNUZJvZlhqq40yh9UZnG3dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8ZDkPC5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51D0C4CEEF;
	Sun, 11 May 2025 23:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004526;
	bh=M/X5D13f4bfVuNJs6hSpynUg1N/X+dGJUGW5gQ7uwlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U8ZDkPC5KqNWcIR++rYw6oMtPMHFfz7x2BBnqn9aNJln4v+eff34OSJFeAEG+x9zb
	 xK7oOWHx998lgmdrTKzf4QNgGXWIPfHOzGxRKn4gXKzgFTNhYDk4r3dbmIfiICM6MX
	 so4SfQA3CZxBfpmGE0FUjIJMU8S07hnfCsVzbExtk9TbZhAFq/1erCKfPx4E3U22HZ
	 MQmLHk03rX3pT+qLSpQ6KayCMlHsH0oK7KBQ8q0NwjPZEFFJvthTPGzG76h6/YPZwm
	 I22HK/Zdcy8frL7n+GQzxneZI30gDx++mYeHuqir3qLZbR4P1jfwvOpDneo1fFlSjr
	 UMgNvQuWVTXxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Use q6asm defines for reg for all qcom boards
Date: Sun, 11 May 2025 18:01:40 -0500
Message-ID: <174700447982.10930.2650079258650335173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Apr 2025 13:53:39 +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Verified with dtx_diff.
> 
> 

Applied, thanks!

[01/11] arm64: dts: qcom: apq8096-db820c: Use q6asm defines for reg
        commit: e99e02edac8ba46fedc6536f18a86915af52b7ae
[02/11] arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm defines for reg
        commit: 0c5b597651e0c708b3dec4c6da56e70947c1c893
[03/11] arm64: dts: qcom: msm8953: Use q6asm defines for reg
        commit: d89ed52f3f506531c32767dc1b91cfbc322d6959
[04/11] arm64: dts: qcom: msm8996*: Use q6asm defines for reg
        commit: 01160256f4b2be614abbe24dcb05967e9916440e
[05/11] arm64: dts: qcom: qrb5165-rb5: Use q6asm defines for reg
        commit: 6ac93e5b21e025f54af5b5a3f0639632ce72b95c
[06/11] arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm defines for reg
        commit: 08b8a9fdced825dbd4553d14d45b3ae7a286ef16
[07/11] arm64: dts: qcom: sc7280: Use q6asm defines for reg
        commit: f1275b0a1de7339fd4ef7ea5cfaa5a79389fc6f8
[08/11] arm64: dts: qcom: sdm845*: Use q6asm defines for reg
        commit: 84665986b7dd7ac44b9703328fe0a5b1184e0a8c
[09/11] arm64: dts: qcom: sdm850*: Use q6asm defines for reg
        commit: f18b14d2bec4fb604e2feb81e12e2869f5ce82b1
[10/11] arm64: dts: qcom: sm7325-nothing-spacewar: Use q6asm defines for reg
        commit: 69a8b068dcf6dc42846f0764149461d2166a19a6
[11/11] arm64: dts: qcom: sm8350: Use q6asm defines for reg
        commit: 5e170ce69d204b59116539d8b3a789c4d5d82563

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

