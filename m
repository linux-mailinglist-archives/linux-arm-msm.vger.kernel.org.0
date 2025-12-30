Return-Path: <linux-arm-msm+bounces-87020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55243CEAE05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 00:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C4083009F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 23:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125832FD660;
	Tue, 30 Dec 2025 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X64159YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ds9Pc1/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3952E173F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137779; cv=none; b=UiOBZNMfMZOOMCwlYrbVVxw2zMlO9oQ/9+909J0+tVsS5huzTeC84nDG5VNdr+ht0/Dnw+CMZaPqVJjLuJU6tECPBNyl7j/6du5UDOW4DrG6pCUu8nCfkSfXmUe7HFuClbSFPsDN5H+p4mHZz4F4wYXa5W0FPMU65aV8Na0FgPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137779; c=relaxed/simple;
	bh=FGGim44BfWQjkV94IPZI9LwB/0tKRgJ7VqsLfgE2Ze4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfXJp2SUmNm+Wpup9yX3O0kuD9JvTyDVwSXEHAi9ai9ANzIvbyjDnXqk3VeWWVQ2+MyhO4R+NNEK+yZGq/TGb5+gnJbYilIUYG7AYDWItW7pVRk8FJJ4K97spx2SE7R7w/k2TCiX93+w8b/wlSGUfTMhvSAkQ5O0p7LRyN7GVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X64159YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ds9Pc1/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8uoS3971615
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yz0M2bONMw9l3lUPyJcEl7KC+6i7WH/5FxBRw7kdMZ0=; b=X64159YKNjQ8Yx5G
	YnPZhErsuZ6tqOaha8guF+8eyfGU2/K589czzzwfeNSvMmvXtmOmrZG1q3FGGNZT
	Uh4Q5PG7h6nB1b6rcyqMHjxa28sRzW4jZ8pVKIlF+ODehbdsd5Qo9PrKhJNPTeOA
	wx07du9EUA+UESqsQGSqA+/eqifBTZbIN3GltCXFuDNQUCdAyhG4KVfEpuPUo/hc
	3WhYt2/FnvDrcnZ9ft7V1CRSf/qNq86LnYs1G7ISaluIOwJjEsad832vBS3gm9c+
	fa7GUZvo9IBHasngo2AQtOZGLDo7utIXkk8yZosDH6TV4G41Qy3DFfKkp8ZQKANQ
	UUAaww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky1dfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4ab58098eso250965731cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137775; x=1767742575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz0M2bONMw9l3lUPyJcEl7KC+6i7WH/5FxBRw7kdMZ0=;
        b=ds9Pc1/DfjUEG7bTanPrfI/25BCWqNJVUxGzmhaUJJ5QTp8sSZwTLD7/uRkHjnmU9Y
         KATFm50D5wmczvRP68nWcxsgUfWCCWk8ExJZU9TozD4G6XS0+QeSz4JutR6ovNPoA8mF
         NUHt4ZVUASMdOTcVVfp7lbZtxUPEe44zvpJ8mpy8knRoSJjNVx4j4k8b/NkTkMU2mATa
         IQ29dog6fBSQE/SjjGFVLGVwTB4mLkrJ5dPYUgPW4whAEtgxW0nUKk3fU6PjUea2CcCP
         zOZ0x5J4Dn27mlw3l1u27d6IOpvkoYieR2KWcoo/sM8V4R8vyt6spbO/FlQp5u016A2m
         7LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137775; x=1767742575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yz0M2bONMw9l3lUPyJcEl7KC+6i7WH/5FxBRw7kdMZ0=;
        b=nnH2LeIhKrQlrVY+dJTVcQTs51A6DMxpDLHNCH5EWPm1nc0H9mjv76rHHlm1x9nZBW
         lgCwWIpF9DAWNwmLQf/6/ZhpC7stZeq0oqLpSccBqntg5JZqrXJcv1661Z57KmRjyShy
         Mw5P/SR61eH2R9x2Drtk7bdY5TqL5aeIyzTZAym9H3fMoj2c6LojmNE3yqWRN5XrzpoF
         d/EIw4zc93wsynGT1gkxoDse/5E6i8sIU0sN43yzpq0h020/7LLzXrm1PHAdzsZ7aD7+
         5m0tM+amNjzAExPYhSLjSZn+fbwXT9s1sfaFzkWAAbj12mXsFtaEJjdyZGv/hG9NID+c
         WMAg==
X-Gm-Message-State: AOJu0Yx8BYUyEkaBlju2Z96hR2nF7aO4FtGmVmHOKI7/ja38UyEZnb1h
	KysJ5fakOX+KLrL82AqTltBzTQQwvvaAPGzDf0BKmmwJI3E789smJiF6jqd5GfRYDuHxsujRWRg
	sFweG+JeKN8tg30DFD2ynIvPorOwgfQDQxt2z4ZabVNkhhqkoXiIUK1Hot/7CLCzphb7R
