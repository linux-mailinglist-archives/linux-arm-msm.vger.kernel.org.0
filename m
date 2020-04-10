Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7177A1A4986
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 19:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDJRs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 13:48:58 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46772 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDJRs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 13:48:58 -0400
Received: by mail-oi1-f195.google.com with SMTP id q204so1963494oia.13;
        Fri, 10 Apr 2020 10:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+zNuF3LiP7kvgVV1lvcUDcmbeJ3DBvPeuSAiKMFaGnc=;
        b=GThtrDsqq6diMLLWsmQsyGJvWA4V1m9jDMLiq045j/x8Dw7Wz0cfokp8blNFMmtxba
         KBYWJu6KkmUjkXNUdEQttLZMQAfoc6OmnMN/ZpgYPdFwYnSzfjOiDiMrs8ZCnC6WmvCZ
         lAHRZJUMs3XnkbrVoQz3DYNC4TWHsA1KtYQN/Im7YzC/ySMLdP9nj2JGtclj/2QWm6ug
         0g9Va6nz/s0jXxQzfKBPbOU+7Cp1AT+qh+h89mj1BzqVYKU6s40K8ru2Xd5mgD2TyTan
         ZC9p95ai2BeqF0BF9e0kCXgbMc4hrGnlgpUi8ejMTItDc+BvgPeKgzebW5xn1RjqoVLU
         CCTA==
X-Gm-Message-State: AGi0PuYc2KNe3qWW2GIlP+ni2dkd3VAJQsA3hFbOariKb62EuH0vJ51n
        sJrjoioLKsqpr5G/2xW1hA==
X-Google-Smtp-Source: APiQypIt0cEpMExqzLdxjcdCSCFkFwJgM3Jj7xITc2xbl8Ot3NQLeW5lxcuMi7lDACDtIRWU3GO5eQ==
X-Received: by 2002:aca:3745:: with SMTP id e66mr3965165oia.153.1586540936614;
        Fri, 10 Apr 2020 10:48:56 -0700 (PDT)
Received: from rob-hp-laptop (ip-173-126-55-226.ftwttx.spcsdns.net. [173.126.55.226])
        by smtp.gmail.com with ESMTPSA id u17sm1523713oiv.21.2020.04.10.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:48:56 -0700 (PDT)
Received: (nullmailer pid 28391 invoked by uid 1000);
        Fri, 10 Apr 2020 17:48:53 -0000
Date:   Fri, 10 Apr 2020 11:48:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, sibis@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 5/5] dt-bindings: drm/msm/gpu: Document OPP phandle list
 for the GPU
Message-ID: <20200410174853.GA28335@bogus>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
 <1585641353-23229-6-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585641353-23229-6-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 31 Mar 2020 13:25:53 +0530, Sharat Masetty wrote:
> Update the documentation for listing the multiple optional GPU and the
> DDR OPP tables to help enable DDR scaling.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.txt        | 63 +++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
