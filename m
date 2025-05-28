Return-Path: <linux-arm-msm+bounces-59702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421AAC6B2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E3E97AD13F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5FA1ADFE4;
	Wed, 28 May 2025 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFSEQJLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9D288527
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440826; cv=none; b=Tp35MVQ8gfOUflSBGe+9dTBV7PtnIgXHxYjBH2/fRdT3+/dv0q5OTXD29/LNe6YGkvADlkC5qW1xA+bwh3Q5Q/1d23J3GZSjhBrIGMjfjALtR1MOZyGZAuzXStkmLVxgZUKLMEAwY5wESpBCVS+Dqs9Qejqos+A/t2/YQcnNwhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440826; c=relaxed/simple;
	bh=HqmXzcz1Fhb5aWwjj60lQbn31SSuMbIoGTI7rS/zLpk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=KNRCmvPFXk2sOcaNoLFc0wwhVyYjpFNSAK0XSgp8XWFOMhoI2fX7tmKSluOLRzygFQ3Urtj29N/x4z/DxV9mv+bP2EqnUqc5U4r9aBCHBOqW8Mkk6Gj3RPUyZt/xuhpnOoOkVr9f7At+eJ05riTKqwqfkk0izwzL4EFdCpNLxoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFSEQJLT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so36120655e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748440823; x=1749045623; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLCejufrq+qP3M9mNyL+ruMGCziYJYfpyzwNMPCLUy4=;
        b=RFSEQJLTchsvDKMOoRbUNsmbJ6wUxuxW4ZORdFRMio+qgL96Xq2QoeIHjIl9FE9pqJ
         ACzfpHfFpN7SDblZtnPfJ0dy7YmaG7haut4dAd6nZdtTf6zWOpagMkdkrjRE6F1Z6w91
         Mmg0jsUZ07xy3h3aUWAVl8pEVkd2CgXTqZURm/x7bfEDaxbpy5Kc6N8gq+opZVA22dAC
         TWsh/8h7vpZFzdkgKr1hQ5j3q66M8H9BE7l7c/FVMbZM0HnO7vL/MLisCCTkWYnm3783
         tJtVy4ERTTcD5FDOv5TfrFbR7mSIRfEwBTDXdG+h7Nna0EeksZ0493/kbQ4bDCAE6JXs
         w9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440823; x=1749045623;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uLCejufrq+qP3M9mNyL+ruMGCziYJYfpyzwNMPCLUy4=;
        b=G4tkeAyGz2Fs7F8sOYhxtZsCj5vY6ys/x2u/CPQk8pXIXm9YnJj2asN99gpAKolF+k
         DFQdrZzwLGW031BxHqq9/3k3bp/EeEz4APgxWQOj5ovfXd99Ti/NTGGZnqnbIuTehbp1
         ig+og0791xHuyeuROxR+SB473r/c1mEg/6UBrVrTjV7bijMTCM1dEJbz1IhmaxiM5JYx
         p5a2uX6RHfyPeTmYRk/BFElj6SkhJiVa/UbSqk9NaqrtzcTs8sI3NXjomZbRRjxlczlf
         rKouYHrgK/mD+S8pSBlqhOTF0agP0jJO8peUlpmT2vdGo1TZBgBJ3FlFnaQvMLK+JSUu
         Z0pA==
X-Forwarded-Encrypted: i=1; AJvYcCXsdFGIF/UUHmF4P+ChD2/I2ZDPDQQKg7PStC/R4scDUlRUwwpVr6phcMbo7mfTqodnFnU37aZNwgkXcA89@vger.kernel.org
X-Gm-Message-State: AOJu0YxCUOGRNlZQ5EIntOQboP27+xw/728yOdjImsqdUSICvsGttqwD
	HLVkae8922/Ay+lNAD1vJMV9RMZJSagaSfz3qs9gHQ7JX19Kt9GJdj3qrzZ9RC7zrnQ=
