Return-Path: <linux-arm-msm+bounces-39075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4049D8299
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 10:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F3E3287667
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 09:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A8E1925A3;
	Mon, 25 Nov 2024 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfFPD5Oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AEF192590
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527363; cv=none; b=EXjxfwO39quQ+LbrJE/Io5qZ8t+/5p+qHli2Fd2CT3cazjxbbjh8X6aIVLqO1FlTPyt4hMKpkzAMqBtX83hZe1rpDL7Jle17UKUJLD96mjJMTmAK7A8LAywViMLk0dm/dHhqWtcvY6u7YbIPdRV0S5F1CKmahLaC5yf49jJxTFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527363; c=relaxed/simple;
	bh=SN1ke6h10N1tpIjFi42fcVYTTBA9mbS9XqPXAsZIIgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srtBFS4XlpYCkEyhyp5DKbmAQeLqKEZa8RM4mEHZ+rCGKqktvUSHYSF5U2HP0nVW5rHfpbWSrzPDAXnqCySBY2UNtBZYxmzeIuEOsvCqzrqGIibk8zzRbPAik1JmJkFeWsUk3xVzIEb1bKoQWRblhB2Gf1lgDDFGCvbl/2bO0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfFPD5Oc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-432d866f70fso39028175e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 01:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732527360; x=1733132160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SN1ke6h10N1tpIjFi42fcVYTTBA9mbS9XqPXAsZIIgU=;
        b=EfFPD5OcRby8/avfdKh+W4e1LF5kp1IiC3AVaUpPdRVW0T4K5dcKT+aqcxMo+Jfcip
         9b2hgOtXTY7D2OX4LNZR9S1KLT9IZGDiKsZlmTloQHt9jOWmsRcvwXwhUn8+r0va1ZjS
         rJ6D2kIJga+EqekfQkH9W/OrIsWWOrP08zb8uu4b/89uvs7krbfYgpMe6VK4Qg/I1u8j
         HxUAYlOGv68XJ5jrEYQm9LXROnMuKCpRUXkZoXJLd+loA6JcZ9C2fTGQyMe9FzqFYGc0
         iD9hYl+dbzuGLQZLUeViMnjepLBglwqla9RxSMsCzNMG+7qLkruQ9J/XaW6BmcC1tMd0
         U16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732527360; x=1733132160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN1ke6h10N1tpIjFi42fcVYTTBA9mbS9XqPXAsZIIgU=;
        b=l8XbVqbwgUcH/VLaG39iM0ByD2vI3PzY9UBI/Jpbiq8FhH2xdbtZcWfZfC9IOsTUrK
         13CvP1U0tbhZravt7nF5vANDJkHzXU+flo9Gp9IlErNntDchlna0g55VR+UInOu6Ep7F
         vRadYaEceO8/8FRx1Dl0Olcymnpw6j/pfE/zHhhZpk1snYPHuxW6EAPQ51m3z3OyUE6l
         4Zxgn7X58mK9zWxJyH0B12R2tkJWM1jlcXYJoXoF7SjTZOfvjgs0RWvcXc1wnLoICHBh
         5gBsK5P9Ds2UDvh36svG7VBElNyStzZ4yhs7BrEgSjUekFl6AVisEXKG1TNvZFH+tfYe
         FcpQ==
X-Gm-Message-State: AOJu0YwjqzQTEVqshAHovJyauLHP2pOJAxBZFa22sWiPpQlm3Qtk1fuT
	laU0Bg8sAzj+DCsXw7hQxtNSuniVhv7JuPYJ4Ck6OUYqrJttoTI6rqEWX46BKF0=
X-Gm-Gg: ASbGncuQqGDQwiv4xq0ybbIBONczRL1XdSTAgPEc83inA0ykxEhWeuvzX76HdXLaYca
	rWwRVKm+sjJjy2fSTpBlHmaTGLbboBlXQKGqGyKbE5RII9+sYOCxWut8yGq4GvsyOKEfQ1Hetvr
	5l4J3O4wAC9KlGgh0GRaOM9F0ayvHU3CCLGgwdL0o3JjGo9CeeGdjd+QRPprt0aBQ9uElskgg5X
	iHxslj3J3dqgWmc0lvX2ou03UPqMQWUEJmbt/7fHxm/pOGTHKF8vf3nKtH8gqE=
X-Google-Smtp-Source: AGHT+IGGanB6M26FvTKDaJXED8zAo9zRUZhfKFIRCk7WD5/Sjbv4DRD3EJV+JM26XNm588PaSZdgMQ==
X-Received: by 2002:a05:600c:4704:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-433ce49128cmr97088715e9.21.1732527360218;
        Mon, 25 Nov 2024 01:36:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349dd9a597sm45357745e9.5.2024.11.25.01.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 01:35:59 -0800 (PST)
Message-ID: <970a37f0-ccb4-4c23-972f-4100cb6c4e81@linaro.org>
Date: Mon, 25 Nov 2024 09:35:59 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "Taniya Das (QUIC)" <quic_tdas@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <f7c31279-8492-484c-94c4-893d98f53afb@linaro.org>
 <2212eace0ed44c439da117fb05f2b1db@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2212eace0ed44c439da117fb05f2b1db@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 03:49, Renjiang Han (QUIC) wrote:
>> What help do you need ?
> Since the GDSC flag has been changed to HW_CTRL_TRIGGER, the v4 core needs to use
> dev_pm_genpd_set_hwmode to switch the GDSC mode like v6. The video codec has
> been verified on SC7180 and the result is OK. The same verification has been done on
> the latest QCS615 and the result is also OK.
> In addition, since the videocc of QCS615 uses the HW_CTRL_TRIGGER flag, QCS615 and
> SC7180 both use the v4 core in venus. So the v4 core needs to use
> dev_pm_genpd_set_hwmode to switch the GDSC mode like v6.

I think you need this tested on sdm845.

I can do that for you.

---
bod

