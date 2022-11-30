Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629DB63DC73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 18:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbiK3RwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 12:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiK3RwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 12:52:01 -0500
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C24C13C;
        Wed, 30 Nov 2022 09:52:01 -0800 (PST)
Received: by mail-pl1-f170.google.com with SMTP id b21so17424431plc.9;
        Wed, 30 Nov 2022 09:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dj1fKxXwjNLbx1zMD5MbGX8OXxgQe6xoguWpP/BS3c=;
        b=2q68GN2Mf+tCmDzX9XkwxGSNvscx1Z6GQ6C/C2pCgyHnk+Qv7Qjo8CLoyvJhS484tN
         RnQbwrDDlU82mL9w+6+/J7uLJ52tYjS85896W9nL7EyweeKQ/oUnrWj/ri0a7h2twXI8
         v2ldLpD6BMuCNCqcuowHpaXPsSS52AW26Cprddxons5w09k6WL1eQqV0Wg6xR92cAMLH
         YnFWQ9hpvPpAiZ5dooDee5KLRE40dDcAJTaZLESH5QaS7kjND3cG6or4HbgxComk8z6x
         8gVywGMu1zaNKbzR2JUVZsuJuVmwhUsec3xERWc66FALh6zAVc/rqR9K8KrLLDM59sVQ
         dyug==
X-Gm-Message-State: ANoB5pliGDAkxRiYcxrR5q7/MV7oQAv48ULnjaT5HIONGVgnR1cUBEw1
        3Q24uWU80yaKU8by1WqGCik=
X-Google-Smtp-Source: AA0mqf7f6GHmGqOSAPW/D9hOB8LHy8aUIXZ6lmlCIH9TuOeSyhXLxDeqP1i503HHZxs+oCtP5tddLQ==
X-Received: by 2002:a17:902:7204:b0:188:e773:1347 with SMTP id ba4-20020a170902720400b00188e7731347mr42432903plb.111.1669830720516;
        Wed, 30 Nov 2022 09:52:00 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:3729:bd90:53d2:99e3? ([2620:15c:211:201:3729:bd90:53d2:99e3])
        by smtp.gmail.com with ESMTPSA id 2-20020a621502000000b00574afdc0391sm1713093pfv.174.2022.11.30.09.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 09:51:59 -0800 (PST)
Message-ID: <12c5b226-43e9-9429-235b-e919f460c87b@acm.org>
Date:   Wed, 30 Nov 2022 09:51:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v7 00/16] Add Multi Circular Queue Support
Content-Language: en-US
To:     Asutosh Das <quic_asutoshd@quicinc.com>, quic_cang@quicinc.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com,
        stanley.chu@mediatek.com, eddie.huang@mediatek.com,
        daejun7.park@samsung.com, avri.altman@wdc.com, mani@kernel.org,
        beanhuo@micron.com, linux-arm-msm@vger.kernel.org
References: <cover.1669747235.git.quic_asutoshd@quicinc.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <cover.1669747235.git.quic_asutoshd@quicinc.com>
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

On 11/29/22 10:53, Asutosh Das wrote:
> This patch series is an implementation of UFS Multi-Circular Queue.
> Please consider this series for next merge window.

This patch series has been tested by two different companies (Qualcomm 
and MediaTek). I hope that will help this patch series to get merged in 
the upstream kernel :-)

Bart.

