Return-Path: <linux-arm-msm+bounces-112288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0/RZKMX7KGrfOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:53:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF94966603B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:53:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Fs9CU++/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CNtQOXjD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112288-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112288-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A23C303F2B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FE434389C;
	Wed, 10 Jun 2026 05:52:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCEF2DC331
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070769; cv=none; b=ksW5XQQWafGWKjQR+TyCsN7RGUbKcTejZK/36hqtl06YOcL3/qTf4nPgeWDGl5SGVzZn1M7L6a/VwvhTNqyCIYZk+OgUs+bW3h2jACUE99YAQxAkMjsMcZR6lbrN1OK77bQVo+1IqUSMcOaP/vNCSgkeCMEPnkrbwQzqMZYbjjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070769; c=relaxed/simple;
	bh=aJxirnbNcHCTGQAzOkuWdnaSgHbxG02cLAcbEiAThwA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O3sdQU2Z602eDKcQ/als0OuORR34pfHQ4eIRe6SAQwLplXrJZ9CDrqc0z5zdJ5vp7q21grztXhkA7ts2bML6i2VPi3fN5TBMz/ih+2J6jKMHGjWP1iSgg7bTfDvKSIDP8EV7woXMNzo9csgu7tx6mfBqOPWyOzmBowGG1nWAMvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fs9CU++/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNtQOXjD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5SmMl688976
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A9D8n7DE9A0Sh0miK31fep
	Ao+JIWEARRrQAJ6KzZWcc=; b=Fs9CU++/ipOEvC3PgD4mHHje7FLmXfx5gUuTZ2
	4sebC06IuXBr7TcwVeqR0LQ+69sCzflvcetSytDtM7+vHzvowhhoSxTDz7JXJcc/
	SndsR1LTiHCv/fdRtprXENU55vLdz6rHvcHt616Njcstc1CMk4nbGPshiVRedEJQ
	/jIh+ATrQmrEy8qcW+vpBW5S/nfKie6F4YI2Ir4YuyxSXjv0TMnsSE4Z8C3vBIQK
	CFb0Q5A4F+8GSHrUPc6gjK0shAlrZb3MRA+2YmG4CzNBVwv0kk68vPzFxS09Cq+Y
	pkh41zWSlqfQGB71WwYpjEPfbgmXIvq/AxbAbdjGpSfnx9Aw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg02ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso102054425ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070765; x=1781675565; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9D8n7DE9A0Sh0miK31fepAo+JIWEARRrQAJ6KzZWcc=;
        b=CNtQOXjDVeKmhWFXG85BwBdLS/siGXtNDUrY0RG4+Ymif2MbAcJJFlD1kvW5DEZwe3
         /wPYkdPSPtt8lENWjqOiuBlanKCzNpOv6USnM55wXrAajXE3G4deDu3cDlrx+tFa/Ugw
         yBBJKvE8qVaDaCyiiEu35+4QxlBWgyfmpOhU6VbMahirBaQROlfgcu4QaS+UTyk4F7Pc
         2WfUR8Ptlux5tqtESBRxsEST9rmuWqInsaS89gTRX8fmxPIrNL+XsSxxDE1CrlmLAuAW
         RHc6ZCWb12QI8SlJFHDhdhL2/IpRvzDlduwY/INKcalwb93yDkRm69MqHpiOiLqd5L69
         JkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070765; x=1781675565;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9D8n7DE9A0Sh0miK31fepAo+JIWEARRrQAJ6KzZWcc=;
        b=O2/DeCmnj5KzVK2GwZD3p0xxxaNzlBPqa9IoudlnGspUc5GFQuuXxy6M9hGjcsrfyS
         6woh5TruyI11qRw4ePP5YolyovQxRPuxhZuY0lhIKu3QqxHcolxiWhZlBqpG1PjqOcqT
         c3LH3hj4E03NckKGE9ct/jBXewfi3/7QcAkq05sIZYyNysdDmZkEooKJ24YzEq56dZZB
         4YxueHLGz8UogkyRUGw2P3430zV0uZjSZmZXLfmgIEpmW0sgb5kHodj/GompdPH3C/mo
         HBycAZyu3Hj6ETRSct5M0EZ+q1821Pd4BCjwXbxA/i3VjtjOm5+APsBkHse4KQExkV6v
         mJzg==
