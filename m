Return-Path: <linux-arm-msm+bounces-50894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 041DCA5B261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 01:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3A3D3AF249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 00:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE50FBF6;
	Tue, 11 Mar 2025 00:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YqMfFUVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769979CD;
	Tue, 11 Mar 2025 00:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741652337; cv=none; b=lJ3dyQ4ZGnfwJU3xOr1JG8mSV4q9zUUyf8w7X7cA1/XNj0ZzzihPHHZyAUKly2vQJGU/kwzmXecVFC7EDL24jp2mkIP9CipN7nXjHX8zClb51DLcQLHqRO3Xicx3JRWyBzatmj284f4a9NdtJfg9HxlLCl9RWR+jhanlU5TjmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741652337; c=relaxed/simple;
	bh=JOQAYgTwn+YBIAQY7Om3OjGYU02iUE6krTUM8p3LuPQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JxAMrZ5dPkmdMkJktiMNRIyS+WkxJAsATPT009fNStsgC8vLvWagbnFTfRdDcui8wCVDphpRgSAJnNlnoeXXiO2umiMuHxRG14tEmUZAxl1uZW89salzb7BFIqnUbM3Xij9TXjWxMVZLmR8FNUzU+/ogaDy/zcej09gllc+j2v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YqMfFUVK; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 09A9120523;
	Tue, 11 Mar 2025 01:18:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeBUnd_b41kd; Tue, 11 Mar 2025 01:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741652333; bh=JOQAYgTwn+YBIAQY7Om3OjGYU02iUE6krTUM8p3LuPQ=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To;
	b=YqMfFUVKhZ9Baxrs0EXTDgT7+qG+Uo1K33G0fe8oHNI4gkta1pghJtVJlI1+KNwmN
	 ZpYNconLvfw722BGta94yrvs2M9OK9Mf0mRl5jmTg4Zur+//fZlWVGxBWAeRTaeByb
	 2ub7nKmjUN4NxSNZvQ3Ig5ldTNH/6kEDuVK/zVWpx/EtdoSOh+BGBiGoQxS2Y8JX9B
	 fwfebxL1rZ++VlgLiR4B2Ghysv3/zLTcZ0klEpiLQEPbDsTbNFqc1yeUFRocdcE+pJ
	 cdaCMHJrOGuEHtTpaFIvX0Yrv9C/2mI1cu5vyvhRlyJVMKuZcYftBftaRVZKxTTCOC
	 5a6jYFhmwEYVA==
Message-ID: <7f4cb66c-92f8-445a-8d29-4afd1dd0b9c3@disroot.org>
Date: Tue, 11 Mar 2025 08:18:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gpiccoli@igalia.com, kees@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, semfault@disroot.org, tony.luck@intel.com
References: <455b685e-0ccc-4c57-a60f-39ff9cd280ca@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm6125: Initial support for
 xiaomi-ginkgo
Content-Language: en-US
From: Gabriel Gonzales <semfault@disroot.org>
In-Reply-To: <455b685e-0ccc-4c57-a60f-39ff9cd280ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/25 07:37, Konrad Dybcio wrote:


 > > 'a-status'?

 > A newline.. the brain didn't synchronize with the hands

How about nodes which only have 'status' as a property name? Do they 
still need to be placed before a NL or keep as-is?


