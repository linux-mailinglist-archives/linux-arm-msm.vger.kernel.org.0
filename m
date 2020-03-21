Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F6D18E50B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 23:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgCUWKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Mar 2020 18:10:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38977 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgCUWKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Mar 2020 18:10:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id b22so5032647pgb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2020 15:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=0VFm/16cWCdasG0RFaX8ZzkPYRlA2DGlA/X5V7KG3C4=;
        b=N20YsOKcIV4V4oWzYOo0Ef93tvll4iE5su8rBp+1dYTWCNbmImdseghgTQwHIoVIJI
         IwR0OmKBKgTtufgdpjNoUkdHIM/kWnOtodWbeCl+EwmT64wVFon/z1rwAQoYaN8QBFHB
         20cL58aIyot7dS3zem3srqNHJjOl24EgKfC7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=0VFm/16cWCdasG0RFaX8ZzkPYRlA2DGlA/X5V7KG3C4=;
        b=mrNMJgIUbRV8NdFg2bxbjzXXTMfZMFQcgRI/MhVBo5+TJMsK4x15yqzP+UwWUeJxmv
         9TZJKVJ5n9DpieVEzCMWi8/2uqx5pfOzyW/cPagZ1uTNNlu7wIgc2jv16hCZNiZW1rGL
         dBYaAgjlxNa8Zf5tPRHs2Ai1BbX9gmOJxeTMf5PQkN05Yxu6L7S/tSAmLzirgfy6FMtS
         RyN/d2zg1si85dS+8d/Zus3dUELiiVXZIGTDq1hIFxo+MBkEzgFBY9ny0Nrxfv9ExERn
         PjG+TFkhNRNZUu3P7h7GeofY7IecJ23OnWbOorh+3iDzvabtgobzkKFRyDmYJ+PafEmU
         srDQ==
X-Gm-Message-State: ANhLgQ2TQhBkppObM2YIbWluQJOai/C5Bvbaz4Wl6SLtxtGGvVkBmLlU
        Z9ioquh+gt5M5ce/oNfuQhNaJQ==
X-Google-Smtp-Source: ADFU+vtmg4y8gZK2RW82im9mLMJgdG+LNdFTlO2IwNXkHGgptNE87iYSfm9GE6CytTMDuufv/3KyHA==
X-Received: by 2002:a65:558a:: with SMTP id j10mr8651848pgs.13.1584828652463;
        Sat, 21 Mar 2020 15:10:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w17sm9046637pfi.59.2020.03.21.15.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 15:10:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <351f1091af0b6d6e0537382fad0c1c51db45edc5.1584689229.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org> <351f1091af0b6d6e0537382fad0c1c51db45edc5.1584689229.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add Coresight support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        devicetree@vger.kernel.org
Date:   Sat, 21 Mar 2020 15:10:51 -0700
Message-ID: <158482865109.125146.10520179077419628836@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-03-20 00:44:29)
> Add coresight components found on Qualcomm SC7180 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>

One nit below.

>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 507 +++++++++++++++++++++++++++
>  1 file changed, 507 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 998f101ad623..d8fe960d6ace 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1294,6 +1294,513 @@
>                         };
>                 };
> =20
> +               stm@6002000 {
> +                       compatible =3D "arm,coresight-stm", "arm,primecel=
l";
> +                       reg =3D <0 0x06002000 0 0x1000>,
> +                             <0 0x16280000 0 0x180000>;
> +                       reg-names =3D "stm-base", "stm-stimulus-base";
> +
> +                       clocks =3D <&aoss_qmp>;
> +                       clock-names =3D "apb_pclk";
> +
> +                       out-ports {
> +                               port {
> +                                       stm_out: endpoint {
> +                                               remote-endpoint =3D
> +                                                 <&funnel0_in7>;

Given that this is DT I'd say we just put this remote-endpoint all on
one line. Makes it more readable and I don't think we really care about
the line length in these cases. We're nested pretty deep because it's a
graph binding.

> +                                       };
> +                               };
> +                       };
> +               };
> +
