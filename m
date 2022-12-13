Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745CB64B786
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 15:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbiLMOhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 09:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235112AbiLMOhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 09:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8206D2126B
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 06:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670942186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YeA7rNz9YtNXa30NSFNa5/BE9ikSCHuGqIiQHRpjT3Q=;
        b=DwqbqaDGJGZnwYxP8bqGd7l+yzV4uTKwfyPbC4Pkntdae9afGVqJly2k+VvGazuvRfd16Y
        sP1SzhGISW1bF5c4RgSDk0xplW5LfbzJpK8NpBtyAwQr4rftOqpsU+JRi+YU4q0ni2jqMX
        VTJip+Dq1BZr7zrAQt/YRsUgLQxqdOc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-9Q0bHihaP-i5oGD8YOLXoA-1; Tue, 13 Dec 2022 09:36:23 -0500
X-MC-Unique: 9Q0bHihaP-i5oGD8YOLXoA-1
Received: by mail-il1-f200.google.com with SMTP id s1-20020a056e021a0100b003026adad6a9so7615797ild.18
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 06:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeA7rNz9YtNXa30NSFNa5/BE9ikSCHuGqIiQHRpjT3Q=;
        b=K/sfSbpjz0fDz6maUGMnDPrBHAgqLm6MzF6IVDPaV2gjGz/xJFngWdgIAMrv9v6X5V
         lrMlKeT3VVw5SFzKzIrwMylUom8/k6/wq4chER82UdcGmq1gybmZPLry0QWVc4KHWxLS
         UmfzmSIOd3y9jMARBb+cFhyuNqe61yaBDdYl7eNig9WN9FsCC8SWVVwKNFJEvQS6ZeTU
         YX0iPefall7uJaOCRcrWZaakkVbOZGB5shugJtDc2oZ4JR1ra5tmF+dIc4cxjWg+dZ7R
         H+lRaix0qH2qmWa5vae/GVQGJ7HWwI8DOS4MuTMxgfvLTTqtUqvdm84snfPh4o67+nA5
         aXkQ==
X-Gm-Message-State: ANoB5pl9oSNicjxug434Ntj0uziJYaGqpkFh6iXlVc0xvD31CSFRbgLQ
        imbixbAAv9oXyWMRFqUbf7MVT3kn4dbHqxZMMNNqeo51Q+5yQVywFC/MuwEWK9pXYh0kac8uwN1
        2RgqjI2iL4IUDvi6w22giL2+oRQ==
X-Received: by 2002:a5e:d903:0:b0:6de:d90e:ee05 with SMTP id n3-20020a5ed903000000b006ded90eee05mr10135411iop.2.1670942182512;
        Tue, 13 Dec 2022 06:36:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5mLwxzWPfSBfxmcsXPVziNTpTyuENiy9aAV9FJntRMZ3j2oQKc8i8SHP3epsMHh0EojGMExA==
X-Received: by 2002:a5e:d903:0:b0:6de:d90e:ee05 with SMTP id n3-20020a5ed903000000b006ded90eee05mr10135404iop.2.1670942182262;
        Tue, 13 Dec 2022 06:36:22 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id y18-20020a027312000000b003760a908bfasm875133jab.169.2022.12.13.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 06:36:21 -0800 (PST)
Date:   Tue, 13 Dec 2022 09:36:19 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com, linux-spi@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: add missing spi nodes
Message-ID: <Y5iN48rA899u1++7@x1>
References: <20221212182314.1902632-1-bmasney@redhat.com>
 <20221212182314.1902632-5-bmasney@redhat.com>
 <c1c7b1eb-08e7-2ba5-d89a-e0be8f76fd69@quicinc.com>
 <Y5hvlX35nr8xQKEd@x1>
 <77c29d8c-34b3-f508-26bf-22520ccc1f2a@linaro.org>
 <13238048-f07c-3e8d-f170-5330ce94767c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13238048-f07c-3e8d-f170-5330ce94767c@redhat.com>
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

On Tue, Dec 13, 2022 at 02:08:47PM +0100, Javier Martinez Canillas wrote:
> On 12/13/22 14:02, Krzysztof Kozlowski wrote:
> > On 13/12/2022 13:27, Brian Masney wrote:
> > qcom,spi-video-codec is still not specific enough. You need to describe
> > real device behind spidev. To be clear - you do not describe userspace,
> > but the device.
> > 
> 
> Agree.
> 
> I believe Brian just used "qcom,spi-video-codec" as an example but is only
> a make up name to illustrate the concept. QC needs to determine what would
> be the correct <vendor,device> tuple for the IP block that the user-space
> driver will drive.

Yes, that was just an example.

Shazad: Is this thread clear about what QC needs for spidev? I'll let QC
take care of sending patch(es) to add the various compatibles since I'm
not sure what hardware will be backed by spidev.

I'll take care of making sure that sc8280xp.dtsi gets the spi controller
nodes added.

Brian

