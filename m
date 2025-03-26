Return-Path: <linux-arm-msm+bounces-52563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3725A726E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 00:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6953189ADB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 23:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C041D2561C4;
	Wed, 26 Mar 2025 23:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjlAS1iH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCFD20C039
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743030732; cv=none; b=qczssMYIZL2Bzn8sKpwvcR0Bmo2tCbeS8uR7uyjbj0/i609FqIfPt6I81CkA4OEj6FeggkGv1y5dnzMvKC29D+CXbtoQmR8/UEBfzDKwDCS9pfEKLGFjE3tYwf03CKZsIvNmeOrjTe8zZwuIsRN/Xb6/BN/6n9Ck48PZkajBIWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743030732; c=relaxed/simple;
	bh=UCc8rw1bQL615I3M9tiEKJMyEQJf60GHdPTj5eKlWlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/y2ZteejB+Z6I7OFtdOAiK+Y2ZjO0cL3GL+AV3MMkbbjCbBRVrUaGLcE6izImDWL8rmbzKE8ZaShMoV893C0MfNGMdPkIXzsQrLfc2eygtWelzBo0TyQU0WkoP0x78t4FpC9bcMh77NhYuihrw7zqslatG71wO6WpzsYhaAl/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjlAS1iH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso3716205e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743030729; x=1743635529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZ1oUMJWV5EqNiAudEw/NeW3kJ/2zqRNfZDBi0ZOEew=;
        b=DjlAS1iHihGXnNiwAcKUm6doV6UVKK4ZyN5mPP8mqXVt7oYrmh6mDM7QQIl69wrQnB
         OvD0rRxq+7RxtEyqSNxDUam9LmmdvB99rtbFB4fHzgievX6OdTwQCP+sW55P/tD414Lp
         dVQc0Cq6lTVbckIKFKJeL2vcVhGr7+Vj++d6YjgCXGgnNRBKMPtUr4OxDkqqhT0juJb7
         iYJem9CJtwo/S2ls6EWYsW0Q4Ndi74GTFXMzAeWf3XhyTBOK4EN2XyHEgsBA2c+VJxk/
         2rrY4J6OtB8xxKtSnsBmPKBAENDlbUEsbzxenY7oj0vv7n6EAjh4y5i8novKM30csOK+
         Ls4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743030729; x=1743635529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ1oUMJWV5EqNiAudEw/NeW3kJ/2zqRNfZDBi0ZOEew=;
        b=ZCr4xMgM485aLe8LQ9icvWbwqbeZtUYX9LWmdIOWzZ/TZG7MBe8wCYXBjuK8D61fy0
         AVgcBXtkiluH0DjXTjMkFRUgzcX6Fao0CcLNVIYDA5ZgczZfBVMtl9RAXaEuJOgG5t0c
         mgXD4Gn2kNFrGlVekDssykqiudtuhWGgtDHctLJngl+P9U87Fzlb4YhJAKtTa6CzAkOR
         WHDD52OrEYuZw0NsbcloCaCfmTYKbrWM9f0nCUACU48BQn1vTPcBIegKGHILyGLwS2yd
         VS9EZn5HPY8glSoaOL4knJDyltCFXgUC0wKUvuazkhIrguNTrNYCsEYS9iYeGRJys9Rd
         q6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVRXxoHsUD+IvMu15p2gNgzFVUn/aXIfzgcSCCTwzO84NowRWreQBXIGVGEbd/KAI5BQjKbj+b1Z3KJ6pwd@vger.kernel.org
X-Gm-Message-State: AOJu0YxOaykNsQ3+yTGAFOf2y3RpQpIXDv/JDOuczTrEwId0WN98qVWU
	AoHn2DorkjrsvG8zI5PMowcbpbn9ZOosOUdESL+S+Qt/+sGd997gcBoYW8vV5CE=
X-Gm-Gg: ASbGncs4njGauDdeecvQl2mDY1wQFN9XACa0NzX+n6/a1vXYr8gGMTlZUR7w0i+VDNV
	LYvkPVoGxu7fWQczdprajypsD+cM38qIkr9Fy8hJ7yMDj5EoDo8PNkGpDDD+65ObIp6lyuuPP9N
	DWFUIquLAmgU3A4rUXnDutIhZnAtcfnMwguRo9DOp2Q135lYbMC62BSj+0MI6HCC25YLdu5vYP4
	7Om8OnAVUDXGu1OMPn/xWnT5IIFMk11Or5f/244aoaRkA2QPmM8lFd8+jlzseXrdOIUKn9uJJ3w
	6g2BIGvvJeGqXvbbOE/HEq0jVsO9QdCzaKhHwA++1lHGXdyOxRO83t2cJB7EHuZUEkIkO0DoMR3
	7ajyMwoOdBQ==
X-Google-Smtp-Source: AGHT+IGjr+qreA7JSvrEvEPOD9T+3iZQfV9rj1gGSrk8rCjB2ZOO0aPA2mIB/U4jI8TMPQySnNJDkA==
X-Received: by 2002:a05:600c:1c03:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43d84f8bea1mr12243585e9.8.1743030729169;
        Wed, 26 Mar 2025 16:12:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm18764305e9.0.2025.03.26.16.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 16:12:08 -0700 (PDT)
Message-ID: <2a9df021-72f7-4bcd-8c93-634c2b77dfe1@linaro.org>
Date: Wed, 26 Mar 2025 23:12:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <bmCbxi-K3naczb2RWmUcQbkKEJgSGyXXi7LGAlqE924ZfgXs-H6O_xhcHT-7pWOwA3eoZcxNOwvpuPQPA_DXUg==@protonmail.internalid>
 <20250317054151.6095-9-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250317054151.6095-9-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2025 05:41, Prasad Kumpatla wrote:
> Add the sound card node with tested playback over WSA8835 speakers,
> msm mic along with wcd9370 headset playabck and record.

I think as a reviewer I'd like a better description.

"msm mic" doesn't mean much - please specify the number of MICs and 
their type - "four digital mics"

MSM Mics are not a meaningful description.

---
bod

