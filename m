Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F9E7C5ECC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 22:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbjJKU5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 16:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbjJKUs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 16:48:57 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647B990;
        Wed, 11 Oct 2023 13:48:55 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6c620883559so189743a34.0;
        Wed, 11 Oct 2023 13:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697057334; x=1697662134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y4cmx3/aHWREmhHF+L5tWXCygCxOF4swdYgcFcqvrY=;
        b=G/pYGmaZdcCb1+0oXfi9Fewefn9o8SnP2dLLADuu5BvYLsxrE1H9AcB/vhBFDLwC58
         p7qF5GywqyuSzQ3qjb0vnIcV5Dbsm/IX1ARKMHZ243UX4JWpJNvlO2p6Zjd4zYvkvGDM
         c78SO73/uZJTPfrXIVbFH0tu41NJG6FilwOHcT8d6rB3vPm46eamJ4xE7WYAGS4PUei0
         0TvNlx+K5qlcSYXE+FMB/hRHmGIVy4nh9qoDWkxC9i+J1rNNNaz8TzybUYwrs/Q8Vrhl
         qI3dBcQDWNz2m7PR9ft46CdtwxSl4Bo7CN6S14BgGYLITzQvLsb3AiWuxRkA3i0rdBv/
         xEjg==
X-Gm-Message-State: AOJu0Yw+1Z8t030pazWwr7rwQWyPkET226X/h9OHneHGaPeXPSVMun8+
        5h5bhDPweIlCWS9YdYXAYSuQPkbitT4=
X-Google-Smtp-Source: AGHT+IERAm2KZlHY153hhcRFVgVcKRI+HRhs/UrjWaXVHhBjGU69cEW8Cv/1+0G6ujOmngLRTWgk0Q==
X-Received: by 2002:a05:6a20:938b:b0:15a:2c0b:6c73 with SMTP id x11-20020a056a20938b00b0015a2c0b6c73mr28038419pzh.12.1697057310933;
        Wed, 11 Oct 2023 13:48:30 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:19de:6b54:16fe:c022? ([2620:15c:211:201:19de:6b54:16fe:c022])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001c9c47d6cb9sm284651plg.99.2023.10.11.13.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 13:48:28 -0700 (PDT)
Message-ID: <c6366717-2eca-465c-833d-c7d501b9171a@acm.org>
Date:   Wed, 11 Oct 2023 13:48:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Does the branch 6.1 6.2 6.3 and 6.4 still accept bug fix now
Content-Language: en-US
To:     Ziqi Chen <quic_ziqichen@quicinc.com>,
        Avri Altman <avri.altman@wdc.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <fc4189f4-8907-8a08-d7be-ffcb2425940a@quicinc.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <fc4189f4-8907-8a08-d7be-ffcb2425940a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/11/23 03:17, Ziqi Chen wrote:
> So can we know if the branch 6.1 6.2 6.3 and 6.4 accept bug fix now?

Please take a look at the documentation of the stable trees:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst

Thanks,

Bart.
