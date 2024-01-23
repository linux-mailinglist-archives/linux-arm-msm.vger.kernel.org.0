Return-Path: <linux-arm-msm+bounces-8007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70983973F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5B6B1F2B8B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C845C8121F;
	Tue, 23 Jan 2024 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gaYN2Jjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9EF7FBB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706033248; cv=none; b=A6gB1yFssoVt59Qgc3weJTAUcpcIn3ra4GHzwigg/evrBnQIL2+DPfS+MxC7h/Gma3fTgnXd84+GShUSUklpWjcBA4Vn3Gw2MebsosdjgMN6ZMRWqwA5wdI7gLCLi6luKRZnwvOJ3IXq4sdkw2fGLePiKvHLNMZuwaQ9KJna2zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706033248; c=relaxed/simple;
	bh=WmmUAs9dYg2tpGBQSm4FkkZZKJGkqPcMjMmbgfDTdTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPZQrh07zG9n5caWtHvlzfrt8nFEMhRSQC/+kiXhRqHzS/798U5FbMlsrP6HwVihFMR4FqJQvyo4VZg5pQn84Q1oYvBDWAgqYwOdJtUwAWFWRerCXCysaVyhXLZXYc+DFsrYOueo7rG2fKQwfteqGPkg4G8eY6Zyyx9w6G+vS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gaYN2Jjs; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e766937ddso5450131e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706033244; x=1706638044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pb+zq/lFi+My3SWtUJKw70vr/q64D82KHMmsj5HP3k=;
        b=gaYN2JjsunK1kPkh/0hy4VmLfROJ9RiDZqz+HD9BGQEQotrxj2tY/XvT0ZlcrTmKzG
         WgPf0IQ5TuiAfbevSfsUquDb9AqqRcFN4cuAwmRYaBGPB0W6VBknPirl0esArbMl/brj
         w3m5rrlDOud8T3DSHbpVw7uXF/VHgn6Q4Nfb+Rblkyxbfcpi387zFYR+9f1ww/80UaKK
         gTpp5chQMZg/QnL88sP0M6HPpqBnnV+a03t/1cwwGppv+Uimg9Kq4wXtjgCG+/SoSeAR
         71WhiTIxq5TfyvorWXftiX+nEKkXII4VPkf29n1FGElOLzYOcPV1NMwBtmQi/+0rJBdw
         MSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706033244; x=1706638044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Pb+zq/lFi+My3SWtUJKw70vr/q64D82KHMmsj5HP3k=;
        b=iK0zucQ86/vTFkaZ4rl7mfgPKXz4K2Vo2m9i993GJBKfk2cHhYnc9sMQ289Y8Ea0ZX
         EQISOEgpGSxQCnCk8Nw5l2bEDz4zxHeGXyor8Sqv+uT2KFY9IrVX0yx3YojE30AlADxg
         j+bMcOl37mJQYyqosBYd4o7xDcUmzCfvcSPQzXVP76uV/FsFBvr+pyCB0uzr8AMt+jKQ
         4crn55kpZue9zYIljVy5UeR/ppZICq2ZGcPGZEmONLEkYP4637FdY4wQJzfsMyOosVr/
         lcG7W/N79uLi3zvZU5rrQP8wxtf4teboPhf7DX36nADH32JMCVHcGVV76LGvw79J5bSO
         adqg==
X-Gm-Message-State: AOJu0YwEtZ1DVz1sL1LJy6zZf6+DVq68cVV7hxWsc/uSvBwlzvrXFFNi
	DjvA+z1bO4A+OUl3JqjhGSqdbVbfeATS962dPT1DhvubvIiPsjPKTOUR94JQuL0=
X-Google-Smtp-Source: AGHT+IGUnZcwd5AxLTv0bg9KbSvLUhoISLP5js+d83riWZasU8zSm82K8lsZ02NuGHx7B6Qiaf26HA==
X-Received: by 2002:a05:6512:b07:b0:50e:80ff:2d0f with SMTP id w7-20020a0565120b0700b0050e80ff2d0fmr3427234lfu.98.1706033244625;
        Tue, 23 Jan 2024 10:07:24 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d17-20020a05651233d100b0050e8e88b529sm2344518lfg.237.2024.01.23.10.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:07:24 -0800 (PST)
Message-ID: <a5c61d74-1cb0-4476-8cde-c6b11a76e2ee@linaro.org>
Date: Tue, 23 Jan 2024 19:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] arm64: dts: qcom: x1e80100: Add IPCC node
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
 <20240123-x1e80100-dts-missing-nodes-v4-1-072dc2f5c153@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-x1e80100-dts-missing-nodes-v4-1-072dc2f5c153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 12:01, Abel Vesa wrote:
> From: Sibi Sankar <quic_sibis@quicinc.com>
> 
> Add the IPCC node, used to send and receive IPC signals with
> remoteprocs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

