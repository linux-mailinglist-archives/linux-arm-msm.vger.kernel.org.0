Return-Path: <linux-arm-msm+bounces-110324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEuIJFfYGWqjzQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:17:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201060729A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7090317212F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 18:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A243FDBF1;
	Fri, 29 May 2026 18:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqfd3q5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYY0nSAn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7913FC5B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077885; cv=none; b=WmMsU6Jl/a4c9+bu5GizlDbSsK5m4vPuWfdYvliiw2YmJTdWlyKJMYMyC0Qd8uE/BVhTD3SvMpJIRiYhppSybjG49J7Y39PYESxBcnSwx1sbulROQjRo75pId5x52lOdIo8rjwYpgAVfnNyXkAeKIAMhBVSXOMqz8U2eUGyZ2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077885; c=relaxed/simple;
	bh=lX4Sa9Hub5ccbJEILPWfMBKlEwWav5LLLZScdiEwD+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uH7Ca1BFp4/DsZgSbowig4lDWaVIv56TMMRWLaiDAhmQ1oRkuuLAUf+gkc8E8g0XlxFoSdzRc7WEVczWSw71JhlqBDPS9uTQkXgiHrFhaFa7prgM9tUXmMn8yvdh9kVlfAZ0X5YiJTGX0Esb0KlJVaQgdNS4tMyz62UCqC3qLcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqfd3q5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYY0nSAn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TI2L6b120501
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 18:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dLYtPzjoXd6bGPMhoRcblXDrrkpbN7zbOxO
	Vq2Eu8+k=; b=gqfd3q5DHhQSc+QVmXnSG8Mw7vgGxvFpGgjj+VhcgpACiWpsZDV
	XfbLJ5Y6FUIt1eNNlKp3muZ+Krlw4VexZk/kEJAzVNPnw6ty+Jpxb+o0isCQ03UV
	oWUz70A0zD2Bk/mT7sG2joxZfq0OGS6S/lqNTTPTj1L6U26pO6LhTNd8qOlPKHvl
	/HmpFCRkXINOGb+BHzQj8aeV3+5sBa4IK2q1Yl41QvCdIbG+BV1Fu5AE4OOMsXzL
	5BZrGa24lgrCVMs41jevWYBaqE28rqX/Okk+Ywj34d6KEMmv99Jut6npmKMsqtDi
	0cKzeTHrTwbzpjcJdyONtTMa+rMBhtfPSUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5wwnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 18:04:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf3636d6c0so2693445ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780077882; x=1780682682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLYtPzjoXd6bGPMhoRcblXDrrkpbN7zbOxOVq2Eu8+k=;
        b=kYY0nSAnVI5+g1jRdmjWj8P2lVv5/ryKtfsZbRBePMysVrsdf6EvJ2FVQAOF7K1RC9
         qzXUDq33m4zudMvxT4BC5gmcjr/ZBDG33mlLyvBc03zTfEK2jHDXWM5R2lfHWFOongCu
         o1ycSC3g1TdEbJBgnEF8zHYx2WAN0nWfbahsmbqgQt97ivgAN247MOhWLOc8bRtRVkrY
         /ZTgUmaFcqiBK9LaHokFKTkj3cgwzkpj5XQa4P/+V3T5NrqL7GYMYA9CyDbF9RpG0roq
         BO/oA6vR1lgle6jpzye0Vz40QcqTcUvivH8mx88yMZtQyjpHTfDMDIK/sa400U6LYQGw
         +kCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077882; x=1780682682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLYtPzjoXd6bGPMhoRcblXDrrkpbN7zbOxOVq2Eu8+k=;
        b=TQ4PVuYZDY07e/asRzfH/gZGjTcxBCO1XUykIObw6jZ7LabXBNL2wTEvLqmpLOC/Os
         aB9zyD4guZFYBQxYgiNMB8UnI4an6WNNYlCem7J8qOPGiT6pKUYOaY3xJyaByon8N5d1
         DVVFJgDQP0acWriGFsQ0I6xIizMhRJ5OAQB3A25ZLywcj1toQopsRGHgVl/3wZRvZLJS
         2U9Gf/4N5Z19vCvYu+HIMnphSTM6m3WJ8a9bFORVM9yy1YrWOKkxMVPeOYtzNqcC8MQL
         C3if53YTBiotWEw6W58rG9Zsd7tlbR0GLQ6Ua5L3IDZg04iBVzAWnKkuxFRQju4Viu1W
         Mr9g==
X-Forwarded-Encrypted: i=1; AFNElJ8cnY0ME5UJJqaM+KP+45i1B5pDidjZPZ2iGwh4TsBNAA01tMcCvNet+hz1j3TWG2R43SyUQbVdqgr7fbwU@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfHoL8BJ/knRYyqJ2OlXP4gutTEWWNCSMG9bgH+NqaXtYMUQt
	N+/SJ1dM5NklCUcHs2Jg47K5Qb870aYvmTomEZqWRO8joGtdqq8KelADET51cAzyqNa246Ocu45
	xV/wABbsrBDcjIym6Ajcgwo874gR3+7KIInxYkX8fw/KjYRM1cVN23BFPS/YZUG9w7Qxh
