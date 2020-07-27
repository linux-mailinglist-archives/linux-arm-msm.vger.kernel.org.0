Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1677822F8EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 21:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgG0TU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 15:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgG0TUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 15:20:52 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343B4C0619D5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 12:20:52 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id z5so10445604pgb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t8hLkFIbtpdEX3UBYFfNbS3mhtXXCA/FYFZZm/zp7IQ=;
        b=AaPrVOqNWMgqMpxH88BEQJnuih5t7lG8Pv8holLzmGEU4PKPfhWaJFBe3+epjBa5TG
         Keaw7CEihV8ZtlT6zoxgh/RsdsdBJpqs4TK1Q0FOtw+Q+IDZMp3VNvwboWf9iZB/5Gh/
         RmXdaa/Uox3jj+vCZXTE35yj488G1nA9Bf82c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t8hLkFIbtpdEX3UBYFfNbS3mhtXXCA/FYFZZm/zp7IQ=;
        b=WHL1VaS0soIOgyMWSRDkCCoMWqGxeZIgKPBHzfJlmWZODelMQq6v953Shf3IycWHBL
         wBM5g3w6mWpT4J/e3NZnLFZMzVAfnQZMxcei0zQzV19lZmzrb/OxAySWH673MBYTp4Xf
         Ax47eID/ivLprmRSo7oyXKBfdKwPBzpfNzjZxClRLETIVsoXZNCzyXohS0eh+Jsgu8Of
         8pSLA+odfgy+2t6uava79WOuE3KiR4pTufL2VYSDUZbg5fyDJykgpTO41odps+rmPax9
         p051HMjxwgtw5JnAiNgYszw/rK5Xn5FDaF+a/DOkF6E3i12vlr2WzIPI5NYRC1bi6Wzt
         eXnw==
X-Gm-Message-State: AOAM532FHs8j/lCLRp6bv8v+0slbbdBZpXgPQ9bMXA2lUNXIkj+ovmLU
        r5GSq07IDlOhAIGMlwpn5MYAbw==
X-Google-Smtp-Source: ABdhPJx0j3o/dfARdxLCxZFu0QCg2nY4pjGflu6c0tuLw5tUQhIucFl39ZjiLASPZto5FWJNbE3ECA==
X-Received: by 2002:a63:6c0a:: with SMTP id h10mr21194250pgc.11.1595877651605;
        Mon, 27 Jul 2020 12:20:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id u24sm15605054pfm.211.2020.07.27.12.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:20:51 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:20:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v11 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200727192050.GD3191083@google.com>
References: <1595869597-26049-1-git-send-email-sanm@codeaurora.org>
 <1595869597-26049-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595869597-26049-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 10:36:36PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB to
> DDR. The other is from APPS to USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
