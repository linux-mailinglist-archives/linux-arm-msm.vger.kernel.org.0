Return-Path: <linux-arm-msm+bounces-48598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F1A3D089
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AB287A73DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85F01E2823;
	Thu, 20 Feb 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqbB5WL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41F1CEEB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 04:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026701; cv=none; b=cM8vH2AbBiWVBVkQPw7xmQfThzUaEm7tRqthaj11SVjo78nk4psxsS6wc1oOgiH0TJtYFj1oIFHcU/CBDpO6yGxqVoEOG94E7mWIJDzzScBk7fT+IGGGFRBMsUtuzuBWmzBUuSpCJZzowYTUy5ka/NRgK/jJZfAqagAj+9U2yQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026701; c=relaxed/simple;
	bh=d+iFZuxJO7eL6REewH1kUH0Ywtv4DV1Yvdltas+I7T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfZV/rJm8cY5jygMmBjy+YBhS7SMKhnn+mOtLtcASoLKeHCCHlD1B7Zps9JF915fl0AOpdIMaRfgyyZlIAmpV0xzJSndUmv5/k42UWLKHtQfUQVSUHWtIcM/TMw8ZHMOkB0RRTGIvTfD4H1POzU9ccIZEIHD8UHkhx4Rd2l0gv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqbB5WL3; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30797730cbdso4773911fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 20:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740026697; x=1740631497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtYcQ+2FJMDcbUz4z18Px8ZZK4xLqjkYjz2BFlX/9kQ=;
        b=YqbB5WL3sWglGXTy1l0wH01PYt3OzIX+4ZR7fvWbF8hG1O1YzAr3P9n4mIey4DQXX+
         2znfuVY9QBIpCchD5aK5oE8QhjrE7KZu579u40ylM/v4qukhFSqxvCYsU/vD6nIsOy5L
         oK/4tUAtfmZHB3G15A8WyiGL+UL2iLIEy+TP/CKrVgmNI03wC8tBBlI1ggmKYe03WKWU
         ua/jsgDX7TtMLVd5/Np4ZDkUX0ywRWiHKfqQVqzBEU/LlIMeWTNE7SnigfoVjEclliNY
         sCW1Gr4kyL/JjxnsqMEMmBDeYtXI0sV8XT0QGT56rpOGkkQU5LOyDQc0P6NV/SryQHyf
         tjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740026697; x=1740631497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtYcQ+2FJMDcbUz4z18Px8ZZK4xLqjkYjz2BFlX/9kQ=;
        b=D0M3dJ982S0rsl0zJ6Ro0q6SeiQQ2Qnomtqqk99xvm5YjjlNFqh6UdHh57/avMkPIW
         txWn6Y0WWbyXXuW68C+IaPJZXvNUUYRoYAac85z8mrGGrbgqDNxOQ9nKzWiaNaId9H/8
         jzwmvBemreQvgyGIxoSvTZIb2b6GwjYiCiskotlCSSr/j4Ev9PiK7/8lK01G5MJOVK0N
         /52idxM6ZfYWjyY5SrMcOHegXBYxLcBwRtkXwK72Ob2J+RauON5AlNVYmfEYwcnPOFmK
         3k0MOZyx3stR3wtNUhMfY823xTCjvHYaU2hhLdwz1sV8nhYPWAut83ZbX8n9cxq5CecX
         aHXw==
X-Forwarded-Encrypted: i=1; AJvYcCV2/UQm+Cst+D2TlQYW/TW4zw7R7EhyJwNzgb9Ha28ulJZCBiW4ru7HSwj7FkUkQPXdDInUdU8wc96SSsZq@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXcITQKLKmi48S3qVzTJ8V8zTeDCAhxtr8CO3D3EHvRpRmtNc
	jWR938dwwW0Xbzyj89cfzTybwCF4STo/QbjP4KatwqTziM/olvY+7GxA8vIGSmA=
X-Gm-Gg: ASbGncu/+t9SbFWdYeyAoQTPFMPnoUTWa5Kku5+FY3Ylf+b3g3IQp+kd7RU7/FdMYwV
	zL/PUmansfrxOxdHYP3NNhmsawQvTWtzzdJgdRUhI+uGc6lzLaCFQ9C/D/3f5B6pBIBXGVmqhNe
	dr9GVbS0R7jFD8iY9o2gLaPNoqtbZ4f5mlxka9vuy7pJVcQoP5Tmpf5h4Gr7dW5yiUHdP4JsuRw
	0co95HDeP+IUqlm/omMKZvyRJmgFRs5VvVJDaplOmVnw/d4f7v+C4DGmtSnFlIjFUNTAiM4eW4L
	5wlGLEx4tmnDu5W5HZ6RIKqwiRrHGS7v+JwTMrtDBUEro9rteJsYGhTgofC94BukaCdFWPU=
X-Google-Smtp-Source: AGHT+IEwZ0li2gmqCbbSb/xDJ0sR4BsPeqpGMzMpoUos8tWg+NSjnr7x/0yyIj4p3yB1OUI7BBnjQQ==
X-Received: by 2002:a2e:965a:0:b0:308:fbd5:9d2d with SMTP id 38308e7fff4ca-30a45062d78mr19375761fa.37.1740026696916;
        Wed, 19 Feb 2025 20:44:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309a0b59bf1sm15738491fa.59.2025.02.19.20.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:44:56 -0800 (PST)
Date: Thu, 20 Feb 2025 06:44:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: qcm6490-idp: Update the LPASS
 audio node
Message-ID: <kaswrgmgmrgt6uukevi3oon7mcrc4hlfyewx5r3os6j2oyhb7d@izgybktb4fst>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-3-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-3-68dbed85c485@quicinc.com>

On Thu, Feb 20, 2025 at 09:52:52AM +0530, Taniya Das wrote:
> Update the lpassaudio node to support the new compatible as the
> lpassaudio needs to support the reset functionality on the
> QCM6490 IDP board and the rest of the Audio functionality would be
> provided from the LPASS firmware.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

