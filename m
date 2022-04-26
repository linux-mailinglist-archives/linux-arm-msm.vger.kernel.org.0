Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1642510AEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 23:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355279AbiDZVF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 17:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355244AbiDZVFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 17:05:53 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C619F4C7AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:02:36 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id n22-20020a4ae1d6000000b0033a6eedbc7bso12005oot.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qEtkFZetJ9a17spXA9ebo0ZoaMU6GomnRunLZuYIOzU=;
        b=ejvOCooKk+1oqQfD3u3HSZmGlPCV7W/7UHbOQUFeBT9ekTYMsnuXtulu2IPWAAP6W6
         Ncjxa60Mq+Sw8k16LWMCIzE+jGgAY/4Z8elCvJPiqEEq+saLPXJ43EMVEvN+DaMCJAxY
         8uRRMBpjBXa/7K8PpMQHfgHbxmVg6vxOog1KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qEtkFZetJ9a17spXA9ebo0ZoaMU6GomnRunLZuYIOzU=;
        b=voSQrctnhqDviOIQODnxsyVBpw2iEtAApsEfrNqnFO2x4VCeB6qgpw1vOw+oZSNUu4
         TY5Sf8t+ncRWDJbRZfDCIy5YwujAwPaA6wanajAqlvaX3HzcalQm1GoATaR9xDL3jiIM
         X92Dkyo+jrRnMDPdNYwvJ+t1Al5Z68OvYM4ZHRkKuzh27ndyAEJ7c1NzcR1QltTn26tj
         NKo25QgBO4+v8gxewHLn93bGkCuqZypXuBJHm23Qr9IJhRNC80T0UcU3/cADnXLarL1w
         dXMvnJygm9J6GSoYBv1dvO0y2PvmRIZLfoTNQ71xQW81wp2jxmrUCzbGeELnXY6cfVvA
         N4Cg==
X-Gm-Message-State: AOAM530mj7tF1QSRis/cRz97op4rclJiq/eRS8Ldv8gj8RvAULwSSFTS
        AZkFJhT7aKLcqq/gtZNfeuyGHtqgnzcIgfRGEinjeA==
X-Google-Smtp-Source: ABdhPJyX2tt94IZxxiwugK18OZhd/mYokzmjPf3b8ISvStP3OxlWQq6CasrPDDXe+J9Il7UXag8gxagXYu8XR+2uZ8Y=
X-Received: by 2002:a4a:6b49:0:b0:329:99cd:4fb8 with SMTP id
 h9-20020a4a6b49000000b0032999cd4fb8mr8908758oof.25.1651006956146; Tue, 26 Apr
 2022 14:02:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 14:02:35 -0700
MIME-Version: 1.0
In-Reply-To: <DM8PR02MB81025CD159F1B2158EAE979CF0F49@DM8PR02MB8102.namprd02.prod.outlook.com>
References: <20220202053207.14256-1-tdas@codeaurora.org> <CAE-0n52T9Z+LS3KMVeSBsad=Em3e27J=rEzHTB0WS-b5M=owFQ@mail.gmail.com>
 <DM8PR02MB81025CD159F1B2158EAE979CF0F49@DM8PR02MB8102.namprd02.prod.outlook.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 26 Apr 2022 14:02:35 -0700
Message-ID: <CAE-0n50nsMOqekDqrg+n0A8mP9BVS10DEbMqDSESyHTD4sSQVA@mail.gmail.com>
Subject: RE: [PATCH v3] arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio
 clock controllers
To:     Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, bjorn.andersson@linaro.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (QUIC) (2022-04-21 10:40:28)
>
> [Taniya Das] Sure, I can remove the node which should be the cleaner way.

If the node is removed then the driver should be removed as well? Did
you send a patch to do this?
