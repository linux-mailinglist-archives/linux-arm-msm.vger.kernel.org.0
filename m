Return-Path: <linux-arm-msm+bounces-94042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGvxNEWjnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:22:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04678193503
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E31BE303004E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691B730E0F8;
	Wed, 25 Feb 2026 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK7LCrtz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ckx8kJ6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56830B501
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004036; cv=none; b=Ej6QcJ6Ju+sEqexBvTPUiUR5Ag7Lg/jVvNJGiDMdzsXgbv7ZJN+j2Uf3OPvS1Lb1+123JO6YMJPyoe3p6druKb2ZNu3Vs0IXn9dpSk1nsv+vZCuYt+910xvI7UNri7iNSlQExXQLugyoCnRBg2wxBHzEkb+jS3+S6GvdWfDeVM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004036; c=relaxed/simple;
	bh=QgXLnV6T5dAkEpu/n55wFjWDZqtEWJc1dDIY5S4JeXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=donOnSS57cEZPwjG5JwxQN9KSh9BL3BxZog5BmcA7eIeA9DfUKOYjYQ6Tte5J7pMYXF70hHihrGI8YgtR8Nixkg6sfnqy3XyN3ga/Y86AxRpwoCcwQ+JQE1165ib2f9kvsJ1XoltXyxipeuho/IsfY8lsCHvlxv6qlivPf17Ea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IK7LCrtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ckx8kJ6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P33TYf057136
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uyNK3FGeG2/VWrJDgtIaYbV7K8X2Bvq/x/mAZbpKTS8=; b=IK7LCrtz2TN+IVYe
	fbBKpedtFG5Mm7uWbjOkwcdvHBBHKlhfZIf3A3mnAwMe4YV0VhMrbb0W6SECDr7k
	2vXbypCU9fmmOtNWmxWk8v+EE9K4ZUotLwyNE9Bd2cyIGzlnie8qZNMhDz0Y2rX0
	OV/ucHtkPfD+S4Xzncg2ezJ6ARihmgR4DFpRARG4kgiWn55/jMzNf+qAnmYZ3VEt
	AQ+MxtsNWLuobkyYP4pbVphWniamUe0b5KTeNr1DwdPyi+Bvh8niv/EF17FEJXQx
	6ZnpwOS18Rx3yCji+SNGcnKtMzXcwTScFvWl0Akb77z+9ZUxT/CHm8HeON7TsGv8
	puAL1g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sabn0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:33 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d195fe3eb4so95082264a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004033; x=1772608833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyNK3FGeG2/VWrJDgtIaYbV7K8X2Bvq/x/mAZbpKTS8=;
        b=Ckx8kJ6Lf5ih5pz2rzZsUqzjaCKK4PWOKZu7p/+JBlD10qchuEPvHHRXrYnoxg0MbZ
         HrxPh1snpfsgVJnDQXG6Lpun5Qez6WUZyCZQSORJCXMfmPHANHv1nPAjzEO6pIVvNYBQ
         BoTeQDpqyxkStRxSlkuOtJgDzEanz7oAIi/684R9f0LTeaaKb8FIPyLn2cHEZAS4dBYA
         o721G/xrcPS96adWkM9dzV44UIk0ZL+ITtYlxVEvt6XMV5KLqwkNsOUyNEbvMAyGvP77
         eEkMPvFrE0udcDrJwVwrqzo5sXdq0WIziuJ5UvY4jXXxztQBWEF+9MkaTPPfIvIOyjHg
         X4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004033; x=1772608833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyNK3FGeG2/VWrJDgtIaYbV7K8X2Bvq/x/mAZbpKTS8=;
        b=EWvd/LL98docg/0Z9Q/1FtEmQ06Qcxy8yRme4i6PADlyt697NKuiLo1dzpngRgzayS
         R5A6m5/ilwH7h8zijG24reElQEMcQyaS5wHnpxhwVYRQas2yOOpasFQTBaAmZDdh+R2U
         GEg3aEd5PuDp/8kpY4gImeLTHQz+ielSTUyc30bF0soz6oGLj0WmTVujwMSe+Hc8IIzj
         GpVTSGmacBIgoEOo8v/JB+BLVOyBo9Qfa66S9HTP6ltZ3bZNxmOGnsnu3Ba2TaLnhjv5
         fsX8r8T/Nmh6tRDdDdW46l6ZyJTOROCjz9U9FntAxwfnI8ylREjzduwpKGvwWYqGHlkH
         ylGw==
