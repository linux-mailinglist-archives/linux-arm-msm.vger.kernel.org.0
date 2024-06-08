Return-Path: <linux-arm-msm+bounces-22111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC3900F40
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 04:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F6D41F21897
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 02:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F70EBA55;
	Sat,  8 Jun 2024 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXkazyhQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA5AC142
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jun 2024 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717813426; cv=none; b=GXPIxv+w/9KJdrasZjuYDPI66xLcu0TmktoaztUjgR02zkYVSnjzTAwQFjBstEVoevwIeoN8tZBXMKUKbG38T7aYgyq27LviW6wZ4i887pprxFdxmpyRMmSaGeFxXiXaBZOulMlOrch5QnpmQlwaSph+EG1g849Tdpi1654iE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717813426; c=relaxed/simple;
	bh=8jjq1gHnAInkHjlnzVHU3k3WOM8rwgC8BW9P44ujf30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHJM00ZIdNo4pvuz1k/YK6MvlNyCXKjju7vnt6thOEyd7RA1A1CFWe0dESKBvRC6P0iCAtjfQwcQQ1X/tIKXMRw/A92KAz5A2eMtlZXmLXcPG+rLZhWwmeOXVHLC6iwWzrqCSSohRy1/0HLx2PX7nGEWbi25x/HLxy4UJoCENzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oXkazyhQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso3078808e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 19:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717813422; x=1718418222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9V+yvJSOPxV6HkhRzMGuSvkZwjbSgJnARuZIs0WNJg=;
        b=oXkazyhQpHN69BweMcjQDAgGEPY3kHdVKg51kwW3ykRF0GUBD5v8S2u7ksfCU8gezQ
         l/SrxUCsVINh7s+HvyPHIQI70IcQciuPQt6xm2rGIJRlDLcxFKKHrvDrQKiZHcoPru2a
         A+i8PKuhRsdzdk3Q5th5edOqLLdfzfH0qUcHPvrFj+yEsGCWTmDIPapjVSuQt7exwBze
         ceHTnxaCHwvhrZ77BNnRqbEiOf2qxH016udv61Drw0rilPxSo2VAorMGKbW4Fxa5hiHB
         8u3kffaKaGWTJeweA7KKeYtqDEmo8UxjiuJhDRG10b2W8d1NPhPGdejl2wha7MbBrJ1y
         O1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717813422; x=1718418222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9V+yvJSOPxV6HkhRzMGuSvkZwjbSgJnARuZIs0WNJg=;
        b=uPQYHCaLSeNn25l24zcdaoAzbZC1YWtDTpuosxoPHIBQ+f9wQPzEfQeQhLKG1kpbVV
         IDacWm4+VjY2uDIWXH3o6hyGozV4genGu6VmETuk97eUu3hQkqr3xu0ZMCAtPllIJVOe
         hEcP9HAvrkk3UBYxZMt9KuFFZ3j/MdbQduRYBGJ5idNQ5BWCCmLzfoiyXWtA2V+RRQJt
         3+4OlX2rTcWC6gjq48Midc26jc3UlYoabsjDfkNlitYny/M2t3wgkgb4qeGrge51k0e5
         XIQRMLGMXQXCcerypiWyqFlK9NZK96MCt3aRKrPlw86kK0FIR6zGLMLaFqZBUP0sQffP
         rDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOozfUQiQjtX6RGU+A7Vf0yRoAmliWASLBdL+bZYjkOkDL7A2XoMPWNigyGtyhV2g6yWDsYB9BmgOO5ykW0UrJib9AZ2nqQ7SwtRswwQ==
X-Gm-Message-State: AOJu0Yyqdv+ApL+osIooBfmutn5zfusMaPZhSiQw9ddxgv/2u1A+W1ia
	QfxwF+3hJfRVGor5XfC/93SwqV0ZFE/X9OSAtCQ5b5QgHHWaGmkMmBM4OiiFwvlc+RIXL5ljXm9
	x
X-Google-Smtp-Source: AGHT+IErTuWuRC95/TFbpSXncWl4vvSDO39M3dhsa+Ymd9gZ9Y5tyCiwQrYM+fotBE75ODyhxZSJPg==
X-Received: by 2002:a05:6512:2526:b0:52c:812b:6e72 with SMTP id 2adb3069b0e04-52c812b70acmr60133e87.1.1717813421804;
        Fri, 07 Jun 2024 19:23:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb423cf1dsm708744e87.203.2024.06.07.19.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 19:23:41 -0700 (PDT)
Date: Sat, 8 Jun 2024 05:23:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
Message-ID: <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>

On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patchset adds support for.
> 	1. parse Display Port module tokens from ASoC topology
> 	2. add support to DP/HDMI Jack events.
> 	3. fixes a typo in function name in sm8250
> 
> Verified these patches on X13s along with changes to tplg in 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> x1e80100 is verified by Krzysztof with his changes in tplg 
> 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
> 
> Thanks,
> Srini
> 

I have been testing this patchset on X13s, switching between speakers,
connected and disconnected DP output.

- Once the DSP got into the state, where I could not further get it to
  work until the reboot:

rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
rohan pipewire[1749]: pw.node: (alsa_output.platform-sound.HiFi__hw_SC8280XPLENOVOX_1__sink-48) suspended -> error (Start error: Invalid argument)
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1


- Once in a while during startup PipeWire will try opening the
  incorrect DAI and then fail with:

rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22

  I think this happens if previously I have selected DP as an output,
  then closed gnome session, unplugged the cable and tried logging in
  again.

Generally, it looks like even though the Jack is reporting
'unplugged', sound daemon still can switch to to the disabled output
(or the audio card can be left in the stale state).  In case of DP
this frequently results in audio daemon or DSP failures.

So, the DP implementation needs to be made more robust, so that if
DP output gets selected when the cable is unplugged, the driver will not
attempt to configure the DSP.

-- 
With best wishes
Dmitry

