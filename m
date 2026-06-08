Return-Path: <linux-arm-msm+bounces-111870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xgLxKgW2JmqRbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:31:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 179446562F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:31:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cTqr6O8s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EIRnrTDY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111870-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111870-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D08F73097EAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE6837DE9F;
	Mon,  8 Jun 2026 12:23:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2237D11A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:23:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921405; cv=none; b=DHQC6AB9R+l7t/bbAyAbJjv0q0GwCTj3QbtOQcL4Tv0Esqs0Kk2qaMnUXoGkUjAF3riV9G8ye12pycO/sJJnyxE+WHnZM/0omjf0k5JFjRY3WjpfsNIooRl9VHj8GDDYMsc7C6n/dcusyf7Vv+xJsNQ1cEcIrW1NzcISFQqBpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921405; c=relaxed/simple;
	bh=vQxUV7jYWXzMq5Bmu/8yTnsosmkeyas+t1t65WaotR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brCGF+PujmbqVYpYER3zp4cPP++jKtM5bZiap94aZx+BjFXuZjW/taJIh30K2DnTEeT08wtkHSdRs3Kj4EsbteuJwaWPF3EkIzHEUUlclWd6/uKm1GZZlPsWtE0h/CGARUDV1IUTxWK/DuR5v0Q3MOxoREJSJKUqt+GUECt3F2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTqr6O8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIRnrTDY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9MOC2992950
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 12:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izYmYod060ZWJNtBK45Vny8T/m2n8qzGVzVsdM8Pb+Q=; b=cTqr6O8sjUmf7Aj8
	y/nyPXfBJ6Kqe70RfG8sV/37JQXJAhBz3va98kFnr5tB2PazEa8y4DvP1V+De6Mo
	zKqhqfA029EhXLYhhPL5mMU3ZeYyVKi6SO/xoxDoA2bpljurw3IJ8NId775ue/dd
	VA49gXhoRSrjaeTO3v1dEJIzGjUkezG92QvepFfPzMHypTpOFNiFQkBSG5es6rJs
	0K7BbqqbCQBRviRYlH3uuHUTEzNokNCOZJ9d6DpELV8/nBejJGiEAlUIxHQFzxap
	1euMUzZakbEubNxuHYpbUFWLdA/syshJ4RgxGUGIklvXe+Vf0dcGkjlcbrAQ5Zjs
	3r+ZLg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8jh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 12:23:23 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e9369f8d35so75121667b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921402; x=1781526202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izYmYod060ZWJNtBK45Vny8T/m2n8qzGVzVsdM8Pb+Q=;
        b=EIRnrTDYC/3Bl5aGZo2DTFruj+6oMsXIveX9ZAci0P28pb4f1X+//abSCz3mFZxBCX
         0wxVu+dexTOoFbxrd+88AWW64jM+sv2DgNeFEzmot5N1dPlgK2Ykh8Zf1S6r7kBIKU4z
         Kc3Zw4kO99cxmC05trpklZl7Mh+VTCcOriOA+m/lZTZQ4reGhUYBHrysZmeg+3X12seQ
         5PksPVxDh0VsU4l7f0sGvce/ZTzFBkMoEIiax0quEw/BShUDYlE9tzhOBR83U7DwmfV8
         gLcNuEvKYoOsAP1NnznVxNuhDZtiPjkbiBZQIuZsvt0pN5N1M7eYK7VXFUkhVWQk2hTC
         aMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921402; x=1781526202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izYmYod060ZWJNtBK45Vny8T/m2n8qzGVzVsdM8Pb+Q=;
        b=qFNm4TXEFU7kzWoLygFuFT47Ye5rAypmiWBqQNulghhBO8WnNBsLcI1oxVxy9RsVxr
         dIjddMdQ/HTHi30NXe1hHLQQSfTX0EBrmNt5SR1VE4TBLpRPrlxEEiNf4mFTr24okfbW
         m0F/Tw//BXz1w3C3mHXClomtuUuZNb7prLxO2A73Tz1rCIc53WIVZZr5P8ycbcwfxsbG
         /uQKrstOWDXraI0X5IWpDMX87YFmU8N6Qyd7aRV9poZ9Xr9ChFQSI9TOSy3+ayCLcOxT
         IAPGOWA6ArDGuwV9lf/0uM5UxKUDi+Pq7SVPkvXqsXTI3kWvYm5wn6GqaeF9jRjBUrhP
         h2iA==
