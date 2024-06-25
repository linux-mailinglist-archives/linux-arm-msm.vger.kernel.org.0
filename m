Return-Path: <linux-arm-msm+bounces-24098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55B916768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CEF51C24D09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 12:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E82156256;
	Tue, 25 Jun 2024 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="DTD4S1ZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338B415624B;
	Tue, 25 Jun 2024 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317806; cv=none; b=XouKIPIUekwlFrhBiPAyiriGpoCHym+oWmc+9Q9vKI2QPKI93Zwx6mXYZWEcay24yDNUugfp8t7ni9XTFYjl/+uw9leuOVspsEPiAlL6oQtamJzKwtv5zKIwujMHKII059lLQPQqjdDxmKEP/81nC3Pe4rISQyfsJ1k5KopPqqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317806; c=relaxed/simple;
	bh=G6sovJflMDTKWxn4hh3X1N6o0wXZGNeV/k2fmXD3ZVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlYXQOTrogLA3nogWCN4PFZwGKfPx24/PbH0Z6e4g3/rAvEdUydN88/vyymX1D/YSo6ANL443upMXOGrgWrHe4xcTcqF6dKjcGdPfCzjYMJC4yAOvAC5uYIgCs+hGlB527KzyPzuzcW73wFVYVXW6SDUwnjixIWm0cTJC+Rx5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=DTD4S1ZQ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af01e500c6341f51fa179db0.dip0.t-ipconnect.de [IPv6:2003:f6:af01:e500:c634:1f51:fa17:9db0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1200A1C7B21;
	Tue, 25 Jun 2024 14:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1719317804;
	bh=G6sovJflMDTKWxn4hh3X1N6o0wXZGNeV/k2fmXD3ZVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTD4S1ZQ29jQ+2QQeVRCPt1WzfLQd2krEIhM103aaB/H0ST0N4aNUWA3TBMtkM6Il
	 W2AxYKV43U4teTNS58JosB+wp1Sw6Eg2Ao2CGSRtJhesgALga6Dfy+nlPvZyfVh3kS
	 jOHsuwtpOiHIYRlv/KXRdA/F/s5anXhQcaXS0OZ+gglrhh8LD9I54qWuLlCJMLiuer
	 usKh9FAkSX0TkaI4qIxL8hr+A8TJeaY8QrSrarz+VTd9z3iKC53/krZExtsDIzU71b
	 5ApYC0gmxMdqfL68BF4RoRydx5n9lGsDYVR+Bn4/Zj1YBVrWGUi8tM8Upd3uuEfv+E
	 SCasKE/jC0bKg==
Date: Tue, 25 Jun 2024 14:16:42 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>, Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v4 19/40] iommu: optimize subsystem by using atomic
 find_bit() API
Message-ID: <Znq1KkMOdjfHp6Rm@8bytes.org>
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <20240620175703.605111-20-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620175703.605111-20-yury.norov@gmail.com>

On Thu, Jun 20, 2024 at 10:56:42AM -0700, Yury Norov wrote:
>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 11 +++--------
>  drivers/iommu/msm_iommu.c             | 19 +++++--------------

Please split that up into an arm-smmu and msm part, so that these can be
reviewed and merged via separate branches.

Thanks,

	Joerg

