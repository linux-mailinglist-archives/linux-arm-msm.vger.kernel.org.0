Return-Path: <linux-arm-msm+bounces-35197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A79A6181
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8162F1F212BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE29E1E7C29;
	Mon, 21 Oct 2024 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekeUIhGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8431E3DC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729505178; cv=none; b=nU9BQFlvwXLK45cKNvbQXskVTLvnLHC7Sw9SWbk9Co4BiZn30pG9ShQd+0lQFjA/IDoJqe1qd4B4SGs68DsHslYxQimFscENy/cLvSHmjzTkUK4iU75YMGFm98rLFU5HdBn7R3TUVdtw/6AU+9XXXKLJf/qdguVtoxtlkzrp9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729505178; c=relaxed/simple;
	bh=IkIwaxiVQnThLvGv0yyixcoZ/tGJwbeD68R0Qi8SrPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5OJGesvVe5s0Ard2JbcEv2qaEmIZoglH9U4aQZJGVLT9+uJqt9s+A90jwNG2xWRdah9P48eU9KXEcYJzkiOnoiNiXwSCevvWhdAWpP/NqCPlHXaFUi86chG2PQx3B75XxjKz1krcb7aECMjgnj6KjwsH1ZpcZGQ53RhHa9bJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekeUIhGo; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e3e4f65dso45263347b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729505175; x=1730109975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GsmefuCLy3782StxBxP88Vmmv8aDiOgUgCUBIcd2Ybk=;
        b=ekeUIhGoDf1doLlsnYp/mpGeZEL1nbiYAXWbfae3/TjZazJRB9b4/yyvsO1N9QOY1s
         aaXAtt0sUHf8HYF4YIWp/KejB6N1FTzdgaYOrUxK0sSF71eIZEX5ohmWh6l4S5YAihjT
         M0vLaIku9mP6rdoNUCVkKsVtBga9sbPSudSUEIXQGtMdckiLqnvb5HlBO/IAQfZB5Qkk
         ujidnX6RpDUqI9BXMDHRU+PrvTSOCFHhQkjbh/5be86cmTW+Ypr2faQWz4Zj4PAB1Hfa
         vdZYslrrZ2ZLQprSzoAjfzvC7pt8gw1IVDxzwQ6bYi+Vq+JHINHfh/QFNGWeFlZJyLYI
         2eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729505175; x=1730109975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsmefuCLy3782StxBxP88Vmmv8aDiOgUgCUBIcd2Ybk=;
        b=RSsPU94wTatQUysfJBJbZ74lfEhezafoKJUtKYAQNS6gZfd2nORogy/kkpArPq2MBM
         /btK97Z1g46+H3KCeCzLovH4I10fDhcQfjxkUddvsBET9ROEYrDpGh0adOSM+SWGkucn
         6v9lRDnCkbO5bAY/w7YiPH/CJq2gSnhAbm1xJeDm4wfFfzDnTrZGEkhrDDSpHoJSuhf8
         F6uGhtuTbDM1O5NCFyAHg/jsdkKO/cNqcyG29GR406DsuIoE+oalCakb1YQ+17TjKc7u
         ExZH6kIMegGSsu5XSbhGK0lAnfEKKpqy5XwPFe+wZlOxdHzc5ORMFo0Yz3hWmB5MD5l/
         txQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4xBxnpdoZcDYmrtD1koJIsgL6zq7Elu+ir7LwYv07jB59q1cLHw/UyQ+X/uJZJxGdlnEqiXJU86ybsKvh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9wykmi5FZRtEUXau3PUFckARduFc2acMozC5EJ8SwHeXe5tS
	LM07pB81TBB4nejtq0KrHWmbZHohgl48Ujf/P4M02jvDdDlQQ1q+bcCcHdLgWZ8YPXD9uLkED9I
	iH0tMMVulodUbnjoskDGiW30yxBSuUUVF00X1Bw==
X-Google-Smtp-Source: AGHT+IGOSTY2exEdjJUwtklxk91bFNLum+uKyLKxuCCBfJbzs2BqXrT/kAOjREMkniMhG0JWTTfDut+gz1PbEoQ0YQ0=
X-Received: by 2002:a05:690c:87:b0:6e3:29ae:a3a5 with SMTP id
 00721157ae682-6e5bfd4f8c6mr101900967b3.34.1729505175322; Mon, 21 Oct 2024
 03:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
 <20241019-sar2130p-phys-v1-1-bf06fcea2421@linaro.org> <ZxYEV-hS9NhlnhYZ@hovoldconsulting.com>
In-Reply-To: <ZxYEV-hS9NhlnhYZ@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:06:08 +0300
Message-ID: <CAA8EJpo++Oo2CfG3E56piuyFW4yBSC1qzcFwJMV2TizcrxZN5g@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb32dp: Add
 SAR2130P compatible
To: Johan Hovold <johan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 10:35, Johan Hovold <johan@kernel.org> wrote:
>
> On Sat, Oct 19, 2024 at 06:44:50PM +0300, Dmitry Baryshkov wrote:
> > Document compatible for the USB+DP Combo PHY on SAR2130P platform.
>
> Looks like you got the patch prefix wrong (it should include 'usb43dp').

Right...


-- 
With best wishes
Dmitry

