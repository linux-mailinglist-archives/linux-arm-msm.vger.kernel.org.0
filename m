Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54613CBCA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 21:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhGPTfg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 15:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbhGPTff (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 15:35:35 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815DBC061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 12:32:40 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so11021841otl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=J2wfbLLRcVzOj5bue5iehsJbJvJoR7R2ObEWGMuhdyQ=;
        b=IKIGQ1BcXxE97VbYGJpsvitrm/l9FwPL1ozbGhpukvZWFP5P7pILwmeNk1IaPXA3Jq
         ZJZHHKLpGSpdEfKOsvfvTVj8RQCZS24WfHpzdt18aoSFXR73vAX6XeFVf0J1vFqMFKqB
         /qxpP7mh374CJJmZiQATTFUDdYOrzplmsdCVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=J2wfbLLRcVzOj5bue5iehsJbJvJoR7R2ObEWGMuhdyQ=;
        b=NbHK/1IkhEq8FwzndP/KPzfMWK0RG+jswPWcOpDze9yXWc+i6DZf2NCAIVxTR8QyV2
         ldyF5kmp0baYMXloQY97ga/HRMwINUBtBnRXBvlldnpvPOSpagmUEuyQ9Klu5mgQ6Xlu
         Tbc4kOSvNXogiVk/jog60Y8vQY9gn+xXl7JnOzR6MgzovLQ6qlQdiMcKGyRISRnvDaY+
         4FSuXrk1y8JJUbTplAnotG0i2K2/R3bj67f6imwNWhOrxnhVI3U73+1CoW5mx65sGvKG
         4cp3hANy2Vv9Wql9eS3sTEMTXnvlWKy1ec5KsjF0TAOijFKW0+VuiCK+n4P8x5PhbqUF
         ZglQ==
X-Gm-Message-State: AOAM531LuUAQnhMSKWw91gTBYj8y/AnzW17O+dx8TUq1zLJ6Tqpunw88
        tmu+7T2cpmLA/Ic657BGpuf60ZQU1v/uLXFlIkGXAQ==
X-Google-Smtp-Source: ABdhPJxZiTaGwnHZww4nf2WZ0HLteqmotYoD4c44oClNVxI5owPVdufjYgtGwG7MhUmmA94gAkL0MWLx6vQTuqjqT6k=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr9486701otf.25.1626463959891;
 Fri, 16 Jul 2021 12:32:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jul 2021 21:32:39 +0200
MIME-Version: 1.0
In-Reply-To: <1626443927-32028-4-git-send-email-pmaliset@codeaurora.org>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org> <1626443927-32028-4-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 16 Jul 2021 21:32:39 +0200
Message-ID: <CAE-0n50OEX7gMw_q3wL6HH38G1a-hi10D0_dmjJLyKq9ChA5iA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-07-16 06:58:46)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 3900cfc..8f12b8c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -268,6 +268,44 @@
>                 };

Is this pmk8350_vadc? 'pc' comes before 'pm' so please sort this section
alphabetically on node name.

>  };
>
> +&pcie1 {
> +       status = "okay";
> +
> +       vdda-supply = <&vreg_l10c_0p8>;
> +};
> +
> +&pcie1_phy {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vreg_l10c_0p8>;
> +       vdda-pll-supply = <&vreg_l6b_1p2>;
> +};
