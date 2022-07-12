Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0EF57279B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 22:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbiGLUrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 16:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiGLUrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 16:47:21 -0400
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A30F1C902;
        Tue, 12 Jul 2022 13:47:21 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id a20so5578146ilk.9;
        Tue, 12 Jul 2022 13:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m5+deZ9oGKStPdZ+5eXb53vocsz+Gl6wdIq+vUcKVZA=;
        b=cWEedQGgNeShu0M1psdeVrZqv99MgdWH+1G4rwhhNO3f4UPxABQoYlKjWRlSfK/qWi
         jdC8kwWOGaQ8R4t/PLOJvDv8hpHDE4F49VMlUnogGgLnnn50EwXNKS3zhndZ70KVv5qo
         wVdeIdqCcSs7Emw652SSxm8tufi+nJe6CJGdeMN2SV3kHN+GG+9qyojd/XjRvZmjvVAD
         S8ihryMKT3Y54QiqauinIE64kJXksLwn0phtuwZV7RPuteOl0xyotNm01i9QsBupBvBu
         M485vt6wfdEuPIxTvDyhdrqlYA5PhDmipMkKvF4jvRzVmuzF6598CBIfyyD0zjHM5gs6
         MbwA==
X-Gm-Message-State: AJIora8vd/X08lOVt0DHqx2leoreIEqerlzbxYcUzspIuCt3r+viawuQ
        9hsqFGo2kppM9H2bLBPPcg==
X-Google-Smtp-Source: AGRyM1tUqLhW2MmKcSnnx3FJIFDeZgBr5SnD+zUi/RysVYAY4hbq4jsYCubHi5F9itYZweMAQBmeVw==
X-Received: by 2002:a05:6e02:1ba4:b0:2dc:2b41:4052 with SMTP id n4-20020a056e021ba400b002dc2b414052mr22923ili.200.1657658840443;
        Tue, 12 Jul 2022 13:47:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y8-20020a056602178800b00665770bcec5sm5437937iox.49.2022.07.12.13.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 13:47:19 -0700 (PDT)
Received: (nullmailer pid 2335525 invoked by uid 1000);
        Tue, 12 Jul 2022 20:47:18 -0000
Date:   Tue, 12 Jul 2022 14:47:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 11/11] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220712204718.GO1823936-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-12-dmitry.baryshkov@linaro.org>
 <20220630231159.GA3497845-robh@kernel.org>
 <3cc60a06-6bdf-e9f4-ba8a-7aa83f57fd43@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cc60a06-6bdf-e9f4-ba8a-7aa83f57fd43@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 08, 2022 at 12:14:45PM +0300, Dmitry Baryshkov wrote:
> On 01/07/2022 02:11, Rob Herring wrote:
> > On Sun, Jun 26, 2022 at 02:25:13AM +0300, Dmitry Baryshkov wrote:
> > > Move properties common to all DPU DT nodes to the dpu-common.yaml
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   .../bindings/display/msm/dpu-common.yaml      | 47 +++++++++++++++++++
> > >   .../bindings/display/msm/dpu-msm8998.yaml     | 28 ++---------
> > >   .../bindings/display/msm/dpu-qcm2290.yaml     | 29 ++----------
> > >   .../bindings/display/msm/dpu-sc7180.yaml      | 32 ++-----------
> > >   .../bindings/display/msm/dpu-sc7280.yaml      | 32 ++-----------
> > >   .../bindings/display/msm/dpu-sdm845.yaml      | 32 ++-----------
> > >   6 files changed, 67 insertions(+), 133 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > new file mode 100644
> > > index 000000000000..f3465ee3a4ab
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > @@ -0,0 +1,47 @@
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Display DPU dt properties (common properties)
> > > +
> > > +maintainers:
> > > +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> > > +  - Rob Clark <robdclark@gmail.com>
> > > +
> > > +description: |
> > > +  Device tree bindings for the DPU display controller, common properties.
> > 
> > Common properties for QCom DPU display controller
> > 
> > > +
> > > +properties:
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  operating-points-v2: true
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > 
> > Now this schema is applied twice.
> > 
> > > +    description: |
> > > +      Contains the list of output ports from DPU device. These ports
> > > +      connect to interfaces that are external to the DPU hardware,
> > > +      such as DSI, DP etc. Each output port contains an endpoint that
> > > +      describes how it is connected to an external interface.
> > 
> > This description is marginally useful. Each port will say it is an
> > output to X. So you could just remove.
> 
> I think I will go the other way around. It is not really useful to describe
> individual ports, so I will leave just this piece, slightly rephrased and
> drop individual /ports, /ports/port@N from dpu-foo.yaml.

How is describing individual port not useful? You must define what each 
port is. Input or output. Type of data. Are they all the same?

Rob
