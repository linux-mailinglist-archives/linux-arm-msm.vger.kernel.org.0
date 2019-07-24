Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C4B73689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 20:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbfGXS1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 14:27:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45161 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbfGXS1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 14:27:42 -0400
Received: by mail-pg1-f196.google.com with SMTP id o13so21619549pgp.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2019 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=O8KSpuegrQcuLlIvANi3GzaCz0IAnlhPFWU+ls63xJI=;
        b=mQmyCM/JzJTSir4LVGUDWBXP64zF/ZdQ8YHl2ZNHASHdC0wClyPOuEhOwmCYqBXW2r
         dgw4PX/WK9HQdHxHhjxjwoZHy1jfvV8J6dw+05QdNqRdAWiEOotRaKqLBydCid+KCbjG
         RNSqrQmBfD17PYef51RePXqFOdFa/tumsBGwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=O8KSpuegrQcuLlIvANi3GzaCz0IAnlhPFWU+ls63xJI=;
        b=dRUvfFNhXc8Kodjhg2PJrEnH20o7I0CYzmZnjejhVcchdvucx0Eb0s2WzvJUWMA3G1
         Klk+xSGNL4hdPUl1T7WD1FXhTddSYUZDqldjnPSTm+akW/5DWLgBb/M1lzQ9t4n7X4xM
         1fPdVW9Rdi3lhsBkTwSiDH7QnYDN0YXF28yA49dzLiJk4+aaU8YUl957AzEkCsYgLHGl
         QR1jluMunON78bN6zyGQ+gRcsSak1RgAUHbVmnvl9qijyk/x4t/wiVmM5WK9bCcPbik/
         gIxM/l+cZvUgwK7QM9vABCkxp0JWtr/72Nhn0nIW5pHOL+2Yr7Hk+mFnq7ue18VQcv7J
         KF2A==
X-Gm-Message-State: APjAAAVIlPS/9/SxCADSbwIwYogi8qtR2bm4osYY/qwN0vIGtpoVmPj9
        +GUM9p8n2wGzX9I6YSOlEPUaKQ==
X-Google-Smtp-Source: APXvYqxYUOgU6ZTbFdmr1+V3ryT+wQolntdEKyYxOf4gT45JL7Kbaks+zMFv6ljbzrz2qHppJ3rABg==
X-Received: by 2002:a17:90a:2506:: with SMTP id j6mr54600864pje.129.1563992862010;
        Wed, 24 Jul 2019 11:27:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x65sm47383855pfd.139.2019.07.24.11.27.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:27:41 -0700 (PDT)
Message-ID: <5d38a31d.1c69fb81.80992.0052@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8efd5c48-5d3a-97e1-1dec-6a9cdc4c8ef6@codeaurora.org>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org> <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org> <5d371ce7.1c69fb81.9650.8239@mx.google.com> <8c181f08-559b-5d77-a617-65cfd3d5da55@codeaurora.org> <5d3868a9.1c69fb81.876aa.ac30@mx.google.com> <8efd5c48-5d3a-97e1-1dec-6a9cdc4c8ef6@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Update Qualcomm SDM845 DT bindings
To:     David Dai <daidavid1@codeaurora.org>, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, robh+dt@kernel.org
Cc:     evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com,
        elder@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 24 Jul 2019 11:27:40 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting David Dai (2019-07-24 10:22:57)
>=20
> The way that I view this is that the consumers consume both bandwidth=20
> and QoS from these physical NoC devices by getting some path between two =

> endpoints on these different NoCs and applying some constraints. The NoC =

> providers can accomplish that either by writing to MMIO spaces or by=20
> talking to some remote processor/hardware to tune its clock speed. The=20
> consumer doesn't interact with the RSCs directly, but can select a=20
> different bcm voter based on the endpoints that are associated with a=20
> particular bcm(apps or disp rsc). Each node(endpoints) will have its own =

> BCM designation and an unique bcm voter.

Ok. I get it now. The MMIO nodes will be interconnect providers and
they'll know what RSCs they can use by exposing the same RSC "resource"
multiple times for each RSC that can be targeted? This is what the
postfix is with _DISP on your examples? Presumably there's an _APPS
version of the same prefixed endpoint in case the consumer wants to use
the APPS RSC instead of the DISP one, or maybe there's just no postfix
in this case because APPS is the "default".

