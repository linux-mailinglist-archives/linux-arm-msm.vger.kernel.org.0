Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5BB52A38B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 15:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234459AbiEQNgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 09:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348127AbiEQNgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 09:36:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 28CB6CD6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652794566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5P5WzWojyMXlDWaDvwnnFONKEvLDJzZaE27j1zka+wM=;
        b=NXEOpxnr+ZahBCXtlfINQL8L2HcIFn/91I7ssP6ZCxciDkhU8m1dqCv4yof42DviTugun/
        e30pbMb8xHpHfKLVC2ZKE10piL/xps57iL6o9CwJV2NdP8C/x8wzBctaw9OsaAgtMBK8tG
        gWEQc5MttSJg7LOyALwEOgXuGC7BrSI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-AF1F5NSKOb6axlVODVwwag-1; Tue, 17 May 2022 09:36:05 -0400
X-MC-Unique: AF1F5NSKOb6axlVODVwwag-1
Received: by mail-qk1-f199.google.com with SMTP id d186-20020a3768c3000000b0069fcfacbea0so13744101qkc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 06:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5P5WzWojyMXlDWaDvwnnFONKEvLDJzZaE27j1zka+wM=;
        b=Ev1rAy8Cg5RdnSL+ku9ZD68UvC7ATXEphjJBwzA1VCxB2QfShGrYfQC3mpKrugOg6Q
         k+1aGlvzycL5zYcedkj99wLHN6mJn1Bi0k4ypLfaBDhKMIP3ybmhOkEY78swlpVtiHHN
         AmvDdm5PyQjVwxmU66x79Ikv+JDPcoekOO/BN1VZ1XGmtUbd+sveCjAeAj94kr74PqyY
         1mAYEfhyO+afmGt6r3p2oGI9vsXklOT3kdt/+IUsYdCz6jTzA+AslokVpkkXHvnwiFKh
         rOUCBknxNxdeAPcSfYbmjhRxNhBbl2iOZ6mOiX1FJL7v5Wv0QdevR5NOF2g2GY9ScA1r
         KarA==
X-Gm-Message-State: AOAM53176dxQcDkfdmFHKYw1z/0wZU3Z+3e/TDHk/65kUTGT6UgecMHS
        W8Xejdwpom+5PTCYRZbRC2lyJDdtwQP8DMV9/2yapAPm2jD8P5Ku8Pbumfde41QLqfvqSt9tA1Y
        0N84sAvI13upfy6CzY3CZuor4Gg==
X-Received: by 2002:a05:6214:29e9:b0:45a:c341:baaf with SMTP id jv9-20020a05621429e900b0045ac341baafmr19881086qvb.77.1652794563781;
        Tue, 17 May 2022 06:36:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEdc5eDHOjlBpS8FPC+AOzBoHQp0zSLnPR5J0xOEFYvmjviuh3P28nkrVwstGyAbD+Qf1rPg==
X-Received: by 2002:a05:6214:29e9:b0:45a:c341:baaf with SMTP id jv9-20020a05621429e900b0045ac341baafmr19881031qvb.77.1652794563247;
        Tue, 17 May 2022 06:36:03 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id x2-20020a376302000000b0069fc13ce1e8sm7575349qkb.25.2022.05.17.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 06:36:02 -0700 (PDT)
Date:   Tue, 17 May 2022 09:36:01 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom-qmp: Add SC8280XP USB3 UNI phy
Message-ID: <YoOkwZAH7EM9AUop@xps13>
References: <20220513225348.1671639-1-bjorn.andersson@linaro.org>
 <20220513225348.1671639-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513225348.1671639-4-bjorn.andersson@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 13, 2022 at 03:53:48PM -0700, Bjorn Andersson wrote:
> The SC8280XP platform has two instances of the 5nm USB3 UNI phy attached
> to the multi-port USB controller, add definition for these.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I verified that these match what's in the downstream sources for the
sa8540p.

Reviewed-by: Brian Masney <bmasney@redhat.com>

