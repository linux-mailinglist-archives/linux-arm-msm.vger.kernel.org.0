Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27E123FC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 20:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfETSAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 14:00:23 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35450 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfETSAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 14:00:22 -0400
Received: by mail-io1-f65.google.com with SMTP id p2so11781222iol.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BJqbM9dQi2sqRGEpi6wyz+rXnQolu1I+N0gg6WNhl7o=;
        b=dAD3+9VLDk0sn9pVjO2MaAXRmjsUoAShvtNS7ntM7G/LWtzgWzJVhA5VOgNwNG2Nhq
         AsN2XW01kQtruxRTT6HdgdezRWtKPxgYOuQg0mQp9sBmNeGUUxfaDLERaXTqWz+Cm55x
         35nFfo6usS3ws+QKF+kjhDxyDQB4f31m5vhPj7aQ3pqn0qSWXT8/weULF+8WYoAswlDK
         yc3w2lPetkyUTT6V7dhUQJWgg8/InVS29drJfkIZd/7ScsP/s0UVzEH5ELEETuNTakdH
         KKm1ifZly4qDlmYpRvXEGJxsZOb0HoN2Eqqe4Gl1w8uPRojMHmiN/USH+HLRgNfEzG6E
         iPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BJqbM9dQi2sqRGEpi6wyz+rXnQolu1I+N0gg6WNhl7o=;
        b=QZCpuxWYtOIfzee62HADXW7SqGu//rCSNpvCU8ZhAg0FO7q43Zd/QT45WEphOKoCW2
         oUzMQxHEALY3pgrzdYVKvLThZfCZNstuzGV5WoY+KQ9tCtNsMKhhIVAS+YHKy6TU1k5v
         xoXMynBNRGkbEH4+uOqfyMy8XrJdGKs8wEQg5sNTI0E9WjxuwdjnNu4AJbGcFmEvgPxk
         YrT2ooPVjFwKWCCG6HEdoscdwfK6GW7lEYdsNhr33cWzEtB29a14v0W1ubx/d+tTkMzJ
         LgrG/eP7wBHHlqX75BomJ4+Z3JjRuSftFD5bCNLwc3k2ZvGWElYbLIlu12sgqLF8AxCP
         EQ1A==
X-Gm-Message-State: APjAAAUPW96FXmmQ7BgGT7p+zbSgDdGjs46xqIYwFS0nQXSjYWp+6wrc
        qSIL1or4+/JqQxNUN7CQHmHOdg==
X-Google-Smtp-Source: APXvYqxv80ApBPxqXJbSbRPtqnglRzwSJUkWb3i2BuzzOLG+7reCwHLixDN526o3wcXtQBdGkChSRg==
X-Received: by 2002:a5d:914e:: with SMTP id y14mr41508808ioq.77.1558375222065;
        Mon, 20 May 2019 11:00:22 -0700 (PDT)
Received: from [172.22.22.26] (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.googlemail.com with ESMTPSA id i203sm5736544ioa.15.2019.05.20.11.00.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:00:21 -0700 (PDT)
Subject: Re: [PATCH 0/8] net: introduce "include/linux/if_rmnet.h"
From:   Alex Elder <elder@linaro.org>
To:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net
Cc:     bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org,
        cpratapa@codeaurora.org, syadagir@codeaurora.org,
        evgreen@chromium.org, benchan@google.com, ejcaruso@google.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190520135354.18628-1-elder@linaro.org>
Message-ID: <95af58ff-0005-86ca-989f-3b61a2cc21ba@linaro.org>
Date:   Mon, 20 May 2019 13:00:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520135354.18628-1-elder@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/19 8:53 AM, Alex Elder wrote:
> The main objective of this series was originally to define a single
> public header file containing a few structure definitions that are
> currently defined privately for the Qualcomm "rmnet" driver.  In
> review, Arnd Bergmann said that before making them public, the
> structures should avoid using C bit-fields in their definitions.

. . .

Bjorn, thank you very much for your quick reviews.	-Alex
