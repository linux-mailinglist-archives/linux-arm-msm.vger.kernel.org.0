Return-Path: <linux-arm-msm+bounces-64848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD60CB044F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 18:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A9B27A92E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 16:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642192580CB;
	Mon, 14 Jul 2025 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="CFR9xP5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09B125B1F4;
	Mon, 14 Jul 2025 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509031; cv=none; b=Thjx7Lj3RTUGYw/XIftWVjJTodfkOrSW154+pqFi6+u0eyx+SMIcti+YPfo776/XioFgjvOiOA2i7IvGArTerUcLVRksENy1+QUYIwaG4+u65W0VJiyrboo/qCfQKiAMRwqWj+0678uFGukhRcg46CJ+1GEceuD1/ceUHb8XvL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509031; c=relaxed/simple;
	bh=/LJb2esqNWBIVXFA/jsl2QkmsWdNWWBVdghGmSWCvQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyOom0Ag2RLocT9REUvjyX5RWTRixM2leczlMeX2gavOtQ/B2W5AHAA/RCiLMpbR165w0J19jsMZ9DJGkKw8Dex8UF9XoU07bG6lkfBLFMIWXsrsvmWMGWHqfxRBJF1rNu9pixiwtvM+lxKspul3Ng6zJitp9+Fui6uT877+ffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=CFR9xP5u; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bgnDh2vC6zlfnBh;
	Mon, 14 Jul 2025 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752509026; x=1755101027; bh=/LJb2esqNWBIVXFA/jsl2Qkm
	sWdNWWBVdghGmSWCvQw=; b=CFR9xP5uQAMXsw5/Qpc+6FBV6ljlRGrbeJ+r0qJK
	PpeKrem4cfhEk8Is51KPplm4a9ERb8nQMCuP9oYByeyW7nSAQdExoUYGieQ3siyr
	3n3DVjQh8GdsPA3Qr8TF1kqNN39t+tA7/ekN4B+QFEsgbqxeUn7gMZbfsuF94ikE
	s4/tODuwlA4/bENm3wi6luQyKlY1k2FoXvqxbO79gyip4HhYlEz3+Kv8UuVp9O4N
	ewQ3p6Q2ZnJgFihIk1pkfkf3nzYv9wFmhxTKOZnlWXo9qT8DlrQVMGHxHaUgpfO7
	H6jWc9cJ1XusKKpe6JNX+Sbjq8dWJVAinWLrSVtzVjnaZw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id VDiB8FcebgKS; Mon, 14 Jul 2025 16:03:46 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bgnDV42dJzlvNRB;
	Mon, 14 Jul 2025 16:03:37 +0000 (UTC)
Message-ID: <6a5cc425-2b54-4b0c-8475-196bef2dcab5@acm.org>
Date: Mon, 14 Jul 2025 09:03:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME
 attributes
To: Nitin Rawat <quic_nitirawa@quicinc.com>, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, ebiggers@google.com, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
 <20250714075336.2133-3-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250714075336.2133-3-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/25 12:53 AM, Nitin Rawat wrote:
> + * @mask: mask to apply on read value

The description of 'mask' could have been more clear, e.g. "indicates
which bits to clear from the value that has been read". Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

