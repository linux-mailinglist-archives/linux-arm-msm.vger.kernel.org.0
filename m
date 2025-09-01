Return-Path: <linux-arm-msm+bounces-71378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD18B3DD90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 11:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E3C71763C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7577C3009F3;
	Mon,  1 Sep 2025 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMG/FE5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BCD2FF154
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717483; cv=none; b=sGP+u6BEZNlBLj4iDN7qGlmU5ZdAOiXiE5OhogLX+XxEvWaphrXJa5qU+BxsiW5L8Nbd7WO92ozu+klJqFii5Or7odHAWD5edj0YL1kAezcpt94h3/fI3P0iQivIIm35mS7sIV5OGb52iFYJv2DICN2ZFqEIKmgdlPSGQfbnL/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717483; c=relaxed/simple;
	bh=ylfMvwdHcWV67FG167GMSdGd2pzSjGgujwNJPJyPlGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2VH9k4qRnj6i4IA1atuXwZIpm+jyEWSrdwdWUyEfwFAWxQovb9VCuzR9TyzjpcJ13InIZ6aO4DIHlKNzq+5KReFulRMkUZqJms3l5RjxMdxwiMFbfs/pJaWhRY4zMpowiKZEQsxN4BO4GxtpD5hF4LJEqX/FmKtXTtva8Q1yL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMG/FE5B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so1665484f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717479; x=1757322279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwVv68lybtG/3lTbSeRMLSCB2s0eqf0axoIfKgt8qqM=;
        b=LMG/FE5BJKm93DBOnVGlJFPT1lQt94MTpajgNUoh04UkSfYEfuJjgap1E4uZgrPAOc
         7QF3InzlGGE5uxWvcMClzots8u0hG5ahU1Mu8JepZB8mkT+yDZryKY+HuynHDWZAbyJJ
         p459GGXBmi7zkM7E8p5LMn31ma2tgGe8sBxBIIbikGGanhufGqYL4YZR/6DshimcLXez
         XHRWESp+VMi+5NZpywAHuUiLajvuzaVmHWmO1KSTmeafwmA5iW5bNG9snqXk/GESJjjP
         ATgnqOi/TpS68GIdS64kQWcKuFzjCYtw5Ip1KP9hwkwRXHxEl6JnGfi5zikwYfvHz+yv
         dg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717479; x=1757322279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwVv68lybtG/3lTbSeRMLSCB2s0eqf0axoIfKgt8qqM=;
        b=Eb3DshjI2nIWorXL9S/ToqEzjqOlkfQajAc2HS+mRm3uoiQeSix67/MQZnxnbaIMmq
         BK3u525u3Tu7siVF5/yxnFvt7me//VPSwMIxm/4HpZhpXCrzDlbLG5E3YPODGbEryH6K
         RYoEuxPq9fOA8rHF2kw27Ksd4OAXCC94PqgT5RhDXYQmleFsEef+5IlgiG5CIouBbrfr
         7SuzXFii4H2PXrVbLzYzVDNOL/h4xmVk5flR3KQsTIjnZTUivsHqco3QoV6XioKuekLf
         PuZDEqyHvCu6g9hiakROMtBO40jx9MZARnF7sBL5aj8nQfxsrHdKpD1BLJmkVkwF8663
         7UCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfK6iOaePbti8u0RfiADN9JcwnwlRooVEFS1GGdwtB9pWLjV3pH2jobhHEHai5Rdv2x2qDvvihXoVt2jT5@vger.kernel.org
X-Gm-Message-State: AOJu0YwzornZJ08R2eA5cO8Qn/S3xivZveMVNIJfB8NlTw+u1JGkZRS8
	NMOqcg4lyfVeDn+QUHCr0KJlTs/duljhC63oFEcSFgZW1LWT0wiYMA9xwC0720be2no=
X-Gm-Gg: ASbGnct6eBl0CuPp0VHhmKjkPGCnir9Bccre1StpGWO15POESsTH2bAX9ZhfZXDO+DW
	FnzGu4qrYXGWk1ueovDE53186jzFvB7WAQIButJiG7B7ks4r9lIY7mSuWV36mRq9wOuso6kqprC
	Tb/K+MxDPe5gVPNu6+ur9ZuH3u+4fBjX+Xx2myeNvBaZXE0D9EqVbuJvbRbTFZt1jk04ABNghJz
	P6/LYWoTn3/sbLqpfLRuchjj4rgqI0A4GFnptSAhL802deEpVt5sFWtnDm/44eOhE6AkAXwfXsd
	vbO1drSKc0JwCllxXIvwCQEhj7Jo7nTCcWW+6sDTRM9GQU16TIjVewx2sYsVrQWQ39kakjfydMF
	ZFa1T0+/HWTOrDophNTWUOsWd2DIEwPr9YBjTePbNejzYLFJEwDRsEqK7Ip+hPiEYyPaH4Annew
	DLXAkYtBVh4M+M8qoskwlLnYatL3HSvA==
X-Google-Smtp-Source: AGHT+IF5ozFXuC12DhRU7wnhvEb/Eaxn298/3hrvqF72A12C7sUxgS1LCCpfGamLqO+HTku4EuOKTg==
X-Received: by 2002:a05:6000:1ac8:b0:3d1:9202:9e with SMTP id ffacd0b85a97d-3d1de4bb305mr6081112f8f.36.1756717479121;
        Mon, 01 Sep 2025 02:04:39 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e9c41cfsm147188325e9.21.2025.09.01.02.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:04:38 -0700 (PDT)
Message-ID: <498db18b-f6bc-4678-9d70-7741e3025185@linaro.org>
Date: Mon, 1 Sep 2025 10:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] media: qcom: camss: Add support for VFE 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> +		!strcmp(clock->name, "camnoc_axi"));

This is causing a regression on other platforms because they define 
camnnoc_axi but not @ the rate of the pixel clock.

In fact its not very obvious why the CAMNOC AXI would want to have a 
pixel clock applied to the interconnect fabric.

The following resolves the regression for me. I can either merge with 
this change or I'll have to drop the VFE690 changes until you come back 
with something else.

➜ deckard@sagittarius-a  ~/Development/qualcomm/qlt-kernel 
git:(aaa8b5ab704f3) ✗ git diff
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
b/drivers/media/platform/qcom/camss/camss-vfe.c
index e969de74818f1..1aa0ba5ad8d60 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -913,8 +913,7 @@ static int vfe_match_clock_names(struct vfe_device *vfe,

         return (!strcmp(clock->name, vfe_name) ||
                 !strcmp(clock->name, vfe_lite_name) ||
-               !strcmp(clock->name, "vfe_lite") ||
-               !strcmp(clock->name, "camnoc_axi"));
+               !strcmp(clock->name, "vfe_lite"));

---
bod

