Return-Path: <linux-arm-msm+bounces-7507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEAE830D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EA421F2620F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 19:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB3A24A19;
	Wed, 17 Jan 2024 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlwTFxa1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081D22562F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 19:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705521191; cv=none; b=J16c2/l+hSyd5dRUukT7gLZyx493ZBn1fyx6q05oM8tBB2k784X/94FBGVZJ7YYJbENRzBq21DHhDecUl2h3E6u3EkwsNj1plXYkrB0+RlG31EKHHZJ7hFs7MVwKIg0vmrL7B9em4rWSA4fGjVWWU9KahmvdSRnyPd6devOAUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705521191; c=relaxed/simple;
	bh=72BXa3ZPIvfwifjasuIJd6GMJgCyzAgDKLK46N4+lNo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=BPeGJdZZHMo1sMlISAUP5jTlXqWWONy794IL05Sn9CNhm6Xn6wUVuQxyRn+xBc2D2wObfLMfumC7bUE4LbmkO/sv9bCJ5g9OyudemCdl+hJOxkZahTJ9HfO3Kh61nMi8WXsYQ5N6NCuaFk+hJ6IXR78gPO8DCO6GSyUIfQHsTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VlwTFxa1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so13881038e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 11:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705521187; x=1706125987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wm6DgYvqeoRUoLSmR1T0PQYUUXuQvfXV0BJlW+D/OzU=;
        b=VlwTFxa1/5plN/+HIzMYZULkK+6HrCKzJry9DuJrHZTaBdH4fTv3TFI+68EyofF4Qw
         PH2YMH01IcmmKJbDKlyDPwPqsTfEteiQk8ysV442y7ts5RXF59Gj8PTqS1UTzMBTDScl
         5qMFTu7s15+h49v2a1AK4k4/Oh/TAgRH/44JA5iBe2jxTHP3SSdsCE/WjUz93lXVr4BQ
         nSMpaFkaiDaTBcn8zPPMcQH1HAzLjv0uiY6wL2062BPLm4TLYwrvbteMme1Z3ggKtik9
         NSTid1toO/oZxKFVBmiu9lVGhoghNFMfZEbys9D4Nlak0YTps79yNY5EJF6pJNH66IP5
         h03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705521187; x=1706125987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm6DgYvqeoRUoLSmR1T0PQYUUXuQvfXV0BJlW+D/OzU=;
        b=XbtjjfnkYPDzompoO85n0nnCu3MDsHTIZeMmOyxM3O+iMuLaSOTNrX71YKXZPKdSmL
         0RSdTz1017NFfKGjpITqEUysCdWm+Bf30G0Ew+pXcPe6PoK1gl7fiSRgVYRbtUbRZHKy
         bqOki6HrjTAkE+pDi41stVqkImhQBUZTjbXSbQRMfJK5T/qLBJvbkFZTlvcE8SY0fwIN
         +o4cV0GXbNcvlxciUjNxnOQniCfDVkJFYyq2Kj4vr/pj/HYJ6jKLDsPRj4NbdK0mlTX6
         FIT6LLm9m8ihD5KEhenMlP3kIFUUich8PJnmVvq0EY9S5I8ctLul6sZbuj4anbE0QIEO
         URcg==
X-Gm-Message-State: AOJu0YzG1WmOwnjgkRAtXnFCJnmWe+7Oubu2U7rljp2r+KVrRVEgxG1u
	8ekKCG8AyUG6NWHbkWP1UW4A9Cs9MtMi3Q==
X-Google-Smtp-Source: AGHT+IF3Y61AIRWeQ8u2Yp7ml5wNPwagyN8nac9JTwoZW0SXn7RisuuBO0czehYfhYEvs/1ZgROsZw==
X-Received: by 2002:a05:6512:b90:b0:50e:f1e1:6127 with SMTP id b16-20020a0565120b9000b0050ef1e16127mr3641304lfv.58.1705521186890;
        Wed, 17 Jan 2024 11:53:06 -0800 (PST)
Received: from [172.30.204.151] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b0050eb2325472sm352946lfe.37.2024.01.17.11.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 11:53:06 -0800 (PST)
Message-ID: <7bf729a4-f3ac-4751-9275-a2aa4d62c036@linaro.org>
Date: Wed, 17 Jan 2024 20:53:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/7] dt-bindings: mailbox: qcom: Add CPUCP mailbox
 controller bindings
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org
References: <20240117173458.2312669-1-quic_sibis@quicinc.com>
 <20240117173458.2312669-2-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117173458.2312669-2-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 18:34, Sibi Sankar wrote:
> Add devicetree binding for CPUSS Control Processor (CPUCP) mailbox
> controller.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

[...]

> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mailbox@17430000 {
> +        compatible = "qcom,x1e80100-cpucp-mbox", "qcom,cpucp-mbox";
> +        reg = <0x17430000 0x10000>, <0x18830000 0x300>;

These reg spaces are quite far apart.. On 7280-8550, a similar
mailbox exists, although it's dubbed RIMPS-mbox instead. In
that case, I separated the mbox into tx (via
qcom-apcs-ipc-mailbox.c) and rx (with a simple driver). Still
haven't pushed or posted that anywhere, I'd need to access
another machine..

On (some of) these SoCs, one of the channels (rx[1], iirc?) clearly
bleeds into the CPUFREQ_HW/OSM register region, which gives an
impression of misrepresenting the hardware. X1E doesn't have a
node for cpufreq_hw defined, so I can't tell whether it's also the
case here.

Konrad

