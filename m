Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1B5619B794
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 23:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732780AbgDAV3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 17:29:07 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54]:50452 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732527AbgDAV3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 17:29:06 -0400
Received: by mail-pj1-f54.google.com with SMTP id v13so649575pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 14:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cTFpqA5tG+WWT9sTreQ1YOunwJV7A8zTcn5uhSzjIZ8=;
        b=m/yww7rDfQ3kktZhAjrnmc6g3M4Vsz4wORWt61gOe6FYkfHbNCzUioxpSDF3MPmBdV
         Wz+TOWpWbgLz2bg1u9mPRpg/hmCCA6zHm4OXJnKbK+jRgPKHnQZcf9KXcaH2m7MmbV/r
         RdUAXoiZP27scBBR04rsv7Id1hAiTQjJ2EeYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cTFpqA5tG+WWT9sTreQ1YOunwJV7A8zTcn5uhSzjIZ8=;
        b=aVVva1AWhmkWKoJiyyU3B8itp2h9s1anB4q+7A9nZ61cO4FN/QqyMUgNuuDCniO/Yb
         Rtme1GSsZWCOjzIatkp3uTr+pEWwbww0ldqAKhcKCaYjbn+lMtfcGdZRmOZ1VFljGgkO
         1p2WP3OODPIbFqMGxl06dKNDlKT4DsU+f8j2/00Qv3jbhPHbEmQMI76DPZPawnxNom0f
         oVR3o+yAHUuGWrxsfzNu2Nr68qSvZkQyD8KO6p01RbrSMePl4a88nPpG4OLct9BSDQwo
         moafhOyDKbq15KYfV1cwhSXDUOgT5HsWRMvGkry3TmsM4relDg8pfASTAz47nHvIzXhQ
         yuJg==
X-Gm-Message-State: AGi0PualiLBbMKW5d86TyCrNWxL1MoyOC6Up9HI0LCfvFsap3uf1M+s/
        mOOEVha5aBMoEbrhsM41afWWgw==
X-Google-Smtp-Source: APiQypLQF/i0d5RT+vCgKNX8CwUXkL5ru4KsrEREbSGlX8uxuXDitKjdh2D609gtDGT9DRBZaS55xw==
X-Received: by 2002:a17:90b:4910:: with SMTP id kr16mr5297pjb.142.1585776543567;
        Wed, 01 Apr 2020 14:29:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id d3sm2337317pjz.2.2020.04.01.14.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 14:29:03 -0700 (PDT)
Date:   Wed, 1 Apr 2020 14:29:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1 3/3] arm64: dts: sc7180: define interconnects for sc7180
 target
Message-ID: <20200401212901.GN199755@google.com>
References: <1585732665-29492-1-git-send-email-mkrishn@codeaurora.org>
 <1585732665-29492-2-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1585732665-29492-2-git-send-email-mkrishn@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 01, 2020 at 02:47:45PM +0530, Krishna Manikandan wrote:

> Subject: arm64: dts: sc7180: define interconnects for sc7180 target

Please be more specific about which interconnect entries are added.
Also no need to repeat 'sc7180', it is already clear from the prefix.
