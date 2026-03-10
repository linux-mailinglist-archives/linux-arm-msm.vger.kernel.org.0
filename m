Return-Path: <linux-arm-msm+bounces-96514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COYEFzzHr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:24:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B25042464A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E93BC312BDF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B793E8C57;
	Tue, 10 Mar 2026 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiqGaWm4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7I5nZ8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BC33E8C44
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127359; cv=none; b=lm9bvPHK/OuYOCjoITvo1lJ5JyRPJ6p+acgXDBR/66WB2eH1cq88Ux+wBv5HXNp7wkvBFFLLGTtT5A/D4tgEs4l+4gsrw8Q48sAop+6PHw4tMW6QfMRUBEulN4D2jCiOupDUzYwVPgcj2of1HfrwzWy4I/PgAt8yt4xDnFwDVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127359; c=relaxed/simple;
	bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbOZ2WYFO1ncpdGvGoojmyTIyX6bUSLsLf0D5tn9ktlcr1b2+sGc4xyfDWIqeOM46kiPaMHv6R8KdLmNu8qrKKDACFgQXViz7YYC9umuN9KCPVpYN5Yvpy86eDmPmf+sVcqbF084THljDievGIHNxISPHHZWAzIvi9a0qc5UpIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiqGaWm4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7I5nZ8l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EGYK246777
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=; b=hiqGaWm4wM/zo3m5
	4B8q15B09kHMejvtUdfuy/Z/8rTnEEbOVRPm3wXG8sFkfoyywcMrkcDXsrCCYUTd
	srUqqhQr2B/OrjxtmsRaIFuKM489ITCnlsx9ekFFTAxcdmfvf3Pio+B/iSDZXk+K
	CK94vRV/HLxIB/4wWU207FlyqJ+q9q3g0B3yiNWXpWOrBQTTcu7u7kOpx9sAPK2p
	bdzR6/EuD16zZ0pP14CsrnVnoROMYZD7/DUPVS+C+nQjpYZzf48GLLuOj5UVCQE1
	TgVfISsfx6H7nSUPH1W+Qx0gp6/iAvgDRMQgSxHtKzTtJ/PwbRIC3SfbAXVi/ytT
	DnTTdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct88019ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35985522c1aso32598006a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127357; x=1773732157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=c7I5nZ8loE9i6ZQgMMxiSyhPh9Z7oBlJ4Rwc3okly7d03biW6g0r3U9QaNZO2z4r5h
         y6UhU9D78EOmFKPt9Le6KC6WiigmBKsltZDcfxP2b5byl0N35cIvgto60R206qR2znvi
         CCIX7LTqyig3wf76n0LpT3lnM809SjQRg2dD02o/cjnttXOrE1cLia5Je2J5z86XB8/y
         m9jIncjyZ4+wS1AeFRJt7wYKMuDjMiZLdf1vi2Jdtjurl+laXTcaFIqA9Oseja8pLvDV
         Z7cRDycBqMRXAMYZPed4cdIQWQ0M5GVzCjNnW0uf0Cfi/rywCXsHkGgru3Wi0o3Bb2oA
         HzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127357; x=1773732157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=lv1YHwt8qkmGM9pOBb/Gw+SBXnck4g9CXFqhJcJmsTjNTD86gYoMRI+U0k+P4QaUUp
         SVo2wn7hsmK8yiwzUXAkh8jDxeq7OexNFRAXSFr5M49kZKNJK7ftJPj+Yhm/C9AoypLy
         NRs79eHaXgLaIKRobZiQw1M47RpuhR0nkhtcmCFWoshGN0VZO16fcRYV2C7SsmnJLL48
         WB3Rph+vkFE1d7PFz4pSa6LMN5Ksug7qU1CUk+2tM1TjVkfzpSTqXCq/bb37HWlrjU8z
         pEUokDhZW1N5tZV4QkBURl9QDXIAFkJavWex9ghfe4dI1/wNJInejSLNsGX+nxhoJEh9
         L9rg==
X-Forwarded-Encrypted: i=1; AJvYcCUOAj4HRWpin5fu0GEFRuxHicf2Yv9cKG+LL+8SAKuAcfDt9pBKfcNoyBCsUsaue273dkvz7RCY9Xb3LLUR@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRTM2qqiS9GoTS8jUcafKv8bIOyN1ORjhx2hkcsN2g1uSmFqi
	xF0OOtpAbyQ9FC2ZMuorfkEIsPii6Ubnc0efde9nWsVXyegCqVwuL5h+XeK1USUpIPwThu1HoN0
	NbR9i2e8pjP/FMv6taDEYEztEHZbrHE1/gy95rKdCb5ToN4jsBcCjfj2y2xi5dTWDJqFk
