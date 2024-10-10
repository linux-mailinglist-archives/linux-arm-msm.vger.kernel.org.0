Return-Path: <linux-arm-msm+bounces-33905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE764998CE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 18:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C2E1C2366E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165B52207A;
	Thu, 10 Oct 2024 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="FsFHUMZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B91CEAB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728576639; cv=none; b=ZCOQ4ARV9Qmxpa5JqyZA6UaL9cIne6T1hWr0Ft6IRn0gB15JaBDA36XAb+ZJdQN4RSJ0bqrtm0JAGeRctteBVAfbDNgvUGxs86kQz0jeb5rVDxgkt8iSMNLqgFyq9n6PJn0f5++AS/p1Ax0GfFhQ0SKH0nVlZuFFf4c7Uu2mmUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728576639; c=relaxed/simple;
	bh=xDmL0Sjodm1MTH4cgStzt7L+Cwj70HjrLs7JUbAhNo0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QONaeALf4uklW2kE40+fVpG4fNb2f/USzHVbHpt3AZ8+XQQkbdZgmVYZSTgXEs8tx8OYyTTqevtGl/X/WVPoLrCKw3Rtr+dJaQzbBFAeT8PYJitWmirPBedS/wYm19EcRb9VzY6U1oJ17xQX318c5LVEs4yJVO7mO9XSnFFGv+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=FsFHUMZp; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac3f20f1dso11646431fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728576634; x=1729181434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BzAh/Ymx++It+K03y0tgy6GazaRcRDQGA5V1hyQM02c=;
        b=FsFHUMZpq2t4dPN2kIPVHG4VR4K6obIbpLWv3OOHNkJ3gRo/vwkDf3e1fR0EUp7XYt
         PV6OtsdBLs9dZ55AB1NtiWYotPlIcPvy7+tzObjSEUVsKiwdR3Ih4T71vhQ2ts5HJOlc
         tE/M9VBPy1DwNpiVwmyJ6bju6nN+uBuW7BSxp02dRK6mSpkXHYPScljdZ4W0ve2SZOAK
         JfLvz0/PH7Suefwh9iGDSg9dir4Egg4femG5iuwaCrSk3eeQaaNZR0bjK0knJpKGmBu6
         NM3705xqHjss1dRrMtwzPBwMb+c+4hk5tllp+s0E151A5uszTd3mLeRX7kzJbmfyUgwI
         gXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728576634; x=1729181434;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BzAh/Ymx++It+K03y0tgy6GazaRcRDQGA5V1hyQM02c=;
        b=H3zyJVNrwC2whgq21K200+RotIXThmv0V7LOWsjlNLvZWPjSObwd8iClc3/Qy0cgQV
         l5A+MfrXoAFolv5/Txsjgew30LlFQ7JCh7cjNHMhEx8XhGr2axASWtM1LBGSzYdMZkQE
         2D1xbAobSehn/yvH538gRbJq5d+TQ+DbrzF4jXsJRdLdq9OmgdaOD5BZ0Urq5Muc4LB2
         a4MgJvkO9quvrj4wkPQrTzQ3o29/KcaBTDF5JzIBRXOohmTa3U6Whnvp+yu4pzHimSCa
         krVYjcDsTze4c4ffNP1i0Kuc7rfD8rskRwC5YWjRaBbDBwc20XQaf1nT/Eg0nCYd/6SO
         QJaA==
X-Gm-Message-State: AOJu0YxWT3axyI/QR4xKGgsDq69QgjMK6ErGEtuWuyw7Qta72Toje8kL
	MMqFkhPCJYKRq/KVJ4KHrRo1vyBUR9rsfpJ3Iuvk7CD/XC1HwlwCN1D6N/sxrpqaArjTWkS1T13
	o
X-Google-Smtp-Source: AGHT+IFFsqihFAG3NebEV/2q++/ZjvX9EEsjT8KMbG+drPunQc19QKRwnGRP7MlnWXuXVen+SnnUqA==
X-Received: by 2002:a2e:d02:0:b0:2fa:dd6a:924a with SMTP id 38308e7fff4ca-2fb18757f2amr35243641fa.24.1728576633511;
        Thu, 10 Oct 2024 09:10:33 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d78b4sm20248845e9.10.2024.10.10.09.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 09:10:33 -0700 (PDT)
