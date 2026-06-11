Return-Path: <linux-arm-msm+bounces-112580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W63EM41BKmoelQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:03:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444466E5B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:03:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="WEoJN/Gs";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yy11z1NX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112580-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112580-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1BDE30157E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF433369965;
	Thu, 11 Jun 2026 04:59:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E53644D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153959; cv=none; b=HUyY+6n17WAjBIrGZtVDZJnZOr3c9HNGmlJXeasTFYTPuH8A1j4msld8i4oqiRpRhG8r7Jyow8B3FvjecNU0fMdqzh+FjjD9tpMr9M7i7oqkRKnttOCf82vAaKWbsaqx9/+CIKmEcMy3L3jtE804R3Uy5twEiAsl5InAyYt/3Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153959; c=relaxed/simple;
	bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMJPERXtU5fooc/YUHlg+RtNHZVA0V8gwlC0IjzwhCON2+UCXPg8LtZnmb0H86xOm3hrVigf3oHdNXuL/4ljV5bBX2T1Hg004d+5WnRP+m7gQUBnkr6LVpIwA7kPEUPv8pWMa/Kc1DxI2LuCTRFoC921h9Crvq9eRWqsl2c2JIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEoJN/Gs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy11z1NX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXYT3159569
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=; b=WEoJN/Gsd1DoEOc3
	0J8Jgs14ya0EcUvju2QsHnJ29IayAdBDuryKZsSBAmWI4TKIXkOrbfWImSXsUbyU
	pUCttiMlhrsWnRDScER5fwRtWmmC/mz3kD+qPQD8cAdRalhGxQKiNX2DHN8ctTjO
	ZGSXyORd6dlZdLHChN8K3Xz1TAIfDfPRTzBxJr3d9Eid3aBs4CFdiqR9LMRTGWa4
	tgBT7WrkClN5HG++5Ri652W6KY1+woRcsA8R35F4r22yyhiHTYSEgJ/v7BOc/Ok+
	xWzJ1zblQ/+iEy/3kLFz95T99rNLEAIu13prOZgmBoFfsnH8Ppu4CBxXdax5pG+I
	IV8Bbw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701p44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf2bc4371bso4326515ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153946; x=1781758746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=Yy11z1NXYzyGelSPSVUYHDjQq8WrESFUI6j0mX2YVib7fRvPtkEx3Dg8Afht51BjAs
         b6oapPdVyxzcrOPb6Er6kCl6gwzykSXKpJXpq3rwyBeEFUJD1yreCcSuJcama5Bh5D5u
         aT7YWx9rNxo+/bc7P0PyV0/uPySFKeDJdolAdCbHNIvyBvm8whZuHaE0+HSLp0CCdeJs
         8/RYMfibyAZe5dWOZHhjE3lh9OR948YoDwBO6wN+JMHV9ilNtEYX8bIwjL/PGE1HyB8H
         eBlbYCIUJjnftoukUIhNKXwWYTu6vyC6svRnOMPFyuYn8FBiJwAV2F3Apx+4QCxEXYBj
         xY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153946; x=1781758746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=HnlOwIS2LfP6fLX8SNxx+3RlSSKLEVGWsQi2lvM2tRFt9uZHCdEfLWzblf3JJazrAo
         GFK3P2icZ3mgreDhwbgwyW8/WFddoDYi8qoej/w1nRELsrZd8NxUfEAK2r2BAyZTgkAE
         EBoRIpkL6qqzI9ir6Is97APSKGvlHMmDCeyMR9ftACH98/6/UvXvJsvEfn+ZEQ3Jey3D
         LDZTJ21s6jCIDCqhVIZ01iqTE7Q/ySYNvAE7oC9v2sRbilMzNkM+OofWOLdPKu05Lv54
         soz2hHMoK6ubAeUxhLApH8+xgiIVwlHtOcEcB0/lyh1VxofRmB66h3QBFPICVRM0IqML
         xK3Q==
