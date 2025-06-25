Return-Path: <linux-arm-msm+bounces-62383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6CAE7D07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29AF96A1ED2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7278F2E11B9;
	Wed, 25 Jun 2025 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zHQ7NemL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768202DFA34
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843396; cv=none; b=RcuIqtbLu6g78QmCmXTCsCENSAn/GfnRKnuKSD+JSrUZu9QOZWHLOv+wd6z+CLgf6Rbv+jKx0NWjEm7VfVxZPLPAkPS0oBr3wN4vW34KhoEYwr+otVVto7UICUfeNiXMfzLZpYCmhjS6xPKubjM5AGsgYntlKgdZbMmCSXUu7Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843396; c=relaxed/simple;
	bh=ARurSlf9cAaTHf8riWzBxjObIWFoiMC+3sc1W+uG3PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1b20Z0d5kSo1oUqjTjtZo7uhutABpj5pbVj459VbQ2n4E3yx+LCVqcL5mUlJZMEbjGoHsQSz5E8uUT+Olg7PpeGW070q5YEf5HRBE9zTSk+dRUcTWRPMZN7Z48yVAYUpu/Gkv3dk4MTWyLk61Nux66kEUXxqeYIMuAFzOg7QF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zHQ7NemL; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso10690895a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843391; x=1751448191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRCR5w6mxJl9kOE01aENY7pdoYD3D3UcZSaG9WSr1E8=;
        b=zHQ7NemLGprK16IYwX4KDdsaSR1xoql0BkQUEhOLjEFNqiJH2ehH9NJlelatqKtuqc
         n6KsdMZTxbi2WG6p/NkpmYRBGlHZGRGxndfK+FJJDi2YtRYYSN0Agh7xpu907WUWrmKc
         r6UC1flFHILWAmczFc2zDniHpQnw62H7mbVXqMsyA0AO59PElkOtND66Mk1ler8MPaM2
         PyLKFqe+zdo2guN+xISaaNupg8eFbhUzYnTC3rEd/ain5ys57ei5eYb3jwu2B+TIfj4N
         Df8mymFd/f+1u/BpYY3RgGyGNW29lnruzX/HX/OFo9JdwYoJliEVyZSmk0Zqoh7SSUhj
         RvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843391; x=1751448191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRCR5w6mxJl9kOE01aENY7pdoYD3D3UcZSaG9WSr1E8=;
        b=eEfKhNek4Uy3rXKmUXmYeM8GVT7X5TEAmBqCvnegaXHGnC847EfseHfxjd2QjwKVJM
         RJEbhAC29x1G5KFkfmtbWH8b8va4/Qh2+Y75B6NKWq+FmelhmtZASVYHfAPZiUUEM553
         0iSmCbIWI9yzFYYiZn3wF84dItXmuwg6FJuJtoLa+lwvIqDxU96HqBmFTElvpe9Vwmi7
         YndD8nmGqetVlZpmKj4QFS/BS6HXDvfYyjUitGJxRoZKMVNs/hrWmgtqhj0VmLpHgA6m
         aKD7cWa8yLTwGe9gf73Q+R+FF6flY8ufrxfBaus5h82j+O5PXilV4abHT6zng7V+puM+
         Ydgw==
X-Forwarded-Encrypted: i=1; AJvYcCV2GevJyuf5Bhc8yTY/hLZCxKer3C9QQkAzC9gJpc65u7XMSmDzNIHZx+xbB36QCJVlnzaFdiocdlMb6ljc@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2Lggi1ZqMLiJ/fGS3M5EPvgFXYDVMchoEvfHOfFpz3qXJVck
	qWO/FQGGg61qjYn0tVGA4aehuEdOceVU/PLfCM8aW8jBrzcwS0yZyI7CXRhGm0Enwd+O7/sb8ha
	JLDMp
X-Gm-Gg: ASbGncvSVhBrWHUbBkLood8dEStElV692FG+h9YhZgA1z/o3ILO4TPqGErdvTCPrLyg
	T1XhgHrw4J2DnxtXD+klnouVPd8xxX0ZQPHClhYNc+gLMK1MpDwvGbI/FR8o9ti89T7Pdz6t9yg
	+BdHTePCu+XcVzudL4+LI4gkpuZFGskhzkADqUtOQ1lXkYZsCQ00y3BLIDgGuUCkBD8ZjXyW58D
	kB3E7nD9kGDPIjzPzbEsMTZAN/MVSzAEyStPY1m+0V1nNWlm3pIQfDJZ0CczQGjU/n/sS6rzPEI
	VpI3PSD6qRlM/5T0ek7OUknDZ62WJ2zUaXUaeQb94kB4Qd1PY/Npxh8nocCIG0uX1ork8l7o9oO
	gDYt0UuPXhcOMlN8mrwErikQc4/vh5POC
X-Google-Smtp-Source: AGHT+IFCI10YnV57Cjp2sR+UxOV3FgvVKAqwit3yxRvSArMNgi+VmBiwj5MjTcE7iiy2oz3pOZCWRA==
X-Received: by 2002:a17:906:7953:b0:ae0:66e8:9dd9 with SMTP id a640c23a62f3a-ae0be90cffdmr205488666b.8.1750843391467;
        Wed, 25 Jun 2025 02:23:11 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:58 +0200
Subject: [PATCH 03/14] dt-bindings: crypto: qcom,prng: document SM7635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-3-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=870;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ARurSlf9cAaTHf8riWzBxjObIWFoiMC+3sc1W+uG3PE=;
 b=s58rpWvVx4KEw/gWNPIbo8A+oAxUDMuwW9s3oTq9LY5OoYgLguK+Onhp3DmRNdPW9BsH3qKmf
 59mx2TZBcoYBb+w1bKOg/GL7crYXeJ4Hl7R0nL42pqDOwmT/DDnmfr5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document SM7635 compatible for the True Random Number Generator.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index ed7e16bd11d33c16d0adf02c38419dbaee87ac48..c34a4267a0d5292e89f61c766c08e7071bd2ff09 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,sm7635-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.50.0


