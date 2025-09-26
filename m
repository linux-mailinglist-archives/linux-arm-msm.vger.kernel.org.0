Return-Path: <linux-arm-msm+bounces-75342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED89BA5292
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 23:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF874A7D2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 21:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562E4284684;
	Fri, 26 Sep 2025 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcyChExw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC238834
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758920930; cv=none; b=O5YV4YmNCWFXGU877amfnR1BBAJJ1bGRepuqGc+P0kd4/K3ab/DyeumZuEK9jChielbMIYO4UiKj7+FQJM0YZkkdoXyekAyoWV/I4Qx2kx4NxyrXInSK3RCAJxvFAVw9wqMPuMaKPWQmPrGrS3yMgYyhQnOgmJmGvFzTVXn961g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758920930; c=relaxed/simple;
	bh=Jc4EjceSLmpDjEcyfGiNWZ65Xn1oM5ndssYe+GwUZgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7wqBBCJA/JIdYTEQWrX2zYz1eDBAak2vhaCeykFN5Kf4skNvbZPKkJxKGdLGpER7yqntTcFiU6P5978AorBsxKOfKvZd1Q0iSbNch5eQgGifVQwgM6tPtZd1DNVRbZtSy8v8H9q0ftw25txZn8cqAiS3LgcufJHb4S58eaQnd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcyChExw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758920926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3GVZ1JYDpd64aStls1BI0HpVUBRoCJZmr3t6BifA9A=;
	b=WcyChExwjLMOdsTYGbJrWkPRIXtr70IfNPL/r8ezpTY9DQm+JhyGUjtAFRWHlnkRbZFDHr
	eQcDl+GaF1QQXtoCjkEhFPWYnvacMhJs37IhOT6PAQvyglib5FvkllmG5h46iXKbZcKrf0
	+FuMeOrpEk/9piUSFP+igLwZkFoWl1g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-XsQlOlkoPbCDBjXDT7WiKA-1; Fri, 26 Sep 2025 17:08:45 -0400
X-MC-Unique: XsQlOlkoPbCDBjXDT7WiKA-1
X-Mimecast-MFC-AGG-ID: XsQlOlkoPbCDBjXDT7WiKA_1758920925
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85641d6f913so584484885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 14:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920925; x=1759525725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3GVZ1JYDpd64aStls1BI0HpVUBRoCJZmr3t6BifA9A=;
        b=uDDNDFLSup3jO9S23lHS0+ocsbZr8t/YUAmW80yN9dxO7XRGb7qY+oZVKEEZ8UHDpb
         HQvfwgb1cxDO1oYmzsmsNHaFDbQucZvlSNS6euEyL+Jf1CJSI6CszQdpAOtvUMhphwo8
         bG6qoWRsUN/LOVsQo7bKm9dwRoF9yKX09GUT7QAYx+vt3WmGe9qV52knxuUzJ98Gy1cI
         Pe2fFUk509l7cH9F4l7GLjv8+qCt7VV6i+wSXA3wvZET7GqwotYZZCtkfmrdlLHwfdlg
         LNwNchciyPRDpEuDgJyJLdr3X9NkVLxYwjE9QhU75VOpJ9qGquYoRVTecRa2osKzC9J3
         zKmg==
X-Forwarded-Encrypted: i=1; AJvYcCXQZI9fd1yhTkoN/1iJjdhUlT5+WvG4U4tzh6hy7peq07x+M1v1M4KZD9uOvTPdWjTD/iZe5eTKg0VtjHnc@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZ6zArS/tfh87HwBpIqFwuuca3Drv9uG8z0Ot9SZqnYy5us15
	XLpZFf+hOxusmsDnxY/a4QDpnnHf58z6vYW11ylWpZtJvC0e1fjTPDxUbEOWXSYJqawOvSN7W9A
	kNJG9uTbHRNDoy+O+ZcOZTLro8R7WKcvj9H+V7yfwQX73VbTIgmXcl/C6OvIc64U/aRg=
X-Gm-Gg: ASbGncu3cfxTbf5h3jtB/+iExRjstkV/80wn9aNxKKxaRUUgWc6IYqzywAtN1ZAYBcH
	8g/nKi7PxLtfuHN8aIPJ1/4S5TtsXEcYf/lwnwqKh76qmqLUaVkwxGcb9twSr52znrKNgokVffr
	w6h6zuyjtRkSuI+wURE2SxN2qi1z/wMpStg2wbtyadRHLxHCq59eX1Jo3iL/s7vhKncj9rm39Y+
	/chVKlebWiSKP2FdV8F7yTOC7j/wkzB5Ulaqu0Dp8UgDhMmqn6aSq1HQIoBOZvIXGAkc3s2SjF1
	wqOUmiM6YKPMlsB9gwMDjClSAhl55s41pTdAt56Lrk4eeTRkL4az8dFBIB7b/f/upTHBf0Q5VDE
	X7xsIZEgvj1w091+MPESGESnYUgtKbjY=
X-Received: by 2002:a05:620a:4722:b0:85a:2def:2fe0 with SMTP id af79cd13be357-85ae033d4d8mr1349869585a.22.1758920924976;
        Fri, 26 Sep 2025 14:08:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJQzW4JZ3je9wirGSfh6XIDEj/iDBCJuS1EQrYgcojfBD4UAa9IhVt5/kN4bppw04xeCyjUw==
X-Received: by 2002:a05:620a:4722:b0:85a:2def:2fe0 with SMTP id af79cd13be357-85ae033d4d8mr1349864685a.22.1758920924446;
        Fri, 26 Sep 2025 14:08:44 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c34da236asm340619385a.68.2025.09.26.14.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 14:08:43 -0700 (PDT)
Date: Fri, 26 Sep 2025 17:08:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: ocmem: fix device leak on lookup
Message-ID: <aNcA2SCZMckYmZXb@redhat.com>
References: <20250926143511.6715-1-johan@kernel.org>
 <20250926143511.6715-2-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926143511.6715-2-johan@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 26, 2025 at 04:35:10PM +0200, Johan Hovold wrote:
> Make sure to drop the reference taken to the ocmem platform device when
> looking up its driver data.
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
> 
> Also note that commit 0ff027027e05 ("soc: qcom: ocmem: Fix missing
> put_device() call in of_get_ocmem") fixed the leak in a lookup error
> path, but the reference is still leaking on success.
> 
> Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> Cc: stable@vger.kernel.org	# 5.5: 0ff027027e05
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Miaoqian Lin <linmq006@gmail.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>


