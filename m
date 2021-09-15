Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB50240CBBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 19:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhIORcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 13:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhIORcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 13:32:19 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01B6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 10:31:00 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so4547373otk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9JtSIbr8G39fqSliHS6q346bx9+Drp/ZRZGEdlrX5yg=;
        b=GbNX139aCTTV7q/EVehaF7UU7QdI7WLXuN4pwhOFr6BUX8YuWAFZmdb7mcPEeFUnaU
         P6A3IXzU5K5pT5J1AyqBdAjrlN0s+tShQnSFZ+ZE64LIkWsLLXNJVJvLrGn9f27J2skV
         p9qqYc29xpg+z/DpUWijMY0QdBg7uxbzxqfx//9H9/AVzpT3hnGNDggXiJAZIT7lnH4o
         eRy6RRCa8z7AoPprlt4SCsnqf7o/wLTMemxSBuqK2WlFLA5wIp+ANbXIK01I8cCCFNh5
         sTo8OFnjkGoBISFefTotdwfdPAGYuPM7unydr7gaX4bdr0gKYHRe5IDtGxjH/97QO0iE
         yvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9JtSIbr8G39fqSliHS6q346bx9+Drp/ZRZGEdlrX5yg=;
        b=Fc8i8nYOPpdnKEl9tK2vCA+Ko7fr0T1yWiOzSVIUr336xYhJtisNJ2I8SBCiIw7QoX
         VQQvOiq8swuHm3vLdnRgtc5NkH+qIowKT5OLnLa+xX94Ic8nC8k74YpB4/dp7ROWLmYZ
         rFDeA0DLBuqkhKVtgJ0HE/TN0WBbhebQt0yMW2KHO6ypSkP9q6nO4bgv3bXEiylJji9T
         XmOJAi9k+gQ0/Pe/HpW4KnnIpbuKYOeEy9RbdFFqLTk7+K+2c2R9GarIVwho+vUKik0z
         0/DN6wbw5ivsZiBy+AMP5akf90b78pg8uLvwT1rumvmUziRUGa3YvWkLvXWXgOrDngwu
         f68g==
X-Gm-Message-State: AOAM530rUGLvPZ4Bg0nIlceiBIsIkezrOya5DkVf9tRfYrrqx/2J5Syg
        /rwugl4v8M8O8bTO7Ltv/TNYrw==
X-Google-Smtp-Source: ABdhPJyybl96d96E1YJHLGsl7h94gTxKp+WUCDfKCD5T8bcBTBJO7CuSZZCOdA+L/uTq5xudWSVTVw==
X-Received: by 2002:a9d:6c19:: with SMTP id f25mr1044713otq.192.1631727060195;
        Wed, 15 Sep 2021 10:31:00 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id u194sm167808oie.37.2021.09.15.10.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 10:30:59 -0700 (PDT)
Subject: Re: [PATCH v2 net] net: qrtr: make checks in qrtr_endpoint_post()
 stricter
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     bjorn.andersson@linaro.org, butterflyhuangxx@gmail.com,
        davem@davemloft.net, kuba@kernel.org,
        linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        mani@kernel.org, netdev@vger.kernel.org
References: <S4IVYQ.R543O8OZ1IFR3@protonmail.com>
 <20210906065320.GC1935@kadam>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <95ee6b7d-a51d-71bb-1245-501740357839@kali.org>
Date:   Wed, 15 Sep 2021 12:30:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210906065320.GC1935@kadam>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/6/21 1:53 AM, Dan Carpenter wrote:
> On Fri, Sep 03, 2021 at 07:29:28PM +0000, Yassine Oudjana wrote:
>>  > if (cb->dst_port != QRTR_PORT_CTRL && cb->type != QRTR_TYPE_DATA &&
>>  > @@ -506,8 +506,12 @@ int qrtr_endpoint_post(struct qrtr_endpoint 
>> *ep, const void *data, size_t len)
>>  >
>>  > if (cb->type == QRTR_TYPE_NEW_SERVER) {
>>  > /* Remote node endpoint can bridge other distant nodes */
>>  > - const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
>>  > + const struct qrtr_ctrl_pkt *pkt;
>>  >
>>  > + if (size < sizeof(*pkt))
>>  > + goto err;
>>  > +
>>  > + pkt = data + hdrlen;
>>  > qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
>>  > }
>>  >
>>  > --
>>  > 2.20.1
>>  >
>>
>> This is crashing MSM8996. I get these messages (dmesg | grep 
>> remoteproc):
> Yes.  I apologize for that.  The fix has been merged already.
>
> regards,
> dan carpenter
Where has the fix been merged to?  5.14.4 released with this patch in
it, and wifi is now crashing on the Lenovo Yoga C630 with the same
messages that Yassine was seeing.
