Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873231E3945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 08:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgE0GbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 02:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgE0GbL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 02:31:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A607C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 23:31:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q9so1082081pjm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GAeIH2kkVlgfDKNDvExkjEUjr7t+dLIV143r/wZ4ZCs=;
        b=mgStlcTQb+C7oOeBQLtpopl4rDpEglFL8WNYy4ZKxaew9vLvMRyQeiWwvv4K6diVMw
         RmJUO9lnsqfQiXz3gPyvtp11yp6ZgilsacHzxopa/QpbhHUWQ54qx+inj9qISvcrMqxl
         wQCfE4E5kBgBRyzkVnnyXcZ+QUuerB0c1M7WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GAeIH2kkVlgfDKNDvExkjEUjr7t+dLIV143r/wZ4ZCs=;
        b=Ik1cefoCJRKgqV3lHR6+I7RkGIMPIHq4qLWWGnimcxtXd43z/5M3xBnR1dQepIy+f2
         Rg+m4dBtF+FlsCXXDvxti6ji3rF21jeTLieH6XxjWDBDMan/n7iJSrqPxapLiIogYMLE
         hU0xvlHBJw9ntkEzHXEXX9qps4ceyqZqQ9LwEoHStoA24fwJiqnjmyaCXI3K/43SrELk
         8VyfDziTrAlODUsjYk3S9sSk7XgDiRhttSZmCcmjQar82uNVUOVHfEj0W8GsbzbkiYqj
         Rf1cq4nBEST5F1WF9gtkDW2d0D44qZCUz6IuBYp4zjoYjZ1qg8zaQ+tO2WmFmbNxB9VW
         MAkw==
X-Gm-Message-State: AOAM5329Tcnn/bW1J7HftVMXuaaaV8pnxqckHpebnQdssnmUUm0FPKsi
        rj6UOI/TQnKxXvOMPO7pTqwyTg==
X-Google-Smtp-Source: ABdhPJworKi8wu5+vZmXaxlggXWpRcMSuQ5Qj06+Hg0Li/MDDPoRyyIhDaY2PmECBWrcKK3Cd2MvYQ==
X-Received: by 2002:a17:90a:23e7:: with SMTP id g94mr3424943pje.210.1590561070701;
        Tue, 26 May 2020 23:31:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a7sm1193700pfa.187.2020.05.26.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 23:31:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200527054850.2067032-4-bjorn.andersson@linaro.org>
References: <20200527054850.2067032-1-bjorn.andersson@linaro.org> <20200527054850.2067032-4-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v6 3/5] remoteproc: qcom: Update PIL relocation info on load
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Date:   Tue, 26 May 2020 23:31:09 -0700
Message-ID: <159056106910.88029.925874171202462275@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-05-26 22:48:47)
> Update the PIL relocation information in IMEM with information about
> where the firmware for various remoteprocs are loaded.
>=20
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
