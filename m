Return-Path: <linux-arm-msm+bounces-96512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H1dIAfHr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:23:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7165246463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BECD30F5CA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA423E7179;
	Tue, 10 Mar 2026 07:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWrtB+Yk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKK2QAMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE23E5ECF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127352; cv=none; b=NpiHAge3C1VN15Ocetw/Z//bzgaW9c5229y5Sy+clw5r/Uneb6XyZkxBZfRaK0OVBDYZpWlT4RrcHXV2uUDt/tuL7HQiwcGPiTfmjPoVlEqN0zFC2pYe7b8ZnA4FelAsPjqB4norYF7GIfIlqLVGgOwGM15x3muj/qOdlrWXYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127352; c=relaxed/simple;
	bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVz6HD2KksjXo9wxrMe1HicodQEQmprRGNgmkpa64p+UlsPGMoA302uurlo/SfsLNaSaqXk8qC4npgKGq69a/Jx1B07YwxExT9ePufdRf/tvIGl5BsweMMVCQEPrna1+D+PzQCnpFuPid+jtgtqI7Mem1SE+hgCSEpSthHfT0jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWrtB+Yk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKK2QAMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VKLM2021368
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=dWrtB+YkkeoZVD5l
	dBFkknMK73pt1U9W74yJib2y3ulLziyenaDahhjvZ9t4ziBrpCDmWruMXWoHjkvA
	+wJ7JJFub+qHEbbjgs+a6kW/9y42jPK8PO7KHLjOm2cRsvBmb7gN7XaqgGN/TPZJ
	JEtkg4qNoW4BMt80YI7HtRC2+oQ0/WR7fylCDmlraX+U7JE/HY6IXXKvBkfvq+hE
	83fPNy2XAtlEQfKRuK5PvtY0hYa8nI90pynbbVBLvY/KKWAhPSrTR+V37Ehaa++N
	ZSOTeMwl9aNU881G3Euk/MEd6o6xqIUSht/bMcjqiaEyvD8sWEt9jpcB3e/4PApe
	9t2gCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w85de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae3e462daeso48703875ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127349; x=1773732149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=QKK2QAMRJHF3Pb3CKrR1pPjYjo42G14IPTOlOK1qvKoH3etoZqRTJbr3j5Ezl2OKo7
         ZOEwHXEYUnngMIsCzkZkfM5pMoxKQeHkpkSRJTTrrTH8xpLcMvJawXkTf7UbxW5CiwYv
         Ro1HPmaWAFV6yjc+fWJySprsbpV7Z5SJzOoXoM9TM+2SaHcF6h7VNg10TxQKgbzH4Ea6
         8LTDJT3rY8dHbJiDxFro6iKHYO9HyAgtdy7tvrPy7R6AdlBp7zWydHe7VlvEpzhCghOV
         UHShwlzF3oxkYpWZQFFgOwOXKnjITlaMUepb+CirfMcEfRBQWOGUZDX7nK4/BfukFpz2
         ZfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127349; x=1773732149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=ovClYtplkpi3wDu19onGAgygZxO/vzbzRFoyCoLzGUf9ftDX04cBdbH2CfB2I4VfMW
         yNQcrzGLOMeuVPdaacupuIIPFvLnUK/PswYZwvs7RG/Eo7z55l/hOQiZUk7lOOw656o3
         TxB9zkIKrJvXLDodizDkjzhjZuJV+wt1cE0gGqNE5IKz+aU01KsIrOy0on7PIT3sC6wF
         xAa8R+ZxUdVN2mL3ToRYZfY4iSHbB3sYcIVfnxufybF0CS/LT0A0jfH3ns1NM0fSNHcX
         QmgKxgr2U25CzWhdvkH+n2Q0nvoMmDeKlbG8JZykKKW2BY/TVTgmVI/A4q8FG5G8Ye3t
         HpCw==
X-Forwarded-Encrypted: i=1; AJvYcCULmRR08ZBDMikk+QazJJHy+STgygsP+ty9Yqplcz0d1MpVRhLIRVfBeiomg7AFx6izanUdNFetYT/TTHzM@vger.kernel.org
X-Gm-Message-State: AOJu0YwbcPqJur8Gg67btsZbce27w0x/TYeXQcOfLELra6hot070JTtI
	u+lcN5O4uMQYqj3TaaEI40cmgDAHWn0YqczMMlbWRHtH+dlt787vqTTdIL/mBaYVaSDKn31mTGw
	L78XaUXR9UYwqA1mzUP4SdsNZjqKc/14PZiuHAuGCbALMiYD7hBjF61FLlOfrGqnpNmYq
