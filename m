Return-Path: <linux-arm-msm+bounces-22117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB328901229
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 16:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76714281C02
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 14:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032896A353;
	Sat,  8 Jun 2024 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bfs8qCpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308982557A
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jun 2024 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717858586; cv=none; b=sltUeNvtOtI6InZtk+8qISG3Yb4iTm9r3RHIJznf2JkMyHFIch0JJ11ZuHHpFFAdbqQSnfo/SPJQGVv8OFljefdMrp6dCi04dvADWq9NI0VrbqF4PiW1xc0XmSFM4IJtHKKtVDkO8rzXvSWrLqPkOXuWL2A8Vey1q44UGgysEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717858586; c=relaxed/simple;
	bh=dqPQf0sQY27ayUqdo+VIE8le+JpFdCmmdo4c64tioGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OP70s1UZlUb9A8+zG9lvbUU0ABo5YcSQMO21xZ26UOVixpm8W2Q2510uecrNLUSsYYPvmmnke1uEHMFlAiKfxIr3KS+7ppOyK1epB61Y+YPhvs0uLDIvb4Yk96phfZ1J+tn2lIfSNBILot/ZZ6T7uwfYvpQgAJXaVXJEpULopLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bfs8qCpS; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dfafe87b5fbso1683149276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jun 2024 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717858584; x=1718463384; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XsX3hty+D+AHRDtvdfjVtw4OVbF3WX5AC3es8JeM3yw=;
        b=Bfs8qCpSezWdJlFg91m4Oylb4pViCnlj7EbBvVx7u4SMv2n29OmdU3oZ4mpbKgCFyh
         WNtbF9mcEaD9zDUrK8gUUDj/Pwv7VyvI8OvTokQgNSTjyvobHJzuQbphETYZiEG7Rt7t
         45CBJ7XKS4bcDFh+yVNnQ5Xk2CrM65NOWsfP879AWTndKHoMzQO1vrzUuteQjhUrY2cI
         wzFRKewiiwskj6cgVyjgEN8e0IcxvhALOJeWyVldSxYptNXdPtVrqt3okdwkj9RQ00jP
         D54H23/C/I6eHuc7kOypWkWWPbsOzjM0lCWVk1e57XmiFZO+qnQoGQOSIEPLwMg6fQ5l
         b25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717858584; x=1718463384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsX3hty+D+AHRDtvdfjVtw4OVbF3WX5AC3es8JeM3yw=;
        b=ShsE5p108wNp6FlGtO18/xP1VSv5miY1K462ky1E4TF7tbkscFqQnKefVj58JXnyzZ
         OSBCl+IXAW4JppN0jNtIajzYjdii2NvLwZwgZM1U9u8a/K/+RXMYUIoI9BOfi8vgok9d
         b6TsxZ+5um7y+bkc2kwBeWtaCugJ9IIhWqLvDeTmGU2Zotc+0hzIGY/Oz6PUOm6z95ye
         nSU/g0du5zCSZY3+dx9FhgNmRMBzfXyni2tbDLOVd9BtH7iKtCkrVBytwvUsWc1YkHaY
         0mN5bwq/0FQetgyFGF76LT9WXRPcXjc3H1lyE9ztXRhCosjqDQWsyrIR48hbHbKvIATO
         7CdA==
X-Forwarded-Encrypted: i=1; AJvYcCVR/IgtGr5HhPdgB6kOnFDIcJ8GoSC424nYyYJoVE2eqbnGX+AQTcGNsCVyznxFX99Vlu4tes6hB6eIuL/ANWFs4GGMXKm39f0oXpAAkA==
X-Gm-Message-State: AOJu0YyNlL9Bo3V6FmUU8+wD+fVmkiALKD8AjtjyKP8o5SW0Upe3qoKA
	VckujSCI4F5H6LGmOF+qgwRdSEWY9pIoV7KBYqJyF2D6wFKXyJYRuNwnYAv1Rmm/yhLXaoX6nOA
	6KtuFDLFtQays5JkOEvcuDJStBwCWFWHf4d0BVw==
X-Google-Smtp-Source: AGHT+IGZWqZUzqNrVGDIoc1u0I2wXkZf1wtlFQPedLfZtvoKBbtfCQI3l9B9610V7doEPtEk0nqZWOyQbdZ9z8mJOeo=
X-Received: by 2002:a25:244:0:b0:dfb:14cb:f08b with SMTP id
 3f1490d57ef6-dfb14cbf21dmr846140276.23.1717858584122; Sat, 08 Jun 2024
 07:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
 <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2> <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
In-Reply-To: <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 8 Jun 2024 17:56:13 +0300
Message-ID: <CAA8EJpqMk9vujHAmF+xSKBDzR1LM9w-M7a8vxcCkXey9VpHBhA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Jun 2024 at 12:12, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Thanks Dmitry for testing this out.
>
> On 08/06/2024 03:23, Dmitry Baryshkov wrote:
> > On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >> This patchset adds support for.
> >>      1. parse Display Port module tokens from ASoC topology
> >>      2. add support to DP/HDMI Jack events.
> >>      3. fixes a typo in function name in sm8250
> >>
> >> Verified these patches on X13s along with changes to tplg in
> >> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> >> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >>
> >> x1e80100 is verified by Krzysztof with his changes in tplg
> >>
> >> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
> >>
> >> Thanks,
> >> Srini
> >>
> >
> > I have been testing this patchset on X13s, switching between speakers,
> > connected and disconnected DP output.
> >
>
> This series changed the Jack event names by removing HDMI string from it
> as suggested, did you update the UCM to reflect this?

Yes, I did. The pipewire properly reports 'unconnected' state, but
nothing stops user from selecting the unconnected device / verb.

> I have pushed changes required to
> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
>
>
> Can you also try to  clean the asound.state restart the pipewire.
>
> > - Once the DSP got into the state, where I could not further get it to
> >    work until the reboot:
> >
> > rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> > rohan pipewire[1749]: pw.node: (alsa_output.platform-sound.HiFi__hw_SC8280XPLENOVOX_1__sink-48) suspended -> error (Start error: Invalid argument)
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> > rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> >
> >
> > - Once in a while during startup PipeWire will try opening the
> >    incorrect DAI and then fail with:
> >
> > rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> > rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> >
> >    I think this happens if previously I have selected DP as an output,
> >    then closed gnome session, unplugged the cable and tried logging in
> >    again.
> >
> > Generally, it looks like even though the Jack is reporting
> > 'unplugged', sound daemon still can switch to to the disabled output
> I think this is to do with ucm changes requried for new jack name.

No. The jack (and the pipewire status) reports unconnected.

>
> > (or the audio card can be left in the stale state).  In case of DP
> > this frequently results in audio daemon or DSP failures.
> >
> > So, the DP implementation needs to be made more robust, so that if
> > DP output gets selected when the cable is unplugged, the driver will not
> > attempt to configure the DSP.
>
> I have tested this with
>
> kernel:
> https://git.codelinaro.org/srinivas.kandagatla/linux/-/tree/dp/sc8280xp-6.10-rc1?ref_type=heads
> ucm: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> tplg:
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
>
>
> with the above on my x13s, I can properly do switching between dp0,dp1
> and speakers with no issues.

Have you tried switching to the unconnected sink? Starting the
pipewire when the previously selected sink is now disconnected?

>
> Can you try them?

Is the changing of the JACK names the only change in the UCM? compared
to your previous version?

I've used the following topology, fom the topology repo / x13s-dp branch

5206af2e1915b8dba52da2e59fb5ebff audioreach-tplg.bin




-- 
With best wishes
Dmitry