X-Forwarded-Encrypted: i=1; AFNElJ+k4KuMKLxmmlDnvjTo/OeIGuDg/WB4MzEyjci3GKUAllJRH8639L59ZA9Desvu0x8euBjpiOaMnJ9yMr/v@vger.kernel.org
X-Gm-Message-State: AOJu0YyanMolTilbXh/p7xnstvJNu9Inc1u1SibvKHENYAlFyl6Pwx9L
	qR5FiqjIgft2IPqZbNiH+vZG5pA+l95hLFvHj3uHIkm1j4kZabP53Fz6xWJSSVeBp7uO8e0kQpc
	SXIcCFvdXEtLCDQ84ELgo5XPG5RoqDKwhui86q+TEwmz64v3pMD76gujXcT7xJGqJGna+
X-Gm-Gg: Acq92OENBf2N5eYzkiEKpR/C8jsCWvujIn0k093UvD7YeibmFV1DCRsPcHzKnbKjfC6
	55MgRZp8FSvZ/W2V/LAF/HIfGeGQKukEF7Ev9CZ4d+WyIbzus711I3Q+GyDJ36bIjXOUpxX3iVu
	rbTFXLBa31NfCBLL/zbVz7eryx2uGlpJAO2MLvfH9fxNWkeqPFtahsxYuX+pVLXZxioEUTQFhvs
	ID0l/rJBI2a90I217vcEf30EbAGVKYG1c5Sx/5ts0TxGCue3rKJVrFk4ubvjlwIPUsOuM+dN2nM
	yJh0xshVuVKzERkjEHJ/QC/+r5AlD1Eweu9YfGZoW8cgE9Ya0NRn6rgH+BwhBNRHgut5p0mZaiq
	ps1fEqITwSjRGeo0k45JEzSygbuBamKdREb/+NqaLSIqAQDeIJUI8frPDdw==
X-Received: by 2002:a17:902:cccd:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1e80e41ebmr256115155ad.3.1781070765513;
        Tue, 09 Jun 2026 22:52:45 -0700 (PDT)
X-Received: by 2002:a17:902:cccd:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1e80e41ebmr256114835ad.3.1781070765005;
        Tue, 09 Jun 2026 22:52:45 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:44 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v3 0/3] bus: mhi: Add loopback driver
Date: Wed, 10 Jun 2026 11:22:24 +0530
Message-Id: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJn7KGoC/32PywrCMBBFf0WyNiWvpqkr/0NEYjKxQWu00aKU/
 rtpRUFa3AzcgXPmTociNB4iWi061EDrow/nFPhygUylzwfA3qaMGGE5KQnHpxAue22Ou7ry2AL
 kuXPECslQQi4NOP8YdZttypWPt9A8R3tLh+1HJH5FLcUES2GNUUI5yvN1iDG73vXJhLrO0hj0b
 5ayGdZIKFUiQeviD8v4DKskVY5TJ4TWU3b4o2Xf7pROurPkKFihubNlOi9mHH3fvwAqjxfAawE
 AAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=4135;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=aJxirnbNcHCTGQAzOkuWdnaSgHbxG02cLAcbEiAThwA=;
 b=wlgCpWlNqvmyelir7a8kKrh2sM1qoXr0uX07minwR5JAzWg1oWZDpPii+WVb7YRLQSumWODDz
 eJwqxeE768IDSmfuOIdVlpcdAkQoeX4ik+NRNBzNoso6M7+c20F2FGK
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: sdhNlMo0JHR9_QfgIw-9V6DZ6HEJilGY
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a28fbae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bOyLq1Ju37NIHqrd0P8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX/0gTYUyXq/T8
 8INymKa6xXBp4vvWJ/wmAPfrOQnbj/uJ6E9jshgjIEYaQS0KTKAZsJBFIYiw0EO9kU11gWUVprO
 N/2DUPb6uoGfrzY/YVgcdJ6WEduLlCfK5J9/TCkWfCOyBkm0IC6RDfJcSXKAWwf/4ltUJxSbRiy
 FywKFqhSGzy8SL/LLt5R1wpgFeSCi153DilvJd+Ykv9ew55fLhpY85Hbam1CtXoTj3qgqnNEIwq
 oF8isD7GKhE1XVsL+W6JI8mwh1dXCEVtRTnVgEMc/GIwGvrhyQJuysbhqIJvlvBXD8s3ToOGzt7
 W38BR7Bhg9GAJTbNe1I0M0pU6+vvyJgt06gQukom+7C5lZWfyEKuHD8ki1+oeakjAOKF7ndbJWb
 jRo33TUVsjAj/AgMiFSLFAfyGE7A26N8G1YsY/WaDl92/KBwC+BXKlJ65Q81+S4/Bp7vVnKVyLz
 ZmhLbpAuVtSme7e9g6g==
