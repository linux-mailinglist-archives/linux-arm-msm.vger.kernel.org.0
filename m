Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23E9628B36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 22:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237534AbiKNVRN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 16:17:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235941AbiKNVRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 16:17:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DF8D10B
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668460574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pPyHbVIhVXxAvPHXANuB0471/7HtR2HBTgw/R/uDUnU=;
        b=BYRu6cMftb7uCp/ojXk24w8QhCPFPMLjAQVGbL8yEH9LOUvvginfAwJphyKYNmIE4SSzKO
        KKD8yYoNTX/kzGi488AFGMPctqx7Ti+uyHEqs+JRohrsm7qG8PongYyAo41f0nqAR3kVOj
        sKKBX6s/QaGe8vowPqfu9OT/cDMC2CI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-riZGmKTOOWKqGxYzghKSCA-1; Mon, 14 Nov 2022 16:16:12 -0500
X-MC-Unique: riZGmKTOOWKqGxYzghKSCA-1
Received: by mail-qk1-f197.google.com with SMTP id j13-20020a05620a410d00b006e08208eb31so12001845qko.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 13:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPyHbVIhVXxAvPHXANuB0471/7HtR2HBTgw/R/uDUnU=;
        b=VJmEzThiWnZoaBiInem8jAZG3IwjRF3ha+bf8ugMfWrH+i8j5Wp0O0I6sX+FnMNlRs
         Y9zdJIfS7dyYPUrpxNXydTRmC65dU4LqWydehsktZndqrAYJ30a+sMjMRYf6EcNcTn8E
         brN2MWQfPFpmBPdyYCzZZwYGCUT4qwCk+xUwC8MbnEz3I5Xq9eL2KVYX7C1+H2dYCjXq
         JrQMwoS+46pyOz3s7k+BFjnUGri/oMa+Aqp1df6DTIM/3/bsOBQoDMnixc+auvcnaVHO
         5EHHnNArdMY/dcoioPaKn+ak6qcjDqskis/ugPWaPN5A7KDyiHFTRAFrny+fo+ZqbLo+
         pqBw==
X-Gm-Message-State: ANoB5pn4Zjb2PNZDYC3zW8kXY4/RBKnHyyN7ddiVy3nxfBBH7J5zeyuz
        CzqRGGvI4AEQQ9VWCqB6eMVhvcTzwQ6pO+5m9HqG+Buagk1doP3CZKHjPrAf8GJ/EyPspZUe+Ga
        2yyz3JAVaLREbx2QV7gjkX22ppg==
X-Received: by 2002:a05:620a:3711:b0:6ee:96d8:962d with SMTP id de17-20020a05620a371100b006ee96d8962dmr12629985qkb.209.1668460572151;
        Mon, 14 Nov 2022 13:16:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6YzbTn7dUc6FTHqSRbY4M/FChvve5lyZZaDUwzmqNtHLCpgpJUTe0OMVn9VSvRM4ckJMFevw==
X-Received: by 2002:a05:620a:3711:b0:6ee:96d8:962d with SMTP id de17-20020a05620a371100b006ee96d8962dmr12629974qkb.209.1668460571935;
        Mon, 14 Nov 2022 13:16:11 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a254800b006ee8874f5fasm6999677qko.53.2022.11.14.13.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 13:16:11 -0800 (PST)
Date:   Mon, 14 Nov 2022 16:16:10 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Robert Marko <robimarko@gmail.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, psodagud@quicinc.com,
        quic_shazhuss@quicinc.com, quic_ppareek@quicinc.com,
        ahalaney@redhat.com, echanude@redhat.com,
        nicolas.dechesne@linaro.org
Subject: Re: [PATCH RFC] gpiolib: ensure that fwnode is properly set
Message-ID: <Y3KwGg0als0NyQ/I@x1>
References: <20221114202943.2389489-1-bmasney@redhat.com>
 <b3860cbd-0967-0b8d-3d67-f2a09f1e0042@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3860cbd-0967-0b8d-3d67-f2a09f1e0042@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 14, 2022 at 10:02:11PM +0100, Robert Marko wrote:
> Hi, the following patch should fix it for you, I have hit the same issue on
> IPQ8074.
> 
> https://patchwork.ozlabs.org/project/linux-gpio/patch/20221111113732.461881-1-thierry.reding@gmail.com/

That fixed the issue. Thanks, Robert.

Brian

