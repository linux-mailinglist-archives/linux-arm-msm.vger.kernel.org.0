Return-Path: <linux-arm-msm+bounces-78572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A8C00D5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 582093B101F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8389230EF7C;
	Thu, 23 Oct 2025 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NExAtWFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0D530E837
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219478; cv=none; b=LtNg4ntG2OgdW6qt/Y9dKS0bvMpTD4RpycwGmbbkL8qr2L/+3b1qxuk8q5EYRaR87o1YiRno2QnoENRMVAbQYe951ncUsRpOv2u2BZ66/G3ngmTpQ3knqRoTAOCThJZlSQe5Mvu8HkJpaiXsUsr/Iwmec6k/n3dcQ5shwriAMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219478; c=relaxed/simple;
	bh=GJgR0piJewspDPvTjgPSZy1PlRFXkZDs+X+4UGYsrvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fG7HCECNiJlDVeWWmmWnpx/fUHqkPP0gphc8HJsUi4ezBND+ht7DkYrVDMvX0FJ7/Z6XTIKLC40uzu2G2Y6VbVlJr+3MIDcM8ZRf8+ODU5yvXK6h0R1mTYu/3MDt02x0/H8b+Cr9NctV3m9P2YWqDEf7EyfYY3uTezRAxhf0Y5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NExAtWFr; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b50645ecfbbso145694366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219475; x=1761824275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZG8pDAyRGU4j+CYjezXb+fmm/GWjAFggZfHcmsgAGk=;
        b=NExAtWFrMAX8VvYr6RC5bFs6/oZSbvo6U0hzm0KTF6kvLYF1lPA3fGp64DotLJkJ9I
         v+b5T8yJr6hZ7ohxiJtDOO73LcciB3BOkwFmBlw9rAHSFx25GBUvNJBfSkUrP2RxBN+3
         Lu9x6uUq8BafoTH/xnfOPV6c/2vfeDwRqbWDeZ/OlXZoZqxxVlrUoQjTj6c8hcUPEeqy
         KWqUZkoSqa6kVMiVT88jOiVqvAQbf2AEL6mdrP35XPevF6Ej1c4l8f1zysPjGxzSd0y7
         TfpFYUHMCuyljF8QkF6bVfF82+FxGs51TqjhnSiKm80C7P5vaho+MtGHGyaIt4xm+yxG
         5rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219475; x=1761824275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZG8pDAyRGU4j+CYjezXb+fmm/GWjAFggZfHcmsgAGk=;
        b=h0NnPuFD4sVjoNGoKQYIpFXzmIcuSmNnxcl7yN9IkRuYz6yiHvYRNjuPCNgHJN568T
         46h46Vp23EN/snM2cv3Ezp4IOo/kGSrlSgT6IhpLrmgN533e7ZSYxB6OnFAwh17Umx7N
         VvjQgpoCJnArQHTeHLerDia6u1eJ0GatlaqbBz2PBmJKqDdkR+GfjtoFKVFnBp3CV/w/
         H+UcReGm2vsKUzmjDlvwENmdiGO+u+VTdwHp1OtOgxmR2XRiv+aMUOXhcZl6FaKWnXky
         rCy+cQCVn5amqd7W4fNIyCms5dt8s7pUDt5NENufqYyFdWTctLi0DzIZGdLz8/hoSiNG
         0Jag==
X-Forwarded-Encrypted: i=1; AJvYcCWu3mMkthF7c88f7bHk8zDloXWNVlsKWBnAgDL8uPKx8h5AktOJYRVVSmhWNYHZsFU8JEA6Nc4+5Z6Tk6of@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPPH3rJjoXF1wXURgYucFWMD07lqrHOnlLtcwLj0gXTt4wyrX
	Si/Jz66aJuaEy3hcUcBQeZCVDqIH9hFetxGdmT5VJ8j67hIhKScJpKd+jiHcCcZwvlQ=
X-Gm-Gg: ASbGncvP7tTfKQHnZxHu+YZSpiuY0zr3nrIVDSXmhnO5u92k3aZpcQtyWRf6clywNr7
	mhX9AfG8KDXL1Lz3ZtpDsGpKWUosukXUZnTawrpOHpnZJmNGqligrcyZ2PkUrs69MAuDCLyrW8h
	Ttk9X3VUlG+XOB+xobM/RYMLJpOFpeR/ZQYy7v85EWasUcUQ1Rtw+n7vzH/ihukjPta6AcjPKW1
	/WlBk7bQjcXv62lIxg6Tz5lPOvztoOITkjgLXEG7dFxWdrkgrpN5/Mr3mSOsIWxZKuaqyfVeppL
	TgdYT8CqyyHjPlwKiCovcffETtnx9UbsvNMvzODyMSB2TKRNl3/9Flt/AN2CZf6nKznLLBdDUuX
	ubMkGTehRIumbe6NeeFxZaVBxNlyFnMq/gxsnDLJnw4c0y1j6fwRKgjqD72oL/rXATOoVw7y+0X
	IFe5Nt4gsdVya1b7LY9Az+PZ4LjkE1GPMyhQwbT8r/ttAApg==
X-Google-Smtp-Source: AGHT+IGgEGXohmOqHS9yGuQlCdd8uGwSygJIKko98Cg7yAhq0Px2UU4LFUF4u16ehnOrRNdCND3Ckw==
X-Received: by 2002:a17:907:3e21:b0:b3e:c7d5:4cc2 with SMTP id a640c23a62f3a-b647494100fmr2970425866b.38.1761219474748;
        Thu, 23 Oct 2025 04:37:54 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm194429666b.29.2025.10.23.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:37:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:37:28 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6350: Add interconnect support
 to UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v2-3-799d59178713@fairphone.com>
References: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219468; l=915;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=GJgR0piJewspDPvTjgPSZy1PlRFXkZDs+X+4UGYsrvk=;
 b=Sb0k448v9TsxGsSuOooenXHa5OGDK73tnPnG+dkbLyEQRJVGxxhHhLFd5mNEMwlJuKhDpqLjZ
 QKLiP3a21LMBP2DaNmmelxIZgs6pamR25iKz8EwpqEFJ5ZCwIJkVne3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 30e77eca4c02..01977d692755 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1178,6 +1178,13 @@ ufs_mem_hc: ufshc@1d84000 {
 
 			operating-points-v2 = <&ufs_opp_table>;
 
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
 			status = "disabled";
 
 			ufs_opp_table: opp-table {

-- 
2.51.1


