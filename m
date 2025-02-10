Return-Path: <linux-arm-msm+bounces-47468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E336A2F6A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5683A5B81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29151243945;
	Mon, 10 Feb 2025 18:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+eoEB8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FDC25B67D;
	Mon, 10 Feb 2025 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211449; cv=none; b=o7Oee+FxhvIpR6BfkqQLuQ9Lz+O0DM67YYTZy6WTxcTf4Jy3s15i5G6NH7FZBrVsG4T/MteIBH1dE/nEWLcSIhZ0z5h5wpezpKkFXrhcUzNW2U/6ZyWDZ+E+f1UhNTXADxgBze4n74Rd9OBK+pjXMJbqT8qzrzngFC4bhmqlFsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211449; c=relaxed/simple;
	bh=q+VBg6bCBdZXc2FlzfohWSBB8q9wL7AXQpQmfMRcmXU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hn2MEvWZX8DM+7VTtcsENIfRNpUbZZH4PJAmla52/CDyHFX+HaYdDAEAjUK5HPNCb4n8Mu/Yruz9UBMCMheUYT/NHy9xHhRPD9wPerv49Mzu0MQxn1T0g6VhPSGNS9lKI1cqx/6wrNicsDV477/0Lji4h5IaRvhNj/5Ttd3DhIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+eoEB8d; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439473da55aso7238645e9.2;
        Mon, 10 Feb 2025 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739211445; x=1739816245; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q+VBg6bCBdZXc2FlzfohWSBB8q9wL7AXQpQmfMRcmXU=;
        b=g+eoEB8dZOJkfFkflGp1N+66Zdx7oBIoH1mhBNYGXh6P1xxIcgNDIWSsmH6CtAgLgl
         j6tc0WvvKj5QnwcnCzNb05cLYSL15/aZAroH4gGKKJgPcyMtxBrCVX571pAGCOtFy0CT
         eHlZrOzpludDJeoVpzQcMoF0wDIqCzvM7adZJ6j0/56LS4IFOsk0H4rpSu/iz7hH2xRJ
         lg8eDHBg9OqwmmjVvGdOd8CGmSlbCc4AqIrwp1bbZJNYtHP81OR4OQwGisFcLGVIQsJy
         pn3GX+GgqHD8Glxu/BNmdfOMU2dLntEiVbfrCr+wVasgIN83nWShf4v/Mxzl7l1FZv2A
         uySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211445; x=1739816245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+VBg6bCBdZXc2FlzfohWSBB8q9wL7AXQpQmfMRcmXU=;
        b=p7QwUZVrO5qsT03E+nygoISXD+He8bKPhNN54BZjh+QRqHMTUSGxKpF7nmvtOqUCpj
         EPw8ya7ccvsN+wMCSmE783wrsO1vJPFbijqFEy+yG2itVQhQUUhOFY1nGgHDH76PvsjB
         843OkZCmd9ehi4flUGRFwFARGjC71OcwnypgbR1wfyt8zJAvhQ2/uQddEovKBKpzmiL5
         2sOdw8YLtIDpSFehfdaAX9AHYRGv6cuRU3dKI1/SXqH/QdXur/EWbLy3e4thaSpnULN9
         pm9UnKXc616+ERlVw2T7zZg262tev4I2ndl9dQB3e13Z1MyzlaSBx+1sKqjAjObdh3rI
         jPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT63eqGxifLlYY1iMWUOYhQ5wFX9FoSnM1145MUmLa4dQ0I+Cbd4VjVPJ+KphBzx0eFAzGCdEzbwPdxq4=@vger.kernel.org, AJvYcCVSCiJtBLndjS7KXTfDUf0QVbXh6G20AcqCjFDQ74bWtmaxlvGDCHOWnhpxTeJ9U5E97/sKlpnLPm+TaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeb/LN262KGa5KzASvXCrv5J46bRr4Oxt1szn2wF/BV0vrvL0N
	B3/3MumekIPePE/BUJPfPLWS39DI/uV+JN5teRnwKKctsPHF5y3Xpv9fLfI0nGk=
X-Gm-Gg: ASbGncuP9Ym5zpqXKReIiAEW9BrSUbnf3DOwc8ZKblUdzKGLA/zetb0RbSRrCkrRIWQ
	2c+ecxzoZVgyAxdJuQx/6oUU5brFS9fZ4sw39qdeZ/rvODcL7ws5R2R6QmzzQo8/21pPHRA4Ogw
	Jo/xE6jOK7+dr1Lp9sNpuG1b5ZRh5+Ac7Nw3PFm2KPC/e4w2VEOnBsbIx3/QawI5G/gEHvrqCuv
	TmSfTBA5Wop/hUf1sMixJEGHNZxWDxWgTs1hiGdQYRfRacmBlMaKiO0LncWMvUrIAF5wpFq7xfh
	6w3FF2oIi/aVcjqf1Q==
X-Google-Smtp-Source: AGHT+IEej8AR3v7D/TijaRvnBtJHsGnnmAMHNHb7MHyhY0VfsLTafVTzws7AGAwh9JTjRLdoUio4NA==
X-Received: by 2002:a05:600c:1d86:b0:439:4499:54de with SMTP id 5b1f17b1804b1-439449955c6mr46338895e9.31.1739211445322;
        Mon, 10 Feb 2025 10:17:25 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394354d255sm42351485e9.25.2025.02.10.10.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:17:24 -0800 (PST)
Message-ID: <989a98d1aa0d76c1e646222d8c9a8440dcd2d325.camel@gmail.com>
Subject: Re: [PATCH v4 6/8] scsi: ufs: core: Check if scaling up is required
 when disable clkscale
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Peter Wang
 <peter.wang@mediatek.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Andrew Halaney <ahalaney@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Date: Mon, 10 Feb 2025 19:17:22 +0100
In-Reply-To: <20250210100212.855127-7-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
	 <20250210100212.855127-7-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-10 at 18:02 +0800, Ziqi Chen wrote:
> When disabling clkscale via the clkscale_enable sysfs entry, UFS
> driver
> shall perform scaling up once regardless. Check if scaling up is
> required
> or not first to avoid repetitive work.
>=20
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Bean Huo <beanhuo@micron.com>

