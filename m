Return-Path: <linux-arm-msm+bounces-39436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C89DB80B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D7FE1645D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4850B19DF99;
	Thu, 28 Nov 2024 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymP1yL15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00CC154BEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732798617; cv=none; b=PCciNIB3rS7VZa2GTlB4MTBqviWpW+9F/vtoVt2Qo/4YzUM45ZBtDvs9OF+iq877J9TaF26sgkk5uhixa93OsBSq/a6bEqrRwIyDI5k3X14RiErzCa1Xwi6vwXO0AFaGp+kG4imNxyKOk4x2ICWN0GAUEhmRzPt+8q3X6zTw44k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732798617; c=relaxed/simple;
	bh=wIbCDeRCPipDEj0QLk3Kv6nua3hP/xB+LsLEnGR6CPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=la0MYVmsV3AKT4KDY0jSmlEC14NKWRfcfEqrWxIF0uHCo03KRS19AsQfdwoIjx3WkG3m2teB+JhyN/jfUwv2RckSib5aOb0zYQTcxcC7RNSQr8wlh7Lj+RUNo1hHGQRhc6Q/GmjkW3YQPjmU/Vp27bz1ajCSFLK1iWZzqI37yDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymP1yL15; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df63230d0so756802e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 04:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732798614; x=1733403414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FMqL0Vo9ZTV7oQ44UmQZuGKsEmW6qDjMP/0EBigxW8=;
        b=ymP1yL15gIB03l+eI/nE9vgQYWmjOY4S+YsvbPVvO1Y3tGdbbxUlVjAqW9hHFdnDp+
         jR0hKftPrSzYGv42+UEDgkNoPAGLoj7RR31qq64aLu5KbiI2CW4gks1KrddKMdb85dPu
         hMcZ0pY0phGmHmWGaZ4Q4XACEwlXBRoqurypen/UQX5W8EsyTh73/TkuW1Y0EwiMN1sx
         KOz9F4Q5D96A/i/GAJ4a5vH0OaGwMLPNnbg+vrAhSNmpUSZDzaBEttfMjVGguV1RVLUl
         N48F5yy7sr+LN4JtbPgLhSLn1HXpk7uMtLsbe5GUd3cZEjA8uFPtWVOpq9QeODmE3rlU
         or1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732798614; x=1733403414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FMqL0Vo9ZTV7oQ44UmQZuGKsEmW6qDjMP/0EBigxW8=;
        b=Tzsvvh25smrdWQI8VCDGqwMFs2Fu2JlyqRMQmigQfTrHXLB4/+v9rLXEKQzlXFPc7N
         duDmYnxG6YChr4bAkwOUQp+Ngdc8QdJm+l5nML5Aah/DO8RHt/z7nENOPe+crcakrgZo
         FotIqmKwuph7rFOLh9za6FpXG4+0Hcf90l5rgxZY29pT5bTP2vCsqm66QxVaeR4jTv7l
         IUfAVxTNe0OJGDoPpDs6j8ERE88PGd1V6XqMEJ+6qXqX9zwer9y8NoMK55ElD2XftUH6
         O3Y9uDYah9Dp0bkUvgqNd2Qmpt+RMOuZZnuepu/bmAUW+m37OCGJu6Sols8annMU6ljg
         gwDA==
X-Forwarded-Encrypted: i=1; AJvYcCUdQEQ9isPHfoEiY+fG8j3Gg6nPo3bW1gmzClNZPLTgwy7UtJAKwtnrsCRlhxrzi9e7wcaBIF3wFlOE/J9J@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEiFpFT1FjqfVQbXLPyFABpcXkIKymC7YgJf0hJfuHXbQ90+x
	c735uONb1VqNm7IaIUTPcyMo/D7zlxZl8xOo6YG8ze7dUD8kNnftvrZarNrHrqQ=
X-Gm-Gg: ASbGnctpZOLZGpyBmgYLuGR1Yo9QZGf8No7XggO22E4qTzVLIZtbT/vzCquMcmPxjIF
	WLak13ssaabJgHYcFJvi2LXk82pq1pqQU6Wg1nneSK/+oDQNknxOFYQNZFs2/yfMfpNxJbePENe
	ujtBjM/Z02BvKIajRwtY6fu+ZlZGC1L2qTF12Z9M0JNyM2lXy6a6U/pRKq0wssXkvgJgaMnWTmf
	FK1vdz1xMALo9JilAIu0GShmKfs1SLK8xcqvYwFyQxH0BHHbFBb87wQLaymMBaiUnvMqxiTkjg5
	7R+qa3yFM++6Qk1NzwSKJGyKGb2UyA==
X-Google-Smtp-Source: AGHT+IHd39GNyqtnusbMRvZYgSGa/NnHGVoGq9VkP7PA/yhU8e6l86ZQ3O9anzd1w4QjK9hje9fIPg==
X-Received: by 2002:a05:6512:3181:b0:53d:a4f9:6141 with SMTP id 2adb3069b0e04-53df00d1b1cmr3597761e87.14.1732798613900;
        Thu, 28 Nov 2024 04:56:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f27fsm170090e87.157.2024.11.28.04.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 04:56:52 -0800 (PST)
Date: Thu, 28 Nov 2024 14:56:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, 
	kernel@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs8300: Adds SPMI support
Message-ID: <25gvmj5evftgb4bbu3gmaxcs2hvflhrwrzsnhn7pizop7dq7oh@drbk5vvcf7zt>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
 <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-1-001c0bed7c67@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-1-001c0bed7c67@quicinc.com>

On Thu, Nov 28, 2024 at 05:40:16PM +0800, Tingguo Cheng wrote:
> Add the SPMI bus arbiter(Version:5.2.0) node for QCS8300 SoC
> which connected with PMICs on QCS8300 boards.
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

