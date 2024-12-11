Return-Path: <linux-arm-msm+bounces-41402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3929EC4AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 07:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0103D168BB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 06:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670651C32E4;
	Wed, 11 Dec 2024 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2xr0OLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190E1BB6A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733898063; cv=none; b=rJkXsaS4OgRMfB7QtK/EnH2Izm31fXizwxvUsz5fZvAuy7rx7ZY4fdVucsExO067iyap6TwyDm8OQkUELpDS0IbL9pFwYlrwh+Tt356MwgZMMVVi7bAt4dc3ZYhPS/n7q1zfpYXWJs7Lil0fRg6hYhzq5dplKd5vpcrNU9t9iE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733898063; c=relaxed/simple;
	bh=xP/3mFAEUu5jGusceunPOkWKJ2FbuC2oApaFvMz9n7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1/nmF7BSLACxU/01XSQCydkbzmMuuZRU532/CSOpQRFG6CwaQybgObHaktI9+8HG2OVnjlAu6s4acybIvpPMMjLdHV/CKLHRzDazifpDeytewKuYWK2bopWOIs4dLd6vVAqBe00AfP227EbRTFPAJrtfC2ncA+3A7D8CJL14is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2xr0OLS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725d9f57d90so2761034b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 22:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733898060; x=1734502860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0d5CzVXzJ7EqY/542DTDjPbVEeRALSf1iz2hJWMyrGs=;
        b=z2xr0OLSC0FDc3zS1dL4jVmtckR7p7MjYHnqbv9sGNTUE9cJGdNbxkTTCbrkGAa99U
         9OaDDRNXeWcUaGl0hEJ9XDTU1WwWNHZAF5rvYrNs9DnXAgSX1YAoUA3FBuac9c83vQfn
         ObMPRDE1go2eQTRy2qz2OrBX0EOgJ/YRSx6T9b2DzjOpVnw9X4z3WPsTtb08JaE2pQyw
         VZ1Qn6s5tRTkDszkAbw7FKog/tiqiFh9C8PGEWiHBArQIS0OyeuBQT1gWgyKHQSI3bbC
         Hw1IOWKbpZ/0rcVsL9eGxigOO9P6Lfn5LMvFWvWEWt2B4PhwII6F0BDa5iucy0cH6X4P
         ABww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733898060; x=1734502860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0d5CzVXzJ7EqY/542DTDjPbVEeRALSf1iz2hJWMyrGs=;
        b=SjQiprXvzWkjU2dasPqvPLV/iE+9uWqcMFhhYh/Ze8QTm/7+nftFPf88G+fmXFLyyX
         jcJ7BSpu7qP0VCRnJt0yvkU73DUpAxxIjcJvLvHargTffCaearusfM2icQeR3q3BNUE8
         5ifimCwbYOEKWfjDAnpyGA0MFNy41vR8bEG5hHI0agz6IMzS07DtRkO6j7ZEqB/EgZfd
         6arA3AVc3YUSnbijqbhlFXPUbxbyMXupkp4qNUrf30a6AvRzupYO256MG218hws1ExO8
         sWCKdh+a0/O/mUsUlTNgSZ+4tG/eV9XBWyvMHXp9MOvdHnvQYrcY40gz3Cis10zC0FQ/
         3+8A==
X-Forwarded-Encrypted: i=1; AJvYcCW1DM0n536kASGl+J124wW77H+TD4qRBAC45p42VsjXA7ZfoKZtgFjyL3shEVgXwOVukq088cuv/TuYIOM9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RtuufcvLJ0mCtO4NjetYvP29c+Jg3xIzoTOmmSGPGSra/YG8
	cXtA8vAb/nFlaWUGU0Id9xTTgiVQrvwU46uWRJDtdS70AL01acalDuGoy/8FsA==
X-Gm-Gg: ASbGncvGrbOnwtUnZamTxfesXSkXLultbvuDzeGclpIhpqcQfPQ0jh5VsFVMpdN9DiW
	3NG5xGaX2V67mbe7TMvkYHEwe5TDFLyYOmKS3PVgyz1O0xN3iFuMAEcV/5MPgNnoJbey8rHHRod
	eTYoNicExIUpHNIdkY0zL9FZNqdRvtbktaEJgiEhUXYcjGD+s/2UuypQpW+GNuoLqkS0TaSG1ex
	kE669TQQTzGk3hr2qGJxh4KLOVfnPLIPWGW9rf2tnpxXqH9HwsRamYznrWGy8o=
X-Google-Smtp-Source: AGHT+IFWvDNrqEB23z/oBgRJDSkzxDUqR7wA2A2btM/Mtu50Ib91aDIP/XMJYo9C7ZTzBqiKgwPjGA==
X-Received: by 2002:a05:6a20:244f:b0:1e1:bf3d:a190 with SMTP id adf61e73a8af0-1e1c13832f3mr2505278637.30.1733898060524;
        Tue, 10 Dec 2024 22:21:00 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7273c7f3f1fsm3124018b3a.13.2024.12.10.22.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:20:59 -0800 (PST)
Date: Wed, 11 Dec 2024 11:50:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, dmitry.baryshkov@linaro.org,
	abel.vesa@linaro.org, neil.armstrong@linaro.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp-pcie: add optional
 current load properties
Message-ID: <20241211062053.vxdpovlmetvyx3za@thinkpad>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-2-quic_ziyuzhan@quicinc.com>
 <qvjtwilukxbeaxnbyzfkdsfkktm6p4yv3sgx3rbugpb6qkcbjy@rohvixslizhh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qvjtwilukxbeaxnbyzfkdsfkktm6p4yv3sgx3rbugpb6qkcbjy@rohvixslizhh>

On Thu, Dec 05, 2024 at 11:23:11AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 04, 2024 at 06:52:47PM +0800, Ziyue Zhang wrote:
> > On some platforms, the power supply for PCIe PHY is not able to provide
> > enough current when it works in LPM mode. Hence, PCIe PHY driver needs to
> > set current load to vote the regulator to HPM mode.
> > 
> > Document the current load as properties for each power supply PCIe PHY
> > required, namely vdda-phy-max-microamp, vdda-pll-max-microamp and
> > vdda-qref-max-microamp, respectively.PCIe PHY driver should parse them to
> > set appropriate current load during PHY power on.
> > 
> > This three properties are optional and not mandatory for those platforms
> > that PCIe PHY can still work with power supply.
> 
> 
> Uh uh, so the downstream comes finally!
> 
> No sorry guys, use existing regulator bindings for this.
> 

Maybe they got inspired by upstream UFS bindings?
Documentation/devicetree/bindings/ufs/ufs-common.yaml:

vcc-max-microamp
vccq-max-microamp
vccq2-max-microamp

Regulator binding only describes the min/max load for the regulators and not
consumers. What if the consumers need to set variable load per platform? Should
they hardcode the load in driver? (even so, the load should not vary for each
board).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

