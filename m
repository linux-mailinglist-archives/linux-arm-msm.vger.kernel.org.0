Return-Path: <linux-arm-msm+bounces-114589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y+z3CJkMPmqV/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:22:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB526CA4D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:22:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OKnuzNpe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IS9ZDk2N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114589-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114589-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25ECA3099E2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E82A390C8E;
	Fri, 26 Jun 2026 05:19:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5B35F5F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451191; cv=none; b=bgfKgYpz43kP/YRkDzK+skHQyjhv324AOSTf+AYZIFwwvHT+PTfMOtc7tcZTZldgXpCdHNQjPJI09qRpjXrhfL05Lyx9zFj905x/di5ui4MhO6w+CtrpHxByBI4T8k70A/5slVSmiyTB6d+szCtSfzTePr95cd2NFti6816eiCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451191; c=relaxed/simple;
	bh=EKH/Vt/1xTialLQ4sM5W6HNPLWbLhK/YtG65acTMZc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nngxw8WOl48A6TvPsuz6fpHuVtOID3CVWHLes5nfRy0BwznqGteHjY5uDI2qhNgMC3eOt1KiimwfqHkZPMaYcYw85ww82xQy8m11QfFF/AFscGF6boxkolLLVbm+RMjPusccRauRQfC1vP5jEH/zsfEu5nyXOxWBFB2//O5GJQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKnuzNpe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IS9ZDk2N; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2inIi003575
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sgef4m5C7o0jlvPodxBmq1
	elfsVOSLLM/9RER5yhqgA=; b=OKnuzNpePxc1QXfLOYYXekrXoUq8/D8ZAY7jgc
	ITTJHaL/1pE3GwpglIDFY7i7vXP8eO0Rn6yX5p6wsXaQPCKo6hfAczEHt9WZU4v6
	07kq5MIcF9XbjQnwZlf+5mavVYhWGu0zAnDdKt8ai/TTMHi5qTil9qzQbFhEdqXe
	RZTT8dn0YGFZLovE0zbs1u1G7ZqXvj222R4fw5cvaLSagwP1izsQbiBm57w9Rz3q
	jVqiwBflymLUqDhLR7cpfiOqNc3EoR3qtYsKc6omJ8Dq3Fy8H2SasX4Yk4e3uRgx
	2pL1U2bzVgRq+yD98LqSEdNKi+0SSHfCvvuGKsFekQ8R1hvw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8t1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c8aa3ca3eso62682eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451188; x=1783055988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sgef4m5C7o0jlvPodxBmq1elfsVOSLLM/9RER5yhqgA=;
        b=IS9ZDk2N402x2VYIh+RUrpdpaDEOdUEDgMnWbfQXA0iIxS4x9hsB3SzgAVpwdQaFOZ
         uRlTDeD7QtvBMCjcU4I9VMkpsnMtX41rOg+whTjjyDK0MJXR/qJvFYJQgRWOB5X4ac1q
         Tp6HOtkBNtpiogWpVQ858L+XXMbzunAfT+CkV8gSWJbVqHgxMKBpuwZzNuBBiu7oBowV
         DixVdLOYG88qcw/cgZdBUNeZ5d0qwbStczdX78UNeWj4uKpQzaVkj2zhMZOZtgEPiOb+
         QW9viHaz+eFZ5eb14Q2mHCDKl4xmYUWACeR860VP1fMDaVSoGXW4ftlI7PGB0Si5TVRy
         3n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451188; x=1783055988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sgef4m5C7o0jlvPodxBmq1elfsVOSLLM/9RER5yhqgA=;
        b=NutlsDNzAcOTOa4fIfmsG5Sx7loVYtbLyfdCjYWULTiyUOFyEKeQ/MGhGm9CEyqLZo
         nqCAnUOM1pnoRZVeXn4lmq0T9PrA1h8oofk0QeC6RSo9lWLDyflXYItaD7fjuZwzyn79
         +Ldk+wHF5t2HvyZaJbimwAbMd7f2gUjxDZt8DLn/bAOcttIKtAQBxDxjaIIYZqOOYo8S
         HX4xR71m1dAfFbfOni4bbLB9WbhXQii6a7Ut7G2/p1Lwfb0jRrWn+95BDD5iLJDGmOJS
         W1fAfgbd4FlvRj6ag62YZ1v4gotssYJrSx8oGQqpkj1nw0G0zbKD2N6YW095K0G1evW/
         +Jug==
