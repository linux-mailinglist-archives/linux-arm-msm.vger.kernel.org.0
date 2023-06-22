Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06AF73A8AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 20:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjFVS7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 14:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbjFVS7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 14:59:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E611FF2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687460340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pa+oZK/sS3e2gfb7B5cDcIjFykC7j8FP/PxBLFuYWZ4=;
        b=BWrSGxUCTbEOKX0atpo0y8+5jk6/UCrEECF0YdPYdg0j50bKIgxE9CeJWUSnIE3IXcNDFt
        ru7uGDLwcKXnnKbLFi0f+DnTRpXj6PBZFyGT6g21+5joj7+/QW8wyOjkdRZjA9Pkf7QrcX
        RGKPxakyEbLynRhwjjBq+dzt9E1MuAw=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-MrkNXcLtN0SvotxnM_IcgQ-1; Thu, 22 Jun 2023 14:58:59 -0400
X-MC-Unique: MrkNXcLtN0SvotxnM_IcgQ-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b71ea696f5so214123a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687460338; x=1690052338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa+oZK/sS3e2gfb7B5cDcIjFykC7j8FP/PxBLFuYWZ4=;
        b=YWH2AZ5ENl0FSEILykeCfIRveWS3FMxFNSZJSY0thDciIW4LGJWAOxMZnQ7v/gbmiD
         75ituNXgkVtuLj2EkuX3MecUU5p4RxJLfua+NXe7XQv/3+tPrSazc+nxiCelTSE6byoH
         HsTZwPXH0EFYX+I1e2syVbhRxL68GLOdnE9WVRfO1RajO7sX1oSzh/AKd9hkfkuRzoQd
         hyKscnZNa0vbKAoTjWf1zrvx/9jnjec/Bb6nTDSXpzfmx46r1yPq3CvCKoiQUKGTPLD5
         6LAE6UjVuK97a7UKWXvG4H1Q/SOjGpJyBHwLU7ElemDsmpmjHMbNwgdnhEdCIMStW1S3
         aFsw==
X-Gm-Message-State: AC+VfDy75duL6rTH7tM0iNm6beWt58q6H4l/B/+kKsCEK2DqCS2tyezg
        7DOZT9ah89vsA31BODtwPcTiIvDPepP0XRSNW4XJdfLaWvsWE/V9mdN8Dz1diST46y+9M+s8lfP
        u9Q//ETo/w7hwmfbB5enT/3/Ygw==
X-Received: by 2002:a05:6830:104e:b0:6b5:eaeb:63ba with SMTP id b14-20020a056830104e00b006b5eaeb63bamr3193853otp.27.1687460338353;
        Thu, 22 Jun 2023 11:58:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4xtiYm1AlCWg8QeHKLFR3de2AQr2M0emZBuj2HLlTxb3l4GMDPlkysba03FRcXQD9vQEGY2A==
X-Received: by 2002:a05:6830:104e:b0:6b5:eaeb:63ba with SMTP id b14-20020a056830104e00b006b5eaeb63bamr3193839otp.27.1687460338161;
        Thu, 22 Jun 2023 11:58:58 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id t15-20020a9d66cf000000b006b71d22be29sm363209otm.18.2023.06.22.11.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 11:58:57 -0700 (PDT)
Date:   Thu, 22 Jun 2023 13:58:54 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RESEND PATCH v2 0/5] arm64: dts: qcom: enable ethernet on
 sa8775p-ride
Message-ID: <20230622185854.57f7qem5w3ds5nzi@halaney-x13s>
References: <20230622120142.218055-1-brgl@bgdev.pl>
 <20230622184422.4e72vtqk53nnx42g@halaney-x13s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622184422.4e72vtqk53nnx42g@halaney-x13s>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 22, 2023 at 01:44:22PM -0500, Andrew Halaney wrote:
> On Thu, Jun 22, 2023 at 02:01:37PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > Bjorn,
> > 
> > Now that all other bits and pieces are in next, I'm resending the reviewed
> > DTS patches for pick up. This enables one of the 1Gb ethernet ports on
> > sa8775p-ride.
> > 
> > Bartosz Golaszewski (5):
> >   arm64: dts: qcom: sa8775p: add the SGMII PHY node
> >   arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface
> >   arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY
> >   arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
> >   arm64: dts: qcom: sa8775p-ride: enable ethernet0
> > 
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 109 ++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi     |  42 +++++++++
> >  2 files changed, 151 insertions(+)
> > 
> > -- 
> > 2.39.2
> > 
> 
> Tested-by: Andrew Halaney <ahalaney@redhat.com>
> 
> note, I did uncover a bug in stmmac (imo) wrt unbalanced calls to
> serdes_powerup/serdes_powerdown() which I plan on trying to fix shortly.
> 
> Not really related to any of the Qualcomm specific bits though. This
> looks good to me.
> 

Bart already sent a fix!

https://lore.kernel.org/netdev/20230621135537.376649-1-brgl@bgdev.pl/

Thanks,
Andrew

