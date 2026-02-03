Return-Path: <linux-arm-msm+bounces-91610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B7wELKcgWlwHwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:58:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E0D5815
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F1BB301FE0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF284372B49;
	Tue,  3 Feb 2026 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="od2gjrHJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7FKDPu2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650338F93F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101717; cv=none; b=sZbHlzIAMFSku5SgWIOUzYW0mTjN0uf2cIWVIQAXCalPBUqi4E0kYSWuvJVEvJkbV24t+mAVuWZuqBJi3hn0FezBbEusNHQzIT1rRHIribXoVA1TTuyo52YlJp3SivNhoe+CkegnADUAohWQO01rabk3FPHXJf/cSsCgSFPsyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101717; c=relaxed/simple;
	bh=lxSYBQP96mlT5aJJCUIduL+qGCMMryWk8oKPo1JcZnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKbkyhnriV3webwQ7JITfXJON4nyejQv3QsH221Bh0F83FMVR/IAU8vP6hWBpH1fxwUFtWZUE61rlCB2tSOXhW70nIKG6a3mybVM4okLekEugAo7pCVWAqjuybwM3vJQJIWvMuh2jfo4kdJ4/gAzDT98cj6DQDg1NYOrLBUlGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=od2gjrHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7FKDPu2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6133HMlh931271
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOXCSYC2A9VCviyNI8z78wUSXKOiy96tkmU2QjAY1o0=; b=od2gjrHJgR6kcKxx
	UAH99ADuw/DTZoBxDMAbELzqiOmKNlnyIs6s6FpgILXGAT5+rEBNHD1H/1yVj4iy
	P/OYhxOoD81qV0x1dBUUBNk13o//O327VcSAAkeHhewBn07odrqI7IHlphT101TR
	BLNHJolZkhYJjvjbjhRXQtxmEaJ1inxd4EtyjQQFDQhw7grBbsc/oS3x8mGyxuxZ
	GQWxzAdePG97ZOOGmZDK/DRzWv8HSql4nWU9fobLRUqSuTR/2wjHYutKmGQvIuF/
	GaYPVnrbcnGOPJ2224IWBDCA63gGhqlTy4iEDCzGUkFYQSWtEtjUwyUcIuctr3XH
	cghj1A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu0k09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:55:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c61dee98720so3198007a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770101714; x=1770706514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOXCSYC2A9VCviyNI8z78wUSXKOiy96tkmU2QjAY1o0=;
        b=Q7FKDPu2kP250UiImPHXQfAR9pIA4qVyzGHLMvYFYgyJKKF79Nhu9cNgJTcUQiiCTc
         c205Fn2ha9wzFXXxtsR8b2WQthZHFLbr4lvoTL9GiJM4HRuxwiwJC8MHZRTDYQgJBphA
         6dO54g1Wak3lzPMjVz0l3zCzAEw2/aCRpLxTE2+tlYFGvr5gisS0DHg997OmY/N9j1Nt
         Bv+0x5s5ZoNhLiW4P+cDkt45cfqbSgv7yxR29nDWEEKzZTuUrAi55DnERRPNPIkBD0hd
         pVMU9zFaWDQRCryR2UyTJzCX4mUJ2K5iGjCZcsyOc67j3phr/NRVgxKJD7BBKb7riGiZ
         BG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101714; x=1770706514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOXCSYC2A9VCviyNI8z78wUSXKOiy96tkmU2QjAY1o0=;
        b=U76s82U8mAN3zxaIJn3vjdu3AtbNZTBd4pF9AOwyqsT+Y/GQLI9OYGuTPoPiAVZZq5
         YKIwnovJMkf6Mfx8CmPC8nuTEzT7rSMC5f5HitNhrBbotheeUX7sXdNWttYs33v/lDub
         uZSQkaZMuvszgy7fbBgukylS9ueAajHlRQgdOE9W+PzNnOly64JW5YqAtY8ZeKVSibN6
         2TmRUAE277F9kRko3A/vCxWJhisClaB9Q4hoLgV7Gg7Y58FhfGjyQMd83bhgUvG//596
         98e0UqPC0ffTrLMHIVqlv7TSFxMSTyENtJXqMve8C5lBfN8W9DdJZqIfzd6HbXGACNc6
         LTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXLOe+1wwhAhKmXL4hUmY3eBxEznghT6dY7DRz3NihOsnn5jwXlT/sx6wYqj8wNqc6VED66nAdsigQV35lr@vger.kernel.org
X-Gm-Message-State: AOJu0YyF1P+rIS1l2fCqMaLh4ooM4Xp3uVrF7K2N5XCD1/mNf/o5QHZD
	Q2/8wbbujeNEW2LTGmyygWK0q1++z9oqLwIR7goS1rvMgIHUAwVfniPOvvoTw4k2VIF3xQBk3Ay
	VrLJs2b28ytic5UedR8lyYH4yf7DGb6FO432UlNjYCeymUOG/JpzOt0IHXsVdhklSUqdxeHIVap
	i5
