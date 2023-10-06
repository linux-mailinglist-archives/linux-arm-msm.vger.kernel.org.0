Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4007BC032
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 22:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbjJFUTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 16:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbjJFUTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 16:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2C5183
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 13:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696623474;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cauyGxPXg9Dqki16H5wczwQOTEld3BMCtuai5OgK+Nw=;
        b=NA/AodM1qJiP1lc9P6p+3fxbAqTMCgfZ7yGH5zVXO6/C4/boNRK02GHb92Yrm+dWbp2QXO
        jecWCCu+qlD4T9CwWCHf+c5kaNgxN0qbZ+54JspTvnbGcRcU7fkHuH7WtbSv6w9iL8FXEZ
        z1z7skN8ID68ug4W7PtuCFNXcrsAN/w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-s6nmeGpDMRmihBIHpR7-nw-1; Fri, 06 Oct 2023 16:17:36 -0400
X-MC-Unique: s6nmeGpDMRmihBIHpR7-nw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-77577616e6cso256288585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 13:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623455; x=1697228255;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cauyGxPXg9Dqki16H5wczwQOTEld3BMCtuai5OgK+Nw=;
        b=B0hpPvtRconmVrvaWQq9RLzAtkXB4st+iu4gwLaoEFSkMq8LSOekubjXoOmE7+zk6K
         h7LSsGIY9q2eO4jtyj5YTwDLk7YXDtxDf3dFw+ujgmxNIOqj7AzliDE4VtRp9XJ/+Wev
         uoYrDOfZp8xaU5Loc+i4ZOPtGsodG+ooF+uVLb6KkKTrPqp2iGdpAa2s55tAHmsVQMz5
         OlU1YfHpTAb+J8lqMYvpPZMdXOyVeb7JAlPwnvezLr7EtLcqBhruVNH3/8WFLWA7hXwA
         aTRsTZH4GpxCia/nFDe5QkVvZ/s22Ro3LQWTn4YVwF2LvLoO2/MgLK/ydxuA6ScJ1nq/
         6qYQ==
X-Gm-Message-State: AOJu0YzXSrw/wlaW90kaoTkMsMczBtxtD5f3+vb3LCcCUnqQ38NzZIer
        C9ZF48YJbCvMB2vDErKuR3fjhepKv4xU2W13QsuKYyZte6TSGzgF3iEWADtNZ+UP3onzLPz2r4X
        FfuS7zWd5c5nDg7xQVORbB3/THQ==
X-Received: by 2002:a05:620a:4489:b0:76f:20df:f038 with SMTP id x9-20020a05620a448900b0076f20dff038mr11224080qkp.12.1696623455778;
        Fri, 06 Oct 2023 13:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzdJwo4Lu0XqeCt5pKxLkTdXoxw67dKVHpvuq2Ezi/7kUtOb2wNQ5MEHDrEkr1H47Bbgm2Nw==
X-Received: by 2002:a05:620a:4489:b0:76f:20df:f038 with SMTP id x9-20020a05620a448900b0076f20dff038mr11224050qkp.12.1696623455499;
        Fri, 06 Oct 2023 13:17:35 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id ow10-20020a05620a820a00b0076f35d17d06sm1554711qkn.69.2023.10.06.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:17:34 -0700 (PDT)
Date:   Fri, 6 Oct 2023 16:17:32 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Nikunj Kela <quic_nkela@quicinc.com>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 2/2] firmware: arm_scmi: Add qcom smc/hvc transport
 support
Message-ID: <ZSBrXOsYayiA97oi@brian-x1>
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20231006164206.40710-1-quic_nkela@quicinc.com>
 <20231006164206.40710-3-quic_nkela@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006164206.40710-3-quic_nkela@quicinc.com>
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

On Fri, Oct 06, 2023 at 09:42:06AM -0700, Nikunj Kela wrote:
> This change adds the support for SCMI message exchange on Qualcomm
> virtual platforms.
> 
> The hypervisor associates an object-id also known as capability-id
> with each smc/hvc doorbell object. The capability-id is used to
> identify the doorbell from the VM's capability namespace, similar
> to a file-descriptor.
> 
> The hypervisor, in addition to the function-id, expects the capability-id
> to be passed in x1 register when SMC/HVC call is invoked.
> 
> The capability-id is allocated by the hypervisor on bootup and is stored in
> the shmem region by the firmware before starting Linux.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

