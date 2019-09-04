Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE4D8A9706
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 01:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbfIDXWA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 19:22:00 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:45940 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730129AbfIDXWA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 19:22:00 -0400
Received: by mail-pl1-f172.google.com with SMTP id x3so304949plr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 16:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=qMQxm/VRDxP6FZWufG32f5QY5xEFJc2+2imqmF95LA8=;
        b=A19kppI0UbAoVodw+dajW3BnRlspaPQe0dq2835ayW+34cIzwjJYGFM2OrMhC+BZQ8
         ef2IGsUsJXGtanLcTAIivF5OgSmYNQ77EOdzlVawj6BnQn8P64g9aPryd+bQHxDiSXib
         eWs8Ca3xov4mE2S2UvNSQ3ZCXTcl7CTzChe8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=qMQxm/VRDxP6FZWufG32f5QY5xEFJc2+2imqmF95LA8=;
        b=H1elitVejiS7ZkJ1VHtJ5sKkMLD8rQobQEcYxjXqwRmrnNW2VA6QA24BOWMNLsY0P6
         yuLzcCvmuxQjO5ah/otuycT2N71GQhguFhLc2e4xirll6Cst4+xwKoasOIhSk49cuHBZ
         xoHJ3fpmBXvQDtYFl9VpJ4codFVTVLkRAzHnOwpEgt/u0RWThJCKP6UCo8l4iKkwWHe4
         y0eaVjcsi0XXgzz7TZ3hx/w9Q70pibSNtgz20c2YKlVrtdq5qohFzYaU1A6XW+fcmCWq
         b9UJvZWtqreH25cltnmL6wFCYjv6rz8OGpI/xn50JgDjf9LeyThrPdBf2uled9lDiQXz
         JtTA==
X-Gm-Message-State: APjAAAUjO8PC1QLZRiFzxnezXVfEYm9dIkW8WXPmoatg+9MNhtA6y/z+
        eFT1S+h0OqnUc7XIGRb7E8DXSjOwHf0fmQ==
X-Google-Smtp-Source: APXvYqwxSW1ALdQsQHJPdma+QWYRXG++FjslgBIyc2YnBGqRZIthwIfwVzJXxaUxjvuT2gSlp8UYtQ==
X-Received: by 2002:a17:902:7449:: with SMTP id e9mr292175plt.242.1567639319209;
        Wed, 04 Sep 2019 16:21:59 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j128sm162678pfg.51.2019.09.04.16.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 16:21:58 -0700 (PDT)
Message-ID: <5d704716.1c69fb81.a404c.0c38@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190904100835.6099-3-vkoul@kernel.org>
References: <20190904100835.6099-1-vkoul@kernel.org> <20190904100835.6099-3-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy compatible string
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 16:21:57 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-09-04 03:08:34)
> Document "qcom,sdm845-qmp-ufs-phy" compatible string for QMP UFS PHY
> found on SM8150.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

