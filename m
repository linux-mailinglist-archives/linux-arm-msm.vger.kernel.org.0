Return-Path: <linux-arm-msm+bounces-85017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57618CB56A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A1273006619
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADF320F08D;
	Thu, 11 Dec 2025 09:50:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF981F5851;
	Thu, 11 Dec 2025 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446634; cv=none; b=oGx3zVQc2BdA6ei2wj6zbozLdHtg87QCDnYEdvIDcErnm2FpECkQv0LDbRonu9QBykDjT3nJ/Aof2nhGk7BRvGCHaND4mLcjb4lPjjE//D2Af7ZhkOqsSOas8RmGL6CqvxYYaHqMdrpQf3P7AUvHzGBpXz1iKVRnf25DMJYcWkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446634; c=relaxed/simple;
	bh=KWPvGlrbhbGvOUMp1ZilKun9p6ZzTj3W5uCOZaXtzrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIEE7O0UKhautKjX/w/a7sIhOLHcMzQq+yFE/+rlt9j4oMBc9wy4CBwTO439LWXNPdPJ5g4HMRZaTu9GkWvqBAxK/g89A6LCnnbNue+T1U/X+ze/E0vIFlQTl5k8YOoGzoaJxMnup1CpWye7gkxafYDa2Ey197wY2VJdNkmwmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCD3C153B;
	Thu, 11 Dec 2025 01:50:24 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B81683F740;
	Thu, 11 Dec 2025 01:50:30 -0800 (PST)
Date: Thu, 11 Dec 2025 09:50:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	mike.tipton@oss.qualcomm.com
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Message-ID: <20251211-delectable-axiomatic-hummingbird-55a792@sudeepholla>
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>

On Wed, Dec 10, 2025 at 03:28:37PM -0800, Vivek Aknurwar wrote:
> Hello Sudeep/Cristian,
> 
> Just following up on this patch. If there’s anything missing or
> needs adjustment, please let me know.
> 

Sorry seem to have slipped through the cracks while I was away. I will
queue it for next merge window soon.

-- 
Regards,
Sudeep

