Return-Path: <linux-arm-msm+bounces-110307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFSwCs6wGWqiyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:29:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC453604B42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09EE63113316
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330C33F0A90;
	Fri, 29 May 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wr9MG4XV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7893F0777
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067263; cv=none; b=iQIMkTkDOisG771BJFiUElfO8QQqtTlm4FfI2yLXYbXyse+uj673/DtQZNOv7gfu8MCu59c5BMF4lJyQaqqbnXynuZh0IlESmbr2JCr4t+hg7nG6vs/aPC7bcisP25C/J5PYfY+zY4cDK9+PNiQEJ07s6NcWVnpGmAD3Pd1Lh8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067263; c=relaxed/simple;
	bh=tF43KjufwHIu80KkfJ7VV26iopIlq2XuutVp9qCHPRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECxyWwPOzcoioN3ftwUUyflrA1UAzITj7ucXONF3iI4iKG5IhJVKJ268UC7uEpYJ3fVfy7YqzmadMUe0C1yN6VQ7y8aUpkQd4RIuiSI0fXrc15muCE0QrkwxEZER7nPNuv6EFrsXqBZvGcYlnz1sWgt1jpN7PxSAGPQQUvQqOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wr9MG4XV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490686877a1so41299205e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780067260; x=1780672060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMsYKu0rt98o4CUIj1PMUPtxut+9KNkzkjaeGCrAIPg=;
        b=Wr9MG4XVrb2AlEpJ2OuftCHDddxh00iA/NqJ0CsRzpHi/XPGFame3B5yHnl6IJeYPp
         HWCx0p1d6cp3GYZH5oUyta/eCJA/TaChfDViofKIwI4LrI1wlSCKzPA24Vd4d6c2lMKU
         ADxrfJXu8d4beDprcfkHcPEzkJr0LI92X/PbdIVnekcRK/u87aShycKNDOEgjoebYNt/
         P0G1yhuP5+OP1fLq3HNmvggckV+UNHmq1ASesLiaebrMeUuh79+gc1SHai1UaWngeqO+
         1JS3EgeCHzNnKrWy+VnqxUCdS9KtBnAetNWPMrYv9uVsblLvO3wRgwW2XXz/3avIFk1y
         vZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067260; x=1780672060;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMsYKu0rt98o4CUIj1PMUPtxut+9KNkzkjaeGCrAIPg=;
        b=XmZn8OqTom3fW/ffqLmAepgOwNyAVp4V4b3TFWWD8iihs3nIwSPIFUfukQHgo1IVyt
         CwJwDsXTK/6UkEB4c265xrfA8XibOcEyjtK0TiI3RcpaKiBy50WkYiJwpfeLKcdf1p8n
         hdzYl0QGptcwNb8DXUqokiwcGuoc+Pys36d68nZlwtwnFVitXIC6uFAK1SLvFB+l1qhi
         OYcJIezM0TsMlRcVhFiC4Hs1y8d8OEmeQ88macrLkaIM+xe5n3XYVMb5x4kQxsqXjZjs
         u0qC8RhHSY8x9FuLeUyHZ/AKB8L5/XP2lc7E+cPu6iKRiDDFGBPzNohiihE3/M1adzkO
         3B7A==
X-Gm-Message-State: AOJu0Yzf67xsjXGrY8hlXePiGbzs/RhaTp//jw+lZBloGNp9NWWYJiB2
	pIhDoMd2JiRydVOwTsdeq9pqE/hh09RZS3iaHwJrQgN3yzqQSCGAqibsE12qmhHyJaI=
X-Gm-Gg: Acq92OE6X/pRq7FdxYYN42RHsmYKGqKPclTD0GSgvDT/SMYxEA7SxrTGpegIe36s+1S
	9dy1WuxEwVjUo8XM7yqoEUrGNG8tDX7pti6t/BVZmBYzjcn2uPiWni+jYZcusG0R0bPud7jrwtm
	FJ+r3+B+/qx+KquEAlUPsoEyQ4wnetDrsYlq2t0GmQn2Di26rclGDTRVtn10KxQGPNyxnr2A508
	uenRCDMojOH49DMWQKu1MirLwRd3FqTCx8c1vhqot7DG84dEYNfNce0juLFUz55v1YUVgXtUc8w
	8Xp2S8sJLxZmcbrNJD2ciXrXju1bbkpIpaQS9YeGN7g5+AodhM90UNVSw/34M0DfSAfANmNc9pk
	1JqxZ/KAZoxiIAIfp7csi48T6A5UqpnZPXt064cBtM2eJUXfZ2A7Km3c4NnCFmOCaxJugYcvUAB
	+D9VAp4Qw2KCR4BPMfuX+BNWslzSTcmKtcaudXJpsDVDk=
X-Received: by 2002:a05:600c:a30f:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-4909c62603cmr38449265e9.11.1780067260267;
        Fri, 29 May 2026 08:07:40 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a04e2sm3789037f8f.1.2026.05.29.08.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 08:07:39 -0700 (PDT)
Message-ID: <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
Date: Fri, 29 May 2026 16:07:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,glymur-camss
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110307-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: BC453604B42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 15:37, Vikram Sharma wrote:
> +
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to CSI PHYs.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs pll block.
> +

To be brutally honest, I'd rather see effort and buy-in from qcom 
engineers in converting to CSIPHY as a distinct sub-node.

Pushing patches to hit your own internal deadlines to the detriment of 
upstream quality is not OK.

This binding should be predicated on separate CSIPHY nodes. I've 
published... three perhaps four versions of that patch to radio silence 
on your side.

---
bod

