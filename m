Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9538E6D4521
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 15:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbjDCNCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 09:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbjDCNCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 09:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3D01A941
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680526879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qp8jb1qENX7rVnqrJSaV9tv+NNohtm3BMtsMs+alKp0=;
        b=b4TZLRpsMM0e6x5tBFt4XybyPywv1OS+fgWzua+byFw0z7sCPCB+gw0dXJokHDeKaFXoAm
        AQ02U18WqbpoxibtDon8VwRJnc97xraJ2FUwmtEW98JZ8VTNCkleGfCx4ZWRGduTlSUF0Z
        or257CVusWNSj/YpEFaPtSVK7ltWxDU=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-vpFWapyVPJ6igvk8uUGdSQ-1; Mon, 03 Apr 2023 09:01:18 -0400
X-MC-Unique: vpFWapyVPJ6igvk8uUGdSQ-1
Received: by mail-oi1-f197.google.com with SMTP id q127-20020acaf285000000b00386dec7a02bso6918107oih.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 06:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680526877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8jb1qENX7rVnqrJSaV9tv+NNohtm3BMtsMs+alKp0=;
        b=vpXkLy34ONZIQC6iBQgf0APiBitfHBPQOk/SlXO/6cia8OIR7gqy1lQYGKFmNLyZG+
         n2ZgHzlbyMl1krVc3fRAKkXLXHPTnds/VoVEDxpd+bxnjhh/uWnPbJm1lxJUExYPpLoR
         9uVLHdL5w32dCSEWd6fCfgIBwNo+ou/iscsN8G2SrDSgufZNS6oSXzs8s3ceJ3todlXQ
         TGbv6M7L6UiQAKjLCQppuOIfsdfHjeihmEMNohViLiK2u1DojC5Gvn4aTzw1K2NOYzyC
         ucfJGhlk/hpeEif2gcMZMv6JNAu50CY8FECrubQKE6ib7gOE8UQV9+rv1hEvUo3Z2uAN
         tn1g==
X-Gm-Message-State: AAQBX9cYNs29nvaomt8l8+jXoHIO+IdvpWCbylgiZ1XWrxTZR25rPdEy
        fJI44KLX8ELy4mkQ/CozMtksdGfLCmVUxz8+A5iNfVxUAdBbVX5rjVhufQtKtLVzUS4KYUot76y
        DvGZPYhm6xDg1VVTVzAu7rhRvNw==
X-Received: by 2002:a05:6870:a10a:b0:169:cbcc:25c0 with SMTP id m10-20020a056870a10a00b00169cbcc25c0mr9340406oae.14.1680526877282;
        Mon, 03 Apr 2023 06:01:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVyA1HaKN+sFnH2QwAuA0pQ0vlOfQSri1+XfKwdC7nAbRh3YgkVYvmAZP3E261XxLXanhZsg==
X-Received: by 2002:a05:6870:a10a:b0:169:cbcc:25c0 with SMTP id m10-20020a056870a10a00b00169cbcc25c0mr9340341oae.14.1680526876532;
        Mon, 03 Apr 2023 06:01:16 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id l11-20020a056870218b00b001777244e3f9sm3521228oae.8.2023.04.03.06.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:01:16 -0700 (PDT)
Date:   Mon, 3 Apr 2023 08:01:12 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, bhupesh.sharma@linaro.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        mturquette@baylibre.com, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com
Subject: Re: [PATCH net-next v3 00/12] Add EMAC3 support for sa8540p-ride
Message-ID: <20230403130112.53z6m2lmm5lnjsm2@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331220613.2cr2r5mcf2wwse4j@halaney-x13s>
 <20230331215504.0169293a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331215504.0169293a@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 31, 2023 at 09:55:04PM -0700, Jakub Kicinski wrote:
> On Fri, 31 Mar 2023 17:06:13 -0500 Andrew Halaney wrote:
> > As promised: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#t
> 
> Patch 12 never made it to netdev or lore :(
> 

Well, that's no good as I definitely want some eyes on that one :(

I've already gotten _some_ reviews on the earlier patches in v3,
I am going to absorb anything super quick into a v4 today, then send that out,
maybe copy pasting larger questions I have yet to respond to? Seems like
an ok approach.. not having the full solution in hand is crummy for
review. Let me know if you think that's a bad call and just a resend is
better.

Sorry, not sure where I messed that up Friday evening when writing
changelogs etc.

