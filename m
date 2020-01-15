Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F46A13B811
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 04:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgAODOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 22:14:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41545 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgAODOh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 22:14:37 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so7470365pgk.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 19:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=O3jTDnmwru005Rmfwt1mrDaoL6O6mw5SG6rHGZeKVSY=;
        b=CnLgBEiDGZrSAAG3xSHFFUBWxQ8iCuMe1rvegmralFbRWQvEMK3aMlu4eLGm96eWrd
         GFvC+Suc4XwIYMBYZvKevz493ll0wBmoeeSqIwak3qjanRzH+T47QB2PlmoFlyRIMHF8
         sDXzapZJuU3CKCA5dPtSiek8bRU5lTthQaKDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=O3jTDnmwru005Rmfwt1mrDaoL6O6mw5SG6rHGZeKVSY=;
        b=myY1+iCW7Gzlq3vVFgyAHkh86VEzwj88PsR+junnjq3aafsPGbEi/GraVtMrjuJyLT
         yd9hlT7aD+BVWR0eLaY4UPKghvy/my3RRV0wL6rpNVdc7d87ZVyAdxuGvUt5PVKeOycG
         SEoa5MPX725g80bgmn4zAb00h+TggKDEZfOsblG/ryuARlrHg+HaCClE6HBqlcd3lGA5
         nZGN5CklnpzN0+t9rfuT2JdsQ+0uq6sl+LYtsNlJ/z+RNGPdLorb/dDHU2C0yK1HrHsK
         0PZy76Re7v1YryeBzA54vJPvd2X+aNbR7130Nidp/UhtvSUdiU8PHeVyXLoI/Rf9oJV8
         rZkQ==
X-Gm-Message-State: APjAAAVmhAuKrAX+bl9hpaZ2VeQ2uV0JF046HUp1qdlBQkiGpbL8k71B
        jsKehNJ96ffIJ6R1nsKydbxrBA==
X-Google-Smtp-Source: APXvYqzVr+KpYU3PHgwnjSxEm/7uHjy8e95zrZ1QZ7pws0hBP/Tv7PrdWYaxZslZbmgStCQ2NSd2Ag==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr28715427pfm.106.1579058077486;
        Tue, 14 Jan 2020 19:14:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s26sm19589003pfe.166.2020.01.14.19.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 19:14:36 -0800 (PST)
Message-ID: <5e1e839c.1c69fb81.1ab3c.06dd@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200110101802.4491-1-saiprakash.ranjan@codeaurora.org>
References: <20200110101802.4491-1-saiprakash.ranjan@codeaurora.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add iommus property to QUP0 and QUP1
User-Agent: alot/0.8.1
Date:   Tue, 14 Jan 2020 19:14:35 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-01-10 02:18:02)
> Define iommus property for QUP0 and QUP1 with the proper SID
> and mask. Below SMMU global faults are seen without this during
> boot and when using i2c touchscreen.
>=20
> QUP0:
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x0=
0000043, GFSYNR2 0x00000000
>=20
> QUP1:
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x0=
00004c3, GFSYNR2 0x00000000
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>

