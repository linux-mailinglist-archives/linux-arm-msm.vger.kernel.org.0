Return-Path: <linux-arm-msm+bounces-90297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMdzC/8fc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF67371858
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4D193025A7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14D83783B9;
	Fri, 23 Jan 2026 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpvohYU6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBEwpA/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0536CDFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152419; cv=none; b=FSqfiC1WaRvymrSHIDnCogPR6iw9ieLityoA/rKJUL4DDaCdpPLB6ipvgeabLEY3RA978gkI0nR8mcNFen4JJVEi/GyiAg0HutmLk4+6GC8i00FwMT7qmt8VgV98KPU5G+hcKg0fg8tXCtOf4GhUMMPXU6YB8qOwLLw/FjoIiyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152419; c=relaxed/simple;
	bh=f7FNunJy27Bi9U3lAb60MrlxQ4fA3xkjg9u2My+Z1rE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PepQqPpfPBhjffqBr2nOVhHJZe+NVUnOYMva3wRNeZm0kvJrtvoQTPtALjSMiB8kUkF2NHfavYomqqnzWHMmETt7Ug7TkAW16RtdeKVNbM5lBSllktpJPOwdIjceqU8slX+5gnr8AYe9ofo4+qyoN6ejlwlKs9Upg3BVRsIsrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpvohYU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBEwpA/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5MMtn3677765
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUtVi70WtEO24h85MpRTObjc+viksu9O5W7FRXPUnZA=; b=VpvohYU6CO9/2ggH
	uA1XRJMfL9iTm3HsXV3fy31a552i9bJ4j8wa4HPEvkRmN2p4U54myLftPDHfQGgK
	h9jXEEwVzMuCzaKPoBA/RWBZyx5A7zYKjM2Byz98SgDrCgPuGN3wYlLhETfbB0z8
	xHfEidKHA/SAQODUkFexJlVReZtlDYq0wdDH83HRU2zrxEZ15KwHVZMMbAScdOyZ
	oc2l1dIhqgPvFJyRAbKDW+yiQTNOWFoi+beCODTiE/px2GixUgEvoZyv1vYkYUS7
	ZN2sgJGh2jjAOw/Ymcb4KwtrvHBsHAkycdMm60bMPQQW76DnczXMoBSdgaIkwaP4
	ztVUIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp2epm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c213419f5so1271613a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152390; x=1769757190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUtVi70WtEO24h85MpRTObjc+viksu9O5W7FRXPUnZA=;
        b=EBEwpA/i/oZVgP5lmY6JuJK8Im4BeTFwVjndaknmDr2VX5vIe/HPSS9e6BKUz1aE4a
         msALQJtiPI3k4BUR6AjgUIBkmF9+wX0s4yg+ZbS/QpwXue0y/sUZQZsWkl5lsvom1dDo
         NavScK3pn31YMwAZlnuPkjWY9jDpC5eVP720UItBJoPPIQC980XZdMf61ULZLQ2yesNg
         /5HvGShocWNZFy26QPv/Xw4pUq2/4ZTABsQlrfZ1WMN3+f5//QoeHe0uuIRlTJDWDNcH
         xSPNsDV5wVbpgwqtMzlyEp0o2PzapG6hy5wLW+T1SmNOp3fCHhyLr8bpqU2Bwc/elNGu
         tzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152390; x=1769757190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUtVi70WtEO24h85MpRTObjc+viksu9O5W7FRXPUnZA=;
        b=A2eRAPTy5mEYQlT6+sk52wyXgK8Ev5+VeUapbrUfZnCpbM/HOWnmxaMhfcj8ZI4pMk
         Z/0F+LrpTY/UO3wWS+amBzALEm8m8gFUCrAuocv0izSwOnOEOQN3GFV118E9PQD3xHt+
         zQvUx+132E/m32va41oPAbw2cXEzxqjLDx4Dazw91FbwpJECg310PrsdNJ/QFuFmeJMP
         6+nTFPLHTisNj74Afb9GW3EQkeEbP/lnrhmD2XqdpQshA1txl5DPYiOTcGj1wyiUpdR4
         4ES5URGtsHd+8iLOqfGDV1kqWwyv79i2NPJlQ7cEA87SRt4P1Qy83M/zpDxvyhcDJHso
         QnLg==
