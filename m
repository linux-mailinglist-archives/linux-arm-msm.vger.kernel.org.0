Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313535555B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 23:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237329AbiFVVGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 17:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiFVVGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 17:06:16 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF409FD8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 14:06:15 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-101b4f9e825so19590785fac.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=76nBAAwaqrTlWdOy83Weff0cq7sUUQgoIpTvu/weE60=;
        b=ws5vzg8YDl2rVjeKq0/ejT9iB0I0EBany/LQ3Zf4sz4GXU0pHEpuNIus47qOCFGzA0
         NNNOkrA7SQ3DBDnWEswpC2FowcUH9h8K0n0uGjPrJtpslkITCGJQCjVrDoKETVV6wQhA
         iizKH7cph+Dcn+Mv1PhYuwJmyPJex45D5D7t3SX/qL67Kos+qLIV9uF61L14v/qSercK
         9/02wKB2UQtts+X5zqB3NBDeBBlLjESQlovWqx6izlmJupkN0ycQn7LBJGzsP3c4pbcE
         C38/+NpT9MNtFoj+QDlZs4HkaICbFuIok9kiaFdP4J+C9LTkeNBER+6o/iiuaUVP2jej
         CU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=76nBAAwaqrTlWdOy83Weff0cq7sUUQgoIpTvu/weE60=;
        b=utD3vjBT3EycZEi9kwg1E9H4lSDrmMpxo5139fOjy3SRRzEWbg0nbRiBtM/JmQO3PW
         jXezWEnVLCAYheh7v2GpgerM/4rM4VkpAFcYrc9+3XCuNPgGlJ8pAG1gH4lG2yNFSsoR
         00B6sBXgbyyHvbzXiKiyiVriT+qieZNVK7meo1heywmb4OoaG0mg5HthxBEAnefxG/MB
         Kvbet0wn8lQJqfnEtPX2ZfbgDHD89FMEkq+zEHuGt5vYQ3vs7RpE6R+dBvMLRw7Mfnjl
         OVq7IZQ3ZtZhRZqRrHiwCOoPaH/e1A7QSPxzX6YjPXRZWB+yeHWyCP15XYPkrDvEM86p
         pqnQ==
X-Gm-Message-State: AJIora+bh1muV+Vl586pJfHt3M+8AaG7V3XEAIqUQVjRKvrtYmpVx353
        GvRKefq7CC1Y6N3PTycpWDdyKQ==
X-Google-Smtp-Source: AGRyM1tXfsG7aKhHAIKjiAxDLVyWaekfv1oJVncfIz0/sdO+UnQeg2nhSH8A+Kraebr4HFfDUTaG7g==
X-Received: by 2002:a05:6870:d791:b0:101:ad64:1e74 with SMTP id bd17-20020a056870d79100b00101ad641e74mr216310oab.162.1655931975221;
        Wed, 22 Jun 2022 14:06:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b28-20020a0568301dfc00b0061691db3807sm521774otj.23.2022.06.22.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 14:06:14 -0700 (PDT)
Date:   Wed, 22 Jun 2022 16:06:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: qcom: Document additional
 sc8280xp devices
Message-ID: <YrOERL276MFbG2mb@builder.lan>
References: <20220622041224.627803-1-bjorn.andersson@linaro.org>
 <20220622041224.627803-2-bjorn.andersson@linaro.org>
 <YrLXCx90bn7Id4Bn@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrLXCx90bn7Id4Bn@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Jun 03:47 CDT 2022, Johan Hovold wrote:

> On Tue, Jun 21, 2022 at 09:12:19PM -0700, Bjorn Andersson wrote:
> > Add the CRD (Customer Reference Design?) and the Lenovo Thinkpad X13s to
> 
> Qualcomm refers to "Compute Reference Design", for example, in commit
> 427b249504ea ("arm64: dts: qcom: sc7280-crd: Add device tree files for
> CRD").
> 

I'll align with that expansion of the abbreviation, thanks.

> > the valid device compatibles found on the sc8280xp platform.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - Added the two missing board compatibles
> > 
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 5c06d1bfc046..6ec7521be19d 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -238,6 +238,8 @@ properties:
> >  
> >        - items:
> >            - enum:
> > +              - lenovo,thinkpad-x13s
> > +              - qcom,sc8280xp-crd
> >                - qcom,sc8280xp-qrd
> 
> I believe the "qcom,sc8280xp-qrd" entry was a mistake and should have
> been "-crd" all along? Perhaps you should remove that entry in this
> patch.

It was a mistake on my part adding the QRD when apparently I had a CRD,
but I still believe both exists, so I'd prefer to just keep them around.

Regards,
Bjorn

> 
> >            - const: qcom,sc8280xp
> 
> Looks good otherwise:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan
