Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB04B65D54F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 15:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239381AbjADOPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 09:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbjADOPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 09:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DFA3AA89
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 06:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672841686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9cfdRosRnqWGgYsCh7xZca32Ewr/g2k4G8qYMhpZ2gk=;
        b=PoZwEdqiBWFx44iNimp4o9qDXbhwK5tJ7BGDLZ5uMeh5IpIGyQspHyPAb8l3LGEb7ZFDzC
        Kkkok9hHn0ltQNlxPSGeLMFQASX0r3xQwA2JWVWFODIA7M88JQyfH3ObA+yZeY9weN+AW+
        3N8pjg27Ij2dwod4SrzxEcIF4q1/rnQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-xvREOVXiOjyX2ddXZILiMw-1; Wed, 04 Jan 2023 09:14:45 -0500
X-MC-Unique: xvREOVXiOjyX2ddXZILiMw-1
Received: by mail-qk1-f197.google.com with SMTP id az39-20020a05620a172700b006ff85c3b19eso23175265qkb.18
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 06:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cfdRosRnqWGgYsCh7xZca32Ewr/g2k4G8qYMhpZ2gk=;
        b=3PxoFBBRN4CHDGPTM+kPlH2M3FNwuN2XnncOL8CVfg4U6p5VPUb6J6+ckyiyT2BhNe
         kK1WywMburrVr7VDn75JDY1pD7SHQgIrliAo4ck4l4hkfvYETGhJzeUHn1HFaeHqbmDL
         5EkGNKDOc1FsZ2ptJkEimKvWnG0DjbCX0t9ZYSGDV6UPQgVUR+ER7dJr8bg2E0P/vswU
         goIwXRuKljaMC6q6da1TiyOwxPyINe8oJVMOmLIz2tbwEqIAVHhCnvdfUMULDO0NQy69
         R5ZEEE64/pP1n2jSxU+bZtUmYI1932AGakKVNr1t03SLRwSqjaRiXBRekVh7gzWa76KR
         lgag==
X-Gm-Message-State: AFqh2krrohW55REZC7FTdDvwbOzcBlUwozudSF25LrIxGWOQXmXK22Vn
        KR3GRE0MFkR/5VJbbBdgDNSeGoWWVvkx/XjU3fDsx9pw/ufgDzV8zlcUOmXIFfMUXNij6L2Nf+e
        RJEVokAqTj4mY6+yZxYCzftGoEQ==
X-Received: by 2002:ac8:4247:0:b0:3a8:2e48:349f with SMTP id r7-20020ac84247000000b003a82e48349fmr68869471qtm.61.1672841683751;
        Wed, 04 Jan 2023 06:14:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs+seHgT1LQmMai82icTAb5q4cuIvHG0Fp8IH23mh3AfCWFoUZldcrrRerBKNPKLa89DFwBqQ==
X-Received: by 2002:ac8:4247:0:b0:3a8:2e48:349f with SMTP id r7-20020ac84247000000b003a82e48349fmr68869366qtm.61.1672841682031;
        Wed, 04 Jan 2023 06:14:42 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id i7-20020a05622a08c700b00343057845f7sm20431560qte.20.2023.01.04.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 06:14:41 -0800 (PST)
Date:   Wed, 4 Jan 2023 09:14:39 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        quic_shazhuss@quicinc.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com, Javier Martinez Canillas <fmartine@redhat.com>
Subject: Re: [PATCH v3 0/7] dts: qcom: sc8280xp: add i2c, spi, and rng nodes
Message-ID: <Y7WJzx78EMIS5d7z@x1>
References: <20221220192854.521647-1-bmasney@redhat.com>
 <4d434dd7-cd3c-ed53-c337-4cf1ba018aef@kali.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d434dd7-cd3c-ed53-c337-4cf1ba018aef@kali.org>
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

On Wed, Dec 21, 2022 at 01:41:52PM -0600, Steev Klimaszewski wrote:
> One note, and this isn't due to your patches at all, but the touchscreen on
> the Thinkpad X13s needs to be manually bound in order to work via echo
> 1-0010 | sudo tee /sys/bus/i2c/drivers/i2c_hid_of/bind - this patch does not
> affect that, though I had hoped maybe it would.
> 
> Tested on the Lenovo Thinkpad X13s
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>

Hi Steev,

I believe that I remember reading at some point that the touchscreen
issue on the x13s was related to some probe deferral issues. If so,
try adding this patch series from Javier to see if that helps the
situation:

https://lore.kernel.org/lkml/20221116115348.517599-1-javierm@redhat.com/

Javier separately encountered a probe deferral issue when enabling a
Snapdragon-based Chromebook on Fedora that caused him to work on that
patch series.

Brian

