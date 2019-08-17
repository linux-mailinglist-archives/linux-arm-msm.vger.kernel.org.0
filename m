Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66DD890CA9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2019 06:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfHQECX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Aug 2019 00:02:23 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38651 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfHQECX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Aug 2019 00:02:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id e11so3876726pga.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2019 21:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=LsFrOXJq15XZL37B55TOHg13GB/6UlZAx1tf1mF0vgE=;
        b=faHrnHBHHFMpMEb6WPW1+nTnesDz1k1vxDrVmWiZDh6DGc+ePIs/A4rC5ua7wCnjsN
         6oJlKKHuYI0LyHzNdxLwNjrgA8REbzNM5PfkbmB1cgHZwWF8ZD1Nu1f+nY5S0GttejAJ
         F6Ut5MOszAOmYBeuhxLGBHBPzgNE1VC1CWxWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=LsFrOXJq15XZL37B55TOHg13GB/6UlZAx1tf1mF0vgE=;
        b=baIi8GH5rO6J6CCFqhLhYYa1Q9smmzCy0LivmjXGyBIgDxKPclaVI9NnyGezTm6vQG
         e3OBCcbx8UoNuAnU0ur/2RhuBgsBmDUgMrv2E+0L7XRv3g6Bj286TWYRkKM6R1fosddp
         v9JZaXWUlrcqHM9pL42p4GUNcMneynFwadhRgBZVck5J4VSKz2SmoIgBUgyKf/LjiKCg
         r7cIFMNM/Pq7h2PC0mRcWz9z/t0181Hxv+DmvqQ5zpP7GaBnPIaIAdJ9OtR34veCQbPd
         yz9+ZPuzZwrF266m/E794kpLbtmnLfonqjNUcJ8lpNAKtJJMM0NRdufqY+XNPjAfC4iH
         mTNg==
X-Gm-Message-State: APjAAAVAFIdUTP6INJCW7j6DEzKAwQtlQX+nDms+bA6f936cSkoNFeuv
        K5AKkz+AgIqa3YW0RsWIgo+BpQ==
X-Google-Smtp-Source: APXvYqyt70onMslYirDbCwRV7IAna5jtVCadGp0gGG2Gai76w7DcAc07t05l1S14n2LJd0icOnoofQ==
X-Received: by 2002:a17:90a:d34f:: with SMTP id i15mr10530619pjx.42.1566014542750;
        Fri, 16 Aug 2019 21:02:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b24sm7420547pfd.91.2019.08.16.21.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 21:02:22 -0700 (PDT)
Message-ID: <5d577c4e.1c69fb81.f3557.6783@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <355cd15c91e02716140d7114fd403559487b66b6.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org> <355cd15c91e02716140d7114fd403559487b66b6.1564091601.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH 02/15] drivers: thermal: tsens: Simplify code flow in tsens_probe
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 21:02:21 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-07-25 15:18:37)
> Move platform_set_drvdata up to avoid an extra 'if (ret)' check after
> the call to tsens_register.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

