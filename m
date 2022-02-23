Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0004C1DD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 22:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbiBWVeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 16:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242876AbiBWVeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 16:34:02 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3FE4ECEF
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 13:33:34 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id i5so453925oih.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 13:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=QeXjVrsBd2xyaX1fRJaTjrZFWoYw6M95k9VES1X7evg=;
        b=F8GR4eOAQdUqj8xaPWZ5qOSFdkWgvYEYKqpoEZk+xnLsYM5YSI168fW9lNpJQ3I6eg
         xGQbFIIR0qKbCZCZ7r5ZTROq59hxodBtBtt/NZyGXrBB10nuHyNFaS1Y8KkKuC5A88L/
         LeK2D+4fvQtxKD3HWSnwj13iqsyZj8cd6rKf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=QeXjVrsBd2xyaX1fRJaTjrZFWoYw6M95k9VES1X7evg=;
        b=z8mXTE9ph/ddPzeglUpa8tTTfIoOi8rVavO/ty3MYcBkqUHK2+TraKHN2uej21T/rG
         c5aXqBP1dlvhP266cGb09J+BVyld6/4qcL7V7hAnAlTI8mVSsbrn2LU8dD89/R8RpHpC
         vQ2DIIJRCxoa3oNpmI2EIgPZQoKnlFuifbA6g8e8zgglgzvsBvr7vJBjMI44sBPlT2+f
         uA2mjPBa4r8hQT0cohmNliumhg0cW6/60JJ5VFucrcFWO/YGCKG+01F7ZRFdvRn76RvW
         MPK/HXUHOaFVX9daQzzAvA9642kCSvBekjRoF2GaYTczVpLDNR7sCL/WmTlE4ipFbkoM
         mgiA==
X-Gm-Message-State: AOAM533fv76Gui8zgqaAGyzOtfDR8BhwwD0+oazUkW3E9PACSpMXbxu3
        8ZFqR2BY07p0X4r8jUSm4ASpvKGB9regReU0qU9jB0b6N00=
X-Google-Smtp-Source: ABdhPJwMsBuwNLFN0DBErvCeoCglDEp1SX7tXlUppHD/4h1YVd2LnidJwPJVI5P14E867PxLF7abnNOt8Xa11rmPXQ4=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr946625oiw.112.1645652013614; Wed, 23 Feb
 2022 13:33:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Feb 2022 21:33:33 +0000
MIME-Version: 1.0
In-Reply-To: <a803c7a9-de4c-8fe5-d80d-56366df78611@quicinc.com>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org> <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org> <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
 <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
 <7f9e2181-bb1a-c734-2e90-c5922952acb4@quicinc.com> <493749c1-6305-1a94-4e05-519c825e9d4d@linaro.org>
 <a803c7a9-de4c-8fe5-d80d-56366df78611@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 23 Feb 2022 21:33:33 +0000
Message-ID: <CAE-0n50VWH9Mum_W9e+6X1vjxvS3KWDqBtPfKHL-weA7S+_3Hg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with drm_bridge_connector
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UXVvdGluZyBLdW9nZWUgSHNpZWggKDIwMjItMDItMjMgMTA6Mjc6MjYpDQo+DQo+IE9uIDIvMjMv
MjAyMiAxMDoyMiBBTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPiBPbiAyMy8wMi8yMDIy
IDIwOjIxLCBLdW9nZWUgSHNpZWggd3JvdGU6DQo+ID4NCj4gPiBJbiB0aGUgcGFuZWwgZGV2aWNl
IG5vZGUuDQo+ID4NCj4gPiBDYW4geW91IHBsZWFzZSBzaGFyZSBpdCB0b28/DQo+DQo+DQo+ICZz
b2Mgew0KPiAgwqDCoMKgwqDCoMKgwqAgZWRwX3Bvd2VyX3N1cHBseTogZWRwX3Bvd2VyIHsNCj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1m
aXhlZCI7DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVndWxhdG9yLW5hbWUg
PSAiZWRwX2JhY2tsaWdodF9wb3dlciI7DQo+DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjsNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWd1bGF0b3ItYm9vdC1vbjsNCj4gIMKgwqDCoMKgwqDCoMKgIH07DQo+DQo+ICDCoMKg
wqDCoMKgwqDCoCBlZHBfYmFja2xpZ2h0OiBlZHBfYmFja2xpZ2h0IHsNCj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOw0KPg0KPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB3bXMgPSA8JnBtODM1MGNfcHdtIDMgNjU1
MzU+Ow0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvd2VyLXN1cHBseSA9IDwm
ZWRwX3Bvd2VyX3N1cHBseT47DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5h
YmxlLWdwaW8gPSA8JnBtODM1MGNfZ3Bpb3MgNyBHUElPX0FDVElWRV9ISUdIPjsNCj4NCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0K
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9IDwmYmFja2xpZ2h0
X3B3bV9kZWZhdWx0PjsNCj4gIMKgwqDCoMKgwqDCoMKgIH07DQo+DQo+ICDCoMKgwqDCoMKgwqDC
oCBlZHBfcGFuZWw6IGVkcF9wYW5lbCB7DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29tcGF0aWJsZSA9ICJzaGFycF9scTE0MG0xanc0NiI7DQoNCklzIHRoYXQgc3VwcG9zZWQg
dG8gYmUgc2hhcnAsbHExNDBtMWp3NDYgd2l0aCBhIGNvbW1hIGluc3RlYWQgb2YgYW4NCnVuZGVy
c2NvcmU/DQo=
