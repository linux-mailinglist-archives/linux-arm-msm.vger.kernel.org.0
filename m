Return-Path: <linux-arm-msm+bounces-93702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLboIPllnGmsFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:36:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E91781F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DED73006D41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0D7288C3D;
	Mon, 23 Feb 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr675qJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCabLsxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3313790B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857396; cv=none; b=WwmyJb0RFvMHNVmEuEsQxFMTikgS9VcprFn6k3X0Vz/L4Z103xW8/JqNEjDwXU2poSqed6jA7lOmaDFlGQDAPL3nGy7Y2BtcjfVqkf/weFsSMr77hpALXj8FGRSjMNSFuL/10qbKd4wHBNKWECD3L3XneJODcVarbgTzWQlq04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857396; c=relaxed/simple;
	bh=Il4FsebIevq857HV/Y/Ji6J73TMdwItdXhKlXY65t3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sb+lw2U7wz+BMTX1YRpgkgec/fki93I+sdaKhnsIW+ZFGrWq0w+0KRe+uQP8x8FWX8e8ryTxW8jeJ0ONhGlTSQHAcV8B3BHcrr/JZOL1w5+yno509lhEvow1N5JifvoX6MWvAGNoHLD1dBbHKT1BzjTmv63N/hUEoMtVr7s8j5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cr675qJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCabLsxz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYeNx322227
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MgXSMhrrCRCZJBYKUWWv4KgkIerWuKuxEmI
	ZZn21oQA=; b=cr675qJ7+9vwqMWWp9I/TgckaUEZD5j4LVFOqINDAEp7hEWLZ0Z
	ZNM0x6GxA56r2xGQkvAYvOGZjbR1Ro5OGeNA5n7slzVpDChFqRjQ/pyGUUP3lyox
	1UbBGj5gDADzX5jwH/MU64wp8pSE7Zt+6RawL26hSW0jl6ET4/f37mMzRzreLhfE
	F6Kweib/jRhqnch5RQKzP0f0EQ6ops2S4BNLqQBG6sBf73idtvByAOwwyz+27R7G
	EpEUz93irKRKTfeCuW1l1NGQDzpQ96W+4kFPYW6rIltGhxxWb8O41dgr172gYMyI
	Kf8jrbrm1+2JExnC1eIbGDLKMRjSNPNE8vQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0mxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:36:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso619811385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771857394; x=1772462194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgXSMhrrCRCZJBYKUWWv4KgkIerWuKuxEmIZZn21oQA=;
        b=ZCabLsxz2zOXYksJ4NGOLud4yJmDkFqWyuldgLUKbXO41SaWmL39Jp2iKLKNi988hT
         mssjxDWOI9ZdMuq3xlNbuvKzW3mF0zc18gj/Dj3+qNtfQot+rtjiMjRu+cMdJUilLStg
         3Zk4+bJOPjMT5yd84ergcnM6vCfq9jAKc9SBvX+EFBGJdpDgFUJX+A8tEqcCraVnO13F
         WOZg2rtq8aFktxNvZHnajECYZKJ51e7KPFT1sqN1VoRhq+dyg6sTDqgwBZ5ujrfItg4o
         6wdMe9TbM5ellpl88YO6XhA9YJpQFKOQPvUoWdZgZpebU8kAvcfbPSFL+hHIxcHOJBYe
         pUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857394; x=1772462194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgXSMhrrCRCZJBYKUWWv4KgkIerWuKuxEmIZZn21oQA=;
        b=f/lK4Mq61NhLOvlzsi9wgssY4NHjOsIBJK2+M90sbM0jMJoc4CjkeVJW6t0e++S32e
         B/VBad10s5ZS16GpSBxevbmfkPUHwINkwwK1Qzeg1FP2e8uBhohXozHx5KpkzImYAlt2
         fUbiv2J+/aEb41/QcAbinY1xzSBi28jRJzmU5W4rxJHy3skdXWcaC+mdf6g7aijefggK
         pPnL2TH9jO6XxsmpdzS+VLY7bx0kFDd8HxMYydXVgTGnHCiGO+JF5iZqXQHsZ8nlSIp0
         8d4kyHZM5HGYZiKqGfdBljuuazrdqX72DA4BhJo8cWwDtf9Rwd6zZH/JdX5Wz0xQTXei
         xrog==
X-Forwarded-Encrypted: i=1; AJvYcCUsYVr8YWjFVwAFYiG2pRvCSk1HlCX0w8T9sJf6akk+sm75cIkb55Hg1q7v4jYA5ze8yEb0xP4jmjhvVkGF@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQOilL7VOG3P5cwife3O4/Zn43xB31wuZ23tbTLw4+s8155CM
	3xmilHSDgc57QRgiJhNKvRYDuFFT7hQCr8hB5UajnJelW5Xk4vlfw5ak+E7oHMLeqDTTG6KiqxI
	FqzJt3s//1jGOGenIhASkziz72qTchlTnc7qXBqQMflnV+MsUZvdz++4Hw98dhym3QmjD
