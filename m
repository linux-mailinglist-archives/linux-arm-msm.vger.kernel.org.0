Return-Path: <linux-arm-msm+bounces-78570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56481C00D4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603D13AC535
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886F530E0F6;
	Thu, 23 Oct 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="elvqjNP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68078F51
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219475; cv=none; b=rDiKtvE6ihY+cO+wuq7JhbAT1vidXi/jhTWVViMDH+qke+omFdOoAOMok41hYyoDS13ceGFMjH/zSjVIWZGwGtoWxGrD76U8xq6lzSA8/E3cHoc2MWpRc7xbomC4Kb4uOzV7mmb47S+KsE+9Ir8hzxptBCEfOMrXuHPC7x1a3BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219475; c=relaxed/simple;
	bh=7oXf51m7mBPucNidESq9CXB9+ksqBJvy/yJfCr+VnSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svghGmQXoWMp/aNlZVFo1YXyIYg4Exqnmtc7K2YM6r3oE2TIF1yjuEMjmeg85rng/deOyj9R7K58f8DiUWmCeN/4sDgEDfeTeC+o82kHUtECbZLLoDSr9MamjIpHXdCpjEV89CjwGcgDy+D2Df8/GQHXJOi6I4pYcV+jdXWbaOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=elvqjNP7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so56502566b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219472; x=1761824272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8kmVxRSYUQArl5tDapoiE287uiuzt8v/x5S0PTvLP8=;
        b=elvqjNP7Ekc3lmFjrFFuw3OK9UKWaIB0Y+0RbrgmHv1kFufut4ZcCQcfahv2U2YhNm
         NEzXJKpo1wi1c5PqfeOWebAWRv7EGXAlOmulpGNzdYfSt4rZIDSI0Fq4DlKgtslzQ/gj
         Sh/IwLXZWXugDnFSB/nj98VseWxwQUJXOcba6bT3nPfLJOuCL9W4N05xd10DXlu9JvTp
         Kkw3GT6VZhrqUi4QYS2A699UoTFjig9is78ZZyObY6bZWKE4hfk4c0S/saHJWMLLkdJn
         vPNjitSxFMPFD3khc46Kly2UsMe2FgncfNxO+AYyf/2XUKnfyy0dRil8i+Qaqdywh+Rg
         sXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219472; x=1761824272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8kmVxRSYUQArl5tDapoiE287uiuzt8v/x5S0PTvLP8=;
        b=UG/I/1GX6VUxRzY1SasOaFoFJdb3+hGtsZlhOMj1ZZ+w4D9/Ek7rG/ns3dJHvn+TAI
         CMQSKpCfkU93OWqaLhwEEHIyqiez5O/SFcDUb+068E1UjpXWdWhqkLp+G9bXxLrdZ2Og
         8oTZmwDLnU2hiUv9ZKzKSz8yuQSB8VYU0tkEjlqCEVdpjenDjBM+7yuKEExebpD3YmhS
         otPWhoYBj0pKuPXSBKXyt7Bpqkwtqd6FzMZGFFWZ9LJXInexpXqTQuVSptr401HisdjY
         k/DZzbYrwh4bJ4f+nSWybORqmLy6enJ3+HvEhd3lG/Ouq7brhUXFc0cw6ItVk1l7WNi2
         aFLA==
X-Forwarded-Encrypted: i=1; AJvYcCVz/5nLLt8gvhBssfLvyMiOxzWcUkM3plc+JgnfPd97fpPcJR2eEGMibND834b3+lsVaiS5NZCxLcsHmaUX@vger.kernel.org
X-Gm-Message-State: AOJu0YyUkrrI2PXUBY0EQL/5AYRcYHrR8GhXgIMYCplojdRzYFC61BK/
	k3TITbsUGHX9KUc3e5P3WTPWXuOxlUHZ13XlPi2/i1r2MZIfpoSzZv4aW9ZrGzjvIZ0=
X-Gm-Gg: ASbGnctfaOXcxib4esBNiPmsAK7dde7yOUTfsdZ3o4rUZM10tNg/DqCfT7iw64BKwpu
	EursOBa/OxTNh0bnmkOPeuKcZdqRKmefqutYTl73EUQvEi1Z9StCDAQxnY5//wMPB55uFBb2ODS
	kb0Fnkd+/AnxZsAjfU5scEWdVl6kvlKwgAiE/4vu/co9I2rQSsJdZHAmJKizR1R3BKCuKeydcxe
	cJb9YnbwN5ijqSRcX04K2hgg8s8wSAqzkERNeVMS4te8JHe6kG4lEkOLUSmBPlGF1G0eWwo4RGb
	Jibtq0lxOj6zku+NGYFse/ZNrmXE1BCwxZzRD6Oa6tLDBn6fUoqGeVjIxrQDw41PfrHk16UABgK
	LC1Ub38uvuHwlHcKxMWO27nYsMGF4oJhcKbj6zkiKJ32gh6tosCE97m8g0x43UlBmecKPQClJ0X
	bByE1gWmEuZicCCP+R+gowxGFTpesDCwIIw4B08pyc0yqVgg==
X-Google-Smtp-Source: AGHT+IEzcSqbV8G27b7RK+JXHjk+tt6rrpOdAaKPcwm6vc0BDCjPnkJCoc2TFrnWl+dB/W48T0b3nw==
X-Received: by 2002:a17:906:4fca:b0:b50:a067:2d85 with SMTP id a640c23a62f3a-b6473242850mr2602673666b.15.1761219471693;
        Thu, 23 Oct 2025 04:37:51 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm194429666b.29.2025.10.23.04.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:37:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:37:26 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v2-1-799d59178713@fairphone.com>
References: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219468; l=978;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7oXf51m7mBPucNidESq9CXB9+ksqBJvy/yJfCr+VnSk=;
 b=oXxHWyHCtwNqMCb25Ee7HIvzFWo/1Un9PghwgUi78155t7dSqhCLDn5o485ACX9xKDx66k5I5
 wHE14dkIjU3DFqmmpgw4UrtEb1U/qUWEiJ5KlLNG6Sm6iMSRNaPXsjd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

During upstreaming the order of clocks was adjusted to match the
upstream sort order, but mistakently freq-table-hz wasn't re-ordered
with the new order.

Fix that by moving the entry for the ICE clk to the last place.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8459b27cacc7..19a7b9f9ea8b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1180,11 +1180,11 @@ ufs_mem_hc: ufshc@1d84000 {
 				<0 0>,
 				<0 0>,
 				<37500000 150000000>,
-				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,
-				<0 0>;
+				<0 0>,
+				<75000000 300000000>;
 
 			status = "disabled";
 		};

-- 
2.51.1


