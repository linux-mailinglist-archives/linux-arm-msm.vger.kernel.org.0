Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B25EEEB63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 22:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbfKDVrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 16:47:02 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35093 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728778AbfKDVrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 16:47:02 -0500
Received: by mail-pf1-f195.google.com with SMTP id d13so13426249pfq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 13:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:from:to:user-agent:date;
        bh=7jJQ1NcKveBtKcGJsD99Mt4fr4vw7vgm5QVERgCCc+c=;
        b=gakghABf83nmBd5F1TCaDE+0Bjc80TbJMSz2bp93N5g5x2zSpsgpZVNXSoV20PykSY
         rT8mFpFNgxFS8eMOBoBhp1oC4PK4JauOvaWKfCsT0TeNa8+Uy61MRkDHl9lgUT40Imys
         2t/my0Tw/9hzxlBn8mziKSliVWFTKoBozUoNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:from:to
         :user-agent:date;
        bh=7jJQ1NcKveBtKcGJsD99Mt4fr4vw7vgm5QVERgCCc+c=;
        b=RXdnfTJFyrTqg90u2uZNyph7NkwyMJU0jSSRjnJxp2oOW7YH74nr3GC70Ghky/waVu
         XTGR7ByKfW2QhvM9mQdjgEVGiFctlyKdu7kIXJuzsPQhBvXu0Wmbl/ja0JX2MnujIBk1
         X2i6ZCF75dFIa0QBb+Ssh88qdcOJcuTPVbBlZ4L3GAskwkNKhmH+txYlDrkW54fL5hGP
         LA9a2ArWcQ/mtcNbHIWnEKU6SCAgsXt5Dmh9LctkYzTF5PcmUxkLf3qO8vCgXKs96gyT
         TUZwMVOR4j7T58TnJM6micTLaEVQK7PQQy4Bslj2EbwCA7Bff0IHYZuLnsJS2spRqUjU
         Kstw==
X-Gm-Message-State: APjAAAWoIzQqgbN+WNltZDskY3/VwDULRLcoZGD67KtL2JmFCVUbHuCa
        VfT5hfRKZtScRvF5i/zc3W3muolOzW2X5g==
X-Google-Smtp-Source: APXvYqzMgIlIOYaSeTWk9M5N2B38HWf8Mps81hZBv9twl3u8F3n9PNF6iVEqNVar8mMp7FeTgxDSSQ==
X-Received: by 2002:a63:4c2:: with SMTP id 185mr32077554pge.233.1572904021801;
        Mon, 04 Nov 2019 13:47:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 6sm19410658pfy.43.2019.11.04.13.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 13:47:01 -0800 (PST)
Message-ID: <5dc09c55.1c69fb81.f5014.840a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
References: <1572408318-28681-1-git-send-email-mkshah@codeaurora.org> <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        mka@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add cpuidle low power states
From:   Stephen Boyd <swboyd@chromium.org>
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 13:47:00 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2019-10-29 21:05:18)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index fceac50..69d5e2c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -157,12 +178,69 @@
[...]
> +                       CLUSTER_SLEEP_0: cluster-sleep-0 {
> +                               compatible =3D "arm,idle-state";
> +                               idle-state-name =3D "cluster-power-down";
> +                               arm,psci-suspend-param =3D <0x400000F4>;

Nitpick: Lowercase hex please.

> +                               entry-latency-us =3D <3263>;
> +                               exit-latency-us =3D <6562>;
> +                               min-residency-us =3D <9987>;
> +                               local-timer-stop;
> +                       };
> +               };
