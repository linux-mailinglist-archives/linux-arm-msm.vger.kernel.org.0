Return-Path: <linux-arm-msm+bounces-13377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6706872931
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 22:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E0D1C230C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 21:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83E312BF10;
	Tue,  5 Mar 2024 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KbjAvy4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B6F13FFC
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Mar 2024 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709673190; cv=none; b=OYiBvV+ymD9pGU8IGN0G0SBbd+61MYCCDgu4d0DcOXEWtsmyKuCWMuKPQ+RqWMS2N8GEc4vRWLVa3E+RQWWjkP+zX3vxSPidGBXzl70PmSUiHM5hc15PIFGuJ/O1sz9cSepIm7bED8dX7Axrx/rOBR925R26Q1sF8mgLxUtOUws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709673190; c=relaxed/simple;
	bh=VTMMbyrcvI+F+Evq96GW/sG5ISuI42GOiONenrVP+Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orolIq0uY+kCBL38TRiRoTpZnV268ElWcGFnSMU5JQ9XGfiFYtbYUynM3yk3z/CuiYywrsjhchn8Ga/y8arRXGCZP6d6s980LL7wy4o5iGtvbXp4hwdootGlkiD5ocTTDuYWZzD0eAEiD5KzrxKp1pvC8H+dHU8sM7l2wqyxMkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KbjAvy4P; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d23114b19dso77974201fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 13:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709673184; x=1710277984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTMMbyrcvI+F+Evq96GW/sG5ISuI42GOiONenrVP+Ks=;
        b=KbjAvy4Po+pIluYif+oda4vYMlxUvo/d4Mc36vWHEHArXltjHsjM10rwB9rBAp7epw
         kD5Z4y39IreYmDGa9faCK/TmsGE9JG3VZYGRBoKpRN3ibUj/niDmYN9G0Ni4D+ipeOc1
         99eRb7qutWA5F5NdmIM7FVMqUDKOEs7MykW+KcpZGcXWTPi7jLT2NVNDAH4EYfllHh9P
         4TdSNDYJGLiGs2GUfbM/hhYmaVjD2shiVa8emDdMyxnuD8puJEN2l/ncAGEtZ3aqrnbc
         sNdOgaQ0z3N6yCWVXKMWlVV6vHkvOlgunlts0LjnQgK5Kv/dJMSw1osqALpcDxzmsUk/
         guaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709673184; x=1710277984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTMMbyrcvI+F+Evq96GW/sG5ISuI42GOiONenrVP+Ks=;
        b=JtL6iaLt2moMQ1dMKx1TFNwBjXq0xVd1EISwN5n10rIZXq7rpEys4GGTKEqiQFrQGQ
         Z8JnZ8bcQqGSAZuFc1cEY168wL4bUmkihg9O3eOxqgNotFxpyR4YwnKdqIMH+Io0W2bX
         dk8xHTYVRLaAqR3yiFcAo4eZBwzS80g3fq8sSeVgl62jKKGwUhYMSA8YgwHiheK9w2k3
         22cC/bqy+44z7dcrvk/e7qv9Le5Uyns0LIFsYj06pSm/B52nwCoatZNPBQTeaezOo5z/
         1XWVQUzXwNt/uNs0u6nNDgqULh/aXu/BYSnf/Je5U61d9Uk8SKebgUch1dVrl2cvHlpa
         Xcbg==
X-Gm-Message-State: AOJu0YzMuJvLrFy9A5fXUKUSt1huAqUPT92TVMJWVRNatnI/t9LFjhYm
	AaMylJjbkBmLdhTNlAufydM3wYQAFWIITeWoOnkMau6FZlaQiDM7Sapsi9WaufA=
X-Google-Smtp-Source: AGHT+IGhr3H89eAiGCZFxlWZ1xd3orw0ynsw+qKg5c6ljlYP8y+s047TPLiGz06OdZZ7jNO3UdljBg==
X-Received: by 2002:a2e:9b58:0:b0:2d3:6ff0:31b8 with SMTP id o24-20020a2e9b58000000b002d36ff031b8mr2394750ljj.19.1709673184307;
        Tue, 05 Mar 2024 13:13:04 -0800 (PST)
Received: from [172.30.204.154] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i8-20020a2e8088000000b002d102538128sm2292039ljg.131.2024.03.05.13.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:13:03 -0800 (PST)
Message-ID: <ce34caf9-d96e-4cf8-8e26-a5dd84cf71f8@linaro.org>
Date: Tue, 5 Mar 2024 22:13:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware: qcom-scm: Remove
 QCOM_SMC_WAITQ_FLAG_WAKE_ALL
Content-Language: en-US
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Prasad Sodagudi <quic_psdoagud@quicinc.com>,
 Murali Nalajala <quic_mnalajal@quicinc.com>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
References: <20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com>
 <20240228-multi_waitq-v1-3-ccb096419af0@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240228-multi_waitq-v1-3-ccb096419af0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/28/24 19:50, Unnathi Chalicheemala wrote:
> This will not be supported by current firmware due to firmware
> limitations, so remove it.

"will not be" - but is it today? Has it ever been? Will it ever be?

Remember, you're changing code that needs to keep working on all
platforms from APQ8064 to X1E80100.. If that's only a change on
SM8650 or so, this isn't a valid argument.

Konrad

