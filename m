Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B56FE832
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 23:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfKOWnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 17:43:35 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37863 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfKOWnf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 17:43:35 -0500
Received: by mail-pl1-f195.google.com with SMTP id bb5so5644344plb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 14:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=7o6XJFRPmxhjke+xOAXjdubz9lTZY4Bf8A5Q4MvHVgM=;
        b=i735wbRLkTV+X2RQq2yJqvlQ14P41p1rPATZ+3f8Xt2WkG43O5RCm72dDYNNvxmzDa
         z0ifBWftulbWVW3g1WFhh8yv8gXti3Wp5qPgPy1fHoeM9khlaNFsqtV9tbc4kUOebj0f
         U53LPLKOY6sQFAvCA/9p3CgMXInyTqX8oSr8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=7o6XJFRPmxhjke+xOAXjdubz9lTZY4Bf8A5Q4MvHVgM=;
        b=rcMkMtNOutQbYmNHH+eT2N3c7qk0Gf1bXYC8+rT8g4bC4RJB8vhyuvTEwKEBdjm+mV
         RBH+oMzSeCfvaOamgQC6KqIl6wloHP5O+mFeBp8EKW5gL/sAFZgS2x7Avjkw4Z6mI86R
         lW+c8CAorKjsg82HwzHKCpr9v4Cd+ny0so0ls0QcYPUtnjNqd961VPhHOKA2XWjetFRR
         Z9JsZJ9dpGzC+pGKv7Wl+gDxbFCdS67EKsI5KpU2h0YtrJPu7Gd+TT/wNV7aQqjKq5bq
         EHw2dUS20egGo9gnRXKG/GmTV6bb/rTOAEobUEaxsQDkwC9F8w6RHPve0zVMZf5Wv97p
         d9Ig==
X-Gm-Message-State: APjAAAVubSB+bav8ZH7WMF+bJKf73TPoTY59JqfAKoSXjbVUu4BErdAk
        Hg129KdwHSuJYtd3kkmHK3vDKQ==
X-Google-Smtp-Source: APXvYqzL/YIzEQ/4F8p95uH8VP6Lh3WXV2QpSRaoK+dUjlI6mT24JhIwSokKWCvuLLzsjCTstOj35g==
X-Received: by 2002:a17:90a:2947:: with SMTP id x7mr22564702pjf.136.1573857814143;
        Fri, 15 Nov 2019 14:43:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g11sm9533898pjv.8.2019.11.15.14.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 14:43:33 -0800 (PST)
Message-ID: <5dcf2a15.1c69fb81.b2b08.cc1a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-4-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-4-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 03/18] firmware: qcom_scm-64: Make SMCCC macros less magical
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 14:43:32 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:39)
> Improve understandability of SMCCC macros as they are all functions of
> how many arguments can be shoved in registers and how many SCM arguments
> are supported.

By reversing the logic to build up these defines based on the number of
register arguments instead of subtract them out of number of total
arguments? Might be worth mentioning that.

>=20
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/firmware/qcom_scm-64.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-6=
4.c
> index de337b3..badc245 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -57,9 +57,9 @@ static DEFINE_MUTEX(qcom_scm_lock);
>  #define QCOM_SCM_EBUSY_MAX_RETRY 20
> =20
>  #define SMCCC_FUNCNUM(s, c)    ((((s) & 0xFF) << 8) | ((c) & 0xFF))
> -#define SMCCC_N_EXT_ARGS 7
> -#define SMCCC_FIRST_EXT_IDX 3
> -#define SMCCC_N_REG_ARGS (MAX_QCOM_SCM_ARGS - SMCCC_N_EXT_ARGS + 1)
> +#define SMCCC_N_REG_ARGS       4
> +#define SMCCC_FIRST_EXT_IDX    (SMCCC_N_REG_ARGS - 1)
> +#define SMCCC_N_EXT_ARGS       (MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
> =20
>  static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
