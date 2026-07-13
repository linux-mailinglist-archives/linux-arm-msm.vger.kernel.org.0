Return-Path: <linux-arm-msm+bounces-118680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ty+5GqKfVGp8oQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:19:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4DB748965
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:19:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dDfa16sQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PPTxl5Fk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118680-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118680-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE069303DD64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370273B19C6;
	Mon, 13 Jul 2026 08:17:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B63B19B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930645; cv=none; b=KNNCod/Pte33VtfOfSaTFFtAiAsDZjkpt19qOctcD29Pnnrxt6xM0RaI4wFv+vkjwWuKJ++OyfA+QxTj0bf++qKXmVIBVGZF9CDJopio9osyN0iKlfB4n7cV5XlDUidM0L2uEq0QQLp4GLXRoaiKlphpbIlg738dwlOPdHGVrQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930645; c=relaxed/simple;
	bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyTzG19D2jkiZuFNhsaNWwEvadffL5IbV38tpUHkwKxM6vgu7eS9hjkyA+0vLfjSKG2A2gUDBrb1Csvwi1LJZL4H/x96GavWWjZL5x8IJEl9GidOXpSzig61vCVH0NCP6n8HEq4JA4Qd0TWdXr2nc72recYch2SuQzcYK+IzIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDfa16sQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPTxl5Fk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NluT668676
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=; b=dDfa16sQG3zovPs7
	EYRtdAhDT3TDREkG8qZ58wj+gptstuXG2ONEzXLsynO4+JGzzdbW0Vti/oYdoUX4
	SzAbLY2XMt1v09ove0cPSLxnHiMdQfnatC8fTIfxHJe2g++F534vDZkcjdYHMKPu
	2WOc2okgloZlY1W6UR63/pPJs6zzlmRZJPtQNhQbCGG3CvWTIdUaCvt0i65pSxaf
	CXf25/yQvrnOI0ZMlbYxWfBNHqZkAluBDAAwK2qN+2WPIHl+JBouOCXBbKkwbjLu
	NAyqMNs91cEIxZ3528qMy7p30Ez1vsol0a7dvAEyondVUQThS2vbSUmyPJkFbctB
	cKJ22Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1kx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso2209352b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930642; x=1784535442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=PPTxl5FkkIOnPwa3cLXpeMZ/aBWUPEOcdH4N2vXf3llZ3mOZNszZeulpr+RBLlsgl3
         FD1dS446trMmVNOOPa4/7zcnSTGmVaT3LbBH3cfoWHVwpNqxzTUpYZi74GwRBLJduafX
         O9R2inElwotYiKuJwlkTB3RGaqKRnGCkvt/7oEWbv10vJbeFplGiveKYDOxHf9rb0vLD
         O678deyQQ/Td1lfEn8xcUklHLLX0dJqZufwGpl+OwK0VoRy7khaL3fycNMat4a/AaMU2
         jMOf7PlQp+Dx7mT9yMizn5tjNKbcD3XeqPCeUJBT6vejqqzotTqEsRizgZhAz4uqA3Io
         HCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930642; x=1784535442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=FG3Mit9+yyZhdY3KXcgDpUTaqZwjJe+Kql74SsucG3W72e3J0ZnlCVFeWpDUNHAaFW
         9DySVVqLWKKkIwIzyRwE5pRj6mCVi1Oj0cFFCl9XiC5ZC8BGcB21n4JKmQ85xY+1GaU1
         i9J+Nox9T14AaRcXzjAMxbPTUiBMLnA0is+qvnJ0bMTRiVwogwMAN1TgU5XQIWh8+eXf
         on+qJ045h7cqemwqBtiSJKC0J6OJ0ldL+odVtHXLC0i7kwJ2fkz7h8Vn8HDZmN+pmZhh
         gIthABkmUte0wxw2tIvFvEyMWWMNyNDNI/fElxQD7/J/+UbSBQcJXRMntkUKn3fcqDJK
         4r3Q==
