Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D021B3AC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 11:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDVJII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 05:08:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbgDVJII (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 05:08:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEA682075A;
        Wed, 22 Apr 2020 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587546487;
        bh=f0aiFIOIExhXxU07mFVwKcIPbTiTvLNT8p9G/D8EJGs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NDN581bpDopAwvyzxLsA6QQcVieKApy7B15NinWdDTq23iM7TqL6nQxin4AbUhaqT
         c3APG4SRznBpstZ++3ddlUZke6hVKzGqUIZ/QE5jPQQTtomej3nFTpx+DFjk4QeysG
         m+JhRyPgmFKxljD8usIKQTL3zvvA6F2rlQgaLIVk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585224008-15730-4-git-send-email-loic.poulain@linaro.org>
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org> <1585224008-15730-4-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ilia Lin <ilialin@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        mturquette@baylibre.com
Date:   Wed, 22 Apr 2020 02:08:06 -0700
Message-ID: <158754648689.132238.18246673092201406766@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-03-26 05:00:07)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt b/Do=
cumentation/devicetree/bindings/clock/qcom,kryocc.txt
> new file mode 100644
> index 0000000..8458783
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> @@ -0,0 +1,17 @@
> +Qualcomm CPUSS clock controller for Kryo CPUs
> +----------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +
> +                       "qcom,msm8996-apcc"
> +
> +- reg : shall contain base register location and length
> +- #clock-cells : shall contain 1

Any chance this can become YAML, take parent clocks via the 'clocks' and
'clock-names' properties in DT, and have the file name reflect the
compatible string instead of qcom,kryocc?

> +
> +Example:
> +       kryocc: clock-controller@6400000 {
> +               compatible =3D "qcom,msm8996-apcc";
> +               reg =3D <0x6400000 0x90000>;
> +               #clock-cells =3D <1>;
> +       };
