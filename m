Return-Path: <linux-arm-msm+bounces-91598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGVQOM2QgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:08:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D783D5046
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 860CB3062416
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD0937107B;
	Tue,  3 Feb 2026 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh/qEOk1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9bxMtfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C40336E497
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770098804; cv=none; b=o8SMBZV9kcYS9dbmrSpNScP6b1KbGwOHgqAKqMtphz/k+gp9DoUNTGhnifIrOyVmTjLrsLulqCaX4Ot4NsHC4detXfCyHz7Ao46dr7Mh+OhAE6KfEgEimPXoVev1k4nacAKt0g46DdLr1/3lMtCal6gz5K6zBw4AzIuX9Iaewrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770098804; c=relaxed/simple;
	bh=QgXLnV6T5dAkEpu/n55wFjWDZqtEWJc1dDIY5S4JeXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZzjpTCcOXqR0JyFYcpp1d669QkV9d3ZF3SvQBXN5RCmiNxeUBRA9kqDBVmYwMCLYJtn+e+rkFO3C10lDpNjXwxHe3CA42BSTjClF+QemxxMOu+yzvy3Kf1DztZC+OhfsXDh8oqaCCjgJjKQWWwCbl3DnONU0BkNDWeYG9C/YjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh/qEOk1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9bxMtfm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JTaYw3459128
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uyNK3FGeG2/VWrJDgtIaYbV7K8X2Bvq/x/mAZbpKTS8=; b=Jh/qEOk1ALF9Gzqm
	qTIEtA5xmY+THEnp3F4zj83oViDyhYHiv90v777D8DOKE9KSdNDYJKpHcYjpsW6e
	iHXQICvwphNNbR7qPQWgxZvjEFxTiy460g5awoy4DVwXZI8fvPRGk0X3Jw2e0DfY
	PtxDly4AcDmYvD6TOsA/eDfVtSPry86L3cMY5YP2pbnP7smUrcRK3Ldezj/5/BAd
	UC42rV9HFTs6E5TFYqvwFGKs07bHj8eTLuzHJwEDjQ4Njj41+iMz+2+zp5C3tAAS
	LYvoDAxrfdWAhhe89M3x11xTy06R/ftkVhPJULGD6EdsFEFgzmJkNiau92ZHL3V4
	hB9RCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbk30w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:06:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b715b26fc3so7163250eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098799; x=1770703599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyNK3FGeG2/VWrJDgtIaYbV7K8X2Bvq/x/mAZbpKTS8=;
        b=Y9bxMtfmC5x/jWFzQ+bgLVN+XIjN17OovzxQgniL0L7d11exCHAl5viWmBY8CYqEz0
         RiFhKD1HfcBIGS4USQDm6g/tSarz/pNsMSmBpJp9zZuGupetERC6RAcZ7zlTy17Tkp7d
         96XjDMohJC7Z8etmisNSLUbkcBsvUZqJxK6xSqK/IRFkA109lszGFcMZZeNnp7x/v/+I
         Zfjd52n6KPAGyvORkYz0F0uupMCk386a+CqVH8+zh4t8pst5Wc53EmySi4yG4+JaO8Aa
         xbmPKPs1hCyCcJED4D/eOETq9iW1lNt21+mnCgR94LfPQ2fBjT64Bn848pDlmKDx7IRa
         45tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098799; x=1770703599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyNK3FGeG2/VWrJDgtIaYbV7K8X2Bvq/x/mAZbpKTS8=;
        b=H/DeP5azn1bih2urDfNEt2iPbfw+pU+C+rDhRR6kJ7bUBeqLE8TsKZM/cMgDehdwtK
         HJR2axDGDZDvZ1X8pPRSm6njKgbaGDEesHbtuMBsl1c3PIvTDcnHJ19U4snqqqwAkHn1
         K7OjuAnw//0/T7ge6jRglrSTZkFlVwpl4h2DTJXb8bmMtOvvnP97YGsNCxoWomLuikGF
         5lntxXLi2eaVhc5wP3W06TblOsQRjKqirbyGainTL1xWwiw/MUuegPshcOhVxa9GQQP4
         gOFdlnOKqpHTR9BlzTsp7Gr9792DrAB0EbllQLvabwC7WCPuvUtU8N2FBk3FIlLZwfBw
         stEg==
