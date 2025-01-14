Return-Path: <linux-arm-msm+bounces-45044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 483BFA1123D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 21:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8077D188ADDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5478A20AF65;
	Tue, 14 Jan 2025 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="mp/2kYD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16D1459FD;
	Tue, 14 Jan 2025 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887316; cv=none; b=lNM34YJdlYuSwHyu6IFTdeRsNFOq6Pewrttzkv5bV/LnvssGqCEnBELQhc8g9JZ9mx3Pz/apcKNoeqUzALbyDFDAHuZpzNQ8fEaaIPgGoPzd8TZgvT+YDwPI4d5IWGrBTUImcRpeShpjaziACYDz4aIvTiAgpK/r1ni7rTs0lDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887316; c=relaxed/simple;
	bh=eChCjDfe+5qP39jVvD14ozYe3D0oCfwixEvuEuVlEN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwYOHtIl/RJP1UaSVYmcG/LLA85B5fy5rjOMkDszTCs9qulFTpI67x+MAcgYHpu4/qgVoJI1i8NTp2vsM9J6UKF6vapu/jiO7HF8toX9sXJBFTEDzEt4S0Aj1YDauLYW0YVaCQ49azdrHbeVV/FYibHe9ff3zRmvzhLZM4F8PBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=mp/2kYD2; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YXgz06jcKzlgMVb;
	Tue, 14 Jan 2025 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1736887299; x=1739479300; bh=rzBLylIyj8bVzNZ/mtrpV/DG
	OTTTimLWwe6O0B/wwds=; b=mp/2kYD2KPxYJ5bSKS93GkD77RNSyy8HmPpnPSFd
	BS95wlSrOLR3cfu9bGk/Wh2uU7PsOw6u2musctDFAgnUN0cpfMXBv4+BTaqG54T8
	13SX3gwoV4npcdU+DsN1IeELPqTixLAq+nT0R9/STqWDeEBD5Ymt8GZ8Eqw8wMFc
	hJXsE44fDlHtRh3soEPpw6GJW4u4Ubae0fvHYTF1f7vcCWphiNDcvSKeUyqAXv5b
	m+S93mt/wX0EuUQDncHFi3+nOj092B2L3jRdyiv1/vKBLPVPAWiPKCBxTcCDW34+
	n8SMqjt3EVj0lXRCdr4tk21O+BZmj6lF479+2gYVfIiN6w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NCQDeftpnuhx; Tue, 14 Jan 2025 20:41:39 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YXgyl5sK3zlgTWK;
	Tue, 14 Jan 2025 20:41:35 +0000 (UTC)
Message-ID: <cec304ef-0a5d-4f80-aaa4-05432c7a0b88@acm.org>
Date: Tue, 14 Jan 2025 12:41:34 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: fix use-after free in init error and remove
 paths
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Eric Biggers <ebiggers@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
 <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
 <13a3fdb675baa36fcda1bb254b05032b1175a2a8.camel@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <13a3fdb675baa36fcda1bb254b05032b1175a2a8.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 1/14/25 11:56 AM, Andr=C3=A9 Draszik wrote:
> Hi Bart,
>=20
> On Tue, 2025-01-14 at 09:55 -0800, Bart Van Assche wrote:
>> On 1/14/25 8:16 AM, Andr=C3=A9 Draszik wrote:
>>> +/**
>>> + * ufshcd_scsi_host_put_callback - deallocate underlying Scsi_Host a=
nd
>>> + *				=C2=A0=C2=A0 thereby the Host Bus Adapter (HBA)
>>> + * @host: pointer to SCSI host
>>> + */
>>> +static void ufshcd_scsi_host_put_callback(void *host)
>>> +{
>>> +	scsi_host_put(host);
>>> +}
>>
>> Please rename ufshcd_scsi_host_put_callback() such that the function
>> name makes clear when this function is called instead of what the
>> function does.
>=20
> Would you have a suggestion for such a name? Something like
> ufshcd_driver_release_action()?
>=20
> Unless I'm misunderstanding you, I believe most drivers use
> a function name that says what the function does, e.g.
> dell_wmi_ddv_debugfs_remove (just as a completely random
> example out of many).
>=20
> If going by when it is called and if applying this principle
> throughout ufshcd, then there can only ever be one such
> function in ufshcd, as all devm_add_action() callback actions
> happen at driver release, which surely isn't what you mean.
>=20
> You probably meant something different?

I meant what I wrote in my previous email: to chose another name
for ufshcd_scsi_host_put_callback() only. Having a function name that
duplicates the function body leaves readers of the code guessing
from where the function is called. BTW, naming callbacks after their
call site is a normal practice as far as I know. From ufs-qcom.c:

static const struct ufs_hba_variant_ops ufs_hba_qcom_vops =3D {
	.name                   =3D "qcom",
	.init                   =3D ufs_qcom_init,
	.exit                   =3D ufs_qcom_exit,
	.get_ufs_hci_version	=3D ufs_qcom_get_ufs_hci_version,
	.clk_scale_notify	=3D ufs_qcom_clk_scale_notify,
	.setup_clocks           =3D ufs_qcom_setup_clocks,
	.hce_enable_notify      =3D ufs_qcom_hce_enable_notify,
	.link_startup_notify    =3D ufs_qcom_link_startup_notify,
	.pwr_change_notify	=3D ufs_qcom_pwr_change_notify,
	.apply_dev_quirks	=3D ufs_qcom_apply_dev_quirks,
	.fixup_dev_quirks       =3D ufs_qcom_fixup_dev_quirks,
	.suspend		=3D ufs_qcom_suspend,
	.resume			=3D ufs_qcom_resume,
	.dbg_register_dump	=3D ufs_qcom_dump_dbg_regs,
	.device_reset		=3D ufs_qcom_device_reset,
	.config_scaling_param =3D ufs_qcom_config_scaling_param,
	.reinit_notify		=3D ufs_qcom_reinit_notify,
	.mcq_config_resource	=3D ufs_qcom_mcq_config_resource,
	.get_hba_mac		=3D ufs_qcom_get_hba_mac,
	.op_runtime_config	=3D ufs_qcom_op_runtime_config,
	.get_outstanding_cqs	=3D ufs_qcom_get_outstanding_cqs,
	.config_esi		=3D ufs_qcom_config_esi,
};

Bart.

