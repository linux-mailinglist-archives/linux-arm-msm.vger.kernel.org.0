Return-Path: <linux-arm-msm+bounces-57250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554BAAFAB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 470B516E3CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9F122332B;
	Thu,  8 May 2025 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P5q6afpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01341229B32
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709078; cv=none; b=Rbcx6qtgtUUEIogRhc2fulzqj65ZYMD4uTOlr810mk+iXPSmki0HvHd11etDXQDluGogj/QJFooahE1nOhvpiEAn7ufMFDKToV0xeN3CoOrhbLWZZ4z5CzdsoAPiO0ohd+xZzIdheHeCB6A+b3PTjTiVXSgbSIm5VxFm2SGGP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709078; c=relaxed/simple;
	bh=fie8ocClExZ/oy9M+sB0ZEiqCjjIW+Pu/7pCGbHETXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Igu9+/oicya7X08MkPvZ1AkPaKdC23Pq+OSlisdlnU/boEO5OQJRZkvZS859tu1l/KyTprCYk4MJBbIixHN0ycrsQpqlBcGgr5J1FZXnmOwiTORlZqVlhn37lZWN4qnLNTX3jQW5fyFAUeKeoVIgb6uTiMsYf1XTBw5J8RBqk6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P5q6afpg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1278715e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746709075; x=1747313875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyfX9coirJq8Cdaxq/W+11Z0EprDF7VsHit7r1SH4b0=;
        b=P5q6afpgQqcbcquSjaWapD6Jfnidy/bHerAnQhp92Rv9w5QHyvw1EQdhcOAnMGTbTN
         lxTZFH8kziCGqLdotsuSX9ifMnrGDffbZ9OTlj8xgEOPUb9gRIuU1ncho8jpiOCCyKSk
         4ozCaUzTflpGYASma6JWjUhcWsSg5c9RoelcbG49bovnIUdFOHwKd2S4aryeY21jljlw
         b2DCouK28BOXg5w5rD5SUJDl5YmlesDpUJ/H9w2ie35jILfYO26em366xpJC0EQbvKfh
         hg43P+9uksSbKNUR7H/cvlT1FS4T0OT9S59A4gWkqh61YshKh6MRfj9CaaYAy1L1E3zw
         fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709075; x=1747313875;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyfX9coirJq8Cdaxq/W+11Z0EprDF7VsHit7r1SH4b0=;
        b=ML+ysFRu9xhGxdnHzMTSNmve5gOo/YEVkaTFcf7Ds9qjZiXQHkIRdioiW6LHB8ysnk
         vxKbU+NpWyBcd19CxDqkQbQz/L886kDh0OeSRO7lqtcvs+UANJI2NNhncqXxhp6jVmhO
         o5cIhXyBHARs8s+tfoHZqlcVZp/ZigOGOvxextqypybfiBNfGOIPlanRLdsvRPrgRxbx
         XgnH9WT0FQRnL4jDlSh+1DlWsdX4Z7OZDA4QR12Jp8WsatQDqSx10qPgjwTadg61bR9U
         DUZubLRBzuWHPXo4i5+dUci06G6ENNjDM7Z5uoLk/8bkK9a4CVRwsNFhav/w5n0xi2fH
         VYJw==
X-Forwarded-Encrypted: i=1; AJvYcCVC29rPDVm9OypLZZnE8ft+D+0ZzLFIhq9RGg7nnCzFWgspGvCT0L5CdvXTOZSdfNwIIIS+/tdqCtkSNVZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyeC7SO3wqaSF4JXtQa4e8OvuUIbIfbxRTJQEjzrW7v0IqNcu53
	xA1Smm0VBAHiNsOGI9+y3sBCKMd3yqBS4yG/I+dtzZIlj2//ZbdTs3RQYmsSOuc=
X-Gm-Gg: ASbGnct3JoQ5Bs4lcj+Byh7WlJdrVsjOyJ8Obc+NYOoAUZyQKh6wBgvFbb6JEwR/6jB
	5og842+2bbtD9d0NH0bymzPsCH7G3TP8scA54qOa9wUN/UF1qAdTj7VexJjOrT4Bi/3T5lWX/uE
	M+mh3GZNXiRmf1yVUqJ9/uGxKmpupBCcUudG4zBMVoudqXoiY74rVR8jV7svJGEWY61kq9ely4t
	mw8H6pVM0xulfLohf82DDpatnTn43EadfLVfYXsVqwQV0ejBlwAcb6fux8jJpmWDHA02tBdAXb9
	soAg8EwQHQXxu/gzTVaOVNiTIZFAcLeH+IXo4KVqiw1wBLzKjl9YIUB4sSo=
X-Google-Smtp-Source: AGHT+IEUVIi3T7YfyMxv2zjt1ItTGIIG2vX6ZluzfArIlt1K86WUAmIJcFc2kVGlurTkPNqOfZ9GHA==
X-Received: by 2002:a05:600c:1da8:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-441d44bbf97mr24647605e9.1.1746709074954;
        Thu, 08 May 2025 05:57:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd331221sm36183705e9.11.2025.05.08.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:57:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peda@axentia.se, broonie@kernel.org, andersson@kernel.org, 
 krzk+dt@kernel.org, srinivas.kandagatla@linaro.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com, 
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com, 
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 johan+linaro@kernel.org, Christopher Obbard <christopher.obbard@linaro.org>
In-Reply-To: <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v6 2/6] mux: gpio: add optional regulator
 support
Message-Id: <174670907339.90037.743394782268502286.b4-ty@linaro.org>
Date: Thu, 08 May 2025 14:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 27 Mar 2025 10:06:29 +0000, srinivas.kandagatla@linaro.org wrote:
> Some of the external muxes needs powering up using a regulator.
> This is the case with Lenovo T14s laptop which has a external audio mux
> to handle US/EURO headsets.
> 
> Add support to the driver to handle this optional regulator.
> 
> 
> [...]

Applied, thanks!

[2/6] mux: gpio: add optional regulator support
      https://git.kernel.org/krzk/linux/c/12d3c69ba2734b5908e0ac8ac2dcbd0cc28fef3a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