X-Forwarded-Encrypted: i=1; AJvYcCUj4rKgBjbP2KeGZpsuRISGNEwyiQ+DFBgZSGmNM6WkbsK/xR95WazNB2hf/lxLzYvrXy4nRvPpjZTJoUM3@vger.kernel.org
X-Gm-Message-State: AOJu0YxkugpFkwcrIHlFk/dvVbkHSzNrVqicnyk1RT7Bcb9ll3misoVO
	Cgs3eZYG4p8XjZFe0VLAbGkJm//DX7EEIOI4dtEWEG1a8qSVgdhgbL23duyiLENcQ3ha6GOXg1X
	G4oFLd6/JyHhFgT6CYAuQdhf5wznYqi5bnybo6fa+fhxWi4PNyqgT5NLsflcr5/fLBcMC
X-Gm-Gg: AZuq6aLjk8GCI94aFHuxfbfHfGH/0j6CPCWyfC1nXuO/jDceljwpqRdMzKnIc5MTVY+
	hgJARJ492dlNQcPt8GTt9KoYBPJ+OMWAmMNPzt9OFgyVlopt6G25xrDZXVupzGWSyaHNSGAoI2+
	ThDUWOJXBKNZFe9s+CdZYanXCnDCfx62JS9+l5K0DxzCLbVcTTLbjb42sGafPcr1rjTaxIB/0eo
	XIhmMDACYKibFD+a54MEYkeoa0buOYYJTZvGJECgQV1zakPCuGnHUyBiUGB46GzrKYK7LN33IK5
	d/v6Y7gQc5ZdlllF7oRwvEkBzl0iSybTrQWLd6izEvD18nsmLNhLTW9atuMmFfhAV4otRRwZb3p
	cuC4Y2pMUr5xeWz+Nqt5hOUfi9JmFh2hTyBk=
X-Received: by 2002:a17:902:e842:b0:2a0:9402:2175 with SMTP id d9443c01a7336-2a7fe598dd9mr19755935ad.27.1769152389570;
        Thu, 22 Jan 2026 23:13:09 -0800 (PST)
X-Received: by 2002:a17:902:e842:b0:2a0:9402:2175 with SMTP id d9443c01a7336-2a7fe598dd9mr19755695ad.27.1769152389040;
        Thu, 22 Jan 2026 23:13:09 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:08 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:30 +0530
Subject: [PATCH 06/11] arm64: dts: qcom: kodiak: Add power-domain and iface
 clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-6-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=1235;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=f7FNunJy27Bi9U3lAb60MrlxQ4fA3xkjg9u2My+Z1rE=;
 b=pV7X6A3t7dEsEi54Ci06JmVtvliafYQjZY9hYjrHA2Rzssx/7ruPaAKaCvaeLT2sA/Xbme23V
 bzbeHRmv00ICJIJoppHTDgbIbgInKm7VEeEA5JCyVFaBlqbA7zc+SX4
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=69731f86 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: y3DtQIc8VAnOFUUvGOyw3PaCe75l8_YX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX29UjV41tO1gF
 tuZeCOqXBNRh3gKA8fRc6PBNIoN8iHyiBWpBnhX2V1dPKKZfsLJcRnCDb2udXbgRXmi5wL1JNDa
 +NJ2TLM56q7Z0OsWDlD3R9ywL/VIJYfWvUOpKuzUrReqq4aWnenJTQeqLi7W3NQyyfAuzGgR2iJ
 Zg3bL69HFNeibRRpvupX64VmWP+1bf+p0aIgUK01T4Cxy3w7iUggJzoxTwL0mR59z6Fe57y7VU9
 VSZDvZ3BerjBBMRVFSJ4CjyUj5ZM5gZ4MDyc+T6Hk9ix6JZDKUdZYC6/S+OTA4g4ujQfdj2QiNm
 b0VxBIGdomTj4/Hx+dgBC+Nppb+KV92O/Mgj+KkB+YE1DrE5Sw6vUqcQdBL2U+Fq1LGvb1WwMq4
 wNVK+bqaURuODiGO/cWA4NGyduV01v7BbG9PQVdUMlC/5BOQqqhuTv6Sj08Qvks4yx0EH7eJC0z
 RVJ0RmU7biyVDQ1Dpfw==
X-Proofpoint-GUID: y3DtQIc8VAnOFUUvGOyw3PaCe75l8_YX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90297-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,1d88000:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF67371858
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and 'core' and 'iface' clocks in the ICE node
for kodiak.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f478c5e1d2d5..8f2bda7af74c 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2574,7 +2574,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


