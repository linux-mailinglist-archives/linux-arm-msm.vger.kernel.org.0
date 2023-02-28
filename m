Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B54E6A5CB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjB1QEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjB1QEg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AF52331B
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677600231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZWMAworI50CQabTilrteqDasDy+XoVkceugkq8E6Pr8=;
        b=OzD6+RZKWu0ONd5ihNRzjvBWK7SshSf1RxLwK/cqR2upL++XxSr/jnzUd+OK2/0ux8koaT
        gQk4FuPJCUUXyK0/UCSOS3afG/G4c3VULl+UVXyFt+ESAV7x89rswLNNYuxXT+EtNhIP4L
        k5bLJqOZEKaEXt68qGV6CfpW0u5DrPY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-AKM-KzBePb6bsoDMhgyQqQ-1; Tue, 28 Feb 2023 11:03:46 -0500
X-MC-Unique: AKM-KzBePb6bsoDMhgyQqQ-1
Received: by mail-wr1-f69.google.com with SMTP id u5-20020a5d6da5000000b002cd82373455so610573wrs.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677600225;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWMAworI50CQabTilrteqDasDy+XoVkceugkq8E6Pr8=;
        b=zpwPrXlUcPs8ELFD3R/3TDzYm6UxYGNY3ig3JCJWLZpX3E9vp0g9E3AvZSOM8/xCzy
         jMhw5ZhX3fpArtyayzOGM5gL51ZaARNqPy9aPsVTltHnwAvYBJdoLP3q4m4rErh9SmM0
         lZNS6NJW122M1VyDyueWotU7lO3PrkGAbV+f3KvAZ7Db4bjnJdn7tGOM0VeNZ8lKo2vs
         onuu/IVPMf2OqlKq25w+1sl7FMiUAPxo6fcJBK3I9ctdoh7Pp4+qeCB7sJe1FohaBQle
         xru/59AQwVECj6HZ/lst0rJykz0GSRcy00NYLjWpRKi2Eq9XvSK6KyDFusLRYQVDhof9
         NBvg==
X-Gm-Message-State: AO0yUKUK05zWytKLoPyNKwZ9VuEnQtuKKuO2L0Fl36OAf6MG2VrsX//0
        6cFEUu8QhACTzsDCE02BldS4Fa/LvxWHLCEfZJqk6Fo5P225pJCKLOAaEvpdZl1EU+XDQXg9Zo2
        AjJYQlzhz0L/zkNgQTkLl4V5OWg==
X-Received: by 2002:a05:6000:1c5:b0:2ca:fd48:7c1e with SMTP id t5-20020a05600001c500b002cafd487c1emr2573797wrx.48.1677600224600;
        Tue, 28 Feb 2023 08:03:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9v0g4E7whTc7rYOu89mROUSRxzGr6QXBdhfOQaLBzNnR8lC5RcL1m+NJS3PUR1LZvjFt2e1g==
X-Received: by 2002:a05:6000:1c5:b0:2ca:fd48:7c1e with SMTP id t5-20020a05600001c500b002cafd487c1emr2573757wrx.48.1677600224266;
        Tue, 28 Feb 2023 08:03:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b003dc1d668866sm16485490wmi.10.2023.02.28.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:03:43 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        Albert Esteve <aesteve@redhat.com>,
        "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@google.com>,
        "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
        "Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: RE: [PATCH] Revert "venus: firmware: Correct non-pix start and end
 addresses"
In-Reply-To: <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
References: <20230207102254.1446461-1-javierm@redhat.com>
 <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
 <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
 <DM8PR02MB81696369DBFE619E43F81EEFF3DE9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <e87344c6-acef-7f3f-5cac-24961dbd9401@redhat.com>
 <6f97a117-0d9c-e21b-9adf-50f2233ba9e3@leemhuis.info>
 <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
 <CAFOAJEdBbzqkGVqw+vgNYNxyaTHwvjFyskTwjycP820L2tOctA@mail.gmail.com>
 <b548da46-bf91-6f1c-4b63-4002109056bc@leemhuis.info>
 <9a0bfef8-0b5d-f4d0-a8a5-4bbcacc5c0fb@leemhuis.info>
 <DM8PR02MB8169E16569616870A583B376F3AB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
Date:   Tue, 28 Feb 2023 17:03:43 +0100
Message-ID: <87edq9hj4w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Javier Martinez Canillas <javierm@redhat.com> writes:

> Vikash Garodia <vgarodia@qti.qualcomm.com> writes:
>
> Hello Vikash,
>
>> Hi All,
>>
>
> [...]
>
>>>
>>>No reply from Mauro and Linus chose to not apply the revert I pointed him to.
>>>That at this point leads to the question:
>>>
>>>Vikash, did you or somebody else make any progress to fix this properly?
>>
>> We tried with different settings for the registers and arrive at a conclusion that
>> the original configuration was proper. There is no need to explicitly configure
>> the secure non-pixel region when there is no support for the usecase. So, in summary,
>> we are good to have the revert.
>>
>
> Perfect. Thanks a lot for looking at this.
>
>> Stan, could you please help with the revert and a pull request having this revert
>> alongwith other pending changes ?
>>
>
> Other fix posted is "media: venus: dec: Fix capture formats enumeration order":
>
> https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/
>

Vikash,

Could you or someone else from QC please Review/Ack these two patches,
since it seems that Stanimir moved on and maybe is not working in this
driver anymore?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

