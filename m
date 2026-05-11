Return-Path: <linux-arm-msm+bounces-106910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNOlNazAAWrKjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:42:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6AF50CF97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68F023012262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095FA33FE00;
	Mon, 11 May 2026 11:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyZg1UeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9550371D15
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499371; cv=none; b=cFBdXmlbnvWbPdo2iOk4Oygv1blbo4C44C6GckdYuAnehMRegTCr85HWEOXQA5nBaBwTiA0DhSmVGEpm1PJ/rhE78nJHG7bhxOeDP3ttsdcr4Bt80d5G+aXsLLLD9PPhRw7ysJTtLvw3ofHJeKGt62DToo8Tct2AEO2KUK8h4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499371; c=relaxed/simple;
	bh=UoHrRBhiVhtypnZWjEzks4nsFfinmujGkJZDbMS325o=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mD6XSXqooILN6jyC9MpOlvkj/EGgWypbapnDc5Go6eyWkTgJcV8FVQf+i9c9u7AZsMoDUEhTmQasdDZ/5vgPAoJy/a6fsSIrScoCTDN8S34HtsWwoWa4+lEx8cYeY/5ORisTLYJZBsKl86ZjigE3P4cpX155XTaVJoBwy5nLf7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyZg1UeT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD46EC2BCF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499371;
	bh=UoHrRBhiVhtypnZWjEzks4nsFfinmujGkJZDbMS325o=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kyZg1UeTVqp9JfmhFLdNIdCKfKpAiDKDdT77xunM5pr5xh6VxbZ0nxzYNSS4K1gy3
	 /IGjRw695W8TgjhbKpfS7HvV2YWNuCO/lzkmTw4G2sSiylCCkYwZd99e9CVnEyoIAP
	 hD6wtZnSALg7USgjWSFb/0QVBvOeNw9Rr45kL/EW562s1ZsvYS087PJ9n2B4kD4BDj
	 z+jk/pu+SdQREDzWqX2kay3Qv9QBmEO09md5NOxCRmDivAY9Krx9M6mgz4W/reJ8H/
	 hcWsJ/x6m5+PVmlwZM09HmHwmBEt6aNXGlvcefRsHce5IWwjbDQdasvViSovmyqqVM
	 GB/7AqHwHXqsg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3922b35e69cso34525851fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88UTxOZwN3vE2GYJ3hgkoZ25C/CRGLkRgIWX7sVHX2QAIYTMlbE9gPG8cUf8Q+LCXtRwvSklR6Yvs2Dggs@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJWVTMNX91vmh4Pvf7G/mLbKLLqwfWzlh/PlKS8OJdBaGtaqd
	Vy54yCW9m3OKHLIvYs5kuJ+ACAK+TR1neyeo+3Dw4fL53dpJT6mN6j4zX13CQzlt7vDzEiAz5AR
	/52iyK8LVMjZ9a2Jel4+1cKlLegbXQPE1gPb3ZIhKZQ==
X-Received: by 2002:a2e:beaa:0:b0:38e:49e6:a376 with SMTP id
 38308e7fff4ca-393c41dd93dmr80689701fa.22.1778499370441; Mon, 11 May 2026
 04:36:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 13:36:08 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 13:36:08 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-pwrseq-m2-bt-v2-9-1740bd478539@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com> <20260507-pwrseq-m2-bt-v2-9-1740bd478539@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:36:08 +0200
X-Gmail-Original-Message-ID: <CAMRc=MctPMuxbdX5etjf7YAdRokFHzytJ2d_XLJ5sF_VQiebnQ@mail.gmail.com>
X-Gm-Features: AVHnY4KOYvtKbJK93XG_fcHF0tSVio3ofHekSu7kfAiAWf0UqYR7scUVWtjTLUQ
Message-ID: <CAMRc=MctPMuxbdX5etjf7YAdRokFHzytJ2d_XLJ5sF_VQiebnQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] Bluetooth: hci_qca: Set 'bt_en_available' based on
 W_DISABLE2# presence in M.2 connector
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Shuai Zhang <quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4F6AF50CF97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106910-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,intel.com,holtmann.org,gmail.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,manivannan.sadhasivam.oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 7 May 2026 18:06:17 +0200, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Check if the M.2 connector supports the W_DISABLE2# property or not by
> querying the pwrseq provider's DT node. If not available, then set
> 'bt_en_available' flag to 'false'. This flag is used to set the
> HCI_QUIRK_NON_PERSISTENT_SETUP HCI quirk, which informs the HCI layer
> whether the shutdown() callback for the device can be triggered or not.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 3e71a72ea7c7..b5439b9956cf 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2449,10 +2449,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		 * the M.2 Key E connector.
>  		 */
>  		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
> +			struct device *dev;
> +
>  			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
>  								   "uart");
>  			if (IS_ERR(qcadev->bt_power->pwrseq))
>  				return PTR_ERR(qcadev->bt_power->pwrseq);
> +
> +			dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
> +			if (!device_property_present(dev, "w-disable2-gpios"))
> +				bt_en_available = false;
> +
>  			break;
>  		}
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Just one nit: I'd switch the order of patches 7 and 8 in this series so that
I can queue the pwrseq patches in an immutable branch and provide it to the
bluetooth tree for v7.2

Bart

