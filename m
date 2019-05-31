Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC137317E9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 01:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfEaX1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 19:27:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47088 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfEaX1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 19:27:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id y11so7052304pfm.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 16:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1mBjmLwOKlNkyYhM6oxRhsf42lMAXU/xAGOi1IdZboQ=;
        b=ZNOteqQLyqgc+QbRl7AXNIxJGN4xjDTgG6lWt6T6hJIAi2uw3z3Flh39L0EupY/Gdy
         aRQu8htEcM2guXKL3DiQ4okSSGGyunEAl9Vs6GRc1UEOfPAiDmQ8zPwoUqSNG0OYQVV6
         EIib45uFU25OiqwIdyyh8xrqPokchZdfmTrwCmyplfHfbLDWbuuuOwUb+ovvtbfvhNA1
         zjW6vzLAyANZQjQVAtJnOlbpyMIjpq149dUyltnV5NgU5IpF1Yk5dIVTcoGsrgrl27Ql
         8PicUE4+rTtZi9T5oo0W1VHdKG2BtaIZImEFJFnrAmzM0oJR7kaWUvZ22S1Cz16LJR/k
         aIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1mBjmLwOKlNkyYhM6oxRhsf42lMAXU/xAGOi1IdZboQ=;
        b=U5VQIwoFy9Qi3JNtxCsl5QfDFzg07iNmu/1KfnpVUZhXF0mGUMiZKOyKJYHK/gyLgY
         B8/k3D/DWXrQAWdRm17I2enQ7b2pmHU8YC82G6WwTdhoefm21doh/oI+d3Dv5m9CE2nM
         DqK6VsgAwkB9aCviY6PN8ZU49OHRamOWxu5mtViqEiisfRiN0QGI/HfPGNJ4HFREdUgf
         cPAZ+MBInzE3C+PTchPiFUIvio9hW341/KA0oMl0L6yKhhit+ys+C7VwJtvFevzvtoAK
         qcBjonDuNZTPQgtB6DJG7sPhUI3UN4jD8IicxjWt1LrJ2DjBxqDEuYS1LLNC3kZRnZYD
         wIZA==
X-Gm-Message-State: APjAAAXQGB7MOxL17CD32VKx12ks1yc2zU/H2eJKelxhVTBqKzx9PAw2
        1//reRrzsACwARKk3htG3A3cbQ==
X-Google-Smtp-Source: APXvYqw/ryB+xTJ5eNyo0R0Rz5FbaRSXOb+hJAMPW6Ub79YQuTrjFf0b/mvOzSK2WWNJ4P0EduX3Cg==
X-Received: by 2002:a17:90a:7147:: with SMTP id g7mr12603555pjs.42.1559345269878;
        Fri, 31 May 2019 16:27:49 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u1sm7196808pfh.85.2019.05.31.16.27.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 16:27:49 -0700 (PDT)
Date:   Fri, 31 May 2019 16:27:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Alex Elder <elder@linaro.org>, Dan Williams <dcbw@redhat.com>,
        David Miller <davem@davemloft.net>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        evgreen@chromium.org, Ben Chan <benchan@google.com>,
        Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org,
        syadagir@codeaurora.org,
        Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-soc@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Message-ID: <20190531232746.GA25597@minitux>
References: <20190531035348.7194-1-elder@linaro.org>
 <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org>
 <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 31 May 12:19 PDT 2019, Arnd Bergmann wrote:

> On Fri, May 31, 2019 at 6:36 PM Alex Elder <elder@linaro.org> wrote:
> > On 5/31/19 9:58 AM, Dan Williams wrote:
> > > On Thu, 2019-05-30 at 22:53 -0500, Alex Elder wrote:
[..]
> > So basically, the purpose of the rmnet driver is to handle QMAP
> > protocol connections, and right now that's what the modem provides.
> 
> Do you have any idea why this particular design was picked?
> 

From what I've seen of QMAP it seems like a reasonable design choice to
have a software component (rmnet) dealing with this, separate from the
transport. And I think IPA is the 4th or 5th mechanism for transporting
QMAP packets back and forth to the modem.


Downstream rmnet is copyright 2007-, and I know of interest in bringing
at least one of the other transports upstream.

Regards,
Bjorn
