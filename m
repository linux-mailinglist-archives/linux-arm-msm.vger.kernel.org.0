Return-Path: <linux-arm-msm+bounces-21183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F628D569D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5275B2613A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B047184139;
	Thu, 30 May 2024 23:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vUmR6IyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD0218399A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113188; cv=none; b=qzFvtYnq5CCseejXCIvSzkI0MPJcXFYe/ITlUI2G9K1S5//B7SSAE5BYZp44a/oWWQHlSrR4URvhR/2q9EqPSxhCCvvCOMl4YwiuaqxTk5PKZPtpRfxKGESuZ0rF4yojCL5peGppEV8luUodmTAO+r5ajnJKCDCpHZN/h56I2xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113188; c=relaxed/simple;
	bh=ch9JOiWMJJiOnUpYGVLTxj7kFd7UnTTTyRR8CRFU7rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK/MBYfcOF3VNMAg044t7fD8HbgMo+l1BCvZ2GkwfFYycPGSyTmspZyXEtWBYeSNK3YHEhmQJYY3j3YVyTQ8wqER8vxKhEtVK+94o3J8PqtGH7QxfBRGmc//H5TEPkvPe0G4R5iKT0gM/C/FVbJPyaDZ+uFt41q+693Ip+FD4Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vUmR6IyU; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b27afe214so1238212e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717113185; x=1717717985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlJj/+/ssB3tzpOxPNXGmmF1sQcYcHLzfsgA/Q8exQs=;
        b=vUmR6IyUR+waUkrJ+VrlMdu6+gQc9NbtD9ccN1aoYCOFkGU645t8xVZ97UbcjOoS67
         QlY3tTUYRLYw/PgSyp0vW8RTUKa88CmO6+Jp6BwnfXfvKiY7FXe/eKtXcyvefPbUkwkg
         nXg2gBgFNRFo6AtNO8JZiacbC9snNcOb479H3sq6OVnXj8P1MnTHlvZin3hIk8YD/v36
         HITv5JSs0IbQds8TtU8tQAohn0FsiV1/XoQmJmqctxHewdvZBbCGT7o2t//9jAcU+Pw5
         WlE9L/vXPMW6eo1zG4Gd27hlsM/Y96bKqs7Emh1efoVWfkrQ3sSD4dEcGoWBJT6QjJWC
         mY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113185; x=1717717985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlJj/+/ssB3tzpOxPNXGmmF1sQcYcHLzfsgA/Q8exQs=;
        b=ohciMht7lCeN3BHqvyQ2rIo80JMgCLWX+K/hp602O8Z+0BALJwpxcJg9osTY6NV6N2
         Bayis9apE4zHCTvbnPYMePDGHD4T1xqZuq61wl4gamI6kfCSbPF1cNBAmRyWiKyck7w3
         tZbshEL2FN3k/v6S//KuVQgA1hkv5L/80lkGeeoT8NCTKKuOvUpwirxM8cLGGCQaOP6i
         sFTrCL/r4il/iaFmuq7E5eXWbsW9lsS6SXNNpzwoatgb9kQ0n3TRy6MUF+zIGMCEdYLX
         1G3HkjizBuHBdzwvUXjXgoEXeX+XPU7ycf4OHXLYSZBauHbw4m6msu1MkkoLxmXNZkdD
         wkTg==
X-Forwarded-Encrypted: i=1; AJvYcCWrTgYhTEVwV+gspafXo9ZZcGmVRWfe3XGpw03bNp5CTr9ss+/xQDum2A8opc6g1iEnViG/PNJ7/Ru/aH+KGTwZTE6/1E4CGiDDILD5eg==
X-Gm-Message-State: AOJu0YwNfc/jm4Miwdgi4JmAmm2BKtPbRcy+9k8H+4e0BvYly6Fj95jh
	7lUBzWCExcg+486Ozq/nDJ7qFgWJX4RHulwVKMxUlpaAWnRRVkDRHD9O3BiLJOo=
X-Google-Smtp-Source: AGHT+IFj3K/ODweCD15rlhGe1SP3IwwnmKl+c3p0FovbaaNRXGZ07AuOQFeYzCXBfqCYq3scprljbg==
X-Received: by 2002:a05:6512:34d4:b0:523:7680:d07 with SMTP id 2adb3069b0e04-52b88740613mr98923e87.6.1717113184849;
        Thu, 30 May 2024 16:53:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f3cdsm128263e87.76.2024.05.30.16.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:53:04 -0700 (PDT)
Date: Fri, 31 May 2024 02:53:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100-crd: Fix the PHY
 regulator for PCIe 6a
Message-ID: <tbnstgvm67iiiyet47hdtkhhkn5bpabthu2c3kf2zydddraa6t@ficbm2sy7i4s>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
 <20240530-x1e80100-dts-pcie6a-v1-1-ee17a9939ba5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-1-ee17a9939ba5@linaro.org>

On Thu, May 30, 2024 at 06:43:39PM +0300, Abel Vesa wrote:
> The actual PHY regulator is L1d instead of L3j, so fix it accordingly.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

