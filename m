Return-Path: <linux-arm-msm+bounces-91426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBnYNrtNgGlQ6AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:09:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87437C9161
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6E3E3032CED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4780D30F7E3;
	Mon,  2 Feb 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1z0MocV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pdk3NA6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051022156A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016004; cv=none; b=plNpgEqLDyu8K3CpNt53VG0QJ05JprIvUQbVnzBVh2xvafVaAjXRV2Pif1LoLdrMq8rLEv6DdL2Xa2Axfu2ElziRxkdYYu7sWoIOBt0rddViK2ZtwYu8XwX4MjEqMekQQ6lBUyV42faj21TDjly4YZ3J9sgG6hrdsd2U3o7pKwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016004; c=relaxed/simple;
	bh=2nhAJa4AUy8zbKc70unPTS5O+LgqBu/tqzy9o/0eCCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5xttpiK6A6cpoyhTtKDlFF2WN23AnhhP4yp1UYEgpXf1MDWFX63uP86n80+lj8Q92nE73rGq59YCS/5StIkkmuFQdEgNL1EbGzIaI6pogUuK2wSxIXEWaXA5vZBOL8AGrDSq7i4/GQWyaySo3wJ5Hdil6pZTJhWiGL7F3dVIwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1z0MocV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pdk3NA6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611N0g431888267
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tO+amxEVtVt
	QqPGjbGDCGXQdbvpL9JRniF3roWsvzjg=; b=X1z0MocVPmUQTV/OEfqhCI6p8iC
	tnBT7D0+5/tYN+ZyXiF0VvTSnY8nirsEzdbH9ReGlsDyRLyUlM/gJ8jszk/ZKBa0
	cccDqeTIA00ezRSb0g8PensBmUimUuzBCz0kJ7518o8DRWsSxZKJr1AEUXC84LZH
	PQxLDii/dSMlXpSxJLte13YZlKx0ZaWhsIKCQPRdTnj1+YjCBlID+dxjCdUyCWM9
	6X8Iz7v9rQpDHxm7WzmrI8asvERnyH+ThmWRZCR+MKEAHtWA1mc/D4KcdvJxiwqs
	srLNx952YVCyFbudc2upH6DGA0rsaguUqeUVzQiIMLJWpwdyVfF6B+nkUtw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnmbeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:06:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so3432944b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770015999; x=1770620799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO+amxEVtVtQqPGjbGDCGXQdbvpL9JRniF3roWsvzjg=;
        b=Pdk3NA6z7+6CMEwHOKBntxhDibYOQlLsqvmXAwXi5wuCrWhWVJoBlvWYiAnySUZrzO
         S+LmuJeXudX7zBmVqkBQu5YlLtlBOZ/oFgUmGzoAicvCyGBsmY8/1Zb+SKl3wp05nFa9
         RjOQUOy3t/mPmPJvgK7Zrqmnac+kq9np2HK5IoKkWB8oP55sVGLiJxi2fJcuNeZBQGRw
         F/xtAbEyRf9qNUh3xFInXV/5GVBBJs/bPyMZBHF/KuAQnxweqHcL3IzDl7ovMwKUSQ8u
         vCrvxYFELAqAJ7EE6aLZTgztLG+nZxsBTFoMFJsKfegTbWdY+Z4PGzozMMc0tVbunneT
         YaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770015999; x=1770620799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tO+amxEVtVtQqPGjbGDCGXQdbvpL9JRniF3roWsvzjg=;
        b=okU4QLhlPeQBT6DbkGh3EkOjx8S6jb96N1Yzu5YbxR2lw/nhheZzpGTTVMtTrkbXUQ
         qNn8Hvu0XcDIunW4YFlPxETOy1pIRuKEYnJQk8nLp5S6Adp/5Jqmp0Kfk/Qd/Q1EBJpt
         JKymAj9MLw3wuspA7mI9UUXVrgS/m39dAb7UNqzFa4P8SRkmaexSTDJeEjdpxOo7qeXR
         IoLB4kltfQnccSY12mXwy8yAjEnUWbNcOjbLwotrwrS6ineCnrIlQpNe+rzYqCex3iq3
         ySriEN6uoLtPvgBe+H/p8dNyLg9lyEk6NdDLKGp3ibnVhRrgK+OiDYIKXXtSsk2+8kE0
         Wqiw==
