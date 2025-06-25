Return-Path: <linux-arm-msm+bounces-62438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565AAE81DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 029883B5632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD01825E83C;
	Wed, 25 Jun 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4gy6egH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E97925E456
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851664; cv=none; b=XWU25/MtZU2zXhDNKTk4f3cuxhqyH3e9HAx7pYozF2hAyGsJO6d//hJ+KWRlW4A+O5c6Z4tSvOqjydD75DGAM5W+03SYtRbTbNVsExcGHixEijRYqMeJHEl9S8Gic/snpKHWr7LRsMja1F/XDhSB/eCiByeQraZkPUtIYT6qcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851664; c=relaxed/simple;
	bh=jJJlgaFEJ9g9K6Q8SrNlaqFfTep0VyaYLLhfj8cLj4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN67iqCv8RUGEG37DBeiAPC/lBrKeDWyjzsB/vt34MY7SOhcucAxeYqDWTmpoHCCiQr4ldG3RkC5SRFqZQ1xcYfBWT9Ke8xXcLYoeVRQfLL3FvsL8pVKlwiHpbI2vB2pY8Z6fHt2a/xHndoRfZX+J5akeFmDVpxNH9+O42zL2S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4gy6egH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0b6532345so158277066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750851660; x=1751456460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dG7kxxjRLtrO7B9/s+bXTu7SCYb/AqhokTFr9duMWFo=;
        b=e4gy6egH+LiY5h7RVXdwd3u409F+zYI1f+AvOgELDFBGaLEsfQy0rrdcSrO/frS1kq
         pDfZstmLHf6fc3fgZR7DAOZZOX9PgR+AQybJbsxSEa+Sh8RJTXX6zoirERV6NAqZnUOA
         9ZvRlgKLvWquE9MlKb5Axc6fJnBaxN+uw8zwaunT8AuMfhubz2ClQ3uOCI4IvFEwkNsv
         qHheN+Qsij2lxy4GBnSxjnav86I0kyr5XuQMkg2OVgMkLOeY5RAVz1o1XROPQw7jS/t+
         DvTjst0cYJgzerIsBOkCX6jhWeuj2tj5mJ8tTJK9yoHEnStJgzwWYobSU0RSbYDuBuBl
         16ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851660; x=1751456460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dG7kxxjRLtrO7B9/s+bXTu7SCYb/AqhokTFr9duMWFo=;
        b=POBWjNvPaxvx4W+Na6XQc6716PJIV1Csxie+2NZGug0XtJmqQMfW437/m7GhR7afB/
         f7W9/gpBrif4+IsSGZLBadx+/bnCm3Ysm2WGOEP1GPZJj+7czTnqmGW36Fpi2iwjnoRt
         Ng11xqfuKkGtRk4tU7O1fbITfnLW8OOmV2gCEtyXKsYxc/2oBKi89BY9WuUTFgIpryDp
         SQgVTS4O6hHzbNbizxGaFeg2vrhhT5LtF5DKUttTNu7gSrMkGuJtyH+iInR7asWjMC5X
         iCrOT8acWrSPYnvD6hQEWoxKKLOfGYr4YOL3S9/sYVkURch6ygdR08nWJppZFUHt3ofS
         UNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMPNJxsoXNrwT9gwEYSiXjgs8oiz2e4/q3s0T2Ouef6Wm89gkw4XJB2OkJNVy2zd3abYfVB1vdx9YIpUo8@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYBwdp/LEtuPqdO9KYe9dwJq4fc28DDJWj/J+w+4nk8YpSMAb
	o2n8jNfzLsratsV1utcJYK+Xk1qVi9J7v3XDzLBUIBuYr0aY74/VvLUDgdRpWBJY+jk=
X-Gm-Gg: ASbGncvBvsLJLwmUdgk3TTTJKpwXMoboJAUQMfrsRQOMCGx7olU0HyVPTGD06GDBI4G
	olZE9IwYXpLa0aJUas/0etV/m8hZ2nyB8cB/zgq6My3CVRk7u4IjDDv99UX+B1muAYZRcwqAdvU
	VvG64vtUFPF1r2Ba9TYaYoOEj/Y0LHYBwJD2v0TmkA5MvI5LnhNecdJfd+QgYj9RFVk6Tov5cCm
	UN5xX36gY9JaxubY9gxl4lH/a93CKYAZQGo1uAXHiMMFXILguZyRsp+KGZyG74+/4v/Wgn9HNZQ
	2IvWBFz1zqXiauZwrzb4kIkIQqGNvCWOprAgNxOb7ZO/MyMQOXIf+Wx5knA=
X-Google-Smtp-Source: AGHT+IFpDm4RRxvmymupPNfGTqlfEfo8Mbg7duMyL1/t+lekqFEkI+Q3G0VP+nEz3h7kTBtla3r67g==
X-Received: by 2002:a17:906:6a0e:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-ae0a7473535mr648229366b.27.1750851660394;
        Wed, 25 Jun 2025 04:41:00 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b618251bsm197805866b.55.2025.06.25.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:40:59 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:40:58 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Message-ID: <aFvgSjkCNueASD7D@linaro.org>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>

On 25-06-25 11:14:57, Luca Weiss wrote:
> Support reading the FS Differential TX Output Resistance Tuning from
> devicetree and writing the register, as required on some boards.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

