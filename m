Return-Path: <linux-arm-msm+bounces-19632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13118C1A2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 02:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8201C2120A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 00:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF2BA20;
	Fri, 10 May 2024 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQcLfqtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB4ECF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 00:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299508; cv=none; b=Gx9GwJq3DrIB9iaQ24rovKnsIH8RhfxkWZ5WW4wPxskri/mYlK7qN/tCdlQjbl4aoddpxf5uZVjgX7Qqe4IDcJi8n3nP7wGxLJTljdwqe3nV9nJAbIev50Q2iO9hrax8JfoOouyi7PzfBbHEWq+xOnpo69dtOCQ6a5z5okfH0Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299508; c=relaxed/simple;
	bh=E0lmq8MX+4Jk/oyYQbE2kOJ5yJ6GrU9UxEZJ7muUZBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewi7Nh3m+P8X+rBQFjppO/6gqCAcxn99oHinRydn3NVzO8LQgzAvCqL6WAU1rxDvHUW4/mK7GC5bLtbAhh+wCmWk/E6OLb2oVrroAJbBuWylBEmLwcf6exvx2PnosHUPp/p065ktW7TRdraRO4N7ls1zNZsIXEuR5afWC/G4RD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQcLfqtU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34ddc9fe4a1so950338f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 17:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715299505; x=1715904305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJDvHxVDamFulMq6bCsnACysSO0ggfMo1ZnPMiLHLuw=;
        b=qQcLfqtUUIqjU8fledlVGfAuSC5VqHup0NMuSDiYxHZ1YoP8oYPgt7CEEoQEAilTMt
         0F6nJSTHT1Z2v4u53KALrEey+amxdvpz/KCbmyJ+fmYYGOeO7SO+YpYCKqH5wWL84Yu1
         L5zgXDNpjQNGn/QoIS5Tl4bNQ6ovgcKapy3aPtIiumSrEmtJGZva7CIm3dwxpgq6Edwn
         lNeYljIn+WPQFZqEa3GN6Hd3ZH+yX2pqVi+nhnh89qyjZepd3Yv+G4jBwDW8RoJYw6S5
         F8WaPbXLKybQQMSV4dsvtwMAW/iTQXhqH055e8KLsbcXpWpvvEDu6FOfIyIG8GYlVDPY
         rujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299505; x=1715904305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJDvHxVDamFulMq6bCsnACysSO0ggfMo1ZnPMiLHLuw=;
        b=Z+Fh2OIVyZFbWRx5QB1bOuE5V9oHzggKGLf7P8NHNQPybCRpY64J0tGTcxF7jLQDS2
         zfTdKkrmmQa9Zo55roP2yLFVb/aMzfWzd1nn8gO2Uz+m0miuQofqqooZteOwlKtN+MZL
         gzYmT1cllwXtkcWEN+jdI9OmRo5zVa3mbW0ZhHBr4EjuUYYmG5GZC6tWTmEjp2zYtNyv
         Rz/69XiFQpIqsneBb9VQlEu6GlttKE2NOwCGSIqU5UjAn8r/pya5DpMdxHkWduX+kHXP
         QP0wftoD7Cr5x7AiiVsh+70lpK5E0OYDQiTaCb2eUH/rgqJ2zPRvnot+h5RUoboXw5IS
         tK1w==
X-Forwarded-Encrypted: i=1; AJvYcCUMAiTkHMooAOqZQxEA3CmElnoLBG8ImHj5hqTK4g7saNfXvOzsZ/TN4mXR30AI8XwFpMQOpKHlYFg98TrkYvLXfNks4OUNxbl+6Mlp/w==
X-Gm-Message-State: AOJu0Yyd4FRuZglrlL5ZQQtk4h4CpsvrFx+Y35v7jgsbBuyi0RtHtNIh
	bSFpjfSuBI7m6gE3EPHedR7HGR+7bxK+JdzOPOXsKL2CQhn0nYIBqqMiMwrLMUk=
X-Google-Smtp-Source: AGHT+IFpw7GCMJ/CWM5hZlVcjWf7EKF9fdl13h7/3kbc8DbQMnrhoSKZWHzaiBl0vtLlRUdYmpM5nw==
X-Received: by 2002:a05:6000:cc6:b0:343:7cef:993d with SMTP id ffacd0b85a97d-3504a96a111mr747947f8f.61.1715299505664;
        Thu, 09 May 2024 17:05:05 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad1f0sm2955412f8f.89.2024.05.09.17.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 17:05:05 -0700 (PDT)
Message-ID: <b49a7014-163d-4805-8580-da2802311f26@linaro.org>
Date: Fri, 10 May 2024 01:05:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/18] media: venus: Refactor hfi_sys_get_property_pkt
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-16-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-16-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> -struct hfi_sys_get_property_pkt {
> +struct hfi_sys_get_version_pkt {
>   	struct hfi_pkt_hdr hdr;
> -	u32 num_properties;

Disagree with the structure name change - the structure describes the 
packet which in this case is a get property packet. The data field 
identifies the packet to the firmware.

If I were to end up reading kernel code and firmware code it is easier 
on the programmer to match both ends of the protocol with a common 
namespace.

Please retain the name of the packet `hfi_sys_get_property_pkt` and the 
existing `num_countsathing` in this driver keeping `num_properites`

---
bod

