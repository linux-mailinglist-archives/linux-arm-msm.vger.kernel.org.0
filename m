Return-Path: <linux-arm-msm+bounces-87933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B738CFFA54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F056730402AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887FB3A5261;
	Wed,  7 Jan 2026 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYju7L+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/Fxan6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39036BCC6
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803193; cv=none; b=XZhsGNPO4uhGwttvZ+GQJwTP3cCk7lOpp00CjmIORZ6g7mIngauVwdhZcQLylPwdRFAzLdnhzExPVovjJuHV5L+afmRwyN+iW2c08McIhR+BncQLa6RR9CR6FIyXRGBGnw+KGqxTiL9LTNGspgPJEmU/EFyBpiyg+JLbTt9v7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803193; c=relaxed/simple;
	bh=2x9xDxBToaXTCBYFDIYv05vZJbgZ4PBJqhfAhSY8pig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NcTlwb0T8D6mE6zYceLXZuLSfkUbeAsw4XEwbwCXJpaRmInraxUYg3jl4pouPaW7UNHg1I28ylx0cZMLbpYOcuN/s5rOJUiKeGYj8Hj6mE+FKBiEAOT9gV6os5+LaXRvMZb7gnHyJlAtwAKOgD9yGWkVDhQnItsnBju6SNoBlwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYju7L+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/Fxan6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CsSxX2239468
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 16:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sdJG1Y01vCrF0JbBkwN03nhMGX6I2ALsHnt
	HWedu01s=; b=fYju7L+IKwLiAXbIS/ZOkm5vV6Wo+oGNpp257Kdzg3XBZqdEbQL
	cwltbWuGCJGg0QbbwToafHeY7ypoEnA3mn6PTEGfSRsKi6xGXljwdRWzL7sArPtp
	Ag3mY8la2EwfxVj9/cfh1QaD1u+R9RhMjKPzRI7do+DEUMMSY8+7SLgn8fiP6LYB
	QO+YDZJY+Kiut5OZt2C0XgLR8xaiL+qEn0+Um95QZSN3nXRIsMpYHKo2LAEZmXzt
	61Pyt9QhfVea/4R++EpKo9w03LVyM9sfZl0opWk5SrxaXfbOz4DZ8fDKyvjKiH+I
	Ci1JLgbORXI1SolI3hkEspl/kqQE3Of51EA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg0pdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 16:26:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c52d37d346dso209358a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767803181; x=1768407981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdJG1Y01vCrF0JbBkwN03nhMGX6I2ALsHntHWedu01s=;
        b=h/Fxan6Vb4jqN0EoqG8mApc17okfxe1Zu5Y2YfQOwi3SgY23gwgL5NjyfYd2ABIfcj
         4uDqvk1M0KMdEVaSS0OsZZlpD+el22vyXnT5fyqfNmQDoXQB2ueIBA98usW9iIXNXgSz
         key9hoxybfvT4rYanvzim5mZsvzwpwYwmTCN/szKqatMMgmsrez0LAKt0cNGvXNWRzZ1
         /jckq1hFdOc2byH1dqqB+VN4tk+TUlP1hYaCkLEXSETU/edPF0UBBxT+Qibcf7G0LCEn
         6PzpXFB4hs9axVZP2ZK03wPFCZrp0O2bNd+LDQdgxT5CGf5D9S9jI/zxrQHKkUl8hNwb
         eltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803181; x=1768407981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdJG1Y01vCrF0JbBkwN03nhMGX6I2ALsHntHWedu01s=;
        b=skXRsMhndv6pTj+IYp127gRdZhxEsJoMMGNXfciwOC1tmm+xpf6GmnE7sU6cF3taFh
         g7455+0s+IcEnitBTCHaXCRs2sOhdKhzTyeeSsyKv0PyQjp1DgGyNY3Kw/aaX6sfzJqt
         M21WzH1NMBC0GNQC7zRphX9/iJCdpYEBLUTf+pyhpPYfDVSyRdEi+hgqEruNyT+ZqQsd
         PlehgNgDs+/j0Mwjwh163VSnYR0QTAjU9NqycSazBisUaKuVIyxHDYCZ9Rr7cEdd3vTn
         yV4ZInQwBwyqYV1e/+IcaYb79DsVz8/LOKkDLVHPSXblVZJ1UJuKvBpjri2VbSm6RdrT
         kTkw==
X-Forwarded-Encrypted: i=1; AJvYcCVWWbH6jiLkrUAwDnOj9XKas6VyrketTPB7h4mvqozLh0BHPINXpNaoClpEgL/fBBRmNHzRmplD3bWhydON@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7Y113O0solQAGj3GWinR8xZVucIFqJdJYsc7fa9RXXaEey/c
	HvNsbxBEJR64gEOFLaXBFxIR6hUOBMuzM6hUaVCwGS+OmWs+hpwH3khnHyImI92JCnjNAme3BHY
	h57fke1wD7e07+YFbGqSxDZJQqrChFw+R22iInqBDQW6zVXoik6f2YLbONakJTgUuliga
