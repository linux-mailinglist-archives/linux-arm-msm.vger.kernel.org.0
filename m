Return-Path: <linux-arm-msm+bounces-93949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PaCOGt0nWmAQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:50:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61650184EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50D28306B5B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1886537106A;
	Tue, 24 Feb 2026 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHYJD680";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xtq8eMQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070EF374160
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926604; cv=none; b=MNuVvLN73SYbYvUJtV+vPclLGT/BxEkP2HPQGWidqBA8o4r8XdX2gizpzENC31N2NkUxhqgOo5QbMtInTaCAwqXlF/5b+shwD292AocxQdiOahiFPb1H3OfEqY6kDwkuVwyqn2joaYtvXwJsbk7of0CtbudW1eK6NprMpbG8J1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926604; c=relaxed/simple;
	bh=VuWZ7N1lcd+WeGw/pxnXfta7MxEtNGYz5Y+EcUPXYDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhycHiaRihCqdpsarJ3gGEiXOQZWi6A5/7AR+N+/bBXPvDFg3f/+TaYHZ9yYUa17z/w6WYIqOfj7JuWm17mdGkPZaefCsc/RTpzOI/esVAr4cdMzqQGAdqk0esuIathBqGAhgbqX6wsmkl/i/idXhbuOi7uujxnMAufCTNXCSSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHYJD680; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xtq8eMQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LQYH1250586
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awIGq61Y2CiCEJlV84BcmHBT/7kHGgeTiuFtR2XNI+U=; b=OHYJD680RRDgQfmz
	bT34/Rdi0tuA+6lb/W4pKqm223WwifleBlX/IAo/iQov3zopEd3qpgsgjIbAhK7p
	D8LSsO1YUzhZIuwZG5ykrb2NzS0mMdZpsPD0vSayKAfLdY1CsuhY8pyLzMQ1/eIL
	DYwveL3g4rxI15AlJGmjhzV04gkhYgllHx04MPGXayXxdLz/Ek/yFa6uys6+p1bx
	TscUmW3WDiuLI0lgWL76C8y7us5wtkzZlFNX1kfF0AyIoje/zWXqztXx3aYZh2wF
	VKzReNLQrQeVXGA17KMYhFTVrmDSml/gV2hTW3pTnRAMfqvSsnAkY1YkzQNIlT9G
	o9AaxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch45690tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:49:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so4125715085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 01:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771926599; x=1772531399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awIGq61Y2CiCEJlV84BcmHBT/7kHGgeTiuFtR2XNI+U=;
        b=Xtq8eMQzXVMLNIA3XcLrS62Y7o8KcwWiY0tT4jZxgXArLUc6s2cHcakAksurDsHzdB
         ja5hwMuLDvElJlRlYU2hnMXn/X0JZlGtUDcQezz3gIwoV2dE2os2+GQUqh4q5g9TtT8q
         +A5Ok8Lq8BiUv95+SegrzxfqGKEUyGGHeC4gftW7DS3D4FTorDvCbM6CKVaOelxdhdtI
         nvrN4bv2mmKxnpV89NJodXDAQ8W6n1khOWVUOryMhmhMQEJFkZs5+WlKOw87gJnYKgR+
         zjxKPyznEFSgubNAvke8MF2/tNoYQlCowigExyVxLzy3Ov8lLZJfuaE/qXfBcbnqwdkn
         KuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926599; x=1772531399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awIGq61Y2CiCEJlV84BcmHBT/7kHGgeTiuFtR2XNI+U=;
        b=FlkT0z1AdUyt7IcwoNvuyw5pdpazw9F06KKLby816BFPCvsq2rBIYMSr4LVr1MT7U4
         sJU/VTLvA74eGz9NBgFPJUtYA6oYstfIUaY7D8ntikNDpFKARkdQAXOheaF8Um/g4Aj6
         2y7LLhmfN2OThRmFwdGfqsEnkbd3QLc0rrXYzZFdV7G865Fq7XmOjl9YKKmpJoKtEdX/
         1oAS285DDvMC87ww9k2tc0oauQguNbFhmDVL8CaWG9Iu1eyDr6kwezm0j3OJMQ/V0bMk
         /Y5L0UIRq9ubEWpACFKXW5rPXnb6jZq8WElnrDB0mPrvWk6s1Hatvxn+bejUHn+cmGkj
         /L8g==
X-Gm-Message-State: AOJu0Yz/5+vMeaLecIUxg184hv3ci4BcP3ejnmln6Fo0fjIIX5aTWMWI
	LinwJAyvn6FjVg9MfVElqLe3yhuyunoi3hE72MHOtRKUX5xYA62wA9BiRNweK6ohFe+PgB56SGe
	O7IMvZZinY7OSB0/hjUIClBtEB1nZ3bhsQ1pk6c7MLUci6dHiIozEpSnr5fNTlPN/eSF4
X-Gm-Gg: AZuq6aKOABda3sNg7M3jxJsqZN4Ah0fgRaEOFp2SOg6wnomUJclHsN1hz2rtwiDNL7j
	mFISZK81A35f8LM+v90dC209Lm70dqpxr10IUNN8hREf8Yfwgmam3pOXuoHDv029cYqkzuJGJL1
	v7Ezsu/9X/JE6+FpcRLQaBKvodwjpip7MIfnSrpcvQPsaemQ7icDSlMsw1hHrNV9qpKpEer5ZOU
	hTovpzF6dY5upv7+LhNCO4abX1Ux69WKsnKeNmbo7EShjMhww/LNr9cl9ZHYqQHjrL4hlqKyJLy
	T2zgHIKhGa7wno/S1POszz59a5Y1zd0onsFMa6PfnCtVTO4X4CD6GEz76n5EHQFLB99/xJVXcQY
	CHSL10KhxXz1vwIxKknWx26N9Z60Vhg==