X-Forwarded-Encrypted: i=1; AJvYcCWWJsNvrrr+JB7tKzp2qySVzM9L4eNOCNzlJQOKIxTtDRKkiQdKgHVdWTM6FqVtxG0PfvlPIhR9tiXIPTky@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuvPysCzC4keQ5yARfKckGbwf1zmLaJsVx14DzF49wxqvL5QL
	WBcXctcGEhihpG23pCashTO0SJTPtfAESIF2XHfbV4dyMBPBAeJ9/hZ++Rex/PNXwPSXcfHVhbd
	2zU8zminDMj2+USvBQsSkIsp8fyVMqRhJaDqXTU5XMmHye/0B7b+DUnt3XKxgIzrKnLuv
X-Gm-Gg: AZuq6aIS55vKMLpWNuas01qC0Sm0akvjJrBmq6CPiEscRowiC/vzPLQzVOqmPdFaJ+E
	R95Ph/ioSTz70wYxhBNpm1Kx/+xTlkyY6Jcq5pjHqfsNMjPo0sTcSnli2cmPHE2sYt5Q4HE5KMw
	1WctbpLKpcLRlYLYYjWBCF1wxnEdI2Hud7FiXaf0MWDabCBngqVT2akcZirCUy8tfN3sBT++eSb
	jpVJxeyWWkc/crs1LLDw3ob7nIvAG1+GfS9zWV1CFKy17QjQMfOMLvuoCJP2vwK+fpixyzNW/6P
	/urhLbl1GKytpdl/+O0obRZltamovGRXt62JxpP0hzlSRnU204/T7pukqxB9XSqtct82JI3Pih4
	FNLCD25FdURyn0JhVqxPoxdeyrFHktnV+mHL8uLXymUXmiiOpMrUWP40SAjFT
X-Received: by 2002:a05:7300:ed0d:b0:2b4:7e6b:9c00 with SMTP id 5a478bee46e88-2b7c88ea112mr5598928eec.23.1770098798663;
        Mon, 02 Feb 2026 22:06:38 -0800 (PST)
X-Received: by 2002:a05:7300:ed0d:b0:2b4:7e6b:9c00 with SMTP id 5a478bee46e88-2b7c88ea112mr5598916eec.23.1770098798151;
        Mon, 02 Feb 2026 22:06:38 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8283def01sm417499eec.34.2026.02.02.22.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:06:37 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 22:06:24 -0800
Subject: [PATCH v5 07/10] arm64: dts: qcom: kaanapali-qrd: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-knp-dts-misc-v5-7-02de82bf9901@oss.qualcomm.com>
References: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
In-Reply-To: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770098787; l=1012;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QgXLnV6T5dAkEpu/n55wFjWDZqtEWJc1dDIY5S4JeXk=;
 b=cgpkYA/JtSSeggUxOpdT6dtm22z/PsZWecMplMFl3apBN+N4JL1DlQ1zxL8Wmsb7trFUVL5AO
 o8rIoiYjm28D2v+FXylfKoQ20LNaXXoN/P+8Klrnc/MtSD3JX7tJyqQ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: amiNirzP0Wfz6s7__S9jAikmQk4yjE_l
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981906f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lIVsHN_WdLZ9tVWbX6YA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: amiNirzP0Wfz6s7__S9jAikmQk4yjE_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX1Dq0QU02bTaB
 GDIcVgJipGZ3IBUq0EsEEIIbp5Kwc8VCHU+OKBz8uAk2aG1QeIbJtDKe989HDHP/+CVO2rJN1U4
 iCI2cnsxAtdqZ5MCdUM7Ke/Zg1fayAOj08s86jH+nRWAu6GBwsMggXLrDOsvcu5CPyYzJLqR6WP
 WbV0V1uvObIHnZ0OtzAPoSr6gmIEAVSLp5qV6IZMlp2kw3gAWtX/vxciTQQORup5S6/bA3Qbnis
 LyCKHislGv3isMuBlqvIRVdIPna7l20PuFMD9Nxmgs+eSh/HKWjkAOWeSVo1Ym4pfuEXYzftCfc
 0hNQJfqvfstXBNgPu8BFdUSfSIVyFn8I3qdrJJW/b85uDMKktzl81SG7Kz/dX8Jb95p781lBmaA
 ui1dvAZeHTdy54lk5jdGfxnWGizGxl6yxoj+HHKxXuIwK3wraFJ8JmwdZNqYP4F9qRiklI1R0qN
 V0I9CXSJOtAIZcQUrKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-91598-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D783D5046
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


