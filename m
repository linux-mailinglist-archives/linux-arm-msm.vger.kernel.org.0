Return-Path: <linux-arm-msm+bounces-96954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHynMfVHsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:46:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 860142627BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C31F4307A552
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CD23D0930;
	Wed, 11 Mar 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4h2wrrJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Baa7Zr8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965053CFF78
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225389; cv=none; b=ADgHy/9T28RfqjeVKE+jSP6BFA64/Jjh55eB6nRHDW3jwKJgoa+zEYd4X5pbjOHZDlpJSeWVrSaR5e26zhklZZ+k/kujTiJ4Ik8PtrcyzM5QODNxnYS79kqpMqW9xo6WIvr0boAdSsNDy9Wsw7QO3MOyXmHV0+K0+lxtFzQ+a7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225389; c=relaxed/simple;
	bh=kxZo7ioQhvtoHjeZPVYY3GMaH9CaQ1h9s3DRTXP5qow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyufCs5sR9JpBQWnD9MUvyzOcdu4qKYxkyCBEqpyQdgmF7y70liLHXEBdtj7dD7twVqUg21JdWT/XW8SSSYQk6o7gNzE+3Fgd6xfklZ/NSD3qFjFhOd108rXV6uqjF7T4rbggb0DPpngSFlp+8ikuP2+YruLLDhryeWOk8scD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4h2wrrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Baa7Zr8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9T7HE1573018
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HbZj9tv7s1K
	+qsnLUWbHvi8x21FiaRRcwrvvVvQVwKE=; b=H4h2wrrJSgSGdDWebATTwGoBugs
	Kpjh3zOo29TjEHhlxwhhslr7/QBVwCrCDxJuJ1kQVbf8VudB+u/wauVHodm06zcW
	2u3VY8SA3UuXAZIcGp8vsnybLrApluh9QJJcesQtOVFynvhhWZjoU1EC9CkA7Zsp
	JE0uDXvFu3L017iK0fqY1V0OLaOa9hcVnoyKzqsTDQhHQUXgdI8qNta2xMqftlUb
	UjVzuVDrqv3tFZDVyfVqNkKAyqij6dHERcgta8MMLIZK5/RXJ158CmfjZbxx885Q
	M0s38x8/nnfkws4H4WsnUwpOl6xUoFaFqBV109Qdn4EjULKcLDCSjc48sOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkb6r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae467f128fso102695135ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773225387; x=1773830187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbZj9tv7s1K+qsnLUWbHvi8x21FiaRRcwrvvVvQVwKE=;
        b=Baa7Zr8WqQkpbcDatk2f0pMRMHT7AeslpYl5RTo0Iut5uHHIqk2a+YaQJJRUIKyowV
         Y/Itsc9sB5YhPycJAEWCA4AIIUseuKoC4JK0+wTtSZqk4AVP/yetiAPXIbuDgjDILVg2
         9XVVxdN8Y7NO21YqMEeA1ORZII5S6ViUDKuwkeA+sgmmaBGBxczeNuJpN769MN0urLCh
         NOyCQVHq2iPvdIkOkAHgsWXn4qWeKtRv1J8FuRyerz6MjXybzI1e4xo3/ueXaJBnFBxI
         vgsqNhHeInC2LvWcvwNd3MOjyczcc5e0J4Px+skMO3LlEN7m/GvkHYcM1jRnCrvjRXC4
         KouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225387; x=1773830187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HbZj9tv7s1K+qsnLUWbHvi8x21FiaRRcwrvvVvQVwKE=;
        b=Unwcug2g5PXcBbrklD36yYFFFa7/nItPGdm49BW1mf+PYOdLE46lwWxsRB6Eg4vh5O
         MX5yIc41q5FTsnl8QXEIsNkUMFfa/Uvk7qPB7nt4IoPiGGuLxdR30UXyGWJoF/xqecQD
         YD2uP8ZIMbR9D9uqZxmm2CnbFSDNFNact4j2FOpuq+p/gJNm/F+IuGb+CCnbDs5dgG+E
         pEggVkrcdsdmBg34l6gHRqa4W+K35LgPKGWGKmG6dEBFE+/DRG9SqJBM5lsZTqkTQGjE
         2H9jLc+kUkZXXnwzIHm/uaaqNIGxTf1tNBfYY0oEmuWd5MxW9nNp9PLx0XZq12t2/7QX
         YjyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsGcQIXYxZ/qse6i/CTWL+uda8DRAAUUpKVLAhopgwLTNVqjncKj2kQ7t4P3sF9Cx93vR7HHLDGrHXcoN+@vger.kernel.org
X-Gm-Message-State: AOJu0YySI2b5MxGvGIeLXbpLDd8kmPIbrIl39bcAu9vj4aKTK/k0LVIt
	3WQanlD51zDWY7snn0+b/0p/R21LiLpu0AgYTl73d5SRu3FZepCeogoZsA9agca64MKu7DCtry2
	E1zw0cBfRQFl1RGu4lt/6ruHoDoBdTECY4tHFnwdiKw3qD7d8osW6o+Dn4ATIqWEu0iSL
X-Gm-Gg: ATEYQzxPQKC9Fna1RI0upxu4HB0Kj92eJVjq7crCe+nWux98KZ/c2LYoTzW6QIrjFQW
	KF0qU6X37TBrlCmx9Sg2gALvcJCEIzOpw5q0h1HW6DyHUCPxNLsBaM8YFgiPUPX2Nt+aCsWU9wa
	eMqBZp3sAfNI2oMUx2qaGRoh19z1nsCiJIZRHCU8Y0xXi78FW6lBtPAHRenndWK5xYXmWkEpxIg
	VGptMgHRA6GlqMJlxTiLh2/f4CWssLNH+TLTu+mjPm1Sn70BjSBs5p2eOg0Tv9G3Xr/c8HkCJsi
	z8GH+tjcpzaDA8YL2RaIA8ghPN8m9NVc8oAXr59TBCMbK7SEbQHne1Kzac9jZUHMucK+Gbw8PAk
	7+pBMe67URtqk0M12Q1cTvhnH2bpTbIh7nnPsxLrIkFX3ZsoTk6Q8N+U=
X-Received: by 2002:a17:903:1a4d:b0:2ae:48e9:8c89 with SMTP id d9443c01a7336-2aeae8d244amr21270955ad.48.1773225386552;
        Wed, 11 Mar 2026 03:36:26 -0700 (PDT)
X-Received: by 2002:a17:903:1a4d:b0:2ae:48e9:8c89 with SMTP id d9443c01a7336-2aeae8d244amr21270685ad.48.1773225386085;
        Wed, 11 Mar 2026 03:36:26 -0700 (PDT)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378a28sm21042925ad.88.2026.03.11.03.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:36:25 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: qcom: talos: Add clocks for QoS configuration
Date: Wed, 11 Mar 2026 16:05:48 +0530
Message-ID: <20260311103548.1823044-4-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
References: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Lju07mkoV0_L8Xtllav_ZKpW6HFGD-R1
X-Proofpoint-ORIG-GUID: Lju07mkoV0_L8Xtllav_ZKpW6HFGD-R1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4OCBTYWx0ZWRfX3d25pPhdqdYb
 oOMh60nAKx/FFhiMJSvZUTiw3x7YYmACFRrTBCKd42ACxI1AgAxuEMGQyAMO1kkYtGqt0SnCWLD
 gL7w3DB0T9IfozMYN+wT85xiyI7TJgwq3ThiA1cg1LRIBAMvmjLyy2e83u0DAw/UvG+eE1/f2yB
 A8O92qUS8vmFqISVR0Mp04mdOiB1iOL9zp8q/oKfgSQvARyrYmuN/gMCwBN9sIiY9HKgeOSvEbf
 Gz4gJcEYdZDtnX7T8IvUTDLulcTuPkRX8MGsGHDrP+92jfDxYxvP7WOgT/MCUmshklnqWa7BGj2
 h6EWMxk00OIIpSQGJxeCVnTqnAASKvdRIYqtsAwM/LNO1qcptj1GpJYZoHR9prkElai0nYjpv0s
 9LSHP5Yxc4y1djcdi5p2JFLG7GQA1BvTmkJehR4Ulw+nvj+JLmmMuofVz/gnDwUYYdcF2ufaMUo
 +CuzvloCi/d5GuH/IsA==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b145ab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7s_9-EB0MOrke_GCL94A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110088
X-Rspamd-Queue-Id: 860142627BE
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96954-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.25.240.160:email,qualcomm.com:dkim,qualcomm.com:email,0.26.140.224:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add clocks which need to be enabled for configuring QoS on
talos SoC.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index e0282a5f9a6a..73a7544d8283 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1237,6 +1237,10 @@ aggre1_noc: interconnect@1700000 {
 			compatible = "qcom,qcs615-aggre1-noc";
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB2_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
 		};
 
 		mmss_noc: interconnect@1740000 {
-- 
2.43.0


