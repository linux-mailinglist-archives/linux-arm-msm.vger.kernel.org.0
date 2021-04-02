Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931F13526C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 08:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhDBG6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 02:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhDBG6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 02:58:52 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED34C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 23:58:51 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id m11so427135pfc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 23:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=XZRZT667Wid4HC57Mpu8NBkTc3AaOv656vjU18nDRHw=;
        b=BUlYZClbeEGqrEVrcqqqA1M4m9HriUGNVpMdA/UGitBCrU66v6s2DsgkOvimOcBe8C
         a5tsbYuGCvxMgN8OFMpxDhpqxKY9Alc06P7o/8IvOjVwznvl+LjdT+1s6yCCYWVTzyaM
         z2dscvHDDCakjPCLNgJUqp1RCyCEMqXQDztAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=XZRZT667Wid4HC57Mpu8NBkTc3AaOv656vjU18nDRHw=;
        b=oklagrKoPjvdrnvGTkbjbG4aVnzwhJJMWUzTJSaX9r2bRtRRq0WCPPyo5auqCfA6FM
         ECr2sVli3DIcMEFUotnOcNqUsyZ6X1H7ipNI2oejlJmTXZ+/ueyd/4Unf1XES/FLTLdu
         cyo9NNu6tNpY96bJu2xCqIvh/KoIx+RoI4pNVrnzJwGLdIdRfM80Gegjn2NWHktSHQ6A
         66qXzFljiKawWGcTFSc51r7h18E3ki86nQK03zfV2cx84YnyroZMppb+zR7NYODXrQdz
         NGcKOQzCywAD8F9aKySErccfjGcgzKaaqZJiFcCPRATOcPn2hyoHuvykjhgzjOwpPgHS
         1YXA==
X-Gm-Message-State: AOAM532TcL8cgcxXZq+umL5bETfL47Db1DZY6Az9+747ubCxK8etLJzV
        zeJC90Nt+twz4Wx5qPjKH0dYDg==
X-Google-Smtp-Source: ABdhPJz+YaNMb1Tcnu8b63PmmSjWugBp6WusD+nJrsLIxEGp30CDb8f4CdGPQiT4zFrm1oHe8C8KFg==
X-Received: by 2002:a62:ee09:0:b029:211:1113:2e7c with SMTP id e9-20020a62ee090000b029021111132e7cmr10839774pfi.49.1617346730567;
        Thu, 01 Apr 2021 23:58:50 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:450:f2a9:b3ca:879f])
        by smtp.gmail.com with ESMTPSA id e3sm7242297pfm.43.2021.04.01.23.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 23:58:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org>
References: <20210323224336.1311783-1-swboyd@chromium.org> <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org>
Subject: Re: [PATCH v2] firmware: qcom_scm: Only compile legacy calls on ARM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>
Date:   Thu, 01 Apr 2021 23:58:48 -0700
Message-ID: <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2021-04-01 18:12:14)
>=20
> It might be a good idea to wrap these lines from qcom_scm_call with #if=20
> IS_ENABLED(CONFIG_ARM), and the corresponding ones in qcom_scm_call_atomi=
c:
>=20
>    case SMC_CONVENTION_LEGACY:
>        return scm_legacy_call(dev, desc, res);
>=20
> If something is wrong with loaded firmware and LEGACY convention is=20
> incorrectly selected, you would get a better hint about the problem:=20
> "Unknown current SCM calling convention." You would still get the hint=20
> earlier from __get_convention, but that may not be obvious to someone=20
> unfamiliar with the SCM driver.
>=20
> I'll defer to your/Bjorn's preference:
>=20
> Acked-by: Elliot Berman <eberman@codeaurora.org>
>=20
> with or without modifying qcom_scm_call{_atomic}.
>=20

Maybe it would be better to catch that problem at the source and force
arm64 calling convention to be safe? I'm thinking of this patch, but it
could be even more fine tuned and probably the sc7180 check could be
removed in the process if the rest of this email makes sense.

If I understand correctly CONFIG_ARM64=3Dy should never use legacy
convention (and never the 32-bit one either?), so we can figure that out
pretty easily and just force it to use 64-bit if the architecture is
arm64. If only the 64-bit convention is supported on arm64 then we
really don't even need to call into the firmware to figure it out on
arm64. We can do this convention detection stuff on arm32 (CONFIG_ARM)
and always assume 64-bit convention on CONFIG_ARM64. Is that right?

---8<---
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 747808a8ddf4..22187ebc1678 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -140,7 +140,13 @@ static enum qcom_scm_convention __get_convention(void)
 	if (!ret && res.result[0] =3D=3D 1)
 		goto found;
=20
-	probed_convention =3D SMC_CONVENTION_LEGACY;
+	if (IS_ENABLED(CONFIG_ARM)) {
+		probed_convention =3D SMC_CONVENTION_LEGACY;
+	} else {
+		probed_convention =3D SMC_CONVENTION_ARM_64;
+		forced =3D true;
+		WARN(1, "qcom_scm: Detected legacy convention on arm64; firmware is brok=
en\n");
+	}
 found:
 	spin_lock_irqsave(&scm_query_lock, flags);
 	if (probed_convention !=3D qcom_scm_convention) {