X-Gm-Gg: ATEYQzw0N6CopQrlAOfZMqwHupmehtQuhX/j5r4zvhVrep1LoJQGgAGeOkTzB7Lvs8u
	nwNNPZbJHravctA03PgbOFD2/XKWVmX+nTLicawW84ZsY+1vyIltQ9qTZDMlSoIkz81DcpIdDpI
	2lAHZxIlU2ctoCKEpiEZFAb4IDhjBeaARxDX79c3vuIOw/MIkZ2bNNUbZOs64uJhJGL7TZ1BEfi
	/qnHqA2FY95Fh+pQ5G+knanIkVcNlt9sH3tXXkAlyRQYgJTWgiTfwTzXCeN7peCY50+3WnnxxDe
	zebxYycahqOJfRjMh7pp5N4qdxEm+Uhy8xiLwUS814r4w2zKer2aEXKGZmFi0KkFd5KyTfi1GaT
	DghqFWLcA+Kom0ogx2b5Pg4rR8TNR8V36hUHk9phyZVg47y8ptfg=
X-Received: by 2002:a17:903:3510:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae823679c9mr142880635ad.8.1773127357227;
        Tue, 10 Mar 2026 00:22:37 -0700 (PDT)
X-Received: by 2002:a17:903:3510:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae823679c9mr142880315ad.8.1773127356698;
        Tue, 10 Mar 2026 00:22:36 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:36 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:03 +0530
Subject: [PATCH v3 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-6-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=3154;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
 b=jGY5fnLsLQTR3pxOzCMF05KRfsJnnBISbNlEOkTYIaDuFNBt328cRi62kblnpXDbp/jYHl6h3
 Qjm9GgWdCf6DGz76s0BGNvrnj7HqC45wHyAkcYNbIM5RGCOe+hQ0tPX
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX66IkqCsJfLDf
 Ts5lOEpgM/KsFP8nLSnOD6PQKHcBX0S2lAa83LwlZNAcWLzlwY6rAUnK0NZT7j/bL4RESzkzQA5
 9u+D9LTii/rcxnW7v8yZUHL1AFeY+43vKNmoNiCtehv8DNXCgKDUVpJC+wxVnJG8J2ZJue7VhjE
 AB4Vlt3YbDko8BURlXyF4UoRDw6N9672/OouYoLM3W5bWbD98cWZ4Hok34igJ13oUVu/0Ho7Oxj
 o9Ei71KpmrNW7cK28Xhbz3A3WL30eyoWY2T/jh2HblWqJUGTrECdL1pJU5+CXdEQcQZHIQHX2bl
 MnWhUU4ki6I0YqVxb/96bSNLbfKhdJiaFSDoaeBTWapHfH8mZLhAe9ogBM8cKKNWhq2e10bL6xX
 zvKwr752mf3jeuABs5B9MW3MOjqMjDo3eKFwh6wcZaXMC5xh9fOLVXkkpxrVVk/YaqpwEDc5tVU
 wOhcqhgsS8iPZJoO/sQ==
X-Proofpoint-GUID: PAnzHHBeypdNFUCekxNuY3KVMcUDT-Gc
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afc6bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PAnzHHBeypdNFUCekxNuY3KVMcUDT-Gc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061
X-Rspamd-Queue-Id: B25042464A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96514-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Devices may provide device-specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
per-device training data is available.

Extend the firmware loading logic to first attempt loading a per-device
DDR training image using the device serial number. If the serial-specific
image is not present, fallback to the existing default image, preserving
current behavior.

This change enables DDR training data reuse when available while keeping
the existing training flow unchanged for devices without saved data.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 47 ++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 4ea14c57774f51a778289d7409372a6ab21fea60..0a0f578aaa47ab2c4ca0765666b392fb9936ddd5 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -61,6 +61,8 @@
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
 
+#define SAHARA_DDR_TRAINING_IMG_ID	34
+
 struct sahara_packet {
 	__le32 cmd;
 	__le32 length;
@@ -365,16 +367,41 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
-	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
-	 */
-	ret = sahara_request_fw(context, context->image_table[image_id]);
-	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
-			image_id, context->image_table[image_id], ret);
-		return ret;
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = sahara_request_fw(context, fw_path);
+		kfree(fw_path);
+
+		if (ret) {
+			ret = sahara_request_fw(context, context->image_table[image_id]);
+			if (ret) {
+				dev_dbg(&context->mhi_dev->dev,
+					"request for image id %d / file %s failed %d\n",
+					image_id, context->image_table[image_id], ret);
+			}
+			return ret;
+		}
+	} else {
+		/*
+		 * This image might be optional. The device may continue without it.
+		 * Only the device knows. Suppress error messages that could suggest an
+		 * a problem when we were actually able to continue.
+		 */
+		ret = sahara_request_fw(context, context->image_table[image_id]);
+		if (ret) {
+			dev_dbg(&context->mhi_dev->dev,
+				"request for image id %d / file %s failed %d\n",
+				image_id, context->image_table[image_id], ret);
+			return ret;
+		}
 	}
 
 	context->active_image_id = image_id;

-- 
2.34.1


