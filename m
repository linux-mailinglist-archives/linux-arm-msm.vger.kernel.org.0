Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A994FBD1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 15:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346501AbiDKNdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 09:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346505AbiDKNdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 09:33:22 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AB43BA6E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 06:31:03 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id f3so14613412pfe.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ledQ0Ydi6B8CWDPYoNTQwr7v3A4gfz4vdvCqzSKqX7g=;
        b=fth/YMFqdqkmsYAECvokOQ9m1OKQ/wuocTYitHeSDJ2GYhJIBMB5N/7A6isbrL44X7
         O5zp/7f5p9eRJ3iFFZKOJuuaU2wu/OZdUKCoCU5bojzuP0hWtXsK4FwRjX18xSYTMzXv
         rsvMUmGlvJhm1dQx1PF4neFjrzqx6QLRA6rbmpYVFtGoHX98sghMPPNWcEmNPiuhCE/k
         ZbdG5GyNITJLFNrQs4cNXdRlEbRr4e/tfAWTgxQe0pxiPigqBu7Lh0FpFkjyTswktOk4
         a1rYjS4rBQByE5MwcwVMNXWR+3T8McxTTViGrWG3ezbp6NRLBCxvd0xAZWmajWK1+54u
         XGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ledQ0Ydi6B8CWDPYoNTQwr7v3A4gfz4vdvCqzSKqX7g=;
        b=YX1IWp1kxu98PpBHtGOTEGZ/apksdsEUoQbCSJ3TajVPNlaBOj5ueVwEZXMf19iiWf
         5THZNkJJ1QNM2qb9Jlrd/nZvwHEzLllPHZ0MFMn9rLg0+HdZME7W5xyMlwhedBb+cA6M
         m1DJ40irdnqen1zycqdpepVHx2pIOIWuoq2JRnACyxkwq3vhGj9hJZsk0nD7F6DGdAO4
         2Kk6bM2J02tVMF4f9OuDy7Marcatw0j0hYpYxeSQvnc2cCgukfzkgPa2zluhy3QVdCVT
         /mDA/boMjYQTAKJeXFafRYcZ9kYzKZ1xWjk/vXOi7Un8YoM/h0cpGCgyJrZG6wf32mRI
         9iyg==
X-Gm-Message-State: AOAM532T8Xjhf8XE3tnEPlKGyRroAxhnO1yD/DBIfv1K0haiwH4ov/MH
        bSDsOpxBv1QXff+5s7zF0Y3z
X-Google-Smtp-Source: ABdhPJwO+TjTZzMHsT/i6K9/3o2QsoDAcQJnb2SLEiCcwm/IE8cuMsvDvVdUcU4C7ipjf2wbQu1eEA==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id l13-20020a056a0016cd00b004e103667ee8mr32812580pfc.9.1649683862767;
        Mon, 11 Apr 2022 06:31:02 -0700 (PDT)
Received: from thinkpad ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id p3-20020a056a000b4300b004faee36ea56sm36126488pfo.155.2022.04.11.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 06:31:02 -0700 (PDT)
Date:   Mon, 11 Apr 2022 19:00:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, mhi@lists.linux.dev,
        quic_bbhatt@quicinc.com, quic_hemantk@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Sort mhi_pci_id_table based
 on the PID'
Message-ID: <20220411133057.GF24975@thinkpad>
References: <20220411054831.16344-1-manivannan.sadhasivam@linaro.org>
 <20220411123715.3640935-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411123715.3640935-1-dnlplm@gmail.com>
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 11, 2022 at 02:37:15PM +0200, Daniele Palmas wrote:
> Hi Mani,
> 
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> 
> Shouldn't this entry be after all PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306,
> ones?
> 
> Otherwise will it catch all of them?
> 

Ah, yes. Will fix it.

Thanks,
Mani

> Thanks,
> Daniele
