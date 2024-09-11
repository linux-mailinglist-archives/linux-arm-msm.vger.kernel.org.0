Return-Path: <linux-arm-msm+bounces-31531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D889759DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 20:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B3A21C22FC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 18:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418F233997;
	Wed, 11 Sep 2024 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csCyTeVJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC421B815;
	Wed, 11 Sep 2024 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077681; cv=none; b=opdpH/O0bn405XnsJoX1Q7xkZqV06oLGB6zML/4vZFvBPXk8VPJ8ihdcz+azqN3awubb+ryYCBnFCEsAmpL7CeaIroAdkhdWdb/pQeOjRFrNvJdHXR4vWynUqs2AoZnvPbqXGT+Xwjjy+gQvKNZph9mxxR43ZKA7uXe/8v9iMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077681; c=relaxed/simple;
	bh=PgRsx6Uwt5h275yzSb8/FZd5WJLFOVnsq6EOuNZBvBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDvViGWYlP7PoC6WFVCYou62/XpQZ4zee4nO5FXppH0OitSgU6esQiJwlsvY1lpxMwwOzH0vG088Dl2XanP4BQjGnu1h7cvoriWgAar0lbD0I32RUNXlLAhlCj+2XJC+8CVHFtt6w8oszvctEzOT1DqrZFg9j0XC7YrsXwap+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csCyTeVJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d87176316eso925838a91.0;
        Wed, 11 Sep 2024 11:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726077679; x=1726682479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PgRsx6Uwt5h275yzSb8/FZd5WJLFOVnsq6EOuNZBvBc=;
        b=csCyTeVJ7W3kqBSygcL4OYRbjbWC5IPyF10KlaEAuR9lADkNFNQQN/Z5IUWluJbBBo
         TTM7UsHsgNt2yBmHG9WFzh81Z1ZcTjd7haQWTBXay4nCPGqgRb3ys70CyAmCk3lRINoh
         vve8ZJrS0O9bSWryqywxdpLUo3yNUgGgDghfE5jlzFqrCn1INhSyd2cFUBmyfpKaEHis
         sBgcvmYv8awHmvefb18n46c2DdVJcT47nABwoGfK5N9XVPG7l0h6hmtFVFevNU4ZbK4+
         uwgnHp3b3oiv7kJs2I/88LXUhXue7bpVxrQT8+MDJDpiRu2Lc0PleXoN0mnHaHa4wQ7k
         WGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726077679; x=1726682479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRsx6Uwt5h275yzSb8/FZd5WJLFOVnsq6EOuNZBvBc=;
        b=lu79a6nvurqYAv3oYq+2GyMd4yjMprz3PxVaCQzVcrJHFPzfkATbBaDHioavaqJLbI
         b5e1j39JPf/yJQd4bc/sddYJAYAObCoXVX7M3aRMZ9EAYHkVkRpLIonNjwoJDFhun9pr
         NrjrtyPZkBTiTwy6SeuVwYa0Qq+B9A4veFQ2Pd+nfDlQwWrlTtkTvlF8a2d8fr20GE7i
         UHo4+caSiC/F2+JDXPqAJ9n8bjfDrBg8uiC5XxIC4AWdIRfCeWsjUxl4zkeq5x1N0/Fw
         Ojsgyk0gstP11Iy8giu4+5S3YEl3O+ttlfcPZuUaV3Ah1UF44cbSY8DZVvxadCvFuMGg
         OBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvzrnhCStPJJVkYlPlmFSkvQDPapWMEfX8PcvwO6SfGrv+5s6Fw4hQJKvfXnfcV7IBu3tpJQgsclsSqTCB@vger.kernel.org, AJvYcCWQUqSRDvfLylrYIajF3jWbXixN3GZ6MqEuLm91q5uxMgiO4y9CQDc/6DsbVeTXjKjVMuKMElYZaoTbnJnN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Ofgupjom+kNzHpWacBjlbqQCmcJPZbicEylu/dsfen733pJg
	MuY2Jq+1a699eUkhcGp/OvHldDi0cnZIx3xDd6Dy6vu7Jyxwgtj1
X-Google-Smtp-Source: AGHT+IFJCmNKVCfhr3nWS97aq01yxI0F6VcZrCEo9qiA6Onska31rD2XOFimj6Vrk39sRmcvWUMpBw==
X-Received: by 2002:a17:90b:906:b0:2da:82d4:c63c with SMTP id 98e67ed59e1d1-2db6717819bmr11123575a91.4.1726077678971;
        Wed, 11 Sep 2024 11:01:18 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:864b:f5ff:fe5c:59a5? ([2601:644:8502:9460:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db049703a0sm8704727a91.42.2024.09.11.11.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 11:01:18 -0700 (PDT)
Message-ID: <8d9fde52-2582-499f-a971-e9aa46b23fa2@gmail.com>
Date: Wed, 11 Sep 2024 11:01:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney
 <ahalaney@redhat.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
 <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
 <CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com>
 <CAMRc=MefTjz=h6jzE5vE-yaHnyM601Ts8XYZqEYnOsidfQEavA@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CAMRc=MefTjz=h6jzE5vE-yaHnyM601Ts8XYZqEYnOsidfQEavA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> I'm wondering about how to approach an eventual refactoring and I'm
> thinking that for platforms that are known to have DTs out there
> without the node, we could exceptionally instantiate the SCM device
> when the module is loaded? And then modify the driver to require the
> provider to have an actual struct device attached.


I'm happy to help test these changes if you'd like!


