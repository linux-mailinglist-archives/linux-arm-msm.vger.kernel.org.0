Return-Path: <linux-arm-msm+bounces-114035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id shmJKmBMOWrVqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 434706B080A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PbQjFj19;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g8zQWQol;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114035-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114035-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5FFB30248B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D2C3242D4;
	Mon, 22 Jun 2026 14:52:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC9231AAAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139947; cv=none; b=MFVC10He0N2Xr1Sno98oa0wcHSq9sYj1Q+aV9Vw+4G28Imv9KxDxF2CWE8MB3ueEL81aAaO4OIQ7hE36MYtKDUc0509gjkEkTRfzrmnY7o9mGaEUtDiSQOw4tMHxyMJYcdtrVVa12gh6B2/pb6JUUYzVYr1HjReOni/fTkNXoTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139947; c=relaxed/simple;
	bh=godFh3XClGWYOD/13MM75KUQ5HsrEM9evqoKLd6UxAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YP7ZMZVZje5TtGB8Cp5XASAD2i/+9aOtO2DeU8wrtgiMsCvepAsKU4mE6hYPEpLHIeKI/9/bYkW9FPA5g0+Gh54uFdJxIhgWlSTHuv+SPBiXOFFLXR7qNxKAD6DKNrKUpm9O686Aw1Jov3Z3oB1n37olWU1r5E28/aa8n0KE/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbQjFj19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8zQWQol; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFcxr773387
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jMt3mRcxAV9ld7CzQ2hfD6sxJ/UqAqyCYYaMjeqBTs=; b=PbQjFj19YXK0JdzJ
	Srn1wW17QL7GBoHVQQdvzlmxo+UXlCKtrB2XNxQPWojJeHyF1uDa+++Rk/zYQi3S
	Bdz71b4zP8ZmfnrP+Mlga+GXnY4si/tkTD32HQbMFSUmyWAX+A3wJKMAA3r25AKm
	DciTnrUUTgOeGF2JmVNSg32JbnBrFxpxIn2Q5wIizv3XpQaR13ZQQITyaKpj9+iN
	QKnw8C7+fyf6a452aQ4nc8CUQS7zre3E03n8w6J78303xfv8oifvfh9bwMwQSLXm
	1crGzCJTvKkbOaEGSMtnW1uZVQ2U9pm7eOfWsMox8v3bc4w7CTKjgE669EbgmUXK
	LdQRng==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yj90dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13825f68028so334668c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139944; x=1782744744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jMt3mRcxAV9ld7CzQ2hfD6sxJ/UqAqyCYYaMjeqBTs=;
        b=g8zQWQolppbY5o5lmgQwSmc11gmQ6PCkC3MHDUP+QMC7KU22a1hm7HQya1u6U6UA/5
         KSiHMOTrJ7WxS8T+WfIcqF1sgpjGy4+k2Ej2fLPMLOI4VCSly8eGIRP7rg4mg8Tsji7p
         gIx+ePQ6Be+ShcOMMoRp4VRJuz5kJ/khiQqjvAbhYbdKLBuBzzQmIwDPTZ62gkjti0+L
         yIyva0gU2fhIs9WUlIcWp7nusvmpqvNlkLLPqJ+WbNF31N+lm7NrkzurplXI1qSNhhuo
         +g51ovYARBbpCUUQGKO4k3Y0yHpHqIruB3fKCQBSiEeYNfs8eoFdmicuimfE3cpJHgZJ
         PV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139944; x=1782744744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jMt3mRcxAV9ld7CzQ2hfD6sxJ/UqAqyCYYaMjeqBTs=;
        b=dyIFSPpLjuR2dzltVRF02a5wUQ65TnXlp6gpp0r/VY6MjlafyZrvlVRMYF+BR5/f6G
         GV7MSkdWeNIjNnlr51M6tESlLfAZM7SRDSMp3r0EcZuJlr96LLH/2YDUZ/nAq33C0yk4
         DK75hevJH1Mmca6ztC2sNp9dv1hPUW7XLyJP3LjQWMCqVLnRYdnYMvhtVJ39ILSBo5xA
         b1qG+RFAIOK1BfsSDzf06jWQUPE2CWxQs6xPO1oJWhu4ocjOBAZfhfY4eCo6+lRO67w1
         cD2YOTkL9RnfEKKnqL+6He01V2ccBx6Tim2WyC9seGprJ2Nyt87MNXC9B2NNY/BV5IyP
         qCfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Aj/Ratmfy0mN5Cyr7+jN3sP1DtShTephse7NVo1mf60ChHed8gT1JkOfiyp4OhQvi7wsfjr99xJGRpQw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0LG/q4zQG+8EKCybpOgNCtd/oVEBW/syy9Q3GUtan2tKPLf2N
	L4xNw8+XjdQhGcsdNQvSNZ2E+RIkxF+G48F+9IdlwzBsItE8FuY1FJnWwbd/7BVKhZPdF2T1dGN
	mX1EBJH2DrJpnqAllQRa2UT0nRM6NBGSB6Ie8wQuP5hBimuPGBOjL3/JnIv+NTRGxq66e
