Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE1795AABFF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 12:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbiIBKCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 06:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235644AbiIBKCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 06:02:40 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B9C9A9AD
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 03:02:39 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso3016803wmh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=USfCu5JPEMwM2WiZpg8NQr50wGhXxJAKMik11VHM0fY=;
        b=ofDIoyhajScZQRnDZ1bOk8ZpgKjeJC2/OgvK4HTRa8zR7RroDnBdVv0MSPwtDOIewH
         hUVkznmqJKhHtVHm80SC+jnetKNx7B1TGdOxWQGyv1p47mNqK3L/Sm+i9iYM9F9LpnEf
         CSaUyQsDC+4yY6lht4bIhSaZgmPY6ctQ/ETYm+Qe4t60Ec/AbHDPSWlZfNoxBhoJRc+e
         gP/KEFaYySNNuSZX8YdfDOu14Z4EXmKj2olmTCyIGxfVuvDXDpDh1fxKPpQWzS1VFtrk
         hVfG2B3qQGqw9nrUlLUsRuUIAJXYLaKUELdH/M9QQlv7s0cEbzqrpmIw8J8QqCTrEhL0
         6mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=USfCu5JPEMwM2WiZpg8NQr50wGhXxJAKMik11VHM0fY=;
        b=Buh98S5VYSf9xa+Qj79BC1MKqATf4utGdxQdOYUILPhh0Dxj/dqcrnFFnvX2Ek3wqZ
         a7TMUQEpP0GAFkcvUDHCTizAlOK1KWBLgqJq9wwziDSmxMj09N7JpqgvthjD9VAyGOIa
         NIexuWQexrcis/U0qGf5pZ8SRCl16NeThoSi2savvsltWKsTyXE5MyRR4cS/IbGWJ5Kn
         prTlHWpBeW3N6atjakhRSypgwX7jtA6t1BzzfBQ+cGSdxYHM7wcUE0nPtdYgAMP8Kbji
         i+xyQdM0PaRbgN6oNYmsvpdbvKrZ9Tv9dg6Flc0BO2E7pR/ft50FrrymumYcsqcMfe+5
         LDkA==
X-Gm-Message-State: ACgBeo0aNkS+rlL6mH/b6PIkj3fseR3VR/aWVTyu8nh0F+fS4iBZgdZ1
        /R7bMYxDb0RvX/Rxup1lSSApnQ==
X-Google-Smtp-Source: AA6agR78JvC00EEYNNjhhpK8YhZCsbqP0JBX0fEtIx8j+ylI/5XaoI/3+088aOmTZF3lc7Yg+dDFVA==
X-Received: by 2002:a05:600c:358e:b0:3a5:f19d:28db with SMTP id p14-20020a05600c358e00b003a5f19d28dbmr2360350wmq.76.1662112957744;
        Fri, 02 Sep 2022 03:02:37 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id 24-20020a05600c22d800b003a6125562e1sm1618072wmg.46.2022.09.02.03.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 03:02:37 -0700 (PDT)
Message-ID: <01bdf6e2-f72a-e114-f3d2-deccf55403b1@linaro.org>
Date:   Fri, 2 Sep 2022 11:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] misc: fastrpc: fix memory corruption
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220829080531.29681-1-johan+linaro@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220829080531.29681-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Johan,

On 29/08/2022 09:05, Johan Hovold wrote:
> The fastrpc driver uses a fixed-sized array to store its sessions but
> missing and broken sanity checks could lead to memory beyond the array
> being corrupted.
> 
> This specifically happens on SC8280XP platforms that use 14 sessions for
> the compute DSP.
> 
Thanks for doing this.

I see that we hit this issue once again, and the way we are fixing it is 
not really scalable. We should really get rid of FASTRPC_MAX_SESSIONS.

We should allocate the sessions dynamically based in the child node 
count and qcom,nsessions.



thanks,
Srini

> These are all needed for 6.0.
> 
> Johan
> 
> 
> Johan Hovold (3):
>    misc: fastrpc: fix memory corruption on probe
>    misc: fastrpc: fix memory corruption on open
>    misc: fastrpc: increase maximum session count
> 
>   drivers/misc/fastrpc.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