X-Forwarded-Encrypted: i=1; AJvYcCWl1r9FcCALSF8vTaUsR877CFVLsAXVI7e//GoMisF7hVqGeEsNQqf3lXH0PVKAB2HmfiaQzGmmQpIhL39H@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzTjPjYDB/ERtofryWf4a70j+hqJGX+ypYTN+H8xOE/65XiOj
	MBSi8MnliBx9pUbQT4844/aeW14kWgUAwYnRZdHiZdeKdcFEzGFIitZnqLf7EZlstaWZSWxSFyF
	jyTHucWsyWmiVdc33FgnC3aBbNO78IR/svaGzGJNvA3sD7fxZcKkwt4+QIWJ2wJaNRiVW
X-Gm-Gg: AZuq6aKjDUiEU4CT8oBJFX1GfFIlBjJouu16gszxBptejA/9wxA5oZlYgSNYYyjjttw
	ci6UOiABPouXSIeysQ186GYH6NBL+RkcSEJlo9TdS7pQYJ2nfWNj066VQ/J7YyJQIzM2FBhR7RS
	N0L2Y1Q6imMY8SJ+l+qF+w2Zb9o+Zo9QhVLKUNAyUoataK3TwMcPxvWI+ealNmWlPyWf3Wr3+70
	q1J+Q0okX56um3rE/GeLd2jR4n9qh2TbUZ6WJQAsXM/WGxr9yUKcnm6W2t0Ilj1ZFItXeRAQ0Zz
	gIs6HlO7lM/8sEXG4kUPSC22Su9m/z3TtSZe6KlxhBjKnnYH0Pi/7Gjp2uITgLxbMQXrnZMDmCV
	vhEl8+t9WyCffWc0EfmBSG7YHEq7RN7sJj7LtqAfAKsk=
X-Received: by 2002:a05:6a00:6b93:10b0:81f:3cd5:2072 with SMTP id d2e1a72fcca58-823ab653582mr8503341b3a.3.1770015999352;
        Sun, 01 Feb 2026 23:06:39 -0800 (PST)
X-Received: by 2002:a05:6a00:6b93:10b0:81f:3cd5:2072 with SMTP id d2e1a72fcca58-823ab653582mr8503326b3a.3.1770015998919;
        Sun, 01 Feb 2026 23:06:38 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54fcasm16265727b3a.66.2026.02.01.23.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:06:38 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: talos: Add clocks for QoS configuration
Date: Mon,  2 Feb 2026 12:35:34 +0530
Message-ID: <20260202070534.1281652-4-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uija8b5yLEH0bAB1-l-9vHm0UfbHo025
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=69804d00 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7s_9-EB0MOrke_GCL94A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: uija8b5yLEH0bAB1-l-9vHm0UfbHo025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MCBTYWx0ZWRfX21qTIeWdvvc4
 CcdQKQnUzYc3ce3x74AQAMNa8O4Oq11PyjxuJwxwJAjFA0QEJNWC/GZn3tm6zgjyuHU4kn4ht1k
 icEpItAjxP1/UXHiRvtrpxT5M8Dh7XNLJnlHIkCxrZ89PUqMgJtw6lgrFmWQaw7X5toUKnN31XB
 hOICdporCbIUB9qRhXewmKgg9NPiKqcLvCU9Efhb1aMriAcfQ/TLQbCYB7jhqA2noc3q0O6NoyO
 VMmCZrIiDRRtpKkQdSms+T6qb6zHO3iZ02IG+ZmCru22a0WbCxbcu0Gm+nWXa53jnO8DkbGcMgB
 K8674lMFBWJhdnkf/aZMdaY1KqKV8N1HjLu6i8mf/DN5uEuwaWr9spnavqE6D6rzCm6MPJyozK8
 w2Q3KDC/k1suUhKVWCk0KPglgc42Da4zIAhQ96BV+b7lx1v2ZfVub5yQyEw2QEFyT5Aqtv3eWCP
 P9Oe7RnuZNgjPD6kUjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91426-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.25.240.160:email,0.26.140.224:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87437C9161
X-Rspamd-Action: no action

Add clocks which need to be enabled for configuring QoS on
talos SoC.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..a6d7cdd4284d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1234,6 +1234,9 @@ aggre1_noc: interconnect@1700000 {
 			compatible = "qcom,qcs615-aggre1-noc";
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB2_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
 		};
 
 		mmss_noc: interconnect@1740000 {
-- 
2.43.0


