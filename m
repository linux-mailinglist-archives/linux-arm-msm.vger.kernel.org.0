Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499EA386D21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 00:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344045AbhEQWph (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 18:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239660AbhEQWph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 18:45:37 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CBEC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 15:44:20 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so6982876otc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=wCRHhc5CNBJgeMhaZjv6HXKmZODtshURpIj1KAaY5Ec=;
        b=g+E0FkptmLlSmUHEwmiG+oo+73R0KoVQ6ZYrO2YZY87UWOeSK7NCOGonMgu7YbkF5K
         tpc6Epp38Yfcsqk62OCFS6pO2apPoNwzSeKtkIUk62afQ7eReEJdZkBOmkQJ//8Ejbwv
         vMGRKEdlrjRvy6emPj6ymTRudWOjIuEX3cQZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=wCRHhc5CNBJgeMhaZjv6HXKmZODtshURpIj1KAaY5Ec=;
        b=ogRsfJYbiJJZKI7r7qNi5z6BiF2qGakEBJvRQt8LI8yGnnkBYtUxXGjJM+L1JONOzN
         jazRSuuO9OhVtMPrPr6h7/mjoNXJwOjv+oi+Vu8HV5yshBIVe2I75tLoywwyEuQ3jrCq
         H3NmaiajPXsLCVg23d0jzRFO8hL2COtqUtHjRcA9gp5G3jhF60Y5WZrKbyrI+f/8fDgz
         +BbbTk8aIeJ4S3KtPJBo7ICBzBnwQqU7Uthx47WQ4Xi8oDXCrMEAltxqIIuTQrissJlc
         w8m4Dlfds9vZPYfrh+RB+W8wicV0j2hAd+SJK6pWI0JkkhVfcfeMHKgtti8eXASsQTF9
         n73w==
X-Gm-Message-State: AOAM531gwpf66FA2keRvzbMNhqzj9qaAQ+Gigf0WaugGHsEemF29Kjti
        pX6+Fzc1yA839lQsnpeeFzHL4Suee/NuNNHbdEsyOQ==
X-Google-Smtp-Source: ABdhPJwYgIM7DXk4ykEISh2uQ5fNb2X4gzr+wMSjIK74xoOhgRVS2GV4QGZspwoG0xgsXil5WszACVf7E8Gczjs1ZpM=
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr1581018otp.34.1621291460212;
 Mon, 17 May 2021 15:44:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 May 2021 15:44:19 -0700
MIME-Version: 1.0
In-Reply-To: <20210513122429.25295-1-srivasam@codeaurora.org>
References: <20210513122429.25295-1-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 17 May 2021 15:44:19 -0700
Message-ID: <CAE-0n51jjHWSFiip-utVKjAQbaJuj+oKq0GPLgw2q2mG_9B=eg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add wakeup delay for adau codec
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-05-13 05:24:29)
> Add wakeup delay for fixing PoP noise during capture begin.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index 4c6e433c8226..3eb8550da1fc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -23,6 +23,7 @@ / {
>         adau7002: audio-codec-1 {
>                 compatible = "adi,adau7002";
>                 IOVDD-supply = <&pp1800_l15a>;
> +               wakeup-delay-ms = <15>;

Is this part of the binding?
