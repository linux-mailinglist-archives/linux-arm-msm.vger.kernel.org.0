Return-Path: <linux-arm-msm+bounces-24723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2720791CCF7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D69842832E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149C177107;
	Sat, 29 Jun 2024 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fok6nm1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9F11E4A0
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666469; cv=none; b=EH7zB6YpeRg/czwOhnSlO5VH5Edx+JZaotw9YnIHj7K7o2s2tUC/eLPrWtCHzXfthgOozueR5slC49b5Xl8vk6k+ayYuuVaB2+doyMdG/NFIiA6yWbg2iRF/9xHXnlEfgr93s3/sXdPkRV67CIarvHvjoVpYb4Od0jB+XaeMdMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666469; c=relaxed/simple;
	bh=kvNTZQFz0Ll6s7aKiKThPFcYuRTiO1fg1fZ8i1ta9yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxMuOtX3M6L4jJ+QQYNYC49MhLGKUnKVXpF9DYyX3Eayn6pvMPQ15WIZell/Y1sOKPty26bmn8OTChFGN6p9g5pDdZWS06/YleoOkC0j8bFcHKDIpiCPGNtBpnSW11KygUaGGV19JiTDxhbjTLf3RVkXR2OOBjW6DC5L5gn5tdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fok6nm1w; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ce01403f6so1737839e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666466; x=1720271266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MF1OWr5Etw0/4+36Nq46eghotSCiE4f88g9tXRIl7DM=;
        b=fok6nm1wO2RmAQsKyjpNWXS1RiC4arW9dKyELT1+OLO3gx5ailkDyktlDE7HNCXWJ4
         d85VO5HYpf/vBELCnPVXhQtaqrSv9O8qLCwXLdH66FfNoi7WTLR7x3b/TtVkPPDF6ScK
         i0CU8FnPP1syC7H2aDFbR3KaiKj04HRCDxkoe3dlkOsyvkrv/qSG+7/HiRnAOoI1vXBW
         Xz38ovAhnaRzsot6w8ayyvhoP8U/KkHsFxRIfrxpcJx/doQKBK4vwT7UrnpFZB97iBtK
         o1ysJyux96gP4q5qQvWgfeIhWCPB82HB3PFv+5WAfF1V8mE+IqxgDVgzTh9+xi72RmrF
         YQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666466; x=1720271266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF1OWr5Etw0/4+36Nq46eghotSCiE4f88g9tXRIl7DM=;
        b=cc2mkCZALrjLQLXM8lu4UXGkRkGIng0FXvDFib8avVBvnA3mm2DQlycsuGGVgKZs2l
         /H4Sh5NPQlYMCUd9l4Hxld9cif1aQ/I18Ji1JIVYmBWQyRHCwmZtJQg/UGosZ7FaYecU
         +cP1cthbRjhGwtnhXN+7n5SOZghxVzeBlR1OD+8qvuw9BA+3ceHR8o1nEeT6MRLytR1U
         5fSxSi4u3OpEJH4G+8J0RccpUezHXxgWHtHlOSS4unqHvMe+NRV7rOwtNMVg4uyl2lpD
         5AvdPVPA8pb4qQ7QUPi9/g/Y+x6sLe3DEm0MwDOsekmoWGB9RxWpILS79cotjBuIySfF
         K70w==
X-Forwarded-Encrypted: i=1; AJvYcCVY+Rcx/7j4Zcldcyvm5BQrzqySnuPGyXX8TQ+7ZrajnRDil6+sK5/Vi4hB5NCDTJt1OuPt8i0kjKmL5PFyDnORxFSiS7/f8vJCE2zHgw==
X-Gm-Message-State: AOJu0YwrHkrVo+Ni+herTjCTBQKXN8SXckvh/DTngGCK/3zM9tcLZdD1
	fsp/R6GBAPd/50v2BXuyoCRlnYUfEgGg6wmvwWaDfNRpXmhB1q9llD1+aResSkg=
X-Google-Smtp-Source: AGHT+IGyGWF8HMfAdhRpYySZnUUV5MkqCgcXUCfFEq/2svRgGfU+q4zk5SsCHizwXVDyEa+Hy9ZS5Q==
X-Received: by 2002:a05:6512:3d15:b0:52c:a88b:9994 with SMTP id 2adb3069b0e04-52e82701708mr922460e87.44.1719666465451;
        Sat, 29 Jun 2024 06:07:45 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab27815sm594995e87.174.2024.06.29.06.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:07:45 -0700 (PDT)
Message-ID: <faa82331-ef61-4e2c-b658-cec3aaf6ba6c@linaro.org>
Date: Sat, 29 Jun 2024 15:07:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: x1e80100: Add gpu support
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
 <20240629015111.264564-6-quic_akhilpo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240629015111.264564-6-quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.06.2024 3:49 AM, Akhil P Oommen wrote:
> Add the necessary dt nodes for gpu support in X1E80100.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

