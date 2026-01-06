Return-Path: <linux-arm-msm+bounces-87586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786ECF6398
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FC4D30092BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D336314D26;
	Tue,  6 Jan 2026 01:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMl9wn13";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecpfhQwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0950A3128BA
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661298; cv=none; b=WTuvF21sLtuX1StgoFJ3UrHQ9uD9PovQqNbM/+eA18QoEgmObZjI2UxJxySIlVClRa39SscF36/z1v/sUpZHCH+Dt3BxbrYPjizMckBih61Nulb/QtgCRyka34DN7jZgN62qmsbR6/uNtxEhsvln1FbdRfbSGupOUpsh5yx21u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661298; c=relaxed/simple;
	bh=Sxwe6pBBzgKc/Rbx3hGlBLXglP8Dn+Y8xXV50hDaYm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loXQ6uonQGbQi0tcUkwaej/oOefdGL0TGwsPKpt/dguZ0zpewk+EdO7gsUPhAsf7UAtOJFitBbHWV5CgyWtimAJupg5Sl56AS/IGyO5OJs4tZQjq+uJx95xjBjrECuAeuJ4w4pOxLjWUY1AxeYh/lQsFQxTCMbHiZeHaSNBZYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMl9wn13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecpfhQwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060oMc12599662
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIHZTxnOdazQFGAJQSxqsY8ozTjZjXZSimhBE4+TrtU=; b=aMl9wn13r2pa8iQc
	y5aGy7bCAivl74SpmiNNqY1QPMmnGAr/jIZztOwzuVz2ne1Foxd0c1Vm4a2qlWtN
	VjAtWDfj0yitBmaOwJBEc3u9vDK8uCaKoTCDQ3T+2pUMdzphj2tni+F2xmQf7ycM
	lYCoH76UOSv3y50Ty9kIVEMRcQsv4CiZzbwrQ0q8dZ7mY6ITEmM523AqOoDG8y/J
	6KcUIzgxvpSBdjEvcH/C4kk90HZXjVG8av5Xzla93Oe37X0FH9AFtlyVieXFwBR9
	WJlqmhB7R2/XaoSxeXrj5lsIukCnvEmROEiUmYcx3R1xuJJTIHEk9R+eqEFIdB9y
	NZ1zyQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pjes1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:01:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f5fe52b10so1148282241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661295; x=1768266095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIHZTxnOdazQFGAJQSxqsY8ozTjZjXZSimhBE4+TrtU=;
        b=ecpfhQwMsAHCA/cCKWnKGJ13hJXul7jJrSD2dSVHe/9RmuvYjBg/wy8jpqCPR2FV0p
         SWfHKYGJVpJnPNoiQg9FmKqFemTpoX+hWnGGP0T5v8JlPfE3/dpg5Z4rkG+hPkjQKsZu
         QT4w/fcXwNAvBhWl+teDL/5Wna/fQmaN+najWCbF0rEH2Fj3CI+lPNJtcaiyN9iAVtah
         LrnyJv4leXhEH4zADye59NwRUpWX+g+QiKj8b5hchumUjX8Asy2nJFm/t5oFxPyubJ09
         u7OHryW3g+KlYy3ilOm76K01wSFMip8xihOY2tCyL9/rDHdaVR2WLRU8f6YIyEmNsYQp
         ZhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661295; x=1768266095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIHZTxnOdazQFGAJQSxqsY8ozTjZjXZSimhBE4+TrtU=;
        b=fSo8B27tHLNaK6Ydidsdvwj14B9ZqZV1VZamZVXo73moed82DjBTUT+6KhSU/rIWJq
         nFbiHt9LZQNw2RMXxhNFsvENzLN4n2otLMnYYZEXcpKVgZhP5A0SGPeAlGI5QxAofXk+
         VStsG8Y6o/2Psa8/hi30SkHVI4TD8BiwL+s2MqX/Tc8EOOU91r4O3p6tp3chZhoGLSFm
         0zyq7bE2f9lk4H30CTpkU7UnqOiVvwrVj/mgOBCxg4C/L2e0ZxucPmlWa9xjJQodrJ4X
         0fk7nYrAcdsqx+4ly2ZcFyABzUlW1f4PpCIaS1hyEJM4RzA5Wzvh/YlS8rAV1CNgJ1N5
         R6NA==
X-Gm-Message-State: AOJu0YwtmPSq4qiw73NOpEqpIYuMVOl63NhEtuu0Pv8WyVk5DeMJJbyl
	zc6domF3r6+EujPoM/7FczfyqOoeLvi/Pi/VLjE4y028QOZqvRozRcSjNHTzXqEA2KIaxAKo3AR
	1QWnOg5XX39xHFh0NFSnnZU8Nrrfpl4cH78Gic+DbQAAg0j4CbcW3QqX9cnOnbT1lgSiW
