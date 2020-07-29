Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CDC231DFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgG2MFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG2MFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:05:34 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33C2C061794;
        Wed, 29 Jul 2020 05:05:33 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id o18so24045203eje.7;
        Wed, 29 Jul 2020 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aXIt4Mo1PgFXWOsZfX3ouR5GPUAW+dMmhSUWqpQyOGI=;
        b=nFNVnEBGH0cRd+8OujTalxexYKT9IDGLV+35DrquF2+E8/gVwiSbKOKAR+imJ5F34c
         oZZ3X2mkmLZ/p9IASC7p1CcRac5xbPA47OVhZK0wtF4eE5Obpfj53A/FLXa11qn9Qqxh
         AJdwh9yTM4A8S8TW4cPsf3CyazmLrpQYwZlqSEoLRSI+I/NI44FcKhrMC8YuZodL38dY
         7LJWMavJQr3ofklvIKOUN69UIShyfBScLTotWlPPiti2hMjGffphQECuuo+cqZn7k+XX
         cTsoZXezbU8yQXHfx8ZI/7z85mvHFDeFtdTZ9V1pb1wveFq6QJlkR8KvibwvAH5bLPQV
         McbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aXIt4Mo1PgFXWOsZfX3ouR5GPUAW+dMmhSUWqpQyOGI=;
        b=MQW8DsKn72m4SxVh+tF1Smazq1G7YU8feXfUvRyY/8O0H27iXDEmxIY4KWraTTVLjI
         O7HT4U3q/z0CsfCokgC6zrL94TlChn23FkZuQcDviP91mEo3QW83GYdK8/8whfPRMnLw
         RG9QwrPS8B8l94f1QuqskJ70KI29wsouYNH7puUxTJTF2Z3jsTu8HeSlHDqdpslSi+XK
         jNSR0fKOLo1psfUXy13ZEAKB2TiFoI5BRgeGHwWkMjI0f4rXfnOSIGoUYFAOOo04S6R5
         svs3kCZGVmBr+F8ZhI4OsphBPOUbO/eJ64vjQHgdcRcdJV1Raz7aKIXj90SdOspX2lFO
         /1XQ==
X-Gm-Message-State: AOAM532Pv6ob8m6Hz4CwVpRPdF1Y7g2FtmV7VQTLChcmWax3wZMScJug
        DjD3x+OdsMqb6jmCzBL4pxiShStR1QtvMZkcaQY=
X-Google-Smtp-Source: ABdhPJxDUZiAt21H/R28NZeZw1fPj51R6TGTfqIkYxZ8uBaYjAdiI0ZkUIeUMU9zi983V9myZE0BxnakEWXi2ot5YmA=
X-Received: by 2002:a17:906:c143:: with SMTP id dp3mr454824ejc.504.1596024331419;
 Wed, 29 Jul 2020 05:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200729120057.35079-1-konradybcio@gmail.com> <20200729120057.35079-10-konradybcio@gmail.com>
In-Reply-To: <20200729120057.35079-10-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 29 Jul 2020 14:04:55 +0200
Message-ID: <CAMS8qEWr3ote5QmXxYDPvDNc_uhhNfPj4ehB4FQxs1HNsgtCYg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] clk: qcom: gcc-msm8994: Fix up the driver and
 modernize it
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Wouldn't be myself if I didn't forget that

Fixes: aec89f78cf01 (clk: qcom: Add support for msm8994 global clock controller)

Konrad
