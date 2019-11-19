Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E67102BFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 19:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfKSSvd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 13:51:33 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:41681 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKSSvd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 13:51:33 -0500
Received: by mail-pj1-f65.google.com with SMTP id gc1so2973178pjb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=Y59PNIpnHrsDkHCPkT6UbcjTdgNITS13uFDLYBQ2JE4=;
        b=iKD8b6/7oWUjDcvOSG3a6DGaFMAZfmb4y1+vVYLqzj/jlM9ss82Nb0xtTEalph0SFj
         C5gBrbpHaWYCNAJDu1It+Ln+ESH/IOt7nB7UYxUAp7FWYPZ9CSn4KeJ7EpR5TkFvTTAj
         aOwPmL207I6B2IAURUOHpWeoF3i+yeFGqYSbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=Y59PNIpnHrsDkHCPkT6UbcjTdgNITS13uFDLYBQ2JE4=;
        b=uWKCOq5SRhZ+HE6OOb+KyKalbGdcuEfvKN1IgIhtFbJasta7PsJLf+YMDwkJrycdle
         0+dkloQs50bkoKYUo1+0bqdY8B1/rUdKYrCYnuveJVi4Yv3EfDI3yxYWnhOyQyHHeelB
         K4mmY5r2Kqn/+HZcRjTUr/zarzxEwMjnG5JeoA1/eXygh2Z7mizDP5L26ACOzXF/xxHX
         VKah7TiRPBLu7gbhiuXXZ/txV3XP6/2qZt8mEpHcuOKGq5qV/sjC671iqEKYHNaULlfl
         1U4JEjyENfZdjhb+Cjp62SYTL76iP/5WDMZdQeyLMmeALwHbbRgBovlpD5otEgBTAFRz
         Uerg==
X-Gm-Message-State: APjAAAWBoR315PUDTMxh/OwfEZTtKIQPWJbNIzMwoIQ5KD1t/Mb4oJWK
        JFdlgynr0XwkRbuXPSSVAVw9wg==
X-Google-Smtp-Source: APXvYqx0ARyvlo81w6YDzxObSa8eyil+MOTvYMO8hEW4KrO6pxNX4Lw0nMRIjq0NAlpSEUhMTzajCQ==
X-Received: by 2002:a17:902:8d95:: with SMTP id v21mr34846748plo.96.1574189490883;
        Tue, 19 Nov 2019 10:51:30 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x186sm28268520pfx.105.2019.11.19.10.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:51:30 -0800 (PST)
Message-ID: <5dd439b2.1c69fb81.89655.0f0c@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f99ca93-ab6c1c1c-e20d-48ca-ab03-b8da0890fca8-000000@us-west-2.amazonses.com>
References: <20191118173944.27043-1-sibis@codeaurora.org> <0101016e7f99ca93-ab6c1c1c-e20d-48ca-ab03-b8da0890fca8-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 4/6] dt-bindings: power: Add rpmh power-domain bindings for sc7180
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:51:29 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 09:40:15)
> Add RPMH power-domain bindings for the SC7180 family of SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

