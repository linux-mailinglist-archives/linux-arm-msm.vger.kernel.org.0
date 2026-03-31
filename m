Return-Path: <linux-arm-msm+bounces-100956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJCtInt6y2k3HwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7CA3655E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B77B300D347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D3F3CEBA2;
	Tue, 31 Mar 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ke2ISejk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEAO3rG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57DA3CE4BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942818; cv=none; b=Aw5Hr0XzbywmsSqi3V2x9+JVkfkEhCS3XHhbl1rr0otAnuupeZtIpiwLgDTuWQkPpEG+f7RyxrSJap5M2ROPaKVB4N3PncvoXSJDGLPBHKQJxAUwO8wvYBCaOEDmM+5lObsF0juXWiCvZ48iH6v88R/ddM4w6jnKFv/DfWb9mZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942818; c=relaxed/simple;
	bh=ubBf2121TImJmlaj+0em6aEAJSYd5uuMpFcNUZPBaEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpJOcp6b3fPn/+TZeUIf+Byu7rnl4Nz6jKU5cNLq5PPk/Z9tsas2NXqLXds4uYyt4PYMxpoQ2P+Wr/yTUMoLJmUP/uKukgt3CiAai78LBiDU8kGOnW8L81Poo3vaoeRtYlAz9hmE7pW3Ii/4ZbddHhajUqoamI1x3veRchh5XXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ke2ISejk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEAO3rG5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V3lam9843374
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJD18L49SwGKWLraguoebu9FhTRdw/qTlGqA/By89ME=; b=Ke2ISejkSugl5mpx
	mR+9SFQh+BhC7/tvp0bl2BQiW4i869uAgBkJDbiSq6k0GPAzr5wJZTk6Tm18STvc
	NzCEGYYYH8u6+NX52rNHvW+r2iaU8svOeSbakHfOcAGRDwaqWO9NhnyPs9S6PSJ0
	am6kmunxNGmS27wC4fonROUK9jNfLAxReklheVtcSAsNGfX7ljS/Iimx4UNc2kEi
	nS68rccWn7rBXXcZrxrBCqRyw8k+R/XcNga3z36l2hcPpD0M7Hhc6yNtf//m6Utm
	mC33X9ho/666ls6ykgJ7KZ5yEfmSP5kq8HYuExI+X3e1sCss2R8ylkFwCmXtVh/0
	2+Pbcg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt8tqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso10371096a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774942812; x=1775547612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJD18L49SwGKWLraguoebu9FhTRdw/qTlGqA/By89ME=;
        b=OEAO3rG5IBaJBe0PUuUlQDBYyCVosgJrLIwlGeJeadKRJGlGOdYGB1VVkl7CVQ/1AW
         U6O/sV8Qe0b7/4itlcwsUwsJjTxtDiG1XgLWj6WU50U+uCJkzLc1LdO1e/DXT+knzxp7
         sBUzijwRhTkF99YwLVAnA4ph3/YubsUZsT9TGb60gwCwWeMM34FsGUvT2kgKgJkJmxfi
         8i6dBuM+ztMpX1+aMhQ5C4LhQsxNWBKzJakGkgkTmFpDIrppRpqBgIQ4y64QKUUyztA3
         44+hureFPkWkPAc2a4nuspjPKUOBAA6nHOVd4ep9XQDYwDVjs0CO9IbokvSSXYqZrPub
         n82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774942812; x=1775547612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJD18L49SwGKWLraguoebu9FhTRdw/qTlGqA/By89ME=;
        b=LZLjaI+L/B2AupDrJ6om09C54nX0fU0JC7PAoHOEBAIaXvZEWSXggk5b5GtUCpVgII
         j569VIyC4KgvXjOq+VEQX9zTqPRVdDzZfZdXnGJT5OaJNtJOeMcm1zSUdfFKb6/G8qTb
         u5GzT0qoxX1OGOxBepw5DPEIRFA3doyA5TfKBoPyB0/QIu72niaB1Ffi1ldUA670NtiM
         GAlpOxOzCWOTzGRdiEHVPyJ9s8iw6TOV7ByobP9SEHiHsZmp0p4H+7ZELYzG6Um8qMzi
         rVNX8qtpLZqCymHF65witx4t3TusE9AurGpcfnNmoPr2/zSaPQ3izAHgPlVGsm7aDTZd
         /AHA==