X-Gm-Gg: AY/fxX5bhG+QnfBcEnpvZfLoN0ov0F+P/V8WXaFYlGfBE89EJF9nI11pV/KGeoyBFtX
	kqbcxf8JetKNjxJj4R7pGQqvGz3sgjVMnzYiB0s71Ul7uwUgHoBpPiIaHwffLykoUbVk1Rqa0sV
	FHyR2aa53zRkeZdpGEtiA+FaBw52/NqOEhJfFak7+MPEGF0PGr4+1fUZxbupADs+noeZKa0CFws
	ARZ3M+tj6xaTHs8vkr/sUAdhDVcANDHDhfzRLAu3jzYu9OR4gT0zWeVck/Qshxf9Ujo9ZNPEcu0
	l6Fce3RkgQy15rX/1jR7LqbFBrX3R3ygEDKxQOSfj/SmjOUb837CV3NaJYZp00X8fKWq/uxWoqH
	KZQHgD18C701H3ayNSQcDP0X8Xk2ZG4p6EFS8Zu4abxiBaHWUTUFUWBdp77LxzLE5eDH1Mdo//b
	+5aw2rCXnpmHqsCnJ4KL+0vMM=
X-Received: by 2002:a05:6102:370e:b0:5db:cc69:7399 with SMTP id ada2fe7eead31-5ec74329c39mr406532137.5.1767661294644;
        Mon, 05 Jan 2026 17:01:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGebirOgsDiT7jy5CL+h38CH91id84REIWuMIjih8Il5xh+FCp6mTy2jPQ3VA807d2Ub/nd3w==
X-Received: by 2002:a05:6102:370e:b0:5db:cc69:7399 with SMTP id ada2fe7eead31-5ec74329c39mr406501137.5.1767661294163;
        Mon, 05 Jan 2026 17:01:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:17 +0200
Subject: [PATCH v2 07/14] arm64: dts: qcom: sdm845-db845c: drop CS from
 SPIO0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-7-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sxwe6pBBzgKc/Rbx3hGlBLXglP8Dn+Y8xXV50hDaYm4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7ZlqUdRROe+lrbb5qeAmQzNxwRhkFbuQafZ
 1LnRVCUW9SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1VsbCACUB9ZxKyeCESIpnYkNLBvtnArQbybVrFIjFFgB6l3oeJuYSCmeGB8KtWBcWFX2p27bPvy
 l4Aze9U5+0VUf1taw5VP9+CAZWtu0J9j/xyuRRkykC8Cy4zqkDxHYPHOEijFrDMm7mRL+R5SMX0
 EH1oqdcUgqMlq0H99DIFM4hm6AWODt7utQmKjM5NQjq6qy/clKrEbuwMXOFqdJq3gYt1yUbMY+b
 RsiCT96M2hDYAk/EnNDrvSNw+PX1El55uN7ExzhDgQeQ+xxpacGhZkL1YLw54HrtKMAcGhvvDId
 WiS5YD8VbDIFZwP6j7BaWXuWjm97vOokxspiSsDKglf8y87A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfXw3iAYVES0IwN
 hmBz4QJjQ5fBt4zd2dEHcjhZmqoZZ7HzbtoYDTuRCrCrQBhI+vQMp9MLQFForXi8kWt1EQaQO06
 0RoVrKcaW3UksEgm54lD9jWxBLgzHFkRF0MqJjw4EyGXmRgo0AAdTZpH+K9Jb/u2TH/TjiFvu/2
 9uHWy5IhOu6FoIi+ZcGySnyhJSmMgoV8YoYahLpyZjM9qEfpC6N/Hrh9mG0aHK+SBctUpN+fRvB
 twarL01tRpehKglnzslRR+4A6MRt4KrIPStkv7CSxOAjLLSc/3Xnns7BWG5BI8NuV4f/vkUKiF5
 V5/fBDGgwWJymkloVGm3tcpr9LncVjQh6bbFiT0068jHhNLMI89QM4M5b0LOXE4XqLxMSQ697ny
 aL34f/Vh0Da9dPJdx3BuhoVmEFNL4eHCXGQnRE6IbtmHYVkKLiB2cNXVprGpm861kU6L/3FaHQK
 q9ofpqKFL8pC0/K0LUQ==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695c5eef cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vj5tKrsnPMLlX677hvEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: c-6dYgbdmz-Dfuy8X5p7bslEiAIUZBza
X-Proofpoint-GUID: c-6dYgbdmz-Dfuy8X5p7bslEiAIUZBza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007

On SDM845 SPI uses hardware-provided chip select, while specifying
cs-gpio makes the driver request GPIO pin, which on DB845c conflicts
with the normal host controllers pinctrl entry.

Drop the cs-gpios property to restore SPI functionality.

Fixes: cb29e7106d4e ("arm64: dts: qcom: db845c: Add support for MCP2517FD")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ce23f87e0316..ad283a79bcdb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -850,7 +850,6 @@ &spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&qup_spi0_default>;
-	cs-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2517fd";

-- 
2.47.3


