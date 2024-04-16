Return-Path: <linux-arm-msm+bounces-17597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62D8A6E7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 16:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35EF21F21D52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535B812F58A;
	Tue, 16 Apr 2024 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2PTdqBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F112F5AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278215; cv=none; b=J50hcX1uVKdbpcETULIK1SyfnCFuc6gd4Q1xhJlISio4KLVExW+7XUUtOiCnmuUtuU1JVz5Oj14CXhzM39YW23xaIZNUiTjpuMIyjjDVDapV3uym7RAz6PtCfz2dGnzRzJVZolntedTrkQ1gTabnS2+3ujrK8hO9a1mY1yNuaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278215; c=relaxed/simple;
	bh=ltPhve9DV3rQjCi4jUr/vTyyhzIxc2vfuMkK2VbQK/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJq8uGMoJDx2rrjpnW7zhdPbTgwc4ur7ONO2FiZ9+4BvhM2s6Z63O7ExxN4EwtpuA4Be/gpHqPbDz3LXg2HTo4KqNu8CxqodVTW/MXcGZcINb4csHVRNMmSb6k2Oh75rxPJc3jo0VTs1GXQI6AnvNYB8AMeo2MN+LP6g/8RVFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2PTdqBM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso54364641fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713278212; x=1713883012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzxNkkSDo+X3qz7VnDROj1uU4Maa9FIfJRwpKhOpNp4=;
        b=T2PTdqBMKkQasDoV1R/sT8EEYl3TbJ7n0M24jOGI9WZKYWPZP2xctOsjXugpWiigCT
         iu9gDDHi/XllDJ9niY0HBiPPT7h/umVdz7HMnZsfPjoSAMyYyFJLXS4qqxXwuex/VeCW
         /SbPehHxQZGEXu/7JYNXSYNM2YEDtK73zpQhR5KRjmlYYQFICp1XW/KbBblP9aD3mygE
         npl9pjQAyZLPm51bofDdIICek3gNCGLFJ1xNEhseZdt4/RAx9eX+Ta7X8FyNVxmJ/TjM
         aC4cRwRVf5OsmQe1xP2ycHeaNG58DJLfsGLU2MgSSbFHspGRHyL1kr6Ruc9To9RNl3Xm
         bR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278212; x=1713883012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzxNkkSDo+X3qz7VnDROj1uU4Maa9FIfJRwpKhOpNp4=;
        b=Hpw9I2wH/roZVIgjvpsQshXxF4HnKLy56WevYxZSaYXiKCXxHc+qbcq3bCT257GFfW
         6U3/uAavrIEsDCOr0O73DaX67adxLaYm3MIjxEZ5TxoZrPbjyZRXovnkh70cJV1PhVoO
         ga0/MnLlKCJL/gDBtwI7WhsVtO3aLlNAUpPbNxspRTns54pHUVAECWe3x7LMgQdnRz/C
         XcsNrtv21wUf7kGO29GerhL0mlaXkwkU49eHpyhJQL/yT0hkFR21N4Q20UIa0wjtP5dS
         SwDVJId8ZO2tuWduQHWbesYhPKNnqi91QSpUNw9b+YelovSKH9TkbmSPHPj9HJ27f95E
         S3ig==
X-Forwarded-Encrypted: i=1; AJvYcCVXTrVz1rZE/QWAOb77BpdEVJD/6HEs24J/ngxYIHy4P7jlYAzAtiy0zuAiYHqFu7G1NnuCrlk1XoWCj80do9lP6x0mNZZ3Wlcmcj84QA==
X-Gm-Message-State: AOJu0YwCHpQE3g3VHQKfqgwU5oMq1VcMc8JcVItB7O9tsHwGo/IddE46
	rFC6LmePH5tbGrvaHbML4vIWyfbj3624pdWKrXZFbbOkQjc6rCRAMwO6PVm7PjE=
X-Google-Smtp-Source: AGHT+IEV8OOpIqaDgfXAYxwo5mdAH7Yt8IjgQoRSwEn7+byhG6+Hm46ZjAWVB/Tf99onqLXDOM2bTw==
X-Received: by 2002:a2e:b98a:0:b0:2d8:7320:e36a with SMTP id p10-20020a2eb98a000000b002d87320e36amr8720600ljp.17.1713278212060;
        Tue, 16 Apr 2024 07:36:52 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b11-20020a2e848b000000b002da6fb7ce36sm696853ljh.135.2024.04.16.07.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:36:51 -0700 (PDT)
Message-ID: <80a8b7d4-2dd6-42a9-8305-81a93ba5e6bc@linaro.org>
Date: Tue, 16 Apr 2024 16:36:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] usb: typec: ucsi: glink: simplify notification
 handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-5-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-5-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> All platforms except Qualcomm SC8180X pass CCI in the notification
> message. Use it instead of going back and forth over RPMSG
> interface to read CCI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Are we sure it's reeeeallly just 8180?

Konrad

