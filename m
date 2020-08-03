Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E367E23AE3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 22:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgHCUgI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 16:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgHCUgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 16:36:08 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B28C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2020 13:36:08 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id u10so12059913plr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2020 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2F9ZF9htCdgTGnye4Ms9Eo2tsmXq4m2N8BAkR3A5B7A=;
        b=nZAzQ4lE0whX3zEtFjMirYy1jTai9LIRNYptpFNQIjCWo8AAOs4xmbPjE47De0a5qx
         1EsgPv4wgg6wXYETK8ViL/AzUXsH0cNoEImvMSnZiOq02tskOrt+G4T0cyrI4nLxG2b2
         CIrG6txBS/AZZTrHr4aFKtBTbweOV0V/mcOSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2F9ZF9htCdgTGnye4Ms9Eo2tsmXq4m2N8BAkR3A5B7A=;
        b=mC63OhxeampBiZCLe4GNgAGh7n0DREHNSs6WE5M+nvTzQhMU3ArkcACtYMlaE3XFAy
         QUAswhq9xYefhKYuKuyUVyeXs7DDCCUUKht0LP1VRELBlnqsxKQZwlFqLJIu/fkvpTj0
         QNZdl5HmfvtEo9wvnzuTMD38IFkoUIt1oKwVEfqWI+NN6gLCWtukieprAZch/dRyB28R
         vWCXwelMaF2kg9LY+ArWHDGmUvT1N+s7cLPMRoZcyLi7U4FeqadX0qTbM75QkG5Umy+E
         zK748HW1Blc34knIpHBRqtmiOOqSP23s3Ket4AbYwQzY8gqi/jX8X+cV5hJizSEwCL/e
         K71A==
X-Gm-Message-State: AOAM531TVhJT7KysUvrZs8ZS+BlD4k7atiqJrQtrOZwzjf5KG0wx3vSE
        TNYGJM/wuun6Sf6tdnmuO3IHhg==
X-Google-Smtp-Source: ABdhPJz6G+AwiYfQgKC8q1npJesqLu09L06PpCrBEdD/xFikahTomo49EV8Rt3o/r93GMMO1xhUHiA==
X-Received: by 2002:a17:90a:4488:: with SMTP id t8mr1023030pjg.191.1596486966811;
        Mon, 03 Aug 2020 13:36:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id na16sm336058pjb.30.2020.08.03.13.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 13:36:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
References: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv3] coresight: etm4x: Fix etm4_count race by moving cpuhp callbacks to init
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     coresight@lists.linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Date:   Mon, 03 Aug 2020 13:36:04 -0700
Message-ID: <159648696483.1360974.2828241668912900602@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-07-28 22:13:10)
> etm4_count keeps track of number of ETMv4 registered and on some systems,
> a race is observed on etm4_count variable which can lead to multiple calls
> to cpuhp_setup_state_nocalls_cpuslocked(). This function internally calls
> cpuhp_store_callbacks() which prevents multiple registrations of callbacks
> for a given state and due to this race, it returns -EBUSY leading to ETM
> probe failures like below.
>=20
>  coresight-etm4x: probe of 7040000.etm failed with error -16
>=20
> This race can easily be triggered with async probe by setting probe type
> as PROBE_PREFER_ASYNCHRONOUS and with ETM power management property
> "arm,coresight-loses-context-with-cpu".
>=20
> Prevent this race by moving cpuhp callbacks to etm driver init since the
> cpuhp callbacks doesn't have to depend on the etm4_count and can be once
> setup during driver init. Similarly we move cpu_pm notifier registration
> to driver init and completely remove etm4_count usage. Also now we can
> use non cpuslocked version of cpuhp callbacks with this movement.
>=20
> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup in=
 probe() function")
> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug state=
 machine")
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
