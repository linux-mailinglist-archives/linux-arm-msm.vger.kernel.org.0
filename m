Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA15DF3790
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 19:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfKGSuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 13:50:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41179 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfKGSuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 13:50:44 -0500
Received: by mail-pg1-f196.google.com with SMTP id h4so2575903pgv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=C1WVX915fPdh/srtNce/iA7rehF3H9bggdi/Th19950=;
        b=BnKFCdVTc1hnaaYgE2CPbWERaaKAAIdT05HgPAM4h2vuO+YFleEa2fKwcq/6/Gd5sR
         CPiZMg/65hkMuMW5O6lLxjQka6L9JG43UhjpMNZXykK5vHW8d3kpRGonUfO7gQYPywJo
         EgmCTZ8E9vES6oyhW1mkqUXGCEQbsSPgUdUp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=C1WVX915fPdh/srtNce/iA7rehF3H9bggdi/Th19950=;
        b=jCuXgylszF3vchWr42nEF1+HfsUqv11BtoUOum7fl460HGWSGarqH2Jo78V4mpJAMQ
         FI+l+go6vLTlG3nbuaUAr14wkOh5u6IVv9622mK0Heu7Xjq+/zJ18HCY+dSU5fZfHbfS
         y/odS6ayXRvcnO3wQdo8ApygDud+3FgknEdtgpVOp4G1f1QtA4Cf38wHlAB9w+D1/wtx
         QIIKIK/Zsp1LUmvBgA4pY5ayC1y1ZgF2G76/KGaQTC0C993udupYz/tdHk09D9j/dpeM
         1iZgqLx9QOi4AtLdHXSJdH+V0q8zkCQREpZgKM8RvekWgtcoMzYZTfj37NzTRru0wDmc
         TxPA==
X-Gm-Message-State: APjAAAW7SlPUEprC2pe1k3uUTqQ7nxDJSrQaz06dXo99ihgyqIjOegr4
        vnRJ1BahfdMcCnRY/QH5UaCmEA==
X-Google-Smtp-Source: APXvYqwXYon+nNFVYIt+LRRJ84g0KnEUdAh1JFByFpVa60fm9mh39498T+YM8DFuEp34dlBkoGGBww==
X-Received: by 2002:a63:e84f:: with SMTP id a15mr6304654pgk.309.1573152643162;
        Thu, 07 Nov 2019 10:50:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f33sm3276919pgl.33.2019.11.07.10.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 10:50:42 -0800 (PST)
Message-ID: <5dc46782.1c69fb81.3133c.8993@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-14-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-14-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 13/14] arm64: dts: qcom: SC7180: Add node for rpmhcc clock driver
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Taniya Das <tdas@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 10:50:41 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:16)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> Add node for rpmhcc clock driver.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

