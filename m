Return-Path: <linux-arm-msm+bounces-75990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F96BBCD3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 00:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32EE33B4EBF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 22:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387D315B0EC;
	Sun,  5 Oct 2025 22:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFHgVIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA5723E350
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 22:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759702873; cv=none; b=p0LLNvRm5AEYRV/UaU5YNqer2rQJrI/AExHNg/24m2z4VTyOsHHX1ApJx+wPkAqjQMs9KXyz+3JvQgXm5a53WRUjloj6OWRqEJ6kNQE2DqExWFZ/tlejv7tkx9Z9uH7UBUEwt66j5R80Lu2A5o7TvLvEAgva1kYh3zOi9mlnPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759702873; c=relaxed/simple;
	bh=7cHD+gY6xNHhCRPHu3D30+n0F5npnUpgAmdNRrt6vVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gu9q2Zxbuc+KS9LN/EaGMYqzt6GpiFgg6s8b4kJ0JzlGo6SAoROuHC+P3jElWgnics1k1SuVo/KuG3iFu5fwgCNH1WGgLGQJsugc1qh4EJYyjYimkw7KCtJoB2QYQLrDvbRb6hyq/fB1D2/vD2214jad7tmP7THqCCaG865T0Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcFHgVIZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595JvEeA011720
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Oct 2025 22:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZN0zNeQuSy0FOH1JSb8z4d
	333Fi57TmivfiAw/H2uco=; b=pcFHgVIZwPHzv/d3b/H8liNyulZlti0xUcS8Ot
	lSkY8E9DDpsErhKVDWbB4DCnA2WHe/VkjhCHtQQBp7Pqy9Be7KoRPX/1cyY2T4xv
	vkzsuwECmNxGSebCEorQCtnxOtJrDgEt5HkuV8FLQPQWpi7Ub740q1VvG0L+LQNW
	oLsRlex2VZ+gFeBeNnkZpMYaAgMq3Ad3hI4tfK49MREidyYoY+2kBOL/Jl0pH19+
	cgu8W1YWinbuZ5eaPA/nUUiekRM/CG4TBA2oaHKmXayUP5Wms+yvYUfBLPG1xezl
	apVjIvfrLzfsf9BH4XOVzO0tZgs/rzAJMxqF21cJKHpuYmaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhjcq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 22:21:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-87ae13cc97cso549609285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 15:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759702869; x=1760307669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN0zNeQuSy0FOH1JSb8z4d333Fi57TmivfiAw/H2uco=;
        b=QcJCiqLBdB7Jl0r/YiFZcYFPUL6WnJpuq0V3CeZ86WLP2cS9SjexT4eAQ9eYzc/6V1
         ATLV7iY+iECMIXbBPSCQ0mo2eW5dnnYH8ieKzV6pI4x2us4kGv3vdLDNUL6pr8MucWY9
         cV+dXJpfvWqHsrA/RgYFmrUOR3jM6iSzAnu2z4mGpZLw2pwpblxr4vWDzJJ3lXewgfpr
         9BsGBcUB0cf8A7CcfwGrlokB5wSdXHNj335G3G/VKb3WDWt5V4ax+fUfM0ZNF/pdf8/W
         8mgOEXYm5LGNd3Erycljntdp+NUckYRxQpZWok/GUmOihcibD96qM2IW1WqI4Mdviz/N
         SwqA==
X-Forwarded-Encrypted: i=1; AJvYcCX7IWNC2xAACnBRaB5aJwJG0asSeIO1JzVPSl3yvAfCWVH5ZYnfGt0e7Tdlu8bRmfQl+nUuxGiDdqnhjUdH@vger.kernel.org
X-Gm-Message-State: AOJu0YweJfHBQOZabeWMHm8DEreWrpO1F1DSKrPLM5idJBu4j45oQo+X
	8dywB9f1urG4urkqxtgdHLshy+b+IqVIMSHmQERWAbaFM0HWjkFSyXWdUfHZtvqAthSZE2+8UFz
	U1D12LCuLn/phN1znmocHWBklkvPc4UKHWHSqpSDYTzM0uepPG3oO+Okg9VqGwi5VbQ07DMYYOP
	XN
X-Gm-Gg: ASbGncubzB17wgZgQFrlbHmMGS3QH7N3Oe0/HsUxmbkB/k8zlSkaAD0hpmXFIBa+RmM
	WRqgQoP5mX3czph5m8PJuir3VdopVvmFJCoTIfBeLsF00v9elWw7BhVExzRIxex+eQNwx9u4QKC
	I+WyWAlpwsaFVdBTieUBBWs7zHIvUTrWxz1E0qSVIV9LkSZ7xtiSl8VWj6rUEi4EKSnzyLwFX3K
	FB/iFPVlzep2asnB/v0t+9f/7pHY9YWMmncJZmZOnIpYrv1EdmJCy4/mFxrLQnip3IscS4VHX/A
	OdWvdhE8/6kK1Gz4VhmxKBveXa9OISqcRWP8yci8J+MIpH1CVCKVNwaAidzMjRrjnru0TtJM5ao
	6iPpqloDNcDIEVuP+cYaCqz/wDRx4JUTx03PBJl4SNzrOPxp7JBRvjxaDUg==
