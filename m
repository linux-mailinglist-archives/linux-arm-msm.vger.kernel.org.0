Return-Path: <linux-arm-msm+bounces-20571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D28CFC7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E479C1F2105F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437137BAE4;
	Mon, 27 May 2024 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SP/XQ3mb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A06CDAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801046; cv=none; b=RK1kVFfbtvgHikR8REoEtlOn715X3cduTGXpGW3B17dXBORdLgrEaBffbSAC3xGjw6x6pIQahZUJJWXRpfMQ2BZb47fulMda/dSRq4gKWFoXNFpi2Fi7wKCYyjSd88M1GXwt4De6iUOeqq4a1kPvLihwFTDnBlPiMYgk4sXjdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801046; c=relaxed/simple;
	bh=/rZwwBTBzv9nlq8D/sB9Sj0F3E5+t+fTKDFHjqWy9ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyB3lSSDjihXceU5FuYynXRA8Ui/qGS6xdDR/tz3bF4I3HsJtx36h/MIxR9F+dkdPHZKW5lmZXvCKAl5rguxoHL6MwlHmyHTa0dlT7wBZd/aaWtPG2OkZ3LIcmZzOMhhxqAB+W8y5XEvg+WP6Zd5YT+TZYl93A/P+deRsMoQcHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SP/XQ3mb; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295dada905so2431058e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716801043; x=1717405843; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6qtAud1ds4eRa+mr6V/f9A3wvUJWlvlDifsSBdSKpCM=;
        b=SP/XQ3mbE+x5PZlngVK8xQmgng8PC6v9F77AvhD0eOdcnnRef7r6BhG9+XBMR9S7Mn
         zd9vseOFxN2I7Eq5+Ym4YwllDtErSwmrvi0b9pmTzo00cHa1ytx6vibyRhrjXJMnsVKd
         QjXjZUg6r3p5efUnaAgfmuokkljhk2vtRJ/iHhg9sLu9Wg26ZzNjwJbWOpOlyCn1LdyB
         wj/L7wi9Y0KBox8eyeMEsWK0xNhqm7kLdU61v0talJm+YqBwmAtTHf6z+/lvDyKTrLQb
         3KzOpOOLoJEztaNNO1C7C/L5k7RX3myJ99dTYuXdLVZsUiFBC6jYsNdvso99nvdHlPVD
         qswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801043; x=1717405843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qtAud1ds4eRa+mr6V/f9A3wvUJWlvlDifsSBdSKpCM=;
        b=Z0+yreKoSISDIqDl/JesyGtu9IuJ5V+K9qrIwDq9xklxEMf6rt30mCVcz9e9PjrnL4
         4OlcLKGCY1R2a2SDCLKaOvtlu6RU5BeOAddW9FI6gsvzI5k0GUGOTdu9lGJoWfDlUKle
         sCFw9vP36EO1KAng/zIKT/vDOMJk/nmv3eW0k9SlFdizQEBk+VEsYPvg1CG8KbYoIwXo
         J1mAgEs6PWcEFJFo/oEH+xzPaX05vtpPyr+OtbLWEjGTh0ACTJgUaRHcGKNQC128s4Y4
         lwmN1LorB0e7u4YElBqIG7DqsdNQhAGrOLcYbJEm1QOTRE3N0qoWe6PY5WgW8rRppcx7
         qkMw==
X-Forwarded-Encrypted: i=1; AJvYcCUEzsldH2OubSFtsbc9igndOlxwrOo2vBZev4TeBaGFxVGUnbvJy4CcOaw0Xmis/W4HKXHKzQ7blDmccC2LlIYx7/5rWuhESuDzz/GnZQ==
X-Gm-Message-State: AOJu0YzKNs2/rCKn63AnKnK/NOaTSKCvFbcL5Zz7k/kvIdKMFM/ALMYP
	w1lYM6r21X+wYa1MrbpcHl+R0dFTpzBHNF8CZCLZLyrysj5/01VfnAa/YR8vkOk=
X-Google-Smtp-Source: AGHT+IGXwKBXQrx7DyunHSME6hC1+E9VCYwulzjZWrqnRjoVgtvEY3Yxnw0gbMGqXaPlzdRw1AMMRg==
X-Received: by 2002:ac2:511c:0:b0:525:59f6:7 with SMTP id 2adb3069b0e04-527f14d5256mr3466896e87.32.1716801042615;
        Mon, 27 May 2024 02:10:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a5fc6236sm259236e87.248.2024.05.27.02.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:10:42 -0700 (PDT)
Date: Mon, 27 May 2024 12:10:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Enable tsens and thermal
 nodes
Message-ID: <wuqn52aiortybhvhmtdvavb4xlxr6rxt4jxbjhv3xrtivv376z@gzqzr7624gx3>
References: <20240527-x1e80100-dts-thermal-v1-1-ea13b8fa6ffc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527-x1e80100-dts-thermal-v1-1-ea13b8fa6ffc@linaro.org>

On Mon, May 27, 2024 at 09:51:17AM +0300, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add tsens and thermal nodes for x1e80100 SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1356 ++++++++++++++++++++++++++++++++
>  1 file changed, 1356 insertions(+)
> 

Please review the thermal zones configuration. In some cases trip points
duplicate have their values set to the same temp. In other cases they
have "passive" for 125°C, where it definitely should be "critical", etc.

-- 
With best wishes
Dmitry

