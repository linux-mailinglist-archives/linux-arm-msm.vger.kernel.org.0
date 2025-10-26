Return-Path: <linux-arm-msm+bounces-78818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60CC0B0AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 20:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC8213B5A6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 19:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E77B2FD696;
	Sun, 26 Oct 2025 19:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjC56XyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68787189BB0
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505245; cv=none; b=X7jKXm20du9tV0XW5VVXv+c2vXbvGeLpcMWX6dz0gpZjQthdjCLGKSySb8oo1OChsN4dT88PzYlZv5KLbob7f1MgBFaeg2ZHqzo3hjcqdcDrVyBAKiFU/kWx93xQRmR26prOXLHdKF9a5LpQ83OGYymBQEdhKW48H6vM6/nmeTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505245; c=relaxed/simple;
	bh=3Q3b5GgkMN7A8E1Ye/bKL4jzRNvu92PYm7G3eWiosaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzB/2qRUTUq1p35MK1wb2JA64qxW/ed0rNhPNFvSAon/QVzc8ZR0Mlg5YnRu1Y8DvfkqekJsjWVqtIiLfzymDsVRfrp7fcqj4NDPI9v0Xr2q5YbfVghKps1SMeIPHmbJup4QI0efXuWlTa3gXwhajKb1tNw6rEFpGw+A1mNGPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjC56XyQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso1879581f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761505241; x=1762110041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWjeXMPyNxQIW0i9GzAqz+QiU2LzBuikp1Z6CQsw3Bw=;
        b=JjC56XyQyFTfbiXAHUPPIyTaLo3ZJFhNdFovyrOKQcwi2YVsgpH8D30hFg519TmQqu
         zSqzdxIoY3uokr4fj72B3ij7kp+flxuwz7+qXcsS+1kN6neYaxkFD5qROa1936jfO8Wo
         c8KWHpSw4OIN02BCu1ozpVX6wpg9Fod++7pMi6H+CcjVdoEmPYijBY03CTCNS9ZzF1a4
         kL7EMIa3Xx7x9o0/uYtwizStyMuQy6IEUt+ta25h8m5k1vMtTCcCHtNRRpAizC4yyrDe
         uoF5YQBRSq+7V9QFpqoHoOBlczRtEGma0edxw4WozNa8QU4PQqcd75u9Hlr1sPcU+Ng2
         WTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761505241; x=1762110041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWjeXMPyNxQIW0i9GzAqz+QiU2LzBuikp1Z6CQsw3Bw=;
        b=B2coh5/f3YszX7B5WIHrPjzoya9d5PiBSd22b/5uzaeCbdjM8ib9ETCZB+OVo/ozPE
         YVskhNONSU5WNXmQKbjJEt5DiREgm6DfeBOxUAgiQxQXO5giOXjmOg2DXn8sKLWBpT9T
         6OZ41NrLym8sVMzVlyCE2wxoslEXMSZn5KAPVqPY1rT653UiGDjIiVASqR38ayj7eiyV
         ZhrzVJR3X5XkcsgurmrQwzTzIr76vH6oZkWfOh/06FP1PZ98jGdHi5x6/R47FFK47zyA
         LcKH7n/22VuiM5QivEEFXVZaun/36v+aDK32JbbKvtVzSLwGbyOx3/tnFs1zieIoRT5u
         Yabg==
X-Forwarded-Encrypted: i=1; AJvYcCW2273A3lOHRqVq7Gf04TSjC6ceiCm72V0KLiQ9/bOY382KeaCeImBsdtRer+qQA5+Grkxr/QBVK4vuX2ZB@vger.kernel.org
X-Gm-Message-State: AOJu0YwJpr1lhtwECbmGfGUsH+Dltj8h4yBzdCxevwoK+5I6EyUL2Owy
	kVaRmhYTpbcUmOxuBR1Teh+ryOVMsfdkZOhlHuUtAest4JSrcKXn2vvOAMhFt5HYQeQ=
X-Gm-Gg: ASbGncuCU3qqWovPxJVGCrGe9nMqtIhUYdYL9A4fga9c4F70z35PgvG/WCO61wKzc9V
	dWCAah+g0WP0aMZqId9VLsEHVjoAtcSwO6rr9ciZ0hW3L4Az0ixsESQy+OzDwsX2RKusNOfjKx6
	nyGEmZL1CUw23gcDu3X16PcwPL87Tob8ageEqgDpTLZkNrIJbh41qbPEcvDqdYV85dSQnk8WZ2d
	rIR6y3zscP3grTsFzadW9JZFhvnUW5JUbjS0R1rN8JsJQuvCO3y7Y8eXrKs6Sa+Zt2wkf+cBuK5
	1HZ5V/nxcMriOiE8leAVRpAtG8UO2GGQB2xoiwhv2mm9BkkV5loaYbWEn8+wZ4h/28TSve9Gik7
	T0pti/tkgBdSal2LrYKG3zh1SHYssKXSc/2KBYvVEoB47cP2veGblUHAZmkuJuo3MHzVgFfz+
X-Google-Smtp-Source: AGHT+IGZ7N6ulprujb7qEVdOtn0PLcuo5/p4E5IBnLRyLvfZJGqbZIZWqXl4kMRUT8H7LjxiyF7gfQ==
X-Received: by 2002:a05:6000:4909:b0:427:53e:ab25 with SMTP id ffacd0b85a97d-427053ead25mr28534724f8f.49.1761505240687;
        Sun, 26 Oct 2025 12:00:40 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5985sm9798883f8f.25.2025.10.26.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 12:00:39 -0700 (PDT)
Date: Sun, 26 Oct 2025 21:00:38 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: Re: [PATCH v6 5/8] phy: qualcomm: Update the QMP clamp register for
 V6
Message-ID: <bdxjowtabqvhfskxik75sflqlepf5qpaiuqupfndzwphkxydcy@zjuxh7k6bgqo>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
 <20251024-glymur_usb-v6-5-471fa39ff857@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-glymur_usb-v6-5-471fa39ff857@oss.qualcomm.com>

On 25-10-24 17:47:43, Wesley Cheng wrote:
> QMP combo phy V6 and above use the clamp register from the PCS always on
> (AON) address space.  Update the driver accordingly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

 Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

