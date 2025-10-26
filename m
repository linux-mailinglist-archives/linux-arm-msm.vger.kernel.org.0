Return-Path: <linux-arm-msm+bounces-78819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24057C0B0B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 20:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C1BA3AEB14
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 19:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686782FDC30;
	Sun, 26 Oct 2025 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTChXUf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4102798F3
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505360; cv=none; b=hrhDoQGuNRsg1LqrPnw1QihMFiYYBTFs4SEUQxCQRJJuoOx7DJv5uyZ0AfagZIXA+YXYKQ2uoeuILdAqzGjOvNX205zRKKu92LRpP7orhDSAf1NbS29Wlm0Up5zizJzwlO4fybvd4tPd7Bus569PXkx8C4bk5npAF8oAUO+NtfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505360; c=relaxed/simple;
	bh=2Zk64nIinYp75+zdhYO2p5F5t8LO7MM1BYxuCH05Bsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKyxw46QAsriapUghBS1nEJtVHjyYkRjBUn0dvHPBC3FCf9sdYjGrYiVUlbHRUsOv2fixEj99CZXHgBq7yqe6EfUGZg8rZr75utx+cJ9IDXLb1Xx3shu2mVq4TJJ08ZppfsQQBXeJdWZZRqL8Un6X04SCmzHbSCifWvnreiwBDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xTChXUf7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso2791909f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761505356; x=1762110156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTgQLFpDzOTh0ZoPt3i/pwuz2uzBGwVH7SJBsVRuI78=;
        b=xTChXUf7p6MpBXoFbVAcFVB9wWym2dF7Dd/8VFmhZnZdnfCpYA+k7EKRndFOgJqTqh
         Nzw+W7wYIEjYxbMjSeuTnpAeykfIHxnLJUc3C2OSxjOx5lMug1qmaJQaUjY6RnDqYZRc
         M4nD2JsTPK/3NzTDFoYDdDeNjDCnGNFxkxGMWr3q2PLr1lXlH4DSxbOBryzDe0EfPZMX
         UmjvIRM5l0sDDKy/w6kiyOPzfiUJNerI4Q9Pf4ipYsfbPRu+8oZFgZWs3V/H1gyltrCp
         XHZyoyQHo6+drdZJKLs5/B3P52yDwX1qFe3LNp8QY9Vxtbdwk2enfvE/MrjmJZ9+Yctr
         InwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761505356; x=1762110156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTgQLFpDzOTh0ZoPt3i/pwuz2uzBGwVH7SJBsVRuI78=;
        b=RNYsl9YxntMlOYuCbw61Jda3lkk3MDDnrM1OEWV9MyWMd42Y66d0KYd7ZyLN88C+hk
         ZxN9Mkj8LFX/L6Gj9nLQ9bqe+nFrIsgLpG0cwfSr9DpBUV+OuZaazqhuFBgCiJeovo8k
         d2pWsqy4SnFsCjzONrwJ1p6yY3aUWXmo5MnUXhDFg/F09BqUNkWd6f6QAihcxEm22qHn
         V5+c2QykEQf1i4NshNSTD70Ny94KluW3lu9HW3w35M2j6Oox7pi+2/9AMeKa6W7VMFJx
         jnZxVFbOsETx7AqVbCjqIFMEsABBn9IK8EXWEpJ0JWp3MRQ21SGclIaxjsfMkcWYFxYx
         mSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF91hCJqil1SvjFW2U7UiG39clyBcAvAoYTs9mb+qE6yIfpJL0AVBVFW4dnmRnyBEcJqH/jmeBC5zXycEM@vger.kernel.org
X-Gm-Message-State: AOJu0YytaRuN8bhMt80bsbLBPM40+QVOyruTFfpR8hvERGOd+gxbAaK1
	WPFhas401HfYjphL0S4588tH4SY1EWJeQJq69tp0AvzrlCzn5jli6cx78O8L2xORNVk=
X-Gm-Gg: ASbGncuT/ID0K9HhUXXgmYMaiIIEhAfZ9jQMVGVBmTDkfSBCabEwbTQzmd+GfxiNOYh
	j/qkxYdGioEy0qfkvU2IyurdObNQO6JcYF6E6wE69LT5zMgoVKC79nLr5QC1DzICxh9HRSHAfMQ
	wJrL863izRTlYvaTXF+en5GglekLhsfSWjWxDbUHXmPEx6S9/czPg3hGvupe578ZNNzeprSr+ld
	pKbZL73O8lu2LSC8CCnm3+8DRJb5MqwQOATht7voCdMp2hahHu2v/HYzpZlsMRrmLM6UflRz84J
	3se1QVEtDOl5ybKHZuDyJYjYn4i36+tIgNoSobHNYUQiwbvuo5elegFyufcubbpAqJBfkawuJYG
	+inaVi1llKvmkNw6KEWleZ1RrVhLuXz+Rgucf+NNl7ST/Gc+Fok3A2cmmktU4b7Q8hrCW2/AtoH
	69e4pZGYM=
X-Google-Smtp-Source: AGHT+IGxHR5B1DhcUj3Sg4f6YGF6eRKC27Zj/+bUenMC5vwB5qpsgIYVS5DHdOJagXUhkL1MGGao8Q==
X-Received: by 2002:a05:6000:22c9:b0:425:8bc2:9c4b with SMTP id ffacd0b85a97d-4298a04068dmr8285438f8f.6.1761505355881;
        Sun, 26 Oct 2025 12:02:35 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7badsm9698313f8f.7.2025.10.26.12.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 12:02:35 -0700 (PDT)
Date: Sun, 26 Oct 2025 21:02:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V3 2/4] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
Message-ID: <wqkmiumkn4mha26jlky2o2dyplchz4c7kjlhgkictlep3gjoga@6kxhawbf2ytz>
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
 <20251026111746.3195861-3-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026111746.3195861-3-sarthak.garg@oss.qualcomm.com>

On 25-10-26 16:47:44, Sarthak Garg wrote:
> Add SD Card host controller for sm8750 soc.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

