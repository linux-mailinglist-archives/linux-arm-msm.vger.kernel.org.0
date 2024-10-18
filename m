Return-Path: <linux-arm-msm+bounces-34952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCB69A3DC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 424AF1F2318F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD11E18C0C;
	Fri, 18 Oct 2024 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P863KZue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A111CA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253047; cv=none; b=TMSb56tye+3n2RoisQJ0qtpo+5G3k96U5MFpi7h5aI/yOn6gD5zmYWZuMjb7J5ksTCJeuUW8KJMDHF6zkCk7Q1rkoITIfwr23cnvk0V0hhHKcvUVaNBpSsJpvWxj27cJmewkuHsd1mZJEbHfOAXjUUx3wz9U0rLIzCdyP5tY+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253047; c=relaxed/simple;
	bh=G16VMFkYo1lJYiUjqoV5uhRSbc4X8d7pUahQxY3PU5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAoR+fKQlHpAX/f7Sh9fjo7dEVHiKLgNRivsdCQGjqscSgZ/32/k1Gibnf63V1ajnFdbTHduCmjPICLGlidkpb8covRJwMYTUTzdlCCo2DHrSZ87f3tjdaiNIheBF5/om0MqnylSlH3HYSWZCuFe4EYYrN/THyJzVhIWHIi9NQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P863KZue; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e13375d3so2364508e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 05:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729253044; x=1729857844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfCb0bhd7A40KUaBz9hRRbX867xrYglHoInu7Xbi7mI=;
        b=P863KZuerXkZdbLl5rJ/cHc3/qW1KoLQ/hNwp1zw22XA0Rqu26VhMQNshyHfcSvAO4
         WydpmmSZgTuAmoFauANM6hZ9/NfDXWp4tYmmF89zijPUfDcDabBaMkhqPpQ73HAUDskW
         AWMOI/TmCK192E/8P5XJ5qK5A2KzcTqPmAdLAhFQyRQrcJRSnvc+qjMDWgP/NVUcdhPz
         bZ8/fFZr5xwK8MdwUG6FY+24GNyalMs1Qod3C9QFpe1+v5MpMDrlCJoTmO4l/SV9LU90
         9kUWhYltEOfip8qPvfRvF7G3kLRoW4tPJvypVR6bPtjFHPprCMUqq+vDyeOF3KgFDh6J
         uxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253044; x=1729857844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfCb0bhd7A40KUaBz9hRRbX867xrYglHoInu7Xbi7mI=;
        b=xRooW4nRpHYjhEH7sGYGHDv4nppmnB/8irDOzFaxSVht4iXrtlvgkaMlLB8mMptgou
         KY8h3lpw4WdCXfp9O/ze44kav3Plyp+6d9t021Db89OYomwggChT+EWPbkaKuQ4N1D8m
         xdFWXXCJ97muLC5oBPkHvOLguwh1ERsYq1J4nCPebJQ+OlVDf9DwFwcZlOs6FpmRzaH6
         Kdh+X9ICDyexyHIherYYlBPQgJWGLpJ9SfA1V51aYEX0xI5YNMEszQ2/jurp1ZkzKCAP
         qz2dh/Mj0+o+cmLC2PK3fEWaY1Z4f8Nzmu1oKnviRuM6x8Fy8wqDVTtlOPG5EwpKqDcg
         Kb+g==
X-Forwarded-Encrypted: i=1; AJvYcCWuwpdupIgvp7MDz3OTfESr11wgi6jnqRFms4ZPiBSPNg2JgVQCdkKNy4ebW2oWytuYN/fPX+T6CQ3q3ITO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6W0gT3jZWpNjc8K4mHJYFkxdXlYrE35+0gOH4jN2A4p4MNvb
	wyMgios6G4it0N4ZtBahVrMe0wrpTzjDi5coxy2lJs8eI7B12vMcWZjaeQOCqM8=
X-Google-Smtp-Source: AGHT+IF0p+EHb3y6Bb15TCfxTx2WBchcnW+np0ZaXW6dvAlcadVgamxMd0Nd/+bgKh+CYw0YxRaxNQ==
X-Received: by 2002:a05:6512:39cd:b0:535:699b:b076 with SMTP id 2adb3069b0e04-53a15467b88mr1514958e87.16.1729253044002;
        Fri, 18 Oct 2024 05:04:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b00fbsm203981e87.31.2024.10.18.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:04:03 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:04:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: qcom: Add support for GPU Clock Controller on
 QCS8300
Message-ID: <l53g7hbjxg2fe2rezghearuf4bllem5ubn2pn6f4qf2nd3wthg@v2a7pd5zquns>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>

On Fri, Oct 18, 2024 at 04:42:30PM +0530, Imran Shaik wrote:
> Add support to the QCS8300 GPU clock controller by extending
> the SA8775P GPU clock controller, which is mostly identical
> but QCS8300 has few additional clocks and minor differences.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sa8775p.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

