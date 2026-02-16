Return-Path: <linux-arm-msm+bounces-92919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKZdDMz5kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:04:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94229142A22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8810C301ABAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091C42F12C6;
	Mon, 16 Feb 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjcr/oW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cStI417a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98952C21EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239866; cv=none; b=Co/nxsZKmnkDJKGtg1j5ESD7n3P7lY0BDymGk7mr+1UD6LLijwg6MHn0sPMQNJ7IzV33Sujjwh8LdoyaTIeff3spWHa7INDcV6C4sdF/jfOw2ti9oSbmUdrxko7UAXlOvIwXRJP/+Vlj89x5rLBm8YIrTX/02MK9fkbYBv5U0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239866; c=relaxed/simple;
	bh=5x7EKhBU5ewPua8ICjoklEgJzewBTCgQsGAMmItM3TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShwarHi5EdF7331LZlVjepArIMYYL1xHbOxIcICS+AM6f3LT+LE/puYO3vTe+D/XYdYbNoQK88GA3ISCLSuJiws4R4SiaHpFYKAavMc1jqwXGbaWEFSWz/U3jHoDc9E6mDyGZ4KTY5i+ICKPNftt57KlmYHv7JILERB2yKOjV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hjcr/oW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cStI417a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G2D9WK3304890
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F01WUNnfmnb
	R0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=; b=Hjcr/oW07ut7NbClc0omdQp/L9M
	wkcrxXS4KA1jfTn7aDyR8+ZvemvjvRWppcZN767DfNyIDpN2bWzk2zlBhe05fArT
	pKICy9l09DPeiGncJBsvECtauhYLojMGsSh6rfxrtIKP3dqz1dsBGke509mNO3Cs
	XVzJJN16vR1ThcXbbH9EmpHsRW6STCQWxszl1AEBr4NlUnMOyz1YFxUHui9IzlsC
	hnl6YRr0ArVfxfcRcgeIoo91YJANHB8C4RCEsOK5TKozVXC0qDbzFkX14ni7BDF2
	E/uSGcJvVeV0LkJ5ZFTwkrYtI935CcOVt5UKEeg+bTp503ltAcm3NPCwFWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcm64w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so1896908185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239864; x=1771844664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F01WUNnfmnbR0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=;
        b=cStI417aHZgaAbNOxMXFk4sY2A38st3v4cUlpXdDlrdDGtDXBvVI/LjyhFsW3TDVYw
         ko953l0w+3b7V3nj5XpWCHlTgu0Q87h8m07WUR41hz7MhZXOkRSEfugKoNR4UY7T7TWk
         FQvg6KywBsOgywqIlpnlxLLB++l3AQ7Am6FarDpi+W0x7ZMqwKAVFVQC3J8KP02DR8EJ
         L5IhHl+mMIfwe4MfzGeuN+4n/6ISQqUCTkP7h9t9C3/Q5bYfbbOGhKpPFywb0VCWnwyL
         yMOHGXGhMIvVRCXOUvKCexuDZbhacmfJlRfWPRmMEBVd3TekVMBu2lbi6ljHCsZrmTIm
         Kz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239864; x=1771844664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F01WUNnfmnbR0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=;
        b=sMmg0zL0o7hha2nItgKKRlGmYaTsOLcllfoucDDe21nMPo4Jl1VsEkwntgKHxQDjeG
         /GuvgSxG0GBhSjpVJGJWbaghuLH+fkN+loUJbcZ0LfgDHssMouNnGxPxLo9IOO7evoMC
         Lo/Oz7+aGcXR6NrRQXxquPhG0OCUhykmaDHVK5HQMDYid07jH9CZNCJX9GDg/W1ah2g+
         X5JTH89RKEIgdWGYn9KxPEwgAMbid3YIc4nU2UaU3wcmMuyFrG/12ZOsbneTS7TvWB3i
         HgD1IEi6jlxkiTtcmENYgqZOCqIlMPfAPG9aGCM0Jv5N01HezX38kYZYITXMJg7NiArz
         iBQg==
