Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C91C7A0F47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 22:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjINUs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 16:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjINUs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 16:48:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 681802120
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 13:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694724491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=p0cINci3mtMHjJpwA+Xu4ty52yxZbAV2eaOQYrtaV0U=;
        b=JGhoH9Q7dh62l8a8a4Uf5Xo58bCE/3dsdH/YMuqMBxomMfCDL8QEZWnvHlI07fVjoMmP6f
        yMTyUe01n9qzwD+357liYyYEaA7upP3raffTuWGVrjIfs2vMX5iW73HFOPWKeLl9a5ocjD
        /dBnFRiHEvYnoh9vyNlZ7hjm8mnANJA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-unnBT6vMNDG365M-QFO6Fw-1; Thu, 14 Sep 2023 16:48:09 -0400
X-MC-Unique: unnBT6vMNDG365M-QFO6Fw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-416698046eeso13910351cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 13:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694724489; x=1695329289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0cINci3mtMHjJpwA+Xu4ty52yxZbAV2eaOQYrtaV0U=;
        b=v5yNGQHler4OR1yD68PXCZ1mpvh6OG31A3bigI6rlbUQox6mSm41fwK9T9mLCfl8jj
         WVWv0pkVvFjKGlPkOD/HcdHV6Q8Gz8Us22s+I9lKbQDriOz3Ei40TK6cvz8uH2GIo3rF
         43SjU7fMi5mzjzW+W8ekow3wnLbMSNWsZFoNICUJAqV8gvvo7dsWqE9X/nbyxG0IIU2I
         bfC1AJqtOyrU6/gyHFhcxMa1QzeHeRzZEhZio2D212Ca5i4ABeXHqghym7Dr+tHMCwyT
         XCFbK3y+cKL4aM4TWSj/o8rzmnOpZf+zbQMTdj6bXbWNlM2VI09kxGZ09P7Rq8bl1wlX
         BNuQ==
X-Gm-Message-State: AOJu0YyFStmB/Gcc8sUywOxdjqREVfGXHkXJ58Bx1ys1M8ImNkwU0WEj
        SHFgFCdVSj8s0ny2MBsdhb9cZZh9RGzu4+OJW0QeK9umrf+/WnnEq64FWMFWc8tnPhhAmelQvL/
        FRp96/1werqA0uGrhZmxltGXG9Q==
X-Received: by 2002:ac8:7d96:0:b0:400:9f2c:1211 with SMTP id c22-20020ac87d96000000b004009f2c1211mr3750900qtd.29.1694724489225;
        Thu, 14 Sep 2023 13:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxac/nHgytRhBDqmqy3prk+SQnWQwVFo9KIB3TJ1fDKpfJ7JHzzP7ElCf4uookycGB0ZhQkA==
X-Received: by 2002:ac8:7d96:0:b0:400:9f2c:1211 with SMTP id c22-20020ac87d96000000b004009f2c1211mr3750885qtd.29.1694724489001;
        Thu, 14 Sep 2023 13:48:09 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id t27-20020a05622a181b00b00410957eaf3csm685689qtc.21.2023.09.14.13.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 13:48:08 -0700 (PDT)
Date:   Thu, 14 Sep 2023 16:48:06 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/2] phy: qcom-qmp-usb: fix initialization of PCS_USB
Message-ID: <ZQNxhhI120MGYKbX@fedora>
References: <20230828152353.16529-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828152353.16529-1-athierry@redhat.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gentle ping for this series, is there still anything preventing it from
being merged?

Best,
Adrien

On Mon, Aug 28, 2023 at 11:23:49AM -0400, Adrien Thierry wrote:
> This series attempts at making sure PCS_USB registers are properly
> initialized. I tested it on the sa8775p. AFAICT there's no noticeable
> change before/after the patch series: lsusb and dmesg output are the same.
> USB is still working properly. I don't know what those PCS_USB registers
> do exactly on the qmp PHY and I don't have access to the PHY datasheet, so
> it's hard for me to tell the impact of them being initialized vs not.
> 
> v1 -> v2:
> - Don't fallback to pcs for PCS_USB initialization (Dmitry Baryshkov)
> 
> Adrien Thierry (2):
>   phy: qcom-qmp-usb: initialize PCS_USB registers
>   phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p
> 
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> -- 
> 2.41.0
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