X-Forwarded-Encrypted: i=1; AJvYcCV2KhpBul/0kwUgqQVbsqEbxke9MVDt8UDM4SY8x+8kGVcRtE6xSJehg1lSscFa0Gx09psSdTbCLcehnTRc@vger.kernel.org
X-Gm-Message-State: AOJu0YwYS82zsxxPp+BCokjtrkHMf8vULrzWuBXJkenIEcDVybqc5EYG
	1WI+tGXYRWEUNYuwaWmOali4Sj+MZ1UCvyYTyrysSU++Utifyh2DqDp4SMxM1rdcgZ6317+5gGU
	P7tQUzMbL5o4Xo0vXL4Ke8EJ4dkz1B5XS0feI/yC8uuBXIWs7axfi2ZlQYlUo7ruype0t
X-Gm-Gg: ATEYQzyEvnLeRnOgNi/n/MrEujsnaFMQoZrkBsFXuiOg1NNiYR1IjuL0MbE+jyxk6jS
	Wuin8IivC/Qe3CPCvQc/s7gdat7Pov+4k5UkLRKT9xMftrwzHKj7X2c2UlbG2Sr67kShA64pPDZ
	ED3ubahLHEt702s0D7uKe+16HFDsXjy/xAA/iivQpUWL9SJmhpLRsc6rdRBjz6yO3bZ4osmFpBX
	GgyUbcOC8u7GR/+ym+629ryYaRj+8Y3qtMcVkpXZK0bkRowTVRue1f/MSjrcYQOKMJgKSD0XJp+
	cCcpGKZtOZTq05R3RT3U8ILJUYlsAQ0s8FHkNWiu14hFJhWPbxJd7imDL2kmU9HTBK4GpnWeI/O
	ib3acpm19H77OqSY7i/q7CqFXC/+e0qJsx/fSfkpqMr6NFtzUQrqH8Evk3Rxi2n3dJWr3GB3z
X-Received: by 2002:a05:6830:2546:b0:7ca:c7b0:17eb with SMTP id 46e09a7af769-7d52be37e7dmr8932422a34.10.1772004032894;
        Tue, 24 Feb 2026 23:20:32 -0800 (PST)
X-Received: by 2002:a05:6830:2546:b0:7ca:c7b0:17eb with SMTP id 46e09a7af769-7d52be37e7dmr8932414a34.10.1772004032598;
        Tue, 24 Feb 2026 23:20:32 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:32 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:22 -0800
Subject: [PATCH v6 07/10] arm64: dts: qcom: kaanapali-qrd: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-knp-dts-misc-v6-7-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=1012;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QgXLnV6T5dAkEpu/n55wFjWDZqtEWJc1dDIY5S4JeXk=;
 b=6/fWFyhMq3h7ZBLu8/cEhX9RAqL6e1qv8KztMgQ7R+C3M9mBhGm6zXPvpmhN1EyDVrairCbum
 AOXvK0TJgSTDPzOqJG/BRkXT+rMrPBzJYYuV8OKaG/e2Iw2KEZ/lXq3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX+IHAufkBcg9Z
 rXeZUUEw6nESbLBSyNQUUxjrKVnwYnB45VMDnL6yB/EzU2/1gp6aDBCnYT5PbeUpWe22itzViT2
 lzicJSnFS/QtsrMXK7u9z6YaJAmNbaWALLCGgmkj4rivkdpYOYp3hPVe+uTTQAQzOs9YPEWGnOS
 ngPLUT9ImTfrXH3N6u4qb+Lw8vKULvNWQ+RFAMFMxZM0VRuSgmNcDw9HEEmeyr4Es6iFye98A/w
 wyEY3B8THdx2aV8KaDYNqb/KePamV4twTjTwOnGIvsljyTLHATp9+c2pocbUDH5kPYMHB14/kVA
 SiYu4oxuukM0cKLhaUyiTYVaHTVXMafGXEhfDOBDaYmNd1hlcrpa+VyfvlZV8GwZXvy0dyVqanw
 o5IzCJm6r70wruCACcFk3EixtqC2ewVps7VhFmOKQD9+F3K+KiUXaJuHfJ88kEENjA73cLfo/cN
 ebkIMhLLqHksPbKCPHQ==
X-Proofpoint-ORIG-GUID: LHtYUqr8lN1kacwiRfkgmUATg_fx-OZm
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699ea2c1 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lIVsHN_WdLZ9tVWbX6YA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: LHtYUqr8lN1kacwiRfkgmUATg_fx-OZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-94042-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04678193503
X-Rspamd-Action: no action

Enable ADSP and CDSP on Kaanapali QRD board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 66b423a497b3..32034eed03eb 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -682,6 +682,20 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */

-- 
2.25.1


