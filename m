Return-Path: <linux-arm-msm+bounces-45486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 551C9A1605E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 06:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3F83A1188
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 05:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85114502B1;
	Sun, 19 Jan 2025 05:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJ1me90m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90342A92
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737265273; cv=none; b=saAIE0kCK0ARwva1dSgBeTKRpNZqjAV1HiJ7fXaNNwOxl6B06pvWawNfpdCG7tBh5MP7Lw4Ak9hZhHAyB34i0hG7n5VSZGcYUBT2cIgfI8dNv7wXMzizuHOWJZjwBOZYqLNkeWO723M/HP/5GnYLvxQ9H+IGhCRLUmKd1JPnSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737265273; c=relaxed/simple;
	bh=7wiEiBO65qt8hUOF1czRxQtBtxWFL3rfJ9lF5CVTyn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glssHhP55M3eImX9OzhoADz5trr1s97YUUZ/Bi5pCZZtj5dNQauxKgVSa6LEALy7WQ2+xWGJBPg0JVi6ED/o09WfrnAneAY7ZSHcT/FVUog/3tAqvhrlZT2SVq7Ii72wEkNhziEqr4Y7sDc6Ob/L3aT1+lt8sjvjoJMUn+HgAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJ1me90m; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2efded08c79so4750957a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jan 2025 21:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737265271; x=1737870071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0hiYAmC1NBHRz5E16AsSt6i/zS8INIR8RO6iwr/sB0=;
        b=TJ1me90mrf9p0V1PbgDGpdW9+1EKXfdNLuEWoW1v+Q+E6beduVF248+e/tJU5cg8OC
         eTlaA1K18X/KHljglcp/X4NW91Q18mMn9ZN868xyV+HlDstRygvOZbZ5/inbEjZVX24b
         YWd7kG5uziSYnpd2CC+DUY2m+1Ef2NcRhCmUC1gqOFnoCPKGmItcYzkwSm+lxcCzJFU+
         DAAIbFuECSkQKvf/2AjhojZRXqgwbU7F97//Iy/P59cCQvGOVO1ZU4r6KdjYafBFV6/s
         Zngq+FFIXo1JJ8+u3Ti44W8wS1t1Lw0lHS76uTHUuMEzxtOAO1gYappH1un3lmqczpKr
         zi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737265271; x=1737870071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0hiYAmC1NBHRz5E16AsSt6i/zS8INIR8RO6iwr/sB0=;
        b=OkH2AGgJpH1gux2omXNRTDtjYec2K5tNcelTpJmCpPT/duIvJu6D3ejMbWHj71jbzM
         RDu1ZQIoEdbERXuWvKFcnlR7o1SVPGp6CPPwSHoBdhaIve0glGRc30ZeLBCUb0o6ricV
         dsF0v0K8F3iZebnXYl+6RgPaaJQ4ofo+QyOzuILy6uSwNMFBEO7mYAk4mabWQAsM4Nk/
         4OvDBIzQl/+OtV8t+CeakNfUJ8sFgiFCPdUn+FrWlBueJ+jJjTa26J2lPZup7/ew8pWV
         LqjrUX/NGFiGZlxBfsEOtt8c/aWt3nd7F9kfEi3Om0BCPzUGJ3hl+qDS47lLxnCrWb/y
         w4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Qo88tbFHQgBr/YN0wy9kJRZGswUFPxyZ3ldd1tJ+efNEglHxUrkorkpvpltHfDWXGSCwZ/8AKIfaYiXD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Q5Vankp8LUSDKBrcxCBa3lMtmg/cExucheqHVrUKVpnDYbqF
	jaSRcEj/yZrig8rSPzbGqOJyr+6jqzamd1qSUWmO9m8LBa1f0idfP0dXcoxhFA==
X-Gm-Gg: ASbGnctWJOZsj0YdbC+YztvsGzAkVA3v5ij7XRXstyQFDDS+wqE2V6nozr76GSOk6V8
	XwTTUTERYIHRhRc+zoX9RlETkZFjY0lzk2xCJSsgm8lz+MmNOTEse+APmbWttXAY+2dZy71IzCS
	kIH3TUNzBVW6aPQ65eoX3VbmONyhdwyHLCRd/MrZZ+dgbAoRXjMMYphw+4haHG6JJ1Vn1siy6UO
	rxuQ6fdHn3SOwsRMGc48wSDfaM5ZqtaW7bfPcPgu4OD+EJFQa5M5pHa0UZEWWpg436XScDNKSVW
	R4BxKA==
X-Google-Smtp-Source: AGHT+IFTPFAuCVR47CqJZ5aE1a4b2WBsAqSxOx0hT2JepHYK9FHRggwrPcIYivOgfSXepJdzgdFTgw==
X-Received: by 2002:a17:90b:4b82:b0:2f4:423a:8fb2 with SMTP id 98e67ed59e1d1-2f782cbf6a3mr12954407a91.20.1737265271093;
        Sat, 18 Jan 2025 21:41:11 -0800 (PST)
Received: from thinkpad ([120.60.143.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7762acd87sm4995908a91.43.2025.01.18.21.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:41:10 -0800 (PST)
Date: Sun, 19 Jan 2025 11:11:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: vkoul@kernel.org, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH v2] dmaengine: qcom: bam_dma: Fix BAM_RIVISON register
 handling
Message-ID: <20250119054105.rhsathhdqapirszh@thinkpad>
References: <20250117111302.2073993-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117111302.2073993-1-quic_mdalam@quicinc.com>

On Fri, Jan 17, 2025 at 04:43:02PM +0530, Md Sadre Alam wrote:
> This patch resolves a bug from the previous commit where the
> BAM_DESC_CNT_TRSHLD register was conditionally written based on BAM-NDP
> mode. It also fixes an issue where reading the BAM_REVISION register

The 'also' sounds like the patch is fixing 2 issues, but it is just fixing one.

> would hang if num-ees was not zero, which occurs when the SoCs power on
> BAM remotely. The BAM_REVISION register read has been moved to inside if
> condition.
> 
> Cc: stable@vger.kernel.org

The offending commit is just in the -next branch. So CCing stable is pointless.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

