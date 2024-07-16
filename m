Return-Path: <linux-arm-msm+bounces-26307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A5793242B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FCCC280A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D291990A5;
	Tue, 16 Jul 2024 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEh201L/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8D198E9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721126110; cv=none; b=fRRHeu7eay+rjrWXXI5LlgB4M6oK5j9cZTt2MnhcsxDrPtqe2Sw+98zzwW49Q2S1zVfPytRz2LVbopQHQYjqAAkr/34HNf1T8F+nX3Xnhe550G/Tq1f6BM5UXKxEb6SHtmUiEsZ3lsZd7OA65SG/DZygRXSfmqfZ3ZvU3GyVGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721126110; c=relaxed/simple;
	bh=0RlLSBg30Vm+mIiZ0RTDcL/42i5dtT/cSe8Rl1Ak+8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qrF4tk3FxO3k6+ab/N1RapCK6BI1ngnXYZ0GYNZoxvC64FI2EumJpM4RT5pWOQYyRROAjEZ4dCDliQY9uBIT0HZDaI0B1x5MIHG1penpowWCPM6UDN+bAt70mgu9N8e5aqRQ6btAdosbbao1fWpUiy0yIWgX/2Clg76UO9qyTQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEh201L/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so10819556a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721126107; x=1721730907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QwYkAPFHix7dQA5aWhBcaAYHxYwK3kTLg39RbIxoKhU=;
        b=yEh201L/VQDubR0/axAcQeMVc62uA93U+qEYet4AMtyNWZpfRRqS1u/1wYlgbeNQKO
         auTP5i5S7+3hEK8LCtoOwh9zxMjlkyVTJpBTeer0SgEXPcRr+7kFDL465qTIVhJF0Xpg
         Er4jTGXH285Ea4Ml0EjE2+I9aO/wvaF6z91vN5mbGdpaxsqx7X7EjLUxqLDPneJLET4z
         pFt+1+6Q9rr9pDMJHExTF2c8SRVitXesCjW90KPEZpZzFLmM0tfOoimze5Fg5Nlr6W4J
         yiDcI2krJkeJ21lw+vVO7eR7WcpE33QggvwzI1QMRaUDtgY3fonHbG7WEoTXOgLhQbLu
         Sc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721126107; x=1721730907;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwYkAPFHix7dQA5aWhBcaAYHxYwK3kTLg39RbIxoKhU=;
        b=fJj8iZubtpYbbpgdOZrufQUF3eN1S99XTogV6t7bUeX3Eu9/PhJPyee0xlLDkF9X/a
         IMiq8ke70xtmciADl/CfbtIOmp3vwIofBWLGuyghIMjmel8athiB673LRdu6z2pMRdS/
         gYkWKTLkwjyXa7AEldTSaN5s1WE18zeRcHsfDzniW15/OjopHUdlhfsEomaXzz899kpQ
         XKy+x2v40+g9WNJBkQYynauUwsvlhA8Vo18Us7MSaKam5QQgbxaa3vYJPYw+4nvzYn7u
         A8JUOZZgj/D4zzzm7+edKCXn7aLTLHsrNJiSRznXnkitnlHluEDrSCQ67VFy4ZT2cyNl
         wktw==
X-Forwarded-Encrypted: i=1; AJvYcCUHz7WSELY7XKKYQwQKynDWEbzVmXE+Q7mj6fUtkVn5aUKzjQvq2v7PRqoi7V30ouDMfiPi9GpzNC+ekPCSQ1pHqE9iYIy0KOx6++8J2Q==
X-Gm-Message-State: AOJu0Yx0f0FnmvokcEmxkUW26Bkrv8oPUg6xtIjHP/OqMyXAdPI2YWBm
	akKxHQVKLnPW6bh9i8Ud0aADV+NzGiSWO1T3oCP1+t7qu7S8ApBZ+1O9DE4r64A6eiug2UziN+v
	Z
X-Google-Smtp-Source: AGHT+IF1JyhuI9G1kqnQGRCyhm30pK4ip+7a84ElO1fRpsC8Tt1pfwEgM+lIBrWPsTnU1qUI4RbeJQ==
X-Received: by 2002:a17:906:4751:b0:a77:afd5:62aa with SMTP id a640c23a62f3a-a79edcf5be9mr131066266b.23.1721126106569;
        Tue, 16 Jul 2024 03:35:06 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7eb4sm294039766b.60.2024.07.16.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:35:06 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] More X1E bits
Date: Tue, 16 Jul 2024 12:35:02 +0200
Message-Id: <20240716-topic-h_bits-v1-0-f6c5d3ff982c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZMlmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0Mz3ZL8gsxk3Yz4pMySYt3UNIskM0MTC9Mk0zQloJaCotS0zAqwcdG
 xtbUAxGrrnl4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721126104; l=498;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0RlLSBg30Vm+mIiZ0RTDcL/42i5dtT/cSe8Rl1Ak+8c=;
 b=K7XpIyf8a20W3H0qgkN86isLatVnNsxCeZhQgdxBgdam4kZd4+Sa/b3FQFSpXyzgvWb+u4WGk
 xtG0g8XkmpiAZL0kx/LtEhJ05tO7DSy3z5ZRLvzqhymJWfJAA+bC+Nq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      arm64: dts: qcom: x1e80100: Fix Adreno SMMU global interrupt
      arm64: dts: qcom: x1e80100: Update C4/C5 residency/exit numbers

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 4f40be61af99a67d5580c1448acd9b74c0376389
change-id: 20240716-topic-h_bits-ef8b61485b5f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