X-Gm-Gg: AZuq6aJEMc9rzi4/hD3iJIR8dUDu9h4NPxhMztb7qQ0bX/hKnzJsUcjcuA7Czxcc+E4
	Os7lKakjUmfw7buzqWoNZ5jVR97iQxWgIpgkoRdMVFhPVh324UJqGQpNvZ4Tnkgsh/4seIAdGZs
	pboXllGcBaJOSpFL9W71BdUeIkjF19QbPR4zY93omwIZxyeIbNquXZS625tDEhmSxRq/umH06A0
	aHlEhfzRGp/YklfklB1wZ74COU6nOCcOsy11VrOS3CNAGCqRcibri2iZDtmCjE6L5ZHv10WjsaP
	AfKIesVMUuzOvaOnceuAvZGQ9opcLBi8CU9exmMye3/2JwyTlacF5F1imbn2WiZ9ta5OodpEbQG
	YK6e1sYxfZxWXKbQBngliCfcfCT0H+lMbPWg=
X-Received: by 2002:a05:6a21:600a:b0:366:1a00:2dab with SMTP id adf61e73a8af0-392dffe0dafmr12386009637.3.1770101714459;
        Mon, 02 Feb 2026 22:55:14 -0800 (PST)
X-Received: by 2002:a05:6a21:600a:b0:366:1a00:2dab with SMTP id adf61e73a8af0-392dffe0dafmr12385977637.3.1770101713886;
        Mon, 02 Feb 2026 22:55:13 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b1036e6sm837924a91.11.2026.02.02.22.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:55:13 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 12:25:02 +0530
Subject: [PATCH 2/2] bus: mhi: ep: Add missing state_lock protection for
 mhi_state accesses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-reset_worker_deadlock-v1-2-7ed889b5bf19@oss.qualcomm.com>
References: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
In-Reply-To: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770101702; l=1662;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=lxSYBQP96mlT5aJJCUIduL+qGCMMryWk8oKPo1JcZnI=;
 b=km0yVdXibT9OTRzqgtmO4t4idXp2sR9f1MHa05U7VsODGYuwBe5nZEWtg1FQdPdOKr4c5Qlbz
 vDWa542bh5GDeWZ1whMf3S7Tz1K8peJq6cBeT2I05c8+FhtO8aOXYRG
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MyBTYWx0ZWRfXwsufcJcQiklV
 kIShHAtRvH5+w8h7irK7WdH812dKDBQiSD9n3DBZXA8EgCwebbFP0ql8TG834AR/gZbUxGIdpJv
 RHrhJnxokc+gAg44N0wAMe7812RQ/l+AuR+eyODXFkC8CkKcLVY3Fu4uCe3oOvD5/nf/GNASGsP
 t3pU1l0lT88Uqa89XAFsXaQy2qXmpzRmEfPnIPMYMtyK/WUdG0HNDH8E6PHAibI+5DXa7uTvxK9
 QgxPSryIvpMEkxQ8I8Sd+8gZACdvHZIHrf1TLjgBGzXbJ3/+AYiBXN/ID0noCUeTRn+iquMMCtD
 WLNhpsUhCplYo37cYQkF5TqpLE9UDH9BEmqYWq59n9KmRyqgkFKDbbSi5oSi0kQJuWp06byuQlN
 D68GB94wx9+boKC7dfkkjpdTcla/dEv/4kmY5tqX5k7JSMkokzgvdbwnsRkHpzz1LvMfIMT9Y5f
 DDbKJNRaxAQmeSnpjdA==
X-Proofpoint-ORIG-GUID: N5R_0liwGSYkHbvuxYJtKsoZ7i4vXoAe
X-Proofpoint-GUID: N5R_0liwGSYkHbvuxYJtKsoZ7i4vXoAe
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=69819bd3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0bTHJ2J0XYZ6sYew-2AA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91610-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B8E0D5815
X-Rspamd-Action: no action

The mhi_cntrl->mhi_state field should be protected by state_lock to
ensure atomic state transitions. However, mhi_ep_handle_syserr() and
mhi_ep_power_up() access mhi_state without holding this lock, which can
race with concurrent state transitions and lead to state corruption.

Add proper state_lock protection in both functions around their mhi_state
accesses.

Fixes: fb3a26b7e8af ("bus: mhi: ep: Add support for powering up the MHI endpoint stack")
Fixes: f7d0806bdb1b3 ("bus: mhi: ep: Add support for handling SYS_ERR condition")
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 73597de373ef7e0c428bcbc126d63a9a97f95144..e9d14006453aa8b8999486a1cef17ca43f4cc4e1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1113,7 +1113,9 @@ void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	int ret;
 
+	mutex_lock(&mhi_cntrl->state_lock);
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
+	mutex_unlock(&mhi_cntrl->state_lock);
 	if (ret)
 		return;
 
@@ -1148,7 +1150,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 	for (i = 0; i < mhi_cntrl->event_rings; i++)
 		mhi_ep_ring_init(&mhi_cntrl->mhi_event[i].ring, RING_TYPE_ER, i);
 
+	mutex_lock(&mhi_cntrl->state_lock);
 	mhi_cntrl->mhi_state = MHI_STATE_RESET;
+	mutex_unlock(&mhi_cntrl->state_lock);
 
 	/* Set AMSS EE before signaling ready state */
 	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);

-- 
2.34.1