X-Gm-Gg: ASbGncvIli3lsmIBJLIfdMj2zsOwD8GPNLAWYrBdyy0vnuM/YeAHspqhNwgUj2ERtfS
	XF+/kJ4xwR3reKawQ0sI3Fr7sditfOcIMygE9g+PSFzSG9MUxB+mJf3bXY97diNkWL6ysqGpoVw
	onSd53XFAx12PrwkBR9pNJANJMXKS/7u8Y+y06I0iA9fQ0cPt/Ag70AHs4G40Z4YZQ/SWRk5Pam
	ALZkqnaeSRVwwhMcQMB39esQRHU0bsa81Hjmaf1wCAd1onTno4887VqVY1XuYt6ydVqBMQVcOVp
	sU5HwiSXG8KvhHHL7Hibov7htjyENDXd++rkidd33xBlJ3LvGCsPHaNVfH8qI3qsjaKcIRNaV1z
	MUg==
X-Google-Smtp-Source: AGHT+IG4/Cne7nqOIsE/PY37ws2Wr1tDPTEMkErYoJ1bGl8pKJEeVcseVqH5nyS1AL3VO3u2TuUQQA==
X-Received: by 2002:a05:600c:6386:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45072545b44mr22307925e9.6.1748440822669;
        Wed, 28 May 2025 07:00:22 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064aeb6csm23449655e9.24.2025.05.28.07.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 15:00:21 +0100
Message-Id: <DA7UJKPSD154.2FRUF06DRZO7K@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
 <linux-arm-msm@vger.kernel.org>, <joro@8bytes.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
 <andersson@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
X-Mailer: aerc 0.20.0
References: <20250528003118.214093-1-alexey.klimov@linaro.org>
 <ehriorde5zbfoo6b7rzemnzegnwqfdobzwyjra755ynk2me2g6@om6g57n26zbp>
In-Reply-To: <ehriorde5zbfoo6b7rzemnzegnwqfdobzwyjra755ynk2me2g6@om6g57n26zbp>

On Wed May 28, 2025 at 9:52 AM BST, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 01:31:18AM +0100, Alexey Klimov wrote:
>> Add the SM6115 MDSS compatible to clients compatible list, as it also
>> needs that workaround.
>> Without this workaround, for example, QRB4210 RB2 which is based on
>> SM4250/SM6115 generates a lot of smmu unhandled context faults during
>> boot:
>>=20
>> arm_smmu_context_fault: 116854 callbacks suppressed
>> arm-smmu c600000.iommu: Unhandled context fault: fsr=3D0x402,
>> iova=3D0x5c0ec600, fsynr=3D0x320021, cbfrsynra=3D0x420, cb=3D5
>> arm-smmu c600000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x420
>> arm-smmu c600000.iommu: FSYNR0 =3D 00320021 [S1CBNDX=3D50 PNU PLVL=3D1]
>> arm-smmu c600000.iommu: Unhandled context fault: fsr=3D0x402,
>> iova=3D0x5c0d7800, fsynr=3D0x320021, cbfrsynra=3D0x420, cb=3D5
>> arm-smmu c600000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x420
>>=20
>> and also leads to failed initialisation of lontium lt9611uxc driver
>> and gpu afterwards:
>
> Nit: there is nothing failing the lt9611uxc on its own. binding all MDSS
> components (triggered by lt9611uxc attaching to the DSI bus) produces
> the failure.

Oh, I didn't mean to express that something failed in lt9611uxc itself, I
was just trying to list observed problems.
Apart from hdmi bridge and gpu the failed component will be soundcard drive=
r
since it depends on lt9611uxc.. So, if you have rewording in mind feel free
to suggest it.

Or maybe something like this will look better:
and also failed initialisation of lontium lt9611uxc, gpu and dpu is observe=
d:
  (kernel trace as in the original email)

[..]

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> I'd also propose:
>
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM611=
5")
>
> This way this is going to be fixed for all platforms using display on
> SM6115.

Yes. Thanks. Checkpatch suggested "Fixes" tag but it was unclear when it
started to horribly fail during boot -- sometime around 6.14 or 6.15 cycle.

Best regards,
Alexey