X-Forwarded-Encrypted: i=1; AHgh+Rqh03GvslHkoee0VOhBQYa/N4T8NzeOOjtKMfvjqixVkRy93itfxGi3V/QHA2aTo8Qcfl58qWyz2J3tDkRT@vger.kernel.org
X-Gm-Message-State: AOJu0YzL9nK5Ji2mXzK9ZkdSsFvIvHC2mIpLau0VpGz+oy1CvJbPF2yB
	ntaDXV5PIy0nO5jJu6HEoR0tKpx8uCp19k8cUDUMChCEOzpouBsJKLA83OoDkEnebuCbB5TeiC5
	KJPxHY8OEnh1EUU+OKxARe0ZnJu+MiwIa6zK8k8U6NApkmFo98PO6oWesTHRlU8ZJUjuv
X-Gm-Gg: AfdE7clfyyM3u1R1bSdNUGMwG6Wi40RipvETz2ZmcZp9iE1lULGws0pgD1Kct31K8At
	X2wtRuR/iTnZ/7RnOz74yP5YtAZe14+Oq15Rg39ui1RZF5DD2F+TQsVHHpIljy/Txq4Oea8bBlT
	M0A5bcRc+QcDunnKCvHWAdwKJATmLspKla1MsPp+JyJ5Ts7o1o1WT4K6GSzFoIC5//plO3baCzJ
	BXNlUBMrZ5zGJUHz+VD/0uZ5YN+lw24f3Jt3ODl7GAsZBXMhl5oX2ofnbiNu+Z0G1arYc9D0far
	b3/VQrU47risWzRDcSbcEokEaIUTGRfmSMLiHsX2hcGfhxy9OieUA0ZB5kepPK7ib8hPAm+iLAT
	GAKjq+DrGUfnFJ1r/4tnz7brR3vtBfUzCQm3GduU2y0wN7Pmjy1zJanL1Mw==
X-Received: by 2002:a05:7300:d517:b0:30c:5197:3a09 with SMTP id 5a478bee46e88-30c84d5fea7mr2311803eec.7.1782451188362;
        Thu, 25 Jun 2026 22:19:48 -0700 (PDT)
X-Received: by 2002:a05:7300:d517:b0:30c:5197:3a09 with SMTP id 5a478bee46e88-30c84d5fea7mr2311782eec.7.1782451187736;
        Thu, 25 Jun 2026 22:19:47 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:47 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v2 00/12] Bluetooth: btusb/btqca/hci_sync: Clean up btusb
 and fix several bugs
Date: Thu, 25 Jun 2026 22:19:45 -0700
Message-Id: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPELPmoC/22MwQrCMBAFf6Xs2ZRklWg9+R9SJEmTdsE2NWmDU
 vLvxp69PJjhMRtEG8hGuFYbBJsokp8K4KECM6ipt4y6woAcJZeITC8PvfaO3sxpjUIaJZxroPz
 nYIveW/e28EBx8eGzp5P42X+VJBhnQrjmKLvLyZ7x5mOsX6t6Gj+OdRloc85fo2HUCKkAAAA=
X-Change-ID: 20260622-bt_bugfix-fbb216ca1ff9
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Tim Jiang <quic_tjiang@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: pzaYeg45dXwMokctECoYVfzH-8rkQ98A
X-Proofpoint-ORIG-GUID: pzaYeg45dXwMokctECoYVfzH-8rkQ98A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX+hVuo0yTQr7H
 ytoy8CHOOyiYsV1V4hjizbdXRW2Etb90Q2l2sTq9X03TJndOPYI8T68+SBxlwFaW2GV0zFPzxZV
 v7cyhfabT5eO3gKTtEf+ltvOsr8PsBjRPrDZV8Ngq9nKAAgPPIg7yQUxQAFALzIUgagjLAUW5Hs
 OeRCbQtAuSTonKxy0B2tT9A7KnGJv9m942H9N/+CCMginNZYN3M/mlUZkST+k69A6FdP5FEqFCk
 lHZ1YDCOz8+X/Vl4hspiFZMojIqu3sTlG4h5azS2r3unu/so1HkqyIBEr2Xg1FybtZGr5NOFzcy
 hYGCn1GU1iggcK318lNWRmo4ssXLZG6Nn1GztzcFmB+ru1pBLdV+kxFxNgQaQkuz4hA21N4CZL5
 J8ApKW5955lXn4dl1nXsILDjwMHzrR4jeeoiVPShSYbUSYSpPKHcUaOie3tKMIhXZYxHnh2a2lE
 C5sCml4b9HTktWGFQlQ==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e0bf5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=39u25PDU96R9StkX-l8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX0G5Qn8mxnW9U
 NsEZrmS/cyO4MAmbmqJJvW+UwO9cnNkkyZfRyH8qKubxGQ0I3qsYRW43Z40rMG186wVeWXAR9ra
 /UPJOa2R3Hu3CtNG6dg3BTqyvtTw6PM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114589-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AB526CA4D5

