Return-Path: <linux-arm-msm+bounces-112620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0JSVBVROKmoHmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:57:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B867366ED89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:57:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="g+Es/8wz";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eZ26LFwm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112620-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112620-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 319DD3025A6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938F23446BE;
	Thu, 11 Jun 2026 05:57:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B23403E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:56:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157424; cv=none; b=l1n0VZ5NUisLgNKpGW0XUMXSxTSkIVs2SdG6E/lbadVjycotv8OIpu5SHt+rNh1vcTWg/sduSdEfac0VcY7Yq6mErEqLCdD+7Jdv7xABWEaxrK+0zylBCJJ+AmbPDtYmjlE/xtZHOgmoItULbDn+BCFdIGSbzwchDjiI5mo8+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157424; c=relaxed/simple;
	bh=MIICS8MgGCnaFRZltms4lwpq9kbdEA6LlRyeos8nPVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sd0JweukfcGuSpy1773D6sLHUBlk6N5M7Gmtgefu2Q8PPUkvZApITTSqsNz5EOLkBPxruz4Cv4bpaB1mCZry7tPNmweSXAhYGfL2RRy5yWLyjlUzt/5ENTq4sPP0ncNj/prVVe1pBlaiUtA2PTQho9ntoPUyVeXfqYpEvwBFT1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+Es/8wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZ26LFwm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GOTi3712016
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vMk4X9k6dxX472CdPnBsBE
	+Qq8eJyf7YC+1FSTdao0Y=; b=g+Es/8wzzUaxwCbe6z1qJZH4STlbeJHmhGMoOF
	xiSDAkBaBPLEyzqIPqEA4Rl4vXFycVQky1pM/H7h48JVlZUOQfn1vKrLkY73Bipi
	oTGhWj5FpSrS/Zkn9chiLgdLLmnydRMLISGl+H1SAN0OaGwT+sdFQ4cEFx17bMIs
	+8Fw6ewMjZjN1TbTlOrq3iASnSflAxrvDk0mdKleTsYvHRJOMIcVGttS14bM2CHx
	Fr+maGbh4RJosbNKsFbvd+ZeJub2yeDFiQLD/HkHgNlnoSWqJxtY+F9W14QftCDg
	zR9JvTWjx5Brio3IwJEukmf1iVlYFceTw1uPBtarK5fKyPzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9up9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:56:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8584e80bfcso3345420a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781157417; x=1781762217; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMk4X9k6dxX472CdPnBsBE+Qq8eJyf7YC+1FSTdao0Y=;
        b=eZ26LFwmt2Kgd6JrkL0/2advmoMb4YoVqyhjiNW+vpQj9l5TyiyX/MgukHwbIyRFI1
         ZCzUaiPQjbemrKuXYy5piJqkeUKQ15XqKfwDTHxUL7RQ6gkKR1KqpgdtNIZl8cBlIMjD
         0h9bsqpU8q2hD2USLpXrbiPYeG0AUOnxNm89KkwuYqynKhr4DMb/tzRaWWU+YRe0O1fT
         O8WrT5fXjDeSPMSb3K0RAkQhGHBDUlWM/E2wh07ux6RtWlPcw3jg3q+VtJY2MzR2TFc4
         lCy9c1cajsys+wtFZEG9NTK/UGzv1t4NyOZzocQD6VwmVzTXGxaThFxYNlW0rnqSARTv
         lu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781157417; x=1781762217;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMk4X9k6dxX472CdPnBsBE+Qq8eJyf7YC+1FSTdao0Y=;
        b=gVsFy5OTvmvr+nVuN/fuMWJ97L1Z6PbaEn3lk2UJuib7HrePxfAi02mom+3S1MLMdu
         Ffa6/xN15izEvxh9kkhvOCmIVNX67QxX2cHmpOzSufp/oaaDYF3KVLneWjp3YBLFpx5d
         X/5Oh2OrBCgr3P3qRUkLJZPq0pJYgnhn+kS8KnHIk8USAGrTiaJhl6zcpKtXV4Ys6Lpx
         +0z/nDBb1hduXlr821i3gahhAc37di67WHgZZiB8+wDUXjC16gCI1v56jzCCthE4kBSw
         4QyJ8EYJ32PXeHTowfLAgHnlLM6531Wcj02MVzq26Hchu6VeoObFt7NaW2a4tGTumdhW
         LLUQ==
X-Gm-Message-State: AOJu0Yy3ZyksE46/VGdsJSr2Uf9zUNiFab/7tCS09oIdDuT7zaGRJ+Wn
	urKxzD66sxahddYfbUl017bpKh0KJ4pXqvsan693/mEH+0+rjLW/MA1NXfz3slc4a0ykb3O/05V
	i9SNoJMQ5U39In5vjAq86xBwN2sDmCECnZKA1aTtKF3/kxs3VRUIPv6QONvpQD55pJkgX
X-Gm-Gg: Acq92OH5carXL0cCP7aO3m4Z1XFeOXvARhqtbqHTZNOO8N5dwZDqOKVxSaVyFTF6hBA
	P5GqiQaRP0Q6o7lUZlrUHc0EZzk3B8ro8d76Vy2SMuzQyFAUwh9yDWxkWXtO88iBx9282F8uRDn
	R4+/XJLaCS9OFUZK0XuT/VeXNgWvGE5E9mz6SOTaZ9zL0TrBWrHAnVCm9Fds/PeGT+zRMr0PqWx
	VfdfW6HAac3iaoWZca9DMmo1uBJACZOGR3JBE6sI09vNMLYrRh54x2iYFI6JcSBDIpMODVRybPK
	79ydp8QlbY6agLgDFHJYv+//rWMJaCxXIjXKOleSIlHW4o/A179xRHePgQF2zVNCAxPWyccBhkJ
	nM6yQjml6J8DPtKM7Vp6mcL/5Mw6m+Oe5ONGDOP+OLzKMRmPcWE5ql38qGMabq5TJoi7J
