Return-Path: <linux-arm-msm+bounces-94630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AKBIQFKo2kF/QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 21:03:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D081C7D4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 21:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25E8334E1D25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 19:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856322475D0;
	Sat, 28 Feb 2026 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3fsStD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1WY804M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340012D94A7
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772303592; cv=none; b=VbEGj2+q2JJAEAJ6VKnfeGYxnMKlIfYPKzvCef/gG2iW8qwvDtpolfNq3fAiIqyXtvA2MJVzO1IIEydn/UPv8fvnb4AmdcXei3Nr2VoOsLmHVkHLdhQ2555+JGD2D1qgmirJJWdWUtMc2kYurSebq282D7P8K05JPiHZknOEUXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772303592; c=relaxed/simple;
	bh=jgWAYu5C0b5zfBKcXg2KN4N2eUwxMytJHuZdP2ki3P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=emE9NdNFjFOERijppQIXsJhVdTAcHHH30O6ZW3naN3teewQ3rxvk5hlwBaQ19UMI8RLfjzCqFogqYmwbt60NUmEBWMSocT1nbppIKf88LdJw7EWOmFRl7k0+n+H6eCvlFO+nWhIwCQ9e4jpB0SppsUGC1aCk7iz28Ueul5lIXq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3fsStD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1WY804M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH02LV909488
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z1QjBGy249SZqPONoffSc/
	XfeclujHgZ7LS344mvAe0=; b=h3fsStD8k/A2FR3CZvI2m/ImbxEnvZ9P0n1c4V
	0xUAaaWt9Ixv8bUntpU2jHdHHA2kdifLC00N8D71YIkWJRPG7T9mZ6BIzp35EUv/
	iD7IYzTq5aoo6idvyoXYP9gotQKfj5grVYdSHg+PpObaHYvfWN4Lam68C6ZZnZ1V
	we98zvvEoqdnBe9mD9lN5/098XBTOyocCwu8CvDOgoGtDfVDPGvV3CfAcaNld3+I
	AFqia8+vDytwNGu2WWT6p95S4n26ZAjlBZARS6BWTdanNdlhpBj/wIhxmgZjp0YO
	pxiiNsuCSLU6AxcV3VfDMR+ptjzD3dBKbAjkAnvBPkqeWM9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8hfsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:33:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3a129cd2so3232611585a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 10:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772303589; x=1772908389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1QjBGy249SZqPONoffSc/XfeclujHgZ7LS344mvAe0=;
        b=W1WY804M0vXc5sbssI8bEOxCtNoSIC34E0QuLnIL0hMfrdfEeV6iY50C7aRo2L4P3N
         EO7691sZhvsUaVRGYuI5vMqApLuxEBMYT6sxm18dTHMUFfUzBqRM6k5WntyYXuJ8Su5j
         Qz89vkJ3aNLTas8TFA59FaGLPTG1VMfHOhkh9Ar1ZK9+NUxkoCEKlQ4wy+e0PzwoDPvt
         VrsGwAPJ0hasffw88JLtGCgvzSJc8cpJorByBu61yQhTXY6VmkZXwdNpO5KuMplu2cQe
         rbLzOeMpmE5vL8vBmc9FIBA6UsRrY0+7axgrL5G64RJdlWABd9WmvbLIGkHkKl3x/KWv
         FYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772303589; x=1772908389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1QjBGy249SZqPONoffSc/XfeclujHgZ7LS344mvAe0=;
        b=VEyBzz5SYEKMZX5fOSBWyEdzkXh0/01adPJYUkMIu9jEm3Oz7zQYzyVKd1V+gy0XLq
         78g0MmZcPeaI87oWrrssoyTq4nNPG/NUwIG0p0SMdkmMPtOhdXC0lSr8NK6PgQTCvjUn
         xJ3VTe7cQIdFLacROaPmlhfGEn8VvfBBKBEbIu/GedM1PKl+NMT7xyaSzazPA8rRihab
         xnhlmQjUY3/MvSwF8RGgrAtgoa7JTCK51bBTogVwX580JZVGF3IzYNdzEeaQmpDPasAy
         Nn5f0fUoa6hmag8OJu1xUqK4oVzC3HDPfDlhQ6wHF4vI90Lq9iz+KVjpraUOc4ykLZz+
         UA6g==
X-Gm-Message-State: AOJu0YxyvOwl2mmh7heBEDRlIOUUFcyGEAk+JBxjFBt4HOA5HFHrSaXQ
	fLdylubm3/0Yjva25VJhvkE0JYrFa4CACS96jFZ9F3vKSzRQRiuwMvoiTd1d28k0X2MWlHyl4ip
	srxRQ1zu7tPnTrHxz6pAtXeJbbjJwDqI3JsmenuiWGZQTNBe/w+WsPNGZ/i4bu9LjfYgi
