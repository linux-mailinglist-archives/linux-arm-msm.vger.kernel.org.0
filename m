Return-Path: <linux-arm-msm+bounces-71868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E2B421CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C3B16CF63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1583090FA;
	Wed,  3 Sep 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zK1y7ofR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A38308F0E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906322; cv=none; b=i48C7dsUeb/sZl0BwUCN4ak/6G+v0w4cP5q3mzrOtZPYi7LpwNVKWSdt61J6GH+rGHK7wrZIQF+SUcsb86KhSrvcpDzNJEdRt4QDXC7GmAYO7c+BVLl8V8oqGhStes7NBXXh3b6hhYfxAygQOHt1VaKAsnmrmCx4LsiEaDV7GT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906322; c=relaxed/simple;
	bh=HMyrqafZWVvnCp8l3xl9EjMdbJHyX9qnKtyEFsPn8dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=krBDDfeCUYkNyH0dihPJ8PCLL2XipzpmLeIFcaA5ZSEPeTVIj8nSuVnlTCL6vQe/cDCdHX84J6xhhpbAz7nl8tBhp0vIfJSu30J9XjHhIEWkyF2aEPPA/5FeUaKjSZUH6K6FO4g0By6atR3cKZEGr4u+c/h20nEVPW0f6fnIiSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zK1y7ofR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so3856685e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756906319; x=1757511119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jV/+kNQU+fID5A7W7F8ncUimxdPkwRhQZObi8KDWFN4=;
        b=zK1y7ofRkabpTVTCK72t1pu/W63oE1k9cWiQ7iCp8g6fJ56OmbzmKaB+VGNKqm+k74
         RstJas+QJu2w5nvLmF4MwLl0M/Q8ETcXt5DSXHJlcW4W03dhGsfoD6IXKgqZlFKhWY3q
         9TIyKEBiFY2RcJ+cyPlpUKB65IimGqbZ0ejuUyM9VKd03F5oY69T623wErhxaflnw48V
         7EXfQNnsDwkd0uTwHR+4MV/NCMoctN5+HfVYyFcq8nd2AfPhs+IX5A3yCEt0AR6hhWuo
         +tuf/SgYnGUzpfUKlDUTC7NmZUD9xSS3co5ihP6W2kj5CmIEknNA1owGStToRsNoVs0Z
         8Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906319; x=1757511119;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jV/+kNQU+fID5A7W7F8ncUimxdPkwRhQZObi8KDWFN4=;
        b=hZOJqob4TsjKEg6eE52MAn0AVLa4uWFH/L9KDbZZFGk0Bu7HE10aOhWiHrUwdsqzV+
         c4X5UOxhaQXGHL8jj8cQoPUfDJECSBIN2bD3lICND4pdCLTY5JHHXF4U00hYVBwNXTOv
         xiWle1BHhbJ0BfQwAYo+8bVXfx/ElUFE3ZmrHg/vthkCnc7zh8huo3rxmCiqTub3SmP0
         R562Qv52lMDyO40YeJykLxuYrohpHCgQWgq6I+kcnzNizHdPpWwk1yeOVN8fy5flYQGi
         TH6HSU4H7hVivpyYFCILi2FqgDiPgd4kktR/HO6SqPHEZc7F6+5FFU7k4yfs2wqCZeoq
         CR5A==
X-Forwarded-Encrypted: i=1; AJvYcCX0KjkAgvM+a97J1zwGbQpZhZB5qmZ29lAsT6N2cnmuwSJ5qqVCFTiOxRhsmE2yrf81/cbRQNN9avneuqr+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NH9bmlUEsWjHp7O5OPqitraTItJSH9YiuXUuCVLPTi4TBrxf
	AngdVTTtAEmbNmHbRLYTN+Vwr0KYMDvKfU/CCWMf+Fq4F2WwDFrbWUHtZ3LjqWed9IY=
X-Gm-Gg: ASbGncvKenGeu77ebdpoPvMCpP9Vj5AGZ7fB6yRY2Y2A8dZQCZrpmiRGQNYPqa0oxLU
	M4XSyxTB59nsYubMymi0ST2WzG7NEJdE5jV+1lhr7QWsPu1n2J//C2Cx9wIAKWkYbSAvV+7dCsL
	pvu5Kbn3HI5P3p29yK/FACDR5LR+NdpsCuIV4rBCV6dIQJFwsYcBCskTypppg4f0PhuLEJWXw9n
	/JbNmrcZTDtk7/HzTbmpgPkdhTRbHKY/J23VJi7IW+KJmudxOjAun4sm4bl6gRBrhZGqCFiFcDm
	h2vgN2G40R8cDTqGj6mUfTI6knfvfqsXAIltx4qadry77qexMvHxo1mEwygwJZ8g03Ti9Y3FjQR
	9Io3GwOP1RQv6QfBlHMOLDpdXfgMPb75L0xgzOvTPKNfYUY0oLxc8L5j00fLoiO9On5dHmeYMWX
	zxIRKxBedAuBPKv2Mj6s7+W28oUGAV5tjKm4mAfdgI
X-Google-Smtp-Source: AGHT+IHgsBA9rledeTVeo8KQley7QFRDXyCYgnqMKEv7MzsQIBH95kbaAiwwLJ8XXVf/C9Q9lEUUqQ==
X-Received: by 2002:a05:600c:46c8:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-45b85532ec8mr134876395e9.9.1756906318707;
        Wed, 03 Sep 2025 06:31:58 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c22sm327450385e9.13.2025.09.03.06.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:31:58 -0700 (PDT)
Message-ID: <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
Date: Wed, 3 Sep 2025 14:31:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 12:56, Konrad Dybcio wrote:
>> Can you try with this next-20250814 tag ?
> You sent it on the 19th, so it's in your best interest to run a quick
> 
> git rebase --onto linux-next/master $(git describe --abbrev=0)
> 
> and giving the series a prompt re-test before sending, because there might have
> been incompatible changes, whether ones that would prevent applying, or break
> things functionally

I can't even find that tag next-20250814 closets thing is

| * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge 
tag 'drm-xe-fixes-2025-08-14' of 
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (3 weeks ago)

but patch #9 in this series stubbornly won't apply to any SHA I've tried.

meh

---
bod

