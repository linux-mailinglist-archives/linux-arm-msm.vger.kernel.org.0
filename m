Return-Path: <linux-arm-msm+bounces-20569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9498CFC6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBFFD1C20B50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB7D6A8A3;
	Mon, 27 May 2024 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vH/DuRUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E9433C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716800701; cv=none; b=R/+dWge/BwRLaTmHtoJXFsVVpuhvlt0URf5aEyncx+3yEm2JcU7SaDbnpbqQSTUBNSc64xjAeULQBMWX3CoKFLIoLkVPm/355I8kppHU5UVzHoHU2iRCL+LGwOgzE+CJ9Kusk52i9dGkEJgyHFhua4oEptR1EQtP9hCdnfxZuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716800701; c=relaxed/simple;
	bh=lCkatABB5qE+80NuM/7gtP5bXQbnqCgUTAsUJEIq+/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alkGNzpncprVoFsK1PajaRVUN6/1EopSgPKiKW5uCOPxtb+JnfDGILwx/yrJMFeqL0AK0fddH/Q34TB/UTJKbuBbB6o5lJxm49w3S3p5c0k0cDlvI7JOV5DJxJ6tFsdJGPi0Q2xnYXO6FvjdwlDMlH7wbYX1YbFUB0DVn2Aj1IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vH/DuRUr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a1d5ee2so57279591fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716800698; x=1717405498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Kct0tf/YJNMu/6x33HcGbT8GgyNCLw0zNoUOIeT2KM=;
        b=vH/DuRUrazwpsUeARhxX/qEDI9gBteXOp+wjxhisPGaf90zNm+mklvN8jXeScZD5Z2
         dB40fs6dR8GVqAyve0mgL2hnxV7Rb16Gl9taMfqxUs198MKs7cCYgWL5M7a1JMROXMzQ
         CbQUpbgYB3jh9+2763H1Fs1HuOB/BWfcD02tHuCpxKxhclbTcq/liM8JMdskfk0s997R
         c5HyUdkqGJlfi8s4Y05Xl5AWOeFdwC2e7i6C6Z1GYTKRVPKjcsoT6wWkpINIAxjGQc6J
         NYa2uUNoypN+y61ceze8VniyVWwzJtuxdpIHrxu86toElVHDiZyWS4inDCyixQF2AJrn
         OSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716800698; x=1717405498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Kct0tf/YJNMu/6x33HcGbT8GgyNCLw0zNoUOIeT2KM=;
        b=cKFPQodWZbLlvLhDcskDKGt/bgdCwZ4IOJNGQ6BwvzGCyRk9MoFHt9e0BAG2Aa+4c6
         7GZL84HcjscD0WZudq2GO571sV4Fck7v7Yg5dejVUwP4zQufL9iEOLAxvb61WGUZLvTE
         bAIs3n4SnJe3F0nNFjFNIAZ7EQOcFZBWay5lum1jqdA/ljgbCwMF+ntAYwXRL0u1dB4N
         guRXUa9n3J0Wjb3mZ68332w4GmsmcA1ci/vaGZIpqatTlQ1UTwY/eWxYo3YzK5CKgkoB
         64vlshuOQSTuTDQlgIC8fKNVAeGZjHwOe+SicXEduBKzQ1i1E0EVMg9GXLA387a6BaXq
         6rCA==
X-Forwarded-Encrypted: i=1; AJvYcCWXWd85S1PltVQKA0Kwj5M1QU/mF1WcEQjbyirFRR8BQcs8unDagA5lWzYsKemwQeHspMt0wMVJQ+Rf5QT2d+34T+PnWsn+giV4XjNHSQ==
X-Gm-Message-State: AOJu0YwM8ZDwnYVczttnpS3szeKi14ikYbrE+uKJ8bPGgQvSZWepkaF0
	qRZN+yQccqEnPTVy6bm+8zjldWorSiHrPGETpWXPyIOu/TpiNZYV/3njVyOGuWE=
X-Google-Smtp-Source: AGHT+IHEtnRhG/oZq/nIMTgh4haWtjmSaREwjwmnH+XtrXGGNLA2aYrcPng3SWVQ7vbKRRjs/4F1Lg==
X-Received: by 2002:a2e:9646:0:b0:2e7:bc7:b6f6 with SMTP id 38308e7fff4ca-2e95b2566d8mr68365361fa.38.1716800698324;
        Mon, 27 May 2024 02:04:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc4ab4sm18760821fa.13.2024.05.27.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:04:57 -0700 (PDT)
Date: Mon, 27 May 2024 12:04:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13:
 allow 4 lanes for DisplayPort and enable QMP PHY mode-switch
Message-ID: <mfcofztvemowz2opn2fckszz4z44unhuxnhyaqvstbtqewzgzf@y4qo3ja74deu>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
 <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-7-a03e68d7b8fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-7-a03e68d7b8fc@linaro.org>

On Mon, May 27, 2024 at 10:42:39AM +0200, Neil Armstrong wrote:
> Allow up to 4 lanes for the DisplayPort link from the PHYs to the Controllers
> and allow mode-switch events to the QMP Combo PHYs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

