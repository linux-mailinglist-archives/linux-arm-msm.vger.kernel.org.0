Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85D1337E8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 20:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCKTye (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 14:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhCKTyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 14:54:17 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04285C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 11:54:17 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id b130so21915897qkc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Ixb44A+r7Af2WiHyFvzrq48h1Z1GXE0z0YNA1AAdLY=;
        b=l2FSC/dbtya06Ys0xbDxCqwMUK4Wvsl/Ona4y7Gzft7KkQABw/Rc4F7SFMMnlvg6q1
         FYzJQ4KPE3CG8lwBmVpIeRQ6/PwJ+kGhpft/i4fuB5BSOLY2EgNA2TYvgMkJnFEHJAPz
         g7DLdi4TO5fjoioBMfQvm+/wOLxTRRgtFLdno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Ixb44A+r7Af2WiHyFvzrq48h1Z1GXE0z0YNA1AAdLY=;
        b=ifBjbyqsIkml5dLgNH0BcAhDBML/IFF0pWYmuZEKvh5tE01VehF9fDray663Pl4Gyk
         14Fiq5yt4JGmY0cY9dsFowa1KjWHi3jIL9SXgnR5SDUYhRAE9/3nSVnm8PpCVzQjFETi
         A/8IcS/9n9fJNJn++ZRjj6Zpv0L378G0iNcPmM+404JwyhKKUuMvvf7FjrH+5pFOd7Vf
         j2GIyp0gOMAhrUKIgavzQAZYRLh8djvKbQy9lJRUDS44S/FcQSAhQJ/cIfPm6MlAK4nR
         tFqaKiABCKtNAWXzhjH1J+sVpfodxBST8eCciRzq9iMB3jSsmzp/zpYN6u0HODqWjJ0U
         ZGGA==
X-Gm-Message-State: AOAM530q4ndqsi7G1qpFt8xmyhg4De9yHJWcfYaCNgQ7ZEBdiOxKTRdb
        oDahF4dDifv/xQz1ibVUUXAGZWl8+6Ug1A==
X-Google-Smtp-Source: ABdhPJzG1VTOKEtdTJMsycp35Gr5tBDl1s3h4XQECV6mg54JYUGpCOfmKucsxxF20wbYdohk8AZxRg==
X-Received: by 2002:a05:620a:1669:: with SMTP id d9mr9279962qko.3.1615492456048;
        Thu, 11 Mar 2021 11:54:16 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id h75sm2736965qke.80.2021.03.11.11.54.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 11:54:15 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id p193so22955495yba.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 11:54:15 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr13827776ybf.345.1615492455018;
 Thu, 11 Mar 2021 11:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20210311164815.14113-1-srivasam@codeaurora.org> <20210311164815.14113-3-srivasam@codeaurora.org>
In-Reply-To: <20210311164815.14113-3-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 11 Mar 2021 11:54:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VZrfgZHXBFKD2f8uygQC32mPt1CQqMpUzio+yq_Era0A@mail.gmail.com>
Message-ID: <CAD=FV=VZrfgZHXBFKD2f8uygQC32mPt1CQqMpUzio+yq_Era0A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     gross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 11, 2021 at 8:48 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> This is a trgodor variant, required to have sound node variable
> for coachz specific platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index 4ad520f00485..7623a30a64c7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -238,3 +238,21 @@ &tlmm {
>                           "DP_HOT_PLUG_DET",
>                           "EC_IN_RW_ODL";
>  };
> +
> +&sound {
> +       compatible = "google,sc7180-coachz";

You're placing this in the wrong place. Pay attention to the section
headings. Your patch is putting this in the section "PINCTRL -
board-specific pinctrl". That's not right.


> +       model = "sc7180-adau7002-max98357a";
> +       audio-routing = "PDM_DAT", "DMIC";
> +
> +       dai-link@0 {
> +               link-name = "MultiMedia0";
> +               reg = <0>;
> +               cpu {
> +                       sound-dai = <&lpass_cpu 0>;

Shouldn't the 0 above be "MI2S_PRIMARY" ?  ...and the "reg" as well?


> +               };
> +
> +               codec {
> +                       sound-dai = <&adau7002>;
> +               };
> +       };

Some overall notes, though:

1. You don't actually need to duplicate everything that you have
above. Whether you realize it or not the way devicetree works is that
it _merges_ the node in the "coachz" devicetree with the one from the
trogdor one (it doesn't replace it). So in trogdor you have:

dai-link@0 {
  link-name = "MultiMedia0";
  reg = <MI2S_PRIMARY>;
  cpu {
    sound-dai = <&lpass_cpu MI2S_PRIMARY>;
  };

  codec {
    sound-dai = <&alc5682 MI2S_PRIMARY>;
  };
};

...and in coachz you have:

dai-link@0 {
  link-name = "MultiMedia0";
  reg = <MI2S_PRIMARY>;
  cpu {
    sound-dai = <&lpass_cpu MI2S_PRIMARY>;
  };

  codec {
    sound-dai = <&adau7002>;
  };
};

Almost all of that is duplication. It's best not to duplicate. Thus,
one step better than what you have would be to just have this in
coachz to override what you need:

dai-link@0 {
  codec {
    sound-dai = <&adau7002>;
  };
};


2. In general it's discouraged (and error prone) to try to replicate
hierarchies from your parent. So the best would be to change trogdor's
device tree to something like this:

dai-link@0 {
  link-name = "MultiMedia0";
  reg = <MI2S_PRIMARY>;
  cpu {
    sound-dai = <&lpass_cpu MI2S_PRIMARY>;
  };

  multimedia0_codec: codec {
    sound-dai = <&alc5682 MI2S_PRIMARY>;
  };
};

...and then in coachz you override like:

&multimedia0_codec {
   sound-dai = <&alc5682 MI2S_PRIMARY>;
};
