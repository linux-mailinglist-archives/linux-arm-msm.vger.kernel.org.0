Return-Path: <linux-arm-msm+bounces-115891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5ciFfg0RmogLwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E91ED6F588E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="K1F9/nKw";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RATJxZU0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115891-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115891-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 598BB300D363
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D3648AE15;
	Thu,  2 Jul 2026 09:41:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C3248097B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:41:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985273; cv=none; b=GUpxz2c/VB9bwjxTkPh1dxYib8FdWau2zHPAso6y4Hd1WbKvVZ+268Wr02tt/nUtGhVGEqQjxr08L9zhpjw38niu8jD587Wpd8+G3l08Z27vw46Uiya9+rncDAI470md+nWgLRF27YLW2M0F5t0gqX3Zlzhw0edxqE/hglBorGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985273; c=relaxed/simple;
	bh=x7+Fsm5Jk2Yz0bMc4s75zpL4JuFOmFGRBBISbD+XDQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mho0bhT0W7NB5qd3GN7RQHdh19rDMd23HpA0dVpTNg3xBHQ6hv7Cb9hl9nE3A8hCF4418fBDY57asqmgEQ8zy8j589VmiUg28vLuEbT27aSsD/H2VRkHcxdq4jPC4BO3Ky9KN4YkRuk1NqYkDQ2Sd0Kt2aLn39HIdwhFDEYZOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1F9/nKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RATJxZU0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242ss13460369
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YB44qVUGLtg
	M3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=; b=K1F9/nKwWP/zmKDureaxoU3xhq4
	j3XplbNjcgJ8X5CxVO+qPNAXxkVqbDOiHUE+l6wUS4UV3z4znEw+BOmA5vh+4x92
	r6+Ao+DETqKutNabrOQHHo2MoTWz28fnL1GBVwW4GzyGeKaVW/Vw7soU6fxFGcpe
	gmo5YTz6xPuxLO5L1JXCeyfIRcmSNeC+033gKFVOIWOVpU9Fykgd6bvK1UtSf1B/
	A8Okj6mJ1Wm35rIH7qjn6SaLuFaOWLu2/gP8xareMNEO980mv96KEqdGrmWffOqZ
	jrllmHhQE+TfMcM8FmTPElP+bKmBSGiIInG7TbQRg9NNX3Jvt8eVoMMpE8Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb16n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:41:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso2218949a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985270; x=1783590070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=RATJxZU0sGV/8b6hvLYzpSdb2I5HKj0ruwLpzyL7IMfOTliMqgcQN5CQUwmY2r3yxc
         kjsMlwbGxMoqjblyOCh+nfg4k04Pwyorhq6uY7WjzuDMRyXqLsbvhivj5FKHw5iKTYRf
         6+RU8L4BNujfx+wb5XRRSe6p2poG/mr/6nCzXsJPDeHajHMDvL9qte+CLi5Bh89TeJUw
         kRhNm2CUqryqsSqF4/fIz+ZlIQqHz7Kn1phhs31MRw/ERKlDYWQqDuOnxhwubOm2K9z5
         o8DRqc2i2rEZJOePmYHncOjNBWtNq7EJQvQZ/W5xqiT8sM282KvRqtuu8B5EJnAtKCga
         8BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985270; x=1783590070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=XoyhUn40VzjfQ843Atwm/UAWBmoCaLgz978qcCRwRA77KCLvth03i83UVtC7CvpbF7
         PAVxdF1aUkkLiM34+K8lsT6GT+E2vxBMc8aNbLBAbPjt948pwy/Cxg0pl2JiB7rm3wiN
         H2n+ODIyxLjxpnJl+naUPeC70UUcYZEB9SyDs/9d9fORleIxCqU7KdqVQtJJC8Rnm/lg
         0IRpKI4hmBBPTCSgvHeH7rXtbmNwBo5NfSaEHCYfTBW/0RqXMIMqtvYImmJH6vDtq0KO
         q9lmqa124ynKNiZyW50r/7a66088Fmbu6mBf1ltIStGOQ8MHofScdMtlaaz0v6P0jF+Q
         Wx7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/HuBDrxTAzL5wxJ1/kcEt2VUZrLrpyVSkksAq5lMU5AeEJsncffBJTvcdT2qEAw752zsR4uXvSKIi0i3o@vger.kernel.org
