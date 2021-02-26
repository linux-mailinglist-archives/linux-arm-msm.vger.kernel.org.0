Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4999F326712
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 19:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhBZSqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 13:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhBZSqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 13:46:33 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35806C06178B
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 10:45:45 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id b21so6743933pgk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DBoA2He9SEqhdRcPOlTnH+Nc/7DBERZF0m92VCsk5jg=;
        b=CzJVOB5XbthY815YrFZTz7okvWCudKfguVepSsM2rE3KYhtOgjo2ubtDOYd5wNc72k
         XY6VCuLMoPa54b3C7TryZmXhSZ8X5audeV9KDQ//qkvVW1wKfoMxIYKafr6rUMh9ai1H
         oohes+uH3rsg4+jHnrw+wqm+oySYwZiIIQWu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DBoA2He9SEqhdRcPOlTnH+Nc/7DBERZF0m92VCsk5jg=;
        b=hqdj79l9JeHC/2dc3i3fzbegdnvf4E2Ck8O025rZzO+8PZ/5CgidwdpKA3wNUFJow5
         ZSS+8p3l2H/TKFdodUcbpCgE/viYIh/4HPx26GNh8MfXD7QwJG0DbP5a9YINs+d3lVpx
         lk23ky3mwINgnu5CScbMuyvFKWGKFU1oRbQ83OwbxoCbG3xNcDpHLw1GWHjK9ZtICOk5
         x4vDcX5fFNmwfEWoQpAmmMakmkkPps7iX9wtZMX1O+bes5QsQt0FGeG3tX8j64VWkoou
         xAsk5LMHZPNevNqtgMj5n1iE7RYzrpyZ+N2uFe33O4LSmhXAiqgt6ZQiKzA3W0H+y6Ww
         sx0Q==
X-Gm-Message-State: AOAM532qWK9gkqVLUfZlkeoQAMmTziU8+JDhCM+rkbjmV2lO+I+v4LVf
        1SVhInB2dzMTeb2d3ZCjHjb5Vw==
X-Google-Smtp-Source: ABdhPJxpirRBN68cTs6BEm0/4bx76H7nG+Xarluh7zIVCuqEiGatxHFPfwy6XtpjUIQW3RvhGFHKFg==
X-Received: by 2002:a62:6006:0:b029:1dd:3af9:965f with SMTP id u6-20020a6260060000b02901dd3af9965fmr4635727pfb.30.1614365144799;
        Fri, 26 Feb 2021 10:45:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e8bb:5726:f58b:4e37])
        by smtp.gmail.com with ESMTPSA id 125sm10684127pfu.7.2021.02.26.10.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 10:45:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a35e6dcba758be4af3d111fe92cfbcd6@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org> <c4b7ae4dd009f563e6786f4a41f09efa38636fb6.1614244789.git.saiprakash.ranjan@codeaurora.org> <161428185152.1254594.1426736986245389798@swboyd.mtv.corp.google.com> <a35e6dcba758be4af3d111fe92cfbcd6@codeaurora.org>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Add device tree node for LLCC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Fri, 26 Feb 2021 10:45:42 -0800
Message-ID: <161436514295.1254594.2789904935200051795@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-02-26 00:04:27)
> On 2021-02-26 01:07, Stephen Boyd wrote:
> > Quoting Sai Prakash Ranjan (2021-02-25 01:30:19)
> >> Add a DT node for Last level cache (aka. system cache)
> >> controller which provides control over the last level
> >> cache present on SC7280 SoC.
> >>=20
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> ---
> >=20
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >=20
> > Should add system-cache-controller to the devicetree spec. Or just use
> > cache-controller for the node name.
>=20
> This was as per discussion in [1][2] where dt-schema throws an error
> since it expects cache-level to be associated with cache-controller.
>=20

Ah right. Can you add system-cache-controller to the dt spec?
