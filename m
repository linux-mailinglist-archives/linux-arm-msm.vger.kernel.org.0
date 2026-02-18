Return-Path: <linux-arm-msm+bounces-93305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNJ1ENn1lWn1XQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:24:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61D158400
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 441D2300D957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BAA32ED55;
	Wed, 18 Feb 2026 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6rHdBk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IOJoKwJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B32F744C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435476; cv=none; b=ns6gt/FEXumSwBLufLYc9WVbYo29Q2l2eqrW0WkDpH/UdeLOzF2Rb4bvoiUbXiW8dBnrYzv9fhuk28vwoGw4h8gIXzmGrJBB1u/dRet+TcMoo863SdIJ0m3XXwQgOcdw/C7cYL2RQlHh4YdUPDAUqLp6O7Qh8ppEf9PVJqaWr30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435476; c=relaxed/simple;
	bh=F7FYa6dkNAeFFFpfsiwVzet8rCbZBVa/OJOEhX7XvNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SH/1sBHN/Xnf+ffdUttlJ2ZZ6gQ80rN3p3kzAcNe03N4facvqBIb9s4TR2V0vaYE9+YYk7hXjFLFZ+VkSSlheVLjA0Xi9T2AvaCfxj/gNqej5kQ9tSpftssKFYu1P2nzfoAKRhJ/hwKPm/aLNa0gSbrTlo9nojQxYJu9w7lPRok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6rHdBk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IOJoKwJ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IFxl7U421978
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QfPljmnYQK+k8T83/MZ4r8gFZfXvrXvVQ5pnl6Z0IfM=; b=l6rHdBk07vqeqd1s
	A6KmIXSuxEJtyKzQuf17T50XTxJPvtET5qRKoesSIx/fu7gj+JbUCFgcugtvwFTS
	SChLz0+U537vmNOOkxVzFTVrfGN7fYgux1qEFOJV+FCnLYgYJbpHSkdx7QHdUsHd
	LAShTqtRHu6I4r7cDwBVVO5b9IJIAhQlk9cYjOTJdrVJ1/e6Bg7CHSPJW8Aek2yV
	CrSOdFshgF7bKHtaXpbgkT0raH71ardpJMjKOt/MwuPbb0L/zrC/F8lP3O1EeukH
	SS2sCwmxLl44gqd8teDkQPOPclOejRmHivOcYvEmm2leT+nlauGYQf4QJuPwccyn
	IZr6Mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e1v6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a2eb984so57318185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771435473; x=1772040273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfPljmnYQK+k8T83/MZ4r8gFZfXvrXvVQ5pnl6Z0IfM=;
        b=IOJoKwJ8U1jJr1oATxJXaUsB6ONxs9xldO6B+ii9OqwCMfzcu38n2wEbgWznifHc97
         BEZ52VCG7Rks9LH84JYXANpFJiQeTX/O3xuPn0o/IDwNy+8DAxaGGH6ivJisWxveBSPV
         6duWGY7aSC44uJ2ZnBgtZlXuYzclnGlYC2Kx4RXx9sLqn2S3X/tfx91OyU+1s62YQwVn
         xzRYficMbeuSgDomKxFHbX/F39cidINoN4q3oeqiNPpClm8GP62WMXlNAJpPunpBnpWD
         Bm26UxcYPFeTC0hjtF2837Xj6BVU5SeQ/dMU+flnDVZ1nR26+wBleINDr/5KCoStvFz5
         p/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435473; x=1772040273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfPljmnYQK+k8T83/MZ4r8gFZfXvrXvVQ5pnl6Z0IfM=;
        b=c7SCnGKwdTjMz5xX+iD1MATIN3FXp64nodf+NPakvZmt+KoSiFIi7XTiN2eeHi2YHL
         u2ExI+gHBWdRkkvVfR9009iCh/VslXHAgBUfQSaxMAUbd0DVxI9N5fPmWAcKKWLqtgt5
         XcbTgxIRaeybLJWVglKnh/Qibt1fO+pj86UUpBVVCL9+eGRdOQEe43GM1S2pYyPte1xn
         UUE/TeY5LO0ewdO51ofF1vTXWtVQcYr2arC8Eb1j0BolyY+iY+rFr1oeOU5FQsEEtbd6
         sxJSfPw+GgqpZnDxR4TKM8nTZp8kcFoGhBCooTWw/UW3jc3uxcpkJspcES5jSBmtWpzb
         Fd2w==