X-Forwarded-Encrypted: i=1; AJvYcCWeUAYcoHHOd9d0UcvlLKWybmCNntCWp3KNbxK7XVYgUAMbAjlFH9h8dsBxbA+pBnHtq1JUEhiOfqfcTMd3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8UHt6BV4TOUiW68coBvL9C+Nur+5NvUxESvjPnVFQtcyo8QB0
	Jv7t8tCUrmgZVE+IpWnEo06UMe1bGk9yo3d5bx+6Mmj6JJOkIt7mrH7sHOSSr+bjjRDsYRyLUOZ
	cG8Me989zATqfMzj/PUSkG561AJ3FLUgzatvyeKpDz+i7vDcM3yczIFHtC+82jjiSJKec
X-Gm-Gg: AZuq6aK0JgKrGlJRmsed0gEGBuezEe6ijTwQVE1Bg5S9aaYsStMKQR6FM8HdRPkNDzi
	aCOc1TRQAxC/SekpSYMX23Yo0/Pds5YwwV51RZrVqp6DyrATPwA+uaY2/JFEkrWfUXF/kJVJWUM
	alhv2GGXaAJyNJSNAdI4hN5ZJ+I+s7+Gai8Quu7t/QWnoZv1DFfzFohooT3Xtv/sIjYzDa73oSE
	BxL4hghMKmzLOCVmOiUJKGxR4LXXvpk+cpOcZbn+p6rIRL34AgbQW+awcaPxjbr6k8W1dpwTvxj
	8iafYY2psdj1MdFjsvs0gCRjphefOl55HdNwZC6p9RqwJK9ZPPwgnTHYnygtqNCmxVeLX0grfZS
	3pdZjo95DjPCJPFIIPrMcLIaIPBX1rAAQbUF3eA==
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr888183685a.15.1771239864131;
        Mon, 16 Feb 2026 03:04:24 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr888181985a.15.1771239863711;
        Mon, 16 Feb 2026 03:04:23 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: marvell: mmp3-hsic: Avoid re-casting __iomem
Date: Mon, 16 Feb 2026 12:04:15 +0100
Message-ID: <20260216110413.159994-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=5x7EKhBU5ewPua8ICjoklEgJzewBTCgQsGAMmItM3TY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmuGumLqCgJtNAvdAK3FxSfjsCCVupiMB6DO
 aRRH/Dds5yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rgAKCRDBN2bmhouD
 1xyPD/0doaU541CGXdyo+TDlx4q5IRHmoaKkM/nJvV55NxJGn9KWOqxb2jB4u1YpsFd/XOEh4vM
 EiQ1f5MP8+ovGUSJ8B7Gl9BUvMNfLKKjhLYGGMUYAnhsPY8dM9d/ru6RLrYFaWQFhR5Goqvo/jq
 Pd6vn+deb8KAswMtnQA4NMGggINzxnr560ONASrJReEYPcaKDxs0WHJj0IWaClC258cRFtCNXgr
 sheBqKuiTpsPGhqXhvL4Eq6Xm62PpCb7FYcBNlD2P7U93R+Idbllc7uetzQbpi/qgipDWRvJd5i
 eEptl9HfzgHd4lQpleW1Y8G6i24pm0xvCARUgZ8oNimjEjKrnLHBOqr6kmpPY8MeuQQHLjNYgPM
 3r0bfai9ZsT74ygiraFpBz9/7uY8MCJ5863aMTfGaVOBJcyyR35IIoK2k147wjv/tNyz4mYieKs
 LMK9NB6FG0U0hn3kQ3iktoZCgwvwOBmX6WD6PmMdbaKsOREUlcfLLDDaBE7fISuRFpG9UXTB/Dy
 swSzMRK95Lxq0t1E3a4ZScx/5Px3CquXsdvJI8ezpzYrrSE2VZNyeBc9tpzUjNRtsr5OASc1Y+2
 xhd1UGwAgsB8tnlVWXFpCYKHi0zqKtR8JEhicIg/aHZDe6UYjiqLfCPNxF7UT2ZZg6kakhCQT4F pOuqDl66BwCcHsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX+hNbefeAiXy8
 fRXLjCsEZrf4q/kfOGjqt6I7QxzR5i8y8QG2OteHdDlCiYtJTMS2aZFEsuhqiC7o9/l1oipnYO+
 qFIJRtLRYFkaa2hFk2H/KtYrlKN7UHjkFKEEqXww+DptLjfMhBIKOb7dFjT6LxbG8NQxst5d3ly
 otciCLnHVj+XrUp+1+X/vL2xS2e120Ai4FD0XrbTxXhmZ0SV8P53qyzzXBxXqRUBJaL+/P5Mt/M
 a+ySLgoTW/BjQrJgRQuB10zpob1MLyQRizf3k4Jz3uU5/kGBrIMv4Y+Z9iDDOySbBTxLc0zG2ol
 OBWEB0Fv0xHAjgLzPAPbWwbZdEhA9UsCW02MZhd7XjwwHxI0gHLWV9VDutgxtLZbKMF7Bq+AdRi
 sE0Ci/g4YU9QoZ+h0nzRGX1talKg3f91tsRBnCpppCJFTMCLN9BFAKckMMlc3jGOjceM5QJRM2c
 YvvEmB8E2oJc/jMNDhA==
