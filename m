Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A618F1E49
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732108AbfKFTLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:11:32 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45869 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728580AbfKFTLc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:11:32 -0500
Received: by mail-pl1-f193.google.com with SMTP id y24so11873528plr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=YlU+OdXhIDKR9PfiNtBOmR4FsFlmFK64CTpMfZrq0VY=;
        b=E/P1CSJdk2lLsncbqPfDsdBx4I9NOufECjSiBJC3YmzB2mz5Yl9JXuNp0/3T3p6Qp5
         RIUD/n4denMRlG+BEjCyFRKWgPKQRQLhqC6nfhtMsWhnmetQ9oyRzufviMqaCb0ni2Gh
         Go3wWa12aWExYewJLEb/kZE3i2r8d0jrI+OZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=YlU+OdXhIDKR9PfiNtBOmR4FsFlmFK64CTpMfZrq0VY=;
        b=HuKbMhYgNYrQbmxQaC6p0+SVOJ8vwKaI/Oy5/tvVEclLspaiZJMOR6u+5pGLgbgVcl
         MdQpQ8auqf43U8QznZvCHnO54slij9yFcu31HhmoezbgXQk44PYfjMiWsqF3IZAHM+Fl
         JApR/slimaFuYm5q+Zvyn0aWvkWP881eAnC0fHXmKHVKVRME8gPbQ5WPcMJedCgyF2It
         ulrliIp+aYvz0GLsHYGftFWgPXtar5h7T/ZUA0BSrcJfvPc+Qxzjp3A7w1JoRw0D+qRo
         MjM5pDek70Tw0IrOpMiJo2dJzuOB4gsVjelXKjyDmyGS+pK8fqP4gq4kPoSWkuAQUioC
         z/EA==
X-Gm-Message-State: APjAAAWnV1AUAQivCzZsi4de/Gdn8mmUNBn3DydkNzdI4NWF/uSiHlaU
        gCGK24b4wIKZ0GQQe9NLvLkkIw==
X-Google-Smtp-Source: APXvYqxZvLIwgE1Gk+D3mymUUFiEatllcgMoJq/0gW6A92R+2Jee9wMM3IxWeYZ4gYl8FQ35QpbH+g==
X-Received: by 2002:a17:902:aa02:: with SMTP id be2mr4333753plb.326.1573067491450;
        Wed, 06 Nov 2019 11:11:31 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f35sm3739655pje.32.2019.11.06.11.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 11:11:30 -0800 (PST)
Message-ID: <5dc31ae2.1c69fb81.a3cd7.b5cd@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-10-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-10-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 09/14] arm64: dts: qcom: sc7180: Add pdc interrupt controller
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:11:29 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:12)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add pdc interrupt controller for sc7180
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

