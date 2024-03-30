Return-Path: <linux-arm-msm+bounces-15807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 307CC892966
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 05:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B81ACB22AB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 04:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC5C849C;
	Sat, 30 Mar 2024 04:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+1uMRMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CEA1C0DFD
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711774086; cv=none; b=q3n43csAh4le9cxByRqJUnfm06sVec8+cTb+fZMLjPpsuS1phJMJqJeCp050cSvfH/QCc6t2QAScKzYLr+rtzP7uwzIajZz9MhLxgXhOPxD8c7B8VOckT2hjeurA2E6beILDQwvPrezULwkzR9ssnbK2t6O5EHHh/iu+TLmsdl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711774086; c=relaxed/simple;
	bh=nOmQV1H9fSp2x3NrALQj4COL96kktnMWzhB6qZiX8aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M48dreyTolvY2cnQgLIZAjXp6uEm0TNSoZJFPvOn3NX33jGh4rbuopaUy3UiQgx/b3SwQEDrAqctPWwBtJS0OZKLq4E+ubZXd8rfLHtesOMaRONXw+IjdWQc7FQGOaJg/33goxAx4COg99paYcS/9XNbipGaA4ij2yDX6ZjqMbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+1uMRMx; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dd045349d42so2338082276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711774083; x=1712378883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dQUNU9HstbNDcHNvryhhTFYLom8Nu8/8eMQ1j/SNHfY=;
        b=n+1uMRMxRpHwhG8KTbbVJRplyvBND8i+sroyADt9uuGsXcIVPiet/79t2DhVti8yaZ
         JXx3tMNtWdggLvh9aYy49rNtN09DCcJBt55gB9kQD27tAbcS7smMjLOGnNIY62/rs2QK
         P8d0lKce4ndHoWZtmIUEvPoZ2LrLAp1s+Rxbhm8HDMtNoDGKy4vX33CC9MvYByGuoea4
         iL0qxUnVobapkYQ6F399p7WoFHlIprij6tNxx4wwFEZ5PKfwSHoKWGYzYNuD0MkuXuIf
         +gaYRH3sYXk4Dr/uvUUZ24Qz7endvnF+AtHrstT+wrxzeD9D2kfYEVlxgP94U7xW3xGW
         mA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711774083; x=1712378883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQUNU9HstbNDcHNvryhhTFYLom8Nu8/8eMQ1j/SNHfY=;
        b=n+7CA4tgh4A14WiAkyx2gHgoCdIWfvhzMgHN50TNTt0SBVIPHu8Syk0toiqaWVsDpQ
         KCvPxhUxzYF3lXtju3DX1GYlL5sLi8pgMvBiJ9CdLaJoVFlvJ76dzxqnf8cCDQzo821C
         QxDTV4HKCTX10lmzV5KGgNgiiZRMyvHrmPL20SWa9p9UqBj0L/5Dk/IfX+uHhFXYGfHp
         WCQ35Mg8R8Ale0+jVecDqzCW87pibSP7YQVU/xlxPxgFZ+NuwAvzLGvwMw4akga3krah
         qSttU5u0D0O6+mWJj3DZ3/4B7yX06bbO1/YQQh24LiBjS9t2l9Iti+7bdiOTbiprK3Ed
         fyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQxDEEdRea0lTDeysXqTsAxoO7xn8XteJgAIAPrRyRKBtTvjcErfNbeTd5tXj3HXgle+fn13L6fGJH2CQckOrmDoFSjvkEfWiPzPu80Q==
X-Gm-Message-State: AOJu0YyEff0ezzEDqsKs6U+3y9uHVGYfMX5ovEWeJfP4G8lIi2qjnt/T
	klFa8QXFE2yaP0FKMPquEvQraRYH7fF7hGNmO//yj1dPo3vqCTM+GTjiAFB22PbZPmOe4NvISom
	5zqhjbT9vzEk00b0KWpcjFGjBKyt0e2aBSgUD7A==
X-Google-Smtp-Source: AGHT+IFWm8FRcfrc1FaMw38a0VeaKMDMlu7uCNCYORdT1l9V5pI2sSVpSQMKObFG5zVf0CeqF6rlwAr3XTYwJkWkMCE=
X-Received: by 2002:a25:10c4:0:b0:dd1:7a16:7b4 with SMTP id
 187-20020a2510c4000000b00dd17a1607b4mr3520574ybq.31.1711774083391; Fri, 29
 Mar 2024 21:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 06:47:52 +0200
Message-ID: <CAA8EJprpmC6+ePxw_G6y9YEszndq1VonS1HP=aP9OVHNm42LLw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 10:16, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
> modem DSP via the TQFTPserv. These MBN files are signed by the device
> vendor, can only be used with the particular SoC or device.
>
> Unfortunately different firmware versions come with different features.
> For example firmware for SDM845 doesn't use single-chan-info-per-channel
> feature, while firmware for QRB2210 / QRB4210 requires that feature.
>
> Allow board DT files to override the subdir of the fw dir used to lookup
> the firmware-N.bin file decribing corresponding WiFi firmware.
> For example, adding firmware-name = "qrb4210" property will make the
> driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
> directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Fixed the comment about the default board name being NULL (Kalle)
> - Expanded commit message to provide examples for firmware paths (Kalle)
> - Added a note regarding board-2.bin to the commit message (Kalle)
> - Link to v1: https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org
>
> ---
> Dmitry Baryshkov (4):
>       dt-bindings: net: wireless: ath10k: describe firmware-name property
>       wifi: ath10k: support board-specific firmware overrides
>       arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
>       arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node

Kalle, Jeff, is there anything pending on me on this series?

-- 
With best wishes
Dmitry

