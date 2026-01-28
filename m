Return-Path: <linux-arm-msm+bounces-90923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKomIJrNeWnEzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:49:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22DE9E664
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14C91306163C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9287933A9CF;
	Wed, 28 Jan 2026 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nil4uXHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgUU5H0W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29245339B58
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590026; cv=none; b=Hf047TY3agFqYK+CNR6COLCief8TRRGZRtnHKUodVM2tcGGgMXwb8beukMxvN1pQ4Es5kR6JPRYzCCC66ZsNWbR/2TzwoJykOfxBrpwSrI6oL/bXlZOgFGvOGwww3IyNK07oKlCYMzzzCKzmen0bgtgoyKS34CvzRcsszjLs9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590026; c=relaxed/simple;
	bh=e3TRfsvo3h7etqIQP7dqbHgjd/404D3QWc/LuJuSsiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9rVDqLEKpqF2ZBl44wO5k54lcLBESFAPunU1A3sTEo7xyEv8QKcB5b/iB+7E/Z/vhHCM5s+CHF4nYqQRQBaV7oPMpuCQJnlByLtrOBNL9W3/rjILEoDx0t78JMlVG6CwPEGQIW8flYwNOp6BOmFV4mcXjmU/2DGlu0zaSc08eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nil4uXHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgUU5H0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S37DP91334211
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+peXoFtKe85BwjRu+lZhP+ZBRPDUzqAfBEqGFaDyxhI=; b=Nil4uXHcabl/djks
	KozDwTq+1ko1tTPjsRgqoIClkS0+4wyY7M9SnBZSxra1N6cuyTjYqli1AxmVPopz
	4FPueqd/79OCjb8lPPOya8iXmvFcVmGrjrYdF97+2qITJnv0BFdKNyimwo9XNVHa
	pv6GcANdkmHpN2Jaa5o3UGEYkJIsRzORC/Met7oCU0OPLF8PHwa8v5cHp8cU8A5k
	Us5fwS8rXpIrd56JGhftDBbpIW5DmpYeBjYiadr9hpmFysUTJ+UUHpgDvx7dYeAZ
	hyJtqJaOkIh4r55zqfMgugukJU3k0mrtLZ/Y9/bl3ZpeTtJdnTnnZ7VkTL2qHWNm
	TjhWzw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dftqab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:47:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a79164b686so72650605ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769590023; x=1770194823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+peXoFtKe85BwjRu+lZhP+ZBRPDUzqAfBEqGFaDyxhI=;
        b=YgUU5H0WSQCGurv3Ib+gc77AJZZRa6ih5eTB6Z2YvhcsVVjWyNpbKm5OhpbUfXcYcI
         w1CdQjUtLKeMa8gEIVj6hvvheOPtA6YBpZdFJXvtzHDgevFvXpEZulPXGkd28wYdN8re
         05+3N3rzR91t3VqE0ArOcaB7rutgx50KyvoeJcGCmWxtMOq8NwTfHkhV7X88GEKiXtH/
         uZQTSHLcJNTHqCLZq+iS3/LmY0R2wg6Mrt0vwtbVBJ/t/Suwx8CV+Pa5iHuC5BzJybzI
         JgYc+CXR9G7joiAU2PgN4OsQTOK0gJ9ni9yGI/fB94jpPHNXRVPGnzno+/hXhenBC5ic
         iTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769590023; x=1770194823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+peXoFtKe85BwjRu+lZhP+ZBRPDUzqAfBEqGFaDyxhI=;
        b=HOsAgwkQqhqjuSOlL2ZRNbAwy2i24P1ZpEDyl1Jaw6Ld7xIgYA20K7f5sIintekgLG
         uRp76RxCHi1riXGkTT1JceCkH/sO3s1+YCKVSlqxpImqKhAU2TOK3TvPEcycCgB1IDuQ
         f3ifEU+PbQOT5Dz0XkHZMmHUfSDCYt1nUAahmKt3BSfcm2Zgh2fq/0dcbncxkUDd4dJZ
         Fu+dR3FpJQLeaV4eocuTcXgtVR3+2gIeSjmtxgbAHZ0Z3N+H7S1g3oouyVl+G5gMTnaq
         d1cxnzNJhvVCYV0pMiMjs7sejTOuIfywBEAiQGQXmmQpoNsREz2f3lfq9VCBGzvJSFgz
         +cWw==
