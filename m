Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA65E3245CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 22:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbhBXVay (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 16:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbhBXVax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 16:30:53 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE60C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 13:30:13 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id w18so1980316plc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 13:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ZHx27pOMJAsTZfND76S3gLtE0vCulSpgoAxR/wb0mHM=;
        b=DMf4ILIQ6FR21Ou34McWcetzRVq66u7xwyd7+IvZZpQtkAby5lDLBvGcZ9WXx3IM1K
         ymJ2+lfc+yRVMlAjEoNmSdR61NrOMxv4/nhXTGmKIv09LBHk9X0tWU+DnR1ygj1R0K35
         VczyiXuSALOGpSS3BOoip6rPjgwAQW4d5YYDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ZHx27pOMJAsTZfND76S3gLtE0vCulSpgoAxR/wb0mHM=;
        b=ud4CLYnEnqVO9cgQd5Su8i2rL3BjoDUrr/KIo2OhY3D7ee1FsZKJyTXsqFs/4pMsF/
         VOGmMr4tJNeW0FcCKd1+5P7YQ7W0SBrtim56rhxSWdmbHUBP0yg0MjVELJixrd9xQu31
         jv1gJEwY1XIoXhxyHZjioo1H1qFIFRWCu61iFn4I4BLCF0xa/a9dUCJmtpo2Oc53gVtE
         tE5fFcLQopMSysNZc72I+1n311Pmi2I+12oKDvrFRWK2C4Yg30HVFqYfnyrs4Z0/DGPS
         8GuuDxQvGxNeCbnOkdcTJVwl9qiL0PM7rtEp/SqAevuQkoO1qNFb0grNB3NeZaYuOCV1
         lb6Q==
X-Gm-Message-State: AOAM5314RgmKHlIFuxrRR6GZ3kvdskhVSdtcSSPMIeWhpekgypwPA4ZV
        mQQJ1Qy70i8iUQYJP98rpqzlfJvA6WGgQA==
X-Google-Smtp-Source: ABdhPJypgzLK8LHJx99gN4kS43bvBbYnCdqG1NOQ1EbxdZ5qeohGxXrfSI/UTJyqcqA0gB8K2GqbmQ==
X-Received: by 2002:a17:90a:1b0d:: with SMTP id q13mr6569870pjq.211.1614202212777;
        Wed, 24 Feb 2021 13:30:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:933:e73c:97ad:add3])
        by smtp.gmail.com with ESMTPSA id d26sm3756125pfq.175.2021.02.24.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 13:30:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210224092313.2238-1-wsa@kernel.org>
References: <20210224092313.2238-1-wsa@kernel.org>
Subject: Re: [PATCH] Revert "i2c: i2c-qcom-geni: Add shutdown callback for i2c"
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Date:   Wed, 24 Feb 2021 13:30:10 -0800
Message-ID: <161420221033.1254594.10844143129299520684@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wolfram Sang (2021-02-24 01:23:13)
> This reverts commit e0371298ddc51761be257698554ea507ac8bf831. It was
> accidently applied despite discussion still going on.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---

Thanks

Acked-by: Stephen Boyd <swboyd@chromium.org>
