Return-Path: <linux-arm-msm+bounces-109371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIdyNFOUEGpSZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:37:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015D5B85BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE097306DCFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7E736F8EC;
	Fri, 22 May 2026 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTRw7Ils";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKuvOF8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9794737C11D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470869; cv=none; b=ABIdnByCTXOAOWQHWuvbb0iFjkWsyLqJbFIMHdOxshv1rS/G/fOpMdN9Qs6G0BDjNSbPrKt4LlOkl4efQ+0uDGUEm+1UcM2LJ1nbTWLxUVrvR3iTQsBEnGkpVpb2LEtXYhmQ6QwxsNqoXjBdMqtyeNevfEvaBpH6ICo4hb5/TNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470869; c=relaxed/simple;
	bh=VNEhOKBhobQqQsoEuqNm9mT3JANz2GEoOzRTHnEsEfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SfJnSNIhe5dan5bfwMvqufkd0+VjWqWEt9aWa6yAworenE/JTlNCjjbX49FBlE6OOykTcaPTvSYc8uXHKFnNUMzLX7DucF6hzu1qAxmlrWDOwyc2k4Z4ml0bg5ofKRWcVmGvGJo+Tc4jl57mjLfSP53TtpYkuzQeTX6AuCghduY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTRw7Ils; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKuvOF8E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MB7m9w776868
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqhBDm7fYqu
	6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=; b=eTRw7IlsnPnTflsXgUIXt9mJ1aS
	VMQ+9LlouPD7KBhhgzaT9XHekdEG2oNxzRq9OfdrNhgYaIO2dwOwfTb4iN2t+lZx
	cIVCq8iTBkWOxzczU7X3o4yo/2AK0XiFYDAS/zcG1+OsvEaMfII7aWIc/4bCKEmO
	nJd8aEGmJiCFGINhP5wb/4IHePvPDlwb3mXIrwf7Xad8PwwtQMA60LcnBlRBe58T
	ZzBAJNKxYrvv9W2YV6PGgofF8qRSxUnaDWDOwBJVEWhg6JRFV96+4OLf7iOuOYFE
	4oSDp0J0CbWWNuln1VNR9p8QMzJFUZlcAqgOgELrbMT0yJYrSSLut+Wx7+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h4n20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8292a9605aso3712802a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470866; x=1780075666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=aKuvOF8Et889WJBJ89gW/6eB0ydhWlUB6S+h3fMb7mipqdr45xGhmTgsyhajesYhHV
         VVxJcp01vwAr5ZOeqKVpg3UYzfQM/uAY3UXwrS1XU2ks8EN+6IpjEA54JdeK7KzttVZb
         Ws6CxnirdqQzNfyPdjvQnD+UdPyb3xjXwwyU2wzMAA8tXHjL63Uv07ybZ0RFV7B9x6wp
         iSJnyCwkAMTAqZd8lY+Xu2c5TAZBb2Bzw/Qg89wOhcKwee9hgYfNfYVWJHUnGJvK+WbB
         7cPHsbXXTJ0+MBjRB9VAn9QksK82EWzmDKwrLvQLZ2WDPF0LapZNEAP3IhdPjFjxjDAW
         sF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470866; x=1780075666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=Qha2u1AFTwEtWs7KOG34rizmifciKLaCVjiDreu34Oxjxo5gqhy0IpP+Xk7EBPjXW6
         JjWFOfuqKchjw5DAi0XHa2yfuZaJZfSjeLjxbeJsch4aSzUtltMtZXtYNGIKo3/W06Q4
         WJ1FItbptNVXesfT9gHCvKdyiL+F3aSJExhInXy+kjfUBXhFzphztmZyXQfzNcCIl5C5
         VpoxIwQ2P7k8thDwFlWp+CdUEaL1W1kgly4WtZTxbjsVKu2OWFYKzfXIOJyuoabQG094
         9XOTZ+mK6jXz74NGoz2X4H36ND3SsmrWzQPyRuXitCqYv7hzFG6/TWavgzjcq7RzAPkM
         gv3A==
