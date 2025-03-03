Return-Path: <linux-arm-msm+bounces-50259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20083A4EB96
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 19:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F16007AD6F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0FE27CB2E;
	Tue,  4 Mar 2025 18:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jczENyf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B927C146
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741112250; cv=pass; b=E3Kf2KXrMAPmZiIaQrS2WifRdv4SWB6SXTE2NhG/Eh6TEu7etd6ZYr5MwSkwqPQ7U8GWNaNGhwpoqvWfZG5ZbfBFbB3FEuQpuM8u3BLEVb2+wNknd228T4omPpQZdROtuaorKAru8HweKlUU+1SIWoBGLtbDVl2AAwpI144lCpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741112250; c=relaxed/simple;
	bh=VTGS9z3V6Q/xCHN1camC46iCwwa/aosOC3MAy/OdECw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekQaUnEDZNbk+hHdNoIzdBAWkj3oqZRSOqMsHSD9QW/zksy1Xd99L4EHeNTNLgCpIACeMJWlj52Ds7ZHyenWtVcMKlEdPV8s4b+mPqkIsKMvFz3nvl2D5ekUbDEGkCoG+GasGZ+9IM6arfi9vkIJCox6Ik4ZeWbCjLdrTLeesKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jczENyf6; arc=none smtp.client-ip=209.85.208.177; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id E99EA408B65C
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 21:17:26 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6g8c2SDvzG1Xr
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:49:04 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 3AED34271F; Tue,  4 Mar 2025 18:48:53 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jczENyf6
X-Envelope-From: <linux-kernel+bounces-541757-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jczENyf6
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 95A5D4210E
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:05:59 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 6C5A92DCDE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:05:59 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1682B1891093
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA601212B04;
	Mon,  3 Mar 2025 13:04:50 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19693210F6A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007088; cv=none; b=Jvl60CQlZalK8x+K0ozY2Hs6U2zBFZ6tb9XAawgsTlRYJXhKVVd+bY/cLjfTfm/3p9lcybpXNPF8Q7xzfpUKXGuuP3hkAbauXFIQnH2lz9o4eavNC4r/mQyud8zjU38MZWsitTfFhuhnSICU/u64Az0QjbreuvswH9UR2IqhqhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007088; c=relaxed/simple;
	bh=VTGS9z3V6Q/xCHN1camC46iCwwa/aosOC3MAy/OdECw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nr/HarwW/wjwhGyTUm7Xq4yIblotzoEnJcfJLXoBUB2a66hxTJrZYL8GWHPhYdPMrgpS23ULIfN5EBu1PtW3GcoqpUDX+CUqG7Dr8nXHyY/uWS6CnBtWqfTIP187Wi4/Or10b9x1Kv+8U6QpSgGFPY/Xo+e/tCMd6RwIHEp7D6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jczENyf6; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30762598511so47005441fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 05:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741007084; x=1741611884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hs6021W+ZEF1jgVJIvkS1BoBhBl+Zadb4lQ906tSWc8=;
        b=jczENyf61LzcAxDTc2zSS0GQnfs5gRzkh75eQHdMWLkx8WGL9mfqNb9wMFVMYeblG/
         Jfwg5rulSHH9/Pwc4VyEzCyQYBWhjNjWD1P6pj8+K/3HzIkZMByLXRBQFFgA/CUxVEcO
         5awAlcPUOq7xo6hz2ELSIcM+oycV3+cd3xzFHfAD8Mg7e5kf6A3gF0bIn/erUD+sBldh
         XndMFL47OyBpGEldNVqePFqMhX+2v3Znq/2ivn/XJNDBtTyRa+J8YZz2BzHkeTjes22A
         0sYaOi6ACTkWCsOErxYPh+roMBWexFJkyDipQPRbJOzLmkWnbhPHMaugdgUezvRkRYIM
         5jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007084; x=1741611884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs6021W+ZEF1jgVJIvkS1BoBhBl+Zadb4lQ906tSWc8=;
        b=jX8WgJSKyVg803wGvZolvBnFlLxK2Y+7tRR4GECvKUvmLTR+Ctaay/cfMcjC6UcZ77
         jtQMpNukwWGYkADIV6Vlm3kb9evOgr9FtrSWqMzvRshU3kuJeMn9a7tDCA+mBSNA8r6j
         i/4ZKR44h/yT7+8N/2rZ8OoF2B+AJZFPxjvNmH+AdwTxlPlTwp6UGMOs1S8i8S7GL39R
         F29LAseSLhKQlAUMx+I2byzrMoqwfRxCU+sCd0ViE77aEEgEJwNxHWRNugfoMeeLq4Or
         Y7Kx5TY3TbEmTHf2GYG0h5G5BpW1RtBYVgUoMksM0KovZ9C4+Hq+BSznlewQhiRsdVMg
         +szA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRFjlrizDQFsf5DqiJ3fTlfbtwCWew2f8tXK9q9rGjekzeut5BKgzegOtxPSxNTinZUZw9aI9PBC0r7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfigYOPni1kakTI1IAgsa3t76hN1Z1jkTcFChfPUOagg9KhzG
	vAUes6o30z3YrbPe0gI2vQa5XV35YiGgACBJk/uNW6mdHRbkw7v6Elc0wWTssgQ=
