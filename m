Return-Path: <linux-arm-msm+bounces-64695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37844B02F86
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 10:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E8361A6040A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 08:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613221F4634;
	Sun, 13 Jul 2025 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q1PNwP8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39F1E25EF
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394027; cv=none; b=Owf1yrgQ+ODW+JhrxVpdsx9rIpkMA9mfdmKrM2av45luexeb6W8mquwTvw4+HfW5YOaNH2nl+fam6PUynJiOGmvFu8OIatygYEO0PFl5ZtpoZhWPZO1M9is/23/i7FiCYwGFzSYcpKwMZh9a05a2jjuQg9rbVXeAy3sJT8rSPyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394027; c=relaxed/simple;
	bh=psKgizPd8idK+9Xng1zZOiGE+n8ZxAcQQoK6CGGlaAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+sINdPNhDqwos2HRuNEfB64A78e5DTL9ukTcYkbMwdoq/0IGE7cK4rgl3XUz+HFN920gfiIifrbE5DFUmZYRunTXcMN5L0eO/Rjpmd0T0n9nrjx0WQk5AqUx3HIiiazbdHkPfx87+3wyu9UMRThZ4UMsAFgkA+bBdN35hgJopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q1PNwP8A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-454f428038eso18833265e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394024; x=1752998824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lM8usxsSz+hgDvjepavl+3hVj5I731y8p/a4jtJD7g=;
        b=Q1PNwP8AFHY3h5FTQVJQoXXLObhKXKjrdBmRnqFLzpcn3mYZm3EQd4e3cpwKBWrIO/
         sK7GHZE3Ho3nM5mfLj9VvDKQriNFkg4fzFf7QlmdDE/HE7uKzvUXEHRDvmER1l6k2QJt
         dvXUg6WjsFpoZ5gky1pM1H9euwV3ksCPnfs8K1q25HDZY5DRWekJGLiDF6qbVkPFJ6gZ
         AgvSlAL7IlqCtFS1ys9LkJy45rD+DAhGpswHJUYgzQwuy8b6ZEf9lKEJ1LDnARmay+FQ
         PZSzYJ4S6Y+RznIM3SVnAYZmDuup/ZJKu+aDqSLDSVnVIJlG41ymN74uTsaZBQOWX5jj
         o6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394024; x=1752998824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lM8usxsSz+hgDvjepavl+3hVj5I731y8p/a4jtJD7g=;
        b=XktjpAy7GSatRQrcnKWAgTV4ZtyC65CIfLxEBma6EoUH4S1Gh9hcCJFihSVYvrYnPS
         7L7ZD3/QFgCIszEtg+BpAhDLaNqz/hV3unF6Nc4v2/1dkB3AuijD0bMa+VJNpCIJrcl/
         /kU2PgyI12x+yMdSvE63AyUu1zz4oP/ja+Mx5ElK+B1Uh94ROwfAJ3I3JQi5FMxXfRvB
         /qBUdePDGfLySQoj/QRt0op0ClsKZwpvaTWwqfA060Xeu1Mv+BMW5NViQDfX3YBpcJFz
         LdX/eSWb30kKMA/PJKRSdHtFBMh6BI0DOeCZLnVgBDtDTWY8vXDmOCEn6e0ny/SXaHgk
         f2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYKIG9lYp23Tz9Eg/r5VPe1ce+HDHQPYsyWz9cEp2Lj87K4IFyndf8tjF1okEjA+X3K0Nk7/lvoijy9JOs@vger.kernel.org
X-Gm-Message-State: AOJu0YzBuV+mr6H74zZXWwOokTep4rIZ8R0sCdhmiky7efRIl0DdAn0j
	u2jN4aYk3FZvDsV8F1EWGoTf0T9L7uMApoQBdgoPxdm0e/heP6RxOIlNma8xiN4w/3o=
X-Gm-Gg: ASbGncs1sgFK5UKJlRT+kFsP1LuVcXlUMhEv4M7jNeKGUahjozisZLwx6xM8XHIJPx6
	W9HlBrrolM6US36vIeOLHtPYBCFaJTFF4CsdprnCO1NUwL1ElxWFrS2JXvDylas5mwP2FMvAqyO
	0NOGnK7Xg6cKeyG67qhukEfvt5UXHCPmRds87tCj1/f5BtEJ6Wf0/N71YJdF9Q0SB8USAdb4Ycn
	IzZY6vssaeiZqR9qQDcbVB0N8iEg6NQW2/QuEsJijNTz8gki/VTttpZb4kbjb1V+kcaZoPjgvZX
	CfJd8w53RvF6w9zYkGlHRO94mMkOCbt0SDV86EQ2jwquXFLltxsCWt5MKwJasvO/VAs+BnrcDh0
	KjqW2crJVko+LA3PUUDfQrG8kxfDi63oZkB72
X-Google-Smtp-Source: AGHT+IG3pwvpc6BxS1YVZvmLXezCAzje9Y6cdBA2Ax5A0e9Me5Q1M68h5GqdQnaD8/2y2jlQ5aoTTQ==
X-Received: by 2002:a05:600c:1c95:b0:453:86cc:739c with SMTP id 5b1f17b1804b1-454ec14a50bmr77388375e9.1.1752394023657;
        Sun, 13 Jul 2025 01:07:03 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:29 +0200
Subject: [PATCH v2 07/15] dt-bindings: soc: qcom,aoss-qmp: document the
 Milos Always-On Subsystem side channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-7-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=838;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=psKgizPd8idK+9Xng1zZOiGE+n8ZxAcQQoK6CGGlaAM=;
 b=OPdqk8kzOonRIU/FvMHf4OTch/jvk1/7G0B29tz1FcPCzLFyfw2MFYAPDwPtuFr0E3EKR2CfP
 Ni3Mb/Ur7LsDyQ+nsHsg5e6NHg8v4v7jXauIS2CrOl7e6VQ6BFwELcm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Always-On Subsystem side channel on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 41fbbe059d80cebb214317df8ae15b86573546bc..d11bb623d08c0877cbef8e8ce4795974188b2fbb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp

-- 
2.50.1


