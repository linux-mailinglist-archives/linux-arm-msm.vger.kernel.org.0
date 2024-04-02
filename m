Return-Path: <linux-arm-msm+bounces-16041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84805894EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 11:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4EE41C22ACE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 09:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453F758AA7;
	Tue,  2 Apr 2024 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPR4pFGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF658235
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712050933; cv=none; b=IrPCcUDRZQtPon1HHj3qw846czSVcu/J6fTZPFKgQKGhYpj35G7aRzByDoDguZ5jpLW1tpjucgSgobf4f+vMXJk945C9GXzeCTD3E7RZSPCFt+HgbrUJrQPopJXeakHZ8ouWK1jgX5iBZZdB6iPXArIWSR+Nu2gFg4DcwRXegM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712050933; c=relaxed/simple;
	bh=VmxrNNcMQMPlblJGRE5HZ1zqo8KlOTh7OJgvcdllwcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnC27hPfXacuvyOkbboUvymafAPK42Z9bwdgsenXFPUyBbubZ/5pdw0rxjwsaiqWXCKhJmswYT/bBRl9pgUWQup5wpcMY3ibcMgWrZJCVnYdNnzNsBXKQ5AqlOGUVJ2zdHfnckeOQwTf0K4ChfV1EQRUVtozyWAqTFTuUm+uqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPR4pFGj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41551500a7eso23280425e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712050930; x=1712655730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iyun4srQmlVnEX00HJbAVRydmI8q52m2bbHF/Gsn7uw=;
        b=yPR4pFGjoFIWyOLExiCKbNwPRize96ZRsLnZAoeBG6Cv0Vo1LyF1Ymgng25uleGUa6
         dpZQkmZcusJJ4V/WYOR42C/supBSbk0s/c1f03lMLyDV1AIy9QANGVmWsh6Ut45YyZqE
         iyOY2DDgCEz/0hZDbkCwpt3EIt56ZL2ZRPVRKph4Ce2DCUVdM/efJNJRN/G29V06/60E
         HlWZGanGZFZMILjvanyvovke2gd/np/2C7mbNEkdoY/RRq55UZ1TbZeBHUVlSLc+2RFu
         bXMTSyrJApbJZ4fhyZnKkRaFGlfIZWQxEGtFWZN+lSCINFisiOuxAtM4B1046t/MyrLh
         AP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712050930; x=1712655730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iyun4srQmlVnEX00HJbAVRydmI8q52m2bbHF/Gsn7uw=;
        b=mk8xVHduCXCBuC6j4bUW8BuGTViXSzDesAd6fjt4N8N2YWfucc2EQmbdh22elT2oaJ
         g6bWm0AsRpVeGGYwOKWmkn7kYuI8LkGZ2f2bQLBDZA0ufR/mNjKLa2h1bccw3020Kx+Z
         3jeO0c5j/opOXLbuW7P5LY4mraetlPLmxip2c6HSrucUKitUvui/7PN6M356S1T2J+WF
         lIsPBPqkplldJ6LxOk1YJfN1VxGwDLtlQwXfY7xsvT9XQTWaD04/+M0SFptWwfBuwkW8
         k9uIvGLLayGLpPK94ni7UykLqC5UlFLP1L6uA1MEvPDxrt+CjnPonidZz625dqsb4SUJ
         rPQg==
X-Gm-Message-State: AOJu0YwjU9YjE6sDx3/vgCUmO3Ez8iRTB6IATycu5nIOve39UAdWadBy
	neh+Kd1FrtDd3cSDJE5FLuEzusXP0SAqV9p2jLYvaNUOPKZafJt0FgBsu0P9YG0=
X-Google-Smtp-Source: AGHT+IGpbvoT4G7H+ysdro30nFNWcy8RXMkFORyRcKhRkjW+cccB2ktM/06IGLzVQ+pXcn+w/R1tHw==
X-Received: by 2002:a05:600c:4f4b:b0:413:2966:4bfb with SMTP id m11-20020a05600c4f4b00b0041329664bfbmr8005911wmq.1.1712050929806;
        Tue, 02 Apr 2024 02:42:09 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id f10-20020a0560001b0a00b00341dbb4a3a7sm13679750wrz.86.2024.04.02.02.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 02:42:09 -0700 (PDT)
Message-ID: <7088e678-dd0a-4a5d-bef3-e0816a38ce60@linaro.org>
Date: Tue, 2 Apr 2024 10:42:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] arm64: dts: qcom: sm8250: describe HS signals
 properly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
 <20240401-typec-fix-sm8250-v3-3-604dce3ad103@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240401-typec-fix-sm8250-v3-3-604dce3ad103@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2024 21:33, Dmitry Baryshkov wrote:
> Instead
> there is a HighSpeed signal lane between DWC3 controller and the USB-C
> connector.

I still don't think this is an accurate statement. The upstream names 
and labels should be followed for consistency but role-switching and the 
DP/DN lines on the type-c port are not related.

If you drop that sentence in your commit log, then add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

