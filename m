Return-Path: <linux-arm-msm+bounces-113926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qvn4LsnEOGpShwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:14:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9CB6ACB3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:14:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B2kOIG6N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UYZCXLe+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BACA030433D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3315357D14;
	Mon, 22 Jun 2026 05:11:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DE835E94E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105105; cv=none; b=D3pUYyDUiZmoqNvSy2tQ+5qm+VY++t0MT1UpufminqDk6XlAJIrUzbiNdkyDsdFlZA6PRGArSTBkms9OVs/3T0yLu4xzzz7ZblWGNmxwkQcLi3+Fh4ajOYRzWrc33OJO/B08PY05yGYwHw+MgvN4+Uu+MxykEbybo11KuXPOawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105105; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAXQSa38sN2YsDtgDGTkC9koNzt6448XLKLRKAXzT7Hkt/xXKkIJlHTnO3U7vzOKHaCE3GMYmfISHp00zGaS3aGupEl+wn9vkp68VF1oh9JNadGtcG/mvQckIzzqHf9Kz+B463e+KelIVrF64G1mUHZ17J7TmKRKoWbOUIltWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2kOIG6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYZCXLe+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59Svf3880381
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=B2kOIG6NHaEx3F94
	8LjgGP+l5TsLp8ZpYSpKb+TibyZ51V5kkz1uLtNRWQIcvyMvimrQHIYA6AK3Y5jK
	HK+nWdDtXw3kWRiVlMbB4nZPUGiZHM9a9c5rSrRP3kKBPCKKLbjzLBN03TpDe0St
	LxlBKWsgiZaFv8xrr6rS3rt8VtnizOOAB9cofWMmVf/6Ai9WC6/iY6SY/CSfb/Y2
	p4lPfNDwCQ4vnWnadIpnvzch8CY8wHBPOGCn80GIQPLQC0DDL+xfw4cx0Day5WUr
	6pN3U/hXCgy2BEqhMmLpd82ikam7JJkYHIUlNvLtZELW6ZI8XQ53MDOexYEkGBgF
	wKcHHw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjed2su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bef75a41eso2810941eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105103; x=1782709903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=UYZCXLe+htDdVzlsNvKtPn2jO2HAyRdDJCJWmNgiktokb2+eVLnhRK8A1UpoLzNvVz
         pMJZd2qx6qJpHfuOrrnS3TcxAep0RESDzVglhsGK7LLJjHFFtINdfuFZOsVNJOfq8b4G
         N67Hk45A+nl0yFvj8zsbW5pL1QOIP6bOgRHozUcV+vv9fOaOHcZB45wuU2bMLWC78ItI
         vsBhzcsgo9QZ4nSycRp5BYs5MOXZsMgTfTID8aA218g817hSyp3SVUArrEE66FJ9qt4U
         G1eA+ikeaqfiuY0416ieiRjZ5S3sB4Ij7VwTI9tBDtieg97wS8LmIrvKUIJ7maNF1LzC
         gwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105103; x=1782709903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=P8zruk0DJ2J6jb/tkvXWVqi7NxxHDiSEimpnrf60Kd+iSjnQDn23iawPxwiL5eCQfV
         Nd3aISNdiM/KFfpllBdCelEtQnVAz1/AxpJ0HxVJir79uzDICCTpmrTR+779ZXY0qT//
         m8n79Gmbc1wsEnIgl5xvXCI4vm4sAJbrJ72BUYyPpCpEdCqgfuqH2ZmD5yClnh6TIQBq
         Zu6AlkDr3xvuj8f2pRWhSTrs3SolJLy+2Em4cNoLGv2aNJ1E27OtqKvkrhjQ/4LMD5RC
         M/fOIWOByXE8PMfCzxQmRe6zz3py+B4Vme6neTIx4SoU51bICeC7sRuBcPgvrG6Cv7vn
         PyJA==
