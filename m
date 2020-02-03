Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1287D15110A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 21:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgBCUc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 15:32:58 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37728 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgBCUc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 15:32:58 -0500
Received: by mail-pg1-f195.google.com with SMTP id z12so1454225pgl.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 12:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=cZVOQPzRauAIXrx2DHSAhNTQEM7p146g+MumciHO/jk=;
        b=iFNn11J47AdMwBbDn4XXUTKPj+dhk6monov0dMi9b/hlWuI+g8yYn3J5j92biCTPa2
         AC0mtcVc/K059lQy5yIcBtvwCD1intDx2U8PTBbTTrWEbsS5GXr7AyJpGUYonuLUFQ8A
         RSqiPHdQghgzuJD1923MCF9rxM3AMYzfrogOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=cZVOQPzRauAIXrx2DHSAhNTQEM7p146g+MumciHO/jk=;
        b=umXe+EYVHobxiZ0WKbFXb9JMTvqd24CrEVJLsO990FMb9V8tsWDL5jzUI7v6c94l7V
         j6EeIhjdx6GIg9V//h3gs+u/gc5xezA5n2tIVz3SJi6qH0xU6bfbFYe3NrkwKS6gHVSJ
         1EJAHhhVXqtVdz+MlPGCnojABDfXb8gm9JZACVxSB2tykW8G4KQ5aOG3ncLIXdJrMm9w
         oCwto1EPz8u6MMGhJBfEGU7fsz5tEypCGorOTxaREPr/qhcccagBEQhSA7NwkXG73H1O
         NZ/Z+3cCgG4Y3W1zxNKaAlEkGAKla8bUC6jig/eyHuHfqk4BYmRvNao4NIYJ9ztoRL28
         NpPw==
X-Gm-Message-State: APjAAAX0ycbwbaRPcWsZGsBcC83cmCkASwATSIUnZ064/D07HaDA+umR
        CsSTiVw7L6yCMCW7mjTWHNurAA==
X-Google-Smtp-Source: APXvYqw3Dt6FatPcHevWvl6417lDVwr9Hhkc8+lkqq4H/ei6Dgfgjv156vLllcBrCe730kTnkd8arA==
X-Received: by 2002:a63:214e:: with SMTP id s14mr26679454pgm.428.1580761976230;
        Mon, 03 Feb 2020 12:32:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g8sm21252615pfh.43.2020.02.03.12.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 12:32:55 -0800 (PST)
Message-ID: <5e388377.1c69fb81.e9add.a3d4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <90542e32913e315bae02865e1d18a622@codeaurora.org>
References: <1580168406-23808-1-git-send-email-abhinavk@codeaurora.org> <90542e32913e315bae02865e1d18a622@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: Parse Colorimetry data block from EDID
Cc:     adelva@google.com, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, aravindh@codeaurora.org,
        Uma Shankar <uma.shankar@intel.com>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 12:32:54 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting abhinavk@codeaurora.org (2020-01-31 13:01:38)
> Hi Steven
>=20
> Any further comments on this change?
>=20

No. I was more of a drive by review comment on the previous patch.

