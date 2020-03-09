Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B84217E6C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 19:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgCIST4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 14:19:56 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35667 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbgCIST4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 14:19:56 -0400
Received: by mail-pl1-f193.google.com with SMTP id g6so4329851plt.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=P0TPxg5BSkLkFp0OlEKDiNJneMcG58MKCj4X0aj+r18=;
        b=LUFJKaI21+lFFDVRrC+d/G2PcPrZYvgqh+0oWuSPROHxW7Ea7z8UadjeAOplciaBz8
         X5EJXkfpuwXox4OXgu9iL+IJhvgbCazq00mu609wxGNv4KxblVbtut496ggXNd2yvNCs
         F5sZmlcQ5SgH1QEXcBsMeRlZZBgZjm+g9tqb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=P0TPxg5BSkLkFp0OlEKDiNJneMcG58MKCj4X0aj+r18=;
        b=ZuUWjGGNuBh7DidlOSKCC0d9pJaSLVlw061fri0ntFzTrEciHYd8JEwGK3wTbek3L/
         DEYq1NPm95IlJqCPB8BLCqqVN6lllUDgVy5Asr9EleleUZAN/jXXgkX8VmDF9/Evz6Yi
         WvqCjaT9+oAGm11uUDsSpxZGSGwpTpB281qoNKKRqg1ZaTHnweQQoRQ49fNaGg5RK/sn
         iql6hEmIpNByojvuML0rjUtM+hhyEc9jWn9UtF75mPFMuUWEUKY25H7Jq5iR1HjwhkGv
         ahhUYYBSJJqELkKL7n6E8gVQZZxGv86W3CkU30yOBMkh0lknu0xnbpvzlIK/2nUxfpkP
         qdeg==
X-Gm-Message-State: ANhLgQ3dAa+I2NDvLSyo7L81ogkM0qOrORszFtlggl0g1hGImpyTr9Lt
        QfsGGhYUh7b3tsmAC3TvgMgTiQ==
X-Google-Smtp-Source: ADFU+vteH3EUGOgnDI/8G2cbcdr7iPU8YaxSDDMpRLpCXHo30kxiDLe9pP9m3jr4gYNbbsfAKqWLUA==
X-Received: by 2002:a17:902:904c:: with SMTP id w12mr17536870plz.35.1583777994619;
        Mon, 09 Mar 2020 11:19:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p21sm16194246pff.91.2020.03.09.11.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 11:19:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e1133bcd-b1fe-98b3-3a28-c12d07ff8ebc@codeaurora.org>
References: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org> <1583479412-18320-3-git-send-email-mkshah@codeaurora.org> <20200307064231.GF1094083@builder> <e1133bcd-b1fe-98b3-3a28-c12d07ff8ebc@codeaurora.org>
Subject: Re: [PATCH v3 2/4] soc: qcom: Add SoC sleep stats driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 09 Mar 2020 11:19:53 -0700
Message-ID: <158377799320.66766.16447517220100414599@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-03-09 03:58:27)
>=20
> On 3/7/2020 12:12 PM, Bjorn Andersson wrote:
> > On Thu 05 Mar 23:23 PST 2020, Maulik Shah wrote:
> >> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc=
_sleep_stats.c
> >> new file mode 100644
> >> index 00000000..79a14d2
> >> --- /dev/null
> >> +++ b/drivers/soc/qcom/soc_sleep_stats.c
> >> @@ -0,0 +1,248 @@
[...]
> >> +    u32 pid;
> >> +};
> >> +
> >> +static struct subsystem_data subsystems[] =3D {
> >> +    { "modem", MODEM_ITEM_ID, PID_MODEM },
> >> +    { "adsp", ADSP_ITEM_ID, PID_ADSP },
> >> +    { "cdsp", CDSP_ITEM_ID, PID_CDSP },
> >> +    { "slpi", SLPI_ITEM_ID, PID_SLPI },
> >> +    { "gpu", GPU_ITEM_ID, PID_APSS },
> >> +    { "display", DISPLAY_ITEM_ID, PID_APSS },
> >> +};
> >> +
> >> +struct stats_config {
> >> +    unsigned int offset_addr;
> >> +    unsigned int num_records;
> >> +    bool appended_stats_avail;
> >> +};
> >> +
> >> +static const struct stats_config *config;
> > Add this to soc_sleep_stats_data and pass that as s->private instead of
> > just the reg, to avoid the global variable.
>=20
> No, this is required to keep global. we are not passing just reg as s->pr=
ivate,
> we are passing "reg + offset" which differs for each stat.

Can you please stop sending these review comment replies and then
immediately turning around and sending the next revision of the patch
series. I doubt that the changes take less than an hour to write and it
would be helpful for everyone involved to have constructive discussions
about the code if there's ever a response besides "done" or "ok".

In this case it should be possible to get rid of the global 'config'.
Make a new container struct to hold the config and offset or figure out
what actually needs to be passed into the functions instead and do that
when the files are created.
