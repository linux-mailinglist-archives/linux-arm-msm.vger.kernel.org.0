Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB8E34F135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 20:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhC3SsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 14:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbhC3SsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 14:48:08 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DE7C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 11:48:08 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id l76so12365812pga.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=gQv+qhWyDiGQ4aKUdmaPDgqWYgAAJjhI8HocoFj4bqo=;
        b=S11m6QHTC/aio7B+MfwwDQG84R6BRhhnl9BYrP03LsgmZoWsoMMW9XuhGUlEFnCxBb
         VhudJjhukFjIhfUpxfA4I2eMWfm7WLTdnNrwXT6FkVqD0EE1/xJFEZXNIa3nPs6m4ytB
         S3VRWbueiSsQPwQqhzX4aO2Rom5tAvjdoxwXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=gQv+qhWyDiGQ4aKUdmaPDgqWYgAAJjhI8HocoFj4bqo=;
        b=BwJsu3B9eWg5DryMH40vXQ8wMKGOCFRkCa57IRiwLvDB505JdzYwjwYyk1k8//7XpQ
         /Aew6MWpwM6vQHgTe7EhWKp3yyyyMORDjqcJXPIBF/NbjrmvX13IhNehzdNlTuQTWEwa
         ytLTY83JYJVXGqIZuPPb3jtHIsu5v4r+qqkK/Bcfjwj7FRQZXJ8xTtwMYMhPHFsxIQBy
         iRtEVf8S8Syp6obQ1H3Mt0VE5cxe1ZOAlCB2leh4LmYZ45YGs74EyNG0OZf5RmZrmCor
         MLCMBIQHxkNLXL2crWMA1IO5X6WVlgS4UFiWIJE64S7uVv58csHlJc2WV0nkpBdJX1Lq
         G5XA==
X-Gm-Message-State: AOAM532222DUcbYha95CD7838UXMUyLpUSoNwiMjSHXwLSLuuZRG/fYL
        KwnkGyK+hYIm3zcDkzZtdyTy/JIYZnY2+w==
X-Google-Smtp-Source: ABdhPJzlQeCU1MF8DgfHgJprGNQmgXN4UBojNdIJS4uWo4FXc+EOOQ/cQ+it+mvFGFzfe8p5uyEgkQ==
X-Received: by 2002:a62:17ce:0:b029:1fc:9b43:dbc5 with SMTP id 197-20020a6217ce0000b02901fc9b43dbc5mr32009554pfx.75.1617130087802;
        Tue, 30 Mar 2021 11:48:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:c8c2:b814:df0f:253f])
        by smtp.gmail.com with ESMTPSA id o13sm21830955pgv.40.2021.03.30.11.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:48:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210330014610.1451198-1-sujitka@chromium.org>
References: <20210330014610.1451198-1-sujitka@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: Move rmtfs memory region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sujit Kautkar <sujitka@chromium.org>
Date:   Tue, 30 Mar 2021 11:48:05 -0700
Message-ID: <161713008557.2260335.10529327995893415907@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sujit Kautkar (2021-03-29 18:46:10)
> Move rmtfs memory region so that it does not overlap with system
> RAM (kernel data) when KAsan is enabled. This puts rmtfs right
> after mba_mem which is not supposed to increase beyond 0x94600000
>=20
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
