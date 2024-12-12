Return-Path: <linux-arm-msm+bounces-41816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90E9EF9DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64F3F291EBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A452210DE;
	Thu, 12 Dec 2024 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALdtDZAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F61205517;
	Thu, 12 Dec 2024 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734026088; cv=none; b=D3AjC3HblPlA0TvScFhaJcY/LpeJsI6OEE0+8IJzXl/EeoDTOiFnubpSr89xrRzqzPZOW+ecmPr9yzgOPKSNtc3M3WIIVOYod5JN7d98pG9nfvqZRHZitvbax+Q6U0uER6kNp/fcYKobPctvIRpkULzAvnIU3poONwgOKvJT7iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734026088; c=relaxed/simple;
	bh=p/HN6CdZAvei/VulZkwI8/cLQWNsMDoxLafFxDvCiAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kWpRuFriU+/uSJHFs6WRpq4rUtE5qtCNWEcWOj2KZiDpiGjuYyGC0aUbFVTst/m3qC1weib060WD0C4jnsrBl4lFuRsTleBK0whjATmqaAvcAqK4a4RLNSt0lh8s4Pmau2cB+t27e//qEBuzl7/k+nGcSgoTQFcFEu+GqSz77xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALdtDZAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FA4C4CECE;
	Thu, 12 Dec 2024 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734026088;
	bh=p/HN6CdZAvei/VulZkwI8/cLQWNsMDoxLafFxDvCiAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ALdtDZAs2h9cQmO8HxOCZMC0TED9rRl2gDzZmsUa6KDXyZ7IO5Ak7xCT5heIumzpD
	 luF3bSQ0HM/n17POZa2sd65vhCS9zHCHeSh6ERlQrpDtfjhApV/jpzjRDR4ZHl8CIH
	 6V5hyyb2ZNRLFd9jl1jkevgPelXVZNc76LUk4usPLmFKvdqtNNRdJOc7qUr6oRBoKH
	 eWEczrWxwrsnohu0XKt/VeVNK2ueIgSygyRMkNH77kcD6yZGcF90siyQCsEsYqJAuL
	 G9zdzDomjrVXPZj2/RpUmgKcbLZAJv3rt9nms5qJ9HoWcmMZf6nLrTgwW0NFWCawrC
	 iQSphrMz1wvdQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
In-Reply-To: <20241204141416.1352545-2-quic_mmanikan@quicinc.com>
References: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
 <20241204141416.1352545-2-quic_mmanikan@quicinc.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add
 compatible for ipq5424
Message-Id: <173402608585.2262320.14679766137651664830.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 17:54:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 04 Dec 2024 19:44:15 +0530, Manikanta Mylavarapu wrote:
> Document the qcom,tcsr-ipq5424 compatible.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5424
      commit: 866fc5a03441c0c8ceed2bf251555b7d2d95d0e9

--
Lee Jones [李琼斯]