X-Gm-Message-State: AOJu0Yw4LzYOds4bKX5+L0QWoekLPxVv3BrHn0TM7xmrvw+U+Ie4sVsd
	9FKiclZr8TCNDuWz7noT+NS80nX7uDUCBAboWWnvB9DtOeSEB977g8vh6Ws0wQh91yKocsfUPwz
	nrgfXvEYckGYp3ZZyj3U15hXe57xl40+rKnUVuW/sXIn9pwxH5rK3BU9C9HeW79k9XODo
X-Gm-Gg: AfdE7cmbyz6YzApDxuhL76AW2GLPUIwUUCjsVSO5hNbEdAjIoI+FucbNsm2knQgX6vy
	vv83FGQmzTzdOGpW9ulA1j73TnTSyguUeRfk+KIgGmk/YJMUwPC2xkxAba1bMHxMBbo1HSB/3KD
	+3nYORO8tEQf/HfbfmZAAXoX8I19iX+0C+rVSObCGAmgfk3/eV8TvtlHbjefYh3BQHRsyJx9XmT
	5YXCBDYXu4+E8H4K/WwTI+00z8kZ6D6YlLyvTfL1CmtetBj/W5yhUxlnUwOYjDrj0C97dEC3W/s
	zsdbtX12skMKAakMS9kUnAtYGMQFhGvOhcRQKTjeSknTSpb/JjtDvtshGbnrBnKZGyUwnKpsBzM
	MmZGFgsJLxEMPTelAbWLnf71SNsTU6xQNjwjAYjZx25LnfKPYZNjzxsLENQ==
X-Received: by 2002:a05:7301:7c12:b0:305:56a:c38f with SMTP id 5a478bee46e88-30c1dc33984mr5769428eec.26.1782105102709;
        Sun, 21 Jun 2026 22:11:42 -0700 (PDT)
X-Received: by 2002:a05:7301:7c12:b0:305:56a:c38f with SMTP id 5a478bee46e88-30c1dc33984mr5769409eec.26.1782105102259;
        Sun, 21 Jun 2026 22:11:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:41 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:31 -0700
Subject: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=KA58cYmVTiU1YBfsAht1Jj+TeO0E0gkK7ERLNDktiQ0TY/dUl9AIVZ+6hed+oGmbejXwBRbSh
 1OcZxjE+lqhD+vrPL5vu4mGvB1cdy3UFHSHSfC9Nc59rwdTSsXNFTie
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: BznLH_PysGzVHGl9sPllyKWpvW62cJmq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX/dcPTI8odhJw
 4kLiJBN0Uq9D0CXMIFdNR3TtLsjm1cMTCB+IECFChIiCmNoE6NpAJqbBXV5EeWdRIEskaoMDJ4D
 1Jn282AiHleSmsQpgnFt71K3g65UZWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX6RcdbBg9Un3m
 LI0h/5LSn3DMOlEGV8cns77qLOCTGrT9C60Afc0BPSCOdc3ATbD7WXCHEVHf5e/iDOaKvinmmto
 lYOOpgQ6sz89dQNBAmLqgZ2RmnwtvmPnVtcKylamCQk8PMqCEWjXorsLOkNFb/teSUXsv2YgFQc
 LGTuI+hOBx111K3GSgxuJl3d9SxD+lwl+rmrB5sNK5CVGzTlC6hAtua9KgjO6ZBdo+n2bKK1EW6
 WWq0rwK1WSihRhQNUVC/TAZUa8oQ56mCU8/I8gpLfKtBXLWYNL7aFVrKh9QkXDOE9tZdg1vlocL
 yJPQq/QwAbodtFQMCXo/OE5onvpe8hI0u3cJp61zXpcbplKbEcar49WQNt2x6F4YnIqYlqo/9NZ
 oXsUvnpZOOiv81E22ndgBK7JM4ZlRZjhSvaOUspsOa2kLOkE/5UJniq3aOfFPpzqynkGtaUTPR6
 8kGPeHzpTMfWvR45aMA==
X-Proofpoint-GUID: BznLH_PysGzVHGl9sPllyKWpvW62cJmq
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a38c40f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C9CB6ACB3B

PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
directly instead.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index eb45adc8a0a2..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };

-- 
2.34.1


