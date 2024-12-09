Return-Path: <linux-arm-msm+bounces-40938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E69E8A16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AFD3164219
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 04:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F69814AD0E;
	Mon,  9 Dec 2024 04:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCTotBxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0333E47B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 04:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717043; cv=none; b=d8qfWw1skbynl+Sa/fLypIzVq64tP/uquZVe32z04OWCQLgN4iZ5pq7Vb7pHWwKIq4uueW3gSlOPztIAcWzlXKyw8C1TElMuDs8v0Cn96xXydSphzz41Muzct8dUha+Qlo7VmMrQ7zOyaG/L3KU00aNW0TjEx6UAA3OqgMoO6eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717043; c=relaxed/simple;
	bh=cETlEE0WzQEHwy8QEzoaAMqjhzhL0tNxzJ0RsFPbUTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRuMgF1LY4jRN1cAo+qPHGoemQd3kOWZu6bdnivdAgt+DSFmlLHjxj6dCgQboG7qvXZQsxK9QylAjvXAQFAcLbCeHQUVSN6PcWcQY1Qvf2EHrD9hGq9iRF7iFlPGSvDw+byXgCa3ADSyk+OgN1lae8m6rzLg1JNsQzwR5XP9bas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCTotBxC; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71de7b11692so506984a34.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733717040; x=1734321840; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSueRKS2Dc0oEFrhPvduUyI5vUBlKuQKvD4Db72M8fs=;
        b=aCTotBxC6veSmtoiU3NYRwqPWeFvOyubNoM1ckIbpIu7VRZM6TfFMFASN2wlGvefEu
         HGHMcrQdIKsgoFzsT+7658dhohetRFt8Aq8A/0+gRgFIDwSrgFU9nJyP/ha7zz1YZiPZ
         UQ6ikk/KjKksIcqrCpD7GUMDDO/fY4q/RwrsUf+TlWaJc2buOEiJqjDocRTeXULFjlJp
         X/n2llRQ5zb+VNXJ0UWiFxc3NhJYMcGLIrKKyknPq+hTExchj3xvcXD/ntWt/jg+yw5h
         zY1Ntt0YsL+d8d0B5lhXpZdF3AZaLkN7aql260Jg8OlW2Z0FKuXumvV3czWTsdPJgVsw
         WH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733717040; x=1734321840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSueRKS2Dc0oEFrhPvduUyI5vUBlKuQKvD4Db72M8fs=;
        b=RZSEsYMLUUGuX79gxCQ4plebAKDFdeiemNPJd2R4xU7MpSPqdzvW8mD8NHuR5wJ2eK
         8CVxRlvDZZWlhZh2VkGfVhnaQgn+rDM5BuLbZoFxRyiJstrVhr+jihJwdZbI6rlgGl47
         LqAn3MQpOM0oEmZaJluCXoe2Zp7lczZYwQ6wGJZuLqbfs0PTWhmTW7GT5GBLflUU0Vl7
         kF0AilL4O26xdAXGb31+fUGjC5B3a/w1IpbPHdoY4KkAHXYMAoxmkb4E4toxa6V14QcV
         3IEP1n8Guqi5aDLw+jAHegWcNlpi2SKc8TqVHbBYC6ZEgAq3uPgGB6n+Wd6lRwm8VmO/
         fawg==
X-Forwarded-Encrypted: i=1; AJvYcCUP7lFQvZNlA0UDw09BAfiwleMbr+FkyfyD1FRZbqDxjufEIlHfVmC9cVmEQB1gYrxPueaY0T3wELisUcWz@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVbPLjhVlkB2daiPX1GdFc50CqjIj+ooJYplvL5oEnbTDahtt
	TUMqzJY337rbdponKcyJe+gyZkCX9FOpNVVpJIlNnIp5Lh+dpDvbtz+6trmk/Q==
X-Gm-Gg: ASbGnctyjdiyMIc2rfVbozHtw/5Q9VNrA+BHL0qfc+x9Be6+y5zs32tN5YkVGgNBviZ
	/4+XGOUJOAqjBWiptaUtJVAUWpoz+vjzhDcWx6Kn6agrm/sl+dg1zLQiV8LtC+zNd1l+3Bo2265
	4Cl/jsAE/RBkhpBom85v5c1+TBoXGuFsIsb1jl8Z3bcHaFdZQwsElPbvIcsQQ1QmdNVX7TojJso
	HAjSyYPskh9Bb1HidGFerlzn2gPX7xtEjt7ws+QKY9WP/CrosNFjPqQnIQ=
X-Google-Smtp-Source: AGHT+IHU6Xu+n7ZNg85zbpBlEgO5QS7TgqjBuo8IL4KCXkx6Wsj/Pkxh7R3VW7ABG7uDeLGEC57Xcw==
X-Received: by 2002:a05:6830:65c2:b0:71d:ee65:7c38 with SMTP id 46e09a7af769-71dee6581cbmr2249231a34.22.1733717040567;
        Sun, 08 Dec 2024 20:04:00 -0800 (PST)
Received: from thinkpad ([36.255.19.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725da385bfcsm2772546b3a.70.2024.12.08.20.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 20:04:00 -0800 (PST)
Date: Mon, 9 Dec 2024 09:33:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
	Manish Pandey <quic_mapa@quicinc.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
Subject: Re: [PATCH 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and
 Testbus Registers
Message-ID: <20241209040355.kc4ab6nfp6syw37q@thinkpad>
References: <20241025055054.23170-1-quic_mapa@quicinc.com>
 <20241112075000.vausf7ulr2t5svmg@thinkpad>
 <cb3b0c9c-4589-4b58-90a1-998743803c5a@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb3b0c9c-4589-4b58-90a1-998743803c5a@acm.org>

On Tue, Nov 12, 2024 at 10:10:02AM -0800, Bart Van Assche wrote:
> On 11/11/24 11:50 PM, Manivannan Sadhasivam wrote:
> > On Fri, Oct 25, 2024 at 11:20:51AM +0530, Manish Pandey wrote:
> > > Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
> > > of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
> > > aid in diagnosing and resolving issues related to hardware and software operations.
> > > 
> > 
> > TBH, the current state of dumping UFSHC registers itself is just annoying as it
> > pollutes the kernel ring buffer. I don't think any peripheral driver in the
> > kernel does this. Please dump only relevant registers, not everything that you
> > feel like dumping.
> 
> I wouldn't mind if the code for dumping  UFSHC registers would be removed.
> 

Instead of removing, I'm planning to move the dump to dev_coredump framework.
But should we move all the error prints also? Like all ufshcd_print_*()
functions?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