X-Proofpoint-ORIG-GUID: Y-WMn3pN4nh2-4amRVQD95OGAw_tETxw
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6992f9b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SkZ1eIaMs6HdBQsGQEkA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Y-WMn3pN4nh2-4amRVQD95OGAw_tETxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-92919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94229142A22
X-Rspamd-Action: no action

__iomem annotated memory must be accessed via dedicated accessors, even
if actual code is correct (accessing the driver data in
mmp3_hsic_phy_init() brings back the __iomem cast), but dropping its
cast (with or without __force) when storing as driver data seems like
less readable code for any future changes.  Instead, add a dedicated
wrapping structure just to hold the pointer without changing the __iomem
cast.  This makes the code explicit, obvious and solves the sparse
warning:

  phy-mmp3-hsic.c:58:31: warning: cast removes address space '__iomem' of expression

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/marvell/phy-mmp3-hsic.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/marvell/phy-mmp3-hsic.c b/drivers/phy/marvell/phy-mmp3-hsic.c
index 271f1a2258ef..72ab6da0ebc3 100644
--- a/drivers/phy/marvell/phy-mmp3-hsic.c
+++ b/drivers/phy/marvell/phy-mmp3-hsic.c
@@ -14,15 +14,19 @@
 #define HSIC_ENABLE	BIT(7)
 #define PLL_BYPASS	BIT(4)
 
+struct mmp3_hsic_data {
+	void __iomem *base;
+};
+
 static int mmp3_hsic_phy_init(struct phy *phy)
 {
-	void __iomem *base = (void __iomem *)phy_get_drvdata(phy);
+	struct mmp3_hsic_data *mmp3 = phy_get_drvdata(phy);
 	u32 hsic_ctrl;
 
-	hsic_ctrl = readl_relaxed(base + HSIC_CTRL);
+	hsic_ctrl = readl_relaxed(mmp3->base + HSIC_CTRL);
 	hsic_ctrl |= HSIC_ENABLE;
 	hsic_ctrl |= PLL_BYPASS;
-	writel_relaxed(hsic_ctrl, base + HSIC_CTRL);
+	writel_relaxed(hsic_ctrl, mmp3->base + HSIC_CTRL);
 
 	return 0;
 }
@@ -41,13 +45,17 @@ MODULE_DEVICE_TABLE(of, mmp3_hsic_phy_of_match);
 static int mmp3_hsic_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct mmp3_hsic_data *mmp3;
 	struct phy_provider *provider;
-	void __iomem *base;
 	struct phy *phy;
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	mmp3 = devm_kzalloc(dev, sizeof(*mmp3), GFP_KERNEL);
+	if (!mmp3)
+		return -ENOMEM;
+
+	mmp3->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(mmp3->base))
+		return PTR_ERR(mmp3->base);
 
 	phy = devm_phy_create(dev, NULL, &mmp3_hsic_phy_ops);
 	if (IS_ERR(phy)) {
@@ -55,7 +63,7 @@ static int mmp3_hsic_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy);
 	}
 
-	phy_set_drvdata(phy, (void *)base);
+	phy_set_drvdata(phy, mmp3);
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider)) {
 		dev_err(dev, "failed to register PHY provider\n");
-- 
2.51.0


