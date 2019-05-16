Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD1D20754
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 14:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfEPMyB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 08:54:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38203 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfEPMyB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 08:54:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id 14so3000941ljj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 May 2019 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=is+vcG0UlA2yzmtL4LYYh2ozUEoTSqklk60p4mnMQ04=;
        b=MFfg5EGV3WlcVRL7t42mRGuevg4Dw6jHWVPGT2WaA9U+imkG3qz/ByB3JShhUb2NxO
         IAAzMFCyoy1azLf5+Q4ThwNIqn4V0/PTTLPDCOt+U7xefvG3qkOt5zG0uB9cx/TNHXE6
         2+ED85Si4JXqF+cr/iQMckJ2lj+Pl65K1fgbeFkbbY1jSDmv1lN3C2eF4DTCsBjz/Zcb
         18XkqFVHEYMISKb44tLwMqYKXX9k0mqKfX0i8c6MUWXkuRuMDiTmBFpo8tV0Vx9Wtcb5
         z9tSgHWa/o0DMzx/TanVLPgRTSHg6HXiBkz+H2H7PQT21r5iYkCS8Z79gfZowJCaFo/z
         EWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=is+vcG0UlA2yzmtL4LYYh2ozUEoTSqklk60p4mnMQ04=;
        b=kHTF1HDtZAvcctmYfW39IKosv9p5ytwQb5/jMPJGWO4eplRxk+ZMQomb4Hw6JbP4gQ
         1yMzocTUprdV1I1PREv+Jv4yh8/+gL42oY0s4M9Ms6z64w1YDpIkkUjhpt9zsh+plGD1
         4jVX6apMyg81UbZKF1T/aw6kqVP3MyEMTxiUBt+nH8NKq24xiCrTy/OMfHzql2DT18Jn
         VhdZWi/txAEBs6fPAIr1WJkq766PldUZvHpCn93V6YK1RfQsq6QY6mfCvHlfccHA7thH
         /H3mgjD9oJns8IFaIkHme668VTSVlyFVoUypWmQrOpTh2d7JEsyhLVpp0el63nirA9mK
         XOYQ==
X-Gm-Message-State: APjAAAUE0Xt2OnFAc6SQNufeVD7FrmGxyASlnP1SyoBekXs8pfjHgMH2
        PDvlD1BdyB7Lzw83GNTeUfkxye/4uHtjUokMRvHnOQ==
X-Google-Smtp-Source: APXvYqwLJEUqsa8XfBzAuJKLBahg71QpFWWEysf/pHtQkxsQuNW8z5xmBuXwRIog/cBAbIfM7m/qozW3wQZmt//QoVw=
X-Received: by 2002:a2e:9a4f:: with SMTP id k15mr19599643ljj.159.1558011239510;
 Thu, 16 May 2019 05:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190508021902.10358-1-leo.yan@linaro.org> <20190508021902.10358-5-leo.yan@linaro.org>
In-Reply-To: <20190508021902.10358-5-leo.yan@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 14:53:48 +0200
Message-ID: <CACRpkda4aEfgW6e7EfqC=FE_=QzKi5UTDLLzHEryQ6kpcKYzVg@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] ARM: dts: ste: Update coresight DT bindings
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 8, 2019 at 4:20 AM Leo Yan <leo.yan@linaro.org> wrote:

> CoreSight DT bindings have been updated, thus the old compatible strings
> are obsolete and the drivers will report warning if DTS uses these
> obsolete strings.
>
> This patch switches to the new bindings for CoreSight dynamic funnel and
> static replicator, so can dismiss warning during initialisation.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Will I need to carry this patch or will you send it to ARM SoC?

Yours,
Linus Walleij
