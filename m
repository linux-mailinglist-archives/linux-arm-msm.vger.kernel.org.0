Return-Path: <linux-arm-msm+bounces-23269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86B90F681
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88EE21F25333
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3881586CD;
	Wed, 19 Jun 2024 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWeZlhgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065515749C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718823030; cv=none; b=HWdLOmix/5UN+YtLLoYmr5Hnz8gDbmI3awp9aHlVDkoObsnP/vEHZQ5uMjuXVPLyPQfAtYVrq76pmdwDQiVaa9TLiAKDIrcIgn119wUo9pBbeCOAZ/EupJT4G7P1hvSNI2MdAovfKf4F7Ujq9RRXfgDp9QVMcqTEzFijrsJMOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718823030; c=relaxed/simple;
	bh=XqUGiVonNRQVkpgcnZrv1NspjsC21lpUpT8S0nl2wvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BN1vH0ZZrb9ImSrTD2/oMqW/C9GctUamSeyOWw9ztCzGmDMyZIDtbNBYoHMx0KrHXix0MdY17zqEhpeZkYaX3AadBeNG5wYoC/mSxfVW9RcFeKbp0YpzSzgjAtM72zE0d1LelaIAduDO2elEyWAnpGbf3ydOUBinYoiv1gfvsec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWeZlhgM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so44241a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718823027; x=1719427827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sWDiAvVpBXsUHjx7wnCwqZ3SqwbjI5GNUi/tqW2ciTQ=;
        b=mWeZlhgMHXLiMuHosmcmx+POmiqlbs2SpM/nY2yo7asfo1M8vnEfs8vLJRMN9cH+nn
         6k++wWLIR7GXP3WfupEyuBAPLRl6FKHyzpw9PfpgWdA/g5Z53AbclVToHedj9zJP61nM
         JwI8yvT3vbHw84bsnt51kzVc6lbHUxPXUixmslp1kCUk6l8gFIxPOABSPiVFyD6fYC19
         GEiAXicP/KcFcE7rSIX4XN+hjvBVvsH6EO+vR7VPJESQ5P+PHrsQ66DlsmfLZgvDz9oz
         QkssgGxL4qMdvqu1kFJwJqXWkyaWSDjtDZHS4ZWPZ7Lvcl/zZe8KgHIigA5f/e1ki0ZV
         Z2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718823027; x=1719427827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWDiAvVpBXsUHjx7wnCwqZ3SqwbjI5GNUi/tqW2ciTQ=;
        b=iSphfb2L9VA/6DOF5NM4ElIiG+WqH3TM8y5PCttExtFXPGLpHpKuLLzcqClJlB3UBy
         AhlTPJlip2IvWlrcOpZH+p7+4gLe+TKy4CZtwRuKqpPhI2x/2eN4U0Dvv0aLKH4FJPpD
         +M5mQCsAyIx9sncmKtiHwnT8KPyH1ysfwe9bHSSzCr7tdWw0DuhnQCC9VW3rZ90KQEYs
         pHs24hs05Zr96PIsy+A9xtLepc08qNOPt4CMuwoVrhcS+PpT4uS2S8nXKCNElT9+yJHf
         HJJOg3bnU4WvP3ZOG/42xZPF3AewCz2RyL10AWnz0MArv682/XN0yt1pewcGIWuZojrf
         ghRA==
X-Gm-Message-State: AOJu0Yw5/YNCcW3sSqGyOvEFXhW38DhZf6ZqwBwl9AwzEXQQNS0s8puY
	7Ae5hY6z13kcXNHyeVUvY0bFjtB8JoI4Ab90ZShMUbhHh5PrnyVVdiQxcOlXsgU=
X-Google-Smtp-Source: AGHT+IEpXxKZYIZ+XPxen9fIYys7XEwP2kOSl4j/7m6u8p9EFYfE3KAUWhVEW00LKNfpqwhBdgZloA==
X-Received: by 2002:a50:9e05:0:b0:57c:bf3b:76f6 with SMTP id 4fb4d7f45d1cf-57d07e18d3fmr1953222a12.3.1718823026866;
        Wed, 19 Jun 2024 11:50:26 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4dba:9578:7545:6874? ([2a00:f41:9028:9df3:4dba:9578:7545:6874])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cfa753136sm1792853a12.34.2024.06.19.11.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 11:50:26 -0700 (PDT)
Message-ID: <4df2a52c-c21e-4da0-9ca0-13f28e81018c@linaro.org>
Date: Wed, 19 Jun 2024 20:50:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sa8775p-ride: support both board
 variants
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240619183255.34107-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240619183255.34107-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/19/24 20:32, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Split the current .dts into two: the existing one keeps the name and
> supports revision 2 of the board while patch 2 adds a .dts for revision 3.

Are both gonna be actively used?

Konrad

