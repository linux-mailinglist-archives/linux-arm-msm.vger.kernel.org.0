Return-Path: <linux-arm-msm+bounces-92242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDHbIMGpiWnfAQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:32:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4510D954
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4A0C30053BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65AE2E62C0;
	Mon,  9 Feb 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y619W/lx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDYyeXO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BBE23BCEE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629565; cv=none; b=GdOuc//4FUgugBnNrASorpQSb38sR0bgNnMnjhBuiq1/SEcDVvxsrgdrBP2qnFgVwNJJzqKd+B22SfqjVBWATwr72IMzhbVf1k9374uAKZgtIIemo48ai0y78KcrZdBJKPekYV9nCzEFk1ugNKEe6oOHrVAZWsy/5YQsfo4y5zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629565; c=relaxed/simple;
	bh=aJQyZ5faOnML2T8pOGQwy0WuTsCSlXllFoC+pkPEAyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UJlIBpNfQtBW0ymWhraFBJceTEK25SXgSnVmUPLf1oVAp0+InxVKaiSk1hf3LTK3qDypaRmzdjmnjycpZ2B7l9AFiWfj3XocDA+xKvSSCnkujSjSPTQVQxMRgd4o1zd/l4zldu8TYz2aAU3PzEF5C6mxcW3H7RPiSc8OP+u7V4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y619W/lx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDYyeXO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61940brY1656554
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Vg5kb3rjYjORfGzAsEr4ibn5dKi93LG2sOc
	0yOm90Pc=; b=Y619W/lx19e462pZifxdXSBKdfojqpH21naBxiomKiwd0hwvhlN
	UsiBgkbG+MkOJMdnh2oQgUajPWryBG3bRqEuZviSXyElYIseSFPrE430VpZirJ/C
	yy4ETXyRRd+N/qvcjb7RMAk45RKyyTUbl6+vjrxYvDS5ThzpT32CEdNIB4FgcSvE
	cpoX/8s+lH/Qr5g21JcUvnjtBcVbmWg44QjM1o1Ss20LuIeLxD3oiz6hhXlJ6Jmf
	1JXnxv0QnNSfgQanSwAolz7kUSaks5S+kAu34gLA6DQwTsI56sIlHXqCAfARHqKE
	noswxKdJR7RcQAzauSXnQFlXTq7jMwyz6Tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7862s2n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:32:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ad709d8fso1001133485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770629564; x=1771234364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vg5kb3rjYjORfGzAsEr4ibn5dKi93LG2sOc0yOm90Pc=;
        b=UDYyeXO9AsOsyFWDucAnFm4B2+yzScJxG+xoq5XYLS2+Qb7VFkneqP1ZXrIq34NQwI
         JcR/XejwdgvEDlVoq2gn4+xbpjQBZHwodolwvqnHARUw2lgdom9rMyjnoEGC3MpkUr5K
         nKmMFAL2nwuJYSENFlKdb/hSEJ/tf3byWtYeWxDjaSruMktpq9z43kA0JcYWW8bICy6t
         LT/M3yi+lRcLxlbpqH9zwYQizjikzO1/4h8tTewaEh7+ffNV0YVOK55OmGoeu6Aqzsrq
         zdoIJM7ecDcmBA5A8fDl2r37eIffNFx6M0/3LzpgSRXY8SySz2KN8VxH+7uL16pw64B1
         VLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629564; x=1771234364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vg5kb3rjYjORfGzAsEr4ibn5dKi93LG2sOc0yOm90Pc=;
        b=DDD6ZD0xsPTNnRpj2PHZT3PnYkmI9uUckxJqTlo1lXZy349K76acU1M5GjBMVCAs8v
         gkmJD8PB8WFri6YmoNi9efZYsldHJRrljTFeBaeewshP4dU29ciXCV2c54B6L3nVUr7o
         vFDhg1UXreVBNGlYNL3mxm4riCnoT2giS02VjCqcGL+gqjyfAE8DKyzNvcIMLt1EyWEx
         erImXkFfv+C5y7JANdKHIe5M/6q6Pn/iD34nulV2DxbTu94gxQdBBSAoikJ+tTYtQ+kw
         UbHWedqaFMEnKD96WrCccYyXS9HUX/ufWRP/pq0RGmGQIAF8VRwwruscxgo5oPg+nhbX
         ibRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuq9phNx3Pinl02zSEZ/GU3CbyZQPmTgUWdKgnRSS9Z7r4UTwhUBRu9U9luNFPm2f0npIJ4em4kMIE8vQU@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNhTgXompL326bsCXoOA0FAQzQCfK9I4Q6TKHGc1/kL8NlBpR
	PbNOTsazJJT1Vy8cr+JtTZ++jglHpDqLyuCIeJ7fHL3vTaXr3frtfztTVaUG1Ni/0TyOhaeCD8e
	FBAlPNf1lNkG1EA5FwizqWa72ur54i4Y4B56BpXfLLNfyWkaSJqjV6Wg6a6IqKFB/MLnM
X-Gm-Gg: AZuq6aIxOEDJ+JQDtjkF1i51pcf0viOrKKukj5As03bV3naRLf1eh/RKqoZdJX0CbFI
	mD+0G4+deP5PcT8tI+Bw5Je54W+X9AnvdZb/ZoWv9up9zg/sZk2cs24xLbulH9PjTYGx2WyJSGs
	R4NV3wwcuB7kOcBitmYn8Vo0xMBoS2t3HRSthrcDHLiLBjaKnIX1vPEhnWUJ1pPNmUjLXyywUhC
	UzgHL9z0NfrCaPA06dE6wzJgmAsu61NHUS5k84qmrkOSENf57OOhmDRbCvyVYFl/jjBsNJDmYvH
	iRj1SJUhx2Rkv/+v5liNu2a6cEGHJa1pWzigkoz3VmrRvb/KsDkCrDGnXU1us3/6JrVk4/gIEKN
	qQbOqmmzLbeTT88epBj43jNqC3Q==
