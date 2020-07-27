Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B9F22F9B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 21:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgG0T7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 15:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgG0T7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 15:59:04 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CDDC061794;
        Mon, 27 Jul 2020 12:59:04 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dk23so6431917ejb.11;
        Mon, 27 Jul 2020 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=djQ21RTJ93c9kqwB25zIQ/ST+ogHMsSV3nZHz/8ca38=;
        b=heONYTvaIXjisXfWesNdZBH3HR8Goezr0M9/B4pi218SoZAhRizIbEnlpbiqZJYMa3
         CymQT7ZTt7ccvP9R1yW4XYJ8IGQ/8EWsv9QTUTnNbBj7inBMYkRpsKQiO/fhVISer/Pq
         0vYdTkQ2Qn829HoEkOgIN9H5M2pqiH+EgUH86glh+ZWkp3u7ZgS83Ma4NJuxLHsMv0XT
         5URHnSmWVFfrEeMA03efn6TKDJetxsRmfy+VJcdXh3h6WYjImIxnOMfDwI8sXEU0c836
         81anQIl0wlW5GrrZ7zpqqgJMiU5UyaCEmqUOFHnDHEu/yIyTXgsYKrdQhA8yOZSRXJIP
         onpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=djQ21RTJ93c9kqwB25zIQ/ST+ogHMsSV3nZHz/8ca38=;
        b=onfMpAknuaSm5IdeJn/2MMdRmGAyZ9PbJ6wcoI43QHrQVtSt3YREkb+sBT0DFto3SS
         ES6AeDnufkQHbSIsmIBGPLkpAi120oh4hwkHgI4FsODFTcbJRi/KC5LZEjeKM9WQOLfx
         yKU8sYq5KqcyA8dNtcI5O8m7NjghoFRA1udqX191AWgEx5ljJjuN60+ncvYn4EG7VwA3
         +7TR6DTIigxJD3rgPMqtlIn8PLf9yJWn6Pf9z+uOqsStGye5CM80OBVw5FvKQ53IFV45
         UcOxOBwPaHTABKYGLbl8iqfzlEhOz/Hz3PRx1n4dAN6TJg75IsLHRixvZNN2Vxxv6CsB
         o69A==
X-Gm-Message-State: AOAM532xzRfrS10GpVFCp9cEmAseV0fsAqUG1UMeF1yqt/Q6YgPhLz+e
        pvr+6Zk507/2vs+sCNWsVlQJkRstfOF2luwEPUo=
X-Google-Smtp-Source: ABdhPJwfVv71IAplhkO3yFPYokjDknujpfGl4Qc8owyxPo/klfQMtQ6qhz4AzI9gvxqd9KqcUezDTWMXq2Y5KwAMqsI=
X-Received: by 2002:a17:906:365a:: with SMTP id r26mr18823220ejb.52.1595879943063;
 Mon, 27 Jul 2020 12:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com> <20200726111215.22361-2-konradybcio@gmail.com>
 <159587899589.1360974.4403082749390843157@swboyd.mtv.corp.google.com>
In-Reply-To: <159587899589.1360974.4403082749390843157@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 27 Jul 2020 21:58:27 +0200
Message-ID: <CAMS8qEXRJxKTqyiB9f7YeKr7_Mcik96BM=K5WLUf2fbALsAALQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: qcom: gcc-sdm660: Add missing modem reset
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Martin Botka <martin.botka1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devic <etree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes: f2a76a2955c0 (clk: qcom: Add Global Clock controller (GCC)
driver for SDM660)
