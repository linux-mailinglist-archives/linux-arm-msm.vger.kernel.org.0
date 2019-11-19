Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D70102EC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 23:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSWFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 17:05:15 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34826 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfKSWFO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 17:05:14 -0500
Received: by mail-pl1-f193.google.com with SMTP id s10so12685540plp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 14:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=w35uR4S5yvW+gEl8iFL2UMaC6KbH2ijDF7KVdoKBW8o=;
        b=GLJqUgxhCv+fJa5gKVieXOAupgyG2OKQJEwAO6IMgsFk85mkmGxDmbOiYt0T2dM2kb
         djRLMAjfPo7XuD/YYwPbfeu3RXVh32KTDejtZPxBTQTAMuJtTdI1kgnKbCsHivlVWv95
         efj3/kVRZgVeCKK1z5L3u4J10RvVukxnT12LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=w35uR4S5yvW+gEl8iFL2UMaC6KbH2ijDF7KVdoKBW8o=;
        b=AWcgCCEPgU+W6u+Ha+6zC+FXK8IMtiOMXQNzSnM3/TPJPuoiv7ntq3w/Lcpaf81yec
         b1OE0HIqHmh5Kwa/tIObjL1iTXnTDOQHuqlFu+yviiPAn4SqEJxKPIxV8Xv+mJSdZibk
         RAJ2xhevWqFHQ5zrKpNenPDdYhhobZ8nV93L2bl433dessAc40huvzhqrus+DMW+b340
         QFJXA346+tGQnDnzvYU3m5wmdIyo15A153tos3toUkm8kMeYZpRbR42DsUyunoHu3lce
         FTWuDPP5DWMQVNWLAlALoOdfdX7g9/QlXvR3VRiEdZV8FDgSjw48lRhkXBjW+PxkeBsO
         yTOw==
X-Gm-Message-State: APjAAAV+vtanTzI+6SkCf62VF3ocIcxj6SsWM0W1f4ckTvHuYXELm2JB
        56XLHxSxVoOYbK1i6aRSSBpSIA==
X-Google-Smtp-Source: APXvYqy+HJ3AU0DqSC8xJrcXfT1ahsaVkUj9XIc4BXS/vHt4qa9LB3Pq3Ums5TyTKTDzqeQUYGfchA==
X-Received: by 2002:a17:90a:3d01:: with SMTP id h1mr9649495pjc.15.1574201113733;
        Tue, 19 Nov 2019 14:05:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a26sm26310704pff.155.2019.11.19.14.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 14:05:13 -0800 (PST)
Message-ID: <5dd46719.1c69fb81.ccbc2.f01d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-14-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-14-git-send-email-eberman@codeaurora.org>
Subject: Re: [PATCH v2 13/18] firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 14:05:12 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:49)
> - Move SMCCC register filling to qcom_scm_call so that qcom_scm_call_do
>   only needs to concern itself with retry mechanism.
> - Use arm_smccc_args struct in atomic variants as well.

This is two things. Please split the patch.

> @@ -266,10 +272,14 @@ static int qcom_scm_call(struct device *dev, struct=
 qcom_scm_desc *desc)
>  static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
>  {
>         int context_id;
> +       struct arm_smccc_args smc =3D {0};
>         struct arm_smccc_res res;
> =20
> -       arm_smccc_smc(LEGACY_ATOMIC_ID(svc, cmd, 1), (unsigned long)&cont=
ext_id,
> -                     arg1, 0, 0, 0, 0, 0, &res);
> +       smc.a[0] =3D LEGACY_ATOMIC_ID(svc, cmd, 1);
> +       smc.a[1] =3D (unsigned long)&context_id;
> +       smc.a[2] =3D arg1;
> +       arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
> +                     smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
> =20
>         return res.a0;
>  }
> @@ -287,10 +297,15 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, =
u32 arg1)
>  static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
>  {
>         int context_id;
> +       struct arm_smccc_args smc =3D {0};
>         struct arm_smccc_res res;
> =20
> -       arm_smccc_smc(LEGACY_ATOMIC_ID(svc, cmd, 2), (unsigned long)&cont=
ext_id,
> -                     arg1, arg2, 0, 0, 0, 0, &res);
> +       smc.a[0] =3D LEGACY_ATOMIC_ID(svc, cmd, 2);
> +       smc.a[1] =3D (unsigned long)&context_id;
> +       smc.a[2] =3D arg1;
> +       smc.a[3] =3D arg2;
> +       arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
> +                     smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
> =20
>         return res.a0;
>  }

Why are we changing the above two hunks? It's the same code with more
lines right?

