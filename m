Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BDB39765D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 17:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhFAPTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 11:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbhFAPTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 11:19:02 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB98C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 08:17:19 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id u30so1101070qke.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SHY1Su43K3ELrQR9CrBAbBOQHJtxQOdLocpoZ2X7Ng8=;
        b=FkPjp6FbTjUVq0pXGa6pXaYuNulBbgZ3zjSZhG9UJqpFTSCH8y84SKHJER94xQE4Cn
         cykpvCo8tmeqKzyTSGAEvcES7HBlyJ+TBL+c9dqLUIAeiIt66tj6Feg42qZca/cWLFrP
         8IXz2k7nKsD/90QvJiwFL8082iMK1XOCW7vdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SHY1Su43K3ELrQR9CrBAbBOQHJtxQOdLocpoZ2X7Ng8=;
        b=h7OD6OsIfNd54TxxzbBU1hVzaBqdBFVBklAdR0mu8Ph243UBDQN858jgeZuDbAJ7D/
         OBrebfcq+Cu2shS7si/n0nkXNBXUD1JklPvzskMckyoKQiTDtV2reKTKKLqZ4v8eWTgH
         PTm4RciOr8SXBWi5u8KR8BI7mHLyILMNAy/00jk9zfgsNoF12afWGm6tE7DA2qLyZXBA
         eQq/8wJ+EV1oEwIL6ZMpyurnVra1UQgIKn+KEtNMCXv/ajv1pZq2l6kA4OK1dwBo8mWK
         OlyUWKpPDef01xt4CAJLoYORGHPg6wNk9T8eNU9acsFddYhb96rle00iS6zEmWC+7g6x
         wpDA==
X-Gm-Message-State: AOAM533HvGRqoTUF0e5spwoP5vrnPJmu8h1vLglty4i2mcEZDlWQ087R
        m2wC8VBf8r9bDGqu2NEeesN+XdPy5w9l4A==
X-Google-Smtp-Source: ABdhPJyCIOF1ZLAskyZYDBt1pYUsdYib2hBeNtlCQKmxhZDXAcC0CWq0JsCGGW9LYxKauUDBt/fw8w==
X-Received: by 2002:a05:620a:1492:: with SMTP id w18mr22796179qkj.495.1622560638574;
        Tue, 01 Jun 2021 08:17:18 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id q68sm4865162qke.123.2021.06.01.08.17.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 08:17:18 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 207so11572681ybd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 08:17:17 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr40579283ybb.257.1622560637314;
 Tue, 01 Jun 2021 08:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210524142114.18676-1-srivasam@codeaurora.org>
In-Reply-To: <20210524142114.18676-1-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Jun 2021 08:17:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+3qP3uj2AVkejmVBmMYqWAxMCS7HBRSkKcPgwP0XGdQ@mail.gmail.com>
Message-ID: <CAD=FV=X+3qP3uj2AVkejmVBmMYqWAxMCS7HBRSkKcPgwP0XGdQ@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 24, 2021 at 7:21 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> This patch fixes PoP noise of around 15ms observed during audio capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for introducing some delay
> before capture start and clock enable.
>
> Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes Since V2:
>         -- Updated comments as per linux style
>         -- Removed unrelated changes.
> Changes Since V1:
>         -- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
>         -- Added comments
>
>  sound/soc/qcom/lpass-cpu.c | 54 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)

Presumably related with Srinivas Kandagatla's comments: this patch
causes a bad splat at bootup. Specifically, here's what I saw when
this patch was in the Chrome OS 5.4 kernel:

------------[ cut here ]------------
lpass_audio_core_lpaif_pri_ibit_clk already disabled
WARNING: CPU: 0 PID: 2066 at drivers/clk/clk.c:958 clk_core_disable+0x4a0/0x670
CPU: 0 PID: 2066 Comm: cras Not tainted 5.4.122-lockdep #4
Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
pstate: 60400089 (nZCv daIf +PAN -UAO)
pc : clk_core_disable+0x4a0/0x670
lr : clk_core_disable+0x4a0/0x670
sp : ffffff81727cf8a0
x29: ffffff81727cf8a0 x28: 1ffffff033d2b8d5
x27: dfffffd000000000 x26: ffffff81a3781980
x25: 1ffffff03493d3b3 x24: ffffff816f433480
x23: dfffffd000000000 x22: 1ffffff035b66e2f
x21: 00000000ffffffff x20: ffffff81adb3717c
x19: ffffff81adb37100 x18: 0000000000000339
x17: ffffffffffffffff x16: 0000000000000006
x15: 0000000000000001 x14: 0720072007200720
x13: 0000000000000000 x12: ffffffd0132c1e00
x11: 0000000000000001 x10: 0000000000000000
x9 : cff2cb5e2cb22e00 x8 : cff2cb5e2cb22e00
x7 : ffffffd010288f74 x6 : 0000000000000000
x5 : 0000000000000080 x4 : 0000000000000001
x3 : ffffffd010429d10 x2 : 0000000000000001
x1 : 0000000000000008 x0 : 0000000000000034
Call trace:
 clk_core_disable+0x4a0/0x670
 clk_disable+0x50/0x64
 lpass_cpu_daiops_shutdown+0x190/0x204 [snd_soc_lpass_cpu]
 snd_soc_dai_shutdown+0x8c/0x9c
 soc_pcm_close+0x258/0x478
 snd_pcm_release_substream+0xfc/0x1e8
 snd_pcm_release+0x8c/0x124
 __fput+0x1e4/0x4fc
 ____fput+0x1c/0x28
 task_work_run+0x12c/0x164
 do_notify_resume+0x1e04/0x2c48
 work_pending+0x8/0x14
irq event stamp: 101552

-Doug
