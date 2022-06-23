Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA7C558508
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 19:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbiFWRx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 13:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235474AbiFWRwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 13:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CDF2656749
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656004407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XN7oDkYMlVq4zYDVCkrX4IsfCj98UeViNtsSEBKFwUI=;
        b=Gx40Am1RxZyJh2MwJVdQrSh9fQpUOXZLWc9fjXtHDxdZmN4Ab5P7p0xCQKjWd/yxtw/xV7
        xy282dV7ICFDaYCf6C89cO66G9CuC1VETLNoCI6wnUDDr4UQ0lZ6mKWvc2+NMhgfJU6SXD
        vFG2mVkYeGEyqbsI5evTQFkjNrK96f8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-NkKuBTuFOm-qBzAwzYxp_g-1; Thu, 23 Jun 2022 13:13:26 -0400
X-MC-Unique: NkKuBTuFOm-qBzAwzYxp_g-1
Received: by mail-qk1-f200.google.com with SMTP id bq34-20020a05620a46a200b006a9793b0cd3so24144537qkb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 10:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XN7oDkYMlVq4zYDVCkrX4IsfCj98UeViNtsSEBKFwUI=;
        b=d8R7JOQ4fZhJsiL+sXC7Tn3AvFfKUHDFT00GwOG8Dem7Zk6Hh+kPbUjBoQkUfjTH6M
         //nu2RoJXWiKwrIOhGh4RFiUagLY1Wqom9SfglnY1KIZzqnXVjcAMRr8X5yvn66ePgOW
         CRd3NbCzESetMhL8euPUFd5sHl/OosLxwR55zxVlECG5FtyJVi+ViXh0W2NZjr+oYOyU
         GVDVF8upzeZUW8Is65ozVzmi9xWAb7rhIwLiyFpLtpQKDJFi1rDxu3YvpTIIryRrE/+E
         Ac3o+0+/p2gAo0GqKpYJ76WDtJZ5zQC4Nvdwf5WXivDDKU4O/GlNfZQkue4BTTSzuou+
         hvKA==
X-Gm-Message-State: AJIora/i0RyYDuH/4pNKL8iKhtfO9XFpImsg94Ygpxl0cWQan//01m+C
        wa/HcF8lCTmNg43RjbNR1+aH1SpjfIjRXA2GCHQ7/6vHEXaNnr8fWxNCLIb4zHKtupMcraEe1vK
        7g4EsnqjtqD8GTRm55TufYRd8QQ==
X-Received: by 2002:a05:620a:2781:b0:6a6:db99:ea07 with SMTP id g1-20020a05620a278100b006a6db99ea07mr6962562qkp.452.1656004405727;
        Thu, 23 Jun 2022 10:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1te0myCUpLObJzyG3prW0evhfkUvySWYmtXu5OCZvGyWtCRXW5eKybjfnd4TWe3HrXncH8TRw==
X-Received: by 2002:a05:620a:2781:b0:6a6:db99:ea07 with SMTP id g1-20020a05620a278100b006a6db99ea07mr6962537qkp.452.1656004405426;
        Thu, 23 Jun 2022 10:13:25 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id t12-20020a05620a450c00b006a746826feesm40495qkp.120.2022.06.23.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:13:25 -0700 (PDT)
Date:   Thu, 23 Jun 2022 13:13:24 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <YrSfNDToEZ0RhSAD@xps13>
References: <20220623142837.3140680-1-bmasney@redhat.com>
 <20220623153226.drrbx2jolrxxe7as@halaneylaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623153226.drrbx2jolrxxe7as@halaneylaptop>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 23, 2022 at 10:32:26AM -0500, Andrew Halaney wrote:
> I'm not knowledgable enough on the clock subsystem or have access to
> documentation to comment on correctness outside of the 5.4 MSM kernel
> you mentioned, but I think this probably deserves a Fixes: tag?

Good call!

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")

