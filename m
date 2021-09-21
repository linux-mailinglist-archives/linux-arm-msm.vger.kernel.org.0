Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74EE24139CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 20:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbhIUSMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 14:12:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231944AbhIUSMp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 14:12:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 035FB61186;
        Tue, 21 Sep 2021 18:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632247877;
        bh=/eXTvMGQoB3BJQRBToMNIlbMriBJtYk+eSueraTFObI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BqaMC+1ZWGExzjZDGBO1UtAF9v2ylMun+e7Ayf5PzFEBRyxILXh5J6Bahin8VSUD8
         J28Pdkyb7j4YNCs94lDVBboKZJhTaR3qUUSvpLwb1vKNNK0l9YigRcSJ0zk+LkocJf
         1+T4AxthSE8OZIvLkTteWPO/KIucwlPfaRAOU7n65XD4KowYhtrcKt0sOrqdfMjZXA
         SB6tcRTelQJp3bzvAW+myHiESi4SbgnDnsD49uMMx4kBajqhiApHc81gqvKDT5N3hK
         lPg+9Im5pgO2V7azhIMjF6XUdqPIFcnrxcfGV3Q/K7Ts9KstnBfB0Tsc3Hm3w4gvVZ
         McDecpBZE2K9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1632220746-25943-2-git-send-email-rajpat@codeaurora.org>
References: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org> <1632220746-25943-2-git-send-email-rajpat@codeaurora.org>
Subject: Re: [PATCH V9 1/8] dt-bindings: spi: Add sc7280 support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 21 Sep 2021 11:11:15 -0700
Message-ID: <163224787559.763609.17193788799229852583@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajesh Patil (2021-09-21 03:38:59)
> Add compatible for sc7280 SoC.
>=20
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---

One nit below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yam=
l b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> index ef5698f..1c8b2ea 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> @@ -21,7 +21,10 @@ allOf:
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sdm845-qspi
> +      - enum:
> +          - qcom,sdm845-qspi
> +          - qcom,sc7280-qspi

Would be nice to keep this alphabet sorted too.

> +
>        - const: qcom,qspi-v1
> =20
>    reg:
