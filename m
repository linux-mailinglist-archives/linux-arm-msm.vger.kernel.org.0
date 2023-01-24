Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB38167A3F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 21:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbjAXUce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 15:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjAXUcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 15:32:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FA8298E0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 12:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674592308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Uh/+HvzKrTBUoVxhArKOizvvmhv3uYpJ6dJ2xzDMsaI=;
        b=WN530v4rMdaQbnPJAnQeNfkuH5xTJ1xsL1z2Fib7PmVGuWim3st7nv9pnQrWJ3TAOP54uY
        5QOItALlC9D9ib93zinQeLrEdKpXI9Isx4vQso4sMy60ZK3UFIWUeOVgGoRo9fpEJ8Kh7K
        3PB2QsjK5MYF9HgPsRdUGHKKs6HXLFs=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-uJONVoS1MXmjrTv0l_Z23A-1; Tue, 24 Jan 2023 15:31:46 -0500
X-MC-Unique: uJONVoS1MXmjrTv0l_Z23A-1
Received: by mail-vs1-f72.google.com with SMTP id k27-20020a67ef5b000000b003d0dce04b32so3991389vsr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 12:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh/+HvzKrTBUoVxhArKOizvvmhv3uYpJ6dJ2xzDMsaI=;
        b=AAv739O2Rv4gB69mE2/bNCQZAXZeCDp2XqcAS134XZLI896BhPrtJKcS5HyMgfhD7i
         MWop/UV75A+d7fhe1YG4z5R1UQ9sts642+wpQdAzbiZXFkZqfOuEiypiOKvwdFJpInpx
         dhJPrwDaIrGDoljZXWtLr8E1m243TH+6sOG1Olq0vfSmO5/tT/ZtedKUgWYCGkvQGkVV
         hPYpZmghFT/3+NmvXg45oAwrTyLEIP8C5cZ5Xiez+qOA1sH3VLPwyrria+pg7EEYzcCk
         9gb75dUILGPGh+B8OX7rOmcEvf8Horxpa7jVuif5TTdsKENYUlwgWHoBn7dvabwvHBP5
         lUdQ==
X-Gm-Message-State: AFqh2koIn+EQ8F7q5CeFv99o/P7ZHX6qBhlslMis2sLlNmmpFHQ3MEbC
        CqJc4jZp11fsefCSV3lGdFgKEk0S8DTlhacUGSBPficIFH7GuZi40CqUC0uND7fZytFf3AHvD4w
        6/WcJ/9wrsS2XhoQ4sebFR4zxOA==
X-Received: by 2002:a67:f049:0:b0:3d3:cc3e:1cb8 with SMTP id q9-20020a67f049000000b003d3cc3e1cb8mr21478517vsm.6.1674592306013;
        Tue, 24 Jan 2023 12:31:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvXX350O2gooqvZotJtjKqUSnAbPCSKlHgvw3iaV0OvujJ5QBCAbrLbpwxP6w+E8eexeRm2fw==
X-Received: by 2002:a67:f049:0:b0:3d3:cc3e:1cb8 with SMTP id q9-20020a67f049000000b003d3cc3e1cb8mr21478495vsm.6.1674592305816;
        Tue, 24 Jan 2023 12:31:45 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id y27-20020a05620a09db00b006cfc9846594sm2048624qky.93.2023.01.24.12.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 12:31:45 -0800 (PST)
Date:   Tue, 24 Jan 2023 15:31:44 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_shazhuss@quicinc.com
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8540p-ride: Fix some i2c pinctrl
 settings
Message-ID: <Y9BAMO+qLqiYZkr7@x1>
References: <20230124192351.695838-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124192351.695838-1-ahalaney@redhat.com>
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

On Tue, Jan 24, 2023 at 01:23:50PM -0600, Andrew Halaney wrote:
> Some of the pinctrl groups were invalid for the selected pins. Select
> the proper qup group to fix these warnings:
> 
> [    6.523566] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio135" for function "qup15"
> [    6.535042] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio136" for function "qup15"
> [    6.597536] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio158" for function "qup15"
> [    6.597544] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio159" for function "qup15"
> [    6.597991] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio0" for function "qup15"
> [    6.597996] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio1" for function "qup15"
> 
> Fixes: e073899ec3e1 ("arm64: dts: qcom: sa8540p-ride: add i2c nodes")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

