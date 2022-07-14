Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8141F5750DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 16:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238984AbiGNObM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 10:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239572AbiGNObJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 10:31:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88BA7643C4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657809066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QX/RLK32OpRxV1YeloU8UOOFuwfWL5YnhaUNtPHHDQw=;
        b=c5Gx0amIbmPhFZjrjrz2AKah3jfxooRM98oBhfvvIk2LmZeRN26x1FdDuhvdyUjNhWt5A8
        NVokOifoPiA6pOva5ACXpyZuyLnnJ8yE4WvDmTKzLKEgOD/JgNaXxsgYfg8xHF8faB4avl
        mFjjv8m0WbuPSSBNQLQrZwzg5P4tG5A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-RJAMo_-ZMcy_NWBNfQxqsA-1; Thu, 14 Jul 2022 10:31:04 -0400
X-MC-Unique: RJAMo_-ZMcy_NWBNfQxqsA-1
Received: by mail-qt1-f200.google.com with SMTP id u2-20020ac80502000000b002f94701339eso1603550qtg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QX/RLK32OpRxV1YeloU8UOOFuwfWL5YnhaUNtPHHDQw=;
        b=VY8U6aBcxY1okTXcAjWn+2XJ6lNvV91x59WBqHq4uZ3YhaZHJFLJQV6Gdtax+66S+Y
         oWoD91XiEVXVw1JwTzUGhldcqjNGqkr5VmHqwr8Cncssx6TYhKA4Qvfs/Nt/k0tlz8cu
         ndtC/sM+GbtXhERJLLSbZp9Z8h3wd3Kh6vOzwksHdtL8qlItdePFCfildZxPtU9biuFV
         Y6fQH0kSqBjFr+wQV93nftlGtBhxelgSEwXG4d3qzrYuOQhDZD1fFZjxQ8CPISg3Bc8h
         dJz36QvzDQqe0Q6pv2wTo83yvdMImMmjR7BTBkR6GgO5z03n5iR66iWcBcru9wrnXCaO
         Q4+g==
X-Gm-Message-State: AJIora+PQny25Aqh8f0AMXylGeRtTRbQs585EL4mF8F48ojwG3p8d48v
        GPO2Y2jTUPY/TAXVb9qbPBs+vHApqkKBYpuQ5SeKMOdCTqhLPu2W7gsYu8gNGIo9Ynaat513s6P
        EAu2YGw3pkzHZTQZDxi8HVBHhaA==
X-Received: by 2002:a05:6214:c47:b0:473:59e9:69e8 with SMTP id r7-20020a0562140c4700b0047359e969e8mr8224505qvj.99.1657809064318;
        Thu, 14 Jul 2022 07:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1st9rFmJztebffsWgSzn3ebwEOQOhl0BrSbnSPPOnthwDQ19NhIitawRRBA7nrdrhQArstG9w==
X-Received: by 2002:a05:6214:c47:b0:473:59e9:69e8 with SMTP id r7-20020a0562140c4700b0047359e969e8mr8224467qvj.99.1657809064030;
        Thu, 14 Jul 2022 07:31:04 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id r9-20020a05620a298900b006b5cb5d2fa0sm70699qkp.1.2022.07.14.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 07:31:03 -0700 (PDT)
Date:   Thu, 14 Jul 2022 10:31:02 -0400
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
Subject: Re: [PATCH v2 6/8] PCI: qcom: Make all optional clocks optional
Message-ID: <YtAopgoz+gv53y8X@xps13>
References: <20220714071348.6792-1-johan+linaro@kernel.org>
 <20220714071348.6792-7-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714071348.6792-7-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 14, 2022 at 09:13:46AM +0200, Johan Hovold wrote:
> The kernel is not a devicetree validator and does not need to re-encode
> information which is already available in the devicetree.
> 
> This is specifically true for the optional PCIe clocks, some of which
> are really interconnect clocks.
> 
> Treat also the 2.7.0 optional clocks as truly optional instead of
> maintaining a list of clocks per compatible (including two compatible
> strings for the two identical controllers on sm8450) just to validate
> the devicetree.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

