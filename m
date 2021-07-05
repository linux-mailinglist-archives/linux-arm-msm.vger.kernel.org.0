Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7F33BC2CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 20:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhGESo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 14:44:56 -0400
Received: from [94.230.151.217] ([94.230.151.217]:57234 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S229725AbhGESo4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 14:44:56 -0400
Received: from [192.168.1.138] (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 2189D23B1D;
        Mon,  5 Jul 2021 20:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625510537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sm4ok18k3JHTrxqnJgqO18ef94s7DhLXE2dESxfzsuM=;
        b=nPhJGgJxilS1tw6a7FfomF6kCluJas88W1k987Y2MhvT7cMT9SE3hJcqPV95LjQmUPfJgo
        6jin8V8bRemwTVDnN9GoapHjTIcKDq9wSSeKD9/dY3ou86Zv0kF93oz6mz1Z1n5+GVz2LY
        ebmwrPypXDsz0AAyfhFCY5sSEHCQ5vU=
Date:   Mon, 05 Jul 2021 20:41:29 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [bisected] BSOD on Nexus 7 at boot caused by "drm/msm/mdp4: only
 use lut_clk on mdp4.2+"
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     robdclark@chromium.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Message-Id: <5XBSVQ.FHBKUZUJL53S1@ixit.cz>
In-Reply-To: <9e4fa957-d1a8-8c1a-e3a3-4eb180e0cba2@marek.ca>
References: <QWQPVQ.PR7CBFAW563A3@ixit.cz>
        <9e4fa957-d1a8-8c1a-e3a3-4eb180e0cba2@marek.ca>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

right, it's 4.4 as you say.

dmesg snippet with drm.debug=3D2 (and with patch reverted):
...
[ 0.852417] [drm:dsi_bind]
[ 0.852454] [drm:dsi_bind] dsi probed=3D(ptrval)
[ 0.853459] msm_dsi 4700000.mdss_dsi: supply gdsc not found, using=20
dummy regulator
[ 0.853927] [drm:msm_dsi_host_init] dsi_get_config: Version 2:0

[ 0.855224] input: Elan Touchscreen as=20
/devices/platform/soc/16200000.gsbi/16280000.i2c/i2c-1/1-0010/input/input1
[ 0.855536] [drm:msm_dsi_host_init] Dsi Host 0 initialized
[ 0.855986] [drm:msm_dsi_runtime_resume] id=3D0
[ 0.858051] [drm:dsi_host_attach] id=3D0
[ 0.858250] msm 5100000.mdp: bound 4700000.mdss_dsi (ops dsi_ops)
[ 0.858372] [drm:adreno_bind] Found GPU: 3.2.0.2
[ 0.858484] [drm:adreno_gpu_init] fast_rate=3D450000000,=20
slow_rate=3D27000000
[ 0.858907] [drm:msm_gpu_init] ebi1_clk: fffffffe
[ 0.859087] adreno 4300000.adreno-3xx: supply vdd not found, using=20
dummy regulator
[ 0.859441] [drm:msm_gpu_init] gpu_reg: (ptrval)
[ 0.859615] adreno 4300000.adreno-3xx: supply vddcx not found, using=20
dummy regulator
[ 0.859760] [drm:msm_gpu_init] gpu_cx: (ptrval)
[ 0.861653] msm 5100000.mdp: bound 4300000.adreno-3xx (ops a3xx_ops)
[ 0.862071] msm 5100000.mdp: dummy supplies not allowed for exclusive=20
requests
[ 0.862359] [drm:mdp4_enable]
[ 0.862439] [drm:mdp4_disable]
[ 0.871375] mmc0: new high speed MMC card at address 0001
[ 0.873012] mmcblk0: mmc0:0001 HBG4e\x04 29.1 GiB
[ 0.873605] mmcblk0boot0: mmc0:0001 HBG4e\x04 partition 1 4.00 MiB
[ 0.874216] mmcblk0boot1: mmc0:0001 HBG4e\x04 partition 2 4.00 MiB
[ 0.874881] mmcblk0rpmb: mmc0:0001 HBG4e\x04 partition 3 4.00 MiB,=20
chardev (247:0)
[ 0.881122] [drm:dsi_host_irq] isr=3D0x2020302, id=3D0
[ 0.881928] [drm:msm_runtime_resume]
[ 0.881966] [drm:mdp4_enable]
[ 0.882114] [drm:mdp4_disable]
[ 0.882195] [drm:mdp4_hw_init] found MDP4 version v4.4
[ 0.882230] [drm:mdp4_hw_init] fetch config: dmap=3D47, vg=3D47
[ 0.882276] [drm:msm_runtime_suspend]
[ 0.883103] [drm:msm_dsi_runtime_suspend]
[ 0.886256] [drm:msm_runtime_resume]
[ 0.886305] [drm:mdp4_enable]
[ 0.886462] [drm:mdp4_disable]
[ 0.886685] [drm:msm_runtime_suspend]
...
Best regards
David Heidelberg

On Sun, Jul 4 2021 at 11:07:53 -0400, Jonathan Marek=20
<jonathan@marek.ca> wrote:
> On 7/4/21 5:12 AM, David Heidelberg wrote:
>> Bisected to: drm/msm/mdp4: only use lut_clk on mdp4.2+=20
>> =7F("eb2b47bb9a03206a645af40a3128a00264b0207e")
>>=20
>> Slightly memory damaged output (pstore dmesg after 1-2s poweroff)=20
>> before =7FBSOD (just clean blue) and freeze from LTS 5.10 [1] :
>> ...
>> [ ( 2.2077=EF=BF=BD=EF=BF=BD] [drm:mdp4_irq_error_handler] *ERROR* errrs=
:=20
>> 00000100
>> [ 2.210947] [drm:mdp4_i=EF=BF=BDq_error_handler] *ERROR* ezrors: 0000010=
0
>> [ 2=EF=BF=BD291875] =EF=BF=BDdro:mdp4_irq_error_handler] .ERROR* errors:=
 00000100
>> [ 2.292027] msm 5100000.mdp: vblank time out, crtc=3D0
>> [ 2.318122] =EF=BF=BDd=EF=BF=BDm:mdp5_irq_error_=EF=BF=BDandler] *ERROR*=
 evror{:=20
>> 00000900
>> [ 2.332537] [drm=EF=BF=BDmdp4_irq_error_hendler] =EF=BF=BDERR_R* errors:=
 00000100
>> [ 2.346931] [drm:mdp4_irq_error_handler] *ERROR*$errors:!0=EF=BF=BD00010=
0
>> [ 2=EF=BF=BD361271] [drm:md=EF=BF=BD4_irq_error_ha=EF=BF=BDdler] *ERROR*=
 errors:=20
>> 00000100
>> [ 0 2.389592] _drm:mdp4_krq_error_handler] *ERROR* erro=EF=BF=BDs: 00000=
100
>> [ 2.403631] [lrm:mdp4_irq_err=EF=BF=BDr_hanller] *ERROR* errors: 0000010=
0
>>=20
>> rest of it is similar to working kernel with this commit reverted=20
>> (dmesg =7F[2]).
>>=20
>> Due to fact, that Nexus 7 is probably only device in mainline, which=20
>> has =7Fversion MDP < 4.2 and lut_clk defined, is possible that it's=20
>> needed? I =7Fdidn't found anything explaining in the commit adding it=20
>> conditional for =7FMDP >=3D 4.2.
>>=20
>=20
> Isn't APQ8064 MDP 4.4?
>=20
> "drm/msm/mdp4: only use lut_clk on mdp4.2+" is broken because the=20
> mdp4_kms->rev wasn't set yet at that point, so it always fails the=20
> check (which works for MDP <4.2 HW that I have). It looks like that=20
> was never fixed (I do remember some discussion on mailing list/IRC=20
> about it).
>=20
>> Thank you
>>=20
>> [1] https://github.com/okias/linux/tree/qcom-apq8064-v5.10 (approx.=20
>> 10 =7Fpatches small a top of LTS)
>> [2]=20
>> https://paste.sr.ht/~okias/e6e936df8bdb2e14a24085d047a5f18d0ae86a43
>> Best regards
>> David Heidelberg
>>=20
>>=20


