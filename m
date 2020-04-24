Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9951B7848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 16:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgDXO23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 10:28:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726848AbgDXO22 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 10:28:28 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A6322084D;
        Fri, 24 Apr 2020 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587738507;
        bh=8SNgUrX8GwVarrY8Ebo9QfXjiJ1rvJ7gh0V24v+SvcA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JR7m0hjwgKtKn5FIdX8lXcQcUCs3L0ZznrPTcW0oumHgoLDUqQGlEIeKDCDgpjblA
         aKhMAPSxoEnteZvpAFRu5h2YCBbJvwg1I+9aMaDtfoSSQkjopoKkwjhqeqP4FK3reI
         hHacNGbU3nWF28PwlPGluDYJ0+lWHFFhXGXjsI7s=
Received: by mail-qk1-f176.google.com with SMTP id s63so10302931qke.4;
        Fri, 24 Apr 2020 07:28:27 -0700 (PDT)
X-Gm-Message-State: AGi0Pubc+5gJV+ga25zkRyuA/bb/QUxQJdMssIxmUo5ZTsLoPqoMr8Mr
        fq27kByfQz4GR4hN3A4mil3cUJ63vb3Bz3Xu4Q==
X-Google-Smtp-Source: APiQypJTEZlYNHfuUM4k/UahZKOMwF+cs9AnE0Zoa69Be6ozAPXgBe3pi4Ofgx9yKbwqA1iTRmFHU2IVDittvj/nesM=
X-Received: by 2002:a37:4a85:: with SMTP id x127mr9364413qka.152.1587738506606;
 Fri, 24 Apr 2020 07:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
 <20200413164440.1138178-3-iskren.chernev@gmail.com> <20200420205501.GA6828@bogus>
 <f9b5d68d-536b-5806-573b-9dafb848f46f@gmail.com>
In-Reply-To: <f9b5d68d-536b-5806-573b-9dafb848f46f@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 24 Apr 2020 09:28:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLZ8WrOmRDBuQ5DdAfib0KaCScYY_12qfkcoZa3_Z7_3Q@mail.gmail.com>
Message-ID: <CAL_JsqLZ8WrOmRDBuQ5DdAfib0KaCScYY_12qfkcoZa3_Z7_3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add document bindings for max77826
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 23, 2020 at 7:59 AM Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
>
> On 4/20/20 11:55 PM, Rob Herring wrote:
> > On Mon, Apr 13, 2020 at 07:44:39PM +0300, Iskren Chernev wrote:
> >> +    patternProperties:
> >> +      "^LDO([1-9]|1[0-5])$":
> >> +        type: object
> >> +        allOf:
> >> +          - $ref: regulator.yaml#
> >> +
> >> +      "^BUCK|BUCKBOOST$":
> >> +        type: object
> >> +        allOf:
> >> +          - $ref: regulator.yaml#
> >> +
> >> +      additionalProperties: false
> >
> > You are defining a property called 'additionalProperties'. This one
> > should be dropped because additionalProperties doesn't work with a $ref.
> >
>
> I got the idea from mps,mpq7920.yaml. It has additionalProperties in the
> exact same places that I do. Also bd718(28|37|47).yaml seem to use
> additionalProperties inside patternProperties. Shall I modify it as well?

Indeed. mps,mp5416.yaml too. I'll fix all of these and few
non-regulator ones so I can get them into rc3.

> I couldn't find the core schema for this yaml:
> http://devicetree.org/meta-schemas/core.yaml (gives 404).  Is there a way
> to verify the validity of the yaml?

Running 'make dt_binding_check'. The url is just convention and while
files could be there they aren't. They are all contained in the
dtschema module[1].

However, in this case the meta-schema fails to check for this. It is
technically valid as it is saying you can't have a DT property called
'additionalProperties'. I've written a check now which should disallow
listing any DT property names which are json-schema vocabulary. Once
the failures get fixed I'll add it to the meta-schema.

> Also, this patch is already merged in linux-next. I guess I shall submit
> a new patch with the fixes standalone?

Yes, should be on top of this one.

Thanks,
Rob

[1] https://github.com/devicetree-org/dt-schema
