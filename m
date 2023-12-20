Return-Path: <linux-arm-msm+bounces-5566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220D819D9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 12:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 951991C229AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5F3210FC;
	Wed, 20 Dec 2023 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InHGw5DN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30959210EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbd990ad852so658903276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 03:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703070219; x=1703675019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sw1XCyYMr0CXOnLr2lqUzTRdGAWPUQ83FWhHeG049OM=;
        b=InHGw5DN9zw7ad/RZ21RE5fMh/qGkFQYFI+BVpvHAeJNoBSREJi9PTxNbIcaRv4PJt
         mixALLsR5OAMTe4w+2XjAgkLGMTSDlVHlbBqohuViAGkIVHGV5HtWmnwsV7PHfeerkIV
         57L18+A+BMvdV5RL+ET8kORZmNEy/e/J5nhK/tQaKTHdmuC1ixRUYenZmcejmua8/qBR
         Klkj+lyowfXR9Ae2NvHni6WjwA3xu6W0CTgfimx/mssUPeZoGWX+w2eWJ274GWw7QoXw
         RvIaUDOflJgqGYBGj9AKFcgHYD77/PMmCIXzM69xUjQD74/QYmEmqMtwkunxNvfYrJrr
         9lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703070219; x=1703675019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sw1XCyYMr0CXOnLr2lqUzTRdGAWPUQ83FWhHeG049OM=;
        b=XvQYAsBqTNIcko9ataDwxpfX3TGQBrSR9jPSLJwZHguBPt/5JnW6e6LYpd+ISLg0L8
         NgrbRdKU/dXjKW5JDbYzPgPl8G7LqTk1kQnpaBkEO8wGT1HixvUAZVZaAdL7CVTkLxEO
         vUPpzxhRmAoVkWFcO2IVMTRSflzyzLn5/OXmeceeq0OEe2WMzBrcSkYCA5Z9TiUKVd5m
         d2Q7q5kE1hDeDC9bBk+zYuaj2y0Ts3jjlUawlxiV7DQV3DglNRFrkQu6LbPTkeDgdGRq
         DBPx7ggnnz66K9yDhcgwlZ9pd9D9l7AggBWr1ngn+RU0CUFa4S8OnOo2g2HjJ5s8rh9b
         z19Q==
X-Gm-Message-State: AOJu0YyJSlujumoB1TmHZs6kTTOeFTdFwZ5dpOVeVnpob3HVSt7SeLMs
	AIZpT+o+ewo56x0cccbGrI0X3qmIXN9t5qK9mbwENqHxKyESD9ar
X-Google-Smtp-Source: AGHT+IGn/xjWUI1iEpsR3cljzAapQb0TjAEnPYaDQsJSA3KYYbj7HBS5nl7MZiI8qSphiA5EY2h4jSQYvoIuBM2aPhY=
X-Received: by 2002:a5b:5cb:0:b0:db7:dad0:76c3 with SMTP id
 w11-20020a5b05cb000000b00db7dad076c3mr11060393ybp.95.1703070219185; Wed, 20
 Dec 2023 03:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212094900.12615-1-quic_tengfan@quicinc.com>
In-Reply-To: <20231212094900.12615-1-quic_tengfan@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:03:27 +0100
Message-ID: <CACRpkda-vzvxe7srcMp9H_s3wXxUsH9xLq-AALc+zc7uUkyjEg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] pinctl: qcom: sm4450: Add SM4450 pinctrl driver
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:50=E2=80=AFAM Tengfei Fan <quic_tengfan@quicinc.=
com> wrote:

> Add SM4450 pinctrl driver for support enable uart console.
>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>

Patches applied!

Yours,
Linus Walleij