X-Forwarded-Encrypted: i=1; AJvYcCUuwc7RO645LuqkM4rH+Ojb4bdvhSgIGgxxsodtRQ3QuBbHHLdWstGNM8jhv+FvbHYtQq4o7nXWQsNr8MGP@vger.kernel.org
X-Gm-Message-State: AOJu0YxAg/VWS0IVIRVWzxs2eqf7Djsg1tZFwX8zNn241AswS4XQuYjr
	PcClwb6hPFUNcK9d9f6xBIbHiX466+KuRd/HODyNtpuweKPX0Q7C7JAIPIXJldG1LeJ0Bbp2g2b
	YlznHWUFGnQCTq3sCRF+xUpOGxSb439hmwn5S0GfpVjz9OeT+yKXxf3AN0CECuqqQFJnn
X-Gm-Gg: ATEYQzyycLCkSA07gV+d/1atCJnxV+TA7u0LetjurTuiMJyTilERMi6d37Wh1PermGs
	y+hVLmBIHLfQL6TMfPkl1C/GbRllhUrS6L5wFTyHUh2S9d54+SyDTeDOlZNz7JKd+YDKmu4kgtq
	A6Qtr8J1EoB/8sQ3UhKqo/6HLbRYYxFsz2lIQCCxYawuvKKXkOwjknTG1g2ZRdwPxDU6fXAb2JM
	anrzI6QN2u2Wd82SkmP3SRypmNMt3sXygRxwpdLpkmq6SQ4oaE3kBlxXkhjjF/s/85p4ZFS3UjM
	c5gvPjKeyL5MpMmHhpk+l9pDwEcsqp++786ENS9ANodJDaRLMwnNM0S6XF2OK43Iir0pCXtdqJQ
	S6GngG4c2amfirsL/eKJulkq9nkircLsXg/VF4vZtOY41tUwkBdPkll5CieU=
X-Received: by 2002:a05:6a20:7fa4:b0:39c:787:f185 with SMTP id adf61e73a8af0-39c87915751mr16954130637.29.1774942811784;
        Tue, 31 Mar 2026 00:40:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa4:b0:39c:787:f185 with SMTP id adf61e73a8af0-39c87915751mr16954104637.29.1774942811329;
        Tue, 31 Mar 2026 00:40:11 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm8013076a12.2.2026.03.31.00.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:40:11 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:09:57 +0530
Subject: [PATCH v3 3/3] media: iris: Add Gen2 firmware autodetect and
 fallback on SC7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-kodiak-gen2-support-v3-3-958296fab838@oss.qualcomm.com>
References: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
In-Reply-To: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774942796; l=11196;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=ubBf2121TImJmlaj+0em6aEAJSYd5uuMpFcNUZPBaEQ=;
 b=/NfBT/WGh9zQpaHcv8Bnejscd18jYgr/xTJk/Zl9mqpBgG8ZwQgdep1orJqNxnVesIldRcugG
 CuBOtmcJfA+CwoDJtv8aIJsox2/cZjgWgUNW2sd2lm3WauAnrdS/3aG
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: mILs-inyHD6apHJGLrzFJWeDhBGm97ID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3MCBTYWx0ZWRfXy7AZQPbt3Y/u
 XZKA2mu9onIvW78y8FruNeK0xOXrdxg/k5fZjgXMKj8X9DHohPsQhoqggm1Qy0pnnzUO66fTPDd
 uRxslzAyCwf5wW6UiPwmeusEB2mvYx2TuzF+dM8zWEOii+wg9EK+/VD3lzTHktW2afsLwswcQ+/
 /0+J0VVZxFm8plS0PP71ZJA0QM7XKz81OxvbpY4GGXCjHe4PIJihYzgZ4st9jOSCAQLi4JbSUpP
 Q2GbLM7+vt4xg7pJ2xtBbMe/YVkg+xQbwS/Wp3Q1fUsIkIjpnK4nlsgNnihsrAWEuNczQauljcq
 0N0BRk8DjCzbRDUigb67D37FALCcMg4VGGCIOMbsoHGXz8Se3ZVTfn7a1ncOBYr1atABOFSiBjd
 GUmkCZa7LLR9KpigBrZA+roYUNMGmbGSO+ECtRpf/exlYTq34yvGNVZxHDDsWUigdcTdmiwpezE
 cC+VCHOlDiCdYIFh58A==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb7a5c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Bx_ZIWocDv9EhjstIRYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: mILs-inyHD6apHJGLrzFJWeDhBGm97ID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100956-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D7CA3655E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
