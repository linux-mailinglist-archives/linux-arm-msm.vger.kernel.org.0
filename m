Return-Path: <linux-arm-msm+bounces-108462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKS6JqJDDGrQcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:04:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30657D1FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0D9F3050CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54763F4DC9;
	Tue, 19 May 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZe77LZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCm1EZo9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FAD3F4DD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187833; cv=none; b=E5RS50pLP2nRGeb+yJUs07AVlWeer/BC+Cr1r7jr3aqX1uYzrjaHlk4wYVHfqXmHTveqWMahG0VDvOO0gNjLr+S2mTk70gHqu8JlP24P7LSNB+2KfkqkviSaYaC5ApPrKppHRRAZNeKCuCBr7JfTqD2tT4CNzdhuexr0r0egvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187833; c=relaxed/simple;
	bh=QkBvjzgzUPS7j6rbYYt0+plzzSIJ+yEdKR2h5bans+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsukTPh7/qQGbiruulgMRXxJ+1d9R0lf81C2VheUg9OVHmbWWvInp4yJS0eUsePdg4rMxWfJ6+dugFDh4lOcygZ4mCpXnA+9ih6IRV1mSV2982vCvZwMyBU4Xfignl6xNqKh+LPrINfPFEiGgxUa3OIUiDrhfIptan29TbJMn+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZe77LZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCm1EZo9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7XhDk2975395
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jD4A3DvHqusxb6pJNGa2ldrzXIBVdy3bObx9T0M3r9k=; b=WZe77LZctWPVbHmC
	vPpddlNZhWFfM9Ue2oc1UBvOf6pMrLYI3iJs9GYi7NuCqTtfXYt3mBhBoQX7ZVV3
	W1dWTqHETPMPBtHHPMrgq7Ulgquh+EqEIoTJwr/9hgQ+8/5GHyGnqSSZbvxWbtL2
	tiAOzL8AqIxAOcZ/d4gx5msq4HxeXLOTXTdiTrnKj3FUuT5zpUq4RDyqRJN5pk2O
	ufGhaq8giaj/nvs8wazW5NCli83ZjFDmu6wISfB1pbDnkrb6cP1e4Lr5iqhtVbNw
	Dw9+ZhV3V+km0ZZp4qXbpLU2UKqXMAai36mmQ7SQV0vl12x47NbSF1Q8mDvtPXFY
	sqKm6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4c389-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828659ecd4so1510313a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187831; x=1779792631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jD4A3DvHqusxb6pJNGa2ldrzXIBVdy3bObx9T0M3r9k=;
        b=MCm1EZo9NZAdAp1loIb1RNLVY7iTL6Am5H9z/UGDVjlvh3nGzTTSVhcK4xXQvzVgU1
         HtkL63l7PQfDBUoHfdy2iGZeN6B+3PPnYH6+ANHK+oC60MW1iBwA8jG55ci3YUQ+xKLV
         7fphrFQFzlMeEWnSN6WWJf8wwJ3q5eKHUMkj3ZOK56Qs7XYt/7ZePr4fxCAm1Q6f6xUX
         bMA49qY9dUYK6wfJTDAfTS1LRx5gvkw708bUa9H3YYtqENUUYYipIk2iV0e5BHh+z8+2
         tm8Ao6YglCVJdAwF/uyp31we9HF/1VTQ/WUbbiDT5Nws0Hts/WeDGgoltGfADhj+xbCc
         8O9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187831; x=1779792631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jD4A3DvHqusxb6pJNGa2ldrzXIBVdy3bObx9T0M3r9k=;
        b=XeP4tqmPWGg8OY6bIyOYDDTKz/Ty55gOUK60JKiNEZJmRHtdZ5BtGqH6UqDuA3FZ49
         yRKUwE76sO/ppqrrFq8ewqqiuaxT5Hz1qsLXACsVaNJ957f4sLyCbITf90qn+miPATdE
         vVJepmrUKAfzZe/Y4C7W1MbJ3+TSrvXUfEroBIsWs5dIrUPxEG4HVZxbULkmkjDrehwD
         GbJvBZMDLli/CNIzc/Dn0EuA4rRgbmHkZBZoU/IO5diRwzrvvZojWY/hToQYuhOsOouO
         CZL8KhRRAPfjG19i8VANaZmkjlyGKEul9dbNFkSci94GRf96KDirSJm3o12/sMlgXXFw
         8how==
