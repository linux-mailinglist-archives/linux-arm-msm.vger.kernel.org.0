Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4081A5F69CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiJFOkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiJFOkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:40:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FED9AFC4
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665067217;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=p+tXcwSOV4d4EWIv9hMkfRyVLOs87m6DQEHcwhzbxwE=;
        b=hztYbzUMbbtrC7+Xr6nf2C+vama1M8DDI+lNdEuJn5Wt142mfwhSfvHckeTPktT/bwoB2A
        MSedFXUUl7khR+j2V8ZPrjZGPeSLG319YDrxx5uf8msd6qIwjBu9ALHzKumHVL8madgRvU
        vR6i8F2B2tSYQ6rWzCLDguLsXMdq2v0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-16d-6RV5MmOd6KQ5G_F3ew-1; Thu, 06 Oct 2022 10:40:16 -0400
X-MC-Unique: 16d-6RV5MmOd6KQ5G_F3ew-1
Received: by mail-io1-f70.google.com with SMTP id e19-20020a6b5013000000b006b3d18586c7so1240666iob.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+tXcwSOV4d4EWIv9hMkfRyVLOs87m6DQEHcwhzbxwE=;
        b=ONCX5RYyGhDIji9AmWU21BpPRm4jogBPadUKzka/9gwNlYUyoQBElxUWJ6s5+bZ4c3
         dn4FHxtZCrNB4ta6D8bxHNaPtVNocvqJXGylj8stcqW/59Wg4I0ycnXvChOb14wNODPh
         v5IEuaS2knNFcV5X1z+LQfdpy0IQJWNjYBz7Bvvwz7ZwxDOXUifay12V5QEblRW3AAbT
         fLB1ZRkYJm+mZ3TQl9H9Cu1/WfB6Et4bJNKjBVJJyhP7f3SdoD7s58E3bYM1nIuxDjIc
         wJwG2gNYxbvmgZDFGj8WbxlPeuOi1+Qtyt8wrWwbaCwV37jRTR6qNKBr8iDR+gz9LTlc
         HLCA==
X-Gm-Message-State: ACrzQf3u06uNHrALhmN7cGWg2pKKFNWIiDTzu3Xius/ID/H7V8mRtn+J
        GhS+U+RcJa6xi47uh1vcXqLUzr71NBQ1z47TYONOBbghjvUnlNcjcpk97PYMU3ssZysNOTyQPYf
        296PnnjKWTRZQJwV9d8Uu2tFKhQ==
X-Received: by 2002:a05:6602:2d8b:b0:6a5:3332:9bcf with SMTP id k11-20020a0566022d8b00b006a533329bcfmr56064iow.211.1665067215909;
        Thu, 06 Oct 2022 07:40:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PS+ghlX3Fgu57Ciup7KgD/GG+m2sG+bU/XEsDP15MrevQn26Tsa1Y2KiI3SdvPZ6FqNY3Hg==
X-Received: by 2002:a05:6602:2d8b:b0:6a5:3332:9bcf with SMTP id k11-20020a0566022d8b00b006a533329bcfmr56050iow.211.1665067215702;
        Thu, 06 Oct 2022 07:40:15 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id b19-20020a026f53000000b0036353ba86c0sm2509913jae.9.2022.10.06.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:40:15 -0700 (PDT)
Date:   Thu, 6 Oct 2022 10:40:13 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, agross@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: correct ref_aux clock for
 ufs_mem_phy
Message-ID: <Yz7ozWHRoYSlZu/0@x1>
References: <20220830180120.2082734-1-bmasney@redhat.com>
 <Yz2VnYHaTHVpiJAM@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz2VnYHaTHVpiJAM@hovoldconsulting.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 05, 2022 at 04:33:01PM +0200, Johan Hovold wrote:
> You should fix the Subject which still refers to the "ref_aux" clock.

I'll send out a new version with the updated subject to make it easy for
Bjorn to pick up.

> I can confirm that this is needed also for sc8280xp-crd and sa8295p-adp,
> so with Subject fixed:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thanks!

Brian