X-Gm-Gg: AY/fxX7apYw4dQGhNifUXYJiArG6RZPKOKvxQRRnfYeLaeF3EbzPRfM/pAgm1SKQ9uf
	Igv0g/Ylm3SEKfhj4Mp50pp2GTT9O73q4nwdk4xfFoG7hVbxtQIoCJvX+RTREJYcUFjRcPJlASi
	SiRghKxWVLv5apmYT7m2BXMt87OjRCRlIMMbARpLnGdYqd3Lc9Yvaznh2B0K3j+IBMi8C9KobbV
	BS8fECvSxlhXPtrxPIFD0dUmNpZ4DUy81bsTdJbWdtp/lPxv5fPOM7O8V7gfd8CAqcGL5Ypi1GF
	WcUWv8tqVGQqqU9oJ9WNi8sZJKVCTXjgrx57K5C5ELgQTKlrk2TIXQNypjQ6HU+dmzqORPGAMKk
	KEKghtcX/tNVEdU4lg6EYVpsY9H3506u/oFu9/i/+Qt8=
X-Received: by 2002:a05:6a00:1bc8:b0:7f0:d758:3145 with SMTP id d2e1a72fcca58-81b7d85ed03mr2731136b3a.6.1767803180694;
        Wed, 07 Jan 2026 08:26:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIkFq9pewu116DJ9lbUIG6SZW/vLM/WJHYfVd5h7OElim2xGDI/bvt5L8IqRNMpkM4NjyAaQ==
X-Received: by 2002:a05:6a00:1bc8:b0:7f0:d758:3145 with SMTP id d2e1a72fcca58-81b7d85ed03mr2731117b3a.6.1767803180090;
        Wed, 07 Jan 2026 08:26:20 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0dfd29sm5354738b3a.25.2026.01.07.08.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:26:19 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2] serial: qcom_geni: Fix BT failure regression on RB2 platform
Date: Wed,  7 Jan 2026 21:56:10 +0530
Message-Id: <20260107162610.1582626-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4PpYTC39MCx4h-uxjXLE5XrUFvZIiPRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyOSBTYWx0ZWRfX0ZJCJmLsuI6Z
 hbb6fMCwSl/nDWh2q9jCfn1nZcyPJdHReadUyKMlYYX1tUz3rWLTavBLoDMFKu4tNk+Hq4USIPr
 IdKbtt3owQwAHPVPT+mzzgJJfQm0ic/rZDGZD9y1Xa+vc/0CY5ns4mlVOmnl/p56jHIZWUFvLc/
 S/Leix94dpsTPGol4ioB/NgIYch+sq7I4T7TTvTmlCbNf+Hy8n0OPp5Du5528Io3Sef4RN31EOW
 fM/YK/Y4tUjVUVwGIFhPO1N9UYBFdnCnSXKZvZ/nr+8Bf4azyf/bNTqveB9OXtVGmoOJI/Iiv83
 CmpOOffTmlTKadZvFiWsckQpmhAem4ihLHw0SHkHuNKQwB2FbEFhGx8uGRtQJERTNCN04BxhZ2D
 plRyrFTiBxb8WUs217tJXZCYC1Q6YvhmAhvoBz3QU4+FFnY/z4QlO/r75Qonbk6TPlBVDmnNntj
 07x3+6k3tT1weXEGbmg==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e892d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-jOfXJ57FaXOfPmQh3oA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4PpYTC39MCx4h-uxjXLE5XrUFvZIiPRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070129

Commit 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial
driver") caused BT init to fail during bootup on the RB2 platform,
preventing proper BT initialization. However, BT works correctly after
bootup completes.

The issue occurs when runtime PM is enabled and uart_add_one_port() is
called before wakeup IRQ setup. The uart_add_one_port() call activates
the device through runtime PM, which configures GPIOs to the "qup_x"
pinmux function during runtime resume. When wakeup IRQ registration
happens afterward using dev_pm_set_dedicated_wake_irq(), these GPIOs
are reset back to the "gpio" pinmux function, which impacts the RX GPIO
and leads to Bluetooth failures.

Fix this by ensuring wakeup IRQ setup is completed before calling
uart_add_one_port() to prevent the pinmux function conflict.

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1 -> v2
- Updated commit text.
- Added Tested-by in commit text
---
 drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6ce6528f5c10..46a9c71630d5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1888,12 +1888,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
-	devm_pm_runtime_enable(port->se.dev);
-
-	ret = uart_add_one_port(drv, uport);
-	if (ret)
-		goto error;
-
 	if (port->wakeup_irq > 0) {
 		device_init_wakeup(&pdev->dev, true);
 		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
@@ -1906,6 +1900,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		}
 	}
 
+	devm_pm_runtime_enable(port->se.dev);
+
+	ret = uart_add_one_port(drv, uport);
+	if (ret)
+		goto error;
+
 	return 0;
 
 error:

base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
-- 
2.34.1


