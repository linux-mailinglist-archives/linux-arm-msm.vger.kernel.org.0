Return-Path: <linux-arm-msm+bounces-73180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE41B53CBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 21:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBDD16360B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 19:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68ED24A04A;
	Thu, 11 Sep 2025 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RB5206Y/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3432DC76E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 19:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757620452; cv=none; b=W+5m5OOmXRX9Ag6e42R/gul0+k1C3a8yp4CbVM659sSRcC1NfRFJ5UtBPNiJZ0pDC91/S6obuDPpyz3jVx0Xb6Xs7PEvqtReGBZ49+akBoya/Je60b2O4fKJNzRFQYfSIzUfoALt0tjLc1FS+Zb/+Ckfk8Jf3uVBBAx5e/iTqZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757620452; c=relaxed/simple;
	bh=C9oaw89htYCAQlCZ0NUg8UBboUF6FXp/isTMZl9ZBuw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=enaN7P5kXJ5WQ6pTRO+iHCyqk1zXADd+SBK1IhodJZwYBPQMn1Z1TgyNUx6sz16gZasgYrXy1TV0ARjcbJrir4to2uOh89N5uj+kJ3XZtQhOGBN0xS+EwoHNo7QD3zFUGmJxXkJXSJQmyhkEHj4xiFtM/iJyj40sOmFLhcOVkLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RB5206Y/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e46fac8421so1010035f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757620449; x=1758225249; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oKeretZYtiau/KKPwp/maBA1dGY4AYzbQAj9U/iXV8=;
        b=RB5206Y/EesUxt2FaFBQj0OAWbh4Ulpjzv+ZYwAB9NSw2u5axQIQvukRec7b5vBiUG
         RagaM2phxZFv5+SSqOA/tAzYkwW5Um1DUY8EH3QxMPEEM5KD0jQ6RWaGa1T2NpKCm9tv
         fefYAFeqm1VLujdmFM079ptymHiQBSxSxf2uZpqiTAqEua/5xv/K7E0pnmSuGj9Vi5wJ
         d9F4SQMQVo8Gv0Sq+iuE/NHmXzja/OsSG2nF/cZr5Q5vXokWqHCObYlFk+LihwEviQpo
         anxyeESy5AU2CWpsljso2kUXAEQe/el3inctnqmKEvDq1zxE8MHh2FwAKmY8/MXiGbVH
         WFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757620449; x=1758225249;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oKeretZYtiau/KKPwp/maBA1dGY4AYzbQAj9U/iXV8=;
        b=P/KVMyZfZmlMy9yKlfBWiIw4/eyZ6v/OXPwJkT41TB/HK+CKrz/Dt9czU2aPJauQBr
         Jqt6FiXyFd1x5ODB8RFG+dEYdYG+G/liPqeTXMlWPpiqA4qfi2nxSE85vq5KamIewxN7
         IiwMQZKDkWZXe3c53w0iYOg7krOE2L7sfv9jiD9qS6A95TrqcZgiKUV0WzpUeKYuaPwW
         4f3VY3817SKG7c5uXquulc0f2jrEJWDp9waHgvukqOI4mu+w82ijTtghx7B3SEZ2sCRg
         Jg5J3C90UkpUJGoSYNNtykNMPl8L0VaChrj4S82uZL1kEmkkRZ9j/AV+8w5AfABVi23I
         l0qg==
X-Forwarded-Encrypted: i=1; AJvYcCVuiyckwyl5gdDuVFK3qFuZFKE5MdGczdAF68yuRZGBvkq9dqzsyWCqeW7xjWaDo/e53Gd52c58TT30nqWg@vger.kernel.org
X-Gm-Message-State: AOJu0YxXBdO19J68/UcFBUk8ViiEnYOS+OVsTi2SGACbwu4mTcih7gRJ
	+VD0T1K0RxG/7I3hGVm3YnMWEE5BFW6iNdKfovcWlYAlQvlQDGPlWtIJCW/w6zAItbk=
X-Gm-Gg: ASbGncsXBpUBqBbG6pSUQOJFHL52WmhbkoqeeA4wFF8fuL981NwlQ0lVrpT0awND3h7
	qwsH7TSOtzB+4hmm/hwB1rolBrd2yJWQAewKUrJV931n2y+8UTet/I11cAA2HIgVAwHc61adxBZ
	9Fk5sBRxcGZf5H2/uGT/N0tGd5jm5oYQqwNrYLmeq6clVXBwFkAuv1rSePmr5dkPgQxFjzuOeR6
	+2zhtM7VPCB6Q56kRDBAL5bL6TvHxcgOrE5OpUt8AEg2Ujci6JN+Q94ightxn94mq64x7RAAMtY
	nEX7HVMDW3+8VZsPTCJHbWZcQ1KTOtkZMJfditoE7wsf46BsJgtQpwg58IZVV+CMlHR2p/lacja
	XaAe/pRIuPAMwZS0HxLqpvT0SQ0rClsgAk6g=
X-Google-Smtp-Source: AGHT+IGTnQxibZ37xyPnj8SePmvouWMa7nELymuXsr6TBZk9JPUb3PXeIrdR9ULXwb4CIWEV0IoOAw==
X-Received: by 2002:a05:6000:2f87:b0:3e7:47c7:9b3 with SMTP id ffacd0b85a97d-3e76579214dmr541452f8f.14.1757620449495;
        Thu, 11 Sep 2025 12:54:09 -0700 (PDT)
Received: from localhost ([2.223.125.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd424sm3498794f8f.36.2025.09.11.12.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 12:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 20:54:08 +0100
Message-Id: <DCQ8G73ISXHC.3V03MOGB6NDZE@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dikshita Agarwal"
 <dikshita.agarwal@oss.qualcomm.com>, "Vikash Garodia"
 <vikash.garodia@oss.qualcomm.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Neil Armstrong" <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.20.1
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
 <20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org>
In-Reply-To: <20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org>

On Thu Sep 11, 2025 at 7:38 PM BST, Stephan Gerhold wrote:
> Add the IRIS video codec to accelerate video decoding/encoding. Copied
> mostly from sm8550.dtsi, only the opp-table is slightly different for X1E=
.
> For opp-240000000, we need to vote for a higher OPP on one of the power
> domains, because the voltage requirements for the PLL and the derived
> clocks differ (sm8550.dtsi has the same).
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 87 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts=
/qcom/x1e80100.dtsi
> index ba602eddfb54616ad38205570bc56a1f0e62c023..d6914165d055cd0c0e8054126=
7e2671c7432799e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi


[..]

> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable in boards where the proper signed firmware
> +			 * is available.
> +			 */

"enable on boards" please.

[..]

BR,
Alexey

