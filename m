Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBCE181496
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 10:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgCKJTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 05:19:32 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37676 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgCKJTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 05:19:32 -0400
Received: by mail-ed1-f67.google.com with SMTP id b23so1991914edx.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 02:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lmtKDGUYuG7F5ier3ytBGX7nrV1tLNtpZ8bZTDERCN0=;
        b=I0HJWZylukZsSxnfiD6bjxOnk/ELuRVRJQStaFLEbwpL/yC+VBBYMDBYNf3AevSXQ4
         IlB5Hhf+jYMUgcq4r7pMkTIOQAooTu0z2D31glUyPptvSu8vsigQPlHnfRDXlXjA0Zk+
         h9xBVZ/zCCpxq7EyMQJeLVj/SZF4HHgy5OA/D39ii14rYaPrHUGDR/uOwSDOt7d4WSTq
         L1iaQTFpDQE2Etl0muIFiG4a/PtcNAmdMYbyN7oatkk1v/mE38L06U4kcZ9ZUNDq88Fc
         ycYJTmTQ+HmSO2BG21gLnK77IyomBBvaIUrSciNBBM+dd500ySi9707FT2m1fAsiV6eP
         YQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lmtKDGUYuG7F5ier3ytBGX7nrV1tLNtpZ8bZTDERCN0=;
        b=Ve9k6YKtNxyD+f9RS4ltZRBVT1dpd+4HrcSBPY+8HHt7JssPK3t+w56qAj7GvFsqSv
         m8C4RD9D9dw64WieMD+0Fa60sFtWy7+jcb+fiLfqv6HXT276JMkskhucJv6nGD+ThcA/
         KfE0rS9gHNGTxsiBG0cKeS3XVXWgheKJinvUGMdgi5346sOMokkRa9P9XPdBrNwzKP4M
         2HgD2FGdF/I4kValPyNYYDLItOsK8MfRVdfvNn/UBsthw5vd/Pwg6ol7Am48Z3kdACBc
         IwFSPf80fBvWw6ijLc7iU4d6FTvf746E3ZibcR64hJjYqDjMU+X1JFzgn40+nExpn3qI
         nvVQ==
X-Gm-Message-State: ANhLgQ34bT0BdelqUJF/1TtnTG++ZF1Jvi0fvC85G3V+6WkZyNgsLlGv
        m7bDi7fQ058Ei5TPxbVqcItfpOE7YdvNtt72oA+1aA==
X-Google-Smtp-Source: ADFU+vvoTtkBtQdM9NOqONrxxTGORBUCqKuUEtSHcAs+812eNyJUFXzaZ7ClDJjzt3mLQLb/brNX1z8b7Lt8MNIJmFQ=
X-Received: by 2002:a05:6402:618:: with SMTP id n24mr1906687edv.366.1583918370705;
 Wed, 11 Mar 2020 02:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200310175452.7503-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20200310175452.7503-1-srinivas.kandagatla@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 11 Mar 2020 10:22:55 +0100
Message-ID: <CAMZdPi9446g388LfJPXTi-mt-+EyhkxVTMA4YGs65PX-paVu8w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: msm8916: Add fastrpc node
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Mar 2020 at 18:55, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Add fastrpc device node for adsp with one compute bank.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index bef1a66334c3..a7cd8f87df97 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1157,6 +1157,19 @@
>                                 qcom,remote-pid = <1>;
>
>                                 label = "hexagon";
> +                               fastrpc {
> +                                       compatible = "qcom,fastrpc";
> +                                       qcom,smd-channels = "fastrpcsmd-apps-dsp";
> +                                       label = "adsp";
> +
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       cb@1{
> +                                               compatible = "qcom,fastrpc-compute-cb";
> +                                               reg = <1>;
> +                                       };
> +                               };
>                         };
>                 };
>
> --
> 2.21.0
>

Tested on dragonboard410c with various HexagonSDK examples

Tested-by: Loic Poulain <loic.poulain@linaro.org>
