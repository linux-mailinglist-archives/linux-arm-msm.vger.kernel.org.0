Return-Path: <linux-arm-msm+bounces-6772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A10828916
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 16:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ADA62863BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 15:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A03C39ADE;
	Tue,  9 Jan 2024 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxCDCDl3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADC15A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed4b84667so2293758276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 07:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704814563; x=1705419363; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B2tM8vxZAXNbZ5/d+OHbCOx24sS+92ZFKg3NpU+MKIk=;
        b=oxCDCDl3+p+rUGtnuZtSVehIQwFbla3E4AjVrWl/V7oh2GKICLKtJecVlIuDsQSymY
         g88SUI/uxJzPY8rNajDkH5pJV6aPvPSAbw0rzShEv3n5LZVxP/TtQYBSno55AbJwbpRJ
         DlEMyabawBWRpvWToE1l3BDPSNy0VpMZX72uNX1MsNewiRQsm0vm9k4JcFj7uUrR/Rl7
         ZfQQQdIgzQggjv9J9VcbNX4BfxLYb/hfgtqmw8rfzZ0MeKcLITvFZAN85+KfrH/I68YQ
         ekjcoGXrSGZJ3inJ+K9S+puTaPeFGrPazVuUl4dEfKKu3bwUrDGeKLI+nHsKzZ1KMKMD
         r49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814563; x=1705419363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2tM8vxZAXNbZ5/d+OHbCOx24sS+92ZFKg3NpU+MKIk=;
        b=bcVkk6KDGen8i2LDn82NzcHAS6b/vYEhsLqFdr8gpOv1qnwZOwKJ9VN3W5GOSP0pUR
         cY2v9CFTnF+Um+AS0NGa68RK95xvoaqFuVnXGaP9pIvD0tU2sWp/Nk76UQGr8Xi8taXM
         pOL+4gYwy+0oCOsMcLmzP6IEOlwm7Gjd+Gc4ZrMq2FAA1WLqrhsomRGMJTq3yYIsIKdI
         ENJJ9s4krtukuB8dp8azXgv3Rr3AGeesmWchW7D+dV43h3EE6KvHdUEHlvGJpPsKUmUK
         SZ4xDskBFPvm2islJjNj+qOn38YZX0YwsXjZjiPPS8Oq1ZnpPg8zZykpSzYec6xPuIvB
         dWdQ==
X-Gm-Message-State: AOJu0YyhTkVoK+QzMvV0MEiSRSRTdfygJqsujsF4IG9OJLIG/Ur3XkO8
	wp+4lZTtPCDGzGMs/KFWMyTBddaIyTOfmw7xt8TyoT3fRNJXXQ==
X-Google-Smtp-Source: AGHT+IGhvmVbgK5QSCM78Fj7fEzJDq/cl7EfGyyL3wn5XAUPlaljQ/YHVR9AJQpPJSTtiQKIPu7x6JJaNyLhjMUWGo4=
X-Received: by 2002:a05:6902:178e:b0:dbd:ac60:bcd4 with SMTP id
 ca14-20020a056902178e00b00dbdac60bcd4mr2848550ybb.75.1704814563492; Tue, 09
 Jan 2024 07:36:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org> <20240109-phy-qmp-merge-common-v1-7-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-7-572899a14318@linaro.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 9 Jan 2024 16:35:52 +0100
Message-ID: <CACMJSevhoyNhe2oG4OmNMWK+Y5fmCjJ340WtTPcrnG=9xx-eWw@mail.gmail.com>
Subject: Re: [PATCH 7/8] phy: qcom: sgmii-eth: use existing register definitions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 04:04, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The Qualcomm SGMII SerDes PHY is a QMP PHY. As such, it uses standard
> registers for QSERDES COM/RX/TX regions. Use register defines from the
> existing headers.
>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

