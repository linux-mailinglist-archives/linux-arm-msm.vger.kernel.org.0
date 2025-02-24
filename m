Return-Path: <linux-arm-msm+bounces-49126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FC0A4163F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 08:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6F743A2771
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD18C240610;
	Mon, 24 Feb 2025 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3H3fs4d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187921E5B77;
	Mon, 24 Feb 2025 07:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740382128; cv=none; b=kVmVyzXul1M7USjH1Ccn1/5SpN4NLNnoy8/SlBy71Kvr+UsdbSoxLLclkxMEiawRlvPXLfcPBdYCeyp3untRlXXI+Vz626FXMCAcyiPY89/26kjrHTUPwbhDtW/pevPir4e3eLmmnh9FPrF1YKefZsjr+KBr8EevH82ICIltjyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740382128; c=relaxed/simple;
	bh=4QdLZbLyUQlmED6vmxcN+VQ92PGbQL9gjs3A5m+3Or4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwDuZfgAfW3E9d6R5gRIYw5lfGtxSFNaEzX227aydhRvMaiN+BrnNBbWSWOH92sMb1QYp1TSvhd3GknU/PcIaEqW2TTWwI1SEpuGTHYfOIMGLOkB7RDTHz7mYTEMzAD6yymglLtfL2w1ErGjO7Rn4GRKRRWaP998HusjIrWD/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3H3fs4d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so25564735e9.0;
        Sun, 23 Feb 2025 23:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740382124; x=1740986924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/J1eHs/QwfmQDOJAETe758QiGCVwHhph27kBts3wDI=;
        b=l3H3fs4dkgMOfNfG9J08YqLImA3XGm3/5jA6w8VWPLOxykaIjQE5YT81V+TuTMmFm3
         pVWkgPpFFLNPXS6q/lGCN113xkgMKVYqs679xFR/+/9uYrKUXUIeVVd9FmSCmOs8eKjG
         EYdMiGY2R7YJJLuSDmrD1f1Tx485h+00isPnr2MQz4Itgdt2sfIYMG4yGqxnCmYJqyZT
         4vLJ5p+/ftdsIzP0lTqtLawiKc+5yYEZp17VALtPFopSlrkUTvGEtUZAFQmnC2SeCDO+
         xOwCyX1IRiX7dBS7AMJ2z/i2G5EWgGw4ab5k5EzbhlDRLt9gy6dVwKuL8+Aa7+6gslGr
         KKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740382124; x=1740986924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/J1eHs/QwfmQDOJAETe758QiGCVwHhph27kBts3wDI=;
        b=wj/L37wSJIc0QfbZ7HAVqhzI7NT8ueCvTHsY8C58uQrJ1gUiwnGfzkluhHKQpjd02w
         MWD//ryiBlkn3IGfuIpcX0SHOqZdZcio5omjue224ef9M9DZ0ox4MjVx5rWRrza2AxaX
         UNdMvtrZcG3Y/DVpD/M+fQQWY8N8O/rueWOhpPzfE86dyVPHxcpXy5ROVnqdqvqKiLX5
         m2iRIhonCo6942Mb702kAAIzAfRuyf9138ulJ3CSfNl0umv+SXrKqiGZZuVyHjfewrh1
         AmADXasTrWEOYgiSAQ//t5uyGT4UwFLUfTDJa5QPtwr4/futmSswi5cxs8s0DVEgqfUl
         Ai4w==
X-Forwarded-Encrypted: i=1; AJvYcCVWoIzULM09tfImkQK1xp8S1It5l5nApnjwe4ebfbxNAaA0IrT+2sD+DVeXsCeV8BREx8xSUWq06hBnSI/QlQwPPFU=@vger.kernel.org, AJvYcCVctWPOp6n0CjNceekUWJf6o0N5nCtU3h2m5ejqCDnFR/SFijJDZ0cKwTMq7wtA3Nk8Mxv8JtfMvXk2M4db@vger.kernel.org, AJvYcCXkDDJa1jp13lZ5qeJWkye5wyaowkNpzT/j6ijqc9O9eCjVch9DTUderYmO6r0XXXtNwXUwsx4dONCi@vger.kernel.org, AJvYcCXnUs/sMBn1wOr8miE9shRif12HrZOcH52sARZRsxn3KiQ604qXLqS9cKkKUCJ1UHTeELmgapCnMsrvVab0+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw18ycbNRqB+6URCCyATGX3VfxfizUMXmERlDF4jjysucmbXRar
	g1kO0UTczaZ35v26tVa/fL6VWIQvHR7pQ9JYPQyBRSe14sw78vru
X-Gm-Gg: ASbGnct0YOxm0k5fEbKZNaBw1lYm9oAqAUCMSC5LbtICf2GjiPLSZ9yV2SmvudGIEF6
	C4Gbv4kQZsL4RMdRXbKz1lDeOKAFJK5jst2EuAQl1h3B5KXKkGuutu3eYvbcaXchdz4jpvwWrzH
	qUA/BhIH0Wz1Gk9+pr+e6JbftPjeSKHRO5Pc/Ot+fR5DwkxC8ozqglwt25/iKKa1fqWZsUNMeSs
	Z1lCdV0heNkxSQaeFJo9hJSlQh7shudZtPhEXj64hMrkSFMxu3FQZZ8GfW+dHEDVSLs+vBmX7jw
	7Js3c0F3bwMzpMJANuf0r2xQEOWo6GTTZKnNStgk
X-Google-Smtp-Source: AGHT+IE5cw7vshlFbcyfY+g/VDogOlT1fxKWnLlplcjX26Jv+6luh/NyTC1ES3BHLcR0L8M4kDEHug==
X-Received: by 2002:a5d:47c3:0:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f70772b51mr8659416f8f.2.1740382124196;
        Sun, 23 Feb 2025 23:28:44 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d58f3sm30734172f8f.73.2025.02.23.23.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 23:28:43 -0800 (PST)
Message-ID: <3616b414-ba57-4625-aa35-20d3dff61cc5@gmail.com>
Date: Mon, 24 Feb 2025 09:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] phy: phy-snps-eusb2: make reset control optional
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
 <rcny5iaxs6gr6vcxmjep6hwtkt2fvtgzhbxlpu3ax6vj7maure@n5bg5y74vwc7>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <rcny5iaxs6gr6vcxmjep6hwtkt2fvtgzhbxlpu3ax6vj7maure@n5bg5y74vwc7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/24/25 01:48, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 02:22:25PM +0200, Ivaylo Ivanov wrote:
>> Some SoCs don't provide explicit reset lines, so make them optional.
> Is there an external reset or some other signal?

Well..  There probably are on a hardware level, but there's no interface
that exposes them to the kernel.. as far as I've seen. Resets are usually
managed via the blocks' registers. I can't say with certainty because I
don't have access to TRMs.

I can reword this commit message to make that clear.

Best regards,
Ivaylo

>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/phy-snps-eusb2.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>


