Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0B8A6051B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 23:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiJSVG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 17:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiJSVG6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 17:06:58 -0400
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AED51C711A;
        Wed, 19 Oct 2022 14:06:57 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id p6-20020a17090a748600b002103d1ef63aso1141630pjk.1;
        Wed, 19 Oct 2022 14:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POgrPH0QW5EEasJFZKLziKAu/5jnGnv4BrNRsIchY2I=;
        b=F8KtfyDuRMho0PbdxhtilIfNb/s2aBFNMtCA8GXT+rGB1z6HM7WCmNJkhUb66HyCzw
         jdCuODgbJr/g+3+HvaDS7RaNcxCnt9IuS65Zcoqx5DnbESG7gYnncVFLtUdvu7aF/vD8
         CyfAFh4/1+uwumwJq8xq2HyyRu+V6FIFXKFb9XkIwq9q9Lk/1Y1fkE15AH4DliEezKYx
         AsWq8DWdWy6l6OeJGsQ+9/urg5GQr6QR+aZ8eJPvmqLAoJ4lI3MgAZTCC8vEGPB2rW51
         zhNTYfEf7M/t2jST71kAMMZDkQ5sEmjOBW2Hv/jUs50CnBF7ftmHwVHUYBS0QWuqoH3A
         OFAg==
X-Gm-Message-State: ACrzQf0MIKbfx5k0p3FajZrZKrhV3UF3u63RP2AS2g/b5/CScCQxwJef
        2lFzuAJ+Ds9Oig0CXYgeq7k=
X-Google-Smtp-Source: AMsMyM604XRQj4PIwV/ML4HC8OEyrRFfYk62IgnXmSwvU6YnHiHnWbQa5W1yUOE6blx9+US6ps7fmQ==
X-Received: by 2002:a17:902:bd46:b0:17e:8ee5:7b61 with SMTP id b6-20020a170902bd4600b0017e8ee57b61mr10693371plx.44.1666213616761;
        Wed, 19 Oct 2022 14:06:56 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:8280:2606:af57:d34? ([2620:15c:211:201:8280:2606:af57:d34])
        by smtp.gmail.com with ESMTPSA id c123-20020a624e81000000b005624e2e0508sm11729693pfb.207.2022.10.19.14.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 14:06:55 -0700 (PDT)
Message-ID: <b11cb7b4-2f4a-c6a2-82a5-c4372ff23610@acm.org>
Date:   Wed, 19 Oct 2022 14:06:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Fwd: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
Content-Language: en-US
To:     Asutosh Das <quic_asutoshd@quicinc.com>,
        Eddie Huang <eddie.huang@mediatek.com>
Cc:     Can Guo <quic_cang@quicinc.com>, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_richardp@quicinc.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_xiaosenh@quicinc.com, avri.altman@wdc.com, mani@kernel.org,
        beanhuo@micron.com, stanley.chu@mediatek.com,
        liang-yen.wang@mediatek.com
References: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
 <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
 <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
 <20221018014754.GE10252@asutoshd-linux1.qualcomm.com>
 <12ab65aed221dec23451e9b60c0e00a4d9ef0df2.camel@mediatek.com>
 <20221019195040.GA18511@asutoshd-linux1.qualcomm.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221019195040.GA18511@asutoshd-linux1.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/19/22 12:50, Asutosh Das wrote:
> While adding the vops it occurred to me that it'd remain empty because 
> ufs-qcom
> doesn't need it. And I'm not sure how MTK register space is laid out.
> So please can you help add a vops in the next version?
> I can address the other comment and push the series.

Please do not introduce new vops without adding at least one 
implementation of the vop in the same patch series. How about letting 
MediaTek add more vops as necessary in a separate patch series and 
focusing in this patch series on UFSHCI 4.0 compliance?

Thanks,

Bart.

