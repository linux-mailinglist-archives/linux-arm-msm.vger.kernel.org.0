Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02DDF1743AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 01:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgB2AK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 19:10:59 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41113 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgB2AK5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 19:10:57 -0500
Received: by mail-lj1-f194.google.com with SMTP id u26so5099484ljd.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MtiiDQqIKSwOiG748ha0RsiYW64G2u9tJs1YfUEZ07M=;
        b=LkkYFkw5qXgxsxLKLRdhuf8VX9Bm0uJFBVYjbOycmkZ2HF5N7EPXaXp5qIFbwJMFFF
         bM92NEf1nz9sxFZEyqdT+8QdTXebCc1ff7rExRiLkcCgeGCasdpJNEtXqrdlGddyDURt
         r3D0Q3/kz0FrTEkQJfssCDRmWawC7m+DPFZws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MtiiDQqIKSwOiG748ha0RsiYW64G2u9tJs1YfUEZ07M=;
        b=rfZTgRS3uOyi55TezEMjCE6WLITDCLEXWxOzdPz6L9KXi/tC2NcZzeAAjVmNbc+USO
         hEvpHInEuIUOXVAW74oxqadEcHgVIjmK1OAIl+YjzDHcDlAHQMXI/tJPE12R9J3NxFhJ
         qEHOX9sS990O37HhwWnw220jfSixgoS4wM06gOxUOE3OvJNfQ/aYnoxAmwB0S/S9CU0r
         2gQd7X3gsSC5Gu6aX2Zbhsmlu2TauYOMeP+IpDUi9QNXPm1OnppEzBSMnWlYY/5/r+W0
         HTflzPlCYoyvrthBT2PHjFbvZhVCGD7m68TaxXQIkpGICXhJJ3HxPwpkpTW97xrNYfe/
         evcQ==
X-Gm-Message-State: ANhLgQ3DiXx+y6lqV7cEt+KNkVZDfzimfgitFpz/ODgBSTm3CwUdadpV
        O6FX9ysjcUVOE0Sz/cr/MrDlhRHdk8A=
X-Google-Smtp-Source: ADFU+vsqUIz1rPsLl9Ti9fJjAHqd7NG0o4L8gItopxOyFvcooUojm3fhcH2M7DXD/LlzTdeD+fGZtQ==
X-Received: by 2002:a2e:9f49:: with SMTP id v9mr115110ljk.62.1582935054598;
        Fri, 28 Feb 2020 16:10:54 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id h14sm5899074lfc.2.2020.02.28.16.10.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:10:53 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id y17so3361797lfe.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:10:53 -0800 (PST)
X-Received: by 2002:a19:8585:: with SMTP id h127mr3874662lfd.196.1582935052501;
 Fri, 28 Feb 2020 16:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-4-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-4-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:10:15 -0800
X-Gmail-Original-Message-ID: <CAE=gft50mTp6-u-Dw5wzL=1GGTsZB+HoM=5NDSNxnVVwVfA51Q@mail.gmail.com>
Message-ID: <CAE=gft50mTp6-u-Dw5wzL=1GGTsZB+HoM=5NDSNxnVVwVfA51Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 2:57 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
> resources of scaling L3 caches. Add a driver to handle bandwidth
> requests to OSM L3 from CPU on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
