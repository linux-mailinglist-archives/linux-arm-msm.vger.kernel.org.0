Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD4EEE951
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 21:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfKDUTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 15:19:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:52666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728510AbfKDUTA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 15:19:00 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3A4A214E0
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2019 20:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572898739;
        bh=RLIrrknFz4bGTk4KfTN8equRNdviyydQMz+yWFN+VhQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IL+TrNHIRlr4u3r6/LyzdY1L7Eylbi+RUZe+yeMZdW/4vPfSjmaUQSx/gp0TsI+mb
         nzygeOjLWio8H8XQ9oIqEr+dnwKrCIlymS8ls5+KMGaS56CViGmYoCWJU6wdXUQwE5
         P7OcWsj1cWz1h6yb1eExKMPDcXdj1+ojrY6o4Me8=
Received: by mail-qk1-f177.google.com with SMTP id m125so18910217qkd.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 12:18:59 -0800 (PST)
X-Gm-Message-State: APjAAAXEtcFh5nw0Du6APkma37orVObJ47gJyh4ID64STXaWscppKwYK
        +CAGkkVZxr/BDxmjZMNstQ0iBpZmhByRaM723A==
X-Google-Smtp-Source: APXvYqy+2TDn1ppQOdbox9dVjpoaM5UOxJ2o3eR8ZyLap8rNMbfAtTKwfGDbpdYuZMRnBc5OImTCfHCBp7JGrUt+jmo=
X-Received: by 2002:a05:620a:205d:: with SMTP id d29mr1189735qka.152.1572898738841;
 Mon, 04 Nov 2019 12:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com> <20191031104402.31813-6-kholk11@gmail.com>
In-Reply-To: <20191031104402.31813-6-kholk11@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 Nov 2019 14:18:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLocqJOpK1zRah=nFPos6izcX5e0mHS1WBdYtZJm30QSA@mail.gmail.com>
Message-ID: <CAL_JsqLocqJOpK1zRah=nFPos6izcX5e0mHS1WBdYtZJm30QSA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B compatible
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 31, 2019 at 5:44 AM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Use get_maintainers.pl to send things to the right lists.

> On family B SoCs, the 28nm PLL has a different iospace address
> and that required a new compatible in the driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
