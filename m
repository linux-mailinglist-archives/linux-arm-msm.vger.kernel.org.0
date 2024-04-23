Return-Path: <linux-arm-msm+bounces-18303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E98AE7B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 15:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58CF11F26802
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 13:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A06135419;
	Tue, 23 Apr 2024 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g40wE88u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192091353F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878066; cv=none; b=LED3bex9i1woZ7EqQfDrjwOE7weX57ibWkhhoirrTja5Pjw/RgvQ9y8aO5aK+CABCdFy/J4U26UA7tqv447y9XxPNThX4aYum3+ClPLA39SGy60Au/gIQj09qKwU0jcg8HVyvoOfWoB+V+rPrQ1iQNs0hNlMpRH83VFb9uYNPpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878066; c=relaxed/simple;
	bh=3ALgL8+QCMpbphZi9jDeommUnpU+m1JOIjWutRJPBnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiCcBqTnm2jIgtQYIP+sEkSHcwREG42ttSpOxqvtcbltbXFIZRnTe6BRkuiF8yTe3gvWNhRfJPJauSSZVRND/vlDzOVgxDP5DEvpEDw6bL0lX+R6WCpgqY2Vfn8H1JvExhOu52IZLw6oqCZ87ZDvJ6rUH8wAGCwPnRhudk+WH/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g40wE88u; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d264d0e4so5938076e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878063; x=1714482863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NY8T4CeaWeTNiGVIpd/ngSSzwEcWRKriqXE44ze7nRQ=;
        b=g40wE88uQxY0l4tLCWxot1MkG3HUzaH2E14UQDggtk5ZH7fI4QJb5c7cWAnMZDwvxV
         64NtYyCRhpIUMAZ4NdQvd5SOEJNyQ5NbHFjk6idOe43CL5r6/pmaWkaMTyn8U6pfE5en
         O+lmvKGATqso2lkkqrQktxbTol2X2DD9np7e2c9MBaMBBihgaM2hiW2+LiK6ayLPu78N
         eeutCVc1dH8dYxF+9TvJqt/Q4y7k3EtLC+zK6U567iI6p8l5/jA/E4fDh9jRrGMFKyYA
         lM/2U7CwZj74n5eX5NaxTBMBlfJVoiV6fD9OC+COxehw0RpH5ik8Npm1SMp+7yc5Cfic
         YHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878063; x=1714482863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NY8T4CeaWeTNiGVIpd/ngSSzwEcWRKriqXE44ze7nRQ=;
        b=bMQyG+kpJ2l3I/rWODC5CKnWuf5r+DcdcpLwxKjNa42JcS3P3bPembCsNc7zGEB82l
         Oos/+oIKXTWW0dygsIJeQ6WC4+ppqBpqQ9weJpb0uv9NIiLsmjeeuE/e+KmW7PrNuzZt
         Z4Mw7eQMBk9hOpBnwvOts3iXsgw3rZoiXb/hDVyn4NwkpqbBJ7YTsClAA0aAgx4FEzBu
         546c3JQl+JXA8pppJpEoBXMOBGMaMAMINLDCqa3Up7M3zq+UGvLs7YPRounLoJirWM3c
         atvH0dxzL7HZzsWGYudo5iQQt8iQrud1AIDuPGOuOJ+EeaOuZRqIt+7EXesMzLhRsKVE
         tCeA==
X-Gm-Message-State: AOJu0YxJz5hd+8UO3udhVlUaWngM47kfXmFWMTVu07NZewWetld3TpdZ
	v3BWwY9dHvkjk7/l8qiNnjn3Hp5u7yrxZQyALMTji97yU8SKZ7mGLUiYL6PU/mXNSk2tZjjXFUF
	x
X-Google-Smtp-Source: AGHT+IEApX48gy5u+zDNEfRdmXEQyc0oJRptbKDpcZL1/iM0xpsXEJqtJwc/oKoRbmR3KY6hSGXJlg==
X-Received: by 2002:a05:651c:215:b0:2da:6f95:2826 with SMTP id y21-20020a05651c021500b002da6f952826mr939409ljn.9.1713878063336;
        Tue, 23 Apr 2024 06:14:23 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w17-20020a2e9bd1000000b002d8e42c1b5fsm1732618ljj.42.2024.04.23.06.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:14:22 -0700 (PDT)
Message-ID: <9adac76c-a1cd-459c-a5e5-5f3daad6a6ff@linaro.org>
Date: Tue, 23 Apr 2024 15:14:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] clk: qcom: gcc-sc7280: Update force mem core bit
 for UFS ICE clock
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-6-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240318053555.20405-6-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/18/24 06:35, Taniya Das wrote:
> Update the force mem core bit for UFS ICE clock to force the core on signal
> to remain active during halt state of the clk.
> 
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")

You describe the solution, but not the problem. Please state why it's
necessary to do so.

Konrad

