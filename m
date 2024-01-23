Return-Path: <linux-arm-msm+bounces-8008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B67839742
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24A91B21C88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B94581214;
	Tue, 23 Jan 2024 18:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krtGWImy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1181211
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706033313; cv=none; b=UWhjv+rbm/oMZ+AZGXwn9KXDU/pHUdiOuPlbpcx1e8IMAOuovz2n5qVCitzEB9YsCz1FXwkb2qULKgzTzmTQr/mdnlLh0ew9CP8UDsL3g2EUeM+zbXZY2BOezJgl8aRdovCH1fJ03ViBopjAoHwxXoCKTdDsh/izug87MAU5U9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706033313; c=relaxed/simple;
	bh=V05iKo+n6/NfP57WVS8I3bsIytgL0QoVsgZ/TQUCSU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbIXmRIX8Ozx1Ybm0sUY4y3oJSn4bxyrIGX0qVVwgRntIETAqircN/kK7gFcbltBln7OLVvQ/XKX8nCtpLDetuyA6FNgUoUB6cep0b0GRhY1+08j9iPeMM23Srxqntr3a3no/011Qr1Nd27fQx1x6MppHQZu4SDVKbY8ogRG3K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krtGWImy; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso5103999e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706033309; x=1706638109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VacN+hMZzICvOwFTo+1W7zaMNQJAc7ZHS+usoqRya+M=;
        b=krtGWImy3wPR+yZTPM7wzvlUZgE8qQ0eqrVp5cn6iE4Lpb7/K0vEFfPFds5c6V0AdX
         sigVsl0dOqUFrFV7rHj9muyDjxFg5muLgq+UOsrXFsW3Cds+ew9SvrzpKZvbung8KASC
         IWpZ6m24nAOhV+yhAQjRwXHMmIYROawhYVUYqkk/08PnvP01VXNGLp/RpMcqNTxLJh+L
         XNuOctpz8WFVP+S7mGj3O665Q12ZiBLRINAXSpNzdVAi8xv/c/c2R9q0yF2fhuzRul8T
         gqyxZ2wYyBcdy6NmWqKRPO+qU9ANZ0z9AGE5alazD/ViUnRv+BQOGnB46p/1pHX/2AFh
         yWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706033309; x=1706638109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VacN+hMZzICvOwFTo+1W7zaMNQJAc7ZHS+usoqRya+M=;
        b=twsY2ll1cfDzRltnBak8H4RUoYwMiTVu7/p5phCfwS6kzgLI1rl02Dw2L+27g5lgi/
         cNSo+o5BElDCtGfq1gsNR+X+L+BVl9gyl7VWd0+BCPj9z34aVz6nTGAsjyVJaPNlzUbC
         8FL4CT0c3QiuvBR7TREWkJpQ6cfkSlgJffrtySWzGX2hXFYzj/xKbYfAvHuTax8V1REV
         7JmwUhETriEWRNeg40nWWIxkZ34d54+O5KQMsS02iDLDyHK15fzsYUhO7v73APZK2CkQ
         IHEdm8itCBjDsbhbBpQEgW9SlrVcyDl3QqRIZXTmxie32h6mESSqvO6dB7uLxKQjlE/b
         sMPw==
X-Gm-Message-State: AOJu0Yyg1UUVMN1Ra+Y1/1J6M6k0jq2G/LWW2WoJZaPoxpAzbU3Ja0mE
	ZLvaTmBMgUvJpCFi5weyHKmkvT2lJ5BDOVafYXB2hlhg1u9YdbsT740uufl9DsU=
X-Google-Smtp-Source: AGHT+IHeAnZyr1gr62qrxVLoqa6iDyfnOqrEEg0041Peb3w0NL5O66Teiup2mHYqHEt4atQeGd8gHg==
X-Received: by 2002:a05:6512:4c3:b0:50e:74c6:895f with SMTP id w3-20020a05651204c300b0050e74c6895fmr2408227lfq.115.1706033309431;
        Tue, 23 Jan 2024 10:08:29 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d17-20020a05651233d100b0050e8e88b529sm2344518lfg.237.2024.01.23.10.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:08:29 -0800 (PST)
Message-ID: <bd404b99-346c-4d51-bda9-f1148421540c@linaro.org>
Date: Tue, 23 Jan 2024 19:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] arm64: dts: qcom: x1e80100: Add QMP AOSS node
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
 <20240123-x1e80100-dts-missing-nodes-v4-3-072dc2f5c153@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-x1e80100-dts-missing-nodes-v4-3-072dc2f5c153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 12:01, Abel Vesa wrote:
> From: Sibi Sankar <quic_sibis@quicinc.com>
> 
> Add a node for the QMP AOSS.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

