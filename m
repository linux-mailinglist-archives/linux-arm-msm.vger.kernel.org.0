Return-Path: <linux-arm-msm+bounces-14716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0AC885771
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54321F21304
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 10:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DCB56B68;
	Thu, 21 Mar 2024 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J8mTdNpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F413A1DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016928; cv=none; b=NxaaWd3Q7zEY91rMDATTE7/ZENihPTM3qZXILFzT/uTWH+JsASiG+gEkdssJr2XXDs4NXoEy+2ExMcs17Ntpnz08wNwYeXoTIGBgUFkLocmzrCcrhgydnNQ2X+1qlcTDt5/aZ5ACT1MyO33FKed3tUp0DWbe7gfClqAte/bX5IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016928; c=relaxed/simple;
	bh=sBumMZut2B1H9SXaoSyAfz8Dv0/kDq0UpwwUBEyPe0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HU1rnBIOHoVBJrhUCQQcnSgWb3uCtPydqrIa2B3L5PEJ5XJEu/hBHEakAvjVDhN8lIR28NuLPVUjRKoAZ7uqo7qno6bOSmXZKIJr42CIF+1dZDhg5zVNGM5/35IDpn+C/fGa2tteuil8QuLZ1UCqXKhsbc55O0NrQpg7vT3Dw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J8mTdNpT; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc73148611so802959276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016924; x=1711621724; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AKR4ns3MqNzj8KEDAsBBcau/lp94Er5oC4NBIHHopRs=;
        b=J8mTdNpTmNmgmLAbJhotmM/l9hg2Vxglq65OpP7TMZUM9Y7n3jVDwANjpqI+tcbN60
         XwCtEOb6aB4YACKbQe3J7FO5aCKkNpn3AAUNfCDXJuMXQ2D6ATRRW8k0YudUFZ2qtyDK
         rpwP+AAn80+AD6JxVCKSE9gee8YMH8G/kUJa6OduvuO9LkdYW2U/HFa+ThgSX/2+mh95
         vExkj+yu2DV6kAYlAUKjSQNhlzLiwr6W2qDqwIbKSPFDfGWIHYIYu4xWZiPkkQzkHtuX
         7AMrVKIs6+TH3KLd79nv79mDZV4ekVKrCn0Q5uVuaG3u68zE5dZaN2pUJOW8UoW4HZYk
         ga4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016924; x=1711621724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKR4ns3MqNzj8KEDAsBBcau/lp94Er5oC4NBIHHopRs=;
        b=QiIhuovzWgZZJSAMm2hBhkvzf+iNWmdV87RlImRzIBAcYrFHDt4vbFDYFJEQF1qGDs
         BsgMm2sr5vO4nUO0rsxi5AbzGAyDl/+LBLmM63tu3B6adF1crpsl+0n6RORETFXXOjeP
         MOrWtWP3ky4A0EX3jYmyBuDIxxvOsiwWUsr964GE2tkmVnI/7bCXQjcSMEGuCk5a9vKn
         s9K7QX1lY2OxPNQUco1VcnYFqiklDTnXZGzqmeV4jKmVT9yVNel67roHdBF1vcP97Fcd
         ycBUdnhwyJ1PR4/PF62mxTseLNnaGwEHE9liaS1oqi/OJLYnRi4urmKeWwfV1gxmbSiK
         cBDg==
X-Forwarded-Encrypted: i=1; AJvYcCW0P6zcRPst904cPDhhm9Sq0v0O80FGtdRQWv9y4S8TC4i2OdfSf+3akrCaU6Hzt5xg7EqJKYn2cNLWLVp/KkDiL+SOkKkRppCEnI+Mgg==
X-Gm-Message-State: AOJu0Yz20VEo23s5RsNEQ+9qDm78085LnfjGMtqDYXyWqXCRNFg8YRZw
	gaopPGJs0RvlbEmjJDEIpZQ/Wmi8tcqI48+AsQ3otvXd30LQHRo23TMS670KURD4ktoTJeCcEQP
	09e+q7ifwT/tLVFP5kjgkM0yLc6putzAStRB6vg==
X-Google-Smtp-Source: AGHT+IETG/rfT4UCPwIL6SU4sfhZXcsh/0wacPA3Q09Ay/MZih0yDzYnOhnGRPnhcgYWqmzQjimC/j+kn1f7J6rQhK4=
X-Received: by 2002:a25:7483:0:b0:dc2:48af:bf17 with SMTP id
 p125-20020a257483000000b00dc248afbf17mr19150907ybc.62.1711016924700; Thu, 21
 Mar 2024 03:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-alpha-pll-kerneldoc-v1-1-0d76926b72c3@gmail.com>
In-Reply-To: <20240321-alpha-pll-kerneldoc-v1-1-0d76926b72c3@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:28:33 +0200
Message-ID: <CAA8EJpojZonVnOLdmrVU2NQzJ4G0KOjVvJ2f4yCQ5Zhs1yu4UQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: fix kerneldoc of struct clk_alpha_pll
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 10:59, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> Add missing descriptions of the 'num_vco' and 'flags' members to
> clk_alpha_pll structure's documentation. Also reorder the member
> description entries to match the order of the declarations.
>
> Eliminates the following warnings:
>   drivers/clk/qcom/clk-alpha-pll.h:72: info: Scanning doc for struct clk_alpha_pll
>   drivers/clk/qcom/clk-alpha-pll.h:91: warning: Function parameter or struct member 'num_vco' not described in 'clk_alpha_pll'
>   drivers/clk/qcom/clk-alpha-pll.h:91: warning: Function parameter or struct member 'flags' not described in 'clk_alpha_pll'
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Based on v6.8.
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