Message-ID: <429e80fb-c999-407c-b101-4a0f4284db43@freebox.fr>
Date: Thu, 10 Oct 2024 18:10:32 +0200
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
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Rohit kumar <quic_rohkumar@quicinc.com>
References: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
 <96969a70-bf3b-4df4-b6fa-60eb20a15e13@freebox.fr>
Content-Language: en-US
In-Reply-To: <96969a70-bf3b-4df4-b6fa-60eb20a15e13@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2024 17:49, Marc Gonzalez wrote:

> On 08/10/2024 15:46, Marc Gonzalez wrote:
> 
>> [   15.106412] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:3
>> [   15.109935] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:4
>> [   15.119041] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_probe:1759
>> [   15.134672] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_dev_probe
>> [   15.137948] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: of_q6afe_parse_dai_data
>> [   15.146461] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:7
>> [   15.153563] remoteproc remoteproc0: powering up 4080000.remoteproc
>> [   15.166371] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
>> [   15.169747] q6asm-dai 17300000.remoteproc:glink-edge:apr:apr-service@7:dais: Adding to iommu group 5
>> [   15.170559] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:8
>> [   15.179732] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: msm_dai_q6_dai_probe
>> [   15.199345] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
>> [   15.208834] msm-snd-msm8998 sound: ASoC: registered pcm #0 MultiMedia1 (*)
>> [   15.216194] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
>> [   15.221994] msm-snd-msm8998 sound: ASoC: registered pcm #1 MultiMedia2 (*)
>> [   15.229582] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
>> [   15.236045] msm-snd-msm8998 sound: ASoC: registered pcm #2 (HDMI)
>> [   15.243211] msm-snd-msm8998 sound: i2s-hifi <-> HDMI mapping ok
>> [   15.285770] input: batfish Headset Jack as /devices/platform/sound/sound/card0/input2
>> [   15.298010] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
>> [   15.542937] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
> 
> If I try to play sound on the HDMI link:
> 
> # tinymix set "HDMI Mixer MultiMedia1" 1
> (no logs on the command line or in dmesg)
> 
> # tinyplay /home/equinox.wav
> playing '/home/equinox.wav': 2 ch, 48000 hz, 16 bit
> error playing sample
> 
> The corresponding kernel logs are:
> 
> [  204.324095] msm-snd-msm8998 sound: ASoC: find BE for widget MultiMedia1 Playback
> [  204.324280] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.330832] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.336452] msm-snd-msm8998 sound: ASoC: find BE for widget MM_DL1
> [  204.342361] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.348471] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.354319] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Mixer
> [  204.360152] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.366702] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.372545] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI_RX
> [  204.378439] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.384520] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.390471] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
> [  204.396400] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.403231]  MultiMedia1: ASoC: found 2 audio Playback paths
> [  204.408912]  MultiMedia1: YO: dpcm_add_paths:1595
> [  204.414855]  MultiMedia1: YO: dpcm_add_paths:1601
> [  204.419435]  MultiMedia1: YO: dpcm_add_paths:1605 widget=MM_DL1
> [  204.424105]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Mixer
> [  204.429867]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI_RX
> [  204.436139]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Playback
> [  204.442394] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
> [  204.448691] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.455581]  MultiMedia1: YO: dpcm_add_paths:1638
> [  204.461316]  MultiMedia1: connected new DPCM Playback path MultiMedia1 -> HDMI
> [  204.466220]  MultiMedia1: ASoC: found 1 new BE paths
> [  204.473232]  HDMI: ASoC: open Playback BE HDMI
> [  204.478379]  MultiMedia1: ASoC: open FE MultiMedia1
> [  204.482911]  HDMI: ASoC: hw_params BE HDMI
> [  204.487489] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6hdmi_hw_params
> [  204.491715]  MultiMedia1: ASoC: hw_params FE MultiMedia1 rate 48000 chan 2 fmt 2
> [  204.500814]  MultiMedia1: ASoC: prepare FE MultiMedia1
> [  204.508108]  HDMI: ASoC: prepare BE HDMI
> [  204.512978] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_prepare
> [  204.517117] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_hdmi_port_prepare:1317
> [  204.525864] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_start:1511
> [  204.533151] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_set_param_v2:1050
> [  204.540129] qcom-q6afe aprsvc:apr-service:4:4: YO: afe_apr_send_pkt:947
> [  204.547820] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_callback:880
> [  204.553692] qcom-q6afe aprsvc:apr-service:4:4: cmd = 0x100ef returned error = 0x18
> [  204.560292] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
> [  204.567937] qcom-q6afe aprsvc:apr-service:4:4: DSP returned error[18]
> [  204.574262] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
> [  204.583561] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
> [  204.591317] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: fail to start AFE port 1
> [  204.599101] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: ASoC: error at snd_soc_pcm_dai_prepare on HDMI: -22
> [  204.608501]  MultiMedia1: ASoC: hw_free FE MultiMedia1
> [  204.619781]  HDMI: ASoC: hw_free BE HDMI
> [  204.624821] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_shutdown
> [  204.628835]  MultiMedia1: ASoC: close FE MultiMedia1
> [  204.637798]  HDMI: ASoC: BE HDMI event 2 dir 0
> [  204.642745]  MultiMedia1: ASoC: BE Playback disconnect check for HDMI
> [  204.646987]  MultiMedia1: freed DSP Playback path MultiMedia1 -> HDMI
> 
> 
> Looks like the audio DSP might not be correctly initialized?

