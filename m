Return-Path: <linux-arm-msm+bounces-102869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UInNF2tw3GnAQwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:26:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0543E7457
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B88563006F33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 04:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A48313E21;
	Mon, 13 Apr 2026 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIsQ8Jx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8CHYgIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE32335BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 04:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776054376; cv=none; b=MJOMeyGunJnQMphbIH2SrvWjh+GEXam9itXMGd9nuIBBLEMvDUJoWkJOZlxBZu5SANwpGUdWyDqNl+leMeO4vng4Tm0fIxXZaAwYTbdsajOVwzIK91Vrqkhm97ilUcQ+b4oubsEqgr0F+TTnxjtBKeOjYJrSJGGHfgqsxmiT2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776054376; c=relaxed/simple;
	bh=A9rbITyvlDaYUPyMOWrEItSuDhL7mSziu6ToWlM7OjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aXzccZEtL06FYwuT/YNA60zXUXTU2ZyyiSUL9j9tjTrcb64ud3vNar/fNC4bMWM4mEIQbKdvjT3L9wu7tcAUmn16Pin2N8J5Oiox5IzFSjsYcM5tc1VTLnBueMuzBupLxCmeQsqT+6gJO6qrbC2oWksnLswyYvc/R3AuPwQeT4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIsQ8Jx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8CHYgIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CMUE7m136227
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 04:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BYPgcNYNEye8/6e9RFGuSz
	PkneFyhzIzazW61gzLVKI=; b=HIsQ8Jx1X40vMt/o7Xbe5KHpjSEkgk9kyImfTl
	R82XsoEXPbIvsrqFMPSy8JcEtUZDLM/2RbZ+F8KXPOpcB9+1psGxr1oY4abpIlN3
	a8h0Aom3TNl8/mQnnaap8yTlLCsiGVK5xsXLVw2qNlqeZ+GtHktqTljBpMO1eAPt
	l4ZI0egpRh1Sh0TNYaQzsLc6FpsxNmPRS7YKyBYcx/IpjjDNaO0mAH3Ukff+xj7Q
	zPs0OoQqLIiZh3ceBaFGq/Q9NJknBLEAGGt+PJl9B6HejAqTBAdZRC3l7bXjSoa/
	w8r9uw0LL/b3eRyAXqDGVvDreQ2Kcjb2vICZsVaCn2dL/w5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkumm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 04:26:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e6ee9444so11142745ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776054372; x=1776659172; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BYPgcNYNEye8/6e9RFGuSzPkneFyhzIzazW61gzLVKI=;
        b=Y8CHYgICZt2XjVO9Kgln2zgmRNYJ1b/UzEjvYJUc79itm91MlPwIRA4GypMUJtTxqD
         aWPSr9FtkngR6hiuLzpApOOWEYG/EUo9x2i4bA+au1TkRPFJXRavGEXDBg7uyYDZXV7B
         njpl2QQhgKat7eekW0W2sutbIceZ4knrGfWZ2WN0T2I27oi5LCBaiyNNCI1IWP7+lyz/
         00aQUBc46hBXEHHtkkTUQMB/NXLP98dRIKxave1pG1gcUmqIPLmeayO7UAL/3YADQESF
         6AjwsCs7lS5zKHq7AzpbOmABpjfXP4VgDMJIbSf0ZuS5FCUM10Pgk/t5PBViePDqqzW7
         nCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776054372; x=1776659172;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYPgcNYNEye8/6e9RFGuSzPkneFyhzIzazW61gzLVKI=;
        b=ANxvpDgy5tZB+Cu4eK5vUlfte6MnOnF6jpLAqynpViD4WxYcoD5moWxkawG5qBaGoa
         F9s69i7sSvQ8JrKCNKCwC/2CNonx2vHkQLW1E31on0CveMAdAfeTvq3aAqv6uDZ0tyFN
         hDrgNLBbRJTYEfADnHzdgvZQQUtqL8znkixteGO2IwIPdFh/fBqMwQQ2lGvv2/sbiQZQ
         nLyGdAofzdZZiaUjcCXxfjyNnu7xZK8qwPqT45EAob6g5z0EfUdui9jBsW8hvqtyJBjb
         +XR7tAjRg1+0hiImNPE+n4e3MvkiTmE3b3eY3u1XeXidcTNTbPa0hiOdXcYmaqG4x9vg
         iPlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gqgtKgQMyBQAflOIndWD5ENDTiFyrTgnMkd62ivHks8PpQ2d+uirXtzVKQm+po0znCwXRmB69OfoUGh5u@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0zoyykZMvLy0CkDuXkF+ikMP6C81QgEC+3tw9bsYZTDY9H56
	/Rfwq/WXhfJPUgzVCrcwPfSzlh2D+7M8EhXu6Pf8DkJCFlyuc3wmW+8cX/0zcI5JAy7U1qRVJ3M
	X/Fg2U+3GrmdFrKh/5chcDsEHxie0WketviIbnBWr5T8XD5GnJhkeBOji1dgCJ2lzUhgB
