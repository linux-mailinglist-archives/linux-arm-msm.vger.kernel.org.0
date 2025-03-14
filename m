Return-Path: <linux-arm-msm+bounces-51388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED880A60CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 10:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407643B0C09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6E41E04AC;
	Fri, 14 Mar 2025 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cRlSUo3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97FC1C84AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943836; cv=none; b=XUlFQxUjBZi/4tKMaZAsEPtK/FUD0Ow5iPX6GzYEszZ6aIqiubW2xrEgiUDmqSy9j50YUAkBWtM2nL5qJKGn6Y5pSUperD+EJ9G85wJZxh3HBvdW4W7t8KNd7y1sAu5XVP0Af/U47WZqKfkiNWLwRN53uAv738yRZ1trghzkjR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943836; c=relaxed/simple;
	bh=5dhZAV9EyRZ2bVUtZeNoK2QiBwoclF/FSawk68+cTSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s9Ta7vjsEpMQketAxqBNZBQfSsEQbUJSXtTJJJDHcuioMMRTWwk/KIv6BkA5/+hZUV+yI+cRGlUInRfdYlvdKMHIBhAwzK3+OTKqh3ntWv4UYpjK/+P6enlSdnFGQeFUr8h/oGZeUjTS2omCsK77wN6kq3LphP3mx/jM8/pWbP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cRlSUo3E; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac289147833so330029566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741943833; x=1742548633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1MO2zgb067YUwCn/NT4o8yXeBw8prnigLMVVoVIjxU=;
        b=cRlSUo3ExtvHvtfhqUJgS+uohe+8ubq9d39fIlVNIqE20RFGd6ncG1O+zqAyqNSdqV
         iXlHA91spkcDPUsWvzicqKI7FwZDyuoeUg0E/9WrGkeD3dPtvrRsfKGR2BHlpE2P6hoK
         nFKiO2jkGI5h+34I0sfJuPbtWyJDBIEfrE26MHVcv2ElNWy8X45BrCm4hEQxzepw1kWT
         B9oeEnht8xlBwpjCHHvnYCiryXUaScIEnsDS05bypFFqaXhZ3mGaOu/2fq3UsZfRc5PN
         8YdzOMfxD5kTIUITmecBIEOtu3DvmfSbIEUTK4ccH+3USDm/mNPguQtAweLsS3O1QxUa
         zkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943833; x=1742548633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1MO2zgb067YUwCn/NT4o8yXeBw8prnigLMVVoVIjxU=;
        b=buzmwt5Y25Xxs8Y8xVAJNYYXFUnb5AMCOfDtMDmpa01+EgnyQD2u8EVRiSB9N2LSP5
         Ekrc/qUlpeisTa3VDi24V1ExMSPWDrjtKKk005Ucd7tEd/2qLILnAfZQHlD4lCJWs8Wy
         YmGfz2AZA8pxfIO9ST5LhoCq0Rees1x3TJPOrc6cwhCe/IDrLhoMeXZRup0VEEyJ+VAc
         4LdU4KTBW4MewAwztbzhLo9+p6v3gpH1OihDUZ5WGiDVsV1KBSV2wd/DiJ7/hdr25XlF
         YW+3K/9p/HbCW9/H2XBE2T3Q6DxcJyesnAxh/8TdfvBZ5dNp5FDWJbXGxdR/J4J5TXjE
         uUGg==
X-Forwarded-Encrypted: i=1; AJvYcCUQr2zVap5rEkimNFrJrDKdCLF/kkX12XoiPEFfLMmlqC3Hk1+tBN4LTvvI0YtJCyXfFS3LNr+q+4AOpZar@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUPVnyg4OvDhOMA8Ut38dvoDfJWKcMoWWtIgPj4+umY5kni+B
	NjW6go5FBdLCi9coBhvdEIQg/3VMei3l6FURBwu2VWAJ87h6Oo1c5ow0hHCT80I=
X-Gm-Gg: ASbGncuDEdRJT2Eb8+1GHMSGAvodxjFv5YtILKxRTmEEeVylyAe4ESIPefng+H1sa0K
	ZEmWQvk1uB9Bf06OWrfhS41ja0qaJ9JTk5OPLFWn+ZOFPsS1k87rvBHJ0vBSTqgzix9btW7W93E
	p/zn/H55P+BOesGLxY9Ft+L7wCt63qPe9BN8XfW+q1bqWIBqhTWcVH0rkSc1c8+dACWJyHL5qOB
	akNad4Hbm0Qkt/Lso96XslPWd4FatFAvNhr1ix6SFJspsvkYqkU6EYXmyWhHGWNCDGHzdX6Nhr9
	GbPCbLUU2wIWi5B8snWsaNgCkMuSiDvA7lOla+N9rQq3L0jVL+Y84A1o+KGkrPOaRbtxxVkvQob
	eJvRxyI8jXCUCBU6hSQ==
X-Google-Smtp-Source: AGHT+IEsuY5B/NS2S21Sb19Nfa4GPRSr39x8zR8AnIVtNQ6bdJMlUrRQM/Etqzact+Gzgp81scA8Fw==
X-Received: by 2002:a17:907:2cc5:b0:ac1:e1d8:997c with SMTP id a640c23a62f3a-ac3302755d0mr184197166b.31.1741943833036;
        Fri, 14 Mar 2025 02:17:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm195582166b.29.2025.03.14.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:17:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Fixes/improvements for SM6350 UFS
Date: Fri, 14 Mar 2025 10:17:01 +0100
Message-Id: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3002cC/x3MMQqAMAxA0atIZgPVGkGvIg5SU81glUZFkN7d4
 viG/19QjsIKffFC5FtU9pBRlQW4dQoLo8zZUJuajK0a1K21ZPDyiucqYVEk62jmzrMjhtwdkb0
 8/3MYU/oAv4GiMWMAAAA=
X-Change-ID: 20250314-sm6350-ufs-things-53c5de9fec5e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Fix the order of the freq-table-hz property, then convert to OPP tables
and add interconnect support for UFS for the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
      arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
      arm64: dts: qcom: sm6350: Add interconnect support to UFS

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 49 ++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)
---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250314-sm6350-ufs-things-53c5de9fec5e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