[ Adding Bjorn & Jeffrey & Rohit ]

Right now, I'm thinking I might (??) need the code in sound/soc/qcom/lpass-cpu.c
to be called.

$ git grep asoc_qcom_lpass_cpu_platform_probe
sound/soc/qcom/lpass-apq8016.c: .probe  = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-cpu.c:int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
sound/soc/qcom/lpass-cpu.c:EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_probe);
sound/soc/qcom/lpass-ipq806x.c: .probe  = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-msm8998.c: .probe = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-sc7180.c:  .probe = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-sc7280.c:  .probe = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass.h:int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);


For example, lpass-sc7280.c defines "qcom,sc7280-lpass-cpu"

Binding:
Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

Corresponding DTS in arch/arm64/boot/dts/qcom/sc7280.dtsi

		lpass_cpu: audio@3987000 {
			compatible = "qcom,sc7280-lpass-cpu";

			reg = <0 0x03987000 0 0x68000>,
			      <0 0x03b00000 0 0x29000>,
			      <0 0x03260000 0 0xc000>,
			      <0 0x03280000 0 0x29000>,
			      <0 0x03340000 0 0x29000>,
			      <0 0x0336c000 0 0x3000>;
			reg-names = "lpass-hdmiif",
				    "lpass-lpaif",
				    "lpass-rxtx-cdc-dma-lpm",
				    "lpass-rxtx-lpaif",
				    "lpass-va-lpaif",
				    "lpass-va-cdc-dma-lpm";

			iommus = <&apps_smmu 0x1820 0>,
				 <&apps_smmu 0x1821 0>,
				 <&apps_smmu 0x1832 0>;

			power-domains = <&rpmhpd SC7280_LCX>;
			power-domain-names = "lcx";
			required-opps = <&rpmhpd_opp_nom>;

			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
				 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
				 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
				 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
				 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
			clock-names = "aon_cc_audio_hm_h",
				      "audio_cc_ext_mclk0",
				      "core_cc_sysnoc_mport_core",
				      "core_cc_ext_if0_ibit",
				      "core_cc_ext_if1_ibit",
				      "audio_cc_codec_mem",
				      "audio_cc_codec_mem0",
				      "audio_cc_codec_mem1",
				      "audio_cc_codec_mem2",
				      "aon_cc_va_mem0";

			#sound-dai-cells = <1>;
			#address-cells = <1>;
			#size-cells = <0>;

			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
			interrupt-names = "lpass-irq-lpaif",
					  "lpass-irq-hdmi",
					  "lpass-irq-vaif",
					  "lpass-irq-rxtxif";

			status = "disabled";
		};


Is there an equivalent HW block for msm8998?

Vendor kernel has no hits for hdmiif.

I don't see anything relevant downstream :(

Do I need to look at the HW block at address 0xee000000 ?

lpass-lpaif could be LPASS_LPA_IF_REG_BASE at LPASS_BASE + 0x00100000 ?

Regards


