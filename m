Return-Path: <linux-arm-msm+bounces-63941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744DFAFBA20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 19:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC1333B5EFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 17:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AE1225A4F;
	Mon,  7 Jul 2025 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ka3ZcCjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DDC288A2;
	Mon,  7 Jul 2025 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751910717; cv=none; b=Rt+8KNZYULDxbM/70zKCb3WnjwacsMivjVp7t/4gtFIeXUchdoaj5DnSlSfHjQQvH+CpqEdVrsYccl4U4R9PHL4CAFgJCd7HuZv+aFhgpwB0K9JmMygLOl/facTcYLB5uL1HLh0n8cpc1KoJ42aosTi9AbnsqORdSWnVFBCmMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751910717; c=relaxed/simple;
	bh=HwIRnkbFAWO6CYfUOL97cpMsQAsCRiVq+cpS2M7o5gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRI4w7RxRqz1PwVB+5pNqocJkvyG69pdPI3yh72jSiORhfHU9nhHG+SD0XLyjJMqVSJCauLbsuSyA5Oo7mCfs5enK6rv8q03zMl3fHicrjKQXjSZFCTb9Z5gTqQhyjTENfZTJ5yg2hMfTMFhEUkIcR+Zr9GPClt4DtSAAURrHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ka3ZcCjB; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bbWyf4hphzlgqTy;
	Mon,  7 Jul 2025 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751910712; x=1754502713; bh=HwIRnkbFAWO6CYfUOL97cpMs
	QAsCRiVq+cpS2M7o5gI=; b=ka3ZcCjBksSmrQedpg40JAVPmpIf9L1UdLsuECDb
	jLaSU5AwjZhS1HK3ihgd/O+rrXReSqmXeP/G6Ci4gAzCVboUW24fPQ7oEOCG8BfU
	cqrjZUZiDPQMqWMQYEByxmFOHW2JK5W07pc6kA0DuC2aMLlLduTI7zCkQOGJs6AQ
	3lqkzip1dgGwTlcoXIcNRLDRQr8jaP6LScRR0nrrNhhLmflqZ1ug0B2ehDqhTnQD
	2+SDW7dt1e1Yyy4CcKMs6IoIcMKmplvVXTKO5i1xsNL3U2NLTCJLK7Tdr95M1661
	d3P4e6nMbYzmtMdCbwWKbsSSUNBRVBiCa02teqBzd15FCw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id qvjNIwFEOy-6; Mon,  7 Jul 2025 17:51:52 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bbWyR1gFNzlgqV5;
	Mon,  7 Jul 2025 17:51:42 +0000 (UTC)
Message-ID: <3c8622ed-db52-46e7-86db-c170b4aae55a@acm.org>
Date: Mon, 7 Jul 2025 10:51:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 2/5] ufs: ufs-qcom: Remove inferred MCQ mappings
To: Konrad Dybcio <konradybcio@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Asutosh Das <quic_asutoshd@quicinc.com>,
 Stanley Chu <stanley.chu@mediatek.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Can Guo <quic_cang@quicinc.com>, Nitin Rawat <quic_nitirawa@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
 <20250704-topic-qcom_ufs_mcq_cleanup-v1-2-c70d01b3d334@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-2-c70d01b3d334@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 10:36 AM, Konrad Dybcio wrote:
> There are currently no platforms with MCQ enabled, so there is no
> functional change.

Hmm ... my understanding is that your employer provides multiple
development boards that support MCQ?

Thanks,

Bart.

