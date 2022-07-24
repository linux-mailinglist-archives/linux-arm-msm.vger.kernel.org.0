Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8224657F6FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 22:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiGXUPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 16:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbiGXUPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 16:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F665270D
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 13:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658693712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kZz4b5LoajqAvsUTBnBgNSgY5TJeL+gVGY7SLqZJsYs=;
        b=K/AA7S7zs00qMMAvoRSbG686VpiQkG+ozyLRtB5VVlGQmuaHkrFSuTd05DCr9HbQDM+UXU
        JCzoFVh8xuPVxhI0X8DCsQ/E28uWLmkjs0sPlB4YxJRLhzKC1FteBRnGqBehdFwcpdK0am
        /wXcYmCP3+3OYeZxtCs26MwaUdS/VgE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-cqaf12diPvyf2KLku6A9LA-1; Sun, 24 Jul 2022 16:15:06 -0400
X-MC-Unique: cqaf12diPvyf2KLku6A9LA-1
Received: by mail-wm1-f72.google.com with SMTP id bh18-20020a05600c3d1200b003a32044cc9fso5120568wmb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 13:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kZz4b5LoajqAvsUTBnBgNSgY5TJeL+gVGY7SLqZJsYs=;
        b=zHh/lpPOF+yBoLfJdZFvens/R2WCVZ/ctR/Cl61w1yGbm8p8VtBcA/RxinbZAduoMh
         FNZ4Uy6MpzPDy21cVwZ6yPjzTo5O0IErZjGVkGgKWu4TSfA7X4Hx1IpAlGCYakRttssu
         tMPHpkpRq6HgwCbQmWyLTrFfB22ezDzw8ruu569v/LjzlnrqzR9lQRZbW8hNYTZ5y35o
         +PlTFLlyNAVbhexILiyDdpNVtNFwkN34pq9znU2XCVg+BZkWStE57aLzlyKDFCMDnELG
         F9VCRBVO/idnfovvdFNXrKL2VTUF5LK2/p8xMr4ZXY4ssT1IJtzHt5W9AtGtwWpg0Zrh
         4OCQ==
X-Gm-Message-State: AJIora+oMP7pR8AyF4o6qq73Zx7EggrquX7kH46EORLb8w3AsiiEUAuz
        M77/0WKhW3bwfFblStd68zNA3fn+ksd9LW+eTcj0mHFOoAe+DC7qYnzivxVC5ICwCI9P+74xaJL
        GSo4Eao/fRyw6R7rKKez1Vm3Dew==
X-Received: by 2002:a05:600c:4e94:b0:3a3:4448:62cc with SMTP id f20-20020a05600c4e9400b003a3444862ccmr6292851wmq.108.1658693705159;
        Sun, 24 Jul 2022 13:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uuRx/wU5NQqtwBn5eDMRUu4h4Xzgsm5XmvnoiDQbrqTXU/ISSTDKN57eKI3H4AHbrm5rUtyw==
X-Received: by 2002:a05:600c:4e94:b0:3a3:4448:62cc with SMTP id f20-20020a05600c4e9400b003a3444862ccmr6292836wmq.108.1658693704845;
        Sun, 24 Jul 2022 13:15:04 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600c4e0c00b003a2fde6ef62sm12180954wmq.7.2022.07.24.13.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 13:15:04 -0700 (PDT)
Message-ID: <efcccedb-58e0-13a8-5c21-2e519e9fc335@redhat.com>
Date:   Sun, 24 Jul 2022 22:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
 <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
 <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
 <CAA8EJpr1xf9mkfT-FhK9M58syMnWCFXozWHH9L_gxtXOqgh0yw@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAA8EJpr1xf9mkfT-FhK9M58syMnWCFXozWHH9L_gxtXOqgh0yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/24/22 22:10, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 22:51, Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> On 7/24/22 20:47, Javier Martinez Canillas wrote:
>>> Hello Dmitry,
>>
>> [...]
>>
>>>> Now there is no point in having this as a separate function. Could you
>>>
>>> The only reason why I kept this was to avoid duplicating the same comment
>>> in two places. I thought that an inline function would be better than that.
>>>
>>>> please inline it?
>>>>
>>
>> Or do you mean inline it as dropping the wrapper helper and just call to
>> drm_atomic_helper_shutdown() in both callbacks ? I'm OK with that but as
>> mentioned then we should probably have to duplicate the comment.
>>
>> Since is marked as inline anyways, the resulting code should be the same.
> 
> Yes, I'd like for you to drop the wrapper. I'm fine with duplicating
> the comment, since it will be in place where it matters (before
> checking ddev->registered) rather than just stating the contract for
> the wrapper (which can be easily ignored).
> 
> (And yes, I do read patches and commit messages before commenting.)
> 

OK. I'll post a v3 tomorrow doing that then. Sorry for the misunderstanding.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

