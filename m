Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB4E3539B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 22:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhDDUXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 16:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhDDUXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 16:23:47 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEB3C0613E6
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 13:23:42 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id j18so9253018wra.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 13:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C1jQrGsOj1FZAgOCaP1S43Qzv0rwYxC6Nbp1N/yRsoI=;
        b=wdc22zRrVWwGUbsXZ8b0nYRaVeoMtRsd8/zgF0UJXkeVyIYKM1ZJcQnS+nH2WM+PbF
         OTCSUed11YpR+HT7i8BkOsdJqa2es2ssRYbL/pxedfg5M8T63reIIUeFp5hLEv7zYy9u
         CpzzvtwgTGvSh/rk36NMPWHuVZxztq+WCGkmXXal3zPNjlDTYdpgSrwKRCCixuaE1LuH
         yb1WIKY5skGkV7ocKPAN+kpfXH2ph1iLTx1zfkbhNHzOcWxwNGZfFd3WyojOZ+bScxab
         PCzB9QK5pYmXyjOPvyYf9U1D23h4J9Z2to7mFMClH1el2w5rh7YOgdWTyuxskw2P+eFd
         AxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C1jQrGsOj1FZAgOCaP1S43Qzv0rwYxC6Nbp1N/yRsoI=;
        b=PLyq1Rbexs+mFqY4eZloJUJobfS3e65EU4iVOqwWCZoejqbswHTIax309iiBU4oDSm
         QJ6RV/P4Cy+r13HsnIu+/078phkfsM4tTShp1xiVF2U4qsdq8fUVdNQCcSQYgmuTMnvL
         KTU6ZwBI3Xx77CCLT6h5j/38Q9lGS+SCslIQ+dYqK9qiQ6pPEhKlRJOtHI/5REB6MN8P
         8VemGRE3Vig8/vEFTRoT7UNvpUyzruLGXCqn4LxXuwHqgMwBvTtFaTX4JykvNnLrFXzK
         eKaH1ExeTpanBNjWAjsG3PWralatBcP8efX35Gr7OyJYup3N7fJ49InpwC3AN9M/FBIj
         G2PQ==
X-Gm-Message-State: AOAM530VWVygHkCeVNaqKwVShkrMfvvv631eUCw6NrwK9F1BszyQ22/z
        dDYy1bA1fFHF6fVk/a4W8n5b8yCGCF6p9g==
X-Google-Smtp-Source: ABdhPJw8j9PgXlQH9VlMvl2oruDZm1rL24m2MgBfpTrqzr1FrBpTyBCU6gJIiaqGQGnLEV3ppA2a9Q==
X-Received: by 2002:a5d:6384:: with SMTP id p4mr25995489wru.368.1617567820949;
        Sun, 04 Apr 2021 13:23:40 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:6d68:6b9a:7a3c:4a9f? ([2a01:e34:ed2f:f020:6d68:6b9a:7a3c:4a9f])
        by smtp.googlemail.com with ESMTPSA id c131sm21781635wma.37.2021.04.04.13.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Apr 2021 13:23:40 -0700 (PDT)
Subject: Re: [kbuild] Re: [PATCH v13 1/9] drivers: thermal: tsens: Add VER_0
 tsens version
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        lkp@intel.com, kbuild-all@lists.01.org,
        Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210331083520.GG2088@kadam>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ee996074-0102-376a-14a8-c655264572c8@linaro.org>
Date:   Sun, 4 Apr 2021 22:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210331083520.GG2088@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Ansuel,

I would like to close up the two series which are pending for this
cycle. Is it possible to send a fixed series?

Thanks

  -- Daniel

On 31/03/2021 10:35, Dan Carpenter wrote:
> Hi Ansuel,
> 
> url:    https://github.com/0day-ci/linux/commits/Ansuel-Smith/drivers-thermal-tsens-Add-VER_0-tsens-version/20210325-064422
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git  for-next
> config: riscv-randconfig-m031-20210330 (attached as .config)
> compiler: riscv32-linux-gcc (GCC) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> New smatch warnings:
> drivers/thermal/qcom/tsens.c:792 init_common() warn: passing zero to 'PTR_ERR'
> 
> vim +/PTR_ERR +792 drivers/thermal/qcom/tsens.c




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