This series cleans up btusb in preparation for adding a new chip,
QCC2072, and fixes several pre-existing bugs found along the way.

Bug fixes:
- qca_set_bdaddr() waited for HCI_EV_VENDOR, but the controller replies
  with a Command Complete event.
- btusb_set_bdaddr_wcn6855() sent the BD_ADDR without byte-swapping it.
- btusb QCA populated devcoredump fields on devices where devcoredump is
  not enabled.
- BTUSB_IGNORE is a bitmask and must be tested with '&', not '=='.

Cleanups:
- Add __hci_reset_sync() helper and use it in qca_send_reset() and
  btusb_shutdown_qca() to drop open-coded HCI reset boilerplate.
- Simplify hci_reset_sync() and log an error in hci_cc_reset() on a
  non-zero reset status.
- Record the matched usb_device_id in struct btusb_data and move qca_dump
  into a dedicated struct btqca_data.
- Reduce a redundant assignment in btusb_probe().

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Changes in v2:
- Reorder the series so each helper is introduced before its users and
  related changes are grouped together.
- btqca: reword "Fix qca_set_bdaddr()", add the btmon (WCN7850) trace,
  and add Bartosz's Reviewed-by.
- btusb: add the btmon (WCN6855) trace to the BD_ADDR byte-order fix.
- btusb: rename and reword the devcoredump fix.
- hci_sync: simplify __hci_reset_sync() to return __hci_cmd_sync_status()
  directly; rename the patch to "Introduce __hci_reset_sync()".
- hci_sync: "Simplify hci_reset_sync()" now returns the status directly;
  drop the separate "Fix return value of hci_reset_sync()" patch.
- btqca: replace "Fix undetected error HCI status in qca_send_reset()"
  with "Simplify qca_send_reset() by using __hci_reset_sync()" (cleanup,
  not a fix; dropped the Fixes tag).
- btusb: reword "Simplify btusb_shutdown_qca()".
- btusb: rename "Initialize @priv_size at declaration" -> "Reduce a
  redundant assignment in btusb_probe()".
- New patch: "hci_event: Log error for HCI reset status error in
  hci_cc_reset()".
- Drop "Move struct btusb_data and macros into btusb.h"; deferred to a
  follow-up series.
- Link to v1: https://lore.kernel.org/r/20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com

---
Zijun Hu (12):
      Bluetooth: btqca: Fix qca_set_bdaddr() waiting for wrong HCI event
      Bluetooth: btusb: Fix BD_ADDR byte order in btusb_set_bdaddr_wcn6855()
      Bluetooth: btusb: Record matched usb_device_id into btusb_data
      Bluetooth: btusb: QCA: Fix populating devcoredump fields on unenabled devices
      Bluetooth: btusb: QCA: move qca_dump out of struct btusb_data
      Bluetooth: hci_sync: Introduce __hci_reset_sync() for device drivers
      Bluetooth: btqca: Simplify qca_send_reset() by using __hci_reset_sync()
      Bluetooth: btusb: Simplify btusb_shutdown_qca() by using __hci_reset_sync()
      Bluetooth: hci_sync: Simplify hci_reset_sync()
      Bluetooth: hci_event: Log error for HCI reset status error in hci_cc_reset()
      Bluetooth: btusb: Reduce a redundant assignment in btusb_probe()
      Bluetooth: btusb: Use & instead of == to test bitflag BTUSB_IGNORE

 drivers/bluetooth/btqca.c        | 25 ++----------
 drivers/bluetooth/btusb.c        | 86 +++++++++++++++++++++++-----------------
 include/net/bluetooth/hci_sync.h |  1 +
 net/bluetooth/hci_event.c        |  5 ++-
 net/bluetooth/hci_sync.c         | 16 ++++----
 5 files changed, 66 insertions(+), 67 deletions(-)
---
base-commit: cb20f6afc25b2b54c0fec61b45ac0ec9eb875d59
change-id: 20260622-bt_bugfix-fbb216ca1ff9

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>


