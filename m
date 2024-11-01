Return-Path: <linux-arm-msm+bounces-36682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 428969B8C02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A981F230F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB739155303;
	Fri,  1 Nov 2024 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJya2eW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C5154C0B;
	Fri,  1 Nov 2024 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445968; cv=none; b=HXtzb5CgFBAgUFuBpMEXlLwwdm6ckDGCNa3/rL5cYnDC6uQhcrCKFHSWnOoERS4I93Z/CR2eLY7gqjDLerLcjeHXbM2l/KaviQ6q2CkF2fAF0mbdwu4oVzBrvKZq0L1Z64TqqGFJIEcVG0JU3O82qUxXOj5CwmsLeCFVoXC8bu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445968; c=relaxed/simple;
	bh=HY9+PuUwlICUs5s5VIBeX7iAYF0RKIVQtbKVMOHVchQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRG9MRSEs8tspr15cIZ2hos/nTGkU4gZy1xHB6CVhhA3tLEyLONpp2H0jrTz3t9Q1XK2Em8+RwNB2O3yseMlQjEJTGh0oX/Q94Um9dYU2CBcVNEWAUu7DREuSP9dpxRNct3mUsuJoXuS0Zf5h6x4dbVSmHmSs7XxobGo5orxYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJya2eW1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08944C4CECD;
	Fri,  1 Nov 2024 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730445968;
	bh=HY9+PuUwlICUs5s5VIBeX7iAYF0RKIVQtbKVMOHVchQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJya2eW1QPzPiPV6LaQrm30Uryq5yzS4xPtq+5eusVNdzsyKAfF0X5N9SHJmegjir
	 xcrZp16eVxgd2P7gG7TZ3hx47lTL3aIIA7X6P+va/Dx2mxE0NIM6sWxh0nd62Inh2q
	 MC/tlw6wzEqmzhgRnCbS+Ic5hjdjzM+F5JT+uCbijT7EOaShPqbARDQZMZBprCbDVv
	 MZOt9JbEYm8ovm/KgwZ+Q2Bv10HAOyJGvJFaQeD8bE2u4Y59K4x/+DA35/+ZxB6UVW
	 pP2rhvvY2K3Aex5zboFUjNCGNjwjKD6ZtQ3Ov5VimLHK0CC/f5Lo/lyIJeDl1TWQPZ
	 jhBEouZ3Dic9g==
Date: Fri, 1 Nov 2024 08:26:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: simplify SoC-matching
 patterns
Message-ID: <pmgutki3fjqbka5ozalevpw7qptmzykhqxiaofqc2nh4gpnn4f@bgmz6fknavbf>
References: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
 <20241101-sar2130p-dt-v3-1-61597eaf0c37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-sar2130p-dt-v3-1-61597eaf0c37@linaro.org>

On Fri, Nov 01, 2024 at 02:49:22AM +0200, Dmitry Baryshkov wrote:
> The patterns for individual SoC families grew up to be pretty complex,
> containing lots of special cases and optional suffixes. Split them per
> the suffix to make it easier to extend SoC patterns.

This is doing something quite different - split is not important here.
Instead you narrow the patterns significantly and disallow things like
msm8994pro, sc8280p or sc8280px, and allow things like sa5200p.

I don't see here much of pattern simplifying - dropping (pro)? really
makes little difference.

Best regards,
Krzysztof


