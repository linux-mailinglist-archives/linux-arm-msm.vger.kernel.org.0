Return-Path: <linux-arm-msm+bounces-65972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C1FB0CE42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 01:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEAB87AD53D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 23:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01BE23BD14;
	Mon, 21 Jul 2025 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="r2zSzyHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B522E3716;
	Mon, 21 Jul 2025 23:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140937; cv=none; b=elPlcf7f0ub07huWSUQRYHKr5w2cpg9P5kpW5G1oaFEfJDSgj6CfphdLIjV7hEQwcNDYC1ocsoDLZWP4s3eXFgDFoCROQ5U4qKHaU0mo/ygOISRoKbQJV+XshRmsWeXBv7IrEeBCV5n0oxgu+q2ZqW6UupEzkgkd7SC0bAdoXJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140937; c=relaxed/simple;
	bh=lVQMxv1VxmMgBhdUyZLq7S3b/3eQArDg2bF6jiioln0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGCSlhHebXcW4PHG8yfcK712R3abe0RrFdicUq45KOl6wVvoYetBiTAIdXXHMZ4kIDJ2cWWfAwlpczXHbmR58YG5f9SMTbQeif169gjsyj+QvmBgZ9BBs/kJD2QltzO/0M7RRjZfO38BChDg3NIIR6apwlOD5V53J0OmtqIozew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=r2zSzyHh; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <ece307c3-7d65-440f-babd-88cf9705b908@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1753140932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/geEkB40JNZ1dVvddexIz+4X4JnuBeRGFU7+a1RO9k=;
	b=r2zSzyHhGbPZmuNyqYl8gwbAIg2poImKw/459M7Lc4M7pwqg99VketHOk4h2tK28s2C/mZ
	Joz+sBuPMaF8NrAGr7NlWNzpo52R0mgLyJ6xLA/kK5f1MQ0DEjMJ38Armm7n7peK0xkrG1
	KSjXww3HOlMfpNS8hjRc6piH6HmbWs++CI/73xVkTaYWBtXlhzHrWcJAJ+d01vxBsf7+oi
	L6TVrUJv1zbk6Ssb4Oh9BMeUAWXQLQ6liXO5sWJZnYRzUPJMH6NhjDo2T42WEKR4ZoSHc+
	ga/5q1tNWdj3fbvKoCE0d1/Cj1ztf5SDlvKX5hyLE1MCShy6B0ltjlk11Tj+/A==
Date: Mon, 21 Jul 2025 20:35:22 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 6/25/25 12:22 PM, Dan Carpenter wrote:
> This function is supposed to return true for valid headers and false for
> invalid.  In a couple places it returns -EINVAL instead which means the
> invalid headers are counted as true.  Change it to return false.
[..]
>   	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
> -		return -EINVAL;
> +		return false;
>   
>   	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
>   	if (shend > fw->size)

this has broken all firmware loading on my x1e laptop (Dell Latitude 7455).

Apparently e_shentsize is always 0 in Qualcomm firmware files.

Confirmed externally with readelf:

% readelf --all 
/lib/firmware/qcom/x1e80100/dell/latitude-7455/qcadsp8380.mbn
[..]
   Start of program headers:          52 (bytes into file)
   Start of section headers:          0 (bytes into file)
   Flags:                             0x73
   Size of this header:               52 (bytes)
   Size of program headers:           32 (bytes)
   Number of program headers:         58
   Size of section headers:           0 (bytes)
   Number of section headers:         0
   Section header string table index: 0

There are no sections in this file.

There are no section groups in this file.


(Not just with my files, also readelf'd the Lenovo ones committed to 
linux-firmware, same deal.)

Thanks,
~val


