Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D798632C907
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 02:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346250AbhCDBBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 20:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446589AbhCDAPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 19:15:24 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A81CC0613E8
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 16:13:42 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id l2so17642829pgb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 16:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=jWLf/e+EL6DZASxmlKaI5K9b0nZdvsE6NX7/3HdAC7U=;
        b=c+FjYQmwaRinCqyo0+52fhpid5Xwc97PzuMFrg83WkMJp1JGtsp1+XO0GbeEM69+NM
         Mx+/iK+BS9M7n1Glh7rfhjNPDkY6fS2UEkQ0rAYwyZ6DEFoOKVMxv2qCpJIK+4TEL/Wp
         tIxRh+SOzjC4mjjpfdFUyZCIWaC3gXDJn1wiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=jWLf/e+EL6DZASxmlKaI5K9b0nZdvsE6NX7/3HdAC7U=;
        b=qGm8NLU1xIo5t9YwC/je0x10tMc4gvdQuTQme0KIpTr954MWOJtWIDwVa0Ns3jVev6
         f9Sdw3ZZN9+ABBEyEhoItrrJQSyBcxJ24qU33pE/MBnpS2NULHKNR2Nv3kuLi8wSamVA
         682AfjhbPYhZQnh0lyCMv3aNjbGz9tpqpkhqUMho16IwX3W1M5K+Skj0zRZ1YWntX1qu
         qupEwyjy2e93KSr91XvmpXjuM0g5W2muRBo0S8qb3enNyJvQcLJQu9VlfLum37Dl8i6I
         ZVzM798uMTCukPygaBgX+iYudhpYq1ZN5gp9AICcxH1iyB4U9dxAGO2Vqpe+prFTkiEs
         Z+9g==
X-Gm-Message-State: AOAM530Q2Ca7n/QXSInB6nKpRWOJSJqXotMD+hD4QrJdMAgKzWBEcNUr
        vdGxoxab3/q03Fxs+mAvu+QTyj7QMnSyig==
X-Google-Smtp-Source: ABdhPJyVroPzn9oixV9FeT2IFau8Sa9+DilTKFAVShOzPeMnb8mVrAPic1zVIiJMCylWI0i0E+p+dA==
X-Received: by 2002:a62:7708:0:b029:1ee:f656:51d5 with SMTP id s8-20020a6277080000b02901eef65651d5mr1242886pfc.59.1614816821943;
        Wed, 03 Mar 2021 16:13:41 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id b15sm24334134pgj.84.2021.03.03.16.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 16:13:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614773878-8058-14-git-send-email-rnayak@codeaurora.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org> <1614773878-8058-14-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH v2 13/14] arm64: dts: qcom: sc7280: Add cpuidle states
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Wed, 03 Mar 2021 16:13:39 -0800
Message-ID: <161481681986.1478170.12709137949867727549@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-03-03 04:17:57)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add cpuidle states for little and big cpus.

Please also say "The latency values are preliminary placeholders and will b=
e updated
once testing provides the real numbers".

>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

With that commit text update

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
