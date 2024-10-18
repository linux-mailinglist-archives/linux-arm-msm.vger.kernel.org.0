Return-Path: <linux-arm-msm+bounces-34940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648F9A3CE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7441C25D01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D862010EB;
	Fri, 18 Oct 2024 11:09:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69788201020;
	Fri, 18 Oct 2024 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249761; cv=none; b=e20RoYntxa5zw4hsO29KlNWj7DoZjKUvNz4a5ZPgpOd99AMG+H+zxIN3lJyQTu8uSPDHcLG9x5jpgazOt69Tim9Q2lHfNMRESsu6hFnzW1vxBdULOAcIW166YGIeFViyLIYGDE+TgH8tZLVY+QICyDaU/nlf6GuyqksN9JskH5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249761; c=relaxed/simple;
	bh=DQRhCLpH6jRWDz35x/sxqE/ieU89FU9VoVdFVZbZFGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtrRpqUqurt3LWxS77vxbhVR03+9ZSj9an4j+q55QvcGzdVa66wlMyShmCLK0roIMo3jY8To6Xf/roL7fP00HuhTWrYepRXCN+Cwg+4ih39U8fMylePsWHcnuu3uveE4ez2KSgqNbXCPNeeTXodOm9vRgryjW2gvK6GgsGsYPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E874FEC;
	Fri, 18 Oct 2024 04:09:48 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95CD43F58B;
	Fri, 18 Oct 2024 04:09:17 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:09:04 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Xinqi Zhang <quic_xinqzhan@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_scmi: fix slab-use-after-free in
 scmi_bus_notifier()
Message-ID: <ZxJBxKicvObK_3jM@pluto>
References: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>

On Wed, Oct 16, 2024 at 02:13:38PM +0800, Xinqi Zhang wrote:
> The scmi_dev->name is released prematurely in __scmi_device_destroy(),
> which causes slab-use-after-free when accessing scmi_dev->name in
> scmi_bus_notifier(). So move the release of scmi_dev->name to
> scmi_device_release() to avoid slab-use-after-free.

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