X-Gm-Message-State: AOJu0YyGRAsLJwZb4t8b6PrNl7My6P/+UUDr9QWK8L2MDtixyTkhitAu
	IQzCNWF3y0sqbL8U4fKMicUnBiN3mZO5/yncP5CGpffVBTpUPT1tKHbxEUV42BhTdrpIU7rvxHU
	C9HaVZxlUzOL0EsWlmM21zmheuATvwmnBUwl3s26vYDVWWiKjimN6nkuiVNT3IaZiTPeH
X-Gm-Gg: Acq92OEnPkUj6lrHyEnuH9M+4Xeu32+DxYUZWf8UiUCS3GNstwG+K8voneTUcfELhQi
	23NnoOJ5rR2IrQ9IvoPPU1nencdZcwizVMsy4iM1kfseZy4Uti0WUfbni5l7D0KEyUCWF1LsFDz
	BtU6RDJvuvhwWIUi9ZsTSlCh1+cTuQqtZKsM2hprp/IwR7nOGlDwD7UjS1mF9TKtnzWTlylIDa4
	oWkDErEyM/BVH4pO5SqP6S5tPfdbXjySVmoY+zLCvpNVHR5Cz0CkJ4Ad1DXlifbl2yeFAcJ9RQx
	Ucl/tlZffIxeQSPUUz1yHuG55YMXjrUe1pA/kQOUi7an4otF+mCp0fMCIYc2pxJoEywLj3UsyGg
	H0nIUenbjj2RVR9/3xUdl2SQewlSEtgTIzEiQOdH6GpRhFPWJyUwMMjMg
X-Received: by 2002:a05:6300:218e:b0:3a2:bd1d:d68c with SMTP id adf61e73a8af0-3b22ecb3630mr22180408637.50.1779187831065;
        Tue, 19 May 2026 03:50:31 -0700 (PDT)
X-Received: by 2002:a05:6300:218e:b0:3a2:bd1d:d68c with SMTP id adf61e73a8af0-3b22ecb3630mr22180368637.50.1779187830541;
        Tue, 19 May 2026 03:50:30 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm20877879b3a.61.2026.05.19.03.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:50:29 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:19:51 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: glymur: Enable SPEL powercap driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom_spel_driver_upstream-v1-3-75356d1b7f94@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187810; l=1088;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=QkBvjzgzUPS7j6rbYYt0+plzzSIJ+yEdKR2h5bans+I=;
 b=kdvWLzdOynXwDBoB2O6Sije04VhkPQ32HFwYGtVfrdeV/M/jABz/cCEHZAaxKeeyGpWxv3tMz
 mbI5Yxlk7YkAjF9/AxW3B2mTSCZFacwYRr24sphwJ08M2pMuYIbXEr7
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c4077 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0DiunMzU2dUnP_sjRnAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: jkfSiTqUeFY2Euon78WzyL4pt0LX-SRb
X-Proofpoint-GUID: jkfSiTqUeFY2Euon78WzyL4pt0LX-SRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX0keRBLMhkTTw
 7jscRK3yf7JLi6XlqrfaxhPphm4dVScVPkjJ/ZozIqYzTIiNZBy6imw2WEXWFupzsQdQsXbIKex
 tvgAbWscSQQBGNPDEP4bwa3jHDCGAr1HPGi81G2WqEB028s7JQLILREuCBOFtgxiWaLX2xewP+r
 6nf/ruB7LsXoYZCQmhetb/WwSNNR2jtOTvuHfL7THFIS/aLwilttx9Q+gPvKdBmmjfKV8SPkjk8
 2rgy4mmKhubSh/Qss3IaSjR6AphDAHQh7w2isc8GPUwE3d303/I66DnSSvYAydtc1BVbyv6uscW
 zkPqmZZvpcMgxSMTVKs6Qrr5q5vc74i3ZCiGkl5fl6TvmwyMXfoYGYTdqUIo+ydEDa7VOVpGNUu
 BodVdWU4mPSOYOJcdLgY6Ovn889E7xNadguoxwqtes6wx0l1htRSC6tUpDy8EEIU36CplinG5JE
 xcDlJdhuqE9N19d7Dsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108462-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,c48000:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E30657D1FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems for glymur.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 72c7dc6e4f09..c0ba8740ae41 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5033,6 +5033,16 @@ spmi_bus2: spmi@c48000 {
 			};
 		};
 
+		power-controller@ef3b000 {
+			compatible = "qcom,spel";
+			reg = <0x0 0x0ef3e000 0x0 0x1000>,
+			      <0x0 0x0ef3d000 0x0 0x1000>,
+			      <0x0 0x0ef3b000 0x0 0x1000>;
+			reg-names = "nodes",
+				    "constraints",
+				    "config";
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,glymur-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xf00000>;

-- 
2.43.0


