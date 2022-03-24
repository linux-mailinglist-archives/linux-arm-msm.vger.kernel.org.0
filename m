Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77DA4E69AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 21:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353235AbiCXUND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 16:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346425AbiCXUNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 16:13:02 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B852AADD40
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:11:30 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id w17-20020a056830111100b005b22c584b93so4070131otq.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Nwl7eXrzEg6HjQ0pYoms0bj2n7ydxw/0219nabhE8y4=;
        b=Wz0LWT+bpc8idvDVCgb6SFc2Qi2G93X+M2YY2fmhP9lnDZhmtWQOdp4XIrYFnWJ+Xu
         1OjtvVD0C/QQP7xsv+SWY+cmKVJxaXRGRdCXufF7zTSjf3c/r4bHTemM7ZPM68WTenoz
         +jo3wpYPoEeOGQv5SN5A6G6nEfuoLns2S94Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Nwl7eXrzEg6HjQ0pYoms0bj2n7ydxw/0219nabhE8y4=;
        b=ldcMWBRk40Y3O0/h3Q2ngLDbaNyWuaOrJiddX/+lfeKZorOLIzOWqm68rZ+q/pKb5d
         h2EiJ5b+SNT0rbABy2sg6pqjevEK4R9nchRkFPz1rjKi9u/WPGiC7FZn81df/DCRBnSu
         8FDO6/OWvBRbXZJINnSLjS1O+m8YiuEFvPUuWtBbTQSMywlHeXYA11umouUiawoMC27t
         0xVmNR72XzWZ1DndqdnI8FGRJc3yIOb6WxZvf5MZNMwvdoURWYx0Y35EbBK/v5KtJYYE
         njunmU8V9PCcaDmqvAhbiNN6MQgYaVY7Z0rGoxXRo0iqurcNw8bDso2Pqpj2b19B+ngn
         f3BQ==
X-Gm-Message-State: AOAM533+uBDNClPnVGWkV2UPncF4Fel3fn4rNP6SxnA3WUbBbrYiB/wb
        KuqrzjtjthajKYVBtU6oHHB307119qXH6zVNCX3UNA==
X-Google-Smtp-Source: ABdhPJyKdYuuvj+Pf/ReQ7CF0NIUyrpos1BaPLUZKxrc3wD7UER0DcKnAzcQcQ6rpt99A3PFhj4W1tAkEzuQMc1hO74=
X-Received: by 2002:a05:6830:61b:b0:5cc:e44:7dc3 with SMTP id
 w27-20020a056830061b00b005cc0e447dc3mr2866148oti.159.1648152690112; Thu, 24
 Mar 2022 13:11:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:11:29 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org> <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 24 Mar 2022 15:11:29 -0500
Message-ID: <CAE-0n53namcRm+kYBbt+ytF5iQQKNpLDq7u+Nzsf4gyk_e+emg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: simplify dp_connector_get_modes()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-23 03:35:45)
> Since dp_panel_get_modes() handling for dp_mode was removed,
> dp_display_get_modes also doesn't change the passed dp_mode, drop the
> unused dp_mode variable being allocated unused and then freed.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
