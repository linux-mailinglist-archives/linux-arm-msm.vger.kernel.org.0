Return-Path: <linux-arm-msm+bounces-33584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC549953C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 17:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621631F21469
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5FF3BBDE;
	Tue,  8 Oct 2024 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="P3XlmGrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872E1D31A0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728402556; cv=none; b=tWluL3YXYkbkvC25MBO0G9rdeEA7yUbm9dzv3N6NChzg6AC2fZVHEVI3WAo1RQPiyTKEMkj3s7EimbvzUoISaZrhAXwPgfyaBZTx3h+PBDpfvowivA9xD2I5ZEDMjoJM+F2GnFs4egGDdl+MmVYyFGAPSU7+/gOG3r+QjlWe2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728402556; c=relaxed/simple;
	bh=kvIEUq6lQOonXvMeeETUDhU/87tOBln1EkRtqekczS4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Roebb1rzXfV8gI7aJV9Et/VirTpdJsSTvceYLUgULIv/H5n1r0ZISLVi5XmemAh4ah6mnerTS9iL0FTSp8y6KvWsa3+JWwnqbz2jkoG2wNE+q3ZSIujIsUPkY+ZSPMdfX30gBZTvxbwlqoTXRgJkDbLSOGkmrIcdnKueTw9KXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=P3XlmGrM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so59632405e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728402551; x=1729007351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UV0xhuPGi7akzhMCY3jQ9J7SRS3lJqpZQcl7buLWaQU=;
        b=P3XlmGrMGnLCuCczr98zDdU+MTUBKh9y9jl4CKg7KKCUGfBp7A4cflfmaf53qdPGTc
         bFe1ejuWWdgUa/OhrlfjDslDdIQG6H46iNXzCfWKaxR6cSKtMf5+/nN9b2SS5BMOQQ6G
         9sf2yo4w5qH2mmPqo7NFq6q/FNKExVjxaPbhMGBYqYyWBFQKxdacFtyF7orST41+PqWE
         V9MnM70VoTTfK/0aBrOP8rW+vmEqYkdDHITQPcVyT+f05qk6mADnC3BDE1eAWyXG+9i7
         KhjSnUVgqvtr+Bha1ulzv4uCABouPYFzJQC31LOks79cxP18DnhhygVvjTLdFp48v1OL
         5bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402551; x=1729007351;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UV0xhuPGi7akzhMCY3jQ9J7SRS3lJqpZQcl7buLWaQU=;
        b=egRuRizR5+sE/k7bJsicUUZH4RkuySBnEd+K33QoHqc/Gsniii8ta/YovaSJDXGQ3P
         VibhGezYdb7H79+1rwWA1wKDYfUNjbvfYGdJV3m8X85WwFiS4m7yX7hqwMaugvZ5tfxc
         a+Aa8JwVzyP/sOr5iVTCdbukJC0Gg2Wo3fkrml+yKGWBgSNLNFzj6Ql8HjRPeeYwmwt7
         em7dNumkhKb95mRn9ozGZyPIm1Y01SOcy7P467sTZyndiasSFy7izawrdE5QK9eUVo2x
         4/WkJ7NWKseqcmjBj0zeH0B1ubBWBjfEHB6xicCkPz07/BOtH+Jf1A4dCLkbAZHwxqKC
         aq8w==
X-Gm-Message-State: AOJu0YwdkkfAdDABaypFEMa0tKvo8q5D2PUZ+G/dVqEeQ15DAeu0R6o0
	g1iU27/CeBq7je+xJcNSosdSmxDnmEDj+g4EP91AuRswPxZ+vpck12ud5UFvR85PXAxAlD2dng3
	7
X-Google-Smtp-Source: AGHT+IGKD8WC3wRG6K0q3TdpG5/U/6y2UB/o5uIkqrlbYU4kBq52xrt/4SyLJtlwgFVNT+aE3vwLJQ==
X-Received: by 2002:a05:600c:510d:b0:42c:b7f9:4bbd with SMTP id 5b1f17b1804b1-42f85ae90b0mr130369345e9.26.1728402550727;
        Tue, 08 Oct 2024 08:49:10 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43050578facsm25093265e9.19.2024.10.08.08.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 08:49:10 -0700 (PDT)
Message-ID: <96969a70-bf3b-4df4-b6fa-60eb20a15e13@freebox.fr>
Date: Tue, 8 Oct 2024 17:49:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Working on audio for qcom apq8098 / msm8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: MSM <linux-arm-msm@vger.kernel.org>, alsa-devel@alsa-project.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
Content-Language: en-US
In-Reply-To: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2024 15:46, Marc Gonzalez wrote:

> [   15.106412] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:3
> [   15.109935] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:4
> [   15.119041] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_probe:1759
> [   15.134672] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_dev_probe
> [   15.137948] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: of_q6afe_parse_dai_data
> [   15.146461] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:7
> [   15.153563] remoteproc remoteproc0: powering up 4080000.remoteproc
> [   15.166371] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
> [   15.169747] q6asm-dai 17300000.remoteproc:glink-edge:apr:apr-service@7:dais: Adding to iommu group 5
> [   15.170559] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:8
> [   15.179732] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: msm_dai_q6_dai_probe
> [   15.199345] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
> [   15.208834] msm-snd-msm8998 sound: ASoC: registered pcm #0 MultiMedia1 (*)
> [   15.216194] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
> [   15.221994] msm-snd-msm8998 sound: ASoC: registered pcm #1 MultiMedia2 (*)
> [   15.229582] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
> [   15.236045] msm-snd-msm8998 sound: ASoC: registered pcm #2 (HDMI)
> [   15.243211] msm-snd-msm8998 sound: i2s-hifi <-> HDMI mapping ok
> [   15.285770] input: batfish Headset Jack as /devices/platform/sound/sound/card0/input2
> [   15.298010] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
> [   15.542937] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up

If I try to play sound on the HDMI link:

# tinymix set "HDMI Mixer MultiMedia1" 1
(no logs on the command line or in dmesg)

# tinyplay /home/equinox.wav
playing '/home/equinox.wav': 2 ch, 48000 hz, 16 bit
error playing sample

The corresponding kernel logs are:

[  204.324095] msm-snd-msm8998 sound: ASoC: find BE for widget MultiMedia1 Playback
[  204.324280] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.330832] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.336452] msm-snd-msm8998 sound: ASoC: find BE for widget MM_DL1
[  204.342361] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.348471] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.354319] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Mixer
[  204.360152] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.366702] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.372545] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI_RX
[  204.378439] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.384520] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.390471] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
[  204.396400] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.403231]  MultiMedia1: ASoC: found 2 audio Playback paths
[  204.408912]  MultiMedia1: YO: dpcm_add_paths:1595
[  204.414855]  MultiMedia1: YO: dpcm_add_paths:1601
[  204.419435]  MultiMedia1: YO: dpcm_add_paths:1605 widget=MM_DL1
[  204.424105]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Mixer
[  204.429867]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI_RX
[  204.436139]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Playback
[  204.442394] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
[  204.448691] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.455581]  MultiMedia1: YO: dpcm_add_paths:1638
[  204.461316]  MultiMedia1: connected new DPCM Playback path MultiMedia1 -> HDMI
[  204.466220]  MultiMedia1: ASoC: found 1 new BE paths
[  204.473232]  HDMI: ASoC: open Playback BE HDMI
[  204.478379]  MultiMedia1: ASoC: open FE MultiMedia1
[  204.482911]  HDMI: ASoC: hw_params BE HDMI
[  204.487489] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6hdmi_hw_params
[  204.491715]  MultiMedia1: ASoC: hw_params FE MultiMedia1 rate 48000 chan 2 fmt 2
[  204.500814]  MultiMedia1: ASoC: prepare FE MultiMedia1
[  204.508108]  HDMI: ASoC: prepare BE HDMI
[  204.512978] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_prepare
[  204.517117] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_hdmi_port_prepare:1317
[  204.525864] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_start:1511
[  204.533151] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_set_param_v2:1050
[  204.540129] qcom-q6afe aprsvc:apr-service:4:4: YO: afe_apr_send_pkt:947
[  204.547820] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_callback:880
[  204.553692] qcom-q6afe aprsvc:apr-service:4:4: cmd = 0x100ef returned error = 0x18
[  204.560292] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
[  204.567937] qcom-q6afe aprsvc:apr-service:4:4: DSP returned error[18]
[  204.574262] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
[  204.583561] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
[  204.591317] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: fail to start AFE port 1
[  204.599101] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: ASoC: error at snd_soc_pcm_dai_prepare on HDMI: -22
[  204.608501]  MultiMedia1: ASoC: hw_free FE MultiMedia1
[  204.619781]  HDMI: ASoC: hw_free BE HDMI
[  204.624821] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_shutdown
[  204.628835]  MultiMedia1: ASoC: close FE MultiMedia1
[  204.637798]  HDMI: ASoC: BE HDMI event 2 dir 0
[  204.642745]  MultiMedia1: ASoC: BE Playback disconnect check for HDMI
[  204.646987]  MultiMedia1: freed DSP Playback path MultiMedia1 -> HDMI


Looks like the audio DSP might not be correctly initialized?

Regards



