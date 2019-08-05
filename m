Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A2F81FD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 17:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbfHEPKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 11:10:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727259AbfHEPKb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 11:10:31 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6AA3217F5;
        Mon,  5 Aug 2019 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565017830;
        bh=1XLJDjtLhmH3Nu2ywqFu5TahZ/2ynvQCvn57FJ4sqyg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UMzQ642KAkc+xOAjK4i60aO6rfjBzXfP97qIIK292B7wUGrdd1LMUJTpGSHoynA3Z
         R6v7bE1MmoQC8rz/mRSx/dwro/IUeL/jeuBc6qrNsBfZX4uJSC34xuC70OoM700X9Q
         SGeKZVaC11tnLGIFeabDpZETP/VWtmgxY6jwXDKY=
Received: by mail-qt1-f182.google.com with SMTP id a15so81221930qtn.7;
        Mon, 05 Aug 2019 08:10:29 -0700 (PDT)
X-Gm-Message-State: APjAAAV5EfnSlKXAS24lLEnUhqtXnaLuiiuN9y1A1LSBFFxMjOPPB2Kn
        dmSwDUsdKBi0V8yUirSrfbiKqaUoSsCFzMUwHQ==
X-Google-Smtp-Source: APXvYqyWRFCd/Bz2QCeN3gI7nR18QpjL6fpHuRuvqsSwKaIPxyzaMMfZxm5GzNaAUuOC3+0j4jzM4tBAprGGhCbeeYw=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr110476642qve.148.1565017829011;
 Mon, 05 Aug 2019 08:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190803142026.9647-1-masneyb@onstation.org> <20190803142026.9647-2-masneyb@onstation.org>
In-Reply-To: <20190803142026.9647-2-masneyb@onstation.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 5 Aug 2019 09:10:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK1Xerw+319yDE6=9jmrrqQ0+DAu_nj10EX_Lj=bTJ2hw@mail.gmail.com>
Message-ID: <CAL_JsqK1Xerw+319yDE6=9jmrrqQ0+DAu_nj10EX_Lj=bTJ2hw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
To:     Brian Masney <masneyb@onstation.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Aug 3, 2019 at 8:20 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Add device tree bindings for the On Chip Memory (OCMEM) that is present
> on some Qualcomm Snapdragon SoCs.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v3
> - add ranges property
> - remove unnecessary literal block |
> - add #address-cells and #size-cells to binding
> - rename path devicetree/bindings/sram/qcom/ to devicetree/bindings/sram/ since
>   this is the only qcom binding in the sram namespace. That was a holdover from
>   when I originally put this in the soc namespace.
>
> Changes since v2:
> - Add *-sram node and gmu-sram to example.
>
> Changes since v1:
> - Rename qcom,ocmem-msm8974 to qcom,msm8974-ocmem
> - Renamed reg-names to ctrl and mem
> - update hardware description
> - moved from soc to sram namespace in the device tree bindings
>
>  .../devicetree/bindings/sram/qcom,ocmem.yaml  | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
>
> diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> new file mode 100644
> index 000000000000..1bb386fffa01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/qcom/qcom,ocmem.yaml#

Need to update the path here too.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
