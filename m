Return-Path: <linux-arm-msm+bounces-27428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DCD941DEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 19:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03BEA1C23B54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153441A76A9;
	Tue, 30 Jul 2024 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7ZqNx4f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859671A76AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722360199; cv=none; b=kg6zAcGBX8fIWK1sVntQOuk73bXsUt33PKKZK4J06IaBjerbME0O7qVqhq71P9t2wi1RISaxqSWL9e8LRwKCo0PnxutX9yq/guB5pzTsJWwL8i8QjLEQfjt/0RhQPBNemBtKKrEEGMnIVHURvMw2XD9VJo1dmrBFZXBqiZ5ixtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722360199; c=relaxed/simple;
	bh=WSLbTFOqtwvBvuu2Pk3Vz3v059bdDQQYXqnULrM1dyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvBjyrGWGGDmdySO4GzoyncbiLsxiVxEAgQ0CScnthQgedCJGrSAMdP3JJINvf3aXl3s9qGOfBs20pAsPdyPLXN/hPPoxSyePTJPH+Nl6gAxB1fGAal0N9uEUFubuItErxV0Lg/7895x8Fe82CSnFBiCAJnliRg278/nBIZgPK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7ZqNx4f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722360196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IGuwjnT9GWQX6tSgZYcf238XJcRm98rHlMAflHHg3Kw=;
	b=i7ZqNx4ftmSP7ownxAakaMXW3GwAuraCjBKrJGU9GDCzdQZjlGmkZhS+ZBCBLOZOv+8n38
	4DOJ0Oj3LVbExurp6Jnbi0vCxoyvT+cX+4zH4ZVQIVVkTJDdSQmU1X9HjtUQdyOXVE+yEX
	lB2eF2o0b1Nra6Vv4P1oUSS7E+Bo3z4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-tJVYjuOqNSO0B0639c8eJQ-1; Tue, 30 Jul 2024 13:23:15 -0400
X-MC-Unique: tJVYjuOqNSO0B0639c8eJQ-1
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-4f7082b8822so438829e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 10:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722360194; x=1722964994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGuwjnT9GWQX6tSgZYcf238XJcRm98rHlMAflHHg3Kw=;
        b=saxYJFWYQfg3cnZiEJRBte1SZhEVVMr69MImS8m0/vbGzyY7bu0YCKHb5DHj4QGwHv
         0Kkj+vLSUC3PDA2yGDOQdjBUY8GqRwh5LOD3PCRNYT+W+uRtAPjM6ecVNKNjXi6HmvKA
         o2AIcMQccwFx5mJ81SpjlGvudSwswq9LmC0HCtDMJumtP8H+LyuuWJTZT3infksV+TGP
         7PbYl3fuLwh6JGvLddfues/x/mDWhYjSaBYchfkdDH1hBS/DYWpO4ACKmMdzmGiRiXBK
         B+Yk68BEFCxiWCsj+btU3+H+0gC2iuQ9r0sAqB2DQZIfFSS2pYwMz44ZTPdJG1n5IILm
         t7yg==
X-Forwarded-Encrypted: i=1; AJvYcCXgqjbQv39fGpmav9EIAK68m8lr5D/3Ajoxn3O7pux8aMSLUF8eGbq8eI0LoJotD0qmtntL38cQiVDO6Ngn64ovYU5KC7s1iRli1Z3qPw==
X-Gm-Message-State: AOJu0Yyu3fZMLSgJfzOjxy49FLJL1NWnKgvSbAvg2IBI/XVXLmk1bbF6
	nNidzhKbZJY5ceT4NVa0DCctKy1/rBZyE1N/+TZ+lRDrvzFac0bHiZ7m4jADLyMr39sa63aCnvS
	/UG3O8ODxi0T85npwL8tJMsGNDox4jS7vYI/Ge4XlyOB3Kr8tYvugWr9MUmmdqoQ=
X-Received: by 2002:a05:6122:411f:b0:4eb:5cb9:f219 with SMTP id 71dfb90a1353d-4f6e66da493mr13681488e0c.0.1722360194384;
        Tue, 30 Jul 2024 10:23:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWbirP7h94q0zBxDXPvLWzG9yiO2xstVTbnFEvAf7XvK6WAL4K2A8c3RqeBtWZrGGc6bL7ow==
X-Received: by 2002:a05:6122:411f:b0:4eb:5cb9:f219 with SMTP id 71dfb90a1353d-4f6e66da493mr13681461e0c.0.1722360194024;
        Tue, 30 Jul 2024 10:23:14 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe8201583sm51136421cf.69.2024.07.30.10.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 10:23:13 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:23:11 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: qseecom: remove unused functions
Message-ID: <ftbxl4e3fwsylm2nsewcklnmnknqfkaircphlq5ypziovweekt@ucyhurn6ps47>
References: <20240730-tzmem-efivars-fix-v1-0-bb78884810b5@linaro.org>
 <20240730-tzmem-efivars-fix-v1-2-bb78884810b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-tzmem-efivars-fix-v1-2-bb78884810b5@linaro.org>

On Tue, Jul 30, 2024 at 05:38:49PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qseecom_scm_dev(), qseecom_dma_alloc() and qseecom_dma_free() are no
> longer used following the conversion to using tzmem. Remove them.
> 
> Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ allocator")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>


