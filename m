Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54008363304
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 03:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhDRBzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 21:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235958AbhDRBzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 21:55:51 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B538CC06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 18:55:22 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lt13so7145464pjb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 18:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7GHsdqrlMVflwVFrBOZtxuiC9SiSpOvDXhaAOahe690=;
        b=CMVMP8Q/+Xb+6lLEo9IsIPV1yw0R8pfENjultUzDJgcn7Ad5M7Hl4kVykdVCG/AumT
         rJiYzWdP34nyTUUDLzKWoByJgT/l2GCb902Q0KBvGMfy2/NbN5wOLdUYgDR3n7Terytp
         8fYhe304sFweYIvO2Grxwq+8cTyHAilTH6LdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7GHsdqrlMVflwVFrBOZtxuiC9SiSpOvDXhaAOahe690=;
        b=hfVdXuCXWBktXU0XiS7zksdFWDLge4VyktgM7uCttgyROg2h6yAj+hCvxFis4jIu51
         hEsHcW6PFQGZBKyufTL2Asoi/7CFemJsggtswarqKCBodXC1eDa509ztu27lxaOtAOeT
         dlwoqLyjNkERHPqCip08kQyiTcbLPE6LInJU95ObKAMQi7TNtmNfdN7+53+QNdHThCCw
         iaB/Cp1NYSA+ykTxMCt5mGd0HSpNSQ31KMcjU9EJHzj3KbN/INIGRlMRz3zwVwRKjrbR
         W68xb43tcIFh3+4eEHdfU30bavRZl1n7RfUtKiQo/F63bv7YMOjOM8lP2ZdfLc0Rg/mB
         wHHw==
X-Gm-Message-State: AOAM532NRx/TqVg1ceg0MuGTk5t5ycNp3P122YeRVdcgzeWtT+V+0p2v
        zjj7NXjtFrglMpKnVFCgxNU24w==
X-Google-Smtp-Source: ABdhPJySFT82Ji4WeOETkW1pVIcayA0AhD90jgCrrz36SWCnCOPXEJvmQAh7o2rYCibfHOIBRmEQFQ==
X-Received: by 2002:a17:90a:c281:: with SMTP id f1mr16948378pjt.58.1618710922403;
        Sat, 17 Apr 2021 18:55:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id gj13sm9990868pjb.57.2021.04.17.18.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 18:55:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-4-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-4-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 03/12] dt-bindings: remoteproc: qcom: pas: Add QMP bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 18:55:19 -0700
Message-ID: <161871091962.46595.17643804074579935893@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:49)
> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
> exposed by the AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