X-Gm-Gg: ASbGncvvXLaPOMTKLhsbNCRe+zlfCzprqcpkoadY13SGu6Bpw/IumsPwPv98wTCp2EY
	cEcrXkq5hioGw8kpKNrkRAvbGGM2c4/iUR3UlDBECyQ6PELmCWjQmTEEqV0R0KzigRYttfMc1/r
	1ZJnsL1r8gMYSjXbtnMSQwS0HfN0iMZMhwcd8Tsc76AYbd6uSxj3oKF/5Qx4nx36sDrIJoSS/P2
	dCZzVXahhjTG6gmPkFlHhMaKdsaY07n9i2jGu3l0DauVwb9fEN6DithUSmSV7bBnZz0wXmsF5e4
	JZGxrQ5At5eytzUTLZ/GziltublbuDc3yWvIjpInqzaESX8Yvae3f+rsyqypx8d/JJB1JyHC/vQ
	iIOb8aLcSIXbOtpxRPlADul1A
X-Google-Smtp-Source: AGHT+IFbAQM4Vg7NnCwXJQnOl/QXFO0jLcxGWTd7UWWRYV7p4mjc/3nqCPtXbPNZGlRw3vJtvB3rdQ==
X-Received: by 2002:a2e:a9a9:0:b0:309:2ed:7331 with SMTP id 38308e7fff4ca-30b9325a905mr62065031fa.18.1741007084138;
        Mon, 03 Mar 2025 05:04:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bb14d00b0sm4996411fa.56.2025.03.03.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:04:42 -0800 (PST)
Date: Mon, 3 Mar 2025 15:04:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
Message-ID: <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-3-quic_srichara@quicinc.com>
 <lakoxihaqlu3vq42eoqtlip23ggdieizotyzax5up5n6ndbwsi@ddqyzvsdtmkv>
 <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6g8c2SDvzG1Xr
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741716948.17636@oEZJWIL58K+rwYjJXX4eOQ
X-ITU-MailScanner-SpamCheck: not spam

On Mon, Mar 03, 2025 at 03:58:42PM +0530, Sricharan Ramabadhran wrote:
> 
> 
> On 2/28/2025 12:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 28, 2025 at 10:23:56AM +0530, Sricharan R wrote:

> > > +		dev_err(dev, "Failed with status: %d\n", msg.resp.status);
> > > +		ret = msg.resp.status;
> > 
> > return msg.resp.status (is it really errno?)
> > 
> ok, yes error.

The question was if it is an errno, not if it is an error.

> 

-- 
With best wishes
Dmitry


