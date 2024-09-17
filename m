Return-Path: <linux-arm-msm+bounces-31883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92497AB69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 08:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1FD51C21906
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 06:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AC7132139;
	Tue, 17 Sep 2024 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVorprmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DF9130E27;
	Tue, 17 Sep 2024 06:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726554510; cv=none; b=i2Si1qtPCdCIRm9InEmarNI21YsbGoQdtQSdjdr5ekBWKEin6xZBrbLkHf2B9OgH+rm9UZi20h00NcM6laxpct3rExHrMZ5Sf62/xW8eZ8Y+5lHx6apyPJM6xFEt8G51QfO4apS8l2CS0vGxZhSu15z7YZqfTTIrvo7wPuGPWuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726554510; c=relaxed/simple;
	bh=mN5VYuT51qixRZNsWGadydytrK+8UJVniYSjLNJp6yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9gsU5QnYkGTJSKiX9iI8Jly2zOdV4fD8eFiLm/peGVq9mevwu7XIDM6nJquUDnOkzuJavr+/mNrh5rJreW115hulqpXpbc1+IAbC67dEtjvGhumCkGmtZOiGBRABnNBp0qst/rZJnPBkkExXERP2Q6pBItfewx4KEluUotl+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVorprmP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db53f83a04so1062056a12.0;
        Mon, 16 Sep 2024 23:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726554508; x=1727159308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3ZP/nJZA9rln7+OCobryfbrxZHaXKyJbGZyK1QYUtQ=;
        b=PVorprmPeE9k/01AZEgJmBIj4OKTJKFmvYUS24Rbn5Kh7IK0H2gLbO/4QSCzvPf1Kx
         UVZZ5S9J9clQCfMgcKj1s9gPvs8whQdgfpkNlDFrcUKeHiHBPo+DupXYBzsTp8AucC/z
         Rzyp9hcjFYtsCRwMnj2H9zGQ8j5OCC8JfKm8LHbXnyYfBA6us7oP3V0Qef5MQfPrWCfM
         sMXpvjgA3QmQnGt4qHMGZGaTbdRGetkhzOOPIB0778nSe+0HdezkgOa3O0NlsRz6fK5x
         H9QGFjQdm6ISD7R9ynROl4ZhocjA2mnJpkAMU+WywB8Uml5OwTeTm5cV0BKCivX6pXjj
         iAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726554508; x=1727159308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3ZP/nJZA9rln7+OCobryfbrxZHaXKyJbGZyK1QYUtQ=;
        b=MDdu6LDsYLMK0fj0VjYZlrYH4QDW4o6uTQtujfaWJk6UBAMdTcoZjNKUKAorAlUv3P
         R0CFqHvqfLZhoHDy7lbKmFlXZsGWvXElL6zYhdZ2s7A8nia8OGUP8h9uDKS4aSDelBO2
         e1l9x7E4/8tPTIm0WpvftCkrYdguoIa15V5GmbT+2IuMW5+QeUhc07/irJOLa2WA4+5u
         e0IX7oEz8Mf4nmmyOEOcPYky3cuvmQz9KPBekJJR1MB63LpZP1wZTVO8ESYqgPu9HnBb
         tFlxI95YggMzuxaLYZnwJa2y/Hl+Y2BZHWO86rOvtUEggluUZ96zRbUE4xrHlWbfOMh4
         TbtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKBv3lawGuM3629LjFLS9APpYia2KLmDVLOXdaj7/gf/9POT4pH0/97ptlcfeJ8rSl/jsLM9Y/CNi4K06U@vger.kernel.org, AJvYcCVQP0g1vuAx8RnBeqHQD39d4XpG45nThrpGqi0cYotoB0EUCLhW/giYyF6hAW8+4X6msddcN4Xmh7Aq1SFX@vger.kernel.org
X-Gm-Message-State: AOJu0YzqfWdqc/pG7glDyfUkMLmrq4gceLJepi1KnEDG2GSMxoHglLvR
	WfhBITWGRul+jF1Po7quAJ5EzEDSd38ioAjhM2o5PqSd3RIjCQpO
X-Google-Smtp-Source: AGHT+IGbam+8YkoUhko3PpNyPFdgEISWC2p9A0kARk6v33QnlLFZZXKsy3pstwYM7+pXKzfcaoJWvQ==
X-Received: by 2002:a05:6a21:8901:b0:1cf:46e1:5b7c with SMTP id adf61e73a8af0-1cf5e05cad6mr36029385637.3.1726554508381;
        Mon, 16 Sep 2024 23:28:28 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:864b:f5ff:fe5c:59a5? ([2601:644:8502:9460:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db49922e3bsm5282283a12.51.2024.09.16.23.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 23:28:27 -0700 (PDT)
Message-ID: <994f9631-f836-47de-a275-5c20183b84e5@gmail.com>
Date: Mon, 16 Sep 2024 23:28:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney
 <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
 <20240911-tzmem-null-ptr-v2-2-7c61b1a1b463@linaro.org>
 <ZuhgV1vicIFzPGI-@linaro.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <ZuhgV1vicIFzPGI-@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Actually, taking only the first patch in this series should be enough to
> fix the crash Rudraksha reported. None of the older platforms should
> ever reach into this if statement. I think the rough story is:

Yep, just tested this right now, and the first patch alone seems to do 
the trick!



