Return-Path: <linux-arm-msm+bounces-76180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA7BC0C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 10:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE0163AD79F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 08:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FEC2DA76A;
	Tue,  7 Oct 2025 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3rSDdVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C570C2D4B40
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826182; cv=none; b=SX8ZiFkqOnZwr+wov9jDTKESIhw77SZA2G1QDrLpQxeqniYo0/uB1w0R+GOwGyrezArAezkmUdXq968+XUCl7bC2/T2A7E7yYLu6wirv0R0N06ImfaKsvimN9h0Vd7VuXOP9dgzhgf15rnsL+hINcG+N2lC9MSJDUfdWwuo3lqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826182; c=relaxed/simple;
	bh=hclHZaPwvU+Or/kgDq9GYsNnRsFBBmjtWca90LyRtXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qr3Ag2A8w4d8vvL1X3e6P3l6QIUVSwxC9bnHgmEg6l7ux3hjHkiEE5amsakuJQSEUZ+A6cFCDLBWjKXA0irh5sVlMVAzooZTGMn/1xZMIbFjJYP7fWvVlZ31POauqPYI3eXxEkwpzSFnmstmw23nrhiQBtgSGrO/nWX7H7QLzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3rSDdVb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so55500695e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759826177; x=1760430977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P/Puk0DGClgU/d0N9KPCXsJda8f3CNcdxuN1BPXv0d4=;
        b=G3rSDdVbIEkxIEUR5jo4ejt9aPv88tOyhobo9qltV+JH7QORuUESnDPrQkwHOGVivI
         ev7JzUfrlXAZNcnXgRVoywyEzQPginE8TQrKiI9HHW1KXMQ7HygMUtZNBP3XkUyu2fQ8
         aH7WPDF+THlD0CO4ul6KVe2zLVHQ1cmR8x4E1ThgfOMMkAsXQhZb5a/PuoDbaeYeQESc
         7kS6Xd56WuS755Rd+d3izKqWKa6iLAbttfLvgkfeY79rqEm6hqf/eklKvJMYPfqsIXga
         feHu/HJ1TlRzm/bNrCQT0FmMHJrcY7n8dvLRvfDFvXcrfurCdOyEewiedTCac/7peusj
         jpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826177; x=1760430977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/Puk0DGClgU/d0N9KPCXsJda8f3CNcdxuN1BPXv0d4=;
        b=iN/tYxN3vHloaEULRvbKbOEtvyA90t9JkpeGzTwHmmdA2K4lO1leYCIAn3dN8E8bLr
         sVPaYq0xim3gneFciyQOeu6Im8XEXi451bGPTXiPDXdG3Q5ziETwb0B1Gdy4vrWVOayq
         Xxwj9iRaU1tB6ahmDUVtKrX18B33pfP8p6ub2b8gWbMtNiH0v7qWld1Fk8ybcg2A9L7l
         DQ4tYw/3S0SljMaFU1RKgv0vHpRSk8dHs4K4SraeGzcIOUj/Emavcwpi0tR+Fu1QNAfJ
         mPEzzxY2OBsh8gDHHrz8OzKBRmkN5Jo2a4rzk/cDlsG1l1/zlAagtRy0RHZuVy2kHQIf
         j/kA==
X-Forwarded-Encrypted: i=1; AJvYcCWRfeDI8Si11rT//a9a+qE4gDeoMBpjb/KwT/QmCDUEpMD1Tn9w04GL19+SGOTCifUsoNstyQjspDkg+WGf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nYgyQgY1v0RkxqkB82SOT59ilk3t6R4AvsZXXZKfWkYhRBEX
	nI6uhBEbotTRJgyPl8QlBMve4hm1s5QBbfpKCcgew70qkh14sWhDJKxavWmZGl+MD1w=
X-Gm-Gg: ASbGncvF3nFi89/Oe+fLIdAalMcTvOdhGWN2eFVw6A1FIebPBoMBcCUJ8NKwa6Zppwn
	PW+hfPDRy4higlL2/kOQEjUf+C5LtODArkYIHQcfyuR7tNsinqcrJwrYkKrgyP1jzNjECHcw67H
	48Ar1CyLBEEAs9M/tzwLm7h9oEBhg+yI/LmydJlMWS2nrKguSmpdRf16NDP7/iQW67kIbFHfa6f
	lEFjtZ03eXvj/VrZMq6TtQHK+i3tGerH74/B/5kon7VgeOtp4Q8g3mxPfSBcJIx+JKssqxG/MLQ
	SMj9NxkaXrtUpv2ZsPGoTdEtITTb7pyt1uoQCTD3hjb5Mg5RRh2nSyV8P6Wqon/L7AR3c+G4KFr
	964O8YERDUEvlab6ymKJO8/0k5qYRVeOvlN5VcM9Z21KVQ+w=
X-Google-Smtp-Source: AGHT+IGSw3Oke9DIjL+Gqc2rIqeM9+dXoWrNDqM+qZ8Vk9YiyMWaLjloD47BAFLjtVPGVOkVw7GP4w==
X-Received: by 2002:a05:600c:c4a8:b0:46e:4c7c:515c with SMTP id 5b1f17b1804b1-46e711549a1mr93067795e9.34.1759826176991;
        Tue, 07 Oct 2025 01:36:16 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a0241bsm284196215e9.11.2025.10.07.01.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:36:16 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:36:14 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
Message-ID: <i4vpoy6bgkclazobrozspxmza3j7kyynbbs5lgdydtfxsk7daq@aqf435db4n2p>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>

On 25-10-03 20:14:39, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, some of the USB4 clocks/resets are described, but not all
> of the back-end muxes are present. Configuring them properly is
> necessary for proper operation of the hardware.
> 
> Add all the resets & muxes and wire up any unaccounted USB4 clock paths.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