X-Received: by 2002:a05:6a00:1da1:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-84336bc5a32mr1341562b3a.26.1781157416904;
        Wed, 10 Jun 2026 22:56:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da1:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-84336bc5a32mr1341535b3a.26.1781157416342;
        Wed, 10 Jun 2026 22:56:56 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c94absm678885b3a.28.2026.06.10.22.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:56:55 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:26:34 +0530
Subject: [PATCH] soc: qcom: smsm: Increase SMSM_DEFAULT_NUM_HOSTS to 5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-qcom-smsm-default-num-hosts-v1-1-423b8a25945a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABFOKmoC/42NQQ6CMBBFr0Jm7RCmIERX3sOwqGWQJpRKhxIN4
 e5WTuDmJ+8n//0NhINlgWu2QeDVivVTAjplYAY9PRltlxhUoerirBqcjXcoThx23Os4LjhFh4O
 XRdBUDfUXU5VEGpLhFbi378N+bxMPVhYfPsfZSr/2P+9KSFgQq4cxVJZc37xIPkc9ppHLU0C77
 /sXtlFbys0AAAA=
X-Change-ID: 20260527-qcom-smsm-default-num-hosts-c471f9c4311a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781157413; l=1726;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=MIICS8MgGCnaFRZltms4lwpq9kbdEA6LlRyeos8nPVQ=;
 b=1qB/fra3aeCMQAhwdOuUH6UDzV1AHdWJ2Ef+fAC/kSig7uY7RcAym4gxk7vMN/2kAeoLK7YCd
 IDcCapvqT79D9BuLod2dzhJexsrKG8Oe4XB3UDlvPsMSSmWI8Ut+mIW
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA1NSBTYWx0ZWRfX+CWrQth6m7zu
 IkzPAoc7IYy1EtPMbtCkItCjkakAO6OxCZemKa0WHpp88j+byVXkW7YqQx07MwHVMr9+f9kFk35
 rI9joiO6zfnnWJt8Is9nKq6mOiCGkTE=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a4e2a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=b-3K8DZa8vNst3CpTYsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA1NSBTYWx0ZWRfX27x53QjfZ+c9
 Q2Y8vGV0+OlkPBIgcTS0scoMOg/hFY1PrPHofY7TQDIJ/QpNYDlgNcYWh0Xlva6I+2IR/X+yFw0
 IATc1bRcA3O+SYPcx/Q46xONOGr8lnAs+KZ7iNQkcbY4slq0QlMRUvG+Al85Dy8HGYbPgS0y566
 KayUufwKE/lRhMNr5bwsQGnbhvXMBK0G4jnL0IzBgrToCuF6gYU0IxH/HS30NjB5l8hg5XrwFUM
 ETFRkYHl4BRHuRPjtDr/Tk+dS7X/W/AeyhWu55Ds1fJ3PKX5EBH2lkrCQB42k5MNr0q54my1OWJ
 ZF/wN+NFEzIxh+OEaxDTZeIg+53ZAEEmxF+ldC/VrmURRaG8TEwz1VfPs/qO1NPemRe6+1Bgmxj
 MMGllF7jilxrHgPF4Yxt8KWA2cieljfwD9i2XKC6XzGMVlbdO4o4BbE4PNjTAOhoaaRkGUyqVrM
 nWvZ56J31g7fFnSilFw==
X-Proofpoint-GUID: GWiHhqWzYFj3v4yhjTPWhHxBUeCElN0s
X-Proofpoint-ORIG-GUID: GWiHhqWzYFj3v4yhjTPWhHxBUeCElN0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112620-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B867366ED89

SMEM_SMSM_SIZE_INFO (id 419) is not populated by the boot firmware on
Qualcomm Shikra SoC. The SMSM driver falls back to
SMSM_DEFAULT_NUM_HOSTS when this segment is absent, which causes
SMEM_SMSM_CPU_INTR_MASK (id 333) to be allocated with the wrong size.

SMEM_SMSM_CPU_INTR_MASK is sized as SMSM_DEFAULT_NUM_ENTRIES *
SMSM_DEFAULT_NUM_HOSTS * sizeof(u32). With SMSM_DEFAULT_NUM_ENTRIES
fixed at 8, the current SMSM_DEFAULT_NUM_HOSTS of 3 allocates 96
bytes. Qualcomm Shikra SoC modem firmware expects 160 bytes,
requiring SMSM_DEFAULT_NUM_HOSTS to be 5. The size mismatch causes
the modem to crash on boot with "smsm.c: Bad pointer from smem_alloc".

Increase SMSM_DEFAULT_NUM_HOSTS to 5 to match the modem firmware
expectation and prevent the boot crash.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/soc/qcom/smsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 021e9d1f61dc5200514c5a239d52be97f7e82825..7d1823ab4198bbfa01cd1cf9c33999b32e2490a3 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -54,7 +54,7 @@
  * Default sizes, in case SMEM_SMSM_SIZE_INFO is not found.
  */
 #define SMSM_DEFAULT_NUM_ENTRIES	8
-#define SMSM_DEFAULT_NUM_HOSTS		3
+#define SMSM_DEFAULT_NUM_HOSTS		5
 
 struct smsm_entry;
 struct smsm_host;

---
base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
change-id: 20260527-qcom-smsm-default-num-hosts-c471f9c4311a

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


