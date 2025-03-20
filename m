Return-Path: <linux-arm-msm+bounces-52121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF468A6B025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 22:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295CF18966F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 21:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC25A227EAF;
	Thu, 20 Mar 2025 21:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOIhLCLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9221DC05F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 21:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742507257; cv=none; b=OLR/xwEXhxTaZzSzviOIDLMoXlxrX+6nHMP3FtEuA9xWZsRtRUNY75dk/twG61N5xJPzo7fJgR1BJh8jv2Jg+QrJatSVo/sr1qCpA3IedhzVV1XMMQkSrGef5AMEWiETn8RedRl/uM07jo1RnT6+Y5hU0tFk9g/1zGTJ3PY2RZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742507257; c=relaxed/simple;
	bh=6aFeAcQOrE9iX5bnT0IHoBmr8TSEA7XYOZSeAKpYzh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmprzAsP4pJzNnRnW4D7H6ptP41W4ns0DBs7/tFHZJ2jXpBcxp7x0Hp/cmPyEbmpmf+3w9Bx9eMYQlltsCOi3CD9SG4+6rxfO9f1caoBCO2n9CymOYlMfC3MUM5R/bbVs956yAIni4r6UJoN879rsy+jexApO/W7VYCxyUs/NsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOIhLCLC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso13822465e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742507254; x=1743112054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pDs0WVPO2a99lut0kg8geJYSA583A+0xvILgC594aY=;
        b=sOIhLCLC4KdTb/cpTmXDZvW3uho4lVcm69fYU4rW5iyvoV8Y6ux/WSuIjwE1fZCdcD
         VAUtny72w+EdsGYjuOqFulw/uPPQ+rFsgQkOsQTT7sGyFNvqbze5PnRUkL/mcKr4qfIg
         sWPfKwqc+y7sE0EC3unb0RR2Qz+Zs+Kidzj0/TWlLU0o1EA6AltMeLNo7vWiOExR9Aiu
         8syp6JhTW0V5zD/+XZzlfvWfwj8kzIwSZDfV+FDyJYtiWtxd5Ci5oQWZebWSV4QZNzig
         STgOCJae4/84EEZpeUja9eSHuR5bBepwoMhlgDRkb406e9kCOwfFXbg6+1grryniDstr
         oZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742507254; x=1743112054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pDs0WVPO2a99lut0kg8geJYSA583A+0xvILgC594aY=;
        b=j7CxPZo6h+7tZvtN2Kud5p9Oe+VodQtwLEf0HCFsEd3YyS4Dgk5xEvTHywvWPRRvAz
         hOyzdmpDjDleYcYuhyT55Y3LYjSrsSJ/G3Yg3NxmDu2WXaMMkAjPuZ3Fhi/w1nCmQco5
         AfZM+oWd33yLZeMAwythQwg42hkFOjLjkcFYHu0CHukowkueZ6mEeKbsWY44L3u4i/SG
         1VRsiYkXmAbhNmYTHHI+hjjHryXWGRClBbf5lZ8S9/WEZHgddrLjqi36E+w+uvg5MkRq
         mq7VTDFBorbMny+C75IsvDx+7M/6pQb8r8kMosiknRO03A6ALCilj+SY7Kt3J+JTsSkF
         vmSA==
X-Gm-Message-State: AOJu0Yw56Fkr/bTbg9Nn4TT/Cf72VqHCR73GjZrJSRLMnKyKhaVo5cjr
	QKxDc9brBYnYCOwYZX+3NkXgvFK/cclacxHdhN0x3LwQlX5zuxtY6DnARdbiLJk=
X-Gm-Gg: ASbGncvLZQcVxATDky41TTucaZnf52IJ0SOa0Ve9DU2wFk2XXOeTMmwXPisFLhxy2z/
	KjTUj3GbLnBpeiTt74IHVlUEQaGuw6Rr/LYMqr9FziJnfMA65jOH5BqWINR15ZII1EJD6ZVv+3K
	RvzX6LHn6wLbfyCKtvml4lZR+kdJ+3mcVO5czRNCY3Ciiw30VNBXiQbPOzHHNYHJ38JEtYBc9OK
	E6vrO1kvAzwX+PDnKDh5008VIVRNJdyrBGBFbCU1xXQSNMVz6vtgC7gI2up9SmBh3zuDz0KQV1Z
	JEq953O8N8m4GPyOfHF9lWntjTHxO3qG+MFCTNq2V8BuxoPqm26zzm3kdsuk5+FEMKpBGRCr8xq
	W5CU416bcVA==
X-Google-Smtp-Source: AGHT+IH1QR2lA5j20mnRQxFbbvbhsn3PhLymz9T80NY3pVx9+kYUunZaqACuc30VQqERvPO4097GDQ==
X-Received: by 2002:a05:600c:1e26:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43d50a4e498mr6521745e9.31.1742507253926;
        Thu, 20 Mar 2025 14:47:33 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3bb2b2ffsm67871675e9.1.2025.03.20.14.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 14:47:33 -0700 (PDT)
Message-ID: <a4134aed-0b6a-463e-828e-326636fbadc3@linaro.org>
Date: Thu, 20 Mar 2025 21:47:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sa8775p-ride: enable video
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 sumit.garg@oss.qualcomm.com
References: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
 <QmxHHC087sYySMBmJH4INHn5KxydFiCpjxuGSwMWq2izyyd5JQByDX7LBzvgK_SccwtrWn2FzazAyF3252YvDg==@protonmail.internalid>
 <20250320-dtbinding-v3-3-2a16fced51d5@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320-dtbinding-v3-3-2a16fced51d5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2025 18:06, Vikash Garodia wrote:
> +
> +&iris {
> +	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> +
> +	status = "okay";
> +};

You're out of alphanumeric order here.

Should be:

  };

+
+&iris {
+       firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
+
+       status = "okay";
+};
+
  &mdss0 {

---
bod

