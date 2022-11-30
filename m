Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B471663E28B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 22:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiK3VOU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 16:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiK3VOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 16:14:20 -0500
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B270585676;
        Wed, 30 Nov 2022 13:14:17 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id q12so13925988pfn.10;
        Wed, 30 Nov 2022 13:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RERUzz6/YZPtxpRCxabjr50cpPcCSEqbCmnFPgBMN70=;
        b=dTViLEwziEtSAFp0bGI/mlM+qnUnrP3YUrmY6TrE919cfo47ZXy6c4sB0goOKbQeT/
         1AcP+2kmVflCrSET/zBeTLrCdI2e0fQcnuAr4le/ZzJwm8CQ5wfokV1HecD/eZtlmL7T
         gif1vtuEHf3L0S6YEOD+DCO7dhI9XjH53038yCm0mVna/6XUSxHm/+yVN8Z7oivEEQoy
         J0SYEOh6nxPyylwLgfuuey+SHoZTkAgejEmQcuZbQhbNeb/6F1/VD6mg6vfiX6j90xi7
         jbjaZytlKe0f0E9X+fDlkTpVuJpib8xPG3ajY+R48DS3LqCbDsmaQTBZRMxQ0Wt8t4Qy
         6fYQ==
X-Gm-Message-State: ANoB5pnwZs22v/3SnVvKQpeTnfDn1Dys/JV/1CDDiIiopFU+i9qsJKOH
        o5BYQTu58b88q/+FTXyo6O01xqyXlvk=
X-Google-Smtp-Source: AA0mqf7ZM0l+qCglya0TE6wEwNNAt5QZ1A0aBeT8dyEd77Kr2siWM3ebI33jQpelYQXndV5lxDYKkg==
X-Received: by 2002:a65:53ca:0:b0:46f:ed3a:f38b with SMTP id z10-20020a6553ca000000b0046fed3af38bmr42693489pgr.387.1669842857047;
        Wed, 30 Nov 2022 13:14:17 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:3729:bd90:53d2:99e3? ([2620:15c:211:201:3729:bd90:53d2:99e3])
        by smtp.gmail.com with ESMTPSA id pw9-20020a17090b278900b00210c84b8ae5sm1662694pjb.35.2022.11.30.13.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 13:14:16 -0800 (PST)
Message-ID: <7b71f90d-05d2-0b42-3a4a-6414e0cb88a3@acm.org>
Date:   Wed, 30 Nov 2022 13:14:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v8 00/16] Add Multi Circular Queue Support
Content-Language: en-US
To:     Asutosh Das <quic_asutoshd@quicinc.com>, quic_cang@quicinc.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com,
        stanley.chu@mediatek.com, eddie.huang@mediatek.com,
        daejun7.park@samsung.com, avri.altman@wdc.com, mani@kernel.org,
        beanhuo@micron.com, linux-arm-msm@vger.kernel.org
References: <cover.1669839847.git.quic_asutoshd@quicinc.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <cover.1669839847.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/30/22 12:27, Asutosh Das wrote:
> This patch series is an implementation of UFS Multi-Circular Queue.
> Please consider this series for next merge window.

Hi Asutosh,

It seems like my Reviewed-by tag is missing from several patches?

> Please take a look and let us know your thoughts.
> 
> v6 -> v7:
> - Added missing Reviewed-by tags.

Are the v7 -> v8 changes perhaps missing?

Thanks,

Bart.

