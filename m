Return-Path: <linux-arm-msm+bounces-107892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIufHA4cB2rnrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:13:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F475504C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 451C53071150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7351547CC8E;
	Fri, 15 May 2026 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bomZHud0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMNYyji9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363783D25C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847086; cv=none; b=m8e6sbfOKtqd961ClLfTAawloKNe0eWci4kbbhY1OmjqmmP9eYJc0mK+FK7MmYIokKhj724pyMf1/RGxxYEQx193PPeoDRKPIX6tEz2YNEwDElPKIa0n4eMi4sP9x6ythSgrLKV7HA73R97DY3tUNWNmFnd0IboVa/2CoaLdToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847086; c=relaxed/simple;
	bh=XU+CHlOt5PhDYuZibmrNgNvf5AfVAj8geaBn/seH7SE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CnMLN7TohmI5lpWqwRVs496vD77Nj2MdZX7ZBiWkNLzxAGI/gUP3/vgqZXFeBVe8+WyBTMclw9pKQa2uHpzeTNWTj0jn5CO60HZR0XxzqpECW4IVm6Sv+pA8oYaIkEbQetdnHZgGcI73AiqcGuA3/HzHLRIMQEAl+OFkjvOWXSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bomZHud0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMNYyji9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBOEbT4020774
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sSkmZYTIXecruKnIHKGbRC
	08I5nsUev4oLNdqPbSV30=; b=bomZHud0JkdOHRFEvU87X9Zgqe2H2ONXINNV5g
	kmVBvv5r25s+s2mkfaVLx2uL2H4/sV7RPFh9x+pjpqVr4Z8UtxFrL0tvD54OcPNG
	0vkFBkpGhZjpOMfCQm2ZCol9dI8CLTBSO3FKADLKvdksjsRx9mKu37TPbxYmfUU2
	5P4pzmm531mEDJkgvuwHpbciQQbGDksee9GGRoUVx+pLmmWCF84aa46t/siUfVrB
	m7whUbVSyWikDx0cFy4QPBn07VB/42kK52jInNAKgHDnMbLcRljBKZcRIL7zHxYc
	1C7ugaCtFlD5yvNi/f8FKL5UfL/BkPzw5S1LKXACie/AhqsQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru639-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63cbb164b37so797774137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847083; x=1779451883; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSkmZYTIXecruKnIHKGbRC08I5nsUev4oLNdqPbSV30=;
        b=TMNYyji9YotrgysNWNI/TJgjfcm+EqYP3qdFKBPdRygdhdxT3/zMvMisJJlvfzbJq3
         hPfgXJDepeHnjfsKuHl5WAQDVDDsYAM6hmyWYxLsmxkZjoMlmkNS0tj4hBbJyzuCFXWU
         xB1H3mavf0XnVM9+UM3AcCMXairvYZBtUWK43dqcG8eir8CqZNnIf1OvYU4VhH4u0EmE
         oaXKiUplFcpWMUiomqHKsOybR63hiXcRUKKw2kTj5AFW81jqQvmBXDOLpHxZqOFuPSyl
         HOSDf2K9umnHVsehZOQ9eVcU0sl7wZZB8YP3rMja0lPlj5QqurgGGKOoZSU3IfzVUsDu
         o3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847083; x=1779451883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSkmZYTIXecruKnIHKGbRC08I5nsUev4oLNdqPbSV30=;
        b=R5reFhni2rDqU34KUKHd5dIefMLii7i31+D6dWV0zb89GWAwWrOfTOhbOYAoD3a9+e
         8UnJtP/gBUVNLmqyp2bRax5/2b7Ff7+dWYf8mUSSNH5dstBdS8VdcZ1n4xjuniB5Jtqp
         xFgyGgpiWGeG/BIDtp9wS9VIer95yleWVQb2Dn3g2eFOYwKQ+3jdD/KkuZWTcMX4HOuf
         z04Ow97zpAJTSU8MzmiBtKonad+AwTA3l9/v9cCtwXSqHWsyjV/kFyBKrcwHHvLB1Fps
         /8TfbVtk1ghieSRYO9rpFkJCmh7NMJZIRoynjSW+YSIj5ZwO+JkxvFEWi5XhvAthFG3x
         ZxDw==
X-Gm-Message-State: AOJu0YyamiTlG61rUWofjYPJ0Apk8x6fGqvyrX2IMT1tb84vEHGUnR+f
	sTASuT3lXy4aSS8s/0abfkMvKlDMEVqPzuVkqlQoazUvirUVi35q6xd1lXoXrt7LMJIta+vt+mr
	HsiHB+paggNUlBztVhrqQUVmWTnlPNuZ/Y2mMYaGBf7vd4vnN2b4svUhv/sJsrU9Nr+uw
X-Gm-Gg: Acq92OH+TcKrV4XICaQBkECkeibX2XlFh7HUKDvE0ogt2eNjDYz0q+4gSTLYajPk+42
	FJRTDX7c03I0CkBfa31H/0ItK2FWzlye1lLLEZd/A8sz9f0UN3Fw5TgkjUh2qroNAYTnucJeySs
	e2HH6/uL6c68fnm21mRCk1xNswFjQBa2a2O39JEPX2ehfY6RHBOf07bcmyRc6p3LbdGUb/QZgi4
	TEV2pWRqb9LfXiD7DZ6C1nBcPkiT7Wh1KiN1Kw128c55oijNWA+Bnuf1Aiatd6g6jG9N777n3XM
	8FRu2UhQlOE1nr8GjJOIkKVCewX7SXvPeD1U5YfcIQ1eX2gmwfjmKkjCFJ3z0YOFKIdN/qDvRuX
	yOn6UgCsLUFWRapRs24TaTudVE7FqDQB6zCEUZ1ICvaGZ
