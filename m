Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE10C1E9C5E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 06:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgFAEHs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 00:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgFAEHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 00:07:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC695C08C5C9
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2020 21:07:45 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p30so2862317pgl.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2020 21:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+6ownZMPIgJJdia/JCvZ/qOK36qij75yfOhvnZqmGDk=;
        b=MoT4G10i1QXRhHmSLvbhdqLIFOsga5P29Iy8cfjKMfdpgwmgMC65N9xZ/pXrQh2M0L
         u3tOTwAiW98462Lh4X4ZoucKG+NEqtadraC3IqVW6XaglxEAryoj1UdXBVy4j8JBC1se
         QI+FOF0aiVjU0eW0aPnDuYAN/r1AWtS7SNafakuv+FvamuiseKiQ9PeZApiBwLWxRwfU
         fXYVA78P4ovkSxWztSVfDyIDwrr+sMhuPHj3It/gmfI/hHQswR+y+wsfDzeHLxqY25EN
         LDGDz3Xi2L9L7EMyzWTyui2bBFWiLMi/XSSO1cbbQfcZO73vGk8K9IXa7QCL4yY0hJYz
         qa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+6ownZMPIgJJdia/JCvZ/qOK36qij75yfOhvnZqmGDk=;
        b=BMFajIhP0wl00KorNHtxHK2/QKFwAMnp11aMnmaUjppX52D9g4zuvfFbHsCF6w5Dlf
         zIK1PiQfatMFlx2MZZECvbozlJxhZPRk9YUiK+1t6YOIzquH2IXIu/kDtFkTDbqoq44k
         r1yvoSOHVKcZmlqQnhTSEV7v8v2Lgi1Fng+EBsVQLacoN+Su0SlGjlkOJl7ULDPk8nAe
         1glg+0NehWYyqu9wRv51I+s9ermCFOkSfYM2kquftzRcQH/9xwDyP+jy7L2RHv5a2nYy
         XVLotYhZAdFmP0LDoyxU8N5uNZzGJFDAYI5Y8oUsj7XBly0xQK3cn3sYazjqAr6eTdLF
         stNg==
X-Gm-Message-State: AOAM532r9mJ+bU0ohDtnYAnzKCptIbmR4lRx5Aqky/+ttU1TgrfnWrO2
        jFyDSQM4d5XE1hqAw+aZaZ7JEA==
X-Google-Smtp-Source: ABdhPJx2sQD+gYk0YMveVCSJnx6ztfk0oDnR8Id3d7XxHmX6wCFUYDgpyaGtL8cCxpigl5RQ7QO+Fg==
X-Received: by 2002:a05:6a00:150e:: with SMTP id q14mr18059424pfu.325.1590984465237;
        Sun, 31 May 2020 21:07:45 -0700 (PDT)
Received: from localhost ([122.172.62.209])
        by smtp.gmail.com with ESMTPSA id 140sm9923609pfy.95.2020.05.31.21.07.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 21:07:44 -0700 (PDT)
Date:   Mon, 1 Jun 2020 09:37:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org, nm@ti.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, saravanak@google.com, mka@chromium.org,
        smasetty@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] OPP: Check for bandwidth values before creating icc paths
Message-ID: <20200601040742.3a4cmhrwgh2ueksy@vireshk-i7>
References: <20200527192418.20169-1-sibis@codeaurora.org>
 <20200529052031.n2nvzxdsifwmthfv@vireshk-i7>
 <0205034b0ece173a7152a43b016985a7@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0205034b0ece173a7152a43b016985a7@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-05-20, 19:47, Sibi Sankar wrote:
> opp_np needs to be subjected
> to NULL check as well.

No, it isn't. It should already be valid and is set by the OPP core.
Actually we don't need to do of_node_get(opp_table->np) and just use
np, I did that to not have a special case while putting the resource.

> Tested-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

Thanks.

-- 
viresh
