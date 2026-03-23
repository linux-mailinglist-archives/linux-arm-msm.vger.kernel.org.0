Return-Path: <linux-arm-msm+bounces-99154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMsjDygIwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:30:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A94162EF164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19BD430292EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669843803C7;
	Mon, 23 Mar 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k95jdctW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B47370D48
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257886; cv=none; b=AGAJ9kA4UNZCTiLCpvTsOK54DEY+f3u6Zduv0HxbUDws+fgmLa+BiodpvKzZPtEe6VJiKAn6ZqxLlDRDuPBxl+Wg13so82AzCMQ9I71fF6+zYHHlVhzcUCk26ZOtJm0SG4gfPW5BN6vVvMq0zHJQAejUpU/H0Gx+bp8N0gZFbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257886; c=relaxed/simple;
	bh=agJiL7CSHQDoONnfJoEWCiV5NgfjV0/hO6yZH4JKDmA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F5vIKCEm09RUV3fxuDoWmEW3krl/grnDXUols4NVtSkFrf7Zldb5WJYYJmbKeaT17HrdhK/EyNp6DBeghsWb7BPw4KBZqmjYsuMXjBnhM/YYygKe+aMvvjfatCXAz2S3uMhrIViMmPvwcEimTpYZuRf5OrydlRCzlbL6X1KWR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k95jdctW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b1900bso1785409f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774257883; x=1774862683; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=agJiL7CSHQDoONnfJoEWCiV5NgfjV0/hO6yZH4JKDmA=;
        b=k95jdctWO7wdLvPVv8y/yOOxkuzIgcI/KhriKZd+fSQxAKIWgHIK2irvTRdqie3Y5V
         N8qMYObKv7hCYMSFGdZV49RtvQFFHoYvxPpt7yoklzvctS1eyf6ijzmz4+VAMF16DkmA
         qyTe+4RTOtbhb2fx9xnqc1RJ7cB7+cZRFKpk2qbDYVaqyESnj2AkhuHjM5MaTyr4Asyp
         fQ3M9q5NCKII5qNAF9LIhn+yf5jzY99LqpSYowmX6bRj+ejvNVYMbWIMP1PbmZyCAKFr
         jtC/RUED9iZLVRgCnpkfP1KiCusoJlzhO4lgfbABaOOUTb51npfF16uiuFHwdjBnPluf
         /rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257883; x=1774862683;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agJiL7CSHQDoONnfJoEWCiV5NgfjV0/hO6yZH4JKDmA=;
        b=c5gKLqfVizbldT7G0WMuGqDdX4puTc8VVXSrQZ93NO/hjH3a+DmHYM+zPTvGRFysii
         7jfsi6alH+mbhJSfpx7N/J0j2r1yRPhKyoFl3yG4vfA6MUeMjIjf/foYHwyaHSwTfsOT
         yWW+TJGNZSIYmo5MkVssqK7Xssyvg9M9lpfJubY2I0tCIRTkQ2sOz+azwW2XsfZLLek3
         Lb5uQZBZAhPtoMvEG8CY+DIJxCY8EiNguHgwdE0v0DLZEGvVsQT34OjAowZXGhOGh52k
         3eejVqC/TB65HDE15rlLjQ9CKMA7NCK5LI/egYXX95TZq0nsyFsPFMA4ZZ+gr9sD+dq+
         6JAg==
X-Forwarded-Encrypted: i=1; AJvYcCXcMJ8E88ksGqEm0WRgzid6tNPABFUOHv93pwOo9ggAL/gILpctqjs3dpw+s6/LteA6PnxKPxkjUgvObahR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tcayZ0pVAdOqcThjjDu2lXBlAmYGb74Iso+rpLa7FudYvv7l
	pjG9NB5zAQ0JK4QdB8NF3iZzuTI9fqiWCSQxrYyiGPdx0d7hRrM/0j3h
X-Gm-Gg: ATEYQzxL7eyuxB5Ap4ttj7BelPcFqmVDy6y4nfYiMFo3FjAlAsTTXaJcSUZ3XTMKttu
	ZpB6Reds5VGIYNvBywJuFOxAQH9WBb1B8sQtDlzHeLK1F0nKSMfFAitl3QAjVOMb81FKyp0I+0l
	dnMB27sz0lyIbjO6oUxgujQoo0e0eb1yKVWcSeDjW6SEyUtFmfmz/IOrGiwJiiioh/q3V0R4XMR
	UsM3fkEl8sTCdBkhYI1eNW9Ta5k+9ZpkWd6DFMjsx16+t199o6LjzorWvfxK/my82auLe0dJ/qG
	SXqQpzX09WyOOtuNBVK8lyZPfepI2aU/KTJlwdfBi2RKci/tzGK90NjPDv1ZxE3YE8HGfzlA83w
	QAobN875jwiXG2ANl/gDEZC/PosYdo/VhNCaiJNXbC1WaLciH0WCwZdMqVBBh/b62cHK094SW/m
	rmEFX/NOyFTCceYU1dHf/iIG44ZA==
X-Received: by 2002:a05:6000:2486:b0:43b:4e01:4aab with SMTP id ffacd0b85a97d-43b642812a5mr17199047f8f.37.1774257883326;
        Mon, 23 Mar 2026 02:24:43 -0700 (PDT)
Received: from [10.176.235.211] ([137.201.254.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64711f58sm28577645f8f.29.2026.03.23.02.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:24:42 -0700 (PDT)
Message-ID: <f7d9413f087b0d2c38ad9a6433d9d4237bc80b72.camel@gmail.com>
Subject: Re: [PATCH v4 11/12] scsi: ufs: ufs-qcom: Implement vops
 apply_tx_eqtr_settings()
From: Bean Huo <huobean@gmail.com>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, "open list:UNIVERSAL FLASH
	STORAGE HOST CONTROLLER DRIVER..."
	 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:24:40 +0100
In-Reply-To: <20260321031021.1722459-12-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
	 <20260321031021.1722459-12-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-99154-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huobean@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[micron.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A94162EF164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-20 at 20:10 -0700, Can Guo wrote:
> On some platforms, when Host Software triggers TX Equalization Training,
> HW does not take TX EQTR settings programmed in PA_TxEQTRSetting, instead
> HW takes TX EQTR settings from PA_TxEQG1Setting. Implement vops
> apply_tx_eqtr_setting() to work around it by programming TX EQTR settings
> to PA_TxEQG1Setting during TX EQTR procedure.
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

