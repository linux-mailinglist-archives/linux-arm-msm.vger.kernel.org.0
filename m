Return-Path: <linux-arm-msm+bounces-36408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9C9B60B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512EE280C80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0933C1E3DFF;
	Wed, 30 Oct 2024 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZbyrycx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A21E3794
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285952; cv=none; b=mGZfWuyMRqRKWgB3JMSGQhEzGdbPOjJFeM0yg2Mk/xoauTPoJNIa/97s+NBobO6LDXR/3OE/oFlGXdnefkp2juZQaJidLoOXYGXy09lX4WUBsM+IWKDFksZ9lR/ycmGwxEeXKYn3gmTD5cCd/2Z7VED4fS+tZd99ilvAUaZ1cgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285952; c=relaxed/simple;
	bh=yISra3eQ0Uq/4KOKYkKsgcWsSGdWi0wLO3WcSkPRDDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKaFyOkEMBtsB0Av3Vg9kD85V8EX+nB4zkMbVcVDiaROj5vMhIvzxysmJeEKd1DeeK9uG3fZBMcJZku0wATYd3byJbgkRHlNwZeKkYevo6lkadxnhJ3eAy9MJnZ6GDEUvPFrR+eD+l0DyBaqPXFeYOsw+nc2JgHRTnSJyLxcVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZbyrycx; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb4ba73464so3266741fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730285949; x=1730890749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPnNsKaNDeGMkfcbV8IORnR5Plf4Y4vAh/TGmSPDzxE=;
        b=UZbyrycxtMXDi7kQLC06BxTzfo1WOQ8trLY0KUH3g0G1iuaqRSnUA1/iRyQ+n990t3
         kpt/2e11x8tXFUzsJbMR7hrv7YvqZSea6xB4/fQcLvSRwETmqdvzkY86yEteyJ+Dafyx
         q3M9JJoCR9aJ5I1PzhzH3L9VGKs/oqaxgwY/nMceVnLSdbud+2HGsdHA4M1IpAAp/NJN
         RWms+uU4yw/GMzTLtEGKCY8kQsygo7QeFjRtIdnLleKna/s3W5CRw0inUMK7CsPeiXjJ
         LRmq/C/jhOOzo1quhy4Niuj+mSQLWSwXo/inJR4AECmIdlyGvwwC2KSqYtkvPFCDzK1r
         Npsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730285949; x=1730890749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPnNsKaNDeGMkfcbV8IORnR5Plf4Y4vAh/TGmSPDzxE=;
        b=tMBQrhcYwa4YoGwESvLQ+BTYBy5Xb4ZsgLV1CAmy6LdwymfYeNsMmq4KirCVu3Sm6T
         yKtY+PETrJhEA30zA941hfM9TR38kj7V+VAxrRpNvjPwDas2//YBovlHRyahqkJlJFse
         XRagAN8WYH44++XfhRl64tq7Kod517uhlfhCpBQNOA0QYRGE0G1BdddntnbconcMHE8E
         ROTd/HoPcK2B/2RkywIJ+NizJGf0F0k99bpwW8SZ9ss1gTrKV+mUPqnjMJtQq4E6O3Wz
         /iEp/f+G1LWxn59gNHh9OdCC7gduNGy/LW5NDPkRvWeuvaKLTQx0gNDRLnMwCntrVxdr
         ADkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSXfGEF3nuGZV3TA7dMHb5x1SghL9Rgz/o9fYWMyGxKDYKU1OtX8ie4Y+3QnXat6+HzPX6h9BYfylKnZN/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/TxxHz7NpGkl95jXX1niak/hKiaZBzb6JjeVp7Mc2ocHfciQx
	+kC+9HWEkKaNRpCGWStF3gP366vqsUNS91j1x04fYiW+V+bxetepY/LRznwSF4U=
X-Google-Smtp-Source: AGHT+IEUHoRtAg6RXu/1SaI3qAVEWXyo+oVcRoX0IxbJYU9h1wx3kI3+sMs5ZATdfSYUwjgPBxVf4Q==
X-Received: by 2002:a2e:a586:0:b0:2fc:ae45:3137 with SMTP id 38308e7fff4ca-2fcbe0750b9mr22501421fa.11.1730285948849;
        Wed, 30 Oct 2024 03:59:08 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d6fceesm215634e87.281.2024.10.30.03.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 03:59:07 -0700 (PDT)
Message-ID: <f5d24079-58e4-4ca2-a910-4e4b3feb04f7@linaro.org>
Date: Wed, 30 Oct 2024 12:59:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
 <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/24 15:20, Krzysztof Kozlowski wrote:
> On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
>> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
>> QCS8300 has few additional clocks and minor differences. Hence, reuse
>> SA8775P gpucc bindings and add additional clocks required for QCS8300.
> 
> IIUC, these clocks are not valid for SA8775p. How do we deal with such
> cases for other Qualcomm SoCs?
> 

It always possible to add a new platform specific header file and
include the old one.

For reference see commit a6a61b9701d1 ("dt-bindings: clock: qcom: Add
SM8650 video clock controller"), I believe that's the preferred way
of adding new platform clocks whenever technically possible.

--
Best wishes,
Vladimir

