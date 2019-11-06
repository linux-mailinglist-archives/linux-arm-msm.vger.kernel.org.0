Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6656DF1E47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbfKFTLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:11:17 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34891 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfKFTLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:11:17 -0500
Received: by mail-pg1-f193.google.com with SMTP id q22so10176111pgk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 11:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=OY7gYgd4FJIkTEZvHN5NIFLp9ZtxgEWcRq8vKLuNkWk=;
        b=eZKYMJZEiWsrur04nmp7VZR3e1RCS4GAobfM3f+fvB/0jOdeMyvy6E0CNoiiG58tmP
         HF+qx4/SsMBzIpYVrT5lktFKK73yQsJZ59QUCf4A9aesilgrJWeWFSepb5iecF7/6HVp
         McKkOqPs9GfnRlwLHmQFzVq+rgHR6xd7KNhJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=OY7gYgd4FJIkTEZvHN5NIFLp9ZtxgEWcRq8vKLuNkWk=;
        b=sSKPLsWNNLmmHGk3Tk7+VZZl3owaY3POwEJChImo6gIT482ldSfldj5zC5nc20GtRV
         vufNaYRmjIokdfMCOlfOja1zROYaL131OH/xe7JYRn5Vl0phQt0w1ZU8hnTY5B+jRxiy
         hc5J7KkuMZELwESUnJNmNh66MFD4frcLw6GZRrruETSPDeM7EVHf4CjTM2NAu5AAcTeC
         1dTfypzKa0OS7mchgEQS0wlM8Ptp2RJMcgBYRpKNagfziD9KMGOohPY/aerhfACBPtaa
         tVE86kE5LcKyrwoTMWNz2jdOZwbPaOgfYb5JKyUgDUkqW84rC8HyRuuI0goV8FBcTVV9
         y8Vg==
X-Gm-Message-State: APjAAAU2RWruHO4Bo+9CDBVvLKJg27DywgZ0kzho1tPhcou9XencFn6M
        Dx26bimeA6ltYK/o5qB2TjHRzg==
X-Google-Smtp-Source: APXvYqyI9rQeSviss4gD6JhTRezTghk0Fxp7c2WSM+6a22e7Ntor3/PHJM3cg/rIyepQ2iDqA3GZRQ==
X-Received: by 2002:a63:ec4f:: with SMTP id r15mr4643147pgj.17.1573067477046;
        Wed, 06 Nov 2019 11:11:17 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x9sm3943428pje.27.2019.11.06.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 11:11:16 -0800 (PST)
Message-ID: <5dc31ad4.1c69fb81.195ac.b1d8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-9-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-9-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 08/14] dt-bindings: qcom,pdc: Add compatible for sc7180
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:11:15 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:11)
> Add the compatible string for sc7180 SoC from Qualcomm.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