X-Gm-Message-State: AOJu0YzSl4XlL0BnJpZq5EorVEKRf8F4xbZjEl2S2dCvkInGozJ9fNFP
	u+jA5GzC0m6Ne+maSnOsk30uxAAODxmHl2AVxE0dOidP4Fy3VIuSUQkRL54Fq9iUBECXYnGls2t
	2P6QnYFiu5kYH8Ee4DdOUnmBaMhOA666qHK1U1CHg6Va9zgu7DD7fOYO38sh4eotvx+2d
X-Gm-Gg: AfdE7cmhAYel1hnNQ8fSu6cTEeRzeFJj6EX3zdFqtQUyIK+84PCtL7ch84OrhMdpAkb
	cK0EJGoQiurVXF5elBSS/FCghVTeaaNHD+4vX5ghePBJ8Kho+WnV+ZkXh9GEOup6/smAluYQ7yY
	9x1uSkCaN8JO8lYbQV7qCOlEfP2RDKZpajuUcUvmEJpdBoQvSiKeXZ4+GTJJZwxgSlD0DLGACzC
	JMCeL4kYFvPzj/1JgbXBUIiM+9TXNu/X0aNCLUMbKo3Ey5so79pS9TGoLAvNL77XiZFVCChEZSD
	e18V63OLvMP29J83tTwA+wPIKlM18IwVT3xtD81NPIHCoM47cRykyGf9SQ16DLRLvVSsBsrf9oO
	YB4xyCMqTXl/iOQeIpnTa6iHIeK6HP2rlUha/kA==
X-Received: by 2002:a05:6a00:13a6:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-847c0753fc0mr5388132b3a.3.1782985269902;
        Thu, 02 Jul 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a6:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-847c0753fc0mr5388103b3a.3.1782985269420;
        Thu, 02 Jul 2026 02:41:09 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:09 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH V2 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card
Date: Thu,  2 Jul 2026 15:10:53 +0530
Message-Id: <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PzxjnsrFie36c9ESXykJpDCkmSq1xL98
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfXyYqEDk6ozCn3
 V7CqH7FglTlGg9eQD7GMpySYrRvQq7rbfJxWGEQdEUtzBq0F/fxVHTUOTR5TNOqm4Q/ReTQu2N9
 SLEFRezqOZ7j5Kk1QD/ojaI1OkDfMho=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a463236 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RbnQZSTpM6gPS1NYG1gA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfX0RrFbNe9LlQp
 zfVcHSUdiq1Rx5igUm9gjkISTqBDBTNxGEQ2YWLL5tJcKMbAsZuKr6xIM93jdzl9b0jcPyje8fU
 aYDBCKEk2kmOMpbgEREWKnerJFoj8Fbh9ahYYAk3s+lhr22gNOOY7/ppqZYE8dOmviRuWJPULR1
 XI+76T8rPgwSqZ63W04WCm6HfFYOwWB2tHw0EoJWPWtELlCBsBlMLt5Soxo2Oz0QHN4hWuWtPPE
 yojjAR5+39OOK4v9+LkZTcet4GuNFgt5SXg+0x/uKBF6/Wme9UgI52SpbHJNSjhmZ4eLeaPUxpW
 5yFQw9ho10wD69ESwCj48bo6fBLfDWSZcGAqMdcdd88AiOt8TrKWuuDpF3ihvXU8NYzob8Dt9Y1
 jM3i9Oj4Afhm1zxaB3ah3liXGo3W29LEDx5STEZNUTr6NAOtkZLj0IjROcyy/j6Xe5NefXkZNtw
 dPvy+qw9Nyjypx7Sv+g==
X-Proofpoint-ORIG-GUID: PzxjnsrFie36c9ESXykJpDCkmSq1xL98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-115891-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E91ED6F588E

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

SD cards may need 1.8v VDDIO also to be supported, to accommodate this
requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
supplies to VDDIO pin of SD card.

NOTE - Since this SD card is the only client on this regulator, this
change should not have any side effect on any other clients.
moreover, SD card driver takes care to explicitly vote for the
regulator voltage based on the SD card detection sequence.

Also for stable operation of the SD card increase VDD voltage
supplied by `vreg_l9b_e0` to 2.96v.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..af6f42cdd39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -228,7 +228,7 @@ vreg_l1b_e0_1p8: ldo1 {
 
 		vreg_l2b_e0_2p9: ldo2 {
 			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
+			regulator-min-microvolt = <1804000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -247,10 +247,10 @@ vreg_l8b_e0_1p50: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
+		vreg_l9b_e0_2p9: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1