X-Received: by 2002:a05:620a:2846:b0:8c7:a39a:d51 with SMTP id af79cd13be357-8ca40b91540mr1930172085a.13.1770629563940;
        Mon, 09 Feb 2026 01:32:43 -0800 (PST)
X-Received: by 2002:a05:620a:2846:b0:8c7:a39a:d51 with SMTP id af79cd13be357-8ca40b91540mr1930169385a.13.1770629563514;
        Mon, 09 Feb 2026 01:32:43 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376806626fsm12001050f8f.37.2026.02.09.01.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:32:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Date: Mon,  9 Feb 2026 10:32:38 +0100
Message-ID: <20260209093237.33287-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aJQyZ5faOnML2T8pOGQwy0WuTsCSlXllFoC+pkPEAyA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpiam177bjsLBqgijhJ/uwK48G+jxo29gB0ByTf
 J/EKlPcQqqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaYmptQAKCRDBN2bmhouD
 12dWD/0RH6h7yR5+CPc8BIIBO9RxwSv0Um0z9Axo9QpCcSxem8hMEJE3Ql5nS8kOeywNM5Wm/fO
 ygmUQVRNVXGJiBN/eHOwj79+Y61XT//5+sQ4kpvC5sh83hb293eY38kdatAILE8IdsmP+Btn5yV
 jDecGlSzivzvLsqzOJMa8pzEcI4o26YLfd4FlvHd8pTr8s0RE1b2ChOjLF8f+mBiOxtxz4hTIjw
 li4FTfy3QYB35x/yyXfcCZZ8bJTJGAq2pakbL0Jtd8D5Yhjhpkmlvef3zYpm0PRrfhv+2vdO1rZ
 inchX6D1oI6sG1gaamCv35ux6V3S/AMfwd4ZaR1n5RiicSq6cFS9rXPGzSF1d/4f5fIEgt/WTBE
 QxFBT2KoJbTb/Xf2Bpo3iijdRwYfqBCBseAx2hoIz+ZdjPHVBbRcURhnotildnhCUfuLPztWDU1
 4QKrzkrZOauctRLcj4G7bUN/E3eiPsy8lMHBjgwWWXmoL2+561JOcCB50teDn5z7Ye65PEr5y5r
 hnzjPUfv4DCmtGttNYXDs07oeSrlRjCvXbbeSbGGbB6h7fGWvGH3H5DQH2QlQTaZLeSbw+Gmsh+
 U8Wn1KCSSOraMRrabc3ls/UHSWdj/lRuNSXUlz+FFu1lDm1gfK6xU83vASuHXds/DzcBCupNm3v c3qhtRRuvJIeufg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3OSBTYWx0ZWRfXzTyBM461Nse2
 qqi8zP0R5wEkvr0bBD3BMM73vmc0cirS038c8Gh07RgMK7UgPVsVVBV2aXrfq7o8zJLwfJc4kgu
 RSwZG0U2EVHMyUHnzN/kgp3Ntt8WzSkJcIcl/oqvNKuhcKLdQLEX2oLzhEkxpqX4L3FvSjXeSzD
 XyzvcC8UwswedaKSmjlL0aGwknEVLw7vGkX2s7pIsUhyDcV+jgXU34gyo3H3A8aEd3++GlqfrnC
 dTjY2pbKF00ueAJiU4p3XIAL/zvSa/DSlWkHSE5OCN3tSLAqTnpKZKRCIrq0sn3eVFcg+5jRJdD
 6BFnHd3Ly0Z7Kw+Kcl0ucMXtunvN5dl0ZQaxT3/Wc5qAi5lCUtObjvBp40ID+jP/8zvG93nLG2A
 b9yyhKUCp2PXmFZ8RRGmfocEt54toCVa61MGoIvH9sZh1ESOYNwvHCr/eMK5t1E/EvLlLB2Qb8o
 3RgV8AzIW1MjlWK9cvQ==
X-Authority-Analysis: v=2.4 cv=bZhmkePB c=1 sm=1 tr=0 ts=6989a9bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=bC-a23v3AAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6ODwBvgpoHaQwxifY08A:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YqYL2Um6LUySPJ9u-x8vzcXMyds6OisP
X-Proofpoint-GUID: YqYL2Um6LUySPJ9u-x8vzcXMyds6OisP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92242-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEB4510D954
X-Rspamd-Action: no action

Add support for playing audio over USB DisplayPort (the two left USB-C
ports on the CRD device).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes since v3:
1. This time really drop sound-name-prefix. Forgot to actually implement
   this in v3.
v2: https://patch.msgid.link/20250624122933.54776-2-krzysztof.kozlowski@linaro.org

Answering comments:
1. No clue about third port. I do not have a reliable working CRD
   device, so I cannot test it. I add what I tested.

2. Topology and Alsa UCM were merged long time ago, so btw without this
   patch CRD is negativelly affected or even broken (ALSA tries to
   configure non-existing DAI links)...

Changes since v2:
1. Rebase - sound-name-prefix are now part of DTSI.
v2: https://patch.msgid.link/20250624122933.54776-2-krzysztof.kozlowski@linaro.org

Changes since v1:
1. Rebase (x1-crd.dtsi appeared)
2. Re-order cpu/codec
3. Add blank line before status for mdss_dp
4. Tags
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489..c0c7ddabd8fc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -226,6 +226,38 @@ sound {
 				"VA DMIC3", "MIC BIAS1",
 				"TX SWR_INPUT1", "ADC2_OUTPUT";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
-- 
2.51.0


