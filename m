Return-Path: <linux-arm-msm+bounces-17116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E089FFDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 20:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D44C1F27755
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 18:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806065CB5;
	Wed, 10 Apr 2024 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jzmy6uVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5FC8FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712773995; cv=none; b=bOKenPuVly3Ba162OtMZakgaqCI68BqlSITCKI64bj+v5JsrjR8ZVQfr1YaoIQchPoLWX1fZ13eq7XstvGVxFo9/hoa6XXMCYDtoACsnJ14Duq0b1upgtoSJlCW8qES+ydaexVSDKVsfAf0qLuy2pUcyTqlVgwwvARkz++BJn5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712773995; c=relaxed/simple;
	bh=bYCyv/O3/hLc44nZSjDSFCyO2zmTU3edpKu5n7dXCMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIpFKDtYkxaraJALxUdVm/Ak+DnwPs6uV2q+PWL55ALlGuVIfK4gYo/GlpRP3WPlFZ8aVv8e0sV1vqwre/szYKEmdCrwGeaMnexCvfDd2BCXRU7PrOaVkqL+FdjzSFeXXjjDrA53j9WwkAFl1jZiK7dpkbgRh2lQvwyB72ZQM2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jzmy6uVn; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516c403cc46so13543715e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 11:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712773992; x=1713378792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYCyv/O3/hLc44nZSjDSFCyO2zmTU3edpKu5n7dXCMk=;
        b=Jzmy6uVnT/7dNabG+nTyrR+SqzQWCRbSBPEpPoDMy2HKPo/G2yazhjR+NWJS4CUq6t
         TbeA454gxaaxSmCTJdrAdsoucj+wtOEjsvTmLBTXLUhKbgrol/ZjvV6xZxZY4Vl4VhnX
         ocJexlWg2RO23wZ2yxEsYPFMHm11CIIQeIh//fuegblTB/VO5WZ/IK44Og+1HtccxRqN
         M3MjlC2SfFK19mIzjqftxc0j7ddfp2aabNuZKMqxQE+G780es41H9klofM1j5+9Zd0Hj
         wjUNRxV/QhUWTd9np62DzS/ryWLKaos28b0fNYbW9es4AwuQ/yW/edoupDa8z++ndMbt
         2ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712773992; x=1713378792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYCyv/O3/hLc44nZSjDSFCyO2zmTU3edpKu5n7dXCMk=;
        b=nhfIcuaAVPkodGd940oE0EvPO2rySO0KD57tg88fsm42Fs14OFEyyxyQLbHIgosDNv
         QD9CPbEHLb42cPTGumW66RFYYLqX9ayWci6lF7FtLgk++VPtp5MCMEi3wmgE+97TTYV9
         7wTBMXlllknGYikTXcmTkjzvzG8TlHTFXjMHwWg1TRGa9/8Dsd9e8s7XQ73Gg1tM81wH
         /h6j+44oVDUJMxFcApkxTuuexQUmKyPKA9ORT+yXAlbodeUHPsrj9Iw/Hh/WxP1o9urq
         /Zdmm70opTltY5h99FWQfzK3JLTbs3v0YaZgdPJnda8qDB5xc0XMi/aPLZNeH5IA1jnI
         2r9g==
X-Forwarded-Encrypted: i=1; AJvYcCXZnTUToazf2ZP7oAf4czQn6A4tUPOnBkWdQGpfH3AyvOeyjdkZbkI8pKtvR+ktQiP8DAAzYFlZFgPgA5sA1aWDYxjFD+Gl0WVfmEa3zA==
X-Gm-Message-State: AOJu0YxT98OjxLyuSTDs8FXpQbqoVm1Z+Po72FujWhEfBoG+EgIN1r1p
	eswVW71ceiprtF18l6v/K49iWOb2xZgtNz7rNkxLqHfIesKkxCq8tWARcMX8qX6xmJADJOUV8Qx
	Iu0E=
X-Google-Smtp-Source: AGHT+IHZV4s1cFLZE7b0PkP6H4vHg5k3tMb5z5t2HUtz7wHs9oqkyOgsfffSF08o3vAhrp80oLz7Wg==
X-Received: by 2002:a05:6512:481e:b0:513:ca40:fafc with SMTP id eo30-20020a056512481e00b00513ca40fafcmr2448227lfb.11.1712773991912;
        Wed, 10 Apr 2024 11:33:11 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512215100b00513cb11cd66sm1908076lfr.219.2024.04.10.11.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 11:33:11 -0700 (PDT)
Message-ID: <0a706bc5-b1e6-4332-a31f-44a91f4f1c92@linaro.org>
Date: Wed, 10 Apr 2024 20:33:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8155p-adp: use correct gpio for SDHC2
 CD
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240410134022.732767-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410134022.732767-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 15:41, Volodymyr Babchuk wrote:
> Card Detect pin for SHDC2 on SA8155P-ADP is connected to GPIO4 of
> PMM8155AU_1, not to internal TLMM. This change fixes two issues at
> once: not working ethernet (because GPIO4 is used for MAC TX) and SD
> detection.

Oh wow..

Konrad

