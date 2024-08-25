Return-Path: <linux-arm-msm+bounces-29448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB36295E241
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Aug 2024 08:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FF97B215B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Aug 2024 06:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4DD39FCE;
	Sun, 25 Aug 2024 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4q8zcc7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911EC4685;
	Sun, 25 Aug 2024 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724568702; cv=none; b=bu1oznKM8iZl6LtVfm8iI7aepRrak+iE2Z9ko0JcH+CHeumXiQzceCgAsCotOGZYOZKama+Zuaehf0ZUMwVEvCbTDB2yZm0M+OX2rIu4d5Tm3DVbOFptx2Z80QVhb9KWB0etoKVDa0Si0w0KMdrGq+1jHnJo+GYCvdrLSPDdnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724568702; c=relaxed/simple;
	bh=76IiGlrdR7+alw6d/fG63eW5fE1gTgfxIrHK5c2mJhw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=eOs8qSZVFWKSWFRirkDeWVPorfd1tmSiDSmd3BuTD12KMDmuYN5e/ZoBgQJ0TGBuyPtQmiiUGBsYoCG2tJB1lu3+wSdnO5Gzr1NAXgnPWEH3rM0EoB+P44MCwSHrfDop1qQ/ozDyM1bQlahKQILRAzjce6HNkcDAvV/XVo7r6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4q8zcc7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so2749606b3a.3;
        Sat, 24 Aug 2024 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724568701; x=1725173501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsAWZ8ohbVezF1hXTkNDEHJtwCRn+3NNEFxo7nThb+g=;
        b=j4q8zcc7Jh6LIu4UYyU1EQJafUPVCK3ZcDEm7wlEGzFI7d6/lpMuo0S4IPecKCPOiL
         AmYvcdeItpi0lDY9ZGS0iSkUGvo+fDY1Y+17DDDKq5Cxoz4ZLq7eLfTP2t+rSkcsEBoX
         ps1bUSnxrRsLR2LqQrzkiEwtn4xdUbPGsv4vRe80cREv1stoQ6NXP3fd9m0k4kD8mCoj
         wq4S10eRapSu5L4XiMD2U6trot/aFNuRNY/KTQOABRG+FiI4JYEEIJyvGZr93KByDY0V
         cb17cHrEk1e5BGZKU6upfMP9R7+eLC6uBS+ffPmFE8PwVuLHMH+XvoWUTc5nef3oKBRj
         rpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724568701; x=1725173501;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DsAWZ8ohbVezF1hXTkNDEHJtwCRn+3NNEFxo7nThb+g=;
        b=HPooc2W+ByuQMNihDpHAo2fqsc8hRpeYGPgddQykDWG5N1sPpDvRBPXKhtcwEWuTU0
         lVpy9qTKonewkJnwH4r7s4lYNk9RKboV8OUFIwiok5ile4Cec59G13JOKS6B2pjQPpkS
         eGB/dgLkY5MG27UpVmGxBAYnJkh4NsL9WxqSsp5bcQ17v+8/FuCiJd76LjA2auL/CrR6
         r9LAoMqrvoicngPRpRnh+XLztD3hIHE5iFhamUUAd9nFqWX883wScEX7Jr/hwZSH5eT4
         t9gFSGZSPqGrLI9ZXndVG5dXrk/2d5RDN8Zs0Ny/fuDGJpydQV5y013PAJbQTv3c9icU
         k3uw==
X-Forwarded-Encrypted: i=1; AJvYcCWg7U06uDxN+Qr9bzKqVzKBDKbMw9G//v9/ENTBdJi0Hf8YB46r7L60gYvjmwEYS3sYIbZcfO3UlDme4LqyJg==@vger.kernel.org, AJvYcCX2Zt6VjnzIQzOnFxjJbIo9aJzA+Om76yAvIqJrle7QCB8xhfn0cmSJln3ohaWx7fC0sPROQ7vcvzFP@vger.kernel.org, AJvYcCXz86aNDlEpsji76wBftJcCqFxc/nPib2ULK3WNXxm65dNjeA1HqRI3/3URYapVPg/m2jnnUz5piOPbpgIg@vger.kernel.org
X-Gm-Message-State: AOJu0YwV7gg4hcyZOXdr+FPUKp5sHGpao1RkX8J6MbCWIh9H+o65xRWs
	hIjIYIwsLWvezHAKj6+Zb/o5DCQ/hQuePmqS9HCGwcsABfN/dwwe
X-Google-Smtp-Source: AGHT+IFDhQ8clx67UthEox0fdtuJRVKZOQKZOoSpw8jMLDReoB9yFRh3mKSyO2s183CZavpoEW55mQ==
X-Received: by 2002:a05:6a21:9211:b0:1c3:a411:dc45 with SMTP id adf61e73a8af0-1cc89ee5899mr8302200637.39.1724568700464;
        Sat, 24 Aug 2024 23:51:40 -0700 (PDT)
Received: from ?IPV6:2601:644:8501:8a10:864b:f5ff:fe5c:59a5? ([2601:644:8501:8a10:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556653csm50447095ad.16.2024.08.24.23.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 23:51:40 -0700 (PDT)
Message-ID: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
Date: Sat, 24 Aug 2024 23:51:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
To: regressions@lists.linux.dev
Cc: brgl@bgdev.pl, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robimarko@gmail.com, quic_gurus@quicinc.com, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 srinivas.kandagatla@linaro.org, arnd@arndb.de, quic_eberman@quicinc.com,
 elder@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,


Found a regression with a platform that has the msm8960 SoC. Was hoping 
to code up a fix myself, but I'm not adept in ARM architecture or the 
Linux kernel, so I'm just reporting it here. Reverting this commit seems 
to fix it as well. Please let me know if there is anything else I should 
provide for this regression report.

#regzbot introduced 449d0d84bcd8246b508d07995326d13c54488b8c

Error: https://pastebin.com/SDRENUGk

Defconfig: https://pastebin.com/CRDjC39a

Platform: 
https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)


Thanks,
Rudraksha