X-Gm-Gg: AZuq6aLly5hDcKmdaf8ymvUaajJ1bnaAwAbnM6Lc1Oaivd12PpJIqZvNFKx0ZnLhFuO
	lyWtjXmXMixUqVYNZcPb9RxGb+W1dmKkLMPhvJ9QJXbaIltdw3EVVg9/JRG33olfFyncTzWospJ
	zhBNLgNu73S0G6SJE2cWb7YIk3bP6oRSYpOwOjkbnm4Es1Z/AFhcIHyVuAx7jzZSHLK7LENJDfC
	gSWKDV+icuNCXD3gG1+qaKrSnFmgoatLrYTOuuV0iMyM3NATO952FGtBHUwixFs8U08ZQrhbupW
	nWFbw+AqNoM//XwKfOu9xZao05hnK9HfcwYOaRmNkO+81tgG0ntS+ou3gfWkcoGqkfEKZT5Mmtv
	G4orE4MoKohXnSeqRP8o1Q/eDZaIfYMlwas79VA==
X-Received: by 2002:a05:620a:4416:b0:8ca:2baa:767 with SMTP id af79cd13be357-8cb8c9cfdf3mr951471085a.10.1771857394065;
        Mon, 23 Feb 2026 06:36:34 -0800 (PST)
X-Received: by 2002:a05:620a:4416:b0:8ca:2baa:767 with SMTP id af79cd13be357-8cb8c9cfdf3mr951466385a.10.1771857393505;
        Mon, 23 Feb 2026 06:36:33 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a430927dsm113205645e9.31.2026.02.23.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:36:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: talos: Add missing GCC clock-names
Date: Mon, 23 Feb 2026 15:36:25 +0100
Message-ID: <20260223143624.118271-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=822; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Il4FsebIevq857HV/Y/Ji6J73TMdwItdXhKlXY65t3Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnGXoXSWqLqIHgvATo9Iv99d3B2tXUZjUM/VEQ
 eIBDtn71OaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZxl6AAKCRDBN2bmhouD
 11IKD/9QgCuiFmTi4KjSVSYOE8WELnH3bGQCo/f5DKWkiDIn40TVkCKez/T6B1YBlDOLKG8k1vS
 OVX9eOrOhNG5cBxTs94Q9IHQzGrooqJMrEo3XwoIiRts64tpkVF6e0W+tEqom2XZsmSHJxjlfb2
 1WdXfAFT8XrzkX4hpmdhwbuUSu+VydVpxcog/dhKrpvfBZTWccfl8r/2Zbo03f7fC21JBGKYTti
 C60RQMI+NoJNz5IlQIEPuv+2fBtdAdtY83OnglXcUQ6eqC3f9rm2Z6KA7YmAIlFOIkNIi/PLgBw
 asJDO/5tAMRVbubkAsrRFbonAe845Fawy4mfZfStFx8Gt6PAmfrh5FslUEp4rn0fLYcs2onnHSu
 0fcM0jW94uFCv2sTS85R6nnE7xyos/AyTUUjX4BSeyJslaQJk1PZ0jfKoYubZDHHO13dfo4/jsU
 xSKkxGIo62vNaI7u9R96JpN6db8t80P01rppFybXamNUUK0hexDMG9HzmdpF1Gr9zAnByB0Hqdo
 NZozLMGa0eXyzBseV0Bw+wlfLfk6T96IMkG49LGM0f/WkAGTzHvAVBnd8D4FrqbwB2jY2PMZMZT
 Z3VUiQK3haAM0h4vwShyVTvlLWhxWJIYHDuNJOZmsKNzNDxLnNrGtGvdmlc6InvlksxcOxwkBD0 ne+hrtheizMxSxA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNSBTYWx0ZWRfX+FXb4ZnrTe4x
 /EF/FNBzf0Jo0cVqsPAAefVBWPtcoXAjN6+QqlJMLFI4r+PJZgHnzGinCduqz7RjYHWwZhXtIJu
 OJ4TGlSoyrmsskHTP7h/HEuO47O0nyaxiEOD8Sg25ile436yx4xkroaH6Y+oIB+x/H1gKAytJi8
 gXumaiJcRvMBvST8Q715Tv/XIGfbCZoKFo30H0wR28qSicxPXe55/Lu4w0zvqop6CAo9yVYpvDo
 Nr3f9kXSIRyzzmXQ67TBpSiCEkIaNEgNXF3J/ZFHwp3lEs4RMDirbfghIGoT4bH46spottws6nN
 wKtQDv5SIigZXiKYj2uNWqkRUbGzryvX5OrOagGBIvEKtWIEKd0pav40nicOc1x4D/Ff28cmIaI
 l/5Ka7ZBMqp9udPpF2dtHFRCTAE390ihWcoOpQMlFu1hWds7ZUgx54g+G2wEzKzbFR3XptqQnFU
 K17ao7T0LWTrpFep/pg==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c65f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rdsAYT6zl-_aBAKPf6YA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6PBFQf9ohK-l1MosELrZANHTpVSz2sRF
X-Proofpoint-ORIG-GUID: 6PBFQf9ohK-l1MosELrZANHTpVSz2sRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93702-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.1.134.160:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B03E91781F8
X-Rspamd-Action: no action

The GCC binding (thus ABI) requires clock-names:

  qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..6dab0d5dcbb8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -666,6 +666,9 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
 
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.51.0


