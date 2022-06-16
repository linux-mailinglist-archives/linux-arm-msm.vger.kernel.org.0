Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9ECD54EBBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 22:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378949AbiFPU6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 16:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378846AbiFPU6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 16:58:25 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93CC2A969
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:58:24 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w21so2523546pfc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UYtUli93q5eaYmCsPHGq92tZCYUwF0QfxfGIcc7igWM=;
        b=Oe8Jic99NJNF9h8azmFuMIk7RY1nIvKWC5jwwg95iF4l16ljv/UNEkRCN4H5mE/xIZ
         CAPIzXpFXnNRJJNDIKRSDryGZEkQys5KkC/H8gxJjajHzpV3rYNxEvc8h7Ahtjrssmir
         pKBJiB9ot2vuH92aYLwEY7553XJ1txOQQ7XJhisp8CrZH+HvJe16HdggQ4RRgrcQvYKw
         KGTVABr/6+18Spm9T4xmdWeYB+1dOBhwV68ejwCp+R12l27jreT1CvQFf4GBJ5a/elfk
         e0dmDl74vljp0oGpqiq4u4UXm+F0yBongfYWgM0dmefto9UReq2xLWkv2eUvHINMW1nN
         +6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UYtUli93q5eaYmCsPHGq92tZCYUwF0QfxfGIcc7igWM=;
        b=WGHuCuL6sjJnU+Bflgk73EN3uugTTPJ3CD8R7jsYNGgj8Ic1rO5p0y4UBrcgDL4lS1
         2Um56uLoMwzmmU1uDdx6XsQv55Qf7lzta30DzDljrkLzTn9GyODim3aXlJmm1opRaEdT
         UVrR3ulJKOT8iJEnE5RDYPH1OPTEvMSWg2L+X8pJ8U+NCldAqSRdHHH6fdE3vhPEhN6a
         YoDyIzsSVD32dXNEcDF2+ECWC57465KTB2jIHO91296NsLOnjd61Zfp73DVzBhK6pVH1
         eX8n50u+Zx95gC2aHQzdcI/EjtSNC6/2HWqpPOvWB/4rYvjC8jfn7qERqb66gif7Ij3S
         /ObA==
X-Gm-Message-State: AJIora8Eb83NajLEkwczjO9KXywF8aMnRmiL9I7m+i5bc3Ig0TAsYmAW
        jPDgQsSPr8E3APIeVUfHmAVWkg==
X-Google-Smtp-Source: AGRyM1tfwAKOsQvb2Es7u8TpAmEgbiYCYHURtkk0pcemroogZFDkOPviWKITlylMf5az9R3w5qH/yw==
X-Received: by 2002:a63:3ce:0:b0:3fc:6a52:8668 with SMTP id 197-20020a6303ce000000b003fc6a528668mr6106079pgd.424.1655413104409;
        Thu, 16 Jun 2022 13:58:24 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id je21-20020a170903265500b001690d283f52sm1046755plb.158.2022.06.16.13.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:58:24 -0700 (PDT)
Date:   Thu, 16 Jun 2022 21:58:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Subject: Re: [PATCH V15 1/9] dt-bindings: mfd: pm8008: Add reset-gpios
Message-ID: <YquZarjpqTYViS6J@google.com>
References: <1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com>
 <1655200111-18357-2-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655200111-18357-2-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Jun 2022, Satya Priya wrote:

> Add reset-gpios property for pm8008.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in V15:
>  - None.
> 
> Changes in V14:
>  - None.
> 
> Changes in V13:
>  - None.
> 
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
