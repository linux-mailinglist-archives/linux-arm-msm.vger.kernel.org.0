Return-Path: <linux-arm-msm+bounces-46775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05B3A25CCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04CE816835B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C2C21147B;
	Mon,  3 Feb 2025 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPFRpq1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965C21129C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592773; cv=none; b=OeQPZHkHdmyUC4dPw9zsSh/lRg4ZMFvneu/jfMiQibyI+0Ey2+od1yxFoYFVgMHhp99eAWHLc6CqfD6Z82vFHn1yD2AJi/2ZMox/cv6BOLrG1Gy9xdZUunMSMgH+iJaMJu8iz/LfVDoYB57DdIdxSHmrTBPqIIegmlb9yU1bNv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592773; c=relaxed/simple;
	bh=eQmN+wSYqNfPSq7/lGm2FRWILAta40UWxadBXdb2dCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5yzMXHAAOKxHF0aWQ572JfCE/2i61knhLwYkwr+Fcb00kYQJZ91K3UhyiGfd9f1PqgMvKH7c90vyo9tTDOkBnczBdixCC3KrLYKYbII20Gc6Hled5YQN8wEUNaji7U5VY4+HHwsxic2nHR0qNlJWIzv/CPnh/cJOGUXwdg8wqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPFRpq1l; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216395e151bso52991915ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738592771; x=1739197571; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qwfs5ZTiLlNTPpq6GVEveYLjOMUtMGx1iY3Hoyz/gnI=;
        b=JPFRpq1lIax9qYN1iqQHift/c/M1X8eEWbuaLSeerK+F/rjy8cX9GgrBg6bEJI/CX8
         Zc2xIldFZXoAxa2rb8q8Grciti2+T/PTz9BpJKRP39Sg9r/kiiMJGBYXap+i1nXWDNsZ
         ByjLypBmzORX9Jz1aeOVriPRu7EgXVtULqKGWPYR0NjVQ0uo6xHihGhmee9m3Wl1G5IE
         umgrKIs6o6mbE2Mvu6lF0J/gJxu28exPBgeQwUI382tZQeeJhwQVkdgrKctkctfgPG9l
         k00+vprvjcoYt3oNlDVV3jn0Bcyg5V2Bq4GlmnBM7+NKZSV2B4OeaN/Ic3/eeC5WhNHo
         yUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592771; x=1739197571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qwfs5ZTiLlNTPpq6GVEveYLjOMUtMGx1iY3Hoyz/gnI=;
        b=AkhRkm61uK12GTxr91HlD0Wq1+0GgKlEfn9h2opC5oghN6K5mKsv/6NaMhVPKFZJZX
         mXi29BiSoUtVZ8kZ04G3pO587lQ9yFmXMKBY6Qbi5mAWVQ7M69QWLEfVLVIF7O1qkBSA
         yx8U+pfxZCzXs3Y1NlFO55CBbYrBFRc8SFi5JI9upOdHgUmFHV+shEDZF++Dsl2do8eP
         uVfoLg6SMbSKomW1wVj1EjRi1I9gMrSYruBaoVgZh4GN+7Zmp7ypxJbla/P5s8p1Wu85
         DwNXyuq39p47c9I8wOLqqeSluGZPvcCwufyYz+X+0kCJBGctMnMVta//LnJeYddrhoW0
         PUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3mmy/l6va4rkmqj6B+x++9oPuS4aYsjYjZLSHsVGP4bzKbZ0T1pwBVQ1B31F9GeUqafx835mRx/nn6afM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm8wcbzyubc26wr8+VOkcO/NVQjG7mCZDpbcNojAlNdYtSymNF
	otNAlHOrnkHDhyC9L1FU5WkWL9aJXzJQpiFXYKyi8xMewvX4jMKvqAK+/X8abyUpVJWL6VQVhvk
	=
X-Gm-Gg: ASbGnctIBDIgF25yjnyuqCkgQm97Orh/Jti/eNxa983sN9JOStplG/O+MnzPn7qHJ9q
	6YOqTiygbsYBjJ7uY7HrLVbWN0geGq2zebtVMdY8lRDN26YryYfyfn2AbWuvSvA2KxxMP1WI5OU
	YK+uY+oNjazRf1b0a92P9MjUF3lsn9fcoMauybyyuBti4/SJz5TH62WE6S8anqneIl4CIUWlct2
	zcB2DG3qqofcLWi/oBVXpxRcfLhvJ4VvGHASdQIxS+W7o5L3rOGQly2B1f45ufaPCz2AEwUtEj1
	mQdOm7kP65PjMEVZuqqijAx5Xg==
X-Google-Smtp-Source: AGHT+IG8vvs+euO/ez1FxBukXMJbsbYt2P49CFmVm6CSf7uQjAXZ4KTRY4SvUqVfvG4OF84t8Yabqg==
X-Received: by 2002:a17:902:cecc:b0:215:3998:189f with SMTP id d9443c01a7336-21de19566bemr244795305ad.6.1738592770645;
        Mon, 03 Feb 2025 06:26:10 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eb995sm75748215ad.148.2025.02.03.06.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:26:10 -0800 (PST)
Date: Mon, 3 Feb 2025 19:56:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
	quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Message-ID: <20250203142604.mh3vx2fzrut5wc3z@thinkpad>
References: <20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com>
 <20250124-preset_v2-v4-1-0b512cad08e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-preset_v2-v4-1-0b512cad08e1@oss.qualcomm.com>

On Fri, Jan 24, 2025 at 04:52:47PM +0530, Krishna Chaitanya Chundru wrote:
> Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> rates used in lane equalization procedure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> This patch depends on the this dt binding pull request which got recently
> merged: https://github.com/devicetree-org/dt-schema/pull/146
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a36076e3c56b..6a2074297030 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2993,6 +2993,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phys = <&pcie6a_phy>;
>  			phy-names = "pciephy";
>  
> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;

Why only 2 entries? Isn't the property supposed to define the preset for all
lanes?

Same below also.

> +

remove newline here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

