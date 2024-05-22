Return-Path: <linux-arm-msm+bounces-20255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFD8CC632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 20:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A063B1F21807
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 18:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D8F57C8E;
	Wed, 22 May 2024 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="iiQULoBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A8C1BF40;
	Wed, 22 May 2024 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716401921; cv=none; b=kUgUmylSBFF2MBULpbdJyOuxO4YtfzeNWE4Zbf3ERCteDfqF5oBvj03dA3uV6KiNfQNMJ7Z17OsqtFkYbg9qGRhFSU/NvdK+YsAd9nH106H7nnBcWqyok90oE8P1uyPv0V0KQNfMTlQOChInCdCQN/ArknHS/aMhXzVXWjXpkxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716401921; c=relaxed/simple;
	bh=xNPRpsPuVeB1807eoXlBMa6zFy2qwMHE8uh3XCXeDu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHEwLGKYUjMXIC7Qz4FNserxj4Vlor4vFcpFLToZSrxkplJHfGYyQoqtMjHYVdZTU5tVGW9ZKlc98vk3fnzgpxfJJzPc8BhfTmB1lTd6cFAZNOHvxGArt8SYotR4VhwPKrylfMeXBmGz9sB0er53hBDvYLFVk5AtuWyhuXsxDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=iiQULoBj; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Vl01C66Nrz6Cnk98;
	Wed, 22 May 2024 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1716401913; x=1718993914; bh=thEXQsTRDJ1Qfc6861WlvJl6
	NVBIcBsBOUsg8V8uzR4=; b=iiQULoBjFntVjvuasDAhoo7SNCRPRlQ/P5j9eK1T
	AM5tIzi+th0fMmoFxD/JSJr3KTzUT8S8x5PbX1d8py2vXpne9CPFxmDcz5e7cYUG
	jxdGRE2/f6xUUedQFrwIQuHRwANlURNCIfmUJ39rDwOZ2Oc/B30mDEnnrTvbez+l
	9jYiamz5IAGINaM+0xt5gABDMt4V6m5Lzzd9k624vGFgREPngf4CYVag5MQzjNZQ
	wxcjMhUEdZNVt0W2m908Mq6UnktEDag+KecWGSc0CRIDJKh0fCSVLozBuEJxu/gZ
	qztAd1VE3s2kniimTeJNZNEKn/5jZrnAfPwdDjP7161MFA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gDLaIP6kWfP7; Wed, 22 May 2024 18:18:33 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Vl0142Ml9z6Cnk8s;
	Wed, 22 May 2024 18:18:31 +0000 (UTC)
Message-ID: <2ec8a7a6-c2cd-4861-9a43-8a4652e0f116@acm.org>
Date: Wed, 22 May 2024 11:18:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] scsi: ufs: qcom: Update the UIC Command Timeout
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, avri.altman@wdc.com, beanhuo@micron.com,
 adrian.hunter@intel.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <cover.1716359578.git.quic_nguyenb@quicinc.com>
 <8e5593feaac75660ff132d67ee5d9130e628fefb.1716359578.git.quic_nguyenb@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <8e5593feaac75660ff132d67ee5d9130e628fefb.1716359578.git.quic_nguyenb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/24 00:01, Bao D. Nguyen wrote:
> Change the UIC command timeout to 2 seconds.
> This extra time is to allow the uart occasionally print long
> debug messages and logging from different modules during
> product development. With the default hardcoded 500ms timeout,
> the uart printing with interrupt disabled may cause the UIC command
> interrupt get starved, resulting in a UIC command timeout and
> eventually a watchdog timeout.
> When a product development completes, the vendors may
> select a different UIC command timeout as desired.
> 
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 79f8cb3..4649e0f 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -49,6 +49,7 @@ enum {
>   
>   #define QCOM_UFS_MAX_GEAR 4
>   #define QCOM_UFS_MAX_LANE 2
> +#define QCOM_UIC_CMD_TIMEOUT_MS 2000
>   
>   enum {
>   	MODE_MIN,
> @@ -1111,6 +1112,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>   		dev_warn(dev, "%s: failed to configure the testbus %d\n",
>   				__func__, err);
>   
> +	hba->uic_cmd_timeout = QCOM_UIC_CMD_TIMEOUT_MS;
> +
>   	return 0;
>   
>   out_variant_clear:

Given the description of patch 1, the addressed issue is not specific to
a single vendor. Is that correct?

Since the described issue is only encountered during development, why to
modify the UIC command timeout unconditionally?

Thanks,

Bart.

