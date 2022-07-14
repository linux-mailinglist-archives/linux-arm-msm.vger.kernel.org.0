Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 618915750D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 16:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238243AbiGNOa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 10:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235773AbiGNOa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 10:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE92F5C943
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657809025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ntTuSjA4Qbr6GUmqmKDR9KDLjR1tsalNNR6HXiXW8Mg=;
        b=GiYqKn1ff7RUOk3qt+76EGWtg61gjvg0TZ+8G87rxqEB4nJT8llpO1r2Mkq3tIP3dO3Cje
        yZqdsYEyDfB5B5QwwYDjX2bsTRWGdlkXQeG8/WtROzcVT+89sV3QJW3TqHJH60dZy69TJW
        vhVJarHLfbwWYUwfXSaSUuCPKPNnC2U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-hujKud6KNSCqy-vMZYW1Wg-1; Thu, 14 Jul 2022 10:30:23 -0400
X-MC-Unique: hujKud6KNSCqy-vMZYW1Wg-1
Received: by mail-qk1-f200.google.com with SMTP id t203-20020a3746d4000000b006af1d3e8068so1288281qka.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ntTuSjA4Qbr6GUmqmKDR9KDLjR1tsalNNR6HXiXW8Mg=;
        b=Zk+NHoFKZNt4rNExqCNSdVgrT8HBnezUON0QreC9LGhTpHy4Wi9q6VvTSNV589QRy9
         6DJBbSqtjEKDP9Kh8uvOt0abIoylRz/ejdrvyCB+/sHWwBlfUEuR+1V15mNjJUnmazMF
         HhPDGQy5BuXBg66QrJaFr+IfWw0fz1H8tRItrz1XWYT9OtLGYR8pBKtAyPZi7GDR4MNY
         2P+PKENg7qbPwOBWvMtaiBO/snpoUR1bUpp1J7Gv/wsXiES65iPOSke+n9WLB4UUzodJ
         8R4KKS95riIoIIkjeA00Yi2XQRbDKeIxjBZ1tRMv7ted2zWnlTmSdffAMHIJktiJkOgM
         UvMQ==
X-Gm-Message-State: AJIora+oSAGcdk9S6YrX9XXt69EHV16fyP820iVNE1661rkcb2I3R7f6
        BPAhSiMqHgcqvHd+HGQxiElrrTX6zRxeWjlHfKDa4RYSAQ2ZJYpWq0OL7rGLrU2MmwnWZf42fo6
        SaVkZS4Oa43Yf9caZGdsu8JaWyw==
X-Received: by 2002:a37:c444:0:b0:6b5:bb9b:94ef with SMTP id h4-20020a37c444000000b006b5bb9b94efmr5122281qkm.411.1657809023366;
        Thu, 14 Jul 2022 07:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHB5XxL+b05VlwhYR1I2Pf+3ogfGMLZm4EL5k8yaXQWkjJU/o0PvlbmbMRhd+zQrATU/ckpQ==
X-Received: by 2002:a37:c444:0:b0:6b5:bb9b:94ef with SMTP id h4-20020a37c444000000b006b5bb9b94efmr5122258qkm.411.1657809023140;
        Thu, 14 Jul 2022 07:30:23 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id q7-20020a05620a0d8700b006b57b63a8ddsm1502612qkl.122.2022.07.14.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 07:30:22 -0700 (PDT)
Date:   Thu, 14 Jul 2022 10:30:21 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/8] PCI: qcom: Add support for SA8540P
Message-ID: <YtAoffqhZQi1vIHa@xps13>
References: <20220714071348.6792-1-johan+linaro@kernel.org>
 <20220714071348.6792-6-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714071348.6792-6-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 14, 2022 at 09:13:45AM +0200, Johan Hovold wrote:
> The SA8540P platform has five PCIe controllers: two 4-lane, two 2-lane
> and one 1-lane.
> 
> Add a new "qcom,pcie-sa8540p" compatible string and reuse the 1.9.0 ops.
> 
> Note that like for SC8280XP, the SA8540P controllers need two or three
> interconnect clocks to be enabled.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

