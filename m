Return-Path: <linux-arm-msm+bounces-57262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83169AAFC92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A59E3B5D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115B726562C;
	Thu,  8 May 2025 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gutl/9bx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522DF261580;
	Thu,  8 May 2025 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713479; cv=none; b=WosRHk0UIeOMKaZjOuFC4ZDhYvcnQ+OfS8AmFH33gWJDzjXGRd/yNkvE7pgcXJ+tAgWWMmOOGS9X2pS3mTaR+fwAlRso/Qxpgb60uLdzrTXXUYpp4L/c2SpB54zIBM40nnT17f8RRX3mD3FGvw3PjLUCBmPNozpWrCdSxypfKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713479; c=relaxed/simple;
	bh=19UfYlS1PiDxugPQex9kUrvpAyY60uz5ACnKVD1xGsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXSSj5Swx28zaLQh3b6rV3nSp+wVPDHNdn1pKQcb8OwEHO9CGakqiPJU1Hk6jkNFs6fPhI/BjUwQtXxZPRvRXeoZg40srvZ496ul6wGudVqrC/npZpARoCV+S8U35N3pJtY4B/uBpMhGiCfuAuf/x2cG8uCxbqdIZsOyLbYFbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gutl/9bx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so4061333a12.0;
        Thu, 08 May 2025 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713475; x=1747318275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fCcV8YncwcSM7mbOqAKDospz7Y+MQQ8tADbXGsEtAUU=;
        b=Gutl/9bxm1zc4iJW9t0n32Epc4rhbU+2s7AaGl5ZJlsgpo4mH4LFZDgj6PA3/2eSsw
         OPk3KnfhpeZYrAZmzfj+vFY9BdDJpGvgpc9QFOXrJydd34lZ7bzReckEWDqp6/+0ioFT
         E4w+pcp4SaLwPoV8KMXET3VkSXP9ue4U0UQOWMHFJNkrXyxyPwDt6qFk8pQ1bbFFbjUq
         VsfPbgMz5ngMb9CqriSlCCtVnFEbmVsyyxm5Pt0wzK5eQshjccAyERCPjNFWuGkAMSoD
         qCJFg5Y9Dbrfoajx6WCMDqWLniHD5Ubiws78PHpU5nPdHTadcSlFJtnuLzaeTfd+WRwR
         WJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713475; x=1747318275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCcV8YncwcSM7mbOqAKDospz7Y+MQQ8tADbXGsEtAUU=;
        b=EQMsT7aUEa0q0wWIyxGiuy1x2e7ganH1uSZnfrs1rNIgK0WkzfhKKm62gpFdQld9PK
         YCGxe0J9d4mfQq4oTboMfp+YmQaT6eyNTc4NOqrUM+SPkHeVH9IIYOjnTfZ1hk7nq7DQ
         VGt+6IBrwTuyFZTRvyY/m8XSH6BxlXloJgvDc51d/R1NncB/ETPmWAoIuU0BxvSDKoWR
         3U6LbrIpCOeFWyKijw937z7v+nY4HXwDnBJ5tPJIzbeoC9GcWutcB2Ec18TMwkMagwFa
         oyZRFydDzBuXvjjyePIQQsU4HAAYITt/tMAXw7B6Dj7key606JPqzcros+JvzbUf8kXw
         BzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjbfnZ8MNKLhwykQM4R4ZbsKY3pIsLiquTgAVJGedPPNrE1WPq7KgDHGWmryVu2gpyYQa0f0yO47Jy@vger.kernel.org, AJvYcCXD0fZ2nU5FfMv/KYWLdc2fihx6Fg68NtxLJkbFulpFTh8OXUqML/sMzlNGyOjspGR4BpTzVOpn3BsZUKc=@vger.kernel.org, AJvYcCXQSJjMiDdJLf6+8XW5+9suCAORXu1xc1cyXbcsAWvH30sjVmm+k1Wi0aNUDXrSNimcF1A1OXxBc8vdprwm@vger.kernel.org
X-Gm-Message-State: AOJu0YwVs3gMpjr/8sJ6vp6AaxXwIvF+SkB3e3T1gkuj/yGM9jaxaDOK
	TwBjxlMahsLXeg+vfrrq39ULMjsGGsT/Vdb3cAkQ5XWsQiC3FgcZzPFSAQ==
X-Gm-Gg: ASbGncuPW3xGD3fb+A3SqICRNoE5Ye4aEJN92rn3Ngj1AA6xhubSYTFokRhn5VKO0xg
	J+V5UH1EnEdGVl2TdpeFAQpGL+V5sh6yrSiwogINiRCAGXawEimHFP2AWgwBDclHEt4rnVKUC2o
	uNOPpCcmyj1jclRUbdy2I/jcjEfuShycLU2TDLRJPf/NrAMS4LYSj+EbkFYCEialM3/l8WKx1lF
	krc23VKzjowLvBkLzOp5q4giw3o9VZABpp1UmMd55YK791co5+f067Qk5wwViqu9EYj1Ob4EkSu
	5Wwbdu0VPFqqfGTzC9vl7WJxIyb7NOzrN64Lz8O2wDNSX4e/Mz3J4rmmr9f0MeWFfthhWSbK07X
	yK6lo
X-Google-Smtp-Source: AGHT+IE8qLgCLFFoy2skfDapB57Kk5ED1A6kuxp/5PVZLa6XNjsk9TF4vvDVMtDBcqJhFkkfeRH1Kw==
X-Received: by 2002:a17:907:1886:b0:ad1:d304:e2b8 with SMTP id a640c23a62f3a-ad1fccaf6camr366183966b.26.1746713475230;
        Thu, 08 May 2025 07:11:15 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189149041sm1089186566b.25.2025.05.08.07.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:14 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:13 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks,
 power-domain to simpleFB
Message-ID: <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>

Makes the display work without clk_ignore_unused and pd_ignore_unused.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index 5dbca83f22309..c01becca3d56b 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -31,6 +31,15 @@ framebuffer@3200000 {
 			vsp-supply = <&reg_lcd_pos>;
 			vsn-supply = <&reg_lcd_neg>;
 			vddio-supply = <&vddio_disp_vreg>;
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>,
+				 <&mmcc MDSS_BYTE0_CLK>,
+				 <&mmcc MDSS_ESC0_CLK>,
+				 <&mmcc MDSS_MDP_CLK>,
+				 <&mmcc MMSS_MISC_AHB_CLK>,
+				 <&mmcc MDSS_PCLK0_CLK>,
+				 <&mmcc MDSS_VSYNC_CLK>;
+			power-domains = <&mmcc MDSS_GDSC>;
 		};
 	};
 
-- 
2.43.0


