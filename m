Return-Path: <linux-arm-msm+bounces-100226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOtfO/xIxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:08:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9473417B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97B27306F97D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6213D3D9DA0;
	Fri, 27 Mar 2026 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7fv3hmq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCzGRrhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D3374E71
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602239; cv=none; b=OP6VB/lg8pQs5CLXtyDGXGORqXcp4CLS4PgxDPbT1cReFVKbZaoBxNMgZzWggxztPMHSJt9lpgU57vyaUzWpV4bbtdgiBGUzGW1zwZaqPNLyarbVKukptk6ne2qSN3mXADZVuNkq1Am1UpVt45C5W91o1z0KkRoOxShYhZcuFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602239; c=relaxed/simple;
	bh=CFvW1iMS+3LZVjhX/2U0aGD9Za4P/zB7ODiMTRsW8fI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tPdc+Eu4cLzbTjtkAUdi4G1N1miEH1klks12nEjOvk6x0FeZFkuVZe53tp5SdFjH5vziLRHyXCfCt7mfnBzMH7gm51Vf/I7D6n1hR0N72b+iAZFVI7fz3Ebegf2mXZAhBShk1KxkYTdt7a3SwlJ+YQZ8ZddMZWtAqnvMwoA2qlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7fv3hmq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCzGRrhx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vnRI3713693
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KOtKHyg2g3fjmBMNy3iI2b/T7G7uP9S3ww3
	w7qTvDbw=; b=p7fv3hmqMEyjoP6Y4G6YV60U/0VxQP8hJKPvyUWnHTOA/m8F93I
	SW8ePVRJ69ODcy6Kco9dsKAg9tgFV09hmXbKy1rZ9GzDDQygRo+YvoB6w5ranN6k
	kfZRxVxo2vp81tRLi0ItI2mDzA//1rxaZXyqHBONvjNBwu5cTGVFF8zfEAuOmtEM
	CLvYUbwhr4hZt1YA1HfgRN3z48xXavm5f1hwvgRiM4ERAfQExWjPkYBEXKwQFobH
	CsX0dUI7tubKOmSSqzH2DZULswyqiJLM8KxOl6Z9LO1SXdUL0h4zJlnGsQf7NH93
	HTYOWJdvrSuAhyfho1Tg/pt40lzTJzuIH4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapsc91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:03:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0998a441so6061295a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774602236; x=1775207036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KOtKHyg2g3fjmBMNy3iI2b/T7G7uP9S3ww3w7qTvDbw=;
        b=PCzGRrhxXj895AwzI86t8QxKyvOzR8BsSJXyNKBQy5Ybrb+zGpgOz0sowGgeLNltrn
         Zfjiz2QrA6zNgVAzwvEoxFVANREtcAtY2ss6GDv8Y52QysH2TAViRYCAXETpNKIPwGlS
         sD8x2lsEo0+6cOjG+JhGWiEG9mG5PsOMmw7zBMlyGOGN9DRe7V58TdfS1ZzsdswVYOjk
         cYuQvTqPbL9gPd6hMRUySCCI+18W6eakRjA5nH0kauFSeSxfnC7cTooZqmPV9RPSihpR
         vOEXSSC7usWI9phdcmS/LdaflkaqM/7T9LQJuLsmz4sLca/MID/HdR6p/xBD/h3nqlOq
         5CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602236; x=1775207036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOtKHyg2g3fjmBMNy3iI2b/T7G7uP9S3ww3w7qTvDbw=;
        b=H4SvNSjplJzH6QuqQX4IXZaedJAzTg5BJ/HfQE4iR3FTelXTaxLNKGSjRNqIVcTY96
         8/0wpEfIO+u0gTtPeV6PDTsj6Ag1NJJ5Ag2CfouR7vi1iIXw2RIzr/EzSal8AoBg13G6
         o/V8dMwz5ZDMGe9ag2R3we3c+bJTnq2A+qBjRac4m3wkHWLmJZ6YIQwi6pdJgESKQq8O
         KAOodbaxanUlV2qVG64lNBbB1ID/0hnoVLyhy+nn747cOu7DynFRzV5QUlqeOMBSEkYQ
         X0GLHMKlWT92jE+Vh/R6SrZR+zhrmh2JyMThjM4Q0UgVGx2Cvxo/UUB7bgY5vLmitfNp
         /L6A==
X-Gm-Message-State: AOJu0YyCm889L1E/VtKBfdE2xht7mNXu9k/7R3kAYKbJ243nU1TlknX3
	UmNsfYTpgmo7najCF6A4ii7UuHE+Xb2W1FFRHD05hnZuz2xtcIBM6HaQIeYorqoDwdgC+WZgDlU
	bXIz8muBPQQ40OyeGzODsheE9/xPDe19FyYVP8EarmS/XybdacZbTuu4wVACgi/1I5qGu