X-Gm-Gg: ATEYQzzZqS981DlhZE0ex8l5bx5zFiLsNYUTAAL4kcjrcWxw9CvuAa/cVGmHcbLl5o4
	F8vINwK0wzoWJtQ2AZs9eDnGXwG7KCZi9rArsaB8YbfqrVJIzGNiRfh5ycRHAO+RBNeI6tsyPSm
	Zi0dkEUL0nn9TINlPBF2XzVnQFizCSNa/wAVi3+cgNOrSOhm5yk3KtIt5pQXiwt4dEaQc0Zw1oE
	eFNSpEmLxNPPQOlXIjGMUVoW72YW1GdOXmig8H+93aYkwLhJcjBttEF3Rg9e6bPEs/Nb0KwxXQw
	dfT53u6ZzLVcrd/1iCeqcJ+Kr+VPg5V4hHrW5qAFyZXofO9TYTbjFozY7cHKLz8NSe83FxGZhpl
	Yk6f5DxtHYwIJIhUqn44jYaagu+5KVn2ZOnaDXiaOK9M3WoeADnk=
X-Received: by 2002:a17:902:e790:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ae82505f47mr138797305ad.44.1773127349346;
        Tue, 10 Mar 2026 00:22:29 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ae82505f47mr138796965ad.44.1773127348780;
        Tue, 10 Mar 2026 00:22:28 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:28 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:01 +0530
Subject: [PATCH v3 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-4-994ea4b0d5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=CTZh2FV9FQiyZwGLQPHTzXB9kJsW6bpaNzbyq0P/Z7ViUQFDLg9+WJ+aT6EaDJ4D/XXTwoGOe
 oXks72SrrRJAHcr4haYbVSjBADZoIijZ2z4edmqXtFNpuZGaHlJRE6T
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MCBTYWx0ZWRfXz/PkWuJgHEwR
 u5ceALxLX5m87y3xLKeKV4+8l59qpRa/dF8VguzzUmwdBKAdq5lsbOxiikGJHS5qbhTCj4FiJ/q
 /mc3wGMX8i2ruH88XMt46YGFdHJoCrhxbke0+vmZp/JkT88NhvqbeFQrc87EMVMH5HpzWlbRA+1
 FGs/bU0pZreG+ZlnBZvivMailvA5pFA5suTDRdXUi7Q6xv3Iw2bP3PcOlL+DymxrCMZLksV6Art
 1eEqyyPTxGgZ+4+d+Hw51BpBUkO7zB8Vkr6w4NwvfE5QrLZxpHpS7/twQN7ks7MwywAlvs+BUjC
 L43GFlznafM602g1hlBlBYGWwsNfx/9ZPXC/sC1JdFWAraIGEMPUTQjg0oKAGB2lrWU8Yj0NZ43
 v9kKMCympAU8SVVh4Lu73v5y/FoyROM/0YjDIRLNCNRMkQO47AtR19B9N3aoIJ5GIN/FtWCcdvM
 5UzRfTwqnZNLbdE0nqA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afc6b6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: rSh10g_pk1vVzbBV2n8Mn4hM8Cf4DEud
X-Proofpoint-GUID: rSh10g_pk1vVzbBV2n8Mn4hM8Cf4DEud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100060
X-Rspamd-Queue-Id: D7165246463
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
	TAGGED_FROM(0.00)[bounces-96512-lists,linux-arm-msm=lfdr.de];
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

The Sahara driver currently selects firmware image tables using
scattered, device specific conditionals in the probe path, making the
logic harder to  follow and extend.

Refactor firmware image table selection into a single, explicit probe-time
mechanism by introducing a variant table that captures device matching,
firmware image tables, firmware folder names, and streaming behavior in
one place.

This centralizes device specific decisions, simplifies the probe logic,
and avoids ad-hoc conditionals while preserving the existing behavior for
all supported AIC devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -180,6 +180,16 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
+	const char			*fw_folder;
+};
+
+struct sahara_variant {
+	const char *match;
+	bool match_is_chan;
+	const char * const *image_table;
+	size_t table_size;
+	const char *fw_folder;
+	bool non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const struct sahara_variant sahara_variants[] = {
+	{
+		.match = "AIC100",
+		.match_is_chan = false,
+		.image_table = aic100_image_table,
+		.table_size = ARRAY_SIZE(aic100_image_table),
+		.fw_folder = "aic100",
+		.non_streaming = true,
+	},
+	{
+		.match = "AIC200",
+		.match_is_chan = false,
+		.image_table = aic200_image_table,
+		.table_size = ARRAY_SIZE(aic200_image_table),
+		.fw_folder = "aic200",
+		.non_streaming = false,
+	}
+};
+
 static bool is_streaming(struct sahara_context *context)
 {
 	return !context->non_streaming;
 }
 
+static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
+							  const struct mhi_device_id *id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
+		const struct sahara_variant *v = &sahara_variants[i];
+
+		if (v->match_is_chan) {
+			if (id && id->chan && !strcmp(id->chan, v->match))
+				return v;
+		} else {
+			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
+			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
+				return v;
+		}
+	}
+	return NULL;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct sahara_variant *variant;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	variant = sahara_select_variant(mhi_dev, id);
+	if (!variant)
+		return -ENODEV;
+
+	context->image_table = variant->image_table;
+	context->table_size = variant->table_size;
+	context->non_streaming = variant->non_streaming;
+	context->fw_folder = variant->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.

-- 
2.34.1


