Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF0C26E6BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 22:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgIQUYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 16:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIQUYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 16:24:05 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40958C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:24:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id l126so1942805pfd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Y15QcIETYm6ngkpuByc2eOU1bHtS654RIW5hdF3Ee/Q=;
        b=VcFgg1EZvwsjCDOmhPiRhbVaiHwozPO7Kc9+hfI+MexSyGltOo3YIrHOozSeuPvW/O
         zjljE49v1xgevlIC0ZKE5gK43cXgqO0dWpNPBZxSq4xSvte0hBDZfwpMLV8/SRsWN7RG
         Noe3lWZLFjFAt5lC6J40ZJ+LVN717zPgdZ3iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Y15QcIETYm6ngkpuByc2eOU1bHtS654RIW5hdF3Ee/Q=;
        b=n91MMqrXChIBdja/aCsCFLtwYsADljUikXhfWScPFQWU3aloA89oM2tMKD1wjqQ5jU
         aWOSWDYmoCVmR9fxHtCLg7B3QfT9jlkDWpdKMppEckxo/6KQ8VCP1RZtBUSEfIlxoxrn
         53bXslqcGsRuBDgTuCAtmOfeMhgGCiWPv5YlPLIrxnGBJngTcZ3FAiarnnEUOQGx3nN/
         1HLFfqYPAWYSnkQDMMfpqOzwApbL4BBJwI3o2+xq4f3m6Kg/RJBgFr0M5wYvAHRdHKbZ
         eFjWLUudHe+wf+Q8hPhK9UzoQmH78nxANhcNeRNxzdNpgrMMFAn5HRkI46AzZqvzK+Sn
         B8LQ==
X-Gm-Message-State: AOAM533wEPb7fobe0fgAl6zZMoy95HiDkjfjJa2YQ7Yk7D6gjUVbeHti
        lq9Cl4S4SARXearJrt40Wdvo/A==
X-Google-Smtp-Source: ABdhPJymERk4+ShGKnpMeflbqL0wLv3UlHTFXqoq2y2SDZrXW5p/p0MvIYpcAYQWyfHadZWDgnickg==
X-Received: by 2002:a62:3802:0:b029:142:2501:397e with SMTP id f2-20020a6238020000b02901422501397emr12386540pfa.67.1600374244006;
        Thu, 17 Sep 2020 13:24:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 63sm483468pfw.42.2020.09.17.13.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 13:24:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200917175840.18708-1-sibis@codeaurora.org>
References: <20200917175840.18708-1-sibis@codeaurora.org>
Subject: Re: [PATCH v3] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA boot
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Date:   Thu, 17 Sep 2020 13:24:02 -0700
Message-ID: <160037424219.4188128.6572428223281418741@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2020-09-17 10:58:40)
> On secure devices which support warm reset, the MBA firmware requires
> access to the modem region to clear them out. Hence provide Q6 access
> to this region before MBA boot. This will be a nop during a modem SSR.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
