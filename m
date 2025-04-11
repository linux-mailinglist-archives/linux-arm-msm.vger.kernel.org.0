Return-Path: <linux-arm-msm+bounces-54038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A39A861F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 17:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B837189C29B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F601F584C;
	Fri, 11 Apr 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaVrzHSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C43C1DFE8;
	Fri, 11 Apr 2025 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385606; cv=none; b=l4PbGWaygdTHgU3r7g/CnsJWtBRRWJlNvsDxw/IE/PH2cLMewqMq4kUyL7UMp/y2pMfOFd+jxLXxJ4CcWmHAY2l+rMQQhQsdoKI98dM2kSnkq5PnoMqq3utcYV4xg1hrKDUegJlr6DmzOBKlxYj2vTGVxBI8p4chbg2pWyORTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385606; c=relaxed/simple;
	bh=kg3VXemwiKmKd4G0Z2R0124+RUSjZF/WWLbtBHb58c0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K8gToATqUGFmiUBFN4V2FThhN5XoCOz5ht0OVSIEKuLRRrXd1Np4B3BL3vxAmVDOcBff4r7L54wtwpDfXBzYV/XvWQI37gSemWYdEpa2Xzia9Pi8qdDUjQELQJSe+MBtTfncmHyiAzgKJ9tYT0o5s09BoKU1klnKgEh/OKoQ2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaVrzHSO; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso3361820a12.0;
        Fri, 11 Apr 2025 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744385603; x=1744990403; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kg3VXemwiKmKd4G0Z2R0124+RUSjZF/WWLbtBHb58c0=;
        b=eaVrzHSODiVs/ta75uBPW6PUOUmrZ2k+mxgdSdU1sxfDZK4Grcgn6Y/RMFV2FYoopX
         DubR1uyp+IYU5UbCT3aBfO7m+QKs4VC3wKUq9LJjZnedA+WfuDiFn44C4dMaIlYbByz1
         XWmkivksg2dGtB1BOg/PS6lVNDufK3Fa0/DblD79S0xgpX+hMCsP9zA42jsmVAjN7nxE
         AK+aB/2j6fjFBrgNIbab7HUdnq+v0Hw2l8dfAsfwU//B5HVv4OwdWKXo96yMDiI/qs1i
         VGJIv4pPF5lcV6NTTn28NZj5gkJOsLaIRyTgYT0qjD8ki3ZjvQZwo14HRyx5bt6G0JMA
         HeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744385603; x=1744990403;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kg3VXemwiKmKd4G0Z2R0124+RUSjZF/WWLbtBHb58c0=;
        b=qY6o5IdPBGKQqqAd5pLg6eqReb6UW2i6K7Q0wmRca04CEzyikqDGEWKugMvIfuz2Il
         PygoKVaqnYMXLZ66g4RJX2szK+anXukiWA0cWc/GBiA6mXuV/H7DMoWK0KgZAVpSrNfq
         4KVgdftoeuELk0Dm7uVMpH+thS4G8yIdNNl8xWOkqtlVobqpcMPv1R0BT53xQ++pYtt8
         pThz25mcUbApliH7rMCdnl/iFPM2fVsDLmdmP+vJ8mCviq70psGmdopIQPRpk00Lp3ux
         DH0iqYgM6smpfPZrxDbm9paBdktVtqSWKsfU3EzYXR7Ul3nmMj6xL4xoIV2RUX5M+dbF
         b8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVZSaFjctppFo0vLkiPPqsQrJtD9Wnzmj2/OIlqjFrwSmUQOI85mwmn6ZpSnj8hNcI6B1NMe6XyogNGlCGV@vger.kernel.org, AJvYcCVfvGIx4IpueKoowtRiEyEt/zKgMlCViF0OJg/VF4pHgQWYe42yas6QPfgSMwoVvnUQJ1MpQ0iAiqMWLw==@vger.kernel.org, AJvYcCXhogMpGccu2hf9x62ZuzoMWPbrYPN04EvTcDOjgQud+BbhGndQwzIPJcCGcaQ+CaZNq1UdwqMOSlCIYERl@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSRe0Z5IawtlGEgIyoRZ2+NdbDqoGpbJkqaX3Eog8c5upRgQO
	KnVCTH+drXYNMwmY3f+lT8wmuQCwioGgL8gWtUqO1WwX8qW8xp2u
X-Gm-Gg: ASbGncst3CH/tLfdsNQHGCICCJ+paj/OQSJfst9Vq1Rgxso6WjlIYnvlN2g4df+2Ru8
	Gp29jXUIRIlWikztXjz3yuE011MSsRFOhUVj+Opj8fukKQTMMfAmrObZDHWbcPQKBuaiu4K0Ck0
	fnnNosth3IpL3VbOsnqlWeluDm5xX7omSMC3POhvbZxqwhqTeCUCT8Drpt+03aAvXfK0bAJp2vR
	kU8P8O8iwAgoOTOwHjeD2OULWU4wEktnhVjUQCP0b4T+Fz3zQ5ISMkUuHHVC5v+2yGIV3Th3pyk
	eNmgD4FuxlS3NLPv2GYrQrnZqAwG2y8sW56R5ce8ii0KZoneBS/5gA==
X-Google-Smtp-Source: AGHT+IFolPfgBh4MqDlhl5CFTWgay9WZHGjuX99wTZEKev4h2CnxJ5Ib471SmxyPwOcN/aFAO+58zw==
X-Received: by 2002:a17:906:f58c:b0:ac3:8988:deda with SMTP id a640c23a62f3a-acad36a5de5mr300024066b.40.1744385603057;
        Fri, 11 Apr 2025 08:33:23 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd69asm456861266b.159.2025.04.11.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:33:22 -0700 (PDT)
Message-ID: <3939a945088f4b43bf4e69c05a5718b31bc151b7.camel@gmail.com>
Subject: Re: [PATCH V3 1/2] ufs: qcom: Add quirks for Samsung UFS devices
From: Bean Huo <huobean@gmail.com>
To: Manish Pandey <quic_mapa@quicinc.com>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	 <martin.petersen@oracle.com>, Manivannan Sadhasivam
	 <manivannan.sadhasivam@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com, 
 quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com,
 quic_cang@quicinc.com,  quic_nguyenb@quicinc.com
Date: Fri, 11 Apr 2025 17:33:20 +0200
In-Reply-To: <20250411121630.21330-2-quic_mapa@quicinc.com>
References: <20250411121630.21330-1-quic_mapa@quicinc.com>
	 <20250411121630.21330-2-quic_mapa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-11 at 17:46 +0530, Manish Pandey wrote:
> Introduce quirks for Samsung UFS devices to adjust PA TX HSG1 sync
> length
> and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller.
> This
> ensures proper functionality of Samsung UFS devices with the Qualcomm
> UFS Host controller.
>=20
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

