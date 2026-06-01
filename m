Return-Path: <linux-arm-msm+bounces-110526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGbONeRCHWpZXwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:29:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDE61B790
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BB253007BAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 08:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C846B38B7BC;
	Mon,  1 Jun 2026 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkBNNKFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A598F38B7A6
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302559; cv=none; b=g8ktL432PRZTd/jYGvcfSk7Cq5ODfdpGMHnBrEEjy87Bq2DyHzBbE5yjOlHfWHq+5412rDuemYu15cQwLsrmkbzr4/jfSibgFMvNMppXB4DSTSbNc8nJOok2MrTIZsEmuh/YH2n7mTOcmyXDspQDUHNtsH+4WO8Y95y5Ixjw8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302559; c=relaxed/simple;
	bh=nlZe3xsWhoT2szNDuKXyM4hqlugsfpth0smNg3pcT8k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+q3wjE0tW45z5bE8Kbf2B9XH1btjvYEGtvjOitUrxDKNhGpidw4qjQ0NHa4b8muz2mvgGycVk2mWxzZnu2t2zP7GiyIZ4osjwJ+J090YYrGBw70jk8Y2Mm+ZHtm4ESzrrvbk3wZts3nuX/7DG++8XGne4DdLf0z6R+1OXYFDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkBNNKFG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BEA1F0089B
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780302558;
	bh=dzuFMGjhGRwQrvcPsNRpAsijmWEOIUcjq/wIKurdeEE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MkBNNKFGhN9/kwWVpcjDrqCqSPq3PYyFIdgLOCVAJOQSYBv6rZi0gEnBV37MfxWl/
	 nj/NwYgI/l6/DfqmuBjBiowBTf+Is/y4b5/VrLUDC/qk6rPZNXgXwMTTYddwd5hJCD
	 MBXXXATrWAkqP0XyQSK9MyQBmc+T07Z/5BiWig0hba8hC5XvBiasHvpp9xh6ckmZcY
	 LTyc4o2jOwrpYALS6nW538XB4ql5d+il5ZQYefzy2pSLObYBK3xbueqovQ+RYmRWat
	 rVcDIPnw9pDWxfW0+5gFM4aLd+1QIo0C131IZYjSvxQ+7ocZOUPvCJz+kanBu0/gRq
	 1iCT/Wn96MNzQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-396771119c4so11034861fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 01:29:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9i9gicxEXrC3MsqV+wryRDZfJA/kQGiMGkIkKr+viJp/ASUProjUIjLknYFTqYNalSpEVo7d1tlnb3Dn1i@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYVt0qHuH2+0rLCyeAke1qwlwweNklCdX82R3i2c/6b2MRN7L
	jlk8kubWUpeu2PsUqUeAMT0wncN1vcYbwCNIt1nV9MRoLWMD8uimJHYS6vZc9qzq2zMbAQgg3hB
	9SJ6QzgcH63Ye8W4HCtGckeEqVFaHRZqEh3XFWIjTOQ==
X-Received: by 2002:a05:651c:146e:b0:393:f205:eb45 with SMTP id
 38308e7fff4ca-39664f87277mr26939161fa.24.1780302557186; Mon, 01 Jun 2026
 01:29:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jun 2026 01:29:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jun 2026 01:29:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 01:29:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeMm2rmeMOg-HcFY4ONvNbrS7qN=ioyAezRhurL_9Vt1Q@mail.gmail.com>
X-Gm-Features: AVHnY4JzSeLw4F4s3YUKoZ6cj8WaBWIyQz-y1gKQW-0fVAj0l22wWcthvJQRtSk
Message-ID: <CAMRc=MeMm2rmeMOg-HcFY4ONvNbrS7qN=ioyAezRhurL_9Vt1Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] Bluetooth: qca: combine NVM and calibration data for QCC2072
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com, 
	dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110526-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[quicinc.com,oss.qualcomm.com,vger.kernel.org,kernel.org,holtmann.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71FDE61B790
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 20:04:31 +0200, Yepuri Siddu
<yepuri.siddu@oss.qualcomm.com> said:
> QCC2072 requires the NVM and calibration data to be delivered to the
> controller bundled together in an outer TLV of type 4. After loading
> the NVM file, load the calibration file (qca/ornbcscal<ver>.bin) and
> combine both into a single buffer with the outer TLV header before
> passing it to qca_tlv_check_data().
>
> The outer TLV header encodes the combined payload length in the high
> 24 bits and type 4 in the low 8 bits of the type_len field.
>
> If the calibration file is unavailable, fall back to downloading the
> NVM alone.
>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 47 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 0ef7546e7c7a..37db1cd9e8cf 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -612,6 +612,53 @@ static int qca_download_firmware(struct hci_dev *hdev,
>  	memcpy(data, fw->data, size);
>  	release_firmware(fw);
>
> +	/* For QCC2072, combine the NVM (type 2) with the calibration file
> +	 * into a single TLV of outer type 4.
> +	 */
> +	if (soc_type == QCA_QCC2072 && config->type == TLV_TYPE_NVM) {
> +		const struct firmware *calib_fw = NULL;
> +		char calib_name[32];
> +		u8 *combined_data = NULL;
> +		size_t inner_len, combined_size;
> +		struct tlv_type_hdr *outer_hdr;
> +		int err;
> +
> +		snprintf(calib_name, sizeof(calib_name),
> +			 "qca/ornbcscal%02x.bin", rom_ver);
> +		err = request_firmware(&calib_fw, calib_name, &hdev->dev);
> +		if (err) {
> +			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> +				   calib_name, err);
> +			goto skip_combination;

How about providing a separate function to handle it and avoiding the
objectively ugly label?

> +		}
> +
> +		bt_dev_info(hdev, "QCA Downloading %s", calib_name);
> +
> +		inner_len = size + calib_fw->size;
> +		combined_size = sizeof(*outer_hdr) + inner_len;
> +		combined_data = vmalloc(combined_size);
> +		if (!combined_data) {
> +			bt_dev_warn(hdev,
> +				   "QCA Failed to allocate memory for file: %s",
> +				   calib_name);
> +			release_firmware(calib_fw);
> +			goto skip_combination;
> +		}
> +
> +		outer_hdr = (struct tlv_type_hdr *)combined_data;
> +		/* high 24 bits = payload length, low 8 bits = type */
> +		outer_hdr->type_len = cpu_to_le32((inner_len << 8) | 4);
> +		memcpy(combined_data + sizeof(*outer_hdr), data, size);
> +		memcpy(combined_data + sizeof(*outer_hdr) + size,
> +		       calib_fw->data, calib_fw->size);
> +		release_firmware(calib_fw);
> +		vfree(data);
> +		data = combined_data;
> +		size = combined_size;

Otherwise it looks ok to me.

Bartosz

> +skip_combination:
> +		;
> +	}
> +
>  	ret = qca_tlv_check_data(hdev, config, data, size, soc_type);
>  	if (ret)
>  		goto out;
> --
> 2.34.1
>
>