X-Gm-Gg: ATEYQzw/KHpv5asYd7GEIV4YIyuUHWA5Ox9IDIuNxyDJqGnKOKbY3CvAoWNzO/ErBSX
	pkUbZI/6R0dGklOjonC12bcusVOS+bXP1E/eYYIWg3180or4DpZ4uSLoamCqzo5mSJvCy7vMM8q
	T8oHHtVrsZaQkVD0iJHNshwbBZt/1J1nW1Oqn1UJju3OQviKsgWuJiViGtVFofx+cSP1BsPMMZ5
	EUxi9ITWGSkdLtrhFFd5uCLJEyDBmIZocWUI51ziz0BO711xEiqGYtwJhdsyUHcGhgJ6UxTH3O4
	uDqHhF493qwDlaSCahm/fzvI0zYk0lNbHb8uyBTNOZ2hrrl7fQBct9Rs4AuGrITlykGTt1+wq7i
	oUeRWSIpSuUJl8PjXdtkp4lHhTauVNG+MjWr+tFGAYgBmcmMJk8HRJA==
X-Received: by 2002:a17:90b:4acb:b0:35b:e5b4:b4c5 with SMTP id 98e67ed59e1d1-35c300f4ff7mr1677955a91.25.1774602235711;
        Fri, 27 Mar 2026 02:03:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4acb:b0:35b:e5b4:b4c5 with SMTP id 98e67ed59e1d1-35c300f4ff7mr1677903a91.25.1774602235034;
        Fri, 27 Mar 2026 02:03:55 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81744sm4230006a91.5.2026.03.27.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:03:54 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 0/2] Add post change sequence for link start notify
Date: Fri, 27 Mar 2026 14:33:44 +0530
Message-Id: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c647fc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rbNoiXgGD7Sd92Kb1yEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NiBTYWx0ZWRfX5TT9U52I+iLu
 4Y7mOofUay8a/FW1s1tEU5JeYrzYx7PNSGa29CCnlCOVICIWcD2YyRDt61NwzIvQbRvFAadUCw9
 ToZDBacax3IGwzj/Ezt7ePaq3C6lQb/+y+Vqe94XBO8R3PukRNeMKs1i7AMM5zxWnXSLETjjVmg
 MvDnR1lmIZA8URahhbEqwyC5Gwv8ey9lA4/qLZBvRQZ4+eYrqp2Bhi2OhOV43d9qQesZgnZ3hVu
 c4cEwvAQyWYYHTuAzs1cDbepHLqjqBaQpqd8eyiIBWGvax2c8wGBDP30rGfxxvjovyy/GQtFF6l
 rHjd1eXMFmHXLTVq1hv96QIFz66P4hxgJ8M6CpeaFsq1mvj0vfBXLIx1HuwOL/mPeC2EIzSEd/h
 l7QYpPMTBn4hCW/szKQOHeKhffkhl7+gTz7GvjtzFWTqPxZRSt+VmzXW1G2cNenuAsloFfCQPsL
 28ODJAC4/hJ9FTKZajQ==
X-Proofpoint-GUID: hoi1RZ6Wxzx88BSsSlHTUOjh6PKzsx6V
X-Proofpoint-ORIG-GUID: hoi1RZ6Wxzx88BSsSlHTUOjh6PKzsx6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100226-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E9473417B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This patch series introduces two updates to the UFS subsystem aimed at
improving link stability and power efficiency on platforms using the
Qualcomm UFS host controller.

During link startup, the number of connected TX/RX lanes discovered may be
fewer than the lanes specified in the device tree. The current UFS core
driver configures all DT-defined lanes unconditionally, which can lead to
mismatches during power mode changes. Patch 1/2 ensures to fail on this.

Additionally, certain Qualcomm platforms support Auto Hibern8 (AH8), where
the UFS controller autonomously de-asserts clk_req signals to the GCC
during Hibern8 state. Enabling this mechanism allows the clock controller
to gate unused clocks, providing meaningful power savings. Patch 2/2 adds
support for enabling this feature as recommended by the Hardware
Programming Guidelines.

---
changes from V1
1) Addressed Shawn Lin's comments to fix comment to connected lanes.
2) Addressed Bart's comments to remove warning and trigger failure 
   incase of lane mismatch.
---

Palash Kambar (2):
  ufs: core: Configure only active lanes during link
  ufs: ufs-qcom: Enable Auto Hibern8 clock request support

 drivers/ufs/core/ufshcd.c   | 39 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 11 +++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 3 files changed, 61 insertions(+)

-- 
2.34.1


