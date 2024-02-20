Return-Path: <linux-arm-msm+bounces-11938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1485CB03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DE35B21E35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A0F15442C;
	Tue, 20 Feb 2024 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9ip4Daa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83D154427
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469083; cv=none; b=EJJ6en0pF330nD0tDWpwK9+tHkWeLmT8GTl4ZJgjd3Ko2hhK1qUYOg6TX0o2GZ/yg178GNxQFiLuFlElA0ci/uA+8DRHNrKZ9tpXoUuSgV061SG6gvB7nMKdrST5X3NjyylpXmClU0hlCYYey709kznzAzo73UU4sr7CJ3b4Vk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469083; c=relaxed/simple;
	bh=KmMay3AHFlc1aguHp9/TkpQKADQaXT/Z55LlMD/bDfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sssf5M5WvgkCn8RhxBKUw86NJSInPok1IZdQq34Qq4VKfh7KI4DYtRQnN01lZS96RE/LPizXOF/KKA5isDnAi/HBjGmRk7tVGcmZmdHRKUd6ACoj2ZgcLwvsGqQzCgLtDa3+nGmR6x9CcsiX8xrYV6ehvoqAr7JKZHsM7wy/lqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9ip4Daa; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so4633585276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708469081; x=1709073881; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Er5VAYhNSWIzSdSLpbthmXT3VmJJOcraX1chMlaJ038=;
        b=e9ip4DaaSIucVffpkgI6MWxcAOLvGY0wW07tlfsseyNTUWjG1AvBjxcs1QB5bxJvFC
         ZjHPVV5JjmmgV7D4Y9g0dxorryX95X1UASUAk0KGSkinPrKt8CqTws2MDFQXwo44iuV4
         TAwoLW1XrgAW+T1pS/c/fSb2Zc1ZF/X028CNuFIIjsOjuuxEkUvTkZ+6lwcDyjeQ9U8B
         PdMYxFGqo6ZQYXqci+BPH8jSZQuKTpZIPqT/ZBFId0qBSkS2aP4DXk109jstHF4M7IPm
         OR1ZwQgKA2HdQPYXXryUwEaV5/H7l0M1WCI22oTkAILykFeLYvylhwRakuMrbTCObP8M
         aE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469081; x=1709073881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Er5VAYhNSWIzSdSLpbthmXT3VmJJOcraX1chMlaJ038=;
        b=gV3SB8dm8paDmYTPnkCC5WCc1ZrMutJOaOH5eK8VbV9bcPGg7VRVIhm31w+NO6I/wJ
         rkdu61mig8GyvR+E8YOWEBwAhHU7bAQtKRRp5PrZ/kw8cocGB2nGcF0ByVPJXDISsG4u
         cJfw/f9f82rexFJfhW+hzqaCGDeEC9Py4pdk6VMb6qZMPXs2vPTMiL6aMM0OmAclZ07d
         aGCBwPri2yWxRrtgdTIzxbdB/CaQ+xRZx0xugLjviNMVlXnN+sq7hEKNiS1n06WIuP4I
         V9V4Dkh2SjWDwDteJtsZy3cqOFhslZU9tJ5JVqEnr6xW/RiKcaqKh1AFnHUXQB3umq0M
         u2sg==
X-Forwarded-Encrypted: i=1; AJvYcCXxNUpFw7yn8t4/EyF2atGX5gehd6o8fd5wDkpwccGS8KXr3BmnEqNRuaPB+Qbxz7ZmVnUUIQd3/wMwCptZkUkquImI75Wc10HEwZTETg==
X-Gm-Message-State: AOJu0YzokhwYeVzoPi9IxI7sV5XtUTi/XyKLKkJiJ1T5BXNlWsd8xSWN
	LLGnGfKiwErHzT76k/clcDkjw53VQC+eRVr3QuCcxq6zwUk7ITmnvzsCzZZQ/gtu5zBGBtiDvJR
	azIEdfTZWpJwGYQemp5ogCfRSMCOY8H6xbTqoqQ==
X-Google-Smtp-Source: AGHT+IGck60Ujjz3YKtMApNGN0o7Q3lIs5rKyd+3XwSWjBY5bnHdduoZvVu6VAT2sswGZi36nYAlChFKILL3g+wOCIk=
X-Received: by 2002:a25:d6d6:0:b0:dcc:7ad6:24de with SMTP id
 n205-20020a25d6d6000000b00dcc7ad624demr15259122ybg.0.1708469080739; Tue, 20
 Feb 2024 14:44:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-phy-qualcomm-edp-x1e80100-v4-0-4e5018877bee@linaro.org> <20240221-phy-qualcomm-edp-x1e80100-v4-2-4e5018877bee@linaro.org>
In-Reply-To: <20240221-phy-qualcomm-edp-x1e80100-v4-2-4e5018877bee@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:44:29 +0200
Message-ID: <CAA8EJprDzKJgU5OfMoDG47KDp224mT8V+-q3cVvGjQmPjho8rA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] phy: qcom: edp: Move v4 specific settings to
 version ops
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 00:05, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> In order to support different HW versions move everything specific
> to v4 into so-called version ops.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 183 +++++++++++++++++++++++-------------
>  1 file changed, 118 insertions(+), 65 deletions(-)
>


-- 
With best wishes
Dmitry

