Return-Path: <linux-arm-msm+bounces-58031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7EAB7E0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 08:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6299017974B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 06:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35F554758;
	Thu, 15 May 2025 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKbHql4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBC31A08AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 06:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290853; cv=none; b=ZRHrvRVU6MPbi4RBbqMueEV+R17Hbj3efUJNMlmLn44Prxrk8M3PnEBkkLKksvSLS1Q0fuwym1bS6HayaVI+j9eLLn3DMbs2375oDybGKLRQGJtpMxghDksk8yWZcB9C32CBMJZu3swINkHYSp6u8MLgplBW2aiTL4CbHttIGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290853; c=relaxed/simple;
	bh=UCpHFms/9fZX+PC3YHyq6WBmI7oksVfgK9RI1AUF438=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKrszwI29gh+TnrOXC+zooaXw9GIr5vSQjbUhghZSeGOyczAojmsxnvEKTaLj/ZIlRJqm5mBZ626c9Jga8hBb1IF858BuB8xFWGM5UqSD+H9pojj4JJYdaNjP/UCsLGVWmeQb7ejXSb+ihdqG9c5QwscWkC0AfSSJgOJHk2B7PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKbHql4N; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so5844415e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747290850; x=1747895650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/T0UCXB5vuqasYwa49l0chQi6vqaR/vGdzNl5dXsTs=;
        b=OKbHql4NjfeTykc17uNo8rHZ2OMXQ+2CIImGuBJeTJh9rccamrjEdgAxVD4n/UQ8x2
         2tikjFXC/bffpnk0gE7Db/exYYQdXMSxjdXPJeomdyKHZ5VlcBFE6AUIj6wGJFdKukMf
         1HQ68YJMF8Qjh/DGMziLgVjJz1RClLyBrC+m+SiE7Cku99zcz1gL/cKm/dKMVd7y1Vwp
         9q4mzXR+OjEwgt36BLnK3LpvSQWnOm7m9jDanrc8E2ikFiqqx8/P4aQpCRB4VeZIkskl
         lSoQs1hO5wPmn7LNAvjzKPLELTEAYFoMoRQQLdYm+oc0/EorSvTnHnaN7cNVLLHzNcQt
         yH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747290850; x=1747895650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/T0UCXB5vuqasYwa49l0chQi6vqaR/vGdzNl5dXsTs=;
        b=XB7JOHXsA+noPNHysLKxENppWd2XnfElolMjojBmOkveUvlc9nu8XbaCXMaZbHDdLB
         EKiAzj6Eve/B+psDkmAOp5DXZoMh9EwiUKw2yCsQQGYCwWhA8edTSV5TOrtgmM9SHyIh
         B/lbe9ZBWQf5b6rv30gjHbvvdsMSNHY1+eu45r39oSj+YvZ7XpDi0RW5JFWURbZxUiO2
         Z9tlvWbFwkr93y38G30lISI2kLxrVEggj4wEUrEy9l66+VW8yvQI/qqxjhWsQVPQmpOM
         hSnhobretxyDajcXGoS9QdSb0f2XIJWNcTG79ZSdt357o5lGG/olrHxUYIt/69Tpxjn3
         sJGw==
X-Forwarded-Encrypted: i=1; AJvYcCVJBG+8WYrYpjR1DzFAj2Rr4pzoF2oHKAtvAdXZjA2aBcwrZltxYCDjzk/U6K6wYZRmQFY4mPjpXkh/yQhG@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDlC589Zd96Ng+9jy4EwzFN1nO9i+ySC2h4hNJEMeJcpli+C7
	MewjEXZbDbQs92iXDBW+ebyWmtJEslxtYTX+vBIdXjD0zkHqz3+zPyMYl7AfbkQ=
X-Gm-Gg: ASbGnct9UpO4ueb/mLJftheGDFP7A740IB8KKZOZK3pV+4zI7uSEmsyDPibZSwDlcww
	v9h5luVh7+YYOzbRN6qiDN1byZQrdwTO5pLij7VMsncP/vEavPwf/PI9VyGcMcHi6LeRH3PS9Jg
	aPubccM+Djhx9wJX7QUzOpPGu9CUiHp99/SadH08eOZWZ0Eco8E4JV9LzyZlNcNxoJprHWuUzPS
	aOWV0PIBACQYOfutgQ+4st2kx7cZFbTzCgy8OAddcniJLjU1zagRoyX9cBO3RxKCupTnrvJU5m6
	cZ64DgDb5kvyP7xIfjMK71dnQcOAKpnY5s1v4l6fSAtvBsIrguAP5NO9A4ajUsM7wptT4vL31Ho
	GgbbhZ7k4NZWN
X-Google-Smtp-Source: AGHT+IGi6GK0v/GAXDSDVd1UWmFfUHkAK0muwDMNzaFEMuRS6/TbSssIhPYz9lFtq+QsKOZ2rwrtRA==
X-Received: by 2002:a05:600c:a0d:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-442f21684a7mr50470315e9.24.1747290850242;
        Wed, 14 May 2025 23:34:10 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e8545sm58519295e9.31.2025.05.14.23.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 23:34:09 -0700 (PDT)
Message-ID: <37aeea50-e149-44bc-87a8-9095afe29d42@linaro.org>
Date: Thu, 15 May 2025 07:34:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 20:08, Jagadeesh Kona wrote:
> +		if (!pll->config || !pll->regs) {
> +			pr_err("%s: missing pll config or regs\n", init->name);
> +			continue;
> +		}

If you are printing error, why aren't you returning error ?

I understand that it probably makes platform bringup easier if we print 
instead of error here.

I think this should be a failure case with a -EINVAL or some other 
indicator you prefer.

Assuming you amend to return an error you may add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

