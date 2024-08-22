Return-Path: <linux-arm-msm+bounces-29284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1795B823
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C96AB218CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 14:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5ED1CB33E;
	Thu, 22 Aug 2024 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3yNLBHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB161CB31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336202; cv=none; b=jqj9vdjKBCO1oozYcq+H0W7jUtCgFWdcxD0FbnNw330CRhk7lsTfp9nos6SPphR6Obn/b/IQGIgxgAKHsAjtr4/xS5ak9WU+QaPJoVzx5h6chpY+w/TjcmIaAQz/6wSVRiLp8jAekaqqxVuj+ouVV1jSgJRk+9G989e71lRNBao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336202; c=relaxed/simple;
	bh=jDk7djZ3yBNmmo14a1akgkoxNDAqZ1Vtw1K8JBNes+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/1Bqsb9lFT4Ti4N9nRMr69QGfMy/bTE8EcEQHwMHqVEJW59HWcpLoCzgbrkPNuvyPjp5ybGe4Ijy86eEG5vv7THMu8hIfmYQcOb9VuRkMSzudBkm/1FfKpf2pFab5lKVuazvdaUn3TTBJk2iSQgmFxy3B5GoKkWyHhMiQayfNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3yNLBHB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7141feed424so793345b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724336200; x=1724941000; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QXJ1ar6cv5xJSH3ibLaHehRMGwnv2EhTWePpq/2jK7U=;
        b=z3yNLBHBHrusotDhQwZPZkmDksTNNH5AS2yL2MnJWwxALP99a+8zfyhirsH8wqiGtW
         ASh/wIRWXiTruGeqp0D74gEWWCAB+5KzXz3C9/GIhCp2vNu4dHZteRau93SHjYh9JcEx
         kv0axdI3LWYPwciUBvt/pEd3a7GAEYhehsQ8pD+6AU1sSXmD0EJfG5x0XY4eHkj2kYxB
         MgO9buKYTzHqbNLjeMPBOfWnma/FcWjmSL2LpiFL/O8IdSkwcg4Bj/psUEifOa28vxKF
         sfjIfGGyQxLAmnf3fm8wOU7n9DFNs9mMKvV99uBhofS1lpwrJTn3DGRyaYhONzPwRpht
         TJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724336200; x=1724941000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXJ1ar6cv5xJSH3ibLaHehRMGwnv2EhTWePpq/2jK7U=;
        b=oIcy2I0E6kRDGUOkAiOaQha8apRzLP5zIMCfhANxUrpArkP+fxc+/e8sBleIfy6y4r
         QcbT7h16bZnrQzKlgaW+VlgvGXWexzW/Ww/Lg8PxE9LetYrdkKR0ByUg9tRiQjjsUw7G
         x59NPKuSLbsXHxfHDxgsvIV9M4BpMO40t9Z/Ql4D/Lh0gvrFVl9zud/kXfoRKbOo+RZQ
         XjXObsUWCjKdrDYzb6sgROvDCXb2hT2Ox/FYNrUTi0u1eD1vE6cA9GvSv8rdvtIn3xQZ
         KDoGs8ZcoImaQ8UYncGadCRGS2CGWH5Hgyo5W0tCarzKs7ztGB2FfwqSIjK+sdYrCFS/
         WSxw==
X-Forwarded-Encrypted: i=1; AJvYcCU62Fn6JRPoks7jTHOy/DFSx0jIAeqNpzbHT1494HmDOUI2pjeoHKsC+WxitZfX7sVCICcsM2ryD96AW6UD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl8KNhu6IJIHiHHZ7kGwvv0OnFkQluXVdUscP7XPvQ8z1B2ZTE
	hrPZ+r8VCJDUZno6pa5ERK3S9nidQDEXqIvaEKSnzgHCpgDsGJJz4AajiULMUA==
X-Google-Smtp-Source: AGHT+IHkdMQ12rQWFKqMyidkXMfsNYAXd5qOZx1VU5F4A2klCb1RU1PJvqD+PVPCckL8GCL+bgI9tg==
X-Received: by 2002:a05:6a20:d706:b0:1c0:e68a:9876 with SMTP id adf61e73a8af0-1caeb34f5f9mr2439099637.50.1724336200090;
        Thu, 22 Aug 2024 07:16:40 -0700 (PDT)
Received: from thinkpad ([120.60.60.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac985fesm1256061a12.7.2024.08.22.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 07:16:39 -0700 (PDT)
Date: Thu, 22 Aug 2024 19:46:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	cros-qcom-dts-watchers@chromium.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jingoo Han <jingoohan1@gmail.com>, andersson@kernel.org,
	quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: PCI: Add binding for qps615
Message-ID: <20240822141622.tw7vcoc4ciwbydsw@thinkpad>
References: <20240803-qps615-v2-0-9560b7c71369@quicinc.com>
 <20240803-qps615-v2-1-9560b7c71369@quicinc.com>
 <5f65905c-f1e4-4f52-ba7c-10c1a4892e30@kernel.org>
 <f8985c98-82a5-08c3-7095-c864516b66b9@quicinc.com>
 <58317fe2-fbea-400e-bd1d-8e64d1311010@kernel.org>
 <100e27d7-2714-89ca-4a98-fccaa5b07be3@quicinc.com>
 <c80ae784-c1f3-4046-9d86-d7e57bd93669@kernel.org>
 <7f48f71c-7f57-492c-47df-6aac1d3b794b@quicinc.com>
 <aa311052-deba-4d13-9ede-1d863a4f362e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa311052-deba-4d13-9ede-1d863a4f362e@kernel.org>

On Mon, Aug 05, 2024 at 04:43:47PM +0200, Krzysztof Kozlowski wrote:
> On 05/08/2024 07:57, Krishna Chaitanya Chundru wrote:
> >>
> > Hi Krzysztof,
> > 
> > QPS615 has a 3 downstream ports and 1 upstream port as described below
> > diagram.
> > For this entire switch there are some supplies which we described in the
> > dt-binding (vdd18-supply, vdd09-supply etc) and one GPIO which controls
> > reset of the switch (reset-gpio). The switch hardware can configure the
> > individual ports DSP0, DSP1, DSP2, upstream port and also one integrated
> > ethernet endpoint which is connected to DSP2(I didn't mentioned in the
> > diagram) through I2C.
> > 
> > The properties other than supplies,i2c client, reset gpio which
> > are added will be applicable for all the ports.
> > _______________________________________________________________
> > |   |i2c|                   QPS615       |Supplies||Resx gpio |
> > |   |___|              _________________ |________||__________|
> > |      ________________| Upstream port |_____________         |
> > |      |               |_______________|            |         |
> > |      |                       |                    |         |
> > |      |                       |                    |         |
> > |  ____|_____              ____|_____            ___|____     |
> > |  |DSP 0   |              | DSP 1  |            | DSP 2|     |
> > |  |________|              |________|            |______|     |
> > |_____________________________________________________________|
> > 
> 
> I don't get why then properties should apply to main device node.
> 

The problem here is, we cannot differentiate between main device node and the
upstream node. Typically the differentiation is not needed because no one cared
about configuring the upstream port. But this PCIe switch is special (as like
most of the Qcom peripherals).

I agree that if we don't differentiate then it also implies that all main node
properties are applicable to upstream port and vice versa. But AFAIK, upstream
port is often considered as the _device_ itself as it shares the same bus
number.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

