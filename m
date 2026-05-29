Return-Path: <linux-arm-msm+bounces-110241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO2iBmZcGWoLvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:29:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 673975FFF18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32BC130063A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74172E7399;
	Fri, 29 May 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dyiq/pxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCOMvMV5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A533AC0FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046781; cv=none; b=aVVPwWJYaR8x8dSGyeRh6nGIw3+zEyzTSTrpBQGEIYJtkknGNZU6Txl09J55DLDpnrmAOoYadiux/HK5itz/WZkdTilF58LT4GD1x2TocdBuH4+oDqo83zaVA3fdDV8VcyCOiN6RZamrlGMgV0AMYcrGD14VC3sb2LjeqP9GZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046781; c=relaxed/simple;
	bh=55jUZWzGxp9aCPe5bZkcnxzYodbASs7kRr9Fsxir0ro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lo4u6nbcEajz8xCvfSqNeuSfZH+yyd2lN8EXnS/TwWURP7rwSRnwqt/E/vehUiv0X5lIlRvB2qMwToFK/pFJ6esH6mCip8FqM5wn6ZLVOww/qPza2QYr6RsHsjq1xpG2SGrAF+ruGMXPN65j9zkGcs+17Vvs0QVAtwTCHcP3iOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dyiq/pxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCOMvMV5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T4THs34193425
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OagiG/2XGNjaP9fSiLv6yFRzHrR/nWLiSeZ
	dKRq+Q0k=; b=Dyiq/pxpK3EZcHtoU2AECyl3fjg/ZHnlJhUP5W9RKialDIEOGAx
	SMRPMiduL/m3qkN+8+XgpmKWusNnPKANZ8xHJE0tFwRQs5owdRgQDLsqzdocRl7I
	L2mhn45hCac9LhlOQFxnP6CU53LWNuIQ44n1TqwJs0yTgwKwladBr3ACbhhfbcFR
	w/3aArEvNhKJeg9F2QlEVRfOPRtylr8VJ3XdQejV6L76RmumyTSFkIDjboofF2SQ
	KSuk8jfb1Xr59f9rWKpk4GC0Jb3PxUpYTWSmmr8xU+gkX8I+sgcX+IrMsXbEDAhw
	upp7t6Z3WCV9o4ZTaURW81d8b+muu8AkKtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te164n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:26:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso8783761a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046779; x=1780651579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OagiG/2XGNjaP9fSiLv6yFRzHrR/nWLiSeZdKRq+Q0k=;
        b=bCOMvMV5HAo8OTGx9RDtupL91WZtZEz1UTCx8hvtELx6U4ae+ZyR1pGT5jZa+UqgbM
         BUflUnRITIj2pBlQPd1VQmlBigcc6y8isXp/2uBe/KybrFGII/UdwHknhY0n/WNrgAWT
         w+S/TIRiJW/7u4XGtXAqsiv5PcQQg6JU1HvC4Xdum73v/80lc6BxdcvuXY0B/z6BgcIw
         ZzfDywHh0rzpVFGCllM8L9CFc9y8WK95YZocOPqf3nt5MXm2Bm3sRKBQ6ybv640LIixn
         zK3Nu3nJngvUzXLsB/EDnJFG3ntyqqqt4W6SfZ0GDTYAqw4yOl+RuXskMU5XM4lS2/RC
         Us8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046779; x=1780651579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OagiG/2XGNjaP9fSiLv6yFRzHrR/nWLiSeZdKRq+Q0k=;
        b=oPDvGhlu4wZ8eS5tf/Whfoowz+CcbW1zjRfqF9GrG+cRVYMkZUoztxfheDrgNtP7gr
         Llw2qTmGrI3SeMwHiYbyau7cDZHwqeRM6w0NSXoSEyqOb7XJ3YeSEvX0BMBVL8W4Gn3o
         mnUU+uZfKinb4Cjx4CPPGVoFcsHJS773YJJ/d96HVM4aDN/0DJrCuRg4p5ZjfAfPagGS
         dtnsAhWJGeG3KPdvnZoSW7sHbB14I7pmI/wtA6g2bVY4Y/JzWgzvwWntUeLXZD5vEL67
         wff6BVEMCK94i2w8SyAZK9nCo+m27GuE29SkLFxuCOtxDEzK2gx4+QEWLxQuMqKHUH94
         vrDw==
X-Forwarded-Encrypted: i=1; AFNElJ8k6nto5UNeeQpcotW/03Ri42/j3HyeAAbndo1Y6OQvqBH77MvE3mmF4F10HNtK6Wluwe7hUL4YQXFNyFfB@vger.kernel.org
X-Gm-Message-State: AOJu0YwxadE5wKl2xr0Uo5HhYL++/8M2gyBzeTbvmyOY0vKf3HmlD9tW
	+Xd9M9fGVnpJFgpMaCatEvco3tKJzixl74y7uccMlT4tW1SioA/iBMBMeWcxShRTeyyGgvqF5Ye
	L2bJ3f3JGAbZPMtKFILTRcVgrdAlRkqqWo8VCK013sKPGGXhE5/WcZhJ5IIdosy5JkZn8
