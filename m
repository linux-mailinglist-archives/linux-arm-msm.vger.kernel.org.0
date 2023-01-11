Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C70665EC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 16:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbjAKPHd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 10:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236455AbjAKPHV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 10:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19E63A3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673449584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Myn34I1yOWHLCCRT341CKLbjbol25HP/clSmV2zQUVA=;
        b=bEQbg/RQV6N+2+IjzWrRiMMhvlydtfhMsU4YUAJRgmgc0UL7nS7KB0Njc7qvdk5tRK0I2Y
        0E96nbB5DCPyMM8KTAPBQ38n9Uf8JWSVMo/dkM3qlggaUbtMR54Ca0qlZsIjJuIgaTfX0F
        GJV5nAONSobTRZ1EfCmbn5TTxpo+CsM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-SeL1DNsVNFqcROu3sejCyw-1; Wed, 11 Jan 2023 10:06:23 -0500
X-MC-Unique: SeL1DNsVNFqcROu3sejCyw-1
Received: by mail-oi1-f199.google.com with SMTP id bp6-20020a056808238600b00360c55456bcso4219779oib.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myn34I1yOWHLCCRT341CKLbjbol25HP/clSmV2zQUVA=;
        b=UxZ8VrWNzOVLsxvKOjSTJVP8KvThHONqU5qqUDqCGAmHB7J8QexEUMOFO5srwX0gPh
         IdNUWjwjj3y7lWQSCQyQYwWwtws59egTE0Ji/3cZCWozWicdwZIJIH1MVaBwkfRgNTIc
         +EdSrXbc/lKCT/kTozdhItdZ6dKoDyNEaasLtUvX9A8sNYQHzP+VojVGbpPbse0j6pMj
         nY6x5BeC8eIPOF3MdUC/PnN2m/7VUGanDw++Rr9YUbLeKZ0L9pHs/NafdV1EESin2eT3
         sqZFElHMKOXZESoH9QfU2IPKhRc4n8N8PpwR7eT+3PGZGc7LCh7Pv0aWas9nKuH3aN8Q
         eJHw==
X-Gm-Message-State: AFqh2kquzngmI37yood04sBO8f7k74/pBeyYqQNk+JafRvOrGWnnoDWC
        22F5rQWfptPPsWwp6+z4FM8QYGWSOId+wRr2tdGgsoOQ8siEc8OpJmxNMt9Q7LiTHl/enpYPHe9
        IhfHFmj0bw/Jli7eA9GDFMj5MZA==
X-Received: by 2002:a05:6870:c03:b0:14c:705e:be8c with SMTP id le3-20020a0568700c0300b0014c705ebe8cmr35115957oab.2.1673449581122;
        Wed, 11 Jan 2023 07:06:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8Uy2KPHVWIfK+X7gApwWSrPqKOZdmUIpae+29hH+FsKTAo9JPuf1PRGJTkNMy5Ms/1p31kw==
X-Received: by 2002:a05:6870:c03:b0:14c:705e:be8c with SMTP id le3-20020a0568700c0300b0014c705ebe8cmr35115934oab.2.1673449580634;
        Wed, 11 Jan 2023 07:06:20 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id s15-20020a05620a254f00b007056237b41bsm9100652qko.67.2023.01.11.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 07:06:20 -0800 (PST)
Date:   Wed, 11 Jan 2023 10:06:19 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8450p-pmics: add missing
 interrupt include
Message-ID: <20230111150619.2g737hldisyhceri@echanude>
References: <20230111082331.20641-1-johan+linaro@kernel.org>
 <20230111082331.20641-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111082331.20641-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 09:23:30AM +0100, Johan Hovold wrote:
> Add the missing interrupt-controller include which is needed by the RTC
> node.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Eric Chanudet <echanude@redhat.com>

Nit: sa8450p-pmics -> sa8540p-pmics in the subject. It was mistyped in
the commit renaming the file unfortunately.

-- 
Eric Chanudet

