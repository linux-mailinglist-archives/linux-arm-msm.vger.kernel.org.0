Return-Path: <linux-arm-msm+bounces-62382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CFAE7CEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB72816FD74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16BD29ACD4;
	Wed, 25 Jun 2025 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qQimaYIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D46B2BE7A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843394; cv=none; b=hAcrXWFnaty/qH5gqp1pJUA8KhAxCBIqAY3nHAeAcYRAU1n+AbHmrtxjGllO1XD5lflPqgsMkCUSe38uP7kqDK211V6ugZ0e7nXxHcw+NUifQGHgNv4CUXJRRaOQxmO5eLrGi51spSiDiTYCfxi5GetNHLd0eyt/EO/xp3e7zvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843394; c=relaxed/simple;
	bh=cHqszQuBCaVtspU1t7iOjEc+5vwmG2p0Bi0y4m/DFOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijND9ykBcn8dpJ9cdC7Zt8F/+E6guuo7qj+UvdJRbMZQRdIhFrl5ADp9fwIUfv3UUwoX1AZloKDaGhimUS7k9cNndfNhRN7FaXadF2OEaJRFCpoqRakJ/S39xBy1x3O4utVMzNTl4BSURLEV7iN5N4jUHp3r6zHJV+pSPbuxNm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qQimaYIy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade5a0442dfso244190266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843390; x=1751448190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFtr36P+rCcWPRSy5N2MbhYZaAtcWKoXHXQTaJufVVw=;
        b=qQimaYIyKlpWXgEyXsJfceYSlAiWv445eBYouhKZTk7GRDZF9NDZI+OORDr2FZoiMG
         QK3B2iBxgNv1QEToOJK2HOSn6ultvfEnrA+AwHWhxmvE4PR/DC3iR2Q8ucbzR/yvxV0k
         X+I9erIbTIcoq20/bkchLLRiou+5tx1VLUrqGHwseFFH7AoXYnRQ5tqtp3mHH+9aweno
         dz7ibgia4pGRS+EV74ziqinpRJObnfXvyY3z43I+b9vIowcrNIXnQbF33k0rYiKA5aPS
         znj2Dux9yYKnUw4R399gnDhvl41G0C1z62gkeXrkEknJsdMaF4BaViziEs9mkvJmFglV
         SgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843390; x=1751448190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFtr36P+rCcWPRSy5N2MbhYZaAtcWKoXHXQTaJufVVw=;
        b=Lauob3UhObUTiIH9YcKTM7/uDAz3TSDhoYInoug3F8+QFCD2nAA88Zl9BttSy4iroW
         O1kd40vubCUkpIY1bDOFNApnLZ0bKLupoQIAnqTckyK9ofANPV/j4QqdBcNxW73lhfwU
         gfm9NHrLdpof86c537fUD0VUSdfEgJArx9ssnmUSEiXIZs8b4pEVm5keG1p31gwE5Cxc
         71aOkdRWYuSAyzHj4wDoIYVfG3xaAGS+wsODyht1aooZxggzD+VzaopE0dbJUk+WxK5i
         PgZ/vwyoSsGy6uWdEMwWEGPqx9/iwwNPknaX8PH6pSVb77GRuBjzBzLt6WD9PwzXedWk
         kPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzaUvP2RREeWwoq1vwAJ1wUkBke4fUhPwMemGsp7EdFRhb2b755ykQd8oq207hjsCm1v0HRZjgddgYukep@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXZAo7ya3mYzKZKefs4bmqO4EBRONlzJEJOgSzQZHbvxOHLBp
	56qxbnDYiwKG8jA5XvGwDafKVMpct6TkEeFr6OZ7EzlR6uOPyAYBjPzQNQSUTmQpV00=
X-Gm-Gg: ASbGnct2UvR1v15O8Xo1PN/pvIPHzTePxAuDMOsDPOefpTHCUoOpPXiuDsTkNuLctW8
	aV1RowAHN2CYnhR1l9z2YjNbVo7es8ztmGv4LymtTVpRwsnntB13Hcw/66bl9ycMF4FeMQY44Jy
	n/WNTRkoXrXks5mrm9HKfT2xe2if/D4Zs/rJHDT8gYLBz9U2A+wAgXl19Iysx2lexWSC25rKyOY
	pky28ENbsfPEyRrKvWaCrG0fGEyZxbTf1Uf+ks8/680u7rQc/2RNfYxDddXmS/vmOxiB2poo4V0
	wf2PPnRdcdgnDfky+v58hF/m75NPNCsngrAbfKR6Yqd0Y0LIwgMKY4kpxxlnfXgwbrM5Spiwn2z
	iRPVnPwmBI0R/AXnvhQHTDQjvwAed3IAG
X-Google-Smtp-Source: AGHT+IFJ9o4JWl7lIDkFxyVHQOH8cM1/pOAHHQWQqVQ98/eGA7Vc8alvEQuTG6jNWUZwYJgy53sTvw==
X-Received: by 2002:a17:906:ae88:b0:ad5:3a97:8438 with SMTP id a640c23a62f3a-ae0bf1b4c54mr195255066b.41.1750843390328;
        Wed, 25 Jun 2025 02:23:10 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:57 +0200
Subject: [PATCH 02/14] dt-bindings: cpufreq: qcom-hw: document SM7635
 CPUFREQ Hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-2-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1256;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cHqszQuBCaVtspU1t7iOjEc+5vwmG2p0Bi0y4m/DFOg=;
 b=kCR5siUeapo7dxDWp4dWExqPF+lGnBc97GFA4dxfQD8XoZ1lE5aOP6CJT2iAzeOSwdIFhC4/p
 Z4uY5ayq4rUBb21sP5ZjkiYsj+KLEC4ZuYf4Q18vGbyiwI2d+IWW6Oq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the CPUFREQ Hardware on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index e0242bed33420a39b8a8cff4229ba9eee994ca30..58a2222574e57a8f9c114f5fc3f0aa19d9794965 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -44,6 +44,7 @@ properties:
               - qcom,sdx75-cpufreq-epss
               - qcom,sm4450-cpufreq-epss
               - qcom,sm6375-cpufreq-epss
+              - qcom,sm7635-cpufreq-epss
               - qcom,sm8250-cpufreq-epss
               - qcom,sm8350-cpufreq-epss
               - qcom,sm8450-cpufreq-epss
@@ -169,6 +170,7 @@ allOf:
             enum:
               - qcom,qcs8300-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
+              - qcom,sm7635-cpufreq-epss
               - qcom,sm8250-cpufreq-epss
               - qcom,sm8350-cpufreq-epss
               - qcom,sm8450-cpufreq-epss

-- 
2.50.0


