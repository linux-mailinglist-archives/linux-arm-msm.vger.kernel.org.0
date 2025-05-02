Return-Path: <linux-arm-msm+bounces-56491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA2AA7188
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83BB117A94D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A21252904;
	Fri,  2 May 2025 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qI2hsB/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3CB24BBFD
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188312; cv=none; b=bewGXKTyzO0yUc5HwualiHON4592rRxzuk3g6zz6M8O4LUuCHHJPu6sVxKv4a9jsKtoi7zoXtPpUS3JHzJA7SY328MknNQmeEYlVw/+8R+VY8o/ziaYz3Do5rFKn31QGBUMcHFXXtVLxiX2hMbq1hxsbybAcKt+P8nPflN+ZHaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188312; c=relaxed/simple;
	bh=dZCp33kBN0Q18ikutt/A4Xr4aDmA70Q3LWkZ9y/t/yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBsG46WK4lssmuVKgHy0FHVREL0Ewop30v+c5dsSL30spXRRXpQX2DNKZjZ8lAZdXbgd0KVFEMgys008eRMjf4xno1lJj/TXRTR2mPQMV6Gwr1mbj80copezvwXRvzJGtnih8bH735YccG8z3MIOkEqjVm4GCO7WtorCMlDXkkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qI2hsB/o; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso10639405e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188308; x=1746793108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N8+l8M5FlFCClqgtiCzmH9ZrH4j2YuHePm47Kqoteo=;
        b=qI2hsB/owjtJ6nLSlxkQxnGQmRi4NX6iLVXPpX7HAJVRuPqdCH5zYeeUuezhOqFNOU
         yn1FNfqV9phQ4y7U9zZnJ8qKbURYJyA807LID0Lu1LV3eh3xJmO2yWD4D1CGmKiR0+th
         J9SBn/uwW2Wq1NJ/YVyTH0wtPFh84GTCXpeMzKNdlhyeM3yOPRArAhjod8CiIWvIzb7K
         mO2iYMqDiaaD4kNfHkeWnGbwJtdatcfBJk5AmWzDoKJZdgYzeGfYBdlMGYcvQm0OSxIT
         1VTP6J65Ap/YJBwLY7OmOVtLoVqp0ooST6kN7Z0DmHaax5xVFme0ORi0MCkWT26LFAlX
         hzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188308; x=1746793108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1N8+l8M5FlFCClqgtiCzmH9ZrH4j2YuHePm47Kqoteo=;
        b=nufrxBMCsta2vvFaL1BGhz0694W1eIjgnOnHPgG0S5976ORDcqNuiWbiqhrCIemDbm
         vaRc2Kv8w+D+JsWC70sZvQZWlDks/oStioryPX+BU1Ve9ysduYIg3EZkll75mBtqQrA8
         SuOt8g0xgKUr060B53wUcxfTzlTnHb9yEXaVJELXd0d/tAU7o+eS3FyVx2aRqZ5NQttJ
         01EvPVRkDGWq7EWxszdUW/ph4GPVne1XMSdHmlT1SVQrKZg0iS24q79E9sd0uz3cl7Se
         /mIEtr/yDf44Oo1BazDjzLFtPDdvr2NIQ1nckW4aA+yjUUWitJHSoknAQBGMU7hCtPCw
         Df5A==
X-Forwarded-Encrypted: i=1; AJvYcCVLsqcztCVXJDJlyRpTbZEuCSiHNkWrD6rBrF3TmpvRgv0QhxCSSCW6TQ5cvdJHTUX9blXsQufNoQNXAVZa@vger.kernel.org
X-Gm-Message-State: AOJu0YwqtbXiKlGALR4GKjmuhBuyc2l05gKAxkj3WkpXQmCH3QR3570B
	MQFtS0LzluQSlzA5Rl/fmwhHNy2QmQt8nwRswQGTBXLiCCPJElScK0ek3CURDBo=
X-Gm-Gg: ASbGncu1CBDWS7L6ML8MjEMsyEhrb78UsqH7Zg0T+kphGHzBGkMgyENUFwv0FEnHcIr
	UdPfu4r10MLOoUFGSAO6LrCL5DU7dofxYSe/WAnXEbRWOnSHr4SPOTSkijWdEgXpHbHSmsR0F7y
	+x7+Mn9FfZxlVBnAlFJ6RAXfzR6Z2N0VRQOEo7XYFUmlDO/DK/8fwp3WQvl2+CHA6t8mzyb7AQx
	W85NpxDzEhHnqLwOHjOrQeJg65/bTzybWIrdNWnB+c7Ab+wP68fWukzHMYIgtoK2hAnM1w4Dd1M
	2nE5rq2/yZkTeLybUgJ16yZYokQLZ70z/V84qoV2AVcnpfMPKj6kVQpE4Wk51D/r+8WwokWlKEn
	XVRRJDw==
X-Google-Smtp-Source: AGHT+IGycLOTZlvkotfi5COKFzd3MV/rJ1at7iSHEF0LrJp3NZNcKFI4IZK6OMtutAW7B+8/HT8hNg==
X-Received: by 2002:a05:6000:2501:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a099af0f94mr2000619f8f.54.1746188308640;
        Fri, 02 May 2025 05:18:28 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c3dsm2071414f8f.12.2025.05.02.05.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:18:28 -0700 (PDT)
Message-ID: <0c09f19b-dbf6-401b-bf4a-8e416487a34b@linaro.org>
Date: Fri, 2 May 2025 13:18:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] media: iris: Avoid updating frame size to
 firmware during reconfig
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-3-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-3-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
My question here is why there's an alignment mismatch between the APSS 
and firmware at all ?

---
bod

