Return-Path: <linux-arm-msm+bounces-27724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B74944A26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 13:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DAA62821BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF541898E4;
	Thu,  1 Aug 2024 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2pLgUA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565B189539
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510675; cv=none; b=uZCnzfum3WXqyMOf2eGO86mQLlw+cWg/l3aOj2vB1TC7tIoMbdKNvyuDilXibl+W9Meac7wa0ghgXGdMotAQfB9Vt0Sxgq7m9HTN4QinvWtsObqGNQslPfO71SpT6UPdQpxxGk0MXzVPZTvKrmhn83oa5AoQS5L5eSEolSNUFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510675; c=relaxed/simple;
	bh=onHxWsInCEUNZL02MWAzhkY6TZ4nGpiCTSI+v+pCri0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M38ELiHIHVwYqcPKtR0MmA1qaR9DYtTM88isyugQBD79XlFCwTOh8V0NxMBjItHwc6tjBf+mbKLJBzuQha218DcCBdedLoDnpsyIVFxvR0s5WrmHrE4LUbCRfMuXDgKHGhhWfttCXvONdfINdQeYwvs6NCwf49jPEpqpPWzZ/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2pLgUA6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-75a6c290528so4651251a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722510674; x=1723115474; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JBGFxD6jahE3TXwzjss0XWvpjFEEt8FVaR1X4PNMwA=;
        b=q2pLgUA6EPDLxR38JpbkL2h4xjaNoBlqFLkaVfXVHUvn48jXy9pKCyAGXIA8TryHA6
         O9S6mj5+n6AUSgpaC3RNRiEkAdnvIK/uyTSg7m2zHNxG+2muo5aB3mY3sYF+WbIlKTGB
         R43xyIrNAvT9QyM5C1txSgafKHo3MzVxtTx0Uh0AfGcABxqIASR/0KaHoZccpQj0GUDY
         c1WUXfJwbE+zIE2TKgEYZykaVpkQXq5cQfYBmR51HPgHQV16BgLYIjRWFByfwjoDfnj4
         39GSosl2Z3kyB/E2/qj67SOxLPV01zoynMIKIpJ4MbEQm1MpdLJY1SwgkJSezGMkBkwk
         sq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510674; x=1723115474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JBGFxD6jahE3TXwzjss0XWvpjFEEt8FVaR1X4PNMwA=;
        b=LtZTniM89yMQRmTNqTGtHgQxL6BlSpnWKRAriUyQ73mZMumv+qAmkLHIt0CSuHYQhc
         eQBveYQy4n2lBGGsX3tFvNcz0zymOzfvYo8/z6jmzMBN6DNZnmFa85YhXUXhVmWHGzyI
         glzVezq6YOt8CSLTL9bjsbobLWLqXdWSalc0PRNdoiEnKabKfsuSxEd9iEX1GrqGyoq7
         90vNgI0EGDolNrgBqfqt/38IYpf1/4qDjHU3ftogRQQ+M0+n6EqZ3hw5XC4VkB6I/vf6
         3VvExhIk1TUien1HqO7HATJfZKKG7F6YeXqZ5isFxnKYEfkUT5O0nkOxuQb7e/HA0aCa
         hwSw==
X-Forwarded-Encrypted: i=1; AJvYcCWSx8HKUl5i7WVNrN19Q6DtBdmdL7zxOhTOmwvHncYmeNSqnIE0i+ndnlXFMQJOtIjvMUcyGlZvn80NzjBuVsEvwNwnYmN14a2XRk2lTA==
X-Gm-Message-State: AOJu0YyXxoolrkqhZnI67EAMtmg5HP+hyErEZKbwkjdfO7q7+U8/vzWL
	OQcvt5+pfYiEJZ8EzIGoKkuS8drGWQ4Au0hXvwdKxZLeKXhs14UFpilxcS+aAg==
X-Google-Smtp-Source: AGHT+IHqPM6SHkoj6Vhah2++836HWIGjccmsoYPBQTMXP6Uqgnf4FBlSWurf5IC+XtA/PWvxNY0bNw==
X-Received: by 2002:a05:6a20:7f94:b0:1c4:ce43:7dd1 with SMTP id adf61e73a8af0-1c68cf82a04mr2602801637.20.1722510673570;
        Thu, 01 Aug 2024 04:11:13 -0700 (PDT)
Received: from thinkpad ([120.60.66.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa468bsm136893295ad.255.2024.08.01.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:11:13 -0700 (PDT)
Date: Thu, 1 Aug 2024 16:41:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Elson Roy Serrao <quic_eserrao@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/8] Enable EUD on Qualcomm sm8450 SoC
Message-ID: <20240801111107.GA29707@thinkpad>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>

On Tue, Jul 30, 2024 at 03:24:31PM -0700, Elson Roy Serrao wrote:
> The Embedded USB Debugger (EUD) is a mini High-Speed USB on-chip hub to
> support the USB-based debug and trace capabilities on Qualcomm devices.
> The current implementation lacks in below aspects that are needed for
> proper EUD functionality.
> 
> 1.) HS-Phy control: EUD being a HS hub needs HS-Phy support for it's
>     operation. Hence EUD module should enable/disable HS-phy
>     accordingly.
> 	
> 2.) Proper routing of USB role switch notifications: EUD hub is physically
>     present in between the USB connector and the USB controller. So the
>     usb role switch notifications originating from the connector should
>     route through EUD. EUD also relies on role switch notifications to
>     communicate with the USB, regarding EUD attach/detach events.
> 
> This series aims at implementing the above aspects to enable EUD on
> Qualcomm sm8450 SoC.
> 

For the open source community, EUD enablement means they will only get EUD ports
enumerated on the host and nothing else. There is no public info on how to use
EUD nor are there any tools to make use of it. So what is the purpose of
upstreaming it in the first place?

If the goal is to use EUD only by Qcom employees or customers who have signed
NDA, then you can just supply them the out-of-tree EUD patches and tools to work
with. There is absolutely no need to upstream the driver support.

So for this series and any other future EUD patches,

Nacked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

I'm really tempted to send a patch to remove the EUD driver altogether, but I'll
just wait for the response before doing so.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

