Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6F13144D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 01:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhBIAYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 19:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhBIAYP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 19:24:15 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C4AC06178B
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 16:23:35 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id o21so9937537pgn.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 16:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=nFM0MlsDfR8VM4PPVEkKIEyXxD9NGa9iDMVral5Ujo8=;
        b=npSBDIqz3idVStJ+6xsbWqKf9jUNdMt6yrfVNgMf2tGtLpgBGTKPD6cdw9z57kt4gk
         blAeLIZ01h/gXsj5zXy8nhb21YSi2HWO42o9tGZumUirlyod4KJyhCBedGNtY0Wf5WYs
         myXPhMcRSL9MFPO/FWgac/cElFOjVYw5/9d6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=nFM0MlsDfR8VM4PPVEkKIEyXxD9NGa9iDMVral5Ujo8=;
        b=pw5hVjs4Na9p6jPBGcpFon/QDz3eFsKnjWdKLD3h4DjSyTm5SRJeFSivONC3jo3Lng
         +ttH+onZSYqXjxR5/nq756jHqm/If03aUM79k7H8dkISy3+FnlQBsOZ1WuDvEyqK9g+8
         h2+fbUPntdqjYB+mCZey+5OwbTTX+2gTmhRhbVP9j888GMY7g82myubtW/ZWcJsKcNUF
         zXYaC0IDXvwDxJRSj7k2HjYTbKE/E70ME18zHpc1AeNIV4dI8vUstDUKIjGu0hr5MRNZ
         aJsEy9oCE5zGKjZGSjHqfrXL5nVqMnGHboWINkp1S4aPD3g6fAK5Vet+xWJWNVPLBStE
         WbWQ==
X-Gm-Message-State: AOAM533uPoM+xvqcXlDuean7nOSokgKqQJZRsMQ1v0Ev2xnpQLc0SEdT
        iZi7XZNYC+yMxYA/kfFVbsDdrcdcNc+7AQ==
X-Google-Smtp-Source: ABdhPJzDQylLd8Wa/D58PdqAO8x2PtLWn0kpNxxwKnpo1/LYbFGRFjqZR+cWKihjhhWuFNVIHT8clw==
X-Received: by 2002:a62:5fc3:0:b029:1bf:34c4:a128 with SMTP id t186-20020a625fc30000b02901bf34c4a128mr19887537pfb.38.1612830214698;
        Mon, 08 Feb 2021 16:23:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:751a:ba0b:8918:c305])
        by smtp.gmail.com with ESMTPSA id 194sm17431307pfu.165.2021.02.08.16.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 16:23:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612448508-9179-2-git-send-email-mkshah@codeaurora.org>
References: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org> <1612448508-9179-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: Introduce SoC sleep stats bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Mon, 08 Feb 2021 16:23:32 -0800
Message-ID: <161283021256.76967.600110253862291436@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2021-02-04 06:21:45)
> +
> +description:
> +  Always On Processor/Resource Power Manager maintains statistics of the=
 SoC
> +  sleep modes involving powering down of the rails and oscillator clock.
> +
> +  Statistics includes SoC sleep mode type, number of times low power mod=
e were
> +  entered, time of last entry, time of last exit and accumulated sleep d=
uration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,rpmh-sleep-stats
> +      - qcom,rpm-sleep-stats
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  # Example of rpmh sleep stats
> +  - |
> +    rpmh-sleep-stats@c3f0000 {
> +      compatible =3D "qcom,rpmh-sleep-stats";
> +      reg =3D <0 0x0c3f0000 0 0x400>;
> +    };

Maybe it should just be another reg property of the rpmh or rpm node?
Then the rpmh driver can create the stats "device" at driver probe time,
or just roll it into the same thing. It looks pretty weird to have a
device in DT for this given that it's not really hardware, more like a
place that the processor writes some stuff about what's going on in the
SoC related to power management.=20

> +  # Example of rpm sleep stats
> +  - |
> +    rpm-sleep-stats@4690000 {
> +      compatible =3D "qcom,rpm-sleep-stats";
> +      reg =3D <0 0x04690000 0 0x400>;
> +    };
> +...
