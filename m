Return-Path: <linux-arm-msm+bounces-53462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C6A7F565
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F8613B14B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 07:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1500825FA07;
	Tue,  8 Apr 2025 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3vnhV+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4B24A07F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095695; cv=none; b=NONUiiPLUmSU1gKp0xtODaCqiNCCsSxw+NEdJ648VNaxq9nNOPy7iIOdcMVcD7cqkDjwJeHG0oiUMO40LarLi9rG+ap3UB2hJD3zQZA8d8Kvr2UDM5uC9np0Eqq6Ly0rksLM1Z0ScjAW+nDe6Bl01vFMHbC19j8AqEN3+C6D/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095695; c=relaxed/simple;
	bh=nPoYtZy7KUFsWmjv+MsgSGiqHF3BXzTIHzDdr8PqkRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dt6wwm/Uoj6K7In+AQkHf84Ygwj+ME4vbyYmUFW8WWwwVX9yjNdZo6qHDnknsEc2SlFb4gPpuXID17rs0zN6LtC2eszVNxSMqFOmaECn0RQ5cMZFSln/wtFd59XYF21c6siXLycG8o/bDUOEsDuXBUYvAGdR2T971Cwldd0oAJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3vnhV+9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7394945d37eso4333960b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 00:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744095692; x=1744700492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sk6fM8RXeZDF444eeBwp9+VL+kRgjV92ftku8RxORXo=;
        b=Z3vnhV+9ds0AG70Vc8OB1QlL49L+LIUZj1GMfUQ6OZX1/T4Fp2TReupXh/iuUCtT4f
         5gNuROICOYzWT9l1X8+XesM/Fp+mBtQjab06Guqw+uZeOpCFRODxumpnCfiE8QcB5WfQ
         Y7GnR9Z/AZ5TowCSMrKCP8PRuTlS+spmfQc+dKUcp0L1o1fzIE9Tg/QTNirOR7LufxzS
         pzQsLQKW9BKRJ41LD8X//z/XUVRPjt83+XjlbOsy6qDHxb79T8ejz/6jJB3pzo2N3rjL
         PNUOqia9aEpyBc0f6ky+VebY8W2GiYt3NDy6fOFz4Dg4hf8XENo+x9HWJF5U342RO69Z
         QurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095692; x=1744700492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk6fM8RXeZDF444eeBwp9+VL+kRgjV92ftku8RxORXo=;
        b=VHbYY2RpazqyZNZ2qw3F2pxEculuKheFj0tEXXOD7Mzf1XE/hpL1FdutaN5qLV3pse
         LUdhWeieR5IyNEHUJT5tNa5cGBplnu8cnTy+wxcT7zw3zRcMcLhze9KhCfDPKnPWSaFf
         5t1TyiL6fwsQCdt0qvC201b3GDyNOo3Wq9WZfDykQibsahAWpSx2oYP1QIhtdi1iXjP4
         bVMT/0vzKTaj2YcWtUbjlpZW/JNbsiEHvZ2WW/Gf7HNT+HR/aZRKA9o3FBdT7Ztzhzc9
         vDmnBR++LfSgmO/8Zol8YW2SSGeCMonrH3Ognj3UmpbFF4veJDEKPX/FnoWaKRFDlM8O
         mADQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnNBXu9NXq4f34VLyKrP2HRur8mhBAN+Tb4LHUIN/ssG+7jnNiAVy1QfcfGuIsrU0HfpTNp7PIwdW7k3c5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy+kPnn6vTCqaI+fDokDvK3WtSj3lkBdYf+JIPQu263pRuSevs
	IXM7Db6ajrkD+oFDJmqLVhcjl/CZGR+HieIJgA2zE86UJbAjDH/rZGQST2dbQg==
X-Gm-Gg: ASbGncvPGynN+/glM0fyUtCo1Hqj10UNQX/RnM6mpbq139dU5zThDLb0LCSYGsTgHeb
	c2XWh0JXm+1heB4z0eaD3BQJMZqhBu5bQkof1liVvrPTpWLblYJ6N2bin8ecMrEknPbccI64vDl
	rlHGeMVt/wrqY49msNjQSE7DsCa98yAtxJSsNHTaUj8+P08OcgE4P2Sfy8zukPidFqj4kfSg3er
	liz9aysjSuXej0P9pEnVREq38nQd174cmICU7aL6Nk4veYe3It7XUjh8qkwGtU38sDS2X4rsVfo
	7o7Fg3mNbc7L766qA0BrzPar2g5Z5hHXDsSurdl3VsYP+zI5uwTJL5V5LCVHR0vgE4s=
X-Google-Smtp-Source: AGHT+IEb4ZMUwD/qZOKPwHHbmJhudJyZ4zNQvD6Atyq5HyLXWWSig7IGpn8rhWxjicEiA9KL3IwKcw==
X-Received: by 2002:a05:6a00:98f:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-739e4b44d68mr16443121b3a.17.1744095692564;
        Tue, 08 Apr 2025 00:01:32 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d17f8sm10070318b3a.10.2025.04.08.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:01:31 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:31:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> MHI control configurations such as channel context, event context, command
> context and rings, are currently allocated individually. During MHI
> initialization MHI bus driver needs to configure the address space in
> which this control configuration resides. Since different component of the
> config is being allocated separately, only logical solution is to give the
> entire RAM address space, as they could be anywhere.
> 

This is fine...

> As per MHI specification the MHI control configuration address space should
> not be more them 4GB.
> 

Where exactly this limitation is specified in the spec? The spec supports full
64 bit address space for the MHI control/data structures. But due to the device
DMA limitations, MHI controller drivers often use 32 bit address space. But
that's not a spec limitation.

> Since the current implementation is in violation of MHI specification.

How?

> Allocate a single giant DMA buffer for MHI control configurations and
> limit the configuration address space to that buffer.
> 

I don't think this could work for all devices. For instance, some ath11k devices
use a fixed reserved region in host address space for MHICTRL/BASE.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

