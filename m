Return-Path: <linux-arm-msm+bounces-18745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37208B47AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 21:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115951C20D41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 19:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7731B15AAB8;
	Sat, 27 Apr 2024 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMa/cIwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC0115AAA5;
	Sat, 27 Apr 2024 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714246475; cv=none; b=e1EYdWw4JVtIOir+aBPs7CyL39Wg1InRggHv2IMEvcdd/X5LB3FLfHhdlb7HhS90CB5Ty9FKMwoU3dWaAM+CJx2LESUf/ThOiAQQjt3cwewemxlsS92hviN0r+BMW5fKJlyN/HHsJXd7iYhPoT3LomBLC0pf4QJbP1XAL7WXJ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714246475; c=relaxed/simple;
	bh=9mXvCoOYe07NthLlcwS5/plcRT0kQrP4fA2pIlYlRuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MT0d1MXhjvxLPge0VLJ/Wk8+kaq7vQzH7k2VYmhwRMzuVZQDVeoFFZuABL2kNjIUlj+ZnCHvhWkzUK034baNlVAhn3GxgY4+QYoEJrQpFkCeuqPRMzLSRpqQuR717SEyqrsGfpftlKk14Jz1e9jD8/uOKL8dE3E2Vz/oGimc/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMa/cIwB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36FFC32781;
	Sat, 27 Apr 2024 19:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714246474;
	bh=9mXvCoOYe07NthLlcwS5/plcRT0kQrP4fA2pIlYlRuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CMa/cIwBdTx6hnB9WWE/ZPV0oiOlGCIwbHOQ093Z2BC6BV3UWXBfl4MC3lHLx/0k+
	 NmWhqvqk5Db1CqIFO7NRhoG7PLHooIEA/lH2C6vOyX7AboS9BxTkR1YYwtUfUoPXVi
	 pmODT/OBIV5vsHAqdn2qLh3Ll3jKqaAH0J02NsP6R6yv/WaDnBB0H6QtiMLQtPQKkA
	 Mckfq8lgAtVzcLuCKBK5QNQ+Qnp6KljuoLA4ZMW9AZo25BsL/BGbTMv/wa19bAc3Qg
	 7bKrgcQtGbuEbXn7U7RPy4vnQwIEMhO54O8ywlsO/p6q65seKNkrTSuEeA8NLTL9nw
	 bBONMN2umx4kA==
From: Bjorn Andersson <andersson@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Bryan O Donoghue <bryan.odonoghue@linaro.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Arnaud Vrac <avrac@freebox.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
Date: Sat, 27 Apr 2024 14:34:23 -0500
Message-ID: <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Apr 2024 17:07:07 +0200, Marc Gonzalez wrote:
> Right now, msm8998 video decoder (venus) is non-functional:
> 
> $ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
>  (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>      Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
> [ffmpeg/video] vp9_v4l2m2m: output VIDIOC_REQBUFS failed: Connection timed out
> [ffmpeg/video] vp9_v4l2m2m: no v4l2 output context's buffers
> [ffmpeg/video] vp9_v4l2m2m: can't configure decoder
> Could not open codec.
> Software decoding fallback is disabled.
> Exiting... (Quit)
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: mmcc-msm8998: fix venus clock issue
      commit: e20ae5ae9f0c843aded4f06f3d1cab7384789e92

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

