Return-Path: <linux-arm-msm+bounces-107262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN8qJmBcBGqiHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:11:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8526531F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3E2A301C004
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7423FD123;
	Wed, 13 May 2026 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga1aa105";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJkAQnJO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421713AE190
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670676; cv=none; b=UmJQh9DeSTjnAi+iKZS7VHsgrSp9Z9qTJpcOB8IDoVg2CUU90XqvCpO/klWfpST4iAkq9JuTd++4IsVtbFb0LCjbxGEov6tTG9YRQWzX9q+4NicnP3ExwBpM0E2coQ8vuQF3cuxDoM0yXMUGdtU9qdXRA8UdN4QN2DYy29guJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670676; c=relaxed/simple;
	bh=iN1HV5OPNHhdwyWix6T+IErfwH01Yr2FulFiA/kuBEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jpmSH8fxz90CSsO+bkRX5FBwn+4HXljEbZCxnGCCsfExm4HJLnozD9eYoEn3dlFJ2AS9Ysn2vPyUeYppcIYecywWb04dDcQS5mf2QfCQoiNyZvsWuwcNysm8RPJ5PEP4Zn7hqboeP2WFTQJXwM2cJaZBJ3p0f1u5XP477OunHCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga1aa105; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJkAQnJO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6ieJt2965201
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7uC/r7pFKSFGvPn32nt9OC
	YO5lcLXRl9AxNto3U4dQE=; b=Ga1aa105QNDZ++56iQx2ny1s7rgRxOJOX9kvKa
	RAMu+Gm2DE40LtCibdUM2Gb1ez8pdMvC6Qy/4NNgE3NHuqjDLr4n94Uax0Gd81m0
	mJTFsJRdwPo/p8RnLNAcYWNVJhpBjh2b8/Mg+tQaiXuR4+snZOdt5F69wa0eSO7B
	ssQRhdaQWnajLe/AufrGmji4Ewh8Ffp17/t6buSiETUrwaryuhJ3utzNkPQ7Ttdf
	PV1h4KeyXSxDuaATpElztUq9AahpqEVUzpm9ikXHFQM80uySnJ9nCVYhDv0gcqNY
	cW8rt7/tIDxVP1ulzMw8JZoNOc43W4TNYoREoKpdBxtjELjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma591fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514a182b90dso50252291cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670672; x=1779275472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uC/r7pFKSFGvPn32nt9OCYO5lcLXRl9AxNto3U4dQE=;
        b=cJkAQnJOJt8Ta4nIO5Se69GbB/37vJgkziSa1LAMHxpigeeLmgyrUr/+YcQ2ZOhWBH
         kOJenDNUrozNFkM95hFRP9Dd37x/SA1fA0ATuZUi6mS1/1UAttO5tHBD3EBVlslMHQok
         Zh4TFQe6sbGaOYpO0LPHVGwevmqu6IInBgwgIGbCmF5LDl3orjwjbBKXVJMw2r0sIB50
         TreeYfm9aOXLk31TpNd1Z2G8wgVeyHi+1deb3JRayhDLSUfLh/FmTmZ003xSsmc997Ty
         69CT0B+h6iMiqw8Ej5gCyWhsb+ZLpCMJp95uLba2Qv3dqm1dmf6/avbhV1FDTSoJJbDc
         HDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670672; x=1779275472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uC/r7pFKSFGvPn32nt9OCYO5lcLXRl9AxNto3U4dQE=;
        b=rGlEJfGZX/1S+19+h1Uf2I/4Ic0tKJM4p+aPbkg17k+hAO/NMQXEorwYfk4FDGP7GF
         EDlcmdKoh+BeFg8nhUBG+yY1L7liMmLrkdkQ5eV5GvThHirtX3V1L5hJ672Ys3oKcm7b
         ZZSu1vSJjQatVlDvEbop9Tf8LKTRJ5LKoFmfAXk7Yf+j2+Nr9xx2fZjZiLa7ZXU8pZHp
         TPswWgalAtuiL7ZTv9ezb/2bYBrt2fzg+VYtcXsV/QXy2tSvUIHksRPCmrB2ufJSdPgs
         YOMSFTgMf6PyBG98o0mbKHe1TniHK0AbI7a7gFTa1dlc8uqURpGmQMS2yVRkVNv5kS8v
         WpSw==
X-Gm-Message-State: AOJu0YxJif1Fc6dpGJJMZdDzrUH57MjA5/WIeTEU0lM7QR/+aiyX1WRI
	XdZeV+NWijZW8yz3wrwF52fl/fJf3he1xpwsrBQnC2MqbO1kTAMwW2qP4hzyQTMlQ2n3cjpW1kX
	r1d4uY0iyLKf8Lqzysi0OvV8GRaQPgYhILSToec62Qd2YD0uemb5aDDi2+H46fc6s9A5h
X-Gm-Gg: Acq92OE86r6O34Aq3qyTFa7GSX8Pbj4nlJmwbUCTeLmOZgEG+UpPXzY5BuFOh9rpEdz
	WOlONMJUPw6jpc64fRkJXRuOptR11b10oWD5q+HicftMdtJb+b687x5MuaT6+kQYo6+YJhWYs1x
	4jlqI3MmFbPmFuj/Yo+ZdMn1RgagYuxCSwSrxJGZaLhs8jJxCvCQ50EuVG40VKIoXgRox0JcBql
	v98AZ8+56QD5O8c6GhHS4dtWkl3/ax94wRctu8/buDsqeANUNorRpArNUcIvuslRzmD1w/9L/uP
	+miyKQc9HSJgWVUUOLRM6o5Nt8wutLOWC+TelDvQQvqO7f7MUS52SZpamiMd+SY76zNIizG4LoQ
	+hxZdGOZpNNfuYA+vwXJjveAV7LQZbA==