X-Gm-Gg: ATEYQzziwCOxFPa5EY3+TZwfBI2BieQAOYjMm0T5WVhIcEkujfW+hVNyB+PwisS4bn2
	UIb5AjL++dI3ygwrkp4N8YdJhVijPKflQeeWfxwHPB87PQk7upnMZjF0cbHs8wQsS+b1BP8xRoy
	mZNhbYfC1U4epirKGM+lRufoClO3w0Nzo2GkXE7npG1bGOy48svveCwy+UVeKy921wkkxyah2Qj
	4/SRhpwJv0l/kQB4RDqawANzCCqZF0wUKX7Z+caLdhGe8nJM49CfDkRr9xCA+Zm3jhl/VCfHqqP
	0Zcetlo8bT7HYN8UtjENsR6GROQNyQNAN8U+IX0yY66lMwcMW/0MeshJLka65+RUcJa4Vb//z/p
	K5uHE9VlV4aKcnKqx0yR8jxBduxgmKYiF+ZfeMe1ABWRWv7/JySPwCVS/Rqjt9SzrPOjp6oeKEf
	t8sDZRBT1a6Zu3UsBTS/irdA7FKc+tBMplpQw=
X-Received: by 2002:a05:620a:489b:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cbbf3cf0c4mr1253995485a.21.1772303589347;
        Sat, 28 Feb 2026 10:33:09 -0800 (PST)
X-Received: by 2002:a05:620a:489b:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cbbf3cf0c4mr1253992685a.21.1772303588863;
        Sat, 28 Feb 2026 10:33:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd238fsm660806e87.11.2026.02.28.10.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:33:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 20:33:06 +0200
Subject: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOE0o2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyML3bTMCt30nMrc0iLd0qTyZN00M3PjFNPkRANTC0MloK6ColSgErC
 J0bG1tQDBXw3jYQAAAA==
X-Change-ID: 20260228-fix-glymur-ubwc-f673d5ca0581
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jgWAYu5C0b5zfBKcXg2KN4N2eUwxMytJHuZdP2ki3P8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpozTjd5fFOWJ1NW1LYP8p1EeGL4ebFVDVYHx6L
 SYsBxBUQVeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaM04wAKCRCLPIo+Aiko
 1V6nB/9h5oPzh9Jp+t5jCANJtHeFJJBpsiYIExIyzRpR0Wjyhp92yj0l19q1BjivNneZCixgUl6
 ximXS0+Pe7v8MJDPFB6yPn5TdLCrNo2suQihKuIHCWOovczFZXJCjr1s7blwdiQlVXmRr7xaz9Q
 zDQjKWrXR90sjlrdmXTwsknSG2wEwK0ZchvNJ7coGdkbrpkEiyW5p8pfqIzyL8SReMFS05CtfzF
 40ThI0293iCbt++l8F37L7m2TwKi+QstGHaO5NEQqd62nz/ymr59/vJ0+yCr/o6sn0z06XLyjxw
 F9fQ+v838qUVczrpVUkqFsbGQIoCmRzbrJsR05HdJ8E8o5K3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE3MiBTYWx0ZWRfX3ZWyg6V1hYwo
 2n5b5TxbcTBUnbOVmITpDGhi/PBOUlXGgwsEzHuZ20eaytTxv9A0KjnglUm5TbDwO2te9im1d0h
 3gP0msw1aDZSotMLwshJy4hWzcPMk9ZBUpgx0h9gvx9iMsEB/fsZbB3nRLnhTynj0hcIVQwuqKs
 AjitHGiaHKGGLpUKxygeoZkodTlD46luEjoBZ5EYN1bHxq4pe5sh0qvE+fozoxFrLXpLIq56zOt
 BJrDWrYA6fYWZhKYa/BmVsVmfPtci9pWgumb0Ntx1MKRAGTqFEtPUMJWK1vftFzRM0Hd+Z+ED9+
 uZFAgqh2LcJnFen0E2ulvLhgrcwCzrBVr3cLfnPYFQTdP+im9phtFcKo06Irdy3c9Xerbxio7u7
 C22BAZ1WDc6pVQy1IlgA7SVhHQbCOYUf2XrkhTHpQxOguKsOf2FfY/0IDY9Cnvp5i9rvWUMvZJ7
 5/72jWV47PPgNs242xw==
X-Proofpoint-ORIG-GUID: 9Ak5rjZPSbP2cKPq_13rNDE4h_gz5Y3P
X-Proofpoint-GUID: 9Ak5rjZPSbP2cKPq_13rNDE4h_gz5Y3P
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a334e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_smvvQv66ppQ9i0oH1EA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_06,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280172
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94630-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17D081C7D4E
X-Rspamd-Action: no action

Due to the way the DDR controller is organized on Glymur, hardware
engineers strongly recommended disabling UBWC bank swizzling on Glymur.
Follow that recommendation.

Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..31e0d55c6d9e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_dec_version = UBWC_5_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_swizzle = 0;
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260228-fix-glymur-ubwc-f673d5ca0581

Best regards,
-- 
With best wishes
Dmitry


