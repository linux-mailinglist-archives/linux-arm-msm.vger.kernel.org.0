Return-Path: <linux-arm-msm+bounces-78731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C3AC066AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 15:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3877C4E9106
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 13:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20A431B130;
	Fri, 24 Oct 2025 13:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkRXA/Qd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9111231A057
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311556; cv=none; b=JcV6EzNpbWSF1wGW5+tqjD1pVUUxwp7Qjqj38Ld9m5HiUgVS/2Hy/smLGyxLrz/wxmgtcbkLnijzzSR3oRgosw78tFo6SGTwOOOYJpmy1lT8k6H+n79A0rtNVWtj7stHts1tSH392Q8XQ4UPKgahPniuxHj+0TqSzmqNIeTX1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311556; c=relaxed/simple;
	bh=OKClficrmYxMDAQrUO1h0eLa0MMRKmFd9IjAbIgxwhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIU8Acrm5DQymtDFAFvZYc4KMpshYmX1lrRICGr/+4vAX7jeYVUXzhNKUiisCStbWbn8vYz6DUjT5sSgOv5euPxVdJ96B67IDwHYhbn+r70LrNrEmrP7AUzoKAU7r3ReoyypJ0TbC0sVCZ+D4vwE2uE4oWl6G7ipuwHAE34CMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkRXA/Qd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so12019775e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761311552; x=1761916352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvr6GH29Nfx+EsRdL+4o2+h1AfNCPToJ8oczIokC+Sw=;
        b=WkRXA/QdNtxtJrCFjqQzLYldSPXwZQjNebyQX91crgckJ5q+eHO1le1WD2RdflCN8W
         S1zdC/jJj0gfU9mmCVhYnBQpJy2rnotU3Pqj9wKcVBW8NoBHEHMk9nl0gB6pzjommuNn
         ADerOYKxjM7xSG/9pkLgnIqLsKclnp2yofV8ikP7DBOFIFCuQT1Nui5OYnHojxiEmWgD
         BCGihQUWpJE5A4OqEDr3f4nsly7lF5AdQ48BGFAR4FMMdQ598Wq7MNIMi3raZ6/TK7S6
         KiIlCLs4ip8eg/ri5BkVSX6gOAcY7TJD5SllQ07gk661yBY3AHujmNR4YplCaE8VCF/Z
         cdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311552; x=1761916352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvr6GH29Nfx+EsRdL+4o2+h1AfNCPToJ8oczIokC+Sw=;
        b=O7K3VRMAo6k7EYQbz6vB+GEe33cb7mQVMgRUy8g1Tz/OgbrRTcOg60BS55l4OIqG5Z
         kz6pqsiguQ+RegUrNNX+zNMB/vZUOPCJSilS5V0NfsiVudmOkePQDYgVBRyAqhAX68JT
         FoHhAkml/mcS7r4wYQscRYvzhirdVG9lOoYDOsBI8IhWhlNV/3L50zq9IDeVBya2sUOe
         14H4mZNpgs3+fHYOw93dmyv9PCih6WcE84emS1w1ErkJUF17+D5p0rKaIxpU5znne2bK
         fRRU9MC+D3zkgl1DZcOR0+QjVW5w5j4a/2mV5OSqlWyfwkGUocUZeQ/oDsT4iBXxa55r
         ER8g==
X-Forwarded-Encrypted: i=1; AJvYcCXWwwr2MbyRPujYoQY9ra77WcxHlbgLeKUurdAcv9xv0z5K9eaLvPvTHMNsuKSj2jiZGPKwyHgb7X/M8pFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1lx0zvLD6zbQeUuBm/dRA9dAbO0VgHL/qUU8AKWsfBT1U0B28
	iKUT49PzHXmPbLAX5/9LNXwkVcOVCuk0tHg0Yhi6lbVXBA+kwHD+6gRBoTjVB/uUAtHGsLFMEO7
	9lkUj
X-Gm-Gg: ASbGncvwY/Lfjn6wbLjnNweXp/IsQ5+kwC3zUk0qJ0/I0O2nQ8Hvt1wy0T68pGry7q3
	gBSiHns/7BuQegUzHRSBMBz5MRzehUInMYaKfNi8Zk05hPbmBFI5OCKW7QGe6zqR88nmbN6ERWe
	jTz9uZx7dmGak4KtGa48iYKjGN8lzWVji9Buf+aleO2fm/pO6L1bjQC026Np/0eqsSgHOKVS522
	tqpbYtKaUbPwjXRu87eKriez5lxwWzE4QHf4k4S6q6zgkJWP43uN+VW/JktFPGYZhOMaDu6/OmP
	CcUwVQv2+AgbHDAbmHBB5zq9OnKbBokL6Z5qHc0LKNcquAUoI5bIAIihGaftMLuKYMbK1/VpjBw
	g3ap8Ac7Wlyml/3q6RnIyafm/KVoML7o2vqSRxYpZc+hy/nEO42ZK8BCJJ/BDQm2yYmyfNBIsZ5
	7QEOMxqCI=
X-Google-Smtp-Source: AGHT+IF+1xCry/9A1ZHNOGG2pxcFEoxq6SJgtHoESPq3SvPRxcc9P29yK7lzj+svNHJcxN5sWMsJew==
X-Received: by 2002:a05:600c:4f08:b0:46c:e3df:529e with SMTP id 5b1f17b1804b1-475cb03021dmr50372855e9.19.1761311551830;
        Fri, 24 Oct 2025 06:12:31 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342368sm156180605e9.9.2025.10.24.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 06:12:30 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:12:29 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
Message-ID: <mz37jryjovtqz2cqeitosbeznjf6px7444jqxmd3ccmwpbdruc@y5ms43b5wm5m>
References: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>

On 25-10-24 10:48:45, Taniya Das wrote:
> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
> boot. This happens due to the floor_ops tries to update the rcg
> configuration even if the clock is not enabled.
> The shared_floor_ops ensures that the RCG is safely parked and the new
> parent configuration is cached in the parked_cfg when the clock is off.
> 
> Ensure to use the ops for the other SDCC clock instances as well.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>