X-Received: by 2002:a67:c490:0:b0:643:80f1:350f with SMTP id ada2fe7eead31-643812e4be5mr107677137.21.1778847082805;
        Fri, 15 May 2026 05:11:22 -0700 (PDT)
X-Received: by 2002:a67:c490:0:b0:643:80f1:350f with SMTP id ada2fe7eead31-643812e4be5mr107661137.21.1778847082312;
        Fri, 15 May 2026 05:11:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm66855685e9.7.2026.05.15.05.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:11:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Date: Fri, 15 May 2026 14:11:05 +0200
Message-Id: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkNB2oC/42OUQ6CMAxAr0L2bQkbiMQv72H42EaRGthkBaIh3
 N2BF/CnyUteX7sKxkDI4pqsIuBCTN5FUKdE2E67BwI1kYXKVJkVqgJyEwbrnUM7wWj9ALZH7UC
 HoSxAo220lnjOpRGx8QrY0vvo3+sf82yecXeP7kZHPPnwOR5Y5O79e2uRkAGWxubtpcpVY26eO
 R1n3UdzSOMQ9bZtXyNi9CLjAAAA
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XU+CHlOt5PhDYuZibmrNgNvf5AfVAj8geaBn/seH7SE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqBw1fnQN2uhVGsdrXzzWL3kI11Nw4R5g4iLmrp
 +q3qgumbo6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagcNXwAKCRDBN2bmhouD
 16GFD/kBR9A7nnTyl5hGs+7KbFU0oSLm9bfu5Z4ddAgbWejcuDPTCNsv31UXfqZe00Cqtg5V/pB
 4cbri1iSDhMcFlt6ysA/WFKljgxtM+MJJyVbRaLS8nMSIVlJ/d53jLrsMRLp76JOSCDVFlylQJ9
 zQnYS8Jh1xouIzRw7oqxsk2+hGQpaYYOuoGvn1LIwz24WqMvconuIcs6xHRr07RK3kTsA8CSbYo
 QGdpQ5hHWyWAAYK31x4Aa+kPzi4tyaj3qCo5pPnkRP+Iqf0tzh80ZA4RLNp5K/zfDPU8FUx/Hsp
 nyUjZ5zk4PG5DrBUfb7socXqOPUxPSO9JoKbiqdGSwiSRqrg5TewyXUCCIs9Ft6RK67hLCkZYfA
 CSVQ7Q6L6apYGoQll+5HdAXVGE9XczIgCRYYcb10hcWaJX84JFiezRenCefmD3TC0dvquBK9xPI
 aJv/2f9azbiQWOaxRXoIrhaOtOBXGj47t2RxjvYjAN8hJ9RoyFs8UHkoG0LK/Yh+pxP2124N7zi
 UNmdaapBoFva26d00DCVcbdtfMgkHIwd6ycQ8+Dd3dxDvUt68tOZhfSwT8A1ImE5Nu0YM6jjjgK
 pc+dpCejuzJIqUxrlJvTd0ZZY21NZfzqhDbjiLhZEib6aODrwWtGw1YTSMwC9nx5UVvGTtIXQNn
 PxZVBOBPpdco9OA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: KCp6NBBhQ9BGLMyp8iLSkj4xSJwk7JQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX9b2vFHEiKBzl
 2xe9ALEo9FXY9TF20yAyYy9np722FzjE7FC11HrUYmMroPCn5gp8f4IEMRUYzrFYZLMhv8t08c9
 bMq79ReV5kasZ21P47DvI1G77HRp52rFfA4qZ7YSRuK4n9CHHNWjdq0wI1mvav0JI+jBc4ZYCzw
 3x1XX9iosbk6yH42uaoH0uqX2WWEhCoHzK8V/hAH9fKKmJe+8C4QDEUYjv2IWmPlE47y9IlnZkH
 WqsPr7cq1PlNJELV2lVm0CX+UgnYwSo+vLpGFj2xHd4pfS74gV6c6hnN3kzg4zx7v3GFjgcZbBD
 FqS7Y0DctTEiN1VGMPOd4K+O8HIkAkg/up9lFcK0hDy2ce0fEiCWUajmnBQC2RVHu2SfQCF+yRg
 bEqahueLMCwn3ztN+B0RvT+iOIm8MDgn/eYxXCeoaMOWFQQj24/NNg85in8pp0FiuA+XOXiT5DW
 Z/AKJksw5pnzAriq4Zg==
X-Proofpoint-ORIG-GUID: KCp6NBBhQ9BGLMyp8iLSkj4xSJwk7JQJ
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070d6b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=baCi81C_hZCJqKNWviwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-Rspamd-Queue-Id: 68F475504C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107892-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      interconnect: qcom: Fix indentation
      interconnect: qcom: Restrict drivers per ARM/ARM64
      interconnect: qcom: Make important drivers default

 arch/arm/configs/qcom_defconfig   |   3 --
 arch/arm64/configs/defconfig      |  31 ------------
 drivers/interconnect/qcom/Kconfig | 103 ++++++++++++++++++++++++++++++++------
 3 files changed, 89 insertions(+), 48 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


