Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 364D124631
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 05:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfEUDGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 23:06:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46675 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbfEUDGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 23:06:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id r18so7657626pls.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 20:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=L6rmQq+gPSXmZQ1NvJ0gt7vzdglgYRZhWO69QkEpq4s=;
        b=W6bBtDCkqYW+zUT8OZDmpyZxkn80Lc5l/c/oKtPUNJ/Kf6PgRimqdFjIQbncOk7fh5
         uYnAKbkqSZ7tVUNbuLEqncLfTRPi5Is43mR2JEYtRcG1t1SZAzePFKWgH6xnawODxmK0
         QroNahzP9a6jAF1W4Pth5Tgj0PIxaMcpp8hYfBklE3RaX+aCIIOzTzaucF7eM3GwBNUo
         hT+Y/7FmqMZN7gat7B6SKwWAJnZDkuUcICEJqPGe/fpH4xzE7pdWFqyxmIHoTCsYU5dP
         UNYBefeKrmr0bR+UA0lNvzOU1WLfngLD8+kBThTdGUeCMUGJ4Iubv69I497uOuZFGmYJ
         lrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=L6rmQq+gPSXmZQ1NvJ0gt7vzdglgYRZhWO69QkEpq4s=;
        b=eqByMaF9cLBZQYzPZlz8A1+XGZvHikmmrAV3K+P57ssG6Lwbx0MlDODpy2EdxsyaA0
         X8zJe0jjh+0DOEXBdarCJ0cj/wALYL9orAnKM0LTKhOIEj9f89L9gK/Kd0LwrD3Q0SXj
         zg6Wh/r3DaClZknPmd/EfceEu5aZ1o5ZNMAzO0obynVRoQ6Q5ZLzUDMJL6qir1xYzovf
         GUF8Yd45eC8ENaOSoa8JpJn76+KJ5hji4ZBshfNPLmvTKgHFZ2pC1FQoegItj+0FKKVS
         743zew+uJ/xK/IUOhHFxAnv+81m4FJwtjuFmbrDgrLgCrdbvuhoYpYfEdDrYpu3wB1/6
         4pGQ==
X-Gm-Message-State: APjAAAWhboUIOyiG2bjWQ6YI56koLXCPBpvq5LZ6vA6RvRVjGOjZm25v
        6OJPv+c31g4H3BvBlHInEXePgw==
X-Google-Smtp-Source: APXvYqzw9GX4e6zEdn2jIoJXmVbu/zG5ngWRViST01bGmBuzxZn00fba7Cq1NDzVTnzZ4PDpCaTlUw==
X-Received: by 2002:a17:902:b191:: with SMTP id s17mr57530171plr.262.1558408007225;
        Mon, 20 May 2019 20:06:47 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n1sm18491693pgv.15.2019.05.20.20.06.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 20:06:46 -0700 (PDT)
Date:   Mon, 20 May 2019 20:07:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        arnd@arndb.de, david.brown@linaro.org, agross@kernel.org,
        davem@davemloft.net, ilias.apalodimas@linaro.org,
        cpratapa@codeaurora.org, syadagir@codeaurora.org,
        evgreen@chromium.org, benchan@google.com, ejcaruso@google.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] net: qualcomm: rmnet: fix struct rmnet_map_header
Message-ID: <20190521030712.GY2085@tuxbook-pro>
References: <20190520135354.18628-1-elder@linaro.org>
 <20190520135354.18628-2-elder@linaro.org>
 <b0edef36555877350cfbab2248f8baac@codeaurora.org>
 <81fd1e01-b8e3-f86a-fcc9-2bcbc51bd679@linaro.org>
 <d90f8ccdc1f76f9166f269eb71a14f7f@codeaurora.org>
 <cd839826-639d-2419-0941-333055e26e37@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd839826-639d-2419-0941-333055e26e37@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 May 19:30 PDT 2019, Alex Elder wrote:

> On 5/20/19 8:32 PM, Subash Abhinov Kasiviswanathan wrote:
> >>
> >> If you are telling me that the command/data flag resides at bit
> >> 7 of the first byte, I will update the field masks in a later
> >> patch in this series to reflect that.
> >>
> > 
> > Higher order bit is Command / Data.
> 
> So what this means is that to get the command/data bit we use:
> 
> 	first_byte & 0x80
> 
> If that is correct I will remove this patch from the series and
> will update the subsequent patches so bit 7 is the command bit,
> bit 6 is reserved, and bits 0-5 are the pad length.
> 
> I will post a v2 of the series with these changes, and will
> incorporate Bjorn's "Reviewed-by".
> 

But didn't you say that your testing show that the current bit order is
wrong?

I still like the cleanup, if nothing else just to clarify and clearly
document the actual content of this header.

Regards,
Bjorn
