Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC7D3B4AE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 01:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFYX0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 19:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhFYX0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 19:26:02 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967F3C061768
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:23:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u2so5501548plf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I++Hou46KR2uj9FywP1lXIkCQRmcDSf2J7N01SOGghw=;
        b=PVPsHGryXepq++jasKNZrwOxRq0wtzSBiiAzjetks/D7Qtf5JoJYTLiNHxfdTg6YY5
         dnvjh/XfZ6UVkTR6gO5T3jXtO1e+ahuZGiYy4laO6YaPH4XzAUq1qRXANzz33dMm5Tv6
         QCOHiTC7H98VU25JFlCI50vR8+ybayijKvMZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I++Hou46KR2uj9FywP1lXIkCQRmcDSf2J7N01SOGghw=;
        b=KRbE01uYhAfYFq+N1VN7GMBC7RQ6/PiVcw/3XA3jgcLikKIup9UcUSOgZ3VK3NL8OQ
         s9k9yPzHYRJ+pmPzCkshey0dAPUIfi3vnMf3D9TlyU9pDrurXZmpKbeoG36ysSOk8Lr8
         td2C+SgVENEdCkTaC/DKIrKsT67AehLeOBa+1Hj8fb/63kPLOpZ3pGlabuUuVyXBmq2X
         P7yviz47DA0xtKkbI9G6tU/Yt5iWtMwOizWtlEJNJDeS+BB3F+ClXt4ZXm16Ql6eHxGT
         oI4ZH6CGBbtLsZUhhxbDZfEdPiRaOTcNutwxxFE0Gh/bacJtsXXFwDKHHMGqAtAEhMX6
         8ZGQ==
X-Gm-Message-State: AOAM531BiCeTmwwOlNlWNMP/ee5R50+kfIqLfxNzFqV52Fx+MVsJOF5p
        ZrrUHusk3XbMeP2is4YLkWtZHQ==
X-Google-Smtp-Source: ABdhPJxjkafwQnqg424OpXjqQy03Ybb/oMQ3swvwysUOB5GqLJ1DNO98wJV+qB0cT5tMvqS4kG8Wlg==
X-Received: by 2002:a17:903:230d:b029:127:9144:db9e with SMTP id d13-20020a170903230db02901279144db9emr11110808plh.3.1624663419950;
        Fri, 25 Jun 2021 16:23:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id c184sm6643949pfa.38.2021.06.25.16.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 16:23:39 -0700 (PDT)
Date:   Fri, 25 Jun 2021 16:23:37 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 2/9] remoteproc: qcom: pas: Add SC7280 Modem support
Message-ID: <YNZleW/fLA6jPcn8@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 01:17:31AM +0530, Sibi Sankar wrote:
> Add support for booting the Modem DSP found on QTI SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