X-Received: by 2002:a05:620a:4542:b0:8cb:4c29:66b3 with SMTP id af79cd13be357-8cb8c9cdf25mr1217674985a.15.1771926598904;
        Tue, 24 Feb 2026 01:49:58 -0800 (PST)
X-Received: by 2002:a05:620a:4542:b0:8cb:4c29:66b3 with SMTP id af79cd13be357-8cb8c9cdf25mr1217673185a.15.1771926598218;
        Tue, 24 Feb 2026 01:49:58 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fdd0sm25912206f8f.19.2026.02.24.01.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:49:57 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:49:46 +0200
Subject: [PATCH v3 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power
 Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-eliza-pmdomain-v3-2-6e13d3aa70a1@oss.qualcomm.com>
References: <20260224-eliza-pmdomain-v3-0-6e13d3aa70a1@oss.qualcomm.com>
In-Reply-To: <20260224-eliza-pmdomain-v3-0-6e13d3aa70a1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VuWZ7N1lcd+WeGw/pxnXfta7MxEtNGYz5Y+EcUPXYDs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnXRAhwpAZgCug59nAtnYVaYuiV+RHdrDvzxXZ
 3qzkrpoAaSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZ10QAAKCRAbX0TJAJUV
 VtxrD/9781CE3DbaKoJXBV5OlGC8mmlG9yM9TqZeAjA/p+hxNnLvVZNqwLXDZM05SX4b5dmNlOf
 W0T6MyFdVPStOg+61ZqooGqkyd7kiVrBf8IvAh++98Ga9w+MVP7vOHIVcPE3Rq1CPul8lKPPAON
 u6o8QfnnUJWgnaht/pYms/Wk8F3OmC6/hfymcLRwt9/5SJ/KuTmzbMIEawflcxvhlaYR9Ur/xNP
 aDT9pbaUq2U2s059ZgqeLXD0ZHxlBQYwXiPAkTuixxpwBnG9hmpUc0r8tB1TqqDCKfmRoPGUWsV
 189XGbCJ7dqK8f6QACDOp9SFKq3mF+OWE+BwoKWE0srhgKjCbQqsIuglRmEzslpK87gWO6EBCuA
 MkEdemcp9Lg6E5SRkcHz3z9ksrZGdCCBiAfpxi3tbS06hiZfn6Kq+VD2nb1FKNBm1toS/vToDDw
 9Vl7ddSfA3WyrvHM0uK91etI+IxgWR+HFWFFI2DoAQZJ7QOiAXFwT+AZzU/qZfAWgpSJuICPCGF
 6XLMhCfli8qaz1FCsk3KhSe8QUFd7yZkFeaFRr3B0QDldzUbPjaGYZDkuVs2gmEGFd/wWKpYahy
 9hydk5tpX83faQwBfwtqHasL+jdd8WZuvea3PqfL09qrAoywiDUGFuPscReFOhgfkvGfRGPmnKW
 VyWJbA0O4gkSyfg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: z0WwS7SLlEmbcLi6ZQbrki4ooyBA9t7I
X-Proofpoint-ORIG-GUID: z0WwS7SLlEmbcLi6ZQbrki4ooyBA9t7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX9/thqo51taJP
 QQSVUcZN1IpbLZWjs/+LYCGVJ0qgUFQJrhN0L6Mucv7De0nnJ60jAcqAeuqNHiUz/YYiDFRLQBg
 PQKg+G/CjUBP1joh3fsP6RZUnEfsm507kMIhD7kvDcMgrp4GJOSg30uY05E5mh4a1N8psjbY+3O
 d5q6k92B+xLN6GEjoY5iJWITj2fmGejKAI0R0BUlyuJajcPwZYgHP1D0S+HWgmbD4tED4xSnORq
 zom40XK1629X5MmX+GhiRxKOV9eWDDTiBHg2y7awfVIiacmo1ooxCckWfPQccjueLiermozXJNK
 jpMbvW79YxDxA3aZY1LZEEcHdLLKbqpRcBNnrPnVRG5Bc2E0uozbtOgSxRSBAf8/JbQTMSzJr2J
 FdV342xoRiNpBSyuANCxtzorJkU1MAGKYMaoMDWyx+6Bcglv+OxJFLqqGdHTLmksb4/1kCTm+eF
 WGsTZZazqTqvmYjrLcw==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d7447 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5pcsaeFqqz30Xcu1mCMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93949-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61650184EF5
X-Rspamd-Action: no action

Add RPMh Power Domains support for the Eliza platform. The list of power
domains is taken from downstream. Even though the cmd-db does list MMCX
and MXC, they are not used, so they should not be describe.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 19849703be4a..ef2e08c6b454 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -217,6 +217,27 @@ static struct rpmhpd gmxc = {
 	.res_name = "gmxc.lvl",
 };
 
+/* Eliza RPMH powerdomains */
+static struct rpmhpd *eliza_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+};
+
+static const struct rpmhpd_desc eliza_desc = {
+	.rpmhpds = eliza_rpmhpds,
+	.num_pds = ARRAY_SIZE(eliza_rpmhpds),
+};
+
 /* Milos RPMH powerdomains */
 static struct rpmhpd *milos_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -795,6 +816,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 };
 
 static const struct of_device_id rpmhpd_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmhpd", .data = &eliza_desc },
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },

-- 
2.48.1


