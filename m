Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345F83FF2CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 19:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhIBRrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 13:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhIBRrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 13:47:41 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE8DC061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Sep 2021 10:46:42 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id d3-20020a17090ae28300b0019629c96f25so2029680pjz.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vqm/Vjt4OCbk8aFeOwhlPn2yk9OwMuTw1Seb9Qgfvbk=;
        b=h+EKOsNgJWJs9df0lXbdA5YdsUggg9hoOPZ9IX4LJXNPKaiiopLy9sSXY5EbFl8niG
         eWXlEuna7Dthtq+J97MOYQOYpfAomC7EiNDe2u1KuGDDKG269YyM+nHmgV4OuWcVl9/H
         JYYqysXKJGVAe8d7utetpxXdB3/fF1UOarKKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vqm/Vjt4OCbk8aFeOwhlPn2yk9OwMuTw1Seb9Qgfvbk=;
        b=AU9SBiySK8+bh4Fkfw1Fr2lVPJsLbyloPzzyO2SdAXGWa59VfsemNmAc9zy0Um0+7j
         lO+39Z2t1e0QsGq8j8Tf4cq7iRPaaGJPtFWZdbMCfXHWh3Y8LGtF1AfNdyc+rYNe5IlA
         o77n7N8q4f7wZ15KB15mO77irxwkOz0h/cFmUJmmC2WQqzd5S4pKpndsLu2g+8TVtCyY
         D21+2tJjYOVIETcv8E80LiSy5fi9H2QixTRNoDIVHAT+2rFUjSIBiPif0PQ5U5weKbKe
         Y1xeUiiK9sQ30+/GQJ25JGNS6OEfmEh01q+wmgfRzthB4ffWjLTRtxp2cbQpSOwvdKja
         jU8A==
X-Gm-Message-State: AOAM530BPcfFpWk67BnV+zgIbnn8HAcmCnl1AZ+WZvxsJky2g9KC7RXx
        aUGYnKeHrhwTgTIbIAIBxI87Vg==
X-Google-Smtp-Source: ABdhPJzFUUrP+wjw1or2yo13Ci1xUdabM7U1PlsBbO2VMPR4hRY993GeNttEsdAlSGeWW27cZJD9Ew==
X-Received: by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP id c17-20020a170902b691b029012d02b6d116mr4019656pls.71.1630604802020;
        Thu, 02 Sep 2021 10:46:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:76ac:d178:a633:4fb5])
        by smtp.gmail.com with UTF8SMTPSA id 26sm4039624pgx.72.2021.09.02.10.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 10:46:41 -0700 (PDT)
Date:   Thu, 2 Sep 2021 10:46:40 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Subject: Re: [PATCH v7] Bluetooth: btusb: Add support using different nvm for
 variant WCN6855 controller
Message-ID: <YTEOAJgihvuXLcpa@google.com>
References: <1630572986-30786-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630572986-30786-1-git-send-email-zijuhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 02, 2021 at 04:56:26PM +0800, Zijun Hu wrote:
> From: Tim Jiang <tjiang@codeaurora.org>
> 
> the RF perfermence of wcn6855 soc chip from different foundries will be
> difference, so we should use different nvm to configure them.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>

as I commented before on v4:

> Please also add your own Signed-off-by tag, even when sending unmodified
> patches on behalf of others. In this case you are making changes to the
> original patch and are effectively a co-author, which is another important
> reason for adding the tag.
