Return-Path: <linux-arm-msm+bounces-8382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD183D135
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 01:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EF101F239CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744C61B7F7;
	Thu, 25 Jan 2024 23:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcXZsxbR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A71B7FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706227159; cv=none; b=GWHHbQlZABIghTLADHKExt4n7FF1gKipufxKlGmc/fjvj/z/lH1PtCHcL5Exl3gxPnSqRrgbbsFhYRwqdtMi2JFA7tStZ52+kba8RwgqJgB4qrPPp9BaaELgpYhUQaM1Y0VE+cTxo5QPhiX4I57TA3/pYXJ8jSR1JVFWvv96JJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706227159; c=relaxed/simple;
	bh=rusU3cwbLcLm0EgZ+tGMebOsYGVKoYRtgz6aUqsAS9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMabLDuUYdeGCvOEaNWwJ5dV8rlDZWpbxU9Ts0NARxDBfXc5Qh7Dcd8W8b2Yw9n8z+n3n4ypnWwekMZi+A2pQWWXOHpXX2NdA/exzvFIKztqvJhcSrs4KBBXfPmNdTvOl+fMlkbrgaUco0pbL9XlSRspFPAsWvT9B2lvQAmpT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcXZsxbR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50eab4bf47aso1386933e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706227155; x=1706831955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0uvR4k90nJUoTmw5mM95zggQNT83JXcHe60niGgesQ=;
        b=KcXZsxbRzUOVHmbAgLuLITkDj+Ve3/Mi7f8gRWeL93UtO1aAtIbn8F1ylKiSLPS1oe
         DT1y15FTBtyXRMDx4VsG4TRBqVS7BWdnYOl7cXysS330gIOdqOc39XwGhABbCGf+JbLY
         qTvlSDAHTboYvJZZq/fL9rXIorNKJeg+u7oKKkWBL8W4L6Uj2Ezq1js/Eyjs6YeDTR2w
         i5J0P3e+knO8hQfnJv/spvNKqRIkfYZ1/n/DMcX6PIQIQdH/xY3+NP2ohiX0rxQk06I8
         rujtjSRMykDbj9mw2pVUWk1gaAVccFf+qTOKrXf5LAeVvjujbmcvafpayf1tF2Ih8JtT
         bJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706227155; x=1706831955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0uvR4k90nJUoTmw5mM95zggQNT83JXcHe60niGgesQ=;
        b=nCiDYRYmbQJIG5fBlscDixdBaN65CkcJtoXs8lujiEfZ3udEy5oQvlL2OGNDCAMtME
         yZ2Wunz/9b+TSmrU/JGtBZvlGOkLZZKKLqlYc2VKXPT9fHUWypeQ0+Vb5hD69pNuQRog
         X2eBN0TrAqQg357vZFF3toHYDIKFUVNyzwGkQuKX6kCJy5sjxM/v8f3DQQzsr75Cg6Gk
         Rj1CJLL8M7u/9pwiTaIvxygJKkwfCjX3E4qsMq5d/sFGwhOjiwjUF3TJjSoZy8c7dT39
         F7LSFAjpw/ifNnAIrx+CZma05BOndao8abb5TI+NazmZPl1Z2Fc+fcwkeag8LcB3Tjj2
         002w==
X-Gm-Message-State: AOJu0YyBazkYGzWLPMQ+brFg8fW2S94TfdLRUpTyOx9E6EyFt3OaClg9
	gBxa2fcEjMsB/N39X848Da0hKsJ+X/bwQkYwy9Pb/v+RZrm9sWlUmdocLZdzPSg=
X-Google-Smtp-Source: AGHT+IFoLvvnUhhkzp8ywNMvjAOePCPyBH1dUod36LEuK6Dj2PUXE10Q4WQcB8jYl5KON8cXhtcucg==
X-Received: by 2002:a05:6512:748:b0:510:1818:4f14 with SMTP id c8-20020a056512074800b0051018184f14mr28987lfs.30.1706227155449;
        Thu, 25 Jan 2024 15:59:15 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w20-20020ac24434000000b0050e64a0c62dsm12363lfl.240.2024.01.25.15.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 15:59:15 -0800 (PST)
Message-ID: <34726ca0-2612-4d03-b064-e5d3f2a83671@linaro.org>
Date: Fri, 26 Jan 2024 00:59:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] phy: qcom: qmp-usb-legacy: drop
 qmp_usb_legacy_iomap
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
 <20240126-phy-qmp-merge-common-v2-2-a463d0b57836@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-2-a463d0b57836@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/26/24 00:22, Dmitry Baryshkov wrote:
> All PHYs supported by qmp-usb-legacy driver don't have issues with the
> PCS region. Replace qmp_usb_legacy_iomap() with devm_of_iomap().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