X-Received: by 2002:a05:620a:190c:b0:85c:d089:41d8 with SMTP id af79cd13be357-87a352531cemr1458016785a.23.1759702868577;
        Sun, 05 Oct 2025 15:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ6WzjWlWnBxeQF7fn8gKpoizrFTVCmfeFkh/HrNxy52ErmbLxJ0Xw+wdHq57nckXXojGBLQ==
X-Received: by 2002:a05:620a:190c:b0:85c:d089:41d8 with SMTP id af79cd13be357-87a352531cemr1458013685a.23.1759702867950;
        Sun, 05 Oct 2025 15:21:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4f99aesm37795881fa.62.2025.10.05.15.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:21:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 06 Oct 2025 01:21:04 +0300
Subject: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE/v4mgC/x3MQQqAIBBG4avErBvQ0BZdJVpI/tYs0lCJILp70
 vJbvPdQQRYUmrqHMi4pkmKD7jtadxc3sPhmGtRgtVIju3yMhivuyimEgsrO2ABYZVfjqXVnRpD
 7f87L+36xCEDVYwAAAA==
X-Change-ID: 20251006-arm64-text-offset-a45fee505c4d
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4joJ20LHDFSg5RdA2ItH2zZvSquG2d2D43NZi5mcvLU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo4u9SHgUvukSUl7J1uzkT6POW7ukDWqBWl7Foq
 qn3VpCpH3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOLvUgAKCRCLPIo+Aiko
 1XszB/9lTye5852/UUlqhaeEbMMJxq5qLxytLQ++7EEDhagjU0Lwq+Tn3IKVenaztnYHBVg3PU7
 cIph5LO2GqfcS4733VWXzcij0/0zBihdi1ndkuSA8GvtbTI2xEoy8OARQ7tn1Ws6M8QkDG7f8u1
 dislgzeh35upEY2Sa/BVDEKzqxJL8KBuIGL++G/W61IuJHGkBqClZVie9ZTB31neLO8nRUCdxQo
 MOGaaf5D0Jn6BkJd4ZgHPwosuNAUmj0h3STSqeVuSeQBVSMUGvMWCT3zGxanOiLQRX55zpBRjwK
 F1uvhAGP3n5WtBTdB98HPXTT7a6rOXH+3TJNjxS3tlrqx7Bg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX2a5NYNXHmDYy
 EzyXjUk6dsJzXtQijPjg0yEEPP78rzsD0OzGTV23fvvLYxe9zAqhSBK0NyuIBnfuZwVoo/kc3kq
 D8H04ENcPTsdY8XGGWEyQYTaDDipCBg5BiQvLCjyfb3sZ2qWcsSXAeQuTVa4uPU6DcxTiBevrwZ
 THOnEEXM+pNCqlModEWP8rRb+tDmOcw3Z1FrEapNJ1LAs5X1HiEPlF30AKkZZCjO+Hv/oc0oMYN
 B8d22im9IPX7kS1uXZp1Vf9EJp/ucbJL33ytOjSULFbwdfTd8uhMeRgLRjbj/uVZJYfLfih0EEf
 /eFHJKaBCScIwtFSNyuRQxUZQdvrszWZdE7aOoVD7Qb9aZak8KdLX0e3Ji0RKqt+ntqyFG3kWBk
 HidgxsXmeLvkkp+FyJP61qcUkjGegg==
X-Proofpoint-GUID: yoAWcEK6CMW-SWUAQdAnMMYp0US7F9Af
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e2ef56 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nn9dliE4zSBnsTKvRegA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yoAWcEK6CMW-SWUAQdAnMMYp0US7F9Af
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Historically arm64 kernel contained (almost fixed) value of 0x8000 at
the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
in preparation for removing it entirely") and then commit 120dc60d0bdb
("arm64: get rid of TEXT_OFFSET") replaced this field with 0.

This caused no problems so far, because nobody seemed to be playing with
the extremely picky Qualcomm bootloader as used on some of Google Pixel
phones. Current attempting to boot the Linux kernel on those devices
will fail to load on those phones with the following message:

KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
Error calling BootPrepareAsync Invalid Parameter

Since the kernel ignores the field, set it to the expected value of
0x8000, unbreaking boot of upstream kernels on Qualcomm devices.

Note: I purposedly didn't add Fixes tags, since those commits didn't
break any of devices that were supported at that time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ca04b338cb0d173f6d9f5bcee52f6d3d06552599..05e874977de376835625f52bfdda78305dca28b5 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -60,7 +60,7 @@
 	 */
 	efi_signature_nop			// special NOP to identity as PE/COFF executable
 	b	primary_entry			// branch to kernel start, magic
-	.quad	0				// Image load offset from start of RAM, little-endian
+	.quad	0x80000				// Image load offset from start of RAM, little-endian
 	le64sym	_kernel_size_le			// Effective size of kernel image, little-endian
 	le64sym	_kernel_flags_le		// Informative flags, little-endian
 	.quad	0				// reserved

---
base-commit: bd773c01d149aec064ea0fc890a54be277acfa3b
change-id: 20251006-arm64-text-offset-a45fee505c4d

Best regards,
-- 
With best wishes
Dmitry


