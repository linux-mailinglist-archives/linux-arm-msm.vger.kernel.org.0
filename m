Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC0A135CC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 16:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732393AbgAIPcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 10:32:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732374AbgAIPcB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:32:01 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40E992075D;
        Thu,  9 Jan 2020 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578583920;
        bh=Hn4tjjgwi3+in4jXN65JjSaynghmcVXRXyVZVHU3QjE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZSQIHVCMCfpRCRvlV7H1IfAqc59b3kdLkhnvouwDuvdeAOhByg1FmPx46KN9AgHws
         GzYomRmbxTpIsBADwRCUwpn6jgiXMUipwWkV4NRmCsCT5v2iKP1Q5nobXMDufWCV7Z
         gTJ4/FsVhIvW6L7qtepbFVqHRb395qBcWj/SkAGk=
Received: by mail-qk1-f180.google.com with SMTP id c16so6316439qko.6;
        Thu, 09 Jan 2020 07:32:00 -0800 (PST)
X-Gm-Message-State: APjAAAWU5MNAaKhcNC/YctENhD5o3ugfgZb/9VQ6qdRyhFqBnqyt4+e0
        yFd42qm7K0eFof88K/0LpTHZVh0LFyV/4CLzsQ==
X-Google-Smtp-Source: APXvYqz562TZ5Zfx7NktA0xTJngmgvoVxt/eH+oL4dBz+HGBSFqhzyA8cfEzhcZqQUpS3wTBPt+I1VqF9W6GqJf8o/E=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr9940102qke.393.1578583919273;
 Thu, 09 Jan 2020 07:31:59 -0800 (PST)
MIME-Version: 1.0
References: <1577165532-28772-1-git-send-email-sthella@codeaurora.org>
 <20200108163943.GA26863@bogus> <8aeb91730552357db340f8bfb21e6d15@codeaurora.org>
In-Reply-To: <8aeb91730552357db340f8bfb21e6d15@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 9 Jan 2020 09:31:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5Gh2A3KfCgRFv+B50Y4PPF1b+qq8vY6yKhbea6KPAkw@mail.gmail.com>
Message-ID: <CAL_JsqL5Gh2A3KfCgRFv+B50Y4PPF1b+qq8vY6yKhbea6KPAkw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: nvmem: add binding for QTI SPMI SDAM
To:     sthella@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 9, 2020 at 4:57 AM <sthella@codeaurora.org> wrote:
>
> On 2020-01-08 22:09, Rob Herring wrote:
> > On Tue, Dec 24, 2019 at 11:02:12AM +0530, Shyam Kumar Thella wrote:
> >> QTI SDAM allows PMIC peripherals to access the shared memory that is
> >> available on QTI PMICs. Add documentation for it.
> >>
> >> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
> >> ---
> >>  .../devicetree/bindings/nvmem/qcom,spmi-sdam.yaml  | 79
> >> ++++++++++++++++++++++
> >>  1 file changed, 79 insertions(+)
> >>  create mode 100644
> >> Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> >> b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> >> new file mode 100644
> >> index 0000000..8961a99
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> >> @@ -0,0 +1,79 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >
> > Dual license new bindings:
> >
> > (GPL-2.0-only OR BSD-2-Clause)
> >
> > Please spread the word in QCom.
> Sure. I will add Dual license in next patchset.
> >
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/nvmem/qcom,spmi-sdam.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Technologies, Inc. SPMI SDAM DT bindings
> >> +
> >> +maintainers:
> >> +  - Shyam Kumar Thella <sthella@codeaurora.org>
> >> +
> >> +description: |
> >> +  The SDAM provides scratch register space for the PMIC clients. This
> >> +  memory can be used by software to store information or communicate
> >> +  to/from the PBUS.
> >> +
> >> +allOf:
> >> +  - $ref: "nvmem.yaml#"
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - qcom,spmi-sdam
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 1
> >
> > ranges? The child addresses should be translateable I assume.
> The addresses are not memory mapped on the CPU's address domain. They
> are the SPMI addresses which can be accessed over SPMI controller.

Doesn't have to be a CPU address. Are the child offsets within the
range defined in the parent 'reg'? If so, then it should have
'ranges'.

> >
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +
> >> +patternProperties:
> >> +  "^.*@[0-9a-f]+$":
> >> +    type: object
> >> +
> >> +    properties:
> >> +      reg:
> >> +        maxItems: 1
> >> +        description:
> >> +          Offset and size in bytes within the storage device.
> >> +
> >> +      bits:
> >
> > Needs a type reference.
> Yes. I will add a reference in the next patch set.
> >
> >> +        maxItems: 1
> >> +        items:
> >> +          items:
> >> +            - minimum: 0
> >> +              maximum: 7
> >> +              description:
> >> +                Offset in bit within the address range specified by
> >> reg.
> >> +            - minimum: 1
> >
> > max is 7?
> I don't think it is limited to 7 as it is the size within the address
> range specified by reg. If the address range is more than a byte size
> can be more.

Then why is the maximum offset 7?

Rob
