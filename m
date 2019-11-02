Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F707ECFCD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 17:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfKBQxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Nov 2019 12:53:31 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46415 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfKBQxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Nov 2019 12:53:31 -0400
Received: by mail-ed1-f66.google.com with SMTP id z22so9804298edr.13;
        Sat, 02 Nov 2019 09:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hQ95xlFlsmX8ViImt/+o/Caz03S7IjKb4k3du7kugq0=;
        b=oWoGB9I+TyWZJEKlA41P7eYZhu8fouR6ppyfeVMR49gVqocVxwRyKcD6byFEV+kGBy
         E2OMMeIjDakSmCUrgYP+o2CjREIQjmJrRt4IaaFCcYxn9kMeT13s8CflG38EMgND+NoD
         Aan+FYyKLnDWMZWLcxDUeFtUYxH9neEI4ISzngbCZ2penIkmU1j4FEVt73fDkA2LSbpV
         ehnYsRfQZjWiePjT/AnA/zJowVr+vULD/C7m3CPv+EtC/JK/fih2vI4ash1iWCsm0xC5
         e7C1m9JUCpjykQwkXbAm3LM/WtmSQuNoLDaTgsp6UeSUge0lLhhvBbJiIhm+m14+siF5
         HETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hQ95xlFlsmX8ViImt/+o/Caz03S7IjKb4k3du7kugq0=;
        b=QV+9BdKwZb6x3nvOCQPMvq9afhfC8mIqdfZsXyHyV633ewvZ4aTjKPZSN71V8pTciA
         h8GBy80hMt097DiNGOXeX5LoYSayyZHjjb+dYNVJBieT5x4/ILHnI8Vk62d9LggE2q+p
         TevO/y3GDCI3LJzDv5ETajWOHzGgBiVRdfvocC1VlWJh6o9sxQcYGnAGjbQsxXVzBXSi
         ul4IF4SEklRzUKzcckKVZ5anHd50+zCPcxMRWmBxttVRJXEIKvXDMcE/w8IXT2KGvrhJ
         KvMeTjetuKPZeRzAs84bz11+RclPNyMebdjKJPYzbsIYZHZHyRZn3QwTrBQsBvZAqpsx
         muHw==
X-Gm-Message-State: APjAAAUndjq5lxhQ4bAFTiQZmcwDA4nBasrtHDZQyGseJk35hol6haDS
        fKzQH4pHTD8EgYXDEUSSyNF0H33rtKUXUzo2Qs+qpmH2
X-Google-Smtp-Source: APXvYqzRSzYk7AgLA5SNH9E7JvC5C1z3aJ6zO9H99iPAVIYt57B4ir9uBqm1Jj0P0MogIz4YaCikgLP5pm+YSl8v2zg=
X-Received: by 2002:a17:906:a44:: with SMTP id x4mr15543925ejf.64.1572713609301;
 Sat, 02 Nov 2019 09:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com> <20191031104402.31813-3-kholk11@gmail.com>
In-Reply-To: <20191031104402.31813-3-kholk11@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 2 Nov 2019 09:53:17 -0700
Message-ID: <CAF6AEGv77=zw8GiJOEgg6RkaukxTCGzEd=SdjRr+GLLBdEoRPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: msm/mdp5: Document optional TBU and
 TBU_RT clocks
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ devicetree list

On Thu, Oct 31, 2019 at 3:44 AM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> These two clocks aren't present in all versions of the MDP5 HW:
> where present, they are needed to enable the Translation Buffer
> Unit(s).
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> index 4e11338548aa..43d11279c925 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> @@ -76,6 +76,8 @@ Required properties:
>  Optional properties:
>  - clock-names: the following clocks are optional:
>    * "lut"
> +  * "tbu"
> +  * "tbu_rt"
>
>  Example:
>
> --
> 2.21.0
>
