Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF8C3D03C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 23:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbhGTUfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 16:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235929AbhGTU3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 16:29:47 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C748C061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 14:10:21 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e14so9296752plh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iPLLJNllretlsCYSinbnRj7C++Fhv0zvpc25JToQyOg=;
        b=Rz5apqxo85l0olxLbgekp5Uxit+gY0ong++/SmfwhIQCi5GFWTfd6XQmxsGYLLI8jZ
         ALM3OerFRMaEDv1M/Xh3x1BIhjfVY9BDp4qLLCc4VQs/fRB6iUR8aFnPbEuiATs7sIg9
         bEW+kve6hKmbd1hdEZp7C7IONST3pQQH+E4fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iPLLJNllretlsCYSinbnRj7C++Fhv0zvpc25JToQyOg=;
        b=bcxWyLFzDlaGzarcbYWqUWiBxNAy5bepRZhxP98veAFrHdO4CwThRk/K54kFJKyjn/
         fpiyBnrj8tztw4rlLZVtwRISHbv3Hxy3V3AjK3YLxTrH7Sw/P748vn4pVSH2sVU6IN8Y
         I+WQBWU5EnHEp4457W3pxCPvMDlfNXrRMv7d1P008RLr9aLyV+pMCPhNrPAFPSBPaOea
         2clrq3SPB7tu1elbhiPvqe1wxFvxoZPdBqQZCb11jG3+96eW94MknnQWWaNU8oZ8pXQi
         cZfWZ+oWRY7h0hyRa1zoat8wUw1pePRz+YFjjEZHK5jLnF/PYHY9leDACPkEG1x8TXx/
         RuYA==
X-Gm-Message-State: AOAM532+9u08N03ju8eGKYqlPQO0IVyuhu7upzXh6Z0G59mrJ7ZHaChx
        KGjwLYiQggtc55ith0YZsNChtw==
X-Google-Smtp-Source: ABdhPJzu7JcPGOKnCGpaQdLaXwgf4J/KFtla0/QwS8D48x/nYI/Ftq3D/6P9RfLFqDgzRflg87PJlg==
X-Received: by 2002:a17:90a:df04:: with SMTP id gp4mr351635pjb.164.1626815420908;
        Tue, 20 Jul 2021 14:10:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c9c3:db46:7281:8e32])
        by smtp.gmail.com with UTF8SMTPSA id f3sm20576515pjt.19.2021.07.20.14.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 14:10:20 -0700 (PDT)
Date:   Tue, 20 Jul 2021 14:10:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v4 01/13] dt-bindings: soc: qcom: aoss: Drop the load
 state power-domain
Message-ID: <YPc7uoyHhGUj8hu3@google.com>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
 <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 20, 2021 at 10:06:35AM +0530, Sibi Sankar wrote:
> The power-domains exposed by AOSS QMP node are used to notify the Always
> on Subsystem (AOSS) that a particular co-processor is up/down. These
> co-processors enter low-power modes independent to that of the application
> processor and their states are expected to remain unaltered across system
> suspend/resume cycles. To achieve this behavior let's drop the load
> power-domain and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