X-Gm-Gg: Acq92OEf7zwzHrsv1Wq3HT6+9752Wt9yYFyM6FHHuxthtt9XAqaqOUbxT19/AWGr3Ep
	6HeN8YV9Mp3xvXjrV5A+2iVMmOl8wnySWqgzyLl7wGONSz252YqDGmZN1o296biRgyZyIRnO1RB
	Iy14Z52ALRZxa2aLSjL+PEkoRGpOTX86w7AnpxpvmBd7/7p3Va5pQLYf6EMowWL4wsDQgGyPL8e
	6S4jyhzANq2h8yGZsoH32Uv7mB+wu1DeXEuKmUo/42pP1+5FUTaPkGMwhU4AxeTEH+WA/IORcg3
	Cbpklxr3tR/pNlxpSbZZopwpTOEp6dZXoRAjzlp+Jkr+hZLGa91Sppug/iIWXhKr/yFUHd0hFjT
	qCiOHHaZYEpITUN3sOJ5cy5SbreycXCrKe0Uy+IX3SYMn6lVtVg+ug+nX/hW5GRE=
X-Received: by 2002:a17:90b:53c7:b0:36a:f04e:d7cb with SMTP id 98e67ed59e1d1-36bbcd3386fmr2473938a91.4.1780046779206;
        Fri, 29 May 2026 02:26:19 -0700 (PDT)
X-Received: by 2002:a17:90b:53c7:b0:36a:f04e:d7cb with SMTP id 98e67ed59e1d1-36bbcd3386fmr2473893a91.4.1780046778628;
        Fri, 29 May 2026 02:26:18 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0bf8fc0sm1450395a91.13.2026.05.29.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:26:18 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraj.soni@oss.qualcomm.com
Subject: [PATCH RESEND v4] mmc: Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Fri, 29 May 2026 14:56:12 +0530
Message-Id: <20260529092612.1749752-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yOrBENqT9W8uv6K061uNmFOSOwc3Pwm5
X-Proofpoint-GUID: yOrBENqT9W8uv6K061uNmFOSOwc3Pwm5
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a195bbb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=bROryFM6UfwaTTMdod0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MyBTYWx0ZWRfX+A9VPJfT28k8
 E2oyNe8W0Aq+HHfwxDmXAsoy+6yA63bCexP+gPGY0mSzVLizcSJuxctvLYfOqqZDX/AN99kD9mC
 XKrIvtTIIEsz9RCeCmVlpkr5sjEDbJYNV9NjoNNdIAQe6ACf6wzYgCgoob7giTjoSxJSv4raFIq
 au4wRGKXLyeT+wh9L5VVPgI+buqQsTN2ykgDe6XvUXOXb7r0zq1UPfHTGuxvISHN4IMziwqvmAh
 ew1LvSK1pdEhOcM0WM8/FYlDxoz9wzQoAIaIuLYz3Cbbgw7nbjlu5BiqXjogiS8B6+3jUezHXh3
 9BRIRi0v0HMeBcHul1eyL+E3OhXPbt6Cg1igFQt03KTUjI7/ITjE6wMrBwk4mVGyED0NrGLKT3q
 sI2KkGRa/Rs5OITKWKZEZMkF1AVhCa6e78zpVIu37/hXHKINlSHCWYSo9rzH7DggkCz8H4JwSmb
 gNq2eMHs2co8I7LVcig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110241-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 673975FFF18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>

Crypto reprogram all keys is called for each MMC runtime
suspend/resume in current upstream design. If this is implemented
as a non-interruptible call to TEE for security, the cpu core is
blocked for execution while this call executes although the crypto
engine already has the keys. For example, glitches in audio/video
streaming applications have been observed due to this. Add the flag
MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
keys to crypto engine for socs which dont require this feature.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Link: https://lore.kernel.org/r/20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 drivers/mmc/core/crypto.c    | 2 +-
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 include/linux/mmc/host.h     | 5 +----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..a5a90bfc634e 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,7 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
 		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..2ccb63dde9c1 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1949,6 +1949,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
 	return 0;
 }
 
@@ -2526,6 +2527,11 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	usleep_range(200, 210);
 	reset_control_put(reset);
 
+#ifdef CONFIG_MMC_CRYPTO
+	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
+#endif
+
 	return ret;
 }
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index e0e2c265e5d1..2fd76f966e24 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -457,12 +457,9 @@ struct mmc_host {
 #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
 #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
 #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
-#ifdef CONFIG_MMC_CRYPTO
 #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
-#else
-#define MMC_CAP2_CRYPTO		0
-#endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)	/* Host handles inline crypto key reprogramming */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1


