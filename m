Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A63B318A6FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 22:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgCRV3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 17:29:16 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54443 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCRV3Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 17:29:16 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so608pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=vPxunhAC+58vvctmoFp0mN4mjw3S+0eezQoOCor4cGs=;
        b=VOGW/Dj8fGjI99TmvzepftNCpO4/MF0xNVIWEVCFGM5msDgWmk9GbdMjLQF38bAiXe
         5gagPr9toHAfEAsPQwMfnuXDZQf7H3CatTnOsFNOsCOhbmACF/ZMzZCRZSSciBpOPJSC
         Q7K91OtcK/hEVFs79ZF4SKleT6de5W7BC03o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=vPxunhAC+58vvctmoFp0mN4mjw3S+0eezQoOCor4cGs=;
        b=M3zejJbcYrRvS6T1/qEdbtruMpDb+aXcBpuWysGMhIhIstZOM6MOvALuoexpzkNZnZ
         5wCb6tYEURLqabYjVoTuBuQ7YnHr3Lz2x0j/DE+8PYYKwjgM/eXP15vvPzT/27kaZujj
         YYMy5izax421o51O3enfiwptlixUYrmpTpBK6lytWiEVMYuFxV541VjNReV6LwYgfYwE
         cbi4c0n84nFlxF4WjwZM+iZIz8sjarhB2DH0DZUNAXEaeJ65oORIqDY7TpU8xLY69ZYm
         YVipWBAz8+6GfLbgUG84z6mdlxldoZqaNNQYg7BnEyuRhikF8ltwF8ag/5vxxKIDCHkh
         HqBQ==
X-Gm-Message-State: ANhLgQ3oCRcecX5Tboz+OdysJMuWEE3l4MCvadizQ+E1Z1LGXdL3uqPD
        BAkzuHyOjAMR8mIZy8Y2Ctzvfw==
X-Google-Smtp-Source: ADFU+vuNwz5zB7ybsEb07TyGdEuZebQPsPh4F6LxTKWUK7RBgfUFTMHmwsHSGC2pOB6twp7ci+pDew==
X-Received: by 2002:a17:902:aa98:: with SMTP id d24mr221832plr.74.1584566955402;
        Wed, 18 Mar 2020 14:29:15 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w6sm9144pfw.55.2020.03.18.14.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 14:29:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584505758-21037-2-git-send-email-mkshah@codeaurora.org>
References: <1584505758-21037-1-git-send-email-mkshah@codeaurora.org> <1584505758-21037-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: Introduce SoC sleep stats bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 18 Mar 2020 14:29:13 -0700
Message-ID: <158456695397.152100.7669140417826227943@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-03-17 21:29:15)
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>=20
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> SoC sleep stats driver. The driver is used for displaying SoC sleep
> statistic maintained by Always On Processor or Resource Power Manager.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Two nits below.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.y=
aml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> new file mode 100644
> index 0000000..d0c751d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> @@ -0,0 +1,46 @@
[...]
> +
> +examples:
> +  # Example of rpmh sleep stats
> +  - |
> +    rpmh-sleep-stats@c3f0000 {

I would think 'memory' would be a more appropriate node name, but OK.

> +      compatible =3D "qcom,rpmh-sleep-stats";
> +      reg =3D <0 0xc3f0000 0 0x400>;

Please add a leading 0 to the address to pad it out to 8 digits.

> +    };