X-Gm-Gg: Acq92OHv9Nxr2OqZWUDJ0SUVEGZJnyseeNG3FZk3NBGLAGIXEGRqJ8s2DjdPEXRnqOx
	V+iagE1PzinjZ27qfJ9iQPYGeOijfcRECtarijzl9t//HeAw2g9gw1fLpoQaGzZtIBGvGcNPUGL
	/KxDbpUWcoDim0lFOI3wvI8mqBpfVTmybv7/9CyAba025SJ83XW3mLpfliwkrFNaFAV/510QZd2
	1rZ0ccBsg6xrBBzfKz63fI5HljeyOncEnC5AC1ouBWoC4SqeHxD8vP4kyrGWJwkp/s560/eR752
	EqOHcabBUpEdkHhPgA4OScMQh30dLcUDRxpcPNjQz/KNOTiZ1NyuG/Cm1w1GPsiBgCkyIJB1l6V
	uFS9wxqd58b+HTjUauDLT9SsSlQRNowLxQ3O5V1R1uKH0g4aGFak76P6v3NgeGA==
X-Received: by 2002:a17:902:f60d:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2bf3637f9bfmr11100025ad.0.1780077881835;
        Fri, 29 May 2026 11:04:41 -0700 (PDT)
X-Received: by 2002:a17:902:f60d:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2bf3637f9bfmr11099585ad.0.1780077881331;
        Fri, 29 May 2026 11:04:41 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd8dbsm29049425ad.21.2026.05.29.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:04:40 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: [PATCH 4/4] Bluetooth: qca: combine NVM and calibration data for QCC2072
Date: Fri, 29 May 2026 23:34:31 +0530
Message-Id: <20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: q_tTYVU52ajt4iGmT7fceTcaKLy5ZZE2
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a19d53b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=v3OVykGQXCv_UCWT3hsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: q_tTYVU52ajt4iGmT7fceTcaKLy5ZZE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4MCBTYWx0ZWRfX7qcEcddbb2XU
 kdO59fV1WNYPGPNbnNnSvshSZVQhxo/AEsGTsZuf3ACjmBgOPZ91EBw5PBiTr48ZpTLX4eQQDl1
 fs6tV1Z6KNVnkKwSkTy57w942OQq7EymfhuDcjBNtuVPSQ1ZTIMTnKWEkHPzIc9RwM8bB6SB0K5
 gPmK5VEQ3bB+Kwv5LizLY3zCG50AsWdPjXiQqh0vcxeWEYhOlShzTKtZ7WgOUq5eux3pns6JUIh
 BePMTg+tux9SKXnwundNyiKEt3kIqsk2SdwcTvMXTdcwO4g1F4vsixF06JZ2VblWHVaec2Yg72k
 /TOG6XlATPQB+UcEpyS3jqeYF0+x7N52tu03iKMwQrsDUXQIJ9PGKSxxwTS8QNc0Hu2fLRJ3gWG
 p46lySSq3RmAOK38lrGpuwBYAiSxPeGRXzRHBkN9ZajD8LTzEbRQbsNAyGILfZugqgwtU/imgTG
 m0sz2CciOujBWy81Xkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290180
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-110324-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2201060729A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QCC2072 requires the NVM and calibration data to be delivered to the
controller bundled together in an outer TLV of type 4. After loading
the NVM file, load the calibration file (qca/ornbcscal<ver>.bin) and
combine both into a single buffer with the outer TLV header before
passing it to qca_tlv_check_data().

The outer TLV header encodes the combined payload length in the high
24 bits and type 4 in the low 8 bits of the type_len field.

If the calibration file is unavailable, fall back to downloading the
NVM alone.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 0ef7546e7c7a..37db1cd9e8cf 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -612,6 +612,53 @@ static int qca_download_firmware(struct hci_dev *hdev,
 	memcpy(data, fw->data, size);
 	release_firmware(fw);
 
+	/* For QCC2072, combine the NVM (type 2) with the calibration file
+	 * into a single TLV of outer type 4.
+	 */
+	if (soc_type == QCA_QCC2072 && config->type == TLV_TYPE_NVM) {
+		const struct firmware *calib_fw = NULL;
+		char calib_name[32];
+		u8 *combined_data = NULL;
+		size_t inner_len, combined_size;
+		struct tlv_type_hdr *outer_hdr;
+		int err;
+
+		snprintf(calib_name, sizeof(calib_name),
+			 "qca/ornbcscal%02x.bin", rom_ver);
+		err = request_firmware(&calib_fw, calib_name, &hdev->dev);
+		if (err) {
+			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+				   calib_name, err);
+			goto skip_combination;
+		}
+
+		bt_dev_info(hdev, "QCA Downloading %s", calib_name);
+
+		inner_len = size + calib_fw->size;
+		combined_size = sizeof(*outer_hdr) + inner_len;
+		combined_data = vmalloc(combined_size);
+		if (!combined_data) {
+			bt_dev_warn(hdev,
+				   "QCA Failed to allocate memory for file: %s",
+				   calib_name);
+			release_firmware(calib_fw);
+			goto skip_combination;
+		}
+
+		outer_hdr = (struct tlv_type_hdr *)combined_data;
+		/* high 24 bits = payload length, low 8 bits = type */
+		outer_hdr->type_len = cpu_to_le32((inner_len << 8) | 4);
+		memcpy(combined_data + sizeof(*outer_hdr), data, size);
+		memcpy(combined_data + sizeof(*outer_hdr) + size,
+		       calib_fw->data, calib_fw->size);
+		release_firmware(calib_fw);
+		vfree(data);
+		data = combined_data;
+		size = combined_size;
+skip_combination:
+		;
+	}
+
 	ret = qca_tlv_check_data(hdev, config, data, size, soc_type);
 	if (ret)
 		goto out;
-- 
2.34.1


