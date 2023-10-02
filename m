Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 954F87B5A54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 20:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbjJBSkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 14:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjJBSkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 14:40:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100379B
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696271963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WYt6bra2fRdXu2dkXwuYoSR3Jxl4VEKHXbPW5NpZljc=;
        b=Qp52Orbjx+Rhx3zH++KoxZkye5HABQlNRHBLlOiKO3j333RwVWN1J3Wwo2zE5FRZKe1I2W
        mdKKJ7yrpL8qzp1Y6hlsuXR3JHMt7Hzl5E4ByRM5CjNEoPk3OVzrA7wgd0VZGAjwcKSQmk
        YBuBiK4QsELJT7yvN/FXIAzDiior3TQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-7eBjfyrjPua_7e_BUAT3Nw-1; Mon, 02 Oct 2023 14:39:12 -0400
X-MC-Unique: 7eBjfyrjPua_7e_BUAT3Nw-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5a213b4d0efso1232817b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 11:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696271951; x=1696876751;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYt6bra2fRdXu2dkXwuYoSR3Jxl4VEKHXbPW5NpZljc=;
        b=I5Cl6N8NBVwQ7eABSQr5CbmIwFzbNgOrbtx01GbzRpGc1s4Lw7Gp0wCyTSjNHurtrX
         GJWiflvhT0WBUJZXUqi5QQCz9TnCCEHxDUHjX5W4pufc5gfznVPyCnIXGQn+Ui+UJcga
         Rs/t2zmVLp7QcPUoo+dXJV3B/e+8cIPLTrCGEJg/JsSAgot5hfDKs5iFB7hhUodJqcrc
         bi/Sq6rRPZuLb7Ah8HtTWYlh2qOcU517rqOK04gJCxIYx0j8e9VryEmsroz7j2ZySpMv
         FId5NIaH8XDLjvKWCd1kbcg4VOqjZtu/VcLaLPD/Lsq9Z2Kquw6v4HzYKZ2uyVmQiPTb
         PqoQ==
X-Gm-Message-State: AOJu0YyXRBvDqpd1h/1lv4MgaYpYSboM3Kiud8GJPicRxX/6ODdzJIP2
        Ww2+xzMQjDYfBjrqXZtgtW1Vf2BMk3Y5DTuF/41KUoxcssoLyu8dflmhPNFskBMXxs59xKavFXM
        gfEax6PnnwtIPAVJDyzbB9z6dfQ==
X-Received: by 2002:a25:8603:0:b0:d32:f2e7:7786 with SMTP id y3-20020a258603000000b00d32f2e77786mr10996411ybk.56.1696271951089;
        Mon, 02 Oct 2023 11:39:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOWEC4ny8KWu3fUPvQKn4wRh0cjkvr8hu/5wFhvnGe0yZ1IUYjTdLH/xTEiyfLSuO18WFTAQ==
X-Received: by 2002:a25:8603:0:b0:d32:f2e7:7786 with SMTP id y3-20020a258603000000b00d32f2e77786mr10996398ybk.56.1696271950763;
        Mon, 02 Oct 2023 11:39:10 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id n5-20020a5b0485000000b00d911680fd10sm236158ybp.50.2023.10.02.11.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:39:10 -0700 (PDT)
Date:   Mon, 2 Oct 2023 14:39:08 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Nikunj Kela <quic_nkela@quicinc.com>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] firmware: arm_scmi: Add qcom hvc/shmem transport
 support
Message-ID: <ZRsOTH//BZ74mU6P@brian-x1>
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20230911194359.27547-1-quic_nkela@quicinc.com>
 <20230911194359.27547-5-quic_nkela@quicinc.com>
 <ZRsNHnuUdGl+vuqz@brian-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRsNHnuUdGl+vuqz@brian-x1>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 02, 2023 at 02:34:06PM -0400, Brian Masney wrote:
> On Mon, Sep 11, 2023 at 12:43:59PM -0700, Nikunj Kela wrote:
> > +		func_id = readl((void __iomem *)(scmi_info->shmem) + size - 16);
> > +#ifdef CONFIG_ARM64
> > +		cap_id = readq((void __iomem *)(scmi_info->shmem) + size - 8);
> > +#else
> > +		/* capability-id is 32 bit wide on 32bit machines */
> > +		cap_id = readl((void __iomem *)(scmi_info->shmem) + size - 8);
> > +#endif
> 
> The 32 bit case is defined as a u64 in two places above.

Also should the 32 bit case be 'size - 4' instead of 'size - 8'? Sorry
I just noticed that as soon as I pressed send.

Brian