X-Proofpoint-ORIG-GUID: sdhNlMo0JHR9_QfgIw-9V6DZ6HEJilGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112288-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF94966603B

The MHI specification defines a LOOPBACK channel that is already
implemented by MHI-based devices (modems, WLAN) deployed in the field.
The endpoint firmware echoes back whatever the host sends on this channel.
Without a host-side driver, there is no way to exercise this channel to
validate MHI data path integrity between host and endpoint.

This series adds drivers to exercise the LOOPBACK channel from both the
host and endpoint sides. The host driver (patch 1) binds to the LOOPBACK
channel and provides a sysfs interface for configuring transfer parameters,
triggering a test, and reading the result. The sysfs interface is stable
ABI because the wire protocol is fixed by the endpoint firmware already
deployed in the field and cannot be changed.

The endpoint driver (patch 3) echoes received data back to the host using
a workqueue for asynchronous processing. Patch 2 introduces the
mhi_ep_queue_buf() API needed by the endpoint driver for raw buffer
queuing without an skb dependency.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v3:
- Move ep driver to drivers/bus/mhi/ep/clients/loopback.c (Mani)
- Move host driver to drivers/bus/mhi/host/clients/loopback.c; keep
  module name mhi_loopback (Bjorn, Mani)
- Add ABI documentation in Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  (Bjorn, Mani)
- Rename sysfs attribute 'size' to 'tre_size'; add 'max_tre_size' attribute
- Update Kconfig title to 'MHI LOOPBACK client driver' and describe that
  the driver binds to the MHI LOOPBACK channel defined in the MHI spec
  (Mani).
- Fix memory leak in ep loopback DL transfer error path.
- Rename mhi_ep_skb_completion() to mhi_ep_buf_completion().
- Document buffer ownership semantics in mhi_ep_queue_buf() kernel-doc
- Fix use-after-free in host loopback
- Fix completion race: arm completion before queuing recv TREs
- Fix teardown race: synchronize mhi_loopback_remove() with start_store()
  via lb_mutex
- Fix u32 multiplication overflow in total_size: use size_mul()
- Replace kmalloc+memcpy with kmemdup in ep loopback UL callback
- Update mhi_ep_queue_buf() kernel-doc: note per-TRE callback behavior
  when buffer length spans multiple host DL TREs
- Move mhi_prepare_for_transfer()/mhi_unprepare_from_transfer() into
  start_store() to avoid holding the channel open when idle
- Link to v2: https://lore.kernel.org/r/20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com

Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 ++
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 122 ++++++++
 drivers/bus/mhi/ep/main.c                          |  27 +-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 316 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  15 +
 14 files changed, 566 insertions(+), 8 deletions(-)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


