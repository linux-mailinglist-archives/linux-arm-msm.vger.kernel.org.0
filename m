Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F193256DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 20:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233960AbhBYTlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 14:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbhBYTjE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 14:39:04 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4F9C061788
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:38:23 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id e3so314748pfj.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=J4LYITuFgsyPjhHjukulKWfdxvZCkmNeZCijjtiolow=;
        b=Pp7tF10So2Jdyc9FpYGdXQ+ul5oyzS85VLfyEmPy2DX5bYEETaAR/kao0jIvusAzGz
         4YAjlKemgmEPE/1WGotQcNkB0OSMtGXKVl1ghm08JAv2N5gorA0fVTdCKUbYOKbkEv/U
         sf+Rqzp0d6VVPHisBrOMypHn1dmemHm1UFf4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=J4LYITuFgsyPjhHjukulKWfdxvZCkmNeZCijjtiolow=;
        b=ff+QdfTXOG4Kb9KLL2pldzQ6wD5aScGKRdNkNjp1OXjfQGBNg3t+OGRoA9HkvzkSP9
         PDtx0LVN5R0Gop3AJ+bn1mLqW/9QB4IdHTYJR8aPDVq4ZqVTm/Rltct+/qu5nQI7bxwx
         b6IPwlpjEJwmoWtT8utHuvDEJIh9K/fNdDuoyRw5DvKTF/grXgw8+LvuRvjWQXGHWZmw
         tRQmQxVwCPfMF0i6HdChzTF1t405FQcVA+Ye/tSjr8W8PKOYxffedu+r+u82/9nyc8oH
         FuhwEG+jUGm5Sx6yI5wvFvXjKVQiI2JZa2lqapfkglAVUZhJRd2LVCea0FIjW9880Vag
         7U5A==
X-Gm-Message-State: AOAM5305mgeEa9srZzs4EHKj5sA6XsiAE0dwM76SaTRYFcDWEsY40u/K
        8dp7fhl9WuFWVzjJWb4Fb0I2WQ==
X-Google-Smtp-Source: ABdhPJw4UsERiDhtcG0b2xJBuujJ6l9XbiExiLHHzQyIyK+f8ZV9QE+eiQ5BRPCmmX4+DR69wuzJ8g==
X-Received: by 2002:a63:5fd7:: with SMTP id t206mr4351815pgb.54.1614281903210;
        Thu, 25 Feb 2021 11:38:23 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b942:93a8:e68d:5a90])
        by smtp.gmail.com with ESMTPSA id a19sm6589062pjh.39.2021.02.25.11.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 11:38:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b666817f1c72278a5b839437ea2e5c26b587ec36.1614244789.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org> <b666817f1c72278a5b839437ea2e5c26b587ec36.1614244789.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 4/9] dt-bindings: mailbox: qcom-ipcc: Add compatible for SC7280
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Thu, 25 Feb 2021 11:38:21 -0800
Message-ID: <161428190108.1254594.7303165586666029690@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-02-25 01:30:20)
> Add IPCC compatible for SC7280 SoC.
>=20
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
