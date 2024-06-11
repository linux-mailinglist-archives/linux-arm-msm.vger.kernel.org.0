Return-Path: <linux-arm-msm+bounces-22327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9C90406E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 17:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C42811C22ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 15:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6369A3987D;
	Tue, 11 Jun 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwiXetjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1003381AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718120836; cv=none; b=PJ0+GtpPFgWKlxjT86HadqgqrXFwxQ+kqpWNAw761vuihNHIptFjO7oboGAAq/9WIdvAv4iuksrCXzHR0CmxMyJwBlRV/D1KI8KFmRCPh07CqIUomM/6lfG6Z9Vn6/ikHeprZ5KhbNmcsXdtNBDr+kBOeUaqtHTh0AwmaKWm9K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718120836; c=relaxed/simple;
	bh=F5BWENXEo3o1WWI4CxCWwY1vrialDPlJgFzabTHdxUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbKJE3vlLdavrcxVRfuDKhVVcq1v+B7o9F//Mf2P/SOmtroNtjKTbSG0PSddFAJLJkkHolO1e/e3ne3vhRXm2GspIaRN4Lb0KRVoaCi5Vei2pyYX8mlfmnnTAtdYW11lXc9db4JmVpK5KkOdc2v90Wma/jpgYPxTI1rKj4b8Mjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwiXetjh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c525257feso4243985e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718120833; x=1718725633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nw8/LuxiTJ04FrRfjacvt3XWvtMEY1Dsg0HiFZPTY74=;
        b=ZwiXetjhE+zy8f/csRnJsnVF6oXx2JL0FbnJqcLUqeTBFkXUYHxfY40mlKSEUwCbsd
         kaumfY5c4gSOWNCZbmgMXHmT46jar21cajZWBlGq9MRlYWz9tWp6sNo596/J4dnbY7Qc
         ggR+qWJrzR1VMFr0eRFW+ABiKb91SAxKjz5Z5cHtv/sKvAcQYXc7wKOxwl5JwxRcacCK
         TtaJjQKRZxiFRsixUjpXcOavB5Y/W0pLjKD2fIxIuJiXkU5Vp6EfNqMTIZQ+Y5uqAQJJ
         /AiS1XChQyaFNDomP51MtGMNJU2Q9giB7ccU29tOwrTgtWaZurCFi5Ywk5MUHtNFkGC6
         n0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718120833; x=1718725633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw8/LuxiTJ04FrRfjacvt3XWvtMEY1Dsg0HiFZPTY74=;
        b=PFBKmObKAAoBxQ9OffFRS7oW0m3YlN7ju9dDSM6hgm3xzVJHqc5QtNMqPOh48xcxtZ
         sQfVKz1bHR/jIYhgSjsl4wvnBDAqqXInhzN2vDMN5+gpy/FyTJqySFpRCyJGdcYUODxS
         4/jDMRbAZ/4ku8CxGRM1lbKf7gxcVMpYZ2QAZMhppcj5gA8nLTFdKG8PR1puJOlYLzd6
         xgQMkb0p4r1Cv9jgZDL2beFCXB6dTkUQU7P3TVETZ2LToDcy71oviD4wUDwKCCgBBJ1w
         j4ht1xhhb6XXXtm+p+xKFk5ZwmaQCu+2fpjkLqIKy7h7I6bTa9WVry9MzIN2CjmVsLFK
         0oYA==
X-Forwarded-Encrypted: i=1; AJvYcCWgB9aaZxNlEkWJ+1pOczEcw2GYTg3fyJgkFjde2Ck9W/No+zlxjSJIPsCTZ9ROR9M/OaJYTCg7HPcrzW/yp/4uq3gz8vpsWByFi+iJig==
X-Gm-Message-State: AOJu0YxU9TOzisRcwkiNIUw62JHHZ8alluBNc3k2TZne9OA9L+hnXqko
	+j4uOmy7Mou+UPp1suP9Qh8QiIc7iSJZs3v1Bur47tD5OC/FvfVi2SS5R0gVJBo=
X-Google-Smtp-Source: AGHT+IFHillVbdPIfFDh7/7ug2ke7MoTVtAgBViv6Ex/VT0dLFNs7Kce4qyvplMjkvLsBubqW+QkLw==
X-Received: by 2002:a19:3846:0:b0:52c:8051:5799 with SMTP id 2adb3069b0e04-52c8051599cmr4531904e87.11.1718120832839;
        Tue, 11 Jun 2024 08:47:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c80d6b04dsm1471344e87.136.2024.06.11.08.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:47:12 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:47:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
Message-ID: <5z52xmqrgngi7xckhner34f2wgnmikkhmvwnxbwvhh7ixhj52s@5yofsg7yr765>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611133752.2192401-9-quic_ajipan@quicinc.com>

On Tue, Jun 11, 2024 at 07:07:52PM +0530, Ajit Pandey wrote:
> Add device node for camera, display and graphics clock controller on
> Qualcomm SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm4450.dtsi | 38 ++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

