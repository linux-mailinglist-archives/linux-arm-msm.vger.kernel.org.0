Return-Path: <linux-arm-msm+bounces-38049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A69639CF09F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BAEF29218E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D2D1BD507;
	Fri, 15 Nov 2024 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZI+4IsZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAAF1E2309
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685468; cv=none; b=EQ454AeJN5pCQLacRL33eV/v711dIw0b9jOlaungWjDK/oB+XGLDkqKaaIhNrzhUPxzp5+TY5uieSocR7Py44Dr8eU/m6mw1DE7MhE2e8CHUvkLDIwi6OxDd6wgPYoUAURM1UDFmgIuUy8BRUAXEx95Ya1fyJ52QEW/hwe4oGXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685468; c=relaxed/simple;
	bh=cYteiJgMiep2Jq7WbhqHKVo4vq7FKDPN+YhaqgkeWz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHI6NuuzfdjPScGh9nGWuaghB8ch3QIruMklxkYZzY+LBjVQmESdvDW9GP20w9TVn05r844+oXa6biChs+SYEN5OjQueQB6cC1XbcKN5gIAFC05n6sZw3zEQZxwJt9d9gw3emGsP3+ZTQm3C/RL/4opWaGHRhByAwwW0KUsMikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZI+4IsZx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53da209492cso1029308e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 07:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731685465; x=1732290265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sdH3pqIftktD7b0Hp0V8fou6yJyhDjg7N0Ilt5wq04c=;
        b=ZI+4IsZx6nGA3/lASskQBgml6AfXuzTubAKK4NrNngwUB32nHZL2P3C95o4DzR1gkB
         p6SDm903Sab2WwwH8ejhtxwUdHHxh9ie+m6HBLCeMr4RYzZMeScQhkkeOBJvj8HL9Ew5
         tqacVdvcpiuwLpEsZ4VGl21SA4qtzTLRf7rjl1tX/MUXI3BX69qvMpE6MnrVYydLmVAa
         mQuASk1NSMNSRvyy4GK/cJrGv9D07VY9l6co9gQ0PZFwbPhT48wuJNjM7TbaJQfvfNn8
         qzFK9KamatptfPpyp4y0F/+2Iozwt2DcGvH5aXBMcP3ETIVe27vOGVV2HgztAR7vJ7Ob
         ftew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685465; x=1732290265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdH3pqIftktD7b0Hp0V8fou6yJyhDjg7N0Ilt5wq04c=;
        b=gg56190Whsw1thGK6BUSnpqu51FOuMloIVwtiaG4CAqgjuppxzFCOifENap7GZrCBD
         W/yhnZVE0pXGZwdHX464Vwp2LBPEGdOsxrvhqWxCSid3oxsuHHXWaghZUFGXmt4NCwxX
         hKOtOf1yy/VjBuOhlEeA+6whysbD+vzMMmQCdNzn5lNzy6/FyLdSZLDFKf9R0dCr6/4k
         Xr7lqul+ub1DWmmaGvIVMsvT4d51TX3RFZDchnhdxZGgvQHM6KzipwKTFnWB7XJlv66p
         PhFw0gp5DMQptC+Z5wabyZ4GxhBRaE8cQWWkybijFmzKfQ9lvO09fJYZ9eA8PAr2Xvkq
         vF6w==
X-Forwarded-Encrypted: i=1; AJvYcCWtCnvs91J+GajkhP8SSf2IhL9zUL1QTEFfgv6G8siO6oUYvKSK0CbCYZKoYQ7lsP1dZhRIRbEkSOZ78V2G@vger.kernel.org
X-Gm-Message-State: AOJu0YyEXHXCCpbNuYSbSuHNfRLEiHbNPC/oF8ibFeJXziV8hGHNyuST
	Q9Mbwak4tdHpsueNiBxFdfjiAqNBkKF2lUw2xk2QGuLP1kgdynLmaGdPGDgzB00=
X-Google-Smtp-Source: AGHT+IGJ1Z97R/E2OYInl5zxgQC6tLV8/0ODPyzxE/Ts3mGJtyeMxbpeIcLnxKLkaL3O0Q6QejEvhg==
X-Received: by 2002:a05:6512:239a:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53dab3bf59amr1563656e87.45.1731685464495;
        Fri, 15 Nov 2024 07:44:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da654896esm609949e87.238.2024.11.15.07.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:44:23 -0800 (PST)
Date: Fri, 15 Nov 2024 17:44:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pmi8950: add LAB-IBB nodes
Message-ID: <aplxl5e6pakuvpv2sgfesib5e36fw2znyt7a2izwumoodokpmy@ochpnj3w6pcz>
References: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
 <20241115-topic-sdm450-upstream-lab-ibb-v1-1-8a8e74befbfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-topic-sdm450-upstream-lab-ibb-v1-1-8a8e74befbfe@linaro.org>

On Fri, Nov 15, 2024 at 11:20:53AM +0100, Neil Armstrong wrote:
> Add the PMI8950 LAB-IBB regulator nodes, with the
> PMI8998 compatible as fallback.
> 
> The LAB-IBB regulators are used as panels supplies
> on existing phones or tablets.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8950.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