X-Gm-Gg: AY/fxX5oOsuAaL36ndO0UMewkwU8S+4f1JgHwpxK8kUK6O1zSHqWbGM0xdn29J555r/
	mWzA81It0SmzlaRZ5avCAJBvE41JLI/vkkQjpbscP7iNFX+KaiLFHomEMKF0M5PifSdu2Av4t/p
	DcBZHOqFIZ7G9v5VGJpCUpzwmcIlXB37a0X58OAhrA8eZZPjFtKu8lBVLAoQXq+aKnD0QsUydLz
	VkzV7PGy77QRVGmMh5cVKaX5B9WN4YGmWjqFynlAacHVsygaB5B8uNyCR9ilti8QBkyWOIPfcLx
	UIR5GZjogtwuXm5dNkvWDhmJHizrh2Np8XpLqpn3U4mqfeZgk1HiYwwHJo5T7i9xF+CWJ2FFTEP
	VIq17ROmu1JlQy2lWPToUsYXiS6sjsNS+8R2vmiCbKzIH9Lfs8W2CtQg5Px+kHF5pqJlDuPRtaq
	kwushEsOjSaw0i4IOgyfPjEkY=
X-Received: by 2002:ac8:5a95:0:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-4f4abcd0726mr473645281cf.9.1767137774630;
        Tue, 30 Dec 2025 15:36:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMGGQVJr5nFU32BS3rqlRNKcmT4nwQuRPso4jlVyupuyImgGYdCOcdntUN7XRhnoHEMgqIww==
X-Received: by 2002:ac8:5a95:0:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-4f4abcd0726mr473645051cf.9.1767137774178;
        Tue, 30 Dec 2025 15:36:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:56 +0200
Subject: [PATCH 06/14] arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ
 storm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-6-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FGGim44BfWQjkV94IPZI9LwB/0tKRgJ7VqsLfgE2Ze4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHkABOQMZr6Am7DyYFRXRSIogfZu+iSeRz6J
 dZ6Bzp6kY+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1SMPB/9s6ve61Q1pA4PXAtBPD6/eg5LblpoBoY8MSqB1GYg0vr2VcRReBaI5UcN3j8+jf4XpfgB
 ipggYWe6Ll8hagzxVF86Oi0EMXPh/wMppwJPc5U3oQ6t/4QDozewFUp+uXkzHRoAu6l1b5rUiE7
 FnmlvBBDUiwJelnTQJDhNbem1sofjFQn3X3ToHeFOc0fWtdWkXMG43vqCQHKrv/FIWXG0CuAq7p
 mxoBrUC8z3iqv9fHWgOOnZr0efRh3h/V3D6w1F18vahSHPEKzn5kbXGa7loKJCdZeooj0S0qbcN
 /ZHQVn/+B1PDekoMnUbHdqWQ1bB75eCm98IJFmOQZh1rxPuW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX59ctHjzgbk2q
 BdWA1a72GbOxQ6bYOaE03geC3LZ++fI3fy050NEsn0ZPWBz2hlDlSS0OF4m3Iwtr4x4a/K4mVwq
 5HebktrBgT6fz3akBpfoYFFPKmP4wefPWQ5UG81g4LvwzKirM3l2DQnOsOBCZFTaPV9MbeKLn7y
 8ZSGmEGZYgRXckGzBvy2h1pCdzSzaiUs59J396/bVKM/116mRJMDV+iGLf/XBYV0PMXwuYp7ySL
 2LBSM/p+mvHqAJg9qW6GPWADYsJ5FkeBdXGwJ6ln75KwTQGHib6ncZKv4iLrOsJch6GI3PQ7c7d
 JTzn2aWO/P80jurEdj/owgdy1RSSniT3D3yqNQl8Cr19blXnlbYkSY7MoHWdFqZpEpg/yPr6uzl
 kyAMw6ZeKaDVcGh9c6FogMA66n/7/7Xv+tXHpBUXIpZ8qgp4k8JBigiDMZ/K/ELt2ll9dpEIrUI
 bq9Su7BIDo71nLVnJgA==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=695461ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4EO7c5U0FNLfYlZKXmMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kounWGCUpaNbC1OSdpaKl0jnLXtlydGG
X-Proofpoint-ORIG-GUID: kounWGCUpaNbC1OSdpaKl0jnLXtlydGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300211

Follow commit 9c92d36b0b1e ("arm64: dts: qcom: qrb2210-rb1: Fix UART3
wakeup IRQ storm") and apply the similar fix to the RB2 platform.

Having RX / TX pins as pull up and wakup interrupt as high-level
triggered generates an interrupt storm when trying to suspend the
device. Avoid the storm by using the falling edge trigger (as all other
platforms do).

Fixes: cab60b166575 ("arm64: dts: qcom: qrb4210-rb2: Enable bluetooth")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 0cd36c54632f..5f8613150bdd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -694,7 +694,7 @@ sdc2_card_det_n: sd-card-det-n-state {
 
 &uart3 {
 	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
+			      <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
 	pinctrl-0 = <&uart3_default>;
 	pinctrl-1 = <&uart3_sleep>;
 	pinctrl-names = "default", "sleep";

-- 
2.47.3