dynamically, update the firmware loading mechanism to prioritize
Gen2 availability and detect the loaded firmware version at runtime.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 Autodetect : If no DT property exists, attempt to load the
   Gen2 firmware image.
3. Gen1 Fallback (SC7280 only): If Gen2 loading fails, fallback to
   the Gen1 firmware image.

At probe time, SC7280 now defaults to the Gen2 firmware descriptor and
Gen2 HFI when available. Introduce iris_detect_gen2_from_fwdata() to
detect the firmware generation by inspecting the loaded firmware image
before authentication, based on QC_IMAGE_VERSION_STRING and classify
the firmware as Gen2 if the version string starts with "vfw" or matches
"video-firmware.N.M" with N >= 2.

If the loaded firmware on SC7280 is detected as Gen1, the driver
switches the firmware descriptor and platform data to the Gen1
configuration so that the correct HFI implementation is used.

This preserves DT overrides, prefers Gen2 firmware, and maintains
compatibility with Gen1-only SC7280 devices.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 65 +++++++++++++++++++---
 .../platform/qcom/iris/iris_platform_common.h      |  6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 11 +++-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  8 +--
 drivers/media/platform/qcom/iris/iris_probe.c      |  8 ++-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
 6 files changed, 80 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d7580849d7b68c7c15dd7f82f89a680b..481c33c9fb4daa0d547c43f776f188c17de6b35e 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -16,6 +16,39 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	int major = 0, minor = 0;
+	char version_buf[64];
+	size_t max;
+
+	max = (size > mlen) ? size - mlen : 0;
+	for (size_t i = 0; i < max; i++) {
+		if (!memcmp(data + i, marker, mlen)) {
+			const char *found = (const char *)(data + i + mlen);
+
+			strscpy(version_buf, found, sizeof(version_buf));
+			if (!strncmp(version_buf, "vfw", 3))
+				return true;
+			if (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
+			    major >= 2)
+				return true;
+			break;
+		}
+	}
+
+	return false;
+}
+
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
 	const struct firmware *firmware = NULL;
@@ -47,6 +80,14 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
+	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
+		if (!iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
+			dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
+			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+			core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
+		}
+	}
+
 	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
 	if (!mem_virt) {
 		ret = -ENOMEM;
@@ -65,19 +106,29 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 
 int iris_fw_load(struct iris_core *core)
 {
+	struct device_node *node = core->dev->of_node;
 	const struct tz_cp_config *cp_config;
 	const char *fwpath = NULL;
+	bool is_sc7280;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
+	is_sc7280 = of_device_is_compatible(node, "qcom,sc7280-venus");
+
+	ret = of_property_read_string_index(node, "firmware-name", 0, &fwpath);
+	if (!ret) {
+		ret = iris_load_fw_to_memory(core, fwpath);
+	} else {
 		fwpath = core->iris_firmware_desc->fwname;
+		ret = iris_load_fw_to_memory(core, fwpath);
+		if (ret == -ENOENT && is_sc7280) {
+			dev_dbg(core->dev, "Gen2 FW not found, falling back to Gen1\n");
+			ret = iris_load_fw_to_memory(core, sc7280_data.firmware_desc_gen1->fwname);
+		}
+	}
 
-	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +150,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 0408d51188b27251986780de6b4672b155ab1005..7acb073f719746f57ebaa2afd9061db9239f860e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -257,11 +257,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 00d6244bc92fd9216bd7c0e6153689e7d8982a67..8259709ba203eac2230da3048166b33892b337b2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -22,6 +22,12 @@ const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 6180104f3b94bf0d5e3206481816802fbd09849d..829dc37b4058101e7dddd484533724272b502560 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -83,7 +83,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -112,7 +112,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -147,7 +147,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -178,7 +178,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dbc15edc602b72fdec8bb2d8d3623676afee728c..898260a1a1ea65ba8e082b1d1df0ef5f34a733eb 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,11 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
+
+	if (core->iris_platform_data->firmware_desc_gen2)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
+	else
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
 	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
@@ -271,8 +275,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 807c9a20b6ba17fdda8e7e91956bdf19e83a3ad8..6fbc20366f5fd3a80468d90d813851ecf54e4cef 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -196,6 +197,8 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_session_init_caps(core);
+
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

-- 
2.34.1


