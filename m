Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6A611805F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 19:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgCJSL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 14:11:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41591 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgCJSL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 14:11:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id b1so6659329pgm.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yrVZjd8gZ0Ysia7WKkOlNyA8gHSCOfIvJw2hn5fXOTo=;
        b=S+pLjMqdeN6mnY8CQehC3nBw/yA6NMpCjF8qbgxUBM1lcueUbng2IKM5q69nW9YMLI
         1K9oW8b1DaZDeSNKGBvlwA1Q+d9J2pBu/3a4VL6E7nlJ3ZWwc2zSouHg+21N2OJ6NviD
         shULJYOBdJPXnC8VaRxjyev4hoQU5eXx2v66k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yrVZjd8gZ0Ysia7WKkOlNyA8gHSCOfIvJw2hn5fXOTo=;
        b=euChq0/LJTveu4TRmGCe0RTA+y2DvYkpMavVKdHb/CDC098vksRiTtAmipi/RAW1ob
         d7GCdKst2kV9TpvA5tbSQ6n2t6X7JsKT4mYNJz+8nCPxwlpsSzDgvKe/uwpWsWwHOI0t
         YHjdAAiE0I1ubKOUfnIPTpgQh2mVPbxK2ErN+rnCi7YXXKRLGqQKy856OzWd1YSGpPE7
         D8U0hUVER3HxbtzhX7tfEih6ViPHccTVSv2rOlHMoon8HRyxBlnp7/HenSWiZE2AScjf
         GTcCAqIBZoKLwx4rZL44hzvrKIO43z3hc6hTcOFnNIW2BimOtY6mDcBYoub6W3jS9CGf
         TCsw==
X-Gm-Message-State: ANhLgQ12dFa+ba1uTN2jN82Pqqtwkjw8UpnzcMTsVAf8n5/IucMchbIW
        AQNbXbTmqBd+7DcjBzZW2CUIYnrwhJ4=
X-Google-Smtp-Source: ADFU+vuipIwBt7HZ/eXbGMHyK0C9Xm3ciUBrtc453qCMfM4q/YxsgsKOtlO41E3QCYP95HQyqRhlwA==
X-Received: by 2002:a63:7e10:: with SMTP id z16mr6992656pgc.412.1583863885067;
        Tue, 10 Mar 2020 11:11:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c17sm27415625pfo.71.2020.03.10.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:11:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-5-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-5-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 11:11:23 -0700
Message-ID: <158386388355.149997.17460216194595657584@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:37)
> Add a simple-mfd representing IMEM on QCS404 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
