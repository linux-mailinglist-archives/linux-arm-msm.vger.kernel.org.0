Return-Path: <linux-arm-msm+bounces-103027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIxxFQS83WmCiQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:01:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D693F568B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 940563023F8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 04:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ED435838B;
	Tue, 14 Apr 2026 03:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+hFq9+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9GsZCxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F46C347BD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776139195; cv=none; b=ApIZWZOhveWpjuAn3vmQc0SDcRPxnRr7h+4mSgqKDp3QJHMynxtgyDWYRmLpw+1LQmui8Zd6DHn280ULL1cBW1TAnYqSwbVryfZmoLtD5MXQvAUN7dOWXuP4wt4sQ/4eURQBVQgawVMhPZ3wAIyhhijH7Z3W0UqvA8VBCMX3V/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776139195; c=relaxed/simple;
	bh=x+LkWqy6XylTmTJQ8yU1ekofcbrjiotnrYxB9Bhs+f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMjSarRykPidSFTT0oBuoeILdxn8W8TvnC3YHHrmFmrLh3Nc1icSPxmHtGrZQrwI/O9qZo/mlaxI3Fhj2lMKcg39uaCThrOV1hozSzIzZZxf48DEUSDZlF/Nskv6kLjGRqwgmGwBzD34C3HJjnnMQtWnPe5ADmqYV3a7NjLviWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+hFq9+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9GsZCxg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLDoTt3425671
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bl3Ic3Mb/YW
	2B/brqGNBesrgAr2IILTx7LZLGKQE5ZI=; b=M+hFq9+Nwdvyrv7NwfNBM7mOVLl
	gtxa27XZB3lFUDF7c3U8Q8Hx4zsx1FB78mStzD2QiHUcrl+UMuL4mGQf8zTK5sHE
	iSfo4kxMi0DPN9uM0np5PtSaecjrst0x/2gZJcDRvVrs1Q55qBh81EZvhkX4NQie
	RMwAv2bOBxQmIVv8xzZzdjlAfFpCUj2aarf1xSu+5EAw5kYE3CLjKWG+U+sAmplV
	V4yhtMe7l61Frnma9nndfmHf4WWyr+wFStmMb/g2vWqepSXz+MDXB+tNFmajq0Jx
	t7aXBIabX8jV9sIXdtSaIA+3VsR8RBpKy7XihCDnZMgwNqw0kbmd7EBfwSg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f8wwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd1c74508cso652329eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776139190; x=1776743990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bl3Ic3Mb/YW2B/brqGNBesrgAr2IILTx7LZLGKQE5ZI=;
        b=b9GsZCxgHzSYgsAzVHEA7WK0V/mehHRf2vHFK/xS6Ij894E1/CTRMZzdOQMgoR6u/M
         +5U5hSjHi6LVMObf6KLrLsE77pXzx4z5usydSkkNCCMNQAZyk4zLVUg6meZYP1pZI5rp
         VLdZ0drjeaUW1M3BM/q2/YplTUbl3bAEAyesRWEAMYHz2GcUXEu/G+V3kbunv4uS2fDG
         eKrpggL0fvtzB1hGTlUnvi8rJ7aAldgRqaF3b4yVO0FDmwt5zk+DBTYXy/LwXS/5ST/6
         EHgDeU/PxaKLKqDwu8WiV+tcmC+nBJA9pHj9sT0IH/yu3tjtWhD5K3K5bq8TVgkZN47s
         v4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139190; x=1776743990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bl3Ic3Mb/YW2B/brqGNBesrgAr2IILTx7LZLGKQE5ZI=;
        b=ezYZLGWqZ9jrG2CESEMb8fvcI2A/QPiMBo9SzCXzfko37QN6pebi1eI4UoNTd2gHei
         hfM6pmm+hMWe/1YXv6ZIU0j80d0pHPXr3FjrDupxDqewnx3rJ7lBJC5+dKVNj7Snu2wr
         KL0x44wkA+bLHTsaCXzqA4M9P1Bc3mYdA+Fbut0VYsgxtBQqa1lBjxC1v3XrMbRofRcU
         Sr5xgFOECxtOmDQw3tKeDizBdQ4aJRNW7sf45DEg7Gr7YQjukm/Wf/mUgk9JcOZuGf4z
         tr0AJqZO9+l+oTBvIq9TCYFDTXLL97kCTAF3hgyHLxL+bsHhbhlKlwVZo/YJP0PCrEZD
         SQ2A==
X-Forwarded-Encrypted: i=1; AFNElJ/B6VojpDXNf7on5yhjCm1BcjIJ6XY8nSm04eG+hI0a90lRpd51aTq9yQo1ksA3dUTFlkhgpOQGe3WIH7IK@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxsNnqNgo9SvQSXheWz/ZLIsf1jXB2xfRUs+E/8Le5CivsaqB
	FnoSOHlrYyKs1q/KjLp/kMR7JV6HoC4nsphyfNY9iPpmSa5xbqSaDW9UNRedImfPsws653r1qw0
	S56IqtocwQXgPVRx1I+2FXdattTPNolkGu8DlcyGZOIitNarqvsFKQ45PMY9swkqNyNiw