X-Forwarded-Encrypted: i=1; AFNElJ+eGZELr+Kp7l51GcDg+J81ddqSN6+qcnlsbISkYZptK1Jc5Lt//kdzzW9nYbmYBXeH5uorMbGLA/D83scB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywout5BZRFZKd8ixxeb36nMHKq5vpZvQUNVLt/bexOTxQgkUeXH
	vXGjaINpFmpQHoccTi38R9V79fnVRMeS+p2BRF0BeyggrFzzEbTM69FF8r+lmIPT0+I+/oErlDT
	Nm57LoWtnqYxBNgSFuEHnLVuJHGeUJ0zf5f8I0TM57VO9DKwIUynISxzNgx9FOKrqs8sv
X-Gm-Gg: Acq92OE7MndBSSkhRWC1GKvth6Ef68hoPi27wLLkp1o4SaIDfoJAERAkGcZkZvNzMsH
	oYexGfgSuPhQHQf6ga0rEWF95GpL7cSfNeAZwf2Sr4L4Q8wSX8zgrWDxr817bT921XvTqBmCWyk
	JBOVfkLs7WvUL4j+cf14AYe6I8wG2tCrEsTfJdw6xL7OgVE2P1ID1SuLRfcNvaLmMRwlk76H+RT
	53cwO2CL5DjcFf6lkOPq3fq4z/tIp+2bqRSx+Td2UpSrMO96JYU+F6AW+zZhFtn+YjDRtDhGjVY
	/uQD4yKVoSJTQi0Wur1mHe3UgpDcLMkSeqhr+1Sy7y5fJfqPtWXVOEC4Vnkg6xLyuTOB6+TAlGp
	0147WQVjFohcrc6I0T9bLR6PVcuXwE0GOM1WDNgPcVVkCZuEVjn2Gb6gfMji3TSo=
X-Received: by 2002:a05:690c:6389:b0:7e2:28ba:28e8 with SMTP id 00721157ae682-7ed0ba6363fmr140919017b3.21.1780921402209;
        Mon, 08 Jun 2026 05:23:22 -0700 (PDT)
X-Received: by 2002:a05:690c:6389:b0:7e2:28ba:28e8 with SMTP id 00721157ae682-7ed0ba6363fmr140918707b3.21.1780921401820;
        Mon, 08 Jun 2026 05:23:21 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:51:51 +0530
Subject: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNyBTYWx0ZWRfX36UaPMtbdf7t
 xITbVX3LKaREmF0wAZEmCViJsxdzzF1y5a0t4BHk3JP22S2j+D8Ih+h80ENrWc/l81MNtIdjTK8
 55Xwg1XPxz6Xc7KzA7EBac9xIbsjGZWUkFMBFQb3IGTCgxAkrC0Kt8p2rLyk2CjVvFLA+Tv+TNn
 3vx9kHdupC2vneXQQsjdjYQWRWlkN10vzA+5veClD9GR0HbQusd96SvGKBrLovISG0r0mtStkQo
 vcfd/z/0XJgMOhKmnBw7BqGNuN8JDX29ZludhlWNp82YwUGf87G/+Tf+xXKZLVXDWxIxs0StQlx
 deUn5IKoj3zvvkFbmEL+VhJHRpIx0V4e9U3LtbJIxR88IwIcSWXshLEjeP2UnGwSemFDJUNKnyn
 DRTWufuzuoGb16jznAkNa8IC5jPkpmNbl+9eCe9JWEicXxeU/C9VqXcI9HJOHljG9t/iaBmq0AN
 4qvko8A176MeGt3OlKQ==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26b43b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j4Xy8Qu2vJQzfQ2CmTYA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: mQkzEZ6Nuc9uW8V1JrZg1XYmQgf_pG5i
X-Proofpoint-GUID: mQkzEZ6Nuc9uW8V1JrZg1XYmQgf_pG5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111870-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 179446562F9

Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
 
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
@@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
 	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
 	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_38m4_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_38m4_rf_clk2_a,
 	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
 	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
 	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,

-- 
2.34.1


