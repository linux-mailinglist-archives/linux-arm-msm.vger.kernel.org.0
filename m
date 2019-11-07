Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7EE9F360D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389589AbfKGRrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:47:08 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40041 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389576AbfKGRrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:47:07 -0500
Received: by mail-pl1-f196.google.com with SMTP id e3so1984832plt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=A7C9nVWoqw2fCjix+RUHcJ/eKACVMV7OHWjEbohU/GE=;
        b=nbCvU/0vsQlCsJtreSa5tAxqXZb9eqFw3OHc//Wxc3I1fbj7PbXJjwjtLZuVLExqb6
         FvVIonVu/SCwdSgbJQC/P4ptX3HLQBQFcVVduEBmETL6O4RQY1x1VP35ckLizm3osN91
         x0gKl14M13trxmf4ZPz6MKLAMXJqONkHp3dw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=A7C9nVWoqw2fCjix+RUHcJ/eKACVMV7OHWjEbohU/GE=;
        b=NAAKE2SUO1duWdz/BsQRzi2zLt81RMhQjXqrP+4LPkmUu/9J0tzAtCYbVDX1VOZaCD
         9NX/1QNb5cwh4myncCIjecbC+rGxNO6jwC8ry9XGtrmUuu4AKF342jZ7deR4sXwIefZU
         ZcaHqwzXoYAgYrhAHsYX4U/yJ2N/OA6exu3APWpsOKSTQKyG6Py1UKSiqXm+U0e3JwJ7
         W13bRV7kirs8kbUs/dD7Yec5inrctqpTIk3gKtL+Clk1hDfuGAL00wx0sjRcoUKZP3v7
         3lJliopKoYHphJ0hGZJabZOcTb5UAYLgPs51ON+WSWJOmzF18ZGTt1VBnWxr8qxrga5C
         dZ5A==
X-Gm-Message-State: APjAAAUUFf0ZOeaXXpPhUl0P6y6gmF9sV4upstXRsS1xl6J0xjF8L9Kc
        +9SA2KG/Qm8oW00D8sVFCY7G2g==
X-Google-Smtp-Source: APXvYqzjUMjRSghQq7WVhSh6oycWsvdJOoNe8Z0d2BQhXaaagbJ6/VCFELKa3s/V96a2q64CTcfk4g==
X-Received: by 2002:a17:90a:850c:: with SMTP id l12mr6981004pjn.16.1573148827187;
        Thu, 07 Nov 2019 09:47:07 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s23sm3257366pgh.21.2019.11.07.09.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:47:06 -0800 (PST)
Message-ID: <5dc4589a.1c69fb81.a0cd0.85b7@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-4-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-4-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 03/14] dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:47:05 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:06)
> Add the soc specific compatible for sc7180 smmu-500
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