X-Gm-Message-State: AOJu0YyjEMzvoxivlONFQVCVVjllENu9lNLP+g6/WZlH+8LdwPlnUDVi
	CFW3HD+T1IfXnfb71d+LuJM67d7zExRRdGSdNNIbjHVC+wOpe9+4HTFZe2BXov0ZK0/KtEbU8hF
	W4BJm1xtrE/hJXcr2Z+/rz0nDArV5edi53q60UKh9+rJMH2RNsAooFwZC4Gy6jGtlOKA6
X-Gm-Gg: AZuq6aIme5CisJoYsIXh1w3RrHdU3sEalrV9eaBzAdWW+mkMZeW32MTM+5dWW+AJoDf
	WIsKZyBe7Ra+5pOavQAzvvxXkAKo+2a/CvEJX17UNkj0dDnZ4BkQLTRZRY2VsIgc2DHa7c0cpBL
	XrI0ZfhJgx8Zn7TgzXc1Rq9F/6Ej8j2WJ+UJsRYsE2ab6A3ApTr33vVBoi21MIe75WZS2V9Nuu5
	xZcqHmL0UV66v/bAHEGQumQMlSa4kQumF3SjqfgF09DLTzyMZSFQ8AZhZo+gXaxfvoOYKZEeaYB
	uUaGZkb7MRLUkvcttij5oNTs6eBWWB8rnatnrf03+CjCqHAs8JtTenbUjUJyMlsCl2ozEP6c55J
	gou69YDk5Uu2slH2m4JAVczzbf9+3GHjP+oCpvLlhl4ZfHA==
X-Received: by 2002:a05:620a:4487:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cb4bff2bd4mr1852222385a.49.1771435472996;
        Wed, 18 Feb 2026 09:24:32 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cb4bff2bd4mr1852217685a.49.1771435472559;
        Wed, 18 Feb 2026 09:24:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm44181368f8f.32.2026.02.18.09.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:24:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:24:23 +0100
