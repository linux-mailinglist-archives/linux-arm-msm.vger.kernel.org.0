Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59C026B1B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 00:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727583AbgIOQKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 12:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbgIOQKm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 12:10:42 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737BBC061A10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 09:10:13 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id l191so2235604pgd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=VViAJQqCvZ+W9uKbOdPfvJ2v9Gv3o3z5TpkfLft1QN0=;
        b=mLt3BNJxdOh19yipmm71v7ESh85fTnPPhOp909aaBqwHzYh0Z8haywshZUQGt5Ub7i
         Sps0C46SrrzYmVP5MyIzrjV/K7w2aUyQm0AQHgjU++eTk3eLjsZG5PIBlPMmHdSH09/P
         Zc1IpYY8szJm/56pT/OlAtNDhFnEFK2E2JXbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=VViAJQqCvZ+W9uKbOdPfvJ2v9Gv3o3z5TpkfLft1QN0=;
        b=cEFAGdaWO7xWHn8y9eAiu5pRO8sjMUiTLFWN2qWXuXqYkU/+eMD1psrMYQGbf1lZI+
         uJVHJBVP8LI78mYvzX2JFcw7pNemn9ilOcPMu8b8kTuNabY5ke6uBWz1H/q7S60INKry
         5UaSvW121jWTtCqUtHbiQPX1XGsbCHk3sn0XF3A+GjSJ9FHgmm/CNvgW4M9clmSMIvnn
         ZhBOy0Pioo3U6PdJq0vXXna0tOZJlrHWLCmPrLZ2CTbco31+Fsm3Ib0zEiftEyD5B4j6
         Xsx0tF/u63FIjj2Q7xGjYEEsqtnT3izsM/kISYv7nTYrR0ajuQm2GhJXdNrSA3kWnA80
         AEAA==
X-Gm-Message-State: AOAM531UJPjBJwxxBnrWsgWMU69tPxlwbgmZtqUlh+U0cI/u33NLUckn
        fi/0COyOlJYW4x3Qsv1k/8iVzQ==
X-Google-Smtp-Source: ABdhPJyQhOUohpeWiD2vfgf0NpuEB+YxIfxqgz9VrJsEZIm1ZpTzwn6VBdTQeRAA0JOY8If+Yrc50Q==
X-Received: by 2002:aa7:8597:0:b029:142:2501:39ff with SMTP id w23-20020aa785970000b0290142250139ffmr2593371pfn.78.1600186212985;
        Tue, 15 Sep 2020 09:10:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c202sm14039243pfc.15.2020.09.15.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:10:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <51f9ad67333eedf326212dd1b040aade6978e5b1.1600151951.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org> <51f9ad67333eedf326212dd1b040aade6978e5b1.1600151951.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv5 1/2] soc: qcom: llcc: Move llcc configuration to its own function
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Tue, 15 Sep 2020 09:10:10 -0700
Message-ID: <160018621088.4188128.12098946410444446853@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-09-14 23:55:25)
> Cleanup qcom_llcc_cfg_program() by moving llcc configuration
> to a separate function of its own. Also correct misspelled
> 'instance' caught by checkpatch.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
