Return-Path: <linux-arm-msm+bounces-34191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F2C99B387
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 13:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92D91C2180F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 11:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99FC19CCF3;
	Sat, 12 Oct 2024 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmOPj5zV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0EC19CC27;
	Sat, 12 Oct 2024 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728732404; cv=none; b=WwoiQaW0/fFPl7FKs4eqBbIw+jGfq/rOEIT6YQJBPF+VwD6g1GGseNmZ4CLel9b5jwtRwBX4zMOuBt5D0WUDPmq2/EBe7t0X0agy8WMctXzfkuCR69p7tNDi8CeDNEBefo1KnPCGNVSiin7gvJEtvEErWThKN0+J/X37uI9a6ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728732404; c=relaxed/simple;
	bh=ozWgqL4UktxLyLZYhW3nptSMtJ/SZyukKb1lUVsTyb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nf+nV2bJnSmOEK57xPVPvC5h7ARjIAoHnWPXhP//XBkGcq3gF5L/M93N7uc0TkJIt/lOjF06IfpNSRm8hXTw7niO3FnBYHd7dDFIKbo4njmRIj928D9h7XtZ/d34vRDuvPsecF46HtCR+EXDTTqGk0xNvagZAyeoGP6CB/mwikU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmOPj5zV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ADFC4CEC6;
	Sat, 12 Oct 2024 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728732404;
	bh=ozWgqL4UktxLyLZYhW3nptSMtJ/SZyukKb1lUVsTyb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmOPj5zVFGU35vsUa9CRKLcTpx5Q7WQj+0L+u7tnIXM4zmtrQMhMSVHc3IIQtdgEs
	 SEa4PAb13MUP9uujGHPrxLG1T3brFWXjl/v9UPEnQOleNqYSIbOmhdQLp8+xfCwpRx
	 34Bbtr5sWvLM/XnuiBemC6dRDehWTHB4o/LBt4xi3EQZLPPRLj/fjJFQomsAVhKWzG
	 Mav4Z+/sSLSaexV/Q1w4uAZiwCUUfDqF2H6C/YuJ9ZC6dwDeKzyYd4HmkFIpsTOc11
	 kYZJ8xFfqb2UwuIkMHt6rRv7p6RhzqE2NTxbMv8/swZSN0Ky1f82gPlgyScAPQR+sH
	 TSqnoia0RdfQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 12/16] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
Date: Sat, 12 Oct 2024 07:26:08 -0400
Message-ID: <20241012112619.1762860-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112619.1762860-1-sashal@kernel.org>
References: <20241012112619.1762860-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.3
Content-Transfer-Encoding: 8bit

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit b97bc0656a66f89f78098d4d72dc04fa9518ab11 ]

Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20241002022015.867031-3-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b337..50e175fd521ce 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -166,6 +166,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{.compatible = "qcom,sm8250-sndcard"},
+	{.compatible = "qcom,qrb4210-rb2-sndcard"},
 	{.compatible = "qcom,qrb5165-rb5-sndcard"},
 	{}
 };
-- 
2.43.0


