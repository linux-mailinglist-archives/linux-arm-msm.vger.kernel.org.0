Return-Path: <linux-arm-msm+bounces-63942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B53AFBA2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 19:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27E647A5CA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 17:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757BC1B4F09;
	Mon,  7 Jul 2025 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="qSyu8ff6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD5517A586;
	Mon,  7 Jul 2025 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751910897; cv=none; b=QDppdhr7AWGIvNVfzTYwVBNbjP/y8RlDAmlDMZkprNsbRKXHi6WTcGEjx9C/bjgHxQjzEkqIL5GCvOqr/yqxLuf9VnctMrlthWAS42mTlaoNKaIwQTFsqZN+Kiyq4ow4Exbz6/Gm/+8TgH/Xp1OJFC13KOoQ2fDuqpxbAt6ShXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751910897; c=relaxed/simple;
	bh=xNdHILS8uuNMxndmG3CePcg7M6g/2CWdtLuV2/WPBsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U07lNAxehkKkX4Ki+J6FLl9VaDNFAecLQS3sq21aK/FDVsRzKHQGG3kBJH/z1C5N4kc3mVUZ00id/ndwGUN1h8YCVtUorSiDrfK+YUXkObqDqjevTioYwiLIiVzhatvF0Lm2TmsuKNDcZwzt6e5HFyTB8j3CBD8+tJ0fOmSTiVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=qSyu8ff6; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bbX2701LkzlgqV5;
	Mon,  7 Jul 2025 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751910892; x=1754502893; bh=xNdHILS8uuNMxndmG3CePcg7
	M6g/2CWdtLuV2/WPBsw=; b=qSyu8ff6Cdrt0/HK+5reY9VtML3XD0w6mgvohymQ
	HH1EeLA/a0PJ6IaI8wuwnbM/1Oq21QNcI+KvZvMtBoOpiKsTlMBQdGHWDxnOCqwA
	E+Ddlih9zVOfqj1f0xVSPQsuuIeDU0JuFKCrc9UJIp//k7hCSS4hAtGl+zIZxO9r
	T2A5qSm0sREurcl0JhE58dqlBMmDzggyzXi/9VS8X2ybrqvektDncK1qEQuAELGs
	zxerIMskDXo/6uIVXB5s++mvF2Wwu5bZ7mWTS9MGqfRywyHQ7H/7Qc9QNWApK29S
	IyUUx1e/BhvNkyXeTUf7VaPLb3z/jkMppHMlgnM9IlJGcw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id TuuHLUpGomHe; Mon,  7 Jul 2025 17:54:52 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bbX1v6j5ZzlgqV0;
	Mon,  7 Jul 2025 17:54:42 +0000 (UTC)
Message-ID: <e9c7345e-49c3-4545-871b-66e7e252d3ae@acm.org>
Date: Mon, 7 Jul 2025 10:54:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 5/5] ufs: ufs-qcom: Kill ufshcd_res_info
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
 <20250704-topic-qcom_ufs_mcq_cleanup-v1-5-c70d01b3d334@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-5-c70d01b3d334@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 10:36 AM, Konrad Dybcio wrote:
> This is not used by any driver and doesn't seem like it's going to be.
> Remove it.

The above description seems misleading to me. I think it should say that
previous patches from this series removed all users of what is removed
by this patch rather than suggesting that what has been removed never
had any users.

Bart.

