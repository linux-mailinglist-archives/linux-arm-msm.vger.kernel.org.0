Return-Path: <linux-arm-msm+bounces-27342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E63339403D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CCC3282331
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BD4D530;
	Tue, 30 Jul 2024 01:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5SKL89b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0DC2E3;
	Tue, 30 Jul 2024 01:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303514; cv=none; b=UYCd/G583Lg4snBqlPSkPfKhkKswSU/KVLfn7Buaa/kF8KTzThshRYAl0ye2YfMiYACUloq5VxNbSafZdR1zCwZViR7PfWamlPt4G6YiIr1pCFQSTVlNlMv+Ac/LsG5GnuXAzkQDnjOd6VDH1daPubfhkIFQzBraaohgT0aPRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303514; c=relaxed/simple;
	bh=qRI28A+73jOqlrtVWjD+2Jeg4Mi3y9f3Y16q9ww7zVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuXEIENt4tgpW1Vf8dLWeqVx0/5PkYBW9kbXF94yqhkeN7EcOyjjDomrxvlaEthiC4wzj3YBQXhKKhISVQ0JITpXfOBH/SaCWaTRjc+E+rgddkIJbKr+WjQiPhfBBkC77L8TWlORpRlYFOrHXuPhFpkrfSmrRKr0ZUQTNQDjly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5SKL89b; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6b797234b09so31329756d6.0;
        Mon, 29 Jul 2024 18:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303511; x=1722908311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74veV6gJihpFMmsZlJmkCJZZfUOt3SZScr7B4XrCCXA=;
        b=J5SKL89bRHLyheMekWStec1mjGMw7jS2pdZ3q3CC+iB+C76NPJNOg9SOT0xnA8rv72
         iOyokN/FuV/DDsK/Zafhu/O6G9tIuKP0NOxSaJp4nAkUpLwsQlBoFE0Ebms18mFAdA77
         2+Ed+Jjd9Ymq7T6ktFpbpwEAZi+SVyKJ22f/ZsN8eStWun/b8Q9eTxgCVSsIWAxTD6AA
         BviC6zKwlwACxc+MHNlyF3gN4lALxn/rqRwLWAUwlgkV2bpMfOD4tdLgNfL2qBSNuV9Y
         OHBFMqgrkZwSTzOEc2NvtAzwp73TV1aqQHJaahCWQAt1vja5GTQZjMHauikKbXJB9Inn
         RBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303511; x=1722908311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74veV6gJihpFMmsZlJmkCJZZfUOt3SZScr7B4XrCCXA=;
        b=cw/cjE/fqmRleCOhPwFHzPv2cVVfJe5v7w6wbyZBBOUjGNGcYhooLsxtldeB0GAvmU
         y13gXEIkAirNj+5DtfZ2iObrna5HBXll+o7ypcUT9eLwSUxosKyUMNdOmF4crviT4RKg
         AMZuFXDlq5NA1iDLY7b3K46AZMTws3QhAZbwJu0R9LF/NhJCBcjgehxyGlXeAj+YOIWH
         56GzZinWZWrXKCOpqeYcemmCQstHC+97Emn0MkkkZ15e+RIshMfn30+WXLiz1QUhykHA
         E3dyzlL5NIE/NLvUge5kZMM6vZJpK8m8a0ylMzE5eS7yU2NJtq3claNCGVf6h1JaRmgl
         8FYg==
X-Forwarded-Encrypted: i=1; AJvYcCUizHmwaNp1WH5XlA4GR+STrMkois6krSLmKUBpOq9prsViLDWXfD9LBFctQYEtM5C4GPefKq+Po7xbNlMnyIxB4omANoLLXRwcn1RL31rmDGQJfNV12hQYmeCbdI7mC4sbppQPrhC2cE4=
X-Gm-Message-State: AOJu0YygZgjduhe2OUgYLUyqoAdsuTe8zVtJR0YsyFa5yD2fuUw/E4HZ
	BzvdukkI5DhVOpNJLdHW8mlMrM4/fz61mbdhas9IM0dex/JyVWQx
X-Google-Smtp-Source: AGHT+IE6Phiwsym7PisdY2IYYu9NzfCIcR4dhesQuNm3nR5IYh2ixJSNLKlDYlycfLQ1GUlV5uD+pg==
X-Received: by 2002:ad4:4c0c:0:b0:6af:c2ec:3313 with SMTP id 6a1803df08f44-6bb78104019mr9812076d6.26.1722303511400;
        Mon, 29 Jul 2024 18:38:31 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb79c4f3dbsm318286d6.30.2024.07.29.18.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:31 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
Date: Mon, 29 Jul 2024 21:38:23 -0400
Message-ID: <20240730013820.41702-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013820.41702-4-mailingradian@gmail.com>
References: <20240730013820.41702-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 36c6b36ad4ff..7f4b15be4a11 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -539,6 +539,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
-- 
2.45.2


