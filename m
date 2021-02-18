Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4334231EF7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhBRTPB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 14:15:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbhBRSrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 13:47:53 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAC2C061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:47:13 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id lw17so3238295pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=hwGMhFSpUZ+8IXq8QZ1Gz3vsECNheP1SgnkaWXhUlaI=;
        b=Kg+PGRM3gO7wDPL6kZftJKUY6fnhghWTbGzTjonou2e29fwKEEp4tLMknMlps5QGVK
         Ayl7L0eGjQ+wvpr+dILJrNVED75qRl3QnWmwdg9FB1ZOGJDMejCfWHwrxnNip6AxOZxg
         6WqLPlXDR2vCxTVPYkOpgpxL4OgTM/Cm55CTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=hwGMhFSpUZ+8IXq8QZ1Gz3vsECNheP1SgnkaWXhUlaI=;
        b=aGPE+Q33jTeZNZV9KC0knp/fsl7yJss3EnR0JqVpM8qo9UdXQAUd51H8vAWnDEaOAG
         PoAi7Ah4xP8zYrrCZNdOQKZwRKO3Lf9/1GsLk+XjsujuJbdS0PkhDpZn5BRM1hFzOJqe
         Fiwfk4LoejcCnsks2OJF53zzsAW7sfOOu8oLS8N6s/urQMXH1d6S12x2EoQZg/8n/rN8
         5nFu+RMaACnfeBnpjOvdGqo+JZpRv6cbb/7cI9LORg0P+tb3OHDMeZe4/mP4gyQT3s3Y
         SKgwRonNlz+VDe8/bYr0Dv7x3WGPdshGs1se/7VtXRYNvjVBQJqT2Xzs5zoStbEYBp3h
         3GPQ==
X-Gm-Message-State: AOAM532nraGcE5BDm0v5Ru6pTKTQ+cQxWcdM0B4Cfd/e3fF03HrDJx3p
        UVtqW9BXtq1o8jfBEo64MhlByg==
X-Google-Smtp-Source: ABdhPJzXASW7UW1qP+wySWhkiDv0DfzSYH/2XlmgQazxzKYmSoEl0w/SmWQge0xYnKEw7PYvWKuZVg==
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr5216701pjr.134.1613674032774;
        Thu, 18 Feb 2021 10:47:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
        by smtp.gmail.com with ESMTPSA id 8sm6379722pjl.55.2021.02.18.10.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 10:47:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
References: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: Drop limit link rate at HBR2
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Thu, 18 Feb 2021 10:47:11 -0800
Message-ID: <161367403102.1254594.2276430831177324166@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-02-17 15:09:57)
> Drop limit link rate at HBR2 to support link rate
> upto HBR3.
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Should also say

Tested-by: Stephen Boyd <swboyd@chromium.org>