Subject: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop redundant VSYNC pin
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-qcom-dts-redundant-pins-v1-1-2799b8a4184e@oss.qualcomm.com>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3262;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F7FYa6dkNAeFFFpfsiwVzet8rCbZBVa/OJOEhX7XvNg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfXI/384izy3biEHnsOSmp1qCGSuDkfSQy9Fw
 uh6SFtNErGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZX1yAAKCRDBN2bmhouD
 13onD/48mi/KpXVg6PWweHTu2XbXR92teM0OZ/rJd3PhcZeb6zZgwLEoP+AIxKUOZnDaZ3Xpz3w
 sLnW6AucZmJhudVbUgeWhu1jhvaw58sTWw2pWgzlaWknbxzZt9gCC5WhHd7CjEIuaNmckh81EZy
 /46TR+aRDdnVyC8ZFgLjm2hdVrT3vRyKuVOwP9gdzpTvSZ/OLUNnItsk9fNDIFPX3NGTCdszM70
 Pi/JcB1KC/f2epdHbIbs1Omm3oDrvQYEc/QXN1rv30yNJH0ZxLpUKByICZIO9UDhH6SVZR3Iv51
 zbk8/DdpX2VlEN9XAWqCUM1ONueAAqNkurN8xUcYzo32JtvhKiiCxbjybAbnhB87HtI3kAlciqG
 hwzATcEiYxMzq2PQJmXzaUkb5UI7BBzkvWbH9u9NXHhZi6DIL1VcmYYEpykrB97qxah+GsEI7xd
 Ae6tCcdjsKwqz/NvJ7OohtCYaNxlu+tkVr0cnvzrudd9VXyBQeSG3dOed7AATiC1m8m9BijWYpj
 ppHJnC7h80ML65cP2zvUTWAjwtHnskEfwiibFsrXbh8kQ0Ln7de6LE9KTIFTQhhDvdVYcbDZSXu
 60F+2XwUqHwHaKqkMjKx8V7IlG8amrw2O2MOlpMA4EKzBjCGLuY0eBiD/YhdBCQLUc4aFbtFeas
 VYwDPQglKihNj2w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6995f5d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=vFSlWfVDKHwDXz86178A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0OCBTYWx0ZWRfX46FGlQLCLUYU
 DsVAJsOrG1D/aWTrOrkxpH/+kdkkKxMtt07pYx7kYJy7VOMsEi4Qdaswvup8voGfeJLxeC9MdPH
 4+YtG959O3goU/cE9UjHX7mn1cxEmo0x+2ZH2YRDlduLkcBAZUQGzvTCq3xuswHkV1bN4RDmlhy
 BkhS6F/X+nfexQUXgS5m9kM3UrJ13vgIAq1YQXmHZD8xSYPbZMGR7y6RzjyWi9zgYV9QWRQr6Vq
 hI4xGdyjkP7Ec79o+2eVy4xKa6EPWPZxmaOKvlNblmjuH3johqdGQU2UiZBgrbIBrwJN2HAVXWi
 XIUDy+6HWKpAInd04tSzacduSnNr3Yud6jnjzdv4wsOLXk6jItOjCs7n9AT/bRpiknK23TE+kW9
 DCdla8Ec9QtJvVNxP8KXwTPt3tsxoJbZvSH6e2B8pROrqJvcyTg3NWeTIVNSDPB1oKNSgqcaEVG
 vElrO8lB9azSHOqlJmA==
X-Proofpoint-GUID: 664LL7Ii_QrlfUQMqh67ii19ygERbDwV
X-Proofpoint-ORIG-GUID: 664LL7Ii_QrlfUQMqh67ii19ygERbDwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93305-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B61D158400
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   |  9 +--------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 11 ++---------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     |  2 +-
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts |  2 +-
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 63ab564655bc..a4dcc88bb01f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -745,14 +745,7 @@ mdss_dsi_suspend: mdss-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	mdss_te_active: mdss-te-active-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	mdss_te_suspend: mdss-te-suspend-state {
+	mdss_te: mdss-te-state {
 		pins = "gpio10";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 0386636a29f0..77ad613590a3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -247,7 +247,7 @@ &mdss_dsi0 {
 
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_dsi_default &mdss_te_default>;
-	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_default>;
 };
 
 &mdss_dsi0_out {
@@ -730,14 +730,7 @@ mdss_dsi_sleep: mdss-dsi-sleep-state {
 		bias-pull-down;
 	};
 
-	mdss_te_default: mdss-te-default-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	mdss_te_sleep: mdss-te-sleep-state {
+	mdss_te_default: mdss-te-state {
 		pins = "gpio10";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index 3c6a40212a8d..fd3a2121465b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -104,7 +104,7 @@ &mdss_dsi0 {
 
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_dsi_default &mdss_te_default>;
-	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_default>;
 
 	panel: panel@0 {
 		compatible = "jdi,fhd-r63452";
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
index f8ab03f106a1..7e2ee9a4e9f0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
@@ -51,7 +51,7 @@ &mdss_dsi0 {
 
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_dsi_default &mdss_te_default>;
-	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_default>;
 
 	panel: panel@0 {
 		compatible = "jdi,fhd-r63452";

-- 
2.51.0