X-Gm-Gg: AeBDievJSiJfxs3Z3TkkhLJOtzTFAK8/4cgThHDpcq72DwOMGzJUdna1qxyuBoubgVk
	c76hN0TlSKvvtCxdj35gWGKY1Z2HcexHWF3F0Ajh0a/+yPtwwBKLRFFEV/qc3wlXCoC8VAiHyyY
	reBrBsW8eBU2VpVFoSB8/wIcp9W/fmfH3ckOD1MNuXzCV61splpdbm4ObAGmdmZIigtTyGUvE/W
	v5ET5cNB5mWnkFck7Qyu3fkuTb1tZgf7BJj0Cl9COxO/vQzEg3GZGXJVARX+6aKqSnka1ZBFOH+
	V+7DIUuvV9UtfLkLVEhEhUUzq2CO3Z1+8C3hC1U++TbfInl1ZKmeYNIx/MQdgdADfuSyhcsuUzs
	S8BukTgFWn/xlCf9nqz62UInu5GB+nG/Mi7iF66ysvMsQrA==
X-Received: by 2002:a17:902:e78c:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b464cfeae9mr4197825ad.2.1776054372398;
        Sun, 12 Apr 2026 21:26:12 -0700 (PDT)
X-Received: by 2002:a17:902:e78c:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b464cfeae9mr4197515ad.2.1776054371925;
        Sun, 12 Apr 2026 21:26:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f25aa2sm101478945ad.55.2026.04.12.21.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 21:26:11 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 09:56:02 +0530
Subject: [PATCH] mailmap: update email address for Taniya Das
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-mailmap_update-v1-1-5758fd5b0647@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFlw3GkC/x3MQQqAIBBA0avIrBNMRKKrRIToWANZohWBePek5
 Vv8XyBjIswwsgIJH8p0Hg19x8Bu5liRk2sGKaQWqhc8GNqDicsdnbmQe2UV6kF4VA5aFBN6ev/
 hNNf6AfHfMCBgAAAA
X-Change-ID: 20260410-mailmap_update-f4c4e680fe4d
To: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dc7065 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=7YfXLusrAAAA:8 a=yC-0_ovQAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=DISFzqtZAAAA:8 a=QX4gbG5DAAAA:8 a=qWw8SBFPiImlMfLxzzcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=SLz71HocmBbuEhFRYD3r:22 a=aug85vrO5LANNmmtkfAW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAzOCBTYWx0ZWRfX/ava8a5EcvZi
 JUDN22Zv2D6lrJJDjY9YYtAscTePR7IkHJIMgLYaKBnuD8CBdi448W1BdgLGOHcePg0GdJ4Y0Ni
 L1PsLFh+RC6ArLmFoxWhUWe5UWpmF/5sAxZ2enSRKRin19RaCL6NA1rbRGND2DAPemoeAdd2RdE
 e0ogohHCNfXI0JnHSKTXyCev0G6b49Ae+40LfeyS7EIQksbligv08OT/X4YnKHzYPgmJ56/Lfm3
 ta6XhMWwooyXFq46dNYi5AnX15hZv8XnBP638luVl5YUo3fIzW4dKKD147SeW57BDyqG/LndYvL
 wxkvmKbwkUaWo5TF9CR8wSSv9a4d+He3VmvIDoWRTtx6oJb3wgsv5Q42YggEtD0yjCjkjhvrr2c
 ZH+AlOC+8UU3KAbrEEUcgmXvdq/XGOhzdhM7nCDiMEewyTtKrLr5eqKt55X4i8c/NDwUW0lVJZ0
 ol/7Gpf89bBmPdoubVw==
X-Proofpoint-ORIG-GUID: eTTMRtkN8SzGw7jKPMgcIeLPVptgM0XR
X-Proofpoint-GUID: eTTMRtkN8SzGw7jKPMgcIeLPVptgM0XR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102869-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA0543E7457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the new OSS Qualcomm email address as the canonical address
and retain the old quicinc.com and codeaurora.org addresses as
historical aliases.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .mailmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a7202837c1f0f4afa52c2a057fb25530f5b30ac6..c53502b3f979bbbd3252fb5a60c8c9d9428b04d7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -830,7 +830,7 @@ Szymon Wilczek <swilczek.lx@gmail.com> <szymonwilczek@gmx.com>
 Takashi YOSHII <takashi.yoshii.zj@renesas.com>
 Tamir Duberstein <tamird@kernel.org> <tamird@gmail.com>
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
-Taniya Das <quic_tdas@quicinc.com> <tdas@codeaurora.org>
+Taniya Das <taniya.das@oss.qualcomm.com> <quic_tdas@quicinc.com> <tdas@codeaurora.org>
 Tanzir Hasan <tanzhasanwork@gmail.com> <tanzirh@google.com>
 Tejun Heo <htejun@gmail.com>
 Tomeu Vizoso <tomeu@tomeuvizoso.net> <tomeu.vizoso@collabora.com>

---
base-commit: 3fa7d958829eb9bc3b469ed07f11de3d2804ef71
change-id: 20260410-mailmap_update-f4c4e680fe4d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