X-Gm-Message-State: AOJu0YzeYB2anCkXn5un/MHqy1e2tms41eJ7j1sGqGCTtoV2tJGc0fNO
	dJT+oL0csp70YDmOWSVgZn0jLajEIw/bWuNjLzwct3ruL4JnK+Y85kD3hk5yeBkWcjusc918ssZ
	JMhH/QMUYFUu7/d6e6rbDfAoS6gubDowRVkLzG+jcZlgI6DNOuPjqhkQgFQJaD0jIPQ28mfSve3
	ZS
X-Gm-Gg: AfdE7cnpqbGiNsP+x3WabpVtlNU0YzW3W1uRCKdRvTbM4msxcNiRxj2GGfXS0Pm8ND+
	k3erCVMpvX6YEboSZsOVeDLvISaGqjVBbVrzqUppLP8D81DUG10j36h5zmbABDdd4a3cpEIafG7
	/moeEA6mRazOzlWIhGXprzrJOEO1LAdUl/JmRAyqQQFF3jpKg3FlHo5+WXOdD6WPwQyJGD6QzTg
	rY8reBls/BTGT1rooLR6yzy4+rayeVU1tCvTFytbb5dChNDN9wAJZ495sq8KX8wJKeVlBl5zOO0
	bJWrGRTC+JP5ds+cVzEjl2CKG2F93jPjNhzt3Y4I2NsDKX2xsGSmSMvoAMW/kopubR8iczVjNVp
	eq9sUNslQfPFO5m8BdmFk0BONf3uAT0v2jBo2S59+
X-Received: by 2002:a05:6a00:234b:b0:848:2f74:1d61 with SMTP id d2e1a72fcca58-84889736717mr7658911b3a.71.1783930642597;
        Mon, 13 Jul 2026 01:17:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:234b:b0:848:2f74:1d61 with SMTP id d2e1a72fcca58-84889736717mr7658887b3a.71.1783930642088;
        Mon, 13 Jul 2026 01:17:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:21 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:46:56 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=1012;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
 b=xuvVkF8oex7JpzIrIfnTWJvaEVZ4HRG2/Ubb7jjSlAoTWkgJr3VcSjpUwZvJDyFaDYhwDnl1J
 1iBKxsSOcaOASKhehcXtGVi4j2mdp/C0StsVJ/SncgCp+LVBpFnaJxz
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: JjZ9T_GIihxoUndmgMTllTsEU1X_Q43W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXzcpaaot38jHS
 7BnRraUup9UVWt5udT9gaZ+K+rBKtBBxbvcxHs6yZkhYAiWNPsfBAMkLEnUexIik4sjYAehREjW
 hXG5/DyOvVH66f0HTQHa9DWmKYOfTAISCUbl6LAfZTewBhr0VnZycYXzgnmOyETeTk9n7fK5daI
 FoGKpmY3nrjlJed5cFg4xVb0sH1D0HbLXhpDMQeCwi/yftemoZQRWr+D3c3yWPt35LLTVzpt2xD
 E/UswSvacqEwiPSpd7KWEbYoTJ2tVTQs5dsk61soQdC5RhylFuaZSoomoCblLENTBcS/sPuH2hl
 o1jGwFD+6C8rPVptarKcxpTGfEIerBy7c9uW9iNvh+RCZpU6n4ynVjjgkdkq1DOdUggg8w6C//o
 HkMKOsRYSxEglCrRuovnnmSi9GLZOXXW3EuRnK0AteSKT/GQjLZODi0eIKrLkUpRoKt//L9/0gk
 oWfwWFfe3csp55H+AfA==
X-Proofpoint-GUID: JjZ9T_GIihxoUndmgMTllTsEU1X_Q43W
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a549f13 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX+h8O/KBCAwbc
 9zUyOiu2wGYtbARtBkAXoZ2cYJLFwpBI41mjjzQS75lp+2ZS9fesOAUlg1GtG9KYh8169Sb4jT8
 Qxx+hZcOuA9NT/AFaTFucYzOkAGiXmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118680-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E4DB748965

A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
stats like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level
LPM stats along with SoC level LPM stats. Change it.

Keep "qcom,rpm-stats" as fallback compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1


