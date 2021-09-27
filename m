Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B3041987C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 18:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbhI0QIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 12:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbhI0QIm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 12:08:42 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA078C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 09:07:04 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id b78so18147273iof.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UyGvdpL0yI/ULspuTPee70a1f1XcbYQ8D7yj9dqZP+U=;
        b=ayizTBwZpPQvHFDReipVPZ70ewR4viJDyiBMwnqT/PUx4YvjYq6byIH/90VPbv9Tev
         LdWGmYqF1ZXJzbK2PExHlScWSg/wGbYVbUsqjWEvV8v+B08jIlOFBzeZ16O+/KU0553c
         sFK+IM6WxlqNp7Tk0PI44o9gTqmyYZV1AO8Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UyGvdpL0yI/ULspuTPee70a1f1XcbYQ8D7yj9dqZP+U=;
        b=3yNv0VxYFz1GhGmMX4awfJVpHpWVwShqukoRNDkoMBPcaOGyMrinq0fvTV579vMJO/
         YQSv31Vkp3Dx+4NDXcK19CsxyEcoL2/0S7p5Geo6ctBJqDGh2vcmm9U9PR6StFYCHxe5
         uivsHdpxX4XW+gwtHNZO8Uuw6IGlc7vukjd0HbwEKDv/lZTiH4oQQkXe3spkOmn9QuCf
         CrWOourTPijrM/EqL/K3aXWqREM2iLQowCyjVitrokw/b4Np1EIyQ8WU9qNUKluoJOWr
         r6VhoQNpGMqrwfDPuqoUk1dZZ8UPUGJ+J6eOKudA9Q16hS0BKSzWXdYm3DrlxZYDCS5+
         pqYA==
X-Gm-Message-State: AOAM533+Mjkhhy/DZfYPOtTrTJ18Fwl8f08OnBrMN+zz68S6dBl7UXRz
        EoyguXXrlbRIULOMMzcDHrliPw==
X-Google-Smtp-Source: ABdhPJz3RxQB2d5HkgswYyLpu0bvTOTnMv+arPBIBIQLIFzeQdaL97l1wnArkVlnJ4jzEb6eIBhxbw==
X-Received: by 2002:a6b:6a14:: with SMTP id x20mr331256iog.177.1632758824207;
        Mon, 27 Sep 2021 09:07:04 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id r20sm8804331ioh.19.2021.09.27.09.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 09:07:03 -0700 (PDT)
Subject: Re: [PATCH] net: ipa: Declare IPA firmware with MODULE_FIRMWARE()
To:     Shawn Guo <shawn.guo@linaro.org>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210926065529.25956-1-shawn.guo@linaro.org>
 <20210926134628.GC9901@dragon>
From:   Alex Elder <elder@ieee.org>
Message-ID: <706be34f-9306-0212-baca-6c8dd3f19829@ieee.org>
Date:   Mon, 27 Sep 2021 11:07:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210926134628.GC9901@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/26/21 8:46 AM, Shawn Guo wrote:
> Just reminded by Steev, .mdt file conventionally means we are using
> split firmware.  Building only .mdt file into initramfs is not
> sufficient.  So please disregard the patch.
> 
> Shawn

OK, will disregard.  May I assume you are going to implement
a patch that does the right thing?

I had a note to myself to investigate using MODULE_FIRMWARE()
but hadn't gotten to it yet; I'm glad to have you do that
instead...

Thank you.

					-Alex
