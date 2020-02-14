Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3F6415D14B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 05:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbgBNE6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 23:58:19 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54616 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728754AbgBNE6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 23:58:19 -0500
Received: by mail-pj1-f68.google.com with SMTP id dw13so3341836pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 20:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PKVY1vLFLeMqrxzisPDGi9WSqjXkmoLHrmJtuhSeWpA=;
        b=MKa4T1e2BYLw/Ugb3oAmoOd2/+jxBGU41Nm0g2vInEcGYPpAVF4qjcghbG3fkw0HXN
         B8DztKpHj8V6pZpHQYtyOIIrsJjCaE41e1kJW6DZWot3yv33XpMaDhJJYgKnZiTeDeqX
         9lhaDMVq4ps4dz1y5d1jLUP4gervls7YSjpNd5WTZAWENA13FnBpMtV3n7mm2DtQPZJS
         E+KE9/BAMpJZm741V0hwE6uCsNJYKEByXbqrXPw1LSoSDMn8bdWu52TpIGL4csxp77Ub
         tHY9EzmdRmSEUhMeV6RKEX4BiRH4F+rJ6+bcxuVYAdVDe0iUA/S/rGGKUekxwRq7mZEk
         2vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PKVY1vLFLeMqrxzisPDGi9WSqjXkmoLHrmJtuhSeWpA=;
        b=KI2CnUcqRI7jJ1iWABcw6oQ3fT5BFgctwrJ5NMB7bweW9YFpSqKHxM9Y84VQUgkRGc
         b8DhJYs3ns/suOIVa9W52TfHQjeeQyvKPfEaNhYbLDkvjPwYlrjRF9dlk5JLWtZBzfVk
         ImsaT3udvjLnvb6HJpzuYh+9w0UN3oo0dLAYMtHBerD8FFf77CEQHPRmyfGcQH8sVl1X
         iEDN03PBzYn+w/GryZkCSvW6JqkZBG5XOapY8L5plZ6Z6bryl7veovcT0R+7ACqMje0x
         15bH+g365BBR+wG5riOC85Go1qlh98RUlTk88g8iyAACcoesqVXy50ePLnOzAuM7VHn3
         CX6w==
X-Gm-Message-State: APjAAAWdq+S5hFchTss9/9mthV0y+VZ2F8kctdrVMjqR72zR2LNWsfLy
        l8yS+LxKeRYkGty0Gdwwk+1sYA==
X-Google-Smtp-Source: APXvYqxkZrLSarCDLnWJ9dsKIOTgEPrBqxnrfmJEwDBKM4wR5889OJKHFcPcKBnjFWQUIaFaaOLQog==
X-Received: by 2002:a17:902:426:: with SMTP id 35mr1467333ple.302.1581656298355;
        Thu, 13 Feb 2020 20:58:18 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a21sm4992409pgd.12.2020.02.13.20.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 20:58:17 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:58:15 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200214045815.GU3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-2-bjorn.andersson@linaro.org>
 <158164708228.184098.14137448846934888082@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164708228.184098.14137448846934888082@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Feb 18:24 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-02-10 16:50:52)
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > new file mode 100644
> > index 000000000000..8386a4da6030
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm peripheral image loader relocation info binding
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  This document defines the binding for describing the Qualcomm peripheral
> 
> Maybe drop "This document defines the binding for describing".
> 

Sounds reasonable.

> > +  image loader relocation memory region, in IMEM, which is used for post mortem
> > +  debugging of remoteprocs.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,pil-reloc-info
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    imem@146bf000 {
> > +      compatible = "syscon", "simple-mfd";
> > +      reg = <0 0x146bf000 0 0x1000>;
> > +
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +
> > +      pil-reloc {
> 
> Should that be pil-reloc@94c?
> 

Yes it should.

Thanks,
Bjorn

> > +        compatible ="qcom,pil-reloc-info";
> > +        reg = <0x94c 200>;
> > +      };
> > +    };