X-Gm-Message-State: AOJu0YzVtp+WS+DHS1LX19+3Net5OtL0/qkv2/DBzAyMMXgKK/jOqwor
	nSHuzZ6kZeyD6jEESgQRk0WRo8v4H6Li75IfB12PiosJxSmtlFmDipi04jbvkR6UcWxezi36Hbx
	wAQnBGzGhbU6CjBC/4QRfnX739S2zQhYgx3IZBbRgIFcOu2ddMTKehqSuXy9GIxCIvTaO
X-Gm-Gg: Acq92OG8POAVZlAxXeuMx6wTOalpOkcM915KFHtZGpghpxJWea2am1LDwWQpq4RqX5N
	jL8k6flUEbgbzcwg/PCubqD0h81dkL87nJ6Gyb2U/c6/gVpAr6GzKyG3ZRV123Z0eouquOCV/NE
	X8VAaf7gkCRgfTT3d6kPOVtS2cHWuBrr6H1qMLNdJ2qJ8tc0fljR8OxSNpJcTGaQtNou+fzAzvB
	a1UW13aTkoukhvBbRQngl/NvomfiBtNp06T9yT+Stj25uO++t0x9D6LPhfjHYlvGUD/1EGLksqh
	IbQARLFrZ2xQSKDXUIs/BE9uigDrFCLk/5lNxrdwlLSj6ukOSS2RQ69SczrV1CU83AkWNvO8hck
	+W2XwvWGEMMWpgu8U49zU/eTfcdTkPqr0w4xFGD3xKHcnMpVLlP6Ajw==
X-Received: by 2002:a05:6a00:421a:b0:82c:249e:a85b with SMTP id d2e1a72fcca58-8415f155bc1mr4845098b3a.13.1779470866327;
        Fri, 22 May 2026 10:27:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:421a:b0:82c:249e:a85b with SMTP id d2e1a72fcca58-8415f155bc1mr4845068b3a.13.1779470865852;
        Fri, 22 May 2026 10:27:45 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm3045693b3a.31.2026.05.22.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:27:44 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 2/3] scsi: ufs: qcom :dt-bindings: Document the Hawi UFS controller
Date: Fri, 22 May 2026 22:57:15 +0530
Message-Id: <20260522172716.820490-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: __X7Prdu0Kx_z1kHwdgw-xivgjnOpI_h
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a109213 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dkR0I6OD3irOzcp_LXMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: __X7Prdu0Kx_z1kHwdgw-xivgjnOpI_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NCBTYWx0ZWRfX3tpBZXGmWwTS
 wg/IeyRIx3hkko2DaqoZBkVWysRCyHaeMZIpFO1bj0jbzld98hFI6p0Ql1plEq2YP7bcvTr2dUm
 LZxQdAKW1mruT0DMEMfN6rP6Wp81HlPcfnm8jz24gW4DLj/exHTGLQv0cDlSmZirehuZM+OEkRY
 6QWEm4BE7nnwPfVZ/7y6Zr5IfS6Yr/q5GXm0IeAWEFD3RSSNZq0ibIYyrH/ups0Tlvl08VE7+Rl
 dqK79tXV13Ndrq/iaM/Bwf+m4LMdmKBckxOf/ctnXaadBNdGxfsW5nyKsFZ9L9P8QDOCsf7iM6A
 COjFYOASS8wxXpG4DAQA/eRFkhza9OZsWeK/YXxiXiYRsrs6ltMmLbLR0QMh6GPIpigoVOUhZqi
 UmHQ8eWIS6UiBt96em6fjikY+7QkqcIQIQiHxfV55qErVUlx5rEX4JcfpIgfaZH5l0I+H5IAh5t
 RmJDEvwgVCyZEEzUkKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109371-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7015D5B85BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document the UFS Controller on the Hawi Platform.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..3de00affa4c6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -27,6 +28,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
-- 
2.34.1


