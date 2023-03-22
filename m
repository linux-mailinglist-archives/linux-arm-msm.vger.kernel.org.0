Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39716C4D39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 15:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjCVOOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 10:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjCVOOR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 10:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339E62737
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679494407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gIhIZ9iTRojGJMYiKTfmFBTTGDFbr5/gvROIxAATKTs=;
        b=Alz3ehPOSIPTZ6fgoMgVa+oXtH5zDgjlU+zpci1ugRLrfon8O3khuErjvyBbzEdXZQlZI1
        RrAKDnyF7buqWjicShli3vXVVIChMtK+87FlNfpNsukQDuGW4yK+/Y1UvcrwGYmypgmWRq
        Chb2zmUY1ua5tK9MqZZdHSU0PRd80/g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-bCaO19EQMkGiq9RQMkiFew-1; Wed, 22 Mar 2023 10:13:25 -0400
X-MC-Unique: bCaO19EQMkGiq9RQMkiFew-1
Received: by mail-wm1-f71.google.com with SMTP id k29-20020a05600c1c9d00b003ee3a8d547eso2495054wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 07:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494404;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIhIZ9iTRojGJMYiKTfmFBTTGDFbr5/gvROIxAATKTs=;
        b=PmwstFLmpqEcd3+tk4tEa88OYDJX1djHEiDTQcHtzMynAw9kuxaJ/MDcdezvwhTya3
         6c967S1dNuX7zbMSiaxrpFhgHWzN6gJaDt4VEF5ai5/GOF4Obp0n0psqgteEBBOwmpIa
         ln23FHvh5277gYj/Nc7CB7El/F1KPs7tFnE5Xr4yOBNEP94gLiCpAuK/OzCyPWNbcHdj
         SPtMH1X+Th6ai3Ivl2S6s+bZRsvGnwJBQli7NynfEwgreupBwCgMp47VIbqqTtf1NK3/
         3W+7qM/LrHEZiGnPnHdcmEyJsdzyFbb2y/aTBwrst5PCjaUkHWuIOoYOAnHq/Nl4RGW9
         +jKQ==
X-Gm-Message-State: AAQBX9d20paPrKhzYCATGeb2f5sUprWqD7GFLLTdZ2+Y25zeTTFqDX+m
        UMoQaMwsq98HP74VsNUI8Q+tmtsRluCxhDXX87QxFi0O/EdpdUopujsY0zgVTLVeqtTbCFjl+Iy
        pRYMPW3GJkMfb9+LqG7onQ7kxPg==
X-Received: by 2002:a05:6000:1cb:b0:2d3:f610:8410 with SMTP id t11-20020a05600001cb00b002d3f6108410mr48481wrx.0.1679494404217;
        Wed, 22 Mar 2023 07:13:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350bwPM1I+KdwU+k+LnKMhL8L8AvemWt4BBwZWovdn++jO3C4QynGXhNPsmQm5XFePAlaJEWMPA==
X-Received: by 2002:a05:6000:1cb:b0:2d3:f610:8410 with SMTP id t11-20020a05600001cb00b002d3f6108410mr48464wrx.0.1679494403910;
        Wed, 22 Mar 2023 07:13:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c15-20020adfef4f000000b002c7066a6f77sm13914075wrp.31.2023.03.22.07.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:13:23 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Jordan Crouse <jorcrous@amazon.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sergio Lopez <slp@redhat.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: venus: dec: Fix capture formats enumeration order
In-Reply-To: <87ttyu54wy.fsf@minerva.mail-host-address-is-not-set>
References: <20230210081835.2054482-1-javierm@redhat.com>
 <20230303220918.qr5ydbin3nye3qtz@amazon.com>
 <87h6uydwel.fsf@minerva.mail-host-address-is-not-set>
 <3d0315fa-14ca-dc34-81ae-467d9ed5133d@quicinc.com>
 <87sfeh0yjn.fsf@minerva.mail-host-address-is-not-set>
 <CALE0LRvR=DjUp2_DBuPQkEr9jvzGH4Mx4-7=rc6zOw1APQdyeQ@mail.gmail.com>
 <20230308181245.nbnwkdtdnsldd65l@amazon.com>
 <87ttyu54wy.fsf@minerva.mail-host-address-is-not-set>
Date:   Wed, 22 Mar 2023 15:13:22 +0100
Message-ID: <87bkkkoovx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Javier Martinez Canillas <javierm@redhat.com> writes:

Hello Stanimir and Dikshita,

> Jordan Crouse <jorcrous@amazon.com> writes:
>
>> On Tue, Mar 07, 2023 at 05:20:18PM +0100, Enric Balletbo i Serra wrote:
>
> [...]
>
>>> >
>>> > But regardless, I think that it would be better for a driver to
>>> > not change the order of advertised VIDIOC_ENUM_FMT pixel formats.
>>> >
>>> > Because what happens now is that a decoding that was previously
>>> > working by default is not working anymore due a combination of
>>> > the default being changed and S_FMT not working as expected.
>>
>> For my part, I was using the gstreamer v4l2 decoder which for some reason tries
>> to verify it can support whatever format it gets with G_FMT *before*
>> trying a S_FMT. I can't confirm or deny if S_FMT currently works or not.
>>
>> That said, I entirely agree with Javier. While it might be more
>> bandwidth efficient, QC08C is a obscure format. It is far more likely that the
>> average open source user would rather use a well known output format and, as
>> has been mentioned, once S_FMT is fixed those in the know can use the other
>> formats if they are working with other Qualcomm hardware blocks.
>>
>
> Agreed. The rule is that the kernel shouldn't regress user-space and the
> patches that changed the default format certainly did that. So from that
> point of view I think that this patch should land.
>
> There's also Enric's point that NV12 is a more common format and supported
> by more user-space programs. That's why think that regardless of the S_FMT
> situation, makes sense to revert to the previous default behaviour.
>

Any news on this patch? It would be great to fix this at least for v6.3.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

