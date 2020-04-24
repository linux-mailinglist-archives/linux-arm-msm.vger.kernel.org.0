Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821231B6B72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 04:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgDXCiy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 22:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgDXCiy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 22:38:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EA0C09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:38:54 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so361046pfx.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6++NSo7nhleVNv5D1a6ojdhyb5jaFfFZW4dq4b5kgFY=;
        b=O31mWV5/EXtIMVB1mhcNN22IKFHhi+5jDB6Qx13ctjtqnvxud2SS6QSRQDBj12wb6Y
         GMb41qjyVpuZcFQS9J2Bt+QA1h9Z1ehS7JGrWOvc3x0dg6PgJJTA1BjR09m3gYp+U/H+
         DERxwZlZDUtbC18gx87qU5VzGBXCiFUl3JWQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6++NSo7nhleVNv5D1a6ojdhyb5jaFfFZW4dq4b5kgFY=;
        b=rvkgyuRhS09cQGMYZ2q7+SFHaH2aD5veSeeRs3RfIPlv+4e1g88IKog97vLLN8sbYi
         4K7DIyu5anBBp4TSo8b8fupU9HuBpZodqjGj2wbZcfMK+/4/33me3TuQjgn+rJvNg0CE
         CCg2kFIVwJKaJ08K34FNqU/jROkQaqymxIxcHccdbaqNtzJHZizzjtBVFRggyiL+W9xG
         Lw50LQyNIQYkZ8iQbYnk+DCXBuF0yo9Nrm2l/LsGynyIKTMs/v44sBfdlVtIhM5sLsjo
         vh0RvflRiXAiGw/d0+0zVEJO6bNAIAdeyiwn7FhtQWIDuwaYcjaCrGWdMfjBJ6wc2RqE
         KK5w==
X-Gm-Message-State: AGi0PuYSsT8SmKa22r+4bMLSTx09FyjiwnZHraX/XCkAcUW+DkJjgCUb
        vFcUiSpAwqNlU1bBpXt445y2og==
X-Google-Smtp-Source: APiQypL5a3shosB0ICD9UKcXZSEjuuZRkrKUjGULwCTOR7fGOZo/bTzItraHZurz1nElZT9c5lwLfQ==
X-Received: by 2002:a63:1d4c:: with SMTP id d12mr6991045pgm.247.1587695933525;
        Thu, 23 Apr 2020 19:38:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 198sm4184312pfa.87.2020.04.23.19.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 19:38:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
Subject: Re: [PATCH v4 1/5] soc: qcom: rpmh-rsc: Corrently ignore CPU_CLUSTER_PM notifications
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, mkshah@codeaurora.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com
Date:   Thu, 23 Apr 2020 19:38:52 -0700
Message-ID: <158769593201.135303.16055600803132525490@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-22 14:54:59)
> Our switch statement doesn't have entries for CPU_CLUSTER_PM_ENTER,
> CPU_CLUSTER_PM_ENTER_FAILED, and CPU_CLUSTER_PM_EXIT and doesn't have
> a default.  This means that we'll try to do a flush in those cases but
> we won't necessarily be the last CPU down.  That's not so ideal since
> our (lack of) locking assumes we're on the last CPU.
>=20
> Luckily this isn't as big a problem as you'd think since (at least on
> the SoC I tested) we don't get these notifications except on full
> system suspend.  ...and on full system suspend we get them on the last
> CPU down.  That means that the worst problem we hit is flushing twice.
> Still, it's good to make it correct.
>=20
> Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty cach=
es")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
