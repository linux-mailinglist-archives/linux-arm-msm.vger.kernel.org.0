Return-Path: <linux-arm-msm+bounces-61877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC361AE16E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 11:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C7F07A623D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 09:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4303F27E050;
	Fri, 20 Jun 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GLKMNV5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0DC27E04A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410086; cv=none; b=bEJz6GcBdHdVjWyLjJv0BWF4xJ40vxhQQ1ZR2htWIHipkvNtid/UUsFvOJDxT5/+S7pxYzvNC7oWcD3U3o8l22I5MjAiV/cr34t3yz+jc0AUSplShxDMJ34A/SayQvI7mRGiKgR2hAmNBbbqiJopXuVzAlmdnuHXwiCEOroVbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410086; c=relaxed/simple;
	bh=YrP2gC6yzF7+01sD+adEWpkCL/eUCTLHQ55D7CZnBEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CEq4xotKPMBdxszvxVOCvI0dz+pwdfVX3Qg6Dais63hd/+Z226lhcxSWpA5udKCVdrRvXug0LUiwvrzfCBPyGRU4DEv+k53FvCSAHjOz6EfcMeFDg8bUi0KaRYIG7QCEcfXO42ujq+vHIHvbaJU1SH02dGecP4EPMzJpoykGweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GLKMNV5e; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adf34d5e698so555293766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750410083; x=1751014883; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSgGeI6RPkNX/6Nx7o+CdwyAntQHm7sGCCxVWOem2w8=;
        b=GLKMNV5e8+66ETVdxV+RUnTls6yo7Qau0lQw381r/xEXvbLIccYB48DJ6rdLxpbGub
         lH1+vo6uX8hV2BZeGFG03bcP+koPIBuQdgvykSyVyloaZs01u52zyS3fEqVzjwByL8QZ
         GeU1Y3B/ErvcJLoERnYTAmtJE1ER5/SucLoPYNfb9798VTnreEHZ19QB22Z/pFHERIub
         /PEl4DrXCaa+5XXe0SACV5rJTa5NU2IMJMfWzy07H2L4Yw6ZKGfeG2GhOk857beXefka
         W9+xHJM00h4X+TZiCuGyfABPk/xuWsDlc7T/zs5D/q6h3BFQfOSn9W/GbanRKGcn4kGr
         1BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410083; x=1751014883;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSgGeI6RPkNX/6Nx7o+CdwyAntQHm7sGCCxVWOem2w8=;
        b=CL5TDfcmWgfmKf08A0BbhnwoloIWNfpC3FMGzQ34ZJaqSzMPxRoBGVAENDeOTfQFmg
         tyvnu8ap8dcDuXP2Mevi56IWgf+0GMSyfH0iR3JrVdmIOHIokpSu5gtKhiL+Ld7pivoI
         aVEibzvfk52+bMFERd3WWQDN2l3NNDpILavCQfOoIgShc0KGpsf4QbWyPu8Msmp5pTxF
         S3xeJoWb8vsyzH8NxX/nLzslWwbvkYZhS8+4PRBLH9cQAfS/LF3EVhxRfDuy/AWtTorh
         O6TMEmXiDXKmbpIeQINjOrfPyF0BlLtTHXwUQsU5M8GjeHsJb8rXJfpgZMwNE8Sz46D4
         OOJA==
X-Gm-Message-State: AOJu0YxGZOgm1g9DUQVY94Kfxv8CMnCEGona+Iy09NRXsMJhnuiGtHpB
	RHttBsk3dtRe2VrWEwYGhjJBk4OGe/iJBtzMLlN4WiEiXF2XJOeTJqMA/KfF9SlyLuQ=
X-Gm-Gg: ASbGncsIzNnIKu4Qau3kChaVAn/QibxJGHBbdjjnAs03/5zSLAmdogAybVs1JD44gJE
	PHFLETnCsyvJV35uTKTWbpTLbkcgFOy8Qm51rHSWUokAAv4EXEMR3o0lbpgl2qwZWmWgwXTanwY
	rKXyuzKNTRkK/V39arjm9kHoYlrpTBdkDd5UH01T1TEjw7mkzAUbSVU9EwCz57saMtNbudbHUyu
	rh8c4kepaNMwYVXa/2MgeX9x0IHEY8Mut0YanyqeVegwLLf+WAOcPdjDcnilv9j1IU19QwOEQQs
	zoviRqtelTtVx/uPTtzJhEBY9s+AKgq9s58t1jtGPOSznZjMy42EW3dmWSOXi3Y9rRLm88twYIJ
	IE7ZVipi901rrdFsTPhiWXQ02F0nX0dLoEoRIToLl9w==
X-Google-Smtp-Source: AGHT+IEhyS+3Hkk2TlhfDWZUPUo2xBTpBDeJOyfp0vYr2FDqO4tGaGom5OMtaz2UPfLrKxD1kEZb1Q==
X-Received: by 2002:a17:907:3d16:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-ae05ae211a0mr151097266b.10.1750410082254;
        Fri, 20 Jun 2025 02:01:22 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408300dsm129887466b.95.2025.06.20.02.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 11:01:21 +0200
Message-Id: <DAR8L6C8LIOH.A6EGWUZJ2NN4@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 09/11] power: supply: qcom_smbx: add smb5 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Sebastian Reichel"
 <sre@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>

On Thu Jun 19, 2025 at 4:55 PM CEST, Casey Connolly wrote:
> Introduce support for the SMB5 charger found on pm8150b and other more
> modern Qualcomm SoCs.
>
> SMB5 is largely similar to SMB2, with a few register differences. The
> main difference is the new Type-C hardware block which some registers
> are moved to.
>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---

<snip>

> +static int smb_get_prop_health(struct smb_chip *chip, int *val)
> +{
> +	switch (chip->gen) {
> +	case SMB2:
> +		return smb2_get_prop_health(chip, val);
> +	case SMB5:
> +		return smb5_get_prop_health(chip, val);
> +	}
> +}

This doesn't compile for me:

drivers/power/supply/qcom_smbx.c: In function 'smb_get_prop_health':
drivers/power/supply/qcom_smbx.c:588:1: error: control reaches end of non-v=
oid function [-Werror=3Dreturn-type]
  588 | }
      | ^

Regards
Luca

