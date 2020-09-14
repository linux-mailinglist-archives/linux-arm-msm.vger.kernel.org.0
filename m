Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CE72697A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 23:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgINVW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 17:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgINVW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 17:22:56 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D437C061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:22:55 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x77so866224lfa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B3Raf4UC9rPf9/2GIe2y0keKdeGhWb4NBqALKLPqApw=;
        b=XlZnKz9G6ag4oJchL/qYdMihrdnCJSGrMK2k4uKNZUz8h2Ur50bvs3KAXwwzSCfsWu
         5hK1CEXx20iItEGnGjkEIW/UEbebefnBx9aDPjsYIAhRTILgxN6xlQ3L8K039YxjzGrp
         m72maCaoZZwAoKcyd0QXUvLrcrs5GjaiEiweQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3Raf4UC9rPf9/2GIe2y0keKdeGhWb4NBqALKLPqApw=;
        b=WFRcGiL0bvgm5OK0DXVS6sxK/zeq5VfAwK+/aumq7n1gnp3PO1VCXeZ42fk9ZNSu3S
         IBL5ME1LpeolTzt9Baxn37tDNSsfsva9QKJTS7yWCbUH8aklk7q3OcrerL4Kc0TAFrUf
         RCgakL2gu/+fEYCS2VvcQOScWpfRL9eL5nGMirPxm5B3IWW/am8ksTGCp7aT1c534idR
         9aPgAeStoba11pCHfXYLoYF+MyrzyzN1GxRQ6rCIZFFZroY28VIGgjk7kS/HJzVqVtVG
         Ah/iH84knGRt4BOGPxhYP9ADlu5xjkYopsswl7QNb0tAIpat0NNao75xTKzNdoFxkXLf
         gTQg==
X-Gm-Message-State: AOAM531qIBA0RIzuSk3XTerEVmjsHGOFaNAHiKJ25lmsDXeElB0uNjyb
        LtOMDntRLxUl1q2gdhyRGbJ/S6vDAJTWiQ==
X-Google-Smtp-Source: ABdhPJzEeGWfE9THMQESbuG17XYYJ4nhkSJQyPpRHTnbHtuGGkkUfgvgojTrBc/EMJEdjH2ffmCWAw==
X-Received: by 2002:ac2:5bd2:: with SMTP id u18mr4554057lfn.240.1600118573187;
        Mon, 14 Sep 2020 14:22:53 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id m6sm3522860lfl.159.2020.09.14.14.22.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 14:22:52 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id n25so947281ljj.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:22:52 -0700 (PDT)
X-Received: by 2002:a2e:9497:: with SMTP id c23mr5361525ljh.124.1600118571616;
 Mon, 14 Sep 2020 14:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200914182112.513981-1-swboyd@chromium.org>
In-Reply-To: <20200914182112.513981-1-swboyd@chromium.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 14 Sep 2020 14:22:15 -0700
X-Gmail-Original-Message-ID: <CAE=gft6=XxMs0z=oB3CyHETcg9Ahhrjw220JPfbhVWpA7aBZzA@mail.gmail.com>
Message-ID: <CAE=gft6=XxMs0z=oB3CyHETcg9Ahhrjw220JPfbhVWpA7aBZzA@mail.gmail.com>
Subject: Re: [PATCH] interconnect: qcom: osm-l3: Mark more structures const
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 14, 2020 at 11:21 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> These structures aren't modified at runtime. Mark them const so they get
> moved to read-only memory. We have to cast away const in one place when
> we store into the data member of struct icc_node. This is paired with a
> re-const of the data member when it is extracted in qcom_icc_set().
>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Cc: Evan Green <evgreen@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
