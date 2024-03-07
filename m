Return-Path: <linux-arm-msm+bounces-13589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B7787498A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 09:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62FA51F210E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 08:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4536863105;
	Thu,  7 Mar 2024 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOv7QaC4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC46E63136
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709799970; cv=none; b=QFb3WTTfw5ao9yPbWFl7qVHyXimcuqZnsI6v5BTX/hBnAF2pRu9oeHDca0E5kZ4XwSZ+iInVKZZV+dtXYl/2XXey71zKPCqsbtYmhWIhAEfldnwOD9PlkJ9wfRvRQwSOZRysfGNc8h9uQHOxe+5H9uxI7C3NvIn4/e6QMyVHbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709799970; c=relaxed/simple;
	bh=PBrebkdCpvbZ4ZAMRT2TxIwYjjN/Xr9LjZ96/P/xG7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZixUD2M3ODYhjHKOSvGoKmzkCceT+vqLop1lxKLQUci7Eb/m9I3bav7unX+quPlWaqQWLB7R/o5RCbHDyvBGkURwWClPxZ43WBuAq4qD0rsXcUvdZ8bAK0sQpapIUfO78MhXFKByChmh8VDqRzyL72P+ur9WeL1Ue3rv9jkeig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOv7QaC4; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dd014003277so488961276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 00:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709799967; x=1710404767; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6DcLOdltzgyu5CHIfol09n+T7xDDM7p3Zl6EDPmpyrY=;
        b=TOv7QaC4rJJ5yU9DOEzIn8E9ux7bx42y8xWkuxpz3aCcuOLu/aYo5Abpa9kVV0Qn9r
         wuaSPyP13ZFcDRkxZi1F+VKs5ppsHNk4C5I096E7bbSVbCoWJAGx4KWnGPiNQA576QjG
         CwDTfTsW4QxBMiIyq8RJmoOd/k1ARC/RzhTz++RbFLwynHJuG/7BcufPCDJflPoJCR2b
         yUMCCQX4HPQn7Bq5ddslmW/TDUfcOR0ix3CxP86k1sxRZ8583WR4XRX0s0tsdnU6eB2s
         IeUCAJG24n5ZC9mueDIaolAUKxWpUVnTDH390p+sNQkQoKlOiCllT6Ldu5xMT+IED0oM
         KffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799967; x=1710404767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DcLOdltzgyu5CHIfol09n+T7xDDM7p3Zl6EDPmpyrY=;
        b=KwyvYGccrDQtcYMKY0fuukp/RmVgC4/CAqZiMZ5BNppL/XpW4GCRK86E7kSzT5K5zh
         IUjXdsa32RVepEFcf9ljMFi0D2lh/hdtOwmHXBlgHPIFPco4S7t5PiAPBQtg6U8QwFk1
         bGMc+coAtM/iAkkKeAwZhwIYoqjbSpT4LspsFD4ofoE0VX3kkogxmwAZbj17nU55pruv
         XwgQKj+OLlE7mhwtgMM6SAjjbm8tHLNdT6AKB70HgmYvhSZZXIVi3ljiThnaAVIbfUbF
         DjchjlGKemtilar+OID8QmeL1/ojCep/WC82tWdL8fSnASvijK+AWmx4/hbJKXZrx6rr
         kr8A==
X-Forwarded-Encrypted: i=1; AJvYcCWpbJQitReFFBwVetYNPAXfhHMcknms5XW7so+hOnHkOUpRTUTiusWy8FFcwWtWgAJsEEDotC/x778wHm9r+a/X05J5BikBFsLkB335+Q==
X-Gm-Message-State: AOJu0YytfbZqzetre0NITmJVZ9bhxlgqkUNebpSGDfd1qJdDN0MmUHJg
	pcxCwJtYgYZDKbvoxuJ1dXjlFuv+cPlV4CtJ4zcr2YZmEZ07zdBoCYqS8ayG7w/MGuWFc7uEj9s
	ob/ENCzoVZPuViytd9sjeMLK6iQxL0ao4SiHsjQ==
X-Google-Smtp-Source: AGHT+IGHsOCpTCeuA1MgZHwchJtg+1eD6vRYmvHQnpMoHVvzORgTKaoNedGZXQv0+HzxqBuShcp/yC3fC0jYLU57JeA=
X-Received: by 2002:a25:9745:0:b0:dcd:3663:b5e5 with SMTP id
 h5-20020a259745000000b00dcd3663b5e5mr13333447ybo.25.1709799967726; Thu, 07
 Mar 2024 00:26:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215103929.19357-1-quic_riteshk@quicinc.com> <20240215103929.19357-3-quic_riteshk@quicinc.com>
In-Reply-To: <20240215103929.19357-3-quic_riteshk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 10:25:56 +0200
Message-ID: <CAA8EJpoYi3qSrukuFouGeLNrH5fB6MXcKJ33h=g_OQ2k8SV-ig@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm6490-idp: add display and panel
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 12:39, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
>
> Enable Display Subsystem with Novatek NT36672E Panel
> on qcm6490 idp platform.
>
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
>
> ---
> v2: Fixed review comments from Dmitry and Konrad
>       - moved pinctrl-names after pinctrl-0 property.
>       - removed gpu disablement change after validating gpu.
>     Rebased the patch
>       - rebased the patch to resolve conflicts.
> v3: Fixed review comments from Dmitry
>       - renamed panel supply to regulator-lcd-disp-bias.
>       - moved backlight as per sort order.
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 92 ++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

