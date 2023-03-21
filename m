Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8466C3C54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 21:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCUU6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 16:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjCUU6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 16:58:05 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFB5574CF;
        Tue, 21 Mar 2023 13:58:04 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id w21-20020a9d6755000000b00698853a52c7so9269997otm.11;
        Tue, 21 Mar 2023 13:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679432284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ikSdl+v2RbMsn+hZZxLLeEtGyU0+iDujgEBGvs/Jx4=;
        b=hIoWJ+EMMewQ7C7b9yprzx9sqQBtNML+H06guE4L+ADQvhrN0YRsTkFyILAvt13cS+
         BkwzUXxaV6Kfd2uxqMGFxvMwXgjs6zWzDzTzrRZmC0CjL9BUxJBTlDnnc/Ec+FXG+j62
         J/kkDoCWqlBzNuAy1U964SAVb7iAl11KfxhB7ZKYElHrwXpAG6eRP5wIlqOosNrzgd31
         tCTjpmMdmOUk9u2MD9b3KZBkjRCevSLP5Cmg+2AF1bjM/i1tqoSKdTegVFnRrhOQbA5O
         J0mP2PlxwE2vjeKeE/Att4InqUPmD8gaM5Vf81WGJj7IqXg+mq75+qdxUnDPjKyWefCZ
         cvLA==
X-Gm-Message-State: AO0yUKXzk88Axvxv60UbW4Y5ii4Vgmpnu60QAcKJslY5Ic0budQvdKu2
        JM+j6VHr3ic/z0CYC/pAOQ==
X-Google-Smtp-Source: AK7set8Rigax0lfu3Um3InrtQw2+nhx4GbZh1CaC1L9vY4pFglZ8MG3FKRE6UtnjveBVO810k6sRPg==
X-Received: by 2002:a9d:6acc:0:b0:69e:e2bb:788c with SMTP id m12-20020a9d6acc000000b0069ee2bb788cmr328484otq.0.1679432283730;
        Tue, 21 Mar 2023 13:58:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s10-20020a9d758a000000b0069f509ad088sm1919840otk.65.2023.03.21.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 13:58:03 -0700 (PDT)
Received: (nullmailer pid 1544151 invoked by uid 1000);
        Tue, 21 Mar 2023 20:58:02 -0000
Date:   Tue, 21 Mar 2023 15:58:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v4 10/18] dt-bindings: mfd: qcom,spmi-pmic: Add pdphy to
 SPMI device types
Message-ID: <20230321205802.GA1540152-robh@kernel.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-11-bryan.odonoghue@linaro.org>
 <88ccb21c-4370-7132-b2c1-c74b1f865cec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ccb21c-4370-7132-b2c1-c74b1f865cec@linaro.org>
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 19, 2023 at 12:58:48PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> > The PDPHY sits inside of the PMIC SPMI block providing register-level
> > ability to read/write USB Type-C Power Delivery protocol packets over the
> > SBU pins.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > index 8f076bb622b15..111aec53caeb5 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > @@ -140,6 +140,10 @@ patternProperties:
> >      type: object
> >      $ref: /schemas/power/reset/qcom,pon.yaml#
> >  
> > +  "pdphy@[0-9a-f]+$":
> 
> phy@

But it is not a phy which I would define as something doing digital to 
analog (or vice-versa) signal conversion/encoding. Sounds like an SBU 
controller or something...

Rob