X-Gm-Message-State: AOJu0YxWOQ4nJpbLGGG3lIdBRJ2IvtS4kbyY20F40R51WaR4OPcemcHO
	Dh++yyUUD8+E6ozNoI6gNIw+l/UIUAl6y0G6bRzNAgAtaQtdRiUZ3dWdWzTsaZReoilfGtgXXi9
	r3MZU52O398ELdH44n6xb8IQ6lQqHp5PTB2s5QQEk0SFPA+ViO0kpAaTXR1LfJ+8F2gOQ9ljQl2
	tO
X-Gm-Gg: Acq92OFZe7B0DVzCOLDu83HcDndTRoWb5IDrh5+fjRyVo/VhAdK5OwAHdGj9uAZqkwK
	sg8enHJn4RNw/DdANPxlznarxEIyccQNuIqr+kWvEathBF2vXO/NmvxMoMUFzjShGaNzRhuTWKz
	9Pym+ndlN1GQsygmWwhVoI/odCPnQtiQLSrNqVLnI5wX1/np7tz1LmKT5lA/pJBD/1djD7nlQRv
	Oli0Zs8H7DGSPxPVE9pYlbaI3oWsBJ8LdmGnsAnTJN8jn8Cmu5GzyprzLBWKC+6A7MTuxBMVC4O
	0yljxd8GbU6uL6eohITiLr8GThJDjTdvx2GMG7ltKvIEBdGH86gmfRGfrIa/jxvEM6TC8yA+5X8
	Jlts4hl4CTUVnbTNzEWlyQX5x7swd6/Cx8YHV3yNYcaaGkL4fRKo5oGyYos0I1ZO8R64=
X-Received: by 2002:a17:903:22c4:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c2f23a9918mr9446405ad.28.1781153945917;
        Wed, 10 Jun 2026 21:59:05 -0700 (PDT)
X-Received: by 2002:a17:903:22c4:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c2f23a9918mr9446175ad.28.1781153945461;
        Wed, 10 Jun 2026 21:59:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:39 +0530
Subject: [PATCH v2 03/37] arm64: dts: qcom: sdm845: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-3-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
 b=WAuRvAqZ0V8gHSSh/wAesBSkUyVvftM/XLTzCf+URxDgqm0vNhN9Ec8tYaoHHc9MDbJkdPsA5
 jjQ1jXdS/CBAkuFh+48CjtZjQ0F0hQ4GbSkHwEMyWeq/K8bCxM3fgX+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX/7j95r2HPoRR
 4kx7zwp0qQYqc3t731BUyT7SdW/oUur5+RjU/ri0CIeQ0MazQGMYbHjxXA4N71qkhC/vLujveqb
 YzD5Bnb+LUgh1lsd+DixrvgXnOAP/nXCPSlMTSRAzK8cbCof9jOd//xyCqmNIXYHtm9cJhaAOcp
 IuFK8h1pMwRsvRUZaT/IdEL6rZMfBhG8L90NLf/z12qKTuxtBc9aY5dompfp9hACn9YkvhBI6Ud
 o8BZ+ynywuj53j8wmZhYGga78Ziw1Fhfad6POzUQTeBp5lXYy39uX+zCPMb47DfLSSYuhxKSOQN
 gTXYV205KBhBm5S8yTy1nEpOH/j+8NpR4i169yaTFFk4ODcKLGGbBKSJHAVzd+NrTrju9hYd+bx
 NI8dWwP91LqAaIuznDjtQcXMYfDceKEHVFEarxTg2nR6k88c7+E1u/K/44yPV54PPfUF+wfQvw/
 9UiYJ5fc7lfEGGMVjuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXwoxwiGj64mrU
 ghDLzeHzPQ4eFknnzMdXJmTpcdzu0rjkdandaZ2ZmoUnkJwtwNwn+FjSFMYvQ2ohDYDGJ8LBzPP
 1M6L5ehqXAdTLNm/fqfAO4ZOmSaR1AU=
X-Proofpoint-GUID: 3g_LM7cNYhWmLNlDdFKt6JlTO69hc84X
X-Proofpoint-ORIG-GUID: 3g_LM7cNYhWmLNlDdFKt6JlTO69hc84X
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a409a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112580-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4444466E5B5

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 02416812b6a7..24c0e97bb122 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1


