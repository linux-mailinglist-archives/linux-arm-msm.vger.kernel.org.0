Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0145AF3678
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 19:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbfKGR7s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:59:48 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45079 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731168AbfKGR7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:59:48 -0500
Received: by mail-pf1-f194.google.com with SMTP id z4so3022316pfn.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=O6gBNRGhVZ1gdZRloCa4pu6sdIjr6Vbikqu0zr43xGE=;
        b=OxGhg6ZoRHVSnJPS/KQ8rA72slPD0/uCvstdZnD41uuJR/XZ+uroAy0C2HsRi8TJEH
         Ehivz8UEUDJWp/mtRdbhh2Ru2z40X6CTZgFSymicjTvrKVz3nyARqURphSni6IEb4ejJ
         Gx1FErmbqtJ3pBj1kUb7zhFeX6MKw9dKBkMRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=O6gBNRGhVZ1gdZRloCa4pu6sdIjr6Vbikqu0zr43xGE=;
        b=cbqV6cojZubKQCRADyKLwzqVb4Tr85hZjymeqzOEUcgs1Hb1NfuvkCxCQ0dvBDJSDw
         XlGjDv9ebRAC6ySBGzNDWPbBe53XA1bOIwiTcQc3ylr65Ss0ctQ/ymbxDea95EMmNYot
         chZDmyax1xg3mH2/uicbOs0NGsWAXHpqMb7oB4IubH1uvQ0dZ8MPJTmO+yp+LoJcQQQv
         UVDKz1a1ySH1we4sSFNsFaYCnFZc5PtqnLzTK4gDj1V585BW2CMxjayKyhRwU2oqRp76
         GvNp0pIzxon+Sa4gUwQ5ZoHw1StUnlSag9yE0SoCR72JM5s6sRfpDeIvoi6vFckGEmpR
         QcAg==
X-Gm-Message-State: APjAAAWbfJvzplTmFuGz8+VNCFOmEH0f8I8jVNUtL0XInGJkRqiM6Lvz
        Jjg2geHcyXwV6czvab8AQtfpgA==
X-Google-Smtp-Source: APXvYqyVCRadOx088g6lxPYOjNqiHOYdn+JqmwRs1jOGVb7nudBtoJQRBm1zQAzNz1+MhSrGJSPaug==
X-Received: by 2002:a63:2f47:: with SMTP id v68mr6162731pgv.239.1573149587179;
        Thu, 07 Nov 2019 09:59:47 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i187sm3674211pfc.177.2019.11.07.09.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:59:46 -0800 (PST)
Message-ID: <5dc45b92.1c69fb81.99916.8f34@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-12-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-12-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 11/14] arm64: dts: qcom: pm6150: Add PM6150/PM6150L PMIC peripherals
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:59:45 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:14)
> From: Kiran Gunda <kgunda@codeaurora.org>
>=20
> Add PM6150/PM6150L peripherals such as PON, GPIOs, ADC and other
> PMIC infra modules.
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

