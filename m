Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78F079F763
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 02:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfH1AeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 20:34:15 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41774 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfH1AeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 20:34:14 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so383402pgg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 17:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=wfY3pPoLu/G8j6OZRrvOneOEKSDLuvd6pDTGUkOKnEU=;
        b=iqbxB8mDnjuK0hsAW0f4mrYZFB528Ok3zsh4ljqaDoWEsNUy+7pPX1eI7t7eTaF6T0
         PkL5oZyyu21tQOVPSp0umq0KNvZfuPxgsywSmGDxmKUOb+mHl77Wr6IsTC9QIQd4wYJ/
         kRdAMIIJonTqHGhK+oUrcQ+oGfJtk2si+7rAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=wfY3pPoLu/G8j6OZRrvOneOEKSDLuvd6pDTGUkOKnEU=;
        b=RvYQCCPrxV7kNI1rAUqkAwFuzNjUCE3MA8ojkSk7lLLojuIU40XIHSgPSKrqJYXIfw
         sB8ClBby5hniHI00Admh4SCBX8KKjRe2BnQmtIg6JGHHCTMzAUAqBoRavbPepJyMgS88
         36NTFh34BBe3rXIrg3LbwEn4LF1lVDp8DyWd2ami5hg7ytzipf783/rP2XFBcrkB/z0G
         HPJvVr/KtwKOmlubSmVdkfQzKJZ4Yo/bPxThO4uHO4+ErEiIoTHa/myHgc5dK9K2Zcxi
         hMOJBVqeR7xINIYqEDNa78Xw7nAjw4EhrbMJU0T2mPoITGecYYQ0ZLpomEHHYbLOiDKs
         XWww==
X-Gm-Message-State: APjAAAW7z4GUnk8YGzbFvZZFJqmgtdlb/LwBmQuX+W45lSt/3SlDO0IN
        NZd4AIICIH3fVrR+Din5I5Tqy4Rc1jfJGA==
X-Google-Smtp-Source: APXvYqx9SJxsFYMy3qd4gEp+aw6VF9FliP2wwTEnlTtwScMKrHh+0VypzLbYwbA1BGzGufwIaGuOSA==
X-Received: by 2002:a17:90a:376e:: with SMTP id u101mr1464257pjb.26.1566952454298;
        Tue, 27 Aug 2019 17:34:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e24sm445127pgk.21.2019.08.27.17.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 17:34:13 -0700 (PDT)
Message-ID: <5d65cc05.1c69fb81.60c30.1e9d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <32c755a9b9959b358e99d3b0957c283a6c6f0e89.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <32c755a9b9959b358e99d3b0957c283a6c6f0e89.1566907161.git.amit.kucheria@linaro.org>
Cc:     devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/15] arm64: dts: sdm845: thermal: Add interrupt support
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, masneyb@onstation.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 27 Aug 2019 17:34:12 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:04)
> Register upper-lower interrupts for each of the two tsens controllers.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

