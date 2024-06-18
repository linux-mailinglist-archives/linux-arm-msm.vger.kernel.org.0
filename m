Return-Path: <linux-arm-msm+bounces-22996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D16B90CA18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6AD81F2179E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD7819E805;
	Tue, 18 Jun 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rz8/JDQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AE19E7DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709116; cv=none; b=mV2Ar7fjXuUzuAGwebfd1fS1KMC27koFHK6XdrVX41w2qZ3wDUFP0+0b2M8VshheQqK9o8peqr0raSkX8gcK4E6Oi9I1or1nzzVzEr2bwnfRfRAoTzX2gGgzevkHvV6TZ6SVetK5W2dPk20H5fRtp4NKkiek8VteJXImkr6TWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709116; c=relaxed/simple;
	bh=4qr0Jwp+ToD1+DqxjeSolQYckZ2iWNyyhdqCVAQ4LF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rs33nH+Bdvhz0kYD1coAeWqRvlPD5ZaCBUAb56F6s/6G3fzLbtDOqLQVGD9y2pqH7jSzRJzv0SL9Y+f19AF9vFDRQFz9XxcfFFZkMVSmjq+knmIhCCjFOSjbTB90QgCMMpKYEMCpf805xjTYc4EKLEgTFMPafuZDHMLhB0wjsdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rz8/JDQy; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5295eb47b48so6296672e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709113; x=1719313913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCJ1koSXaUSbG2q6a2DQFAstliIPSMU/Xsi5Jpzojx4=;
        b=Rz8/JDQyGsRKs5Jt+StFVWOyemVtLfb/emszqS3ebB3z3PMI6dJN5/lmLeEyeU3pZM
         EMuJsRFXOzh4NDzjIbOG0m3rUKaifdK0Cgtq2NC1VLsZrhIRJ+t6slAASlEnbd0AluMk
         4D2TPZ1wmaRUqiqaXWYALR99ndkcvZE8+y9fmvC3CasVHAh/4C2DSe/C7MYDkZ4o7RQf
         0r5+SmNm9WKT8uuzLEbQEINAmZhqN7KOHgXABWJvjAOLgbirxFb5yV2V39lOR4fsgn84
         K8Xof5/BbKLPQV6MSMGfRnvTfqWnVi4YniSeU40ciPD2Kcjx241DMxtKzLMxj9/FeR7H
         mjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709113; x=1719313913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCJ1koSXaUSbG2q6a2DQFAstliIPSMU/Xsi5Jpzojx4=;
        b=FiMV1DrVIC2UdmT3C7C//hmDkExLmi6ViOQe7lht6bnOKYo8AE86392YENNDqSVWVw
         vKFxZ/A/lRnoGu9Lpm48CB5Y53SGy5OJa40oZDShFrcaW4/UluPc2448R9/uFkQqYUOV
         1qo4MtdXGSzDOl+1L42EAQbASHUQKcbxJa6PlokKTvRkshl/JdsDwkUIhQE7kmkMQBBA
         1+XvyKzMpl/3/HaN7u+tx9TM8/e0mGDfvkPTbpbJrdzMFJfWirSveYdwG5SUEVlg6b43
         ZQOQOKr2rK2YOzKLFhYa3uSUo0GJZuiq7zIsDCxPBqqKSHwWcNjICOSngSq3c8nINfNk
         txgw==
X-Gm-Message-State: AOJu0Ywk5cbuWQNGCa6YN0bAGKT7R+tUYiNSSu/xbuVJnlolRDOlcdgf
	re4IMkIAzu9FUSKG35+/HecRzfO/v2Ekc1TWLXRXj/rUbKK3OUyTEJdoFi0GiqA=
X-Google-Smtp-Source: AGHT+IG4NDeCUql9vT+yjYQb6VBnlvabxwjfMz1iCQArGCJOw0YSMVEKgJePGYR0dmojAmuJWyu8kQ==
X-Received: by 2002:ac2:490e:0:b0:52c:9413:d02f with SMTP id 2adb3069b0e04-52ca6e659e9mr8585345e87.17.1718709113180;
        Tue, 18 Jun 2024 04:11:53 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f2ddsm1467138e87.87.2024.06.18.04.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:11:52 -0700 (PDT)
Message-ID: <948d34a9-ff11-4ec0-ab6f-05e87533caa8@linaro.org>
Date: Tue, 18 Jun 2024 13:11:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/msm/adreno: Move hwcg regs to a6xx hw catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-4-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the hwcg tables into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

