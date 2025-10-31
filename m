Return-Path: <linux-arm-msm+bounces-79849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A37C24658
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94947188759F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC0933769A;
	Fri, 31 Oct 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uoan2qzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862CC337100
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761905696; cv=none; b=TSaynyZILMEyQU9oym+VNTM5hy8eqaM+oCuBOcVqv4c0a+nnsys32l8XUQZBbMitjHSfj0qawhZ8cjDRnN+56DjzfCI6x60ykLx16VQtDA9LuBOCiNZtwzEGBCvX/Xu4uOLKFWNlssLA88gGUXe12vWpiynpDcYfZxhXEpImJrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761905696; c=relaxed/simple;
	bh=leEyrcaxgVEFoDQpBRQADrzJ7aEgLp4CWlT8ZId/kkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQIkp/5K1hMATuOFeWd1DhOSYP5+Yiy6L26NxnGNdsVdUw7Buk4SDTvEu4XLbM8O+Juz9WtJD5gSBWXi9cGOn9oqB7fW9YO7X087NoAHmWgPTTpGY9WiIkmz+LCfyEl4uuEfu5FNIseDmuxSUdQ6SnOcIbJDNB2wc0lQmt0wIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uoan2qzA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso14578925e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761905693; x=1762510493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTsftEfXvbhUS8zh5vLZ13mZZSic/SfiK4lQDUBWE+o=;
        b=Uoan2qzAIBNrasQ9kywQFbN58IyeAMjIUhAaHttS3uk5y3cip2mZ+qcszej6OEkUf/
         k3+fZLHyGSajsYormDv6TLbhE7Vb2lJyXGRT8mksQP634NpaSDlE5g2+pO59zy35vHrH
         7waG3oAol0tnP5Nt89PHg5c04a5brwVTpCPCFhOwUIzAwxmRTUqXYY3kbGiHDF2USN7c
         xUcSBeWgoyrggWoYcVe8A90ycN7Bz45yxQwlp35FgTKOaKLOS6LELPSK0qePRigT46sl
         83nXJevCKPl7+uStM0sJygXWYrDyFbMKmLldCqt6P0oYgstmHfmRcBnHdnwz1oo2e6eE
         m8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761905693; x=1762510493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTsftEfXvbhUS8zh5vLZ13mZZSic/SfiK4lQDUBWE+o=;
        b=Cie5dmHqer87pbx3PiCCzngvuf3wjw+KQ5k224WcNb4J8IcYdInx5S8gE/ATxKrqrx
         qB89aU3IyzyN+t45fY3tAJDnk0M9Az24PG4Nb4GVF3c9OhyagQ+XysbviNFuGiHMenik
         hNLEBXiCorGWGoBGcL7xP3fCjkKg5MaYPvtWQiS6d9ytjyly3D4AdOYrdu/z3ttt4ibl
         RO7IstpnUHTRWDawsdYOduArSEizMSjuF2wTbx7pVao0OImLsW7NG+SfvgBEt75/6RC4
         n3JtPB85P6JZXF+xZwijW3X4rTifnEoJ1VVPbYowhnlKyDLXUzcNIoQMB6B24MEYfbvu
         /r9g==
X-Forwarded-Encrypted: i=1; AJvYcCUTCGnWfhbm4H7M6r6IRduNa18EJp7jJtmrQ7WlPrhutnk06c5lTThO+h7X8f/PtcU7HCr/AtxwaCzcb7Qq@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbtDmXWf4JLXlJ4xPfORKhq7yeu7LaqtgOf9MwXBFkp7NWhjA
	veINNxI2qk88xibrTkjFZlobp7fm4axoI7RehqB+N2qn36WDOtaCrX6mB26YHYM8NnFGS3QCetY
	owg3E
X-Gm-Gg: ASbGnctdph8e43mLhZmGJbDDmMYM8hm1kZko5VVvlSw27HX6ZAjFFN+3Gbm06Joe5Lm
	GO3zVAHR/qjZIMKljLEt9KaCQ/B50rfCfj9qVyhexUFHZ1U+K6a3NIGrpociHVWZSMNRzWcXgQ8
	IzDRnhFO0pQvyCmyD1J8AdYKeJiCPOcwmOmMe5jSg0x5BzEhhAu3U7rX7XEjo409YjQ4Q6MM5wo
	9+nAFt1YtmGdLlJH34FLIL3/CZfGQdURVz1KmNj8RdaV12OxQ+0fvYjneccC3tZ6/CvX5lXL4Ww
	iTiDJYfDzxUwE1CIsKxgYQDvB55eXZz39PDaDc95IZhP9RrzKodzjUCKSDrOhwfiG6ZwYDmZhiN
	olbtRzVcqAm1WNOY3HDQv4vjeMiRxgHdQM5T93klxB4WlmKAYaq/NN2Z0OznbZTFlPXK3SkuseP
	2EenAMgkY=
X-Google-Smtp-Source: AGHT+IH++F13KCtDM5aSmxXlRMY+DkOrtWxUCdzt5Pk2VSvn5xyt2ZqvsBCxug2ep0v/e7g5Vvdu6A==
X-Received: by 2002:a05:600c:3d98:b0:475:dd59:d8ba with SMTP id 5b1f17b1804b1-477305a35c9mr28731235e9.3.1761905692770;
        Fri, 31 Oct 2025 03:14:52 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c11182e3sm2792046f8f.11.2025.10.31.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:14:51 -0700 (PDT)
Date: Fri, 31 Oct 2025 12:14:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: tcsrcc-glymur: Update register offsets for
 clock refs
Message-ID: <ievmorxn4cpwx3xnlr5m5j7tgv4p2ixfbgr5bojsetzmdgmid3@764lndl3yqpv>
References: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>

On 25-10-31 15:32:25, Taniya Das wrote:
> Update the register offsets for all the clock ref branches to match the
> new address mapping in the TCSR subsystem.
> 
> Fixes: 2c1d6ce4f3da ("clk: qcom: Add TCSR clock driver for Glymur SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

