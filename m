Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5A23256EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 20:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbhBYTnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 14:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbhBYTkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 14:40:55 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF76C061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:40:13 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id b8so958146plh.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=/8zsvP8ZD+BzhQTmjNZb0GRylgsz/jgQq6EA/tPElnY=;
        b=RUC5y47WmZ1tKvWDlNLUAtJpvYi/UDF6WEs5EROUyFlt/3tcvu0kV6ZKn2aTL2HCPV
         YJN5SI5CsmmzTArWdqhWOWNy9KhTqslDZf6+y6wgbWqXWa2kczwbxTPKdD3+MPeY2QoF
         WA8ozU+TnARg98N8NEAGEOlsdEnoswe6iSf48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=/8zsvP8ZD+BzhQTmjNZb0GRylgsz/jgQq6EA/tPElnY=;
        b=Do27pw1HF6dcpHyHb6umHR/SM2Jjn4D1juhfU0csLroA1QLp66nvHDM7v2bCtoBOtS
         QqaQyUBb1IdWOobdfk2mVroQx4oXejqAJQPoGGc5P8/+4SG8UBLG0yPz8cMuoKQLhhh1
         YuEFhQK/GABGQ2nlLPmXWNWGlu+UbG4P1BC+SktF4WqmCvAHKBi6Li+6OdlOeDwvWcV3
         07F5z04LY7PNosgBVLwjvKfXDfZ9IH4IRUmGrbxmLFq/oC2kGazVbuFyClNsHvnycRB/
         42KFKY0XUG6LgA8B8jIu77dLGcNnVLVUCrCnMskZlAaqTi5fqD1wWR10KlcnXWty74sV
         n/zA==
X-Gm-Message-State: AOAM533zVVRZ4KmQGuYchPpslCO2bh9ApufT3YTjZmpSxw9kOcGCom0A
        nLGzwuFZJumxDx4O9V8wyUaX0Q==
X-Google-Smtp-Source: ABdhPJzKWL7GRHfC72BT6EovBap9fnhgpyQnR2tFTo3OvPxgNVpUkOH4PGhFEKLAHVYzLkttV3wQdA==
X-Received: by 2002:a17:90a:ba16:: with SMTP id s22mr12230pjr.88.1614282013595;
        Thu, 25 Feb 2021 11:40:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b942:93a8:e68d:5a90])
        by smtp.gmail.com with ESMTPSA id m12sm6396684pjk.47.2021.02.25.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 11:40:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d311b75428da7d87638208490fa9a64b5ef15d6f.1614244789.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org> <d311b75428da7d87638208490fa9a64b5ef15d6f.1614244789.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 7/9] soc: qcom: aoss: Add AOSS QMP support for SC7280
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Thu, 25 Feb 2021 11:40:11 -0800
Message-ID: <161428201178.1254594.5790623991406122509@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-02-25 01:30:23)
> Add AOSS QMP support for SC7280 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
