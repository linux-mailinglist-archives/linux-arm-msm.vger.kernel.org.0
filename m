Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFFD92A006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 22:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389919AbfEXUni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 16:43:38 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45903 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389242AbfEXUni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 16:43:38 -0400
Received: by mail-pl1-f193.google.com with SMTP id a5so4595688pls.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2019 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=XYlEJGhmV+ZH77RNipzHzZLCyxSeSQNCKabAuaHQX5g=;
        b=ZysEZ+lzbs4WdfNLSfgn4Jd5YoDfaKAShEaz4jGm4KKJb96DCqWPU+PihMo2zf9s0A
         VvLLbECme3tWN4KsnLA27AHO5WQQbOt+ACDR9xmiSu9lZPb0fMoO7Ev+wZBJcvjdphMs
         N6tr3emJekd2/Qf84t+1l53//jQmatrbfIoHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=XYlEJGhmV+ZH77RNipzHzZLCyxSeSQNCKabAuaHQX5g=;
        b=mIhhRBjGSfv8cY9lxP6dI8qYhIZWPOWhQ9SM2uUhrv7REElAGHbaloYRSeeYUkqR+T
         ugNRMTGG3NCNfgxX0F/ieTnyNjp3mV3uyt+rMqcrz7AGBvwJOPyuvn/RsQYXDMo4kTYl
         BggwbkJSx3mZcCQ872H/bVGPCOBYAAl1Lsw5pDMJ/OGKelawQlRKTUVGZymD/JWNLS0w
         Od35/kRatoHI8vlA89J3myar6gGvKETSvmPHJmABNjVu43E+vvJzq5uTPzEOqikCQH9N
         YVzIRf0LTOpQl7WKmQoxL745zcV8xv8WJOcTPKMbf4pqV4oYQEXFnBeyM3jkpsb62Qp4
         r0Og==
X-Gm-Message-State: APjAAAVFB7+mb22aEaaUsrRaJV+wknhk7Lsaoh6St1FLYoVbJlbCuXJ4
        GWcFFYt5c0xoKZ3VRDW2MaTXGw==
X-Google-Smtp-Source: APXvYqy4bHdJtzpQke5FGpvQIwzY9VRQtG1nbSuaGtiQQwPTga0LpVbsbq2N7mJ7wkglH8TDxg5eyw==
X-Received: by 2002:a17:902:d24:: with SMTP id 33mr108743947plu.148.1558730617412;
        Fri, 24 May 2019 13:43:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q19sm4403146pff.96.2019.05.24.13.43.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 13:43:36 -0700 (PDT)
Message-ID: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize debugfs
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
User-Agent: alot/0.8.1
Date:   Fri, 24 May 2019 13:43:35 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2019-05-24 10:32:18)
> From: Sean Paul <seanpaul@chromium.org>
>=20
> Instead of reaching into dev->primary for debugfs_root, use the minor
> passed into debugfs_init.
>=20
> This avoids creating the debug directory under /sys/kernel/debug/ and
> instead creates the directory under the correct node in
> /sys/kernel/debug/dri/<node>/

So does this make it become /sys/kernel/debug/dri/<node>/debug?

I wonder why it can't all be created under /sys/kernel/debug/dri/<node>
and then avoid the extra "debug" directory that isn't adding any value?