X-Gm-Gg: AfdE7cnckfa8d9k63Z/zD2WZSwSrOB4gk18zp9Fo0Qh+4eyNOAB2NIRqpLFqjn9yjYt
	TaEqJoNZpBLuZQexMNdcOrs72u/T9Q1qDDM0dDbsBqInjBQqF4cFLiRrFTNUlDewL0WWJQyPrGv
	AclFtuI9WkNllL4At1jKdSU8MB1V5qL+ipBSKIdKYF+i5B7oK28GiyaMWBFx9nrUbuH3VTVOTTD
	5eTsVVd82NtQLBsuGnOaLhhSohPkxDKgn3t3T54Y7YZXD+pQiGRocQjUrM6rRUNLZ93VvD3aoLU
	MgTBcg/utI08/6cGvwoZ/Pl1f6nYaCLnl9INQqrSoRXG+DWYr6246NLtpmT9Uc7QgRQaV3dn3GW
	Zi7TXxKF2bc+IEJFOaZDPU6txRfe4UgMGP+RZnUZdP96TrTS/6RXa05IeoA==
X-Received: by 2002:a05:7300:72d1:b0:30c:2932:dd2f with SMTP id 5a478bee46e88-30c51e22ecbmr234386eec.0.1782139944285;
        Mon, 22 Jun 2026 07:52:24 -0700 (PDT)
X-Received: by 2002:a05:7300:72d1:b0:30c:2932:dd2f with SMTP id 5a478bee46e88-30c51e22ecbmr234373eec.0.1782139943757;
        Mon, 22 Jun 2026 07:52:23 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:23 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:22 -0700
Subject: [PATCH 09/13] Bluetooth: hci_sync: Add __hci_reset_sync() for
 device driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-9-11f936d84e72@oss.qualcomm.com>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
In-Reply-To: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: FbV5XkxZPhEGnXcbMgFJrABudZ9N1APV
X-Proofpoint-GUID: FbV5XkxZPhEGnXcbMgFJrABudZ9N1APV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX/yvFDUg5tYfs
 g2ht9U+sFIvhJYdQyk4ztkzIwL6FEjVNo5UCq6QiyOrYRNhEAnzHvfI1a2AaJwE7CUHCQ4ZN/Lv
 JkUTkJCKIZqoSln0v9tbMKIR1kcI4p0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfXyWjSMRFsvRIR
 SCkWegBRWzGmQXoWi8P+ndtIXnY7+xQaBTbiM5RMh1CDO/LncVIUx1nnrCROO1DxtI14BB2n53p
 npiz4stBpq4YDu7TOKmlIeF4xV6lF2lwHH06G2ZI7KtnxchQ/hqPR6l1NOCBlsVCr4yVALPOQeh
 hr5+MZ8erkm4oUAUIhmpYoGXseg5k4smiTLlF63yaK3kJVzil32jAYWad7yl44vJbhcafW8eFng
 oG/+jr+6XahT6Hi117/FDfFTxMeh+ls8AbX0s9XcjDmgP8BO+QvNuPUMGX6pRzV9KK1woipuqrq
 hS0uQsrg2+7AE2Frxje6z8ssDU1GfYY9f3YAsScc0xJ5n9l0izkGH2N6IIk8zG5p/3/ybzwOSas
 kh4blF8MUbF8V2Xl1owGf15LawsPuEjNSwTlacXXT41s9Z31wn5Z0PRpu/RXJre6U4iGB/fFmp8
 7Y65dBUPGcL5yCdEehA==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a394c28 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kQ_UBjYZPz6FNnKCBYIA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114035-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 434706B080A

Many vendor drivers have requirements to send a raw HCI reset
synchronously with HCI_INIT_TIMEOUT.

Add a dedicated API for them to use.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 include/net/bluetooth/hci_sync.h |  1 +
 net/bluetooth/hci_sync.c         | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index 73e494b2591d..7005fc9f257a 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -59,6 +59,7 @@ int __hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
 int __hci_cmd_sync_status_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
 			     const void *param, u8 event, u32 timeout,
 			     struct sock *sk);
+int __hci_reset_sync(struct hci_dev *hdev);
 int hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
 			const void *param, u32 timeout);
 
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 601d44ef975f..40c9725585cb 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3684,6 +3684,20 @@ int hci_reset_sync(struct hci_dev *hdev)
 	return -bt_to_errno(err);
 }
 
+/* Send a raw HCI reset for use by vendor drivers */
+int __hci_reset_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	err = __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
+				    HCI_INIT_TIMEOUT);
+	if (err < 0)
+		return err;
+
+	return -bt_to_errno(err);
+}
+EXPORT_SYMBOL(__hci_reset_sync);
+
 static int hci_init0_sync(struct hci_dev *hdev)
 {
 	int err;

-- 
2.34.1


