Return-Path: <linux-arm-msm+bounces-69879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB2B2D5D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 123545A5063
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5EE2D94BB;
	Wed, 20 Aug 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDttB39v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEA52D94B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677545; cv=none; b=jRI8Ij9MYCSbSsIgg4fWNRniFFwCx+JC03Rpai6e+bxyHJhsMuP2MRPzzax0h80FJIlV9O2suP76x3e6C0TRlhoe2ZqrjKtIaZtyxC3OhYJO9Zp0du5TylsJWVhVlZ5UfhfEbxrObeJpO/senz2wscGK+rfo9+wWD9IcgQctr0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677545; c=relaxed/simple;
	bh=haxIZUSQiCuxxydJqegXR7kmgNO/8Jz418zQVwNhZdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4fvSG/8jD2qbDE/UstFhIv+o4BDAKIMXEFLtzhGMYYdGaQsifq8OJv5bhIN4+u69inBr+6ZR0JlFSQ/mDMxCos0ThquMD+tEj8teIHOly04T/pLDBC0eMW4kVJHjJGySE764RTcOBme0QaxaZAFyn4trfeMOfuotxBQc1jVTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDttB39v; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9d41c1964so3958987f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755677541; x=1756282341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5mzBsBALiqNSttAJPi9ae9mbcrxgDyj2N9OaXqec04=;
        b=TDttB39vNVgcDXMCRMXQZAUW/dW3b/aSOKOuWiHfEP9caMeZMOHGWFBxYOV8VLkpql
         3jzUn+17e4VwsDQ4cO3Upaemjb9dksdjVTDDBcwmok+Hs6aU1qmFfMDhmDXySqsdBj0A
         v++5HywKPNDRMU6GUMaA41QFD2IFmSfdifuVhQG2tkbraEN+6B0V+qglulxa2oDh78/5
         NRtl9Fk8hIidRXGADTiO6+a5sWfcDXvi/PvUZb9anF++AKsqmUx8o6BThyhCDrQzOj5Z
         YB7vWN2W/DXiWClPPtMrOPZmqE24vik2J1fV74Q2taxaKAkcOlCkUYH+/g4HK1Ov1Eq+
         coRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677541; x=1756282341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5mzBsBALiqNSttAJPi9ae9mbcrxgDyj2N9OaXqec04=;
        b=vrU2OeVkRVmB1mQTdGrbAX55KZcB6zEH7KV/q0j0QmvoYru7o4VdKG/Bl7O8ZGEuqH
         EiKZMSIhsw/+J2ttCU1KeRCAs2teyBOC2apwAeHF0FYHz+zj1OlLNLHDq96Pul1EgW4k
         3+BgVAnRpvXSb+2ltlFeXGF3Qz48cx9Qkwvt+Y/qUZZ1RMt5aV26hFN8FGohzwcPZbbI
         GDqCkxd5yz0xuDEW7WcXc7blx5kQ6KyK7qOpUcU+WuC1IoG8sPGOxh+T6HnMTXN1FFhc
         TjxvFpfy42zMKd/zeQvJv4B8vZDkIXDodArKmzpKwYzEQtU7KP+OMLJGFgwVozeXoB6I
         JUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoBCFU5+NpWNDpg7byZgjfPUUGgDnytytpR9x8Njk+kWcQvfHs0fz7vElo8ix/co8L5452jma1dit/7hWp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6s6R4RRJmZjKPFptV4SMYiQbybmBAVHzIiDk7Nq6XEHmlinmc
	xa7vSeAZAUBgUU7cxgT8608qNJ5WKuWQYKN7Yj+wfRlhlT/vqfq/9TaYb+HqdnojqwY=
X-Gm-Gg: ASbGnctkVDoFGi9KQpzU0tBUyP3P4Blozc+A75BVaNrYOoj9dYRybtLVNUnYwNfF2+I
	zYYZ3Rq4WbVaepaQcZSVs+iFkfj7FBuBsx2pTKQqZFtbz0zzCl1TATiZx8lfomNtbx6o0uILmck
	vNAgVfO74Iw8UD/QMcmwDji+MJWB/+uculFRXx8Q7GKmhSZbMHcNOOX+Uz4PAbojwULYhHdeXpj
	cGz5tC3sBnUWQV2ZI4Hl5XNxHvPIkvU3yAVo3N+VZg8Dux1v73elQFS0SOkIQfGT7jqSaCC+M0p
	VGtYqrCImL/yRAHYvYYcGs23vNhJ5nhheLzUfWHAJVju0LOaY4uZJx7jYm2BSCGEzp8HyM/cred
	reBBzx6G9V0TUuTGEqXwfTw0ymnXERvJz8TU=
X-Google-Smtp-Source: AGHT+IGuQH165HnaQTwksDDzZkNVZOjiFfhmMoSOhDlESgJ7dUKSOkqF1KC3ciNT1El2t1RjmBhg+A==
X-Received: by 2002:a05:6000:2404:b0:3b9:1697:75f0 with SMTP id ffacd0b85a97d-3c32eccda13mr1347315f8f.56.1755677541336;
        Wed, 20 Aug 2025 01:12:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:8a2d:c0da:b2f2:1f41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c57aa0sm6687179f8f.66.2025.08.20.01.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:12:20 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:12:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <aKWDXySSt57tXHVP@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> The resource table data structure has traditionally been associated with
> the remoteproc framework, where the resource table is included as a
> section within the remote processor firmware binary. However, it is also
> possible to obtain the resource table through other means—such as from a
> reserved memory region populated by the boot firmware, statically
> maintained driver data, or via a secure SMC call—when it is not embedded
> in the firmware.
> 
> There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> etc.) in the upstream kernel that do not use the remoteproc framework to
> manage their lifecycle for various reasons.
> 
> When Linux is running at EL2, similar to the Qualcomm PAS driver
> (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> also want to use the resource table SMC call to retrieve and map
> resources before they are used by the remote processor.
> 

All the examples you give here (Venus/Iris, GPU) have some sort of EL2
support already for older platforms:

 - For GPU, we just skip loading the ZAP shader and access the protected
   registers directly. I would expect the ZAP shader does effectively
   the same, perhaps with some additional handling for secure mode. Is
   this even a real remote processor that has a separate IOMMU domain?

 - For Venus/Iris, there is code upstream similar to your PATCH 11/11
   that maps the firmware with the IOMMU (but invokes reset directly
   using the registers, without using PAS). There is no resource table
   used for that either, so at least all Venus/Iris versions so far
   apparently had no need for any mappings aside from the firmware
   binary.

I understand that you want to continue using PAS for these, but I'm a
bit confused what kind of mappings we would expect to have in the
resource table for video and GPU. Could you give an example?

Thanks,
Stephan