X-Received: by 2002:a05:622a:109:b0:512:e813:7ceb with SMTP id d75a77b69052e-5162ffa9799mr35251581cf.46.1778670672454;
        Wed, 13 May 2026 04:11:12 -0700 (PDT)
X-Received: by 2002:a05:622a:109:b0:512:e813:7ceb with SMTP id d75a77b69052e-5162ffa9799mr35250971cf.46.1778670671873;
        Wed, 13 May 2026 04:11:11 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8cd49fesm72081355e9.0.2026.05.13.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soc: qcom: llcc-qcom: Add support for Eliza and
 document bindings
Date: Wed, 13 May 2026 14:11:01 +0300
Message-Id: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVcBGoC/02NzQ6CMBCEX8Xs2ZJtRX48+R6GAyyL1BSqLRCV8
 O4WuHiZ5EtmvpnBs9Ps4XKYwfGkvbZ9AHU8ALVlf2eh68CgUCUYq0yw0d9SGEMkTlJVmDbckEQ
 Ig6fjRr832a3Y2Y/Vg2lYDWuj1X6w7rO9TXLt7eIzxv/iSQoUdYqYUJbnmVRX6330GktDtuuiE
 FAsy/ID/G1xnL0AAAA=
X-Change-ID: 20260428-eliza-llcc-312b07fefc10
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iN1HV5OPNHhdwyWix6T+IErfwH01Yr2FulFiA/kuBEU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBFxHi9p5LNmp16JZccf945QOTZzX8O5ZCdXUK
 AljA2r1WGOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRcRwAKCRAbX0TJAJUV
 VkhfD/462UrbLzP4Ht5LwmuD/Z6Pn7iubewrt6/ePH2u72Rnt1s6mYxXZqOF2XCS4/Rkb6Vty68
 0aEKCdJXIHDsZjIcsxBlnH80Nf0p1CqLw2fSule2FrKV5q5SJN85fFweq3vzX1Xd7EhqV1UjC/1
 /cK0bTNf4L8svkrVznzvMM1ROCtmL+Iuv8XsW3sZAks+V6YgllELk5sCc8jlzxS9DeJqul9LZ/O
 gPt0zuuMd1RRVF7p8Cct13Jtvu4mqqhsMU0BrAp2q3zYTrJpPjnkk6mUaBaitZaqLkoh0Vr1b/5
 khDYQ1wWtMSe9u/7L33pIF+hYGcs/o7wVNsiQASfNXVVX5h/E5gpLP9avSAIrJSjJbLBu2eBGF4
 BnCyF6RbuVrrhXn6FFzBnv6M2ryrLtUycyGXoUXbQYtveHx0E/rqEZfbXi4gNvFR9RmDq1B938b
 OWr6Ykhh8r/KTEoczpRfsMLeA9Qo9/s8lFNP3L6myraEXh9KAqGNIi+qGQHRyVTUTNMrYE7EUYK
 jBU71ijocXfMIkNI12g2yIltPl/bim2q9xD7iwmx2dyu0EW9qVa10Pvc8WEPxjf9l9JSkG3qfZU
 VJBU3VwnvjzgRr2IlQ/xLx78HYrnHvNxl5l+/90VgGpOfYx1uC/uICa/49C3AJnABvLPrwAG+Af
 srfsq2BMdDfmUHQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfXxngOyM5HVUys
 VO5SE5JibtG4Gzzd16dHpBWb+23Ilm7gFHpFUmhrqnVmpvwqPPDEAPghmw5yz4xyL7VayB9a8pu
 MCU2xEMkupGHy9QSQ+PuYfIHfMZSQS4g6On5qEcqyCLxFCXlFDtF7KN4VRu4n/LQH4WNfQ+9uuY
 hPbqKsb7VyWC0w2NewOaAgFaKeY/UdWrIC7lfWcwkpCxsT0XYjhXFYLRda3zUpq3vvqe7XIWvhf
 mqoYTZQNGmF2kvy4IEhpq6nDVK50Z4TqDV6qCZhPbfS6Gy4zAaz07fQ0qvyqfo3CDMTVg2w5wbo
 bQzCFAlOo42GIM8SVIGrU7tdlacwxaHwrmjMNeUvpMwYuhA0sypxXbZPpb5+kqt+c14u5HExGUe
 Y7g3G/GEm0HNP6/pkd7jIMCQmTJ3csd6L58P8lIcM61Uaw9ss1GXeF2CKSsN7KH3Xw9TF1ODNQF
 BsNBXaBmsjgX549OcWw==
X-Proofpoint-ORIG-GUID: 6i6bPqpmIfSpmO0X3NLmuaTxZ-jPD0LI
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a045c51 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uu_H6PVXkXtSyUBkjJEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 6i6bPqpmIfSpmO0X3NLmuaTxZ-jPD0LI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117
X-Rspamd-Queue-Id: E8526531F22
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107262-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the Last Level Cache Controller found on the Qualcomm
Eliza SoC.

Eliza's LLCC uses a 4-region register layout, with two per-bank base
regions plus the broadcast OR and AND windows.

Describe that layout in the devicetree bindings and add the corresponding
slice configuration and driver data in llcc-qcom.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260508.
- Replaced the weird phrase in the last commit with something
  more sane.
- Picked up Konrad's R-b tag for the second patch.
- Link to v1: https://patch.msgid.link/20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: cache: qcom,llcc: Document Eliza LLCC block
      soc: qcom: llcc-qcom: Add support for Eliza

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  22 +++
 drivers/soc/qcom/llcc-qcom.c                       | 180 +++++++++++++++++++++
 2 files changed, 202 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260428-eliza-llcc-312b07fefc10

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


