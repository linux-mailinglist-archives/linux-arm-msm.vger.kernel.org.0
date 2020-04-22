Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C831B3F02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731195AbgDVKda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729736AbgDVKd3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:33:29 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3FBC03C1A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:33:29 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s10so777753plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=3XIGZouvYh+rdqKpGPlhY0A3zplshUQshCiuW1z0Fm0=;
        b=OroIEo2pxba4gr0tsT1jLqWC23fjBzJTimQwB9Axn7lbyljR3+UTYxvbK+bg/jfvoj
         zpmsjYAiOtOpvNZJ5YM3mvg129qQ8O6ScLc4x+BupjaEn0Vj2DGRsxZXKhEmj1a3eLYe
         e5DWBvgnCMfhF2tj6u+bWxLeRaIl8bGpgvFLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=3XIGZouvYh+rdqKpGPlhY0A3zplshUQshCiuW1z0Fm0=;
        b=ZwIEPuQmOm/4TZXINYC7MMPwVGb9z/yWtFKGvkPMLqnuoMURdr6QEc7wpiATxs6ofG
         yNjmG8fNCVI4MrIySI4G3cnqQKdZ47Bj6a0KGHIb/z+1ZujwVYeF0K83CUKLmHwf50bY
         SuYiHf5VqRs6bp5jDjpFon8ZaA6JJ6kdNG9MyMSNU4lF8SWXKxoM//f6syw43rNCm0ev
         MtzMp3vhzYibaMgS89P6/wJVnbm9Y1iF/BeZNxcvjFHx0CSuD57Wjh8tk5JZaPol2TMd
         vKzwtRNrJT48/0UK60hFeJMdu7oIZgT+woWF2+4619/iY3PMPDzmLwoikdK2+eZLnAuh
         ncog==
X-Gm-Message-State: AGi0PuYUYtklLSLyEMD/QFlg4B9FusBzXPl4WTsOeLQpEdFUdH+/AJLx
        mDRa8iEhHvcklldkp8Zu2g9BfQ==
X-Google-Smtp-Source: APiQypLMsLCwNYw2W3WRKMiDhv7mlWTPpb3vt1ZnWuWcCzDQuh+O3OakzilAgwJ3En97vlFAATzJWA==
X-Received: by 2002:a17:902:ba86:: with SMTP id k6mr26705713pls.47.1587551608817;
        Wed, 22 Apr 2020 03:33:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 71sm4959579pfw.111.2020.04.22.03.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:33:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200421102745.v3.3.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
References: <20200421102745.v3.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid> <20200421102745.v3.3.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
Subject: Re: [PATCH v3 3/3] soc: qcom: rpmh-rsc: Remove the pm_lock
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mkshah@codeaurora.org, mka@chromium.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com
Date:   Wed, 22 Apr 2020 03:33:27 -0700
Message-ID: <158755160722.163502.9129728895530548942@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-21 10:29:08)
>         case CPU_PM_ENTER_FAILED:
>         case CPU_PM_EXIT:
> -               cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_=
pm);
> -               goto exit;
> +               atomic_dec(&drv->cpus_in_pm);
> +               return NOTIFY_OK;
> +       default:
> +               return NOTIFY_DONE;

Can this be split out and merged now? It's a bugfix for code that is in
-next.
