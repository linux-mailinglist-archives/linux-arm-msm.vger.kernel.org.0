Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E9B60663A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 18:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJTQuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 12:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJTQuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 12:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BAA4E60D
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666284599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uoGto+gNH92mAm1Kdu+EjWKJigMkRDwEWaF/cwWxdwc=;
        b=gz0vE6dkAS3kpRinzADQ8yzgu5Jjk3yD7qfY/xIwTwfKgLxdw7D+U7BEbBimaUFXRBqkUY
        FZPFO+s46CgFODiBIhCHHy0yINGCxIa03k6tUH8i4U6oPeZg/C7Vy3UWrpeiuJIw60EhUH
        apnL+ZZQ2QS5PH9L9OJigM5/7uuRNaE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-IF2XWwQ9NJ2oKJtPiMSOLQ-1; Thu, 20 Oct 2022 12:49:58 -0400
X-MC-Unique: IF2XWwQ9NJ2oKJtPiMSOLQ-1
Received: by mail-il1-f200.google.com with SMTP id n6-20020a056e021ba600b002fc99858e34so332143ili.14
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 09:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoGto+gNH92mAm1Kdu+EjWKJigMkRDwEWaF/cwWxdwc=;
        b=h4RuJmtqBiggPGJIa1tn1Br6yhQSi3qnTlpKIV7EIeYnqzcTMFjJL40wvf1BgGxY+Z
         Imu2IduVMoDmJVMJTVY1g4MIo1Xls8YE7abdoeyZGfGYfHCIAZT3SKYCAuLvqwXMnkBs
         qyffPoD5BHIAgTx+8NjY2qjmN5+g2cbM3qtNpbvbsm84idayVSFWsHHIEHFXZDikdIz1
         VRFCqDfE4AFX/JqFfMUGe/LASP2+xUwYgawi0zj5iINhPmwtflDRoboYXka8VbfJkXbn
         WHdUSrHqoKRKGFMJz9hHRw0dC4JSW7R1gkracHypSTZvRwkquBqST7RYnVBTUhYU3sG9
         Vr1A==
X-Gm-Message-State: ACrzQf1gTtyea4LOq6Ektn182r1snDUCqsh8gxU3pkuWtO3pf4gsHH/f
        drK5nQDKeqxC7ll3CAbsAvcpj1ryDDC1aj57nBF0EG2aFFv6+xIBTM2HD+yfDZJF3bDfomKZk+N
        zp7E8AnxDbF2zYlqvApz0XNXi1A==
X-Received: by 2002:a05:6638:4987:b0:363:c403:28ff with SMTP id cv7-20020a056638498700b00363c40328ffmr10097988jab.235.1666284597638;
        Thu, 20 Oct 2022 09:49:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5f69+U/H3YHmxW+EIukcVAqLTXZEmABQS3o/TzzGrb3p1R4FOeCnxcVZxE631gJUxtqBzN1Q==
X-Received: by 2002:a05:6638:4987:b0:363:c403:28ff with SMTP id cv7-20020a056638498700b00363c40328ffmr10097946jab.235.1666284597136;
        Thu, 20 Oct 2022 09:49:57 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id y19-20020a056602121300b006bb5af55ddfsm3477224iot.19.2022.10.20.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 09:49:56 -0700 (PDT)
Date:   Thu, 20 Oct 2022 12:49:54 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: qcom: Add basic interconnect support
Message-ID: <Y1F8MqeHxj5IaLtx@x1>
References: <20221017112449.2146-1-johan+linaro@kernel.org>
 <20221017112449.2146-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017112449.2146-3-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 17, 2022 at 01:24:49PM +0200, Johan Hovold wrote:
> On Qualcomm platforms like SC8280XP and SA8540P interconnect bandwidth
> must be requested before enabling interconnect clocks.
> 
> Add basic support for managing an optional "pcie-mem" interconnect path
> by setting a low constraint before enabling clocks and updating it after
> the link is up.
> 
> Note that it is not possible for a controller driver to set anything but
> a maximum peak bandwidth as expected average bandwidth will vary with
> use case and actual use (and power policy?). This very much remains an
> unresolved problem with the interconnect framework.
> 
> Also note that no constraint is set for the SC8280XP/SA8540P "cpu-pcie"
> path for now as it is not clear what an appropriate constraint would be
> (and the system does not crash when left unspecified currently).
> 
> Fixes: 70574511f3fc ("PCI: qcom: Add support for SC8280XP")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