X-Gm-Message-State: AOJu0YwMPX6L2Q1CZ2tYuBSOBWZO0pEFevROZKD02myiFy79if5JueKW
	jAlCEBc3b2Sa8QEmDAKYFAxY39JCqidKPKWN3BkaU1nmcG6pG4FyPuJFDqhO9fGt21J6OCjtLAg
	PIrU5/yC3sgAR6z0CU0/px+ZwE/g02yns9AA/daMgJhiVAxj9fU8iOIdggzjELtKq7Rve
X-Gm-Gg: AZuq6aIc6t67nLhUJHjMsDHmvyq7QsSWs+y3inziCwN8CMb2Ug1zFVyjPNjq/2wRzUY
	m3zBf2CmZXcNixnAdg6IFcllRcp3oto8vwCVZQRDDUuD49JbA1GpdNCzfugp5O4H+/PqWJ3jvYW
	f/Z0C/RuIu8uB17qD9u+OGRO7q7GAHwPzqBNOgEXr2fzmbjPDUrIRuPHk2x91y0STXB3ccQKrAJ
	8EJndjS6+b6sSepmIVM8WBrhTK8s7fT4alEqVRXwhTACudJoopVSKaze6mOhdIScLhpMtCLuj/I
	iNP72czIGSyaQRPbvOvSgDrrOdxnlCOfOwrtFvVFOUhgC0G0wzkxjaXA/42Oj189739qguK8+oA
	d7CAJcU2J/5cs7A7VqOsJWLCq3dPs8KmFP81nnaXtMX/ETrU=
X-Received: by 2002:a17:903:37d0:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a870db7621mr49442125ad.33.1769590023175;
        Wed, 28 Jan 2026 00:47:03 -0800 (PST)
X-Received: by 2002:a17:903:37d0:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a870db7621mr49441725ad.33.1769590022629;
        Wed, 28 Jan 2026 00:47:02 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm16263075ad.63.2026.01.28.00.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:47:02 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:16:42 +0530
Subject: [PATCH v4 3/4] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-enable-ufs-ice-clock-scaling-v4-3-260141e8fce6@oss.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
In-Reply-To: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3MCBTYWx0ZWRfX0Iw6HUHc92iH
 kf/UfT+TIwPShkkqs08VxT9/JmjC0vhQOKrgnOmh2gIm5nc6YOvwZFSkAnoqGoHTlQXKrdKsCoj
 /+kSo1VFrfyPQASioVu7ET0vwtVdADx/A0hg8G4Vf2Xt7f90hU1295e4kuavMGlWvwbpqjMMKDf
 1uuK9yREv76IPtvyASY0+bgqUOHfipIEa02IOXG//VrshwYCwlhjlyHcikvfLU6TE0kjt+p+rLe
 w4NpSdzEY0yLsvFH2Ii3RMd0wilbhUux0aMq6De3+VmmJ5tq1L/YZD7XVeFQyY4LHIwpXrMWlhs
 g1/LzePZ+nqHNDPslQWJQujNhwCpGJ/S190HT1rN4tywB6Tax1GBAltCYd16G8eta6QtmNWGPNl
 bdVWhd2nMrA5Iud6iqmQp96/aDC1ypopF1IZVrrCG6jl1ASDQ4w9aYdIjpIJQZ13gExnF1A/BS3
 0neSeuGOv15YPINgCNA==
X-Proofpoint-GUID: YwgizCH068rXwUfyzq0JdV-Va8w8e4pS
X-Proofpoint-ORIG-GUID: YwgizCH068rXwUfyzq0JdV-Va8w8e4pS
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=6979cd08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lzHOrk3F_0XHYG_XrgYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90923-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F22DE9E664
X-Rspamd-Action: no action

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cbdaa3297d2beabced0962a1a847d5..00cb9cde760380e7e4213095b9c66657a23b13ee 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool scale_up, unsigned int flags)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, scale_up, flags);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool scale_up, unsigned int flags)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1646,6 +1661,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
+		if (!err)
+			err = ufs_qcom_ice_scale_clk(host, target_freq, scale_up, 0);
 
 		if (err) {
 			ufshcd_uic_hibern8_exit(hba);

-- 
2.34.1


