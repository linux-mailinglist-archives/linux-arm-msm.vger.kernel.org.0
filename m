Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120966DF9EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 17:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjDLP02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 11:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjDLP00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 11:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F047FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681313140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qYKh8FdFO1QSNtMcyFw/EOs8sZAgGQFCkTPMptXscZI=;
        b=FayxsU/WujXgK+tZfyU0zpa9dSuM/yJ0tbpZRGPzOML61gtGY0GaJ0KnDF6tj5+QZZF7g1
        cwoJUcTDoorP1lfWsNlNm7+EdXx7A9Rs6vMUXMAgpaeAegVFpXiUXRQRm4SU1rFcwJPi5w
        uHElLLROGG023V3t4SqSyABq8403ppE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-xxFL-wqSN1WibGWFFNo7OA-1; Wed, 12 Apr 2023 11:25:39 -0400
X-MC-Unique: xxFL-wqSN1WibGWFFNo7OA-1
Received: by mail-yb1-f199.google.com with SMTP id n14-20020a25400e000000b00b6d6655dc35so12546242yba.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 08:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681313139;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYKh8FdFO1QSNtMcyFw/EOs8sZAgGQFCkTPMptXscZI=;
        b=kRMOKrHKM+tLeNHiyHGl363gy9eS+gV9++9aX4nziQHLGngboBNmfuLMpK5i00IZzS
         KiXfrGpYquLjFkx0MzbQTWy5EgXQ786NcT8kFXPK1jVbE3Ym07bGMYSrr6bps8mcW5B9
         IkjSyLvb9Dq+0OBawoRHmicSG4w20MACP+UnXRLRlY5KZsW0QkxTUtV+jWFUdlShreHQ
         Vt4zSIXnlqMrYIXdnMjb1vGEF2CXAejUxQowNfbc2UpsFO3MFh9ERs0hMxPJATBfYwd8
         v/6ne3Ht7y2zqYxhm8Q0H/AjGiO4VCpUGTeobtMXdu0q5nYKpni433bTzDtTxoGodhyu
         hVrw==
X-Gm-Message-State: AAQBX9enMRLRgccNK/WzZa4jDIS4g50M4kog3HxtSmke4Qp5xgiEpEFl
        wsyhmN+8RbfmjYrg27WS+d29GfaNYAziJUbOt2lFwF78FhQl8hnjJpzhWtryJwdL58Y08IFEeoK
        mOnyWPbtC3zXv5cUi38DIfC1XqQ==
X-Received: by 2002:a0d:e543:0:b0:536:eace:3a77 with SMTP id o64-20020a0de543000000b00536eace3a77mr5537535ywe.40.1681313139013;
        Wed, 12 Apr 2023 08:25:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQJ4oa7t3dVS8AqwS5Qn+O71awkukNvK/6B1mDWaGqRW2D1r9R25FsfDQKlgi+zts06ET0Cg==
X-Received: by 2002:a0d:e543:0:b0:536:eace:3a77 with SMTP id o64-20020a0de543000000b00536eace3a77mr5537524ywe.40.1681313138788;
        Wed, 12 Apr 2023 08:25:38 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id q63-20020a81b242000000b0054c0c9e4043sm4252004ywh.95.2023.04.12.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 08:25:38 -0700 (PDT)
Date:   Wed, 12 Apr 2023 11:25:36 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        echanude@redhat.com, ncai@quicinc.com, jsuraj@qti.qualcomm.com,
        hisunil@quicinc.com
Subject: Re: [PATCH v4 0/3] Add EMAC3 support for sa8540p-ride
 (devicetree/clk bits)
Message-ID: <ZDbNcDGIbJrm/x6L@x1>
References: <20230411202009.460650-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411202009.460650-1-ahalaney@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 11, 2023 at 03:20:06PM -0500, Andrew Halaney wrote:
> This is a forward port / upstream refactor of code delivered
> downstream by Qualcomm over at [0] to enable the DWMAC5 based
> implementation called EMAC3 on the sa8540p-ride dev board.
> 
> From what I can tell with the board schematic in hand,
> as well as the code delivered, the main changes needed are:
> 
>     1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
>     2. A new programming sequence required for the EMAC3 base platforms
> 
> This series addresses the devicetree and clock changes to support this
> hardware bringup.
> 
> As requested[1], it has been split up by compile deps / maintainer tree.
> The associated v4 of the netdev specific changes can be found at [2].
> Together, they result in the ethernet controller working for
> both controllers on this platform.

Looks good to me!

Tested-by: Brian Masney <bmasney@redhat.com>

