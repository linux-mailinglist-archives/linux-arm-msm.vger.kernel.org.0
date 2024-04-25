Return-Path: <linux-arm-msm+bounces-18578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA198B24A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 17:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461E71C2101F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F2A14A603;
	Thu, 25 Apr 2024 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="IkFEhJbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3714A0B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714057633; cv=none; b=BgSBdsCQWrTppdaYvcR8/S3Gy338YCTnePGsZ0Z54zXAfspci4rT6pDFGEBrDfEu2w6ijPNLu4/sBq+dAyVh9LJapSKOnP76+l2q5wnYwri+Y3avE+FCvMKxWE+NRS7Ib10QnrOrSPBw5U5/9kFsESw3Ah1CLJn/BUIp93QZqlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714057633; c=relaxed/simple;
	bh=0PN2HKuL0sCeYZUNof0ck07/eYPfnph20CUo7XOKiKc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=IdpXQYxpJcpViLqrXwfedozFn4KkTwU6vdxjVgirvjQd8aIK3AvcCLQqnj6sU3mzvJWqS57quGCXbwtae5mQ6piITBFFc5KbHzaEsMLFgRz6Yq30FcGOBNsyif0pWEA4n4F3Mz7H7tufsdixIlDw77aEIQxgUBrfjR1NfMMjUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=IkFEhJbL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41a1d2a7b81so12663945e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714057629; x=1714662429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/fXUhZt2S4p9R/XsyhSURay8uWjCDZTJN450rlDysA=;
        b=IkFEhJbL1X1QhIwNZr1a30QhW13kdCwUrWgYKtbY37Y2H/bRH5EPjoT6A5jZx5v8C/
         gM9XLRKTzvFooOsPoiqTXP+Ov1+srdvdA5t9VazcXYWj1DJkClXW0W3fqlJmXuaWrqVR
         ooYotwNRp8nIPpwInSzyEEKwoGT011qhh3b4s1ILzS+BHiHmRIRYoskOYisZ1FJLJ7bz
         4h+zDIxOJX8ceeeoHE/ILDXPp+lAoGAFMI8NdXwEaPICBntaSXuHi1rI43Ta9q7ehQJD
         TS7Vd5BjgqMCzIMt3bC6V+Kp7he6f3MPZuRO2179azXuC+QfHRcDQFUzl0HNJdSx9BTo
         URbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057629; x=1714662429;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/fXUhZt2S4p9R/XsyhSURay8uWjCDZTJN450rlDysA=;
        b=gosBSPv0dneQ+3majGDsMZhluIaNcIjpgMWGtrIYLjVfmmJGBbZUTEVQWfgeB1C2sV
         tATgC0HUbdhfxK8HRIn03XuH0OdzSB7K0nZk68/ZYLEyGeYroUF6frNtP2DSOsNacA7H
         N2ylCTN1erAxU9ne0ZrnTax86yHiWkAnNBdBMXKJMpu7Q/viMGjMN1ys2E3HIqsQ3u9f
         hhwe3E+EI8R4b8tavmLSJIM513/dfXYh0M+AeLi/eH0sI4X4n7gQyDbiLL2lGIglkO0v
         Y/rxA1W4nI7LQYSxdqn9EYwoAz0AOKafXj+wDPuxBBXKQhuqCh+ntWe1jMKOl4Cjgoa1
         l+EA==
X-Gm-Message-State: AOJu0YymmN+g76sTfXxDs0+w3Vm9OStaIf2n4IxBBbmsiRkwR2Rfzuii
	hiKVSiuFvZuTUtbmnzEYWyudJ8ke36nXjgI7KnBVsc3E8f8hyKUMLNdiQeKtxHY=
X-Google-Smtp-Source: AGHT+IHXIsOujtIHx/V6GQNkxEnY8Z6p+nJBnA+dHwry82/dvW29voxka6K7M51Py86qwW6olCWaRw==
X-Received: by 2002:a05:6000:1448:b0:34a:e07:a2fe with SMTP id v8-20020a056000144800b0034a0e07a2femr3151800wrx.21.1714057628747;
        Thu, 25 Apr 2024 08:07:08 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j2-20020a05600c1c0200b0041ac3e13f1esm9485599wms.37.2024.04.25.08.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 08:07:08 -0700 (PDT)
Message-ID: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
Date: Thu, 25 Apr 2024 17:07:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Right now, msm8998 video decoder (venus) is non-functional:

$ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
 (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
     Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: output VIDIOC_REQBUFS failed: Connection timed out
[ffmpeg/video] vp9_v4l2m2m: no v4l2 output context's buffers
[ffmpeg/video] vp9_v4l2m2m: can't configure decoder
Could not open codec.
Software decoding fallback is disabled.
Exiting... (Quit)

Bryan O'Donoghue suggested the proper fix:
- Set required register offsets in venus GDSC structs.
- Set HW_CTRL flag.

$ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
 (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
     Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
...
Using hardware decoding (v4l2m2m-copy).
VO: [null] 854x480 nv12
Exiting... (End of file)
real	0m3.315s
user	0m1.277s
sys	0m0.453s

NOTES:

GDSC = Globally Distributed Switch Controller

Use same code as mmcc-msm8996 with:
s/venus_gdsc/video_top_gdsc/
s/venus_core0_gdsc/video_subcore0_gdsc/
s/venus_core1_gdsc/video_subcore1_gdsc/

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h

0x1024 = MMSS_VIDEO GDSCR (undocumented)
0x1028 = MMSS_VIDEO_CORE_CBCR
0x1030 = MMSS_VIDEO_AHB_CBCR
0x1034 = MMSS_VIDEO_AXI_CBCR
0x1038 = MMSS_VIDEO_MAXI_CBCR
0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
0x104c = MMSS_VIDEO_SUBCORE1_CBCR

Fixes: d14b15b5931c2b ("clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
Changes from v2 to v3: add mpv results and Fixes tag.
---
 drivers/clk/qcom/mmcc-msm8998.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 1180e48c687ac..275fb3b71ede4 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2535,6 +2535,8 @@ static struct clk_branch vmem_ahb_clk = {
 
 static struct gdsc video_top_gdsc = {
 	.gdscr = 0x1024,
+	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
+	.cxc_count = 3,
 	.pd = {
 		.name = "video_top",
 	},
@@ -2543,20 +2545,26 @@ static struct gdsc video_top_gdsc = {
 
 static struct gdsc video_subcore0_gdsc = {
 	.gdscr = 0x1040,
+	.cxcs = (unsigned int []){ 0x1048 },
+	.cxc_count = 1,
 	.pd = {
 		.name = "video_subcore0",
 	},
 	.parent = &video_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc video_subcore1_gdsc = {
 	.gdscr = 0x1044,
+	.cxcs = (unsigned int []){ 0x104c },
+	.cxc_count = 1,
 	.pd = {
 		.name = "video_subcore1",
 	},
 	.parent = &video_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc mdss_gdsc = {
-- 
2.34.1


