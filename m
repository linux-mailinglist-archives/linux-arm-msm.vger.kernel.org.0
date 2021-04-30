Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93C536FD42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 17:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhD3PDu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 11:03:50 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:39744 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhD3PDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 11:03:49 -0400
Received: by mail-ot1-f42.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso59889950otv.6;
        Fri, 30 Apr 2021 08:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fj3QO/i1Bj44wQYDox6zg4iixxddXsz5/4iGRb08pA4=;
        b=NE6NxKsf20Bz5xkJL9Vsmy6uekPcOysty6F87+BEiPFMfMIAd8Vpf/y8RbWWOftNrO
         xnx1XOWqycKm9V3ubrHRK+iFBmoyDu10VpQ++mQDttE8tCldQrFFhHCi81HvRBY+4FHw
         K7amCu2TbYbpTwrvghk7hFqYtbuebxWSLN7FF61vwGHK/BXFO2KK0LEzf6Pe8vdUzgIB
         j5XF7aArGyGc8p0a35wiVuBS/rkGGcWLf+Jeo45pyB8c1gz4BByiBnFfGxZEDDv3XWan
         qqVkY7itu5Cc/PGSdM6KbzlLbYsRofDdvTuJwpVIJmRKNjjSczmeJsOPzsHc+g/Te+63
         Dj1g==
X-Gm-Message-State: AOAM532nR7EUcPwPyAp+v4HI5kWA2Zg0kIsYLjv5KR9c9qKzu46yQBH7
        BA7T1XSCaz1F9Ky1BFKvaw==
X-Google-Smtp-Source: ABdhPJwJR7Yo1h6aDMinSbo3wLz//8UX+AnWflxQ4/lVrhjvj6N12O/WctwMiJeUNd4czmwK0RZPww==
X-Received: by 2002:a9d:3e09:: with SMTP id a9mr3942861otd.342.1619794981000;
        Fri, 30 Apr 2021 08:03:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j8sm767531otj.49.2021.04.30.08.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:03:00 -0700 (PDT)
Received: (nullmailer pid 3319018 invoked by uid 1000);
        Fri, 30 Apr 2021 15:02:59 -0000
Date:   Fri, 30 Apr 2021 10:02:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     rishabhb@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ulf.hansson@linaro.org,
        swboyd@chromium.org, bjorn.andersson@linaro.org,
        sidgup@codeaurora.org, robh+dt@kernel.org, agross@kernel.org,
        dianders@chromium.org, mathieu.poirier@linaro.org, ohad@wizery.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net
Subject: Re: [PATCH 12/12] dt-bindings: soc: qcom: aoss: Delete unused
 power-domain definitions
Message-ID: <20210430150259.GA3318965@robh.at.kernel.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
 <1618574638-5117-13-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618574638-5117-13-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Apr 2021 17:33:58 +0530, Sibi Sankar wrote:
> Delete unused power-domain definitions exposed by AOSS QMP.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  include/dt-bindings/power/qcom-aoss-qmp.h | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
> 

Acked-by: Rob Herring <robh@kernel.org>