X-Gm-Gg: AeBDieusKnyiOsBsedwS/hlia5lFjtOFRlB0QY17z0odTlUtbyKK/grKB2QFaHF6fq9
	e/fVuTS5a2v6A814WK7jMg4ERbzYgOFYrFTXeo4UW3CF4ME4qOkBLVc7w2JJj6H/3DW01oLuCWY
	J/GLZWYNaz90RM0ZyJfhqIESIEZIbnf3Oyu93zvO5ENfqCH9cm5EyG4vKFlGHIx/ebLhp7M/Nj/
	gK9QHT7h72WGWWAcLxcQmBvzktspJUbjadoKHpn75cj5t0Ez4EwTNBdx5rqMTEfBIPFWy/yBptu
	3/zEq4u3VdpiiC7RQXZZ83fiw6Zelr5svkOh/YagdGS39Ja/DxxzH63tT89byD4UeTsmnXQid/6
	lfSucNgurTQHFkI66wEGvfDtg8jfQV0utdC084QLA/KzBaQz8/trVQ5vVxCNTSeznxXdd4XyBZW
	vXvoZ1Fw==
X-Received: by 2002:a05:7300:7311:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2dad4b4f25emr1482719eec.11.1776139190270;
        Mon, 13 Apr 2026 20:59:50 -0700 (PDT)
X-Received: by 2002:a05:7300:7311:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2dad4b4f25emr1482702eec.11.1776139189708;
        Mon, 13 Apr 2026 20:59:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm13949983eec.19.2026.04.13.20.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:59:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
Date: Tue, 14 Apr 2026 11:59:09 +0800
Message-ID: <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNCBTYWx0ZWRfXwUtEZURH8b3m
 4SC5aqqzuZydfy3bhaQjeWp26g/JjIqqDqLaOJVbzlIGzZD8c/twQ+DLTHFN/7p3s6c2NRF1gAy
 YUFwkQbazZPdB5r3cWb6iVlO6sInq48rY3JtQfHE6Bx1EYkooqjO5L9KusdkiIw62xpRG8u0aSz
 w15loRwgjr98T+xG5jai8tRMu0OzFWLDcmxPQhTsz9FGrKBwwpu1fxWH93rKMFJ1CF7i9q7gMki
 QUa+7elgpIApxE9nv8M14powCicoDBat+zyEagbaMsZblonkKB3dhgAVVuhMo28tsPNWJoc0TvP
 P6I5BGPZhvfu8t/MOOvQcj2WAdE2R088N2f+iTuX5VZQSiFFfqFSZSbwnino3NCvbp3KreuJSXl
 UoMbwPyO7PO5aEPI9Nd7uh1vLatgleI1yItD33RNrIPpN30a31PYZwXZgnhOJaJYRya8+aPX13j
 iKUNy6QZrSGV7d5WqrA==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddbbb7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZnOiI7GKHaE1sxxe5cYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DaiVbVduOdlSGobGDoW7fMIgYMKlu3Dk
X-Proofpoint-ORIG-GUID: DaiVbVduOdlSGobGDoW7fMIgYMKlu3Dk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140034
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103027-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58D693F568B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add RPMh power domains required for Nord SoC.  This includes
new definitions for power domains supplying GFX1 and NSP3 subsystem.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index ba0cf4694435..63120e703923 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -122,6 +122,11 @@ static struct rpmhpd gfx = {
 	.res_name = "gfx.lvl",
 };
 
+static struct rpmhpd gfx1 = {
+	.pd = { .name = "gfx1", },
+	.res_name = "gfx1.lvl",
+};
+
 static struct rpmhpd lcx = {
 	.pd = { .name = "lcx", },
 	.res_name = "lcx.lvl",
@@ -217,6 +222,11 @@ static struct rpmhpd nsp2 = {
 	.res_name = "nsp2.lvl",
 };
 
+static struct rpmhpd nsp3 = {
+	.pd = { .name = "nsp3", },
+	.res_name = "nsp3.lvl",
+};
+
 static struct rpmhpd qphy = {
 	.pd = { .name = "qphy", },
 	.res_name = "qphy.lvl",
@@ -308,6 +318,30 @@ static const struct rpmhpd_desc sa8775p_desc = {
 	.num_pds = ARRAY_SIZE(sa8775p_rpmhpds),
 };
 
+/* Nord RPMH powerdomains */
+static struct rpmhpd *nord_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GFX1] = &gfx1,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NSP0] = &nsp0,
+	[RPMHPD_NSP1] = &nsp1,
+	[RPMHPD_NSP2] = &nsp2,
+	[RPMHPD_NSP3] = &nsp3,
+};
+
+static const struct rpmhpd_desc nord_desc = {
+	.rpmhpds = nord_rpmhpds,
+	.num_pds = ARRAY_SIZE(nord_rpmhpds),
+};
+
 /* SAR2130P RPMH powerdomains */
 static struct rpmhpd *sar2130p_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -856,6 +890,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
+	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },
 	{ .compatible = "qcom,qcs8300-rpmhpd", .data = &qcs8300_desc },
 	{ .compatible = "qcom,qdu1000-rpmhpd", .data = &qdu1000_desc },
-- 
2.43.0


