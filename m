Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909F4102BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 19:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfKSSvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 13:51:10 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41386 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfKSSvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 13:51:10 -0500
Received: by mail-pg1-f194.google.com with SMTP id 207so4435104pge.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 10:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=n0Px5zh2RZUTSRa+txIjA96ir+kiwnj5ZLRMEtvcgV4=;
        b=Hle4E3bikufHT4vYbr/0nSw82RYwn/zAXxMAWA/79Mz/wrAUR0/Fp5HP+QaR1r/do5
         rEjH/qVQtwwPDXJzMcNDrNHYNls9GNKpFqxNu1s7RABY9vO3btlciW9ohBDodd6Nu1Ww
         ZSnQZULbbxXxFK6cBW+vZFEQyagOk4VcvWBao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=n0Px5zh2RZUTSRa+txIjA96ir+kiwnj5ZLRMEtvcgV4=;
        b=SZgS6GZJJPWZtcs9qIQpY7WO544QQvPTtsqIHAm806S4rbhNJd6ZEfGLJaEP8kf1qJ
         as3s2+pVY+cBLqS7PDdf4wdBOuP8R/poGEGYb00bNbWtXonupbWYOxoNDcwLk4lJMB8y
         TCh9vD4mjkZ8bUii2KVrAXRm4/jIQrs7dAJ55wf2gGA5lDQrLNCREL5mGdyK0qVDJDHp
         yamNNVkYt6/nioqG3kWJv6tw8EzMax/CY/+vLVu0CJq3cb9c2DxDIY9jjkixOUc2lOPn
         vgPOhY0TvXllYPVP9Jv8p32hRP4KvImj3zPdAkT/kMU4wvJ7vwf4GlpNIc5K+04E+DVD
         SYkA==
X-Gm-Message-State: APjAAAUINLA6HoeOCqIIAqjLHf6o+TM1atp8ktV3COaaJLcde+vWmyEy
        M0svK3bFYYr0FRNQToPvFhPf+w==
X-Google-Smtp-Source: APXvYqzUzfgLoLdneiTOoteEpSUfIAgBNn8+g+zF+lXSEPZQgOJfHhkLBgnHXUY+izJng0Bu29sosA==
X-Received: by 2002:a65:4907:: with SMTP id p7mr7098872pgs.327.1574189469333;
        Tue, 19 Nov 2019 10:51:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f25sm27262183pfk.10.2019.11.19.10.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:51:08 -0800 (PST)
Message-ID: <5dd4399c.1c69fb81.d832d.e01e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f99b9a0-6c4e46e3-ff77-4cc1-95f6-9561975eedc4-000000@us-west-2.amazonses.com>
References: <20191118173944.27043-1-sibis@codeaurora.org> <0101016e7f99b9a0-6c4e46e3-ff77-4cc1-95f6-9561975eedc4-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 3/6] soc: qcom: rpmhpd: Add SM8150 RPMH power-domains
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:51:08 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 09:40:11)
> Add support for cx/mx/gfx/mss/ebi/mmcx power-domains found on
> SM8150 SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

