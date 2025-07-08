Return-Path: <linux-arm-msm+bounces-64069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86BAFD072
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC2E1560976
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3282E3AE6;
	Tue,  8 Jul 2025 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="jiOE6R0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB42E267B;
	Tue,  8 Jul 2025 16:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991543; cv=none; b=lLLZnhpO+cziYRhuK2kEQCWls4lcRayoCZVTLWr3Z+DogljwVtDf6HpyejG7Kyzy3ZOiueMfUcd1KGenqzSdmHo/xg7P4oTBAnaECt/O1uNScFo31HGwuy5sGYLQ6ZsTte0fFdsxSsl6AhjnfxiyKbeG1AqnSpigIAfpqog79bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991543; c=relaxed/simple;
	bh=e3FdwPV865GyTPKY9x8B8DZNi5qFQHQuKJK8ObR4GfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jw1dvbHaWaT8A1Xvhas2QPvesU0+LMddfssee7YAdkam6blXmnMa7gQs4IIvj8L3PP2QxjdzAv8B/B7gw/xFQRdAfOGIdY8aVoNMdoFvOVib2WlH96nGD+sk2vTPwoyPtOjy1cpMV6FO1kl0TSbadLayJUXIeAeRGullvOaR5UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=jiOE6R0B; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bc5rv4zV0zm0ysk;
	Tue,  8 Jul 2025 16:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751991532; x=1754583533; bh=Z6zaoDVVAFylatkQsFa0+IMT
	D4ZZVRePNO8su5n17Wc=; b=jiOE6R0BdshHVf3AN8enPxfoDOUVSv2AYUBuNZEq
	iwZjUhASowKl8S+odUwGzkz9c2I8HZbBHuf2kDPz4b6CAufi9xD2LR6ronO7E18P
	Uxr0SSddmFAxM+IQz7d3V6kaQCpNlwzcCXYotI2EJBxO8Ufx0hn6y2Pp4ibx4fbR
	jfFAPKy3CAHPfHWYMqkRWqm8i8CBWSJK7GuAdLx4gHFO6CK8uhMJq+VFhmbWueyY
	3CxJmm8YIagqxrq+YU5a0/oc2ONiaPHuPvACphaWll+rQXvXDnpwWPyYnK78qYFg
	c99YXdIPC1ZC0qV6vNd+ZnTu5C/ItiifkAGu6qBY5AsCEQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id cRmgfnEHxOWT; Tue,  8 Jul 2025 16:18:52 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bc5rh4yxrzm0yQx;
	Tue,  8 Jul 2025 16:18:43 +0000 (UTC)
Message-ID: <5a1bd678-c935-4c1b-812d-a249f1caebb7@acm.org>
Date: Tue, 8 Jul 2025 09:18:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW
 major version >= 6
To: Manivannan Sadhasivam <mani@kernel.org>,
 Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, ebiggers@google.com, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
 <20250707210300.561-2-quic_nitirawa@quicinc.com>
 <ldid3ptehto2kmzyixih73vc7tszwdiitr74rnwklxeeekwxrn@mm7zmyfickda>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ldid3ptehto2kmzyixih73vc7tszwdiitr74rnwklxeeekwxrn@mm7zmyfickda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/25 12:53 AM, Manivannan Sadhasivam wrote:
> On Tue, Jul 08, 2025 at 02:32:58AM GMT, Nitin Rawat wrote:
>> From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
> 
> Nit: Please use consistent subject prefix:
> 
> scsi: ufs: qcom:
> 
> Maybe we should get rid of 'scsi' prefix since the ufs code is now moved
> outside of drivers/scsi/. Bart?
Dropping the "scsi:" prefix sounds good to me because this prefix makes
patch subject lines a bit long.

Thanks,

Bart.

