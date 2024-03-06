Return-Path: <linux-arm-msm+bounces-13523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031E873C4C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 17:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBDC91F29186
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 16:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4486E132482;
	Wed,  6 Mar 2024 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrI6ntUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6224CB36
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742657; cv=none; b=RXuAO0TD2TIbWhfF1wRlSwIhXU2xxMowNOR0QsD9qdkytv3Jz6BmNpTFzA3JuFSEU+DWRGA0B0SI2eqzQdeLRPIqT+1HwGfgfShfrl3X7khmKlhNSrIArZvOKOJZBHrcMNMr8irTg8brj++qFET9IFRBezjfBBtLq30P57gmG9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742657; c=relaxed/simple;
	bh=mEQTa2n/RojLzk55y8oU1DPrlJiA+JXQwKuEQ+Ae18M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFh00Ss0mZdZ9kY5593l/9YT8AEABqozL6b+pvxIlbqhlYThinz70fZNL9RUYNsYKPY/xi+eucZXxnL8ElPE5Twd64Hz6nvHaKuv0VSfNQJS2WtcpT/Ws1xp5P2FESv407C7MMxZ18JfmqYP81Yeo935AEn9QFgQjEgTv9Ryh+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrI6ntUm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5135e8262e4so1024059e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 08:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709742653; x=1710347453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxKIFmdh08s6jzr+qngXZC/NeVk7xZJaEM83kdDNq3g=;
        b=IrI6ntUmFpgUIwgkibuLJn8qUiOK/Sj8/UiHky0joyJIRsg/0a2Sykizj/gIBRBKWT
         GfEf4NDfwjINPAutN5CMqlKGb+N0SYTQ0a6uCgWXjlB3N9Ec28flmqPCfz6EMRd7gF2g
         fEaNBmuAePjMO1AOjekv4yh/qz7LDC1KxVtOIG1aepDYAaSMeYCTG5mseMX1WkAQRsWm
         W8sWCVNTTKD6ZuTkKeKE6UZ5Vk+Y4YkUBuHLPzknMnpnRtcynXcfZUM4rwQOTf45suwf
         +71pxJaQvzjV6FBZ7qeujBd81REvwETf5zWYg0r/C52gWcE1U0D/fCGx1I/szLiEDASu
         YJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742653; x=1710347453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxKIFmdh08s6jzr+qngXZC/NeVk7xZJaEM83kdDNq3g=;
        b=WRoCDoM4S8I9w43sY/feUb+0aoLd850q9WuRypm5PsfgvWlOqiu34iXviuo2JnEr3P
         1/EQm8BvlKQaIiSdBlqCJZCKXWPx+OUV+V2kvD21Mi45hXd77ETGuwmtrAYpRDR67e3k
         lIDG1ixdL6ZYJ2o6SEyORX24Ali9SuIMSJ53GOWXXUMV91whhzKNYtI6q5rEMCK7E3UG
         cj8sFGf/gbfXk39fd4SLloJcuMyYpJZemasmjLw31zNb+tlAwKi/FP4HgP2xZV17uJqv
         4w2DORT8iuICMmZ0TlqRFdPg00FES/lztYJt9wuZJdqPdz73/aBHx1qo+VkfOcHuXP/8
         w8AA==
X-Gm-Message-State: AOJu0Yw4CU2Vguh+6pMbMg2ginytOd3XU/Qn8zbXYUTG+stnbli/LysO
	W3s61VNUvW+ohYCFOTxRNKdPDx1p6IgjjFeg0aB6kBZVVBVyx0ygdrbMTrspa5I=
X-Google-Smtp-Source: AGHT+IF+8CzuRKnFLqJ9jYc+QlJyXa71qUfHZR0qBqm2jmazZU42WLb6NJYLP5GMFvaIKA4KaDJTGg==
X-Received: by 2002:ac2:5f49:0:b0:513:37a1:ae60 with SMTP id 9-20020ac25f49000000b0051337a1ae60mr3249118lfz.34.1709742652689;
        Wed, 06 Mar 2024 08:30:52 -0800 (PST)
Received: from [87.246.221.128] (netpanel-87-246-221-128.pol.akademiki.lublin.pl. [87.246.221.128])
        by smtp.gmail.com with ESMTPSA id fc9-20020a056512138900b005133c744501sm1903913lfb.42.2024.03.06.08.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:30:52 -0800 (PST)
Message-ID: <5440bc2c-f631-4abe-82ae-ba061934e0fd@linaro.org>
Date: Wed, 6 Mar 2024 17:30:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: qcom: msm8974pro-castor: Clean up
 formatting
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz>
 <20240306-castor-changes-v1-1-2286eaf85fff@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240306-castor-changes-v1-1-2286eaf85fff@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/6/24 00:18, Luca Weiss wrote:
> Clean up some easy things do prepare the dts for further changes.
> 
> * Move pinctrl-names below pinctrl-*
> * Move status as last property
> * Remove default linux,input-type value
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

