Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9799D17AD88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 18:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgCERuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 12:50:13 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40247 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgCERuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 12:50:13 -0500
Received: by mail-pl1-f196.google.com with SMTP id y1so2937428plp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rC5OtK13XnzKjVKRv/ahMfo1lY7wZkZ7yJrsj3kp0MA=;
        b=NylefYR1wLE1MebQawnzVM1OzyZKJff36rYhBnH7mzz9fCJ7h6T1d3sDEceneTttms
         Pzx0tWoiknsjxQlYdzKMQmqsS5C7jlBaBCOOP9JXJKR4yYmCgQAprYQy7XL4Llcv8xbw
         5qD42gQpxnJ6Y01n/OWA0TIzMzWQpd93JOp88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rC5OtK13XnzKjVKRv/ahMfo1lY7wZkZ7yJrsj3kp0MA=;
        b=b+OuqGqz3lTcwTDYfpul02x9NIZd+17XwjDCdkm1J3cNE7utHwnw2nrcV6+Q7yFF8r
         fcTBYfeTfxZ0d+aqH3juTKZHk8IyMw2AIGDD32eLZrIuuUf2Sghqaf/tz3jZ15HhPNPf
         fB0KP5OwfXsXznFONVTd+4scCB6dHziwiXzkPchFCAyZnypHXEwZNoV9qJJkYPj2ImhK
         F1i9wu2/LqOGjGqy4CpuKDqNLWd+lIzK4gYIfRIQcqs1PPa8jNvyKbEuAJzXZhndxU8G
         2HQUT5mdabYworas65rZkV1vyyGU5jJMY+Bkj72vfJMZB78rcHnGXX8THVwD5pK9OilM
         EiIA==
X-Gm-Message-State: ANhLgQ22XO794FR8z/E5yAC14jaDWlot7/nFAMMNLn7ieeU0wgHZoOqh
        a+NfMIVYqOmsRFB6S6C6Nn/S9Q==
X-Google-Smtp-Source: ADFU+vsmPBLgRU3w1Cl9Hu6agTsF4GwojuoHnJV+0HRo3jlsnoLAxcCl3AKFvsgw+z3bh5Am6N3g+w==
X-Received: by 2002:a17:90a:9409:: with SMTP id r9mr9847148pjo.39.1583430610997;
        Thu, 05 Mar 2020 09:50:10 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w76sm15012773pfc.154.2020.03.05.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 09:50:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org>
References: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v12 0/4] Invoke rpmh_flush for non OSI targets
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Thu, 05 Mar 2020 09:50:09 -0800
Message-ID: <158343060946.7173.9822192224809476773@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-03-05 09:06:59)
> Changes in v12:
> - Kconfig change to remove COMPILE_TEST was dropped in v11, reinclude it.

What is the difficulty in maintaining COMPILE_TEST support? If it's
purely making a stub function for OSI support then I'm lost why we can't
have another patch at the start of the series that makes the function
return false when PSCI is disabled.
