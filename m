Return-Path: <linux-arm-msm+bounces-93309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDJKGff1lWkMXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:25:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FBC158423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10C853039F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E607D345CC3;
	Wed, 18 Feb 2026 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTkb1qo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBgyrN7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D121345CA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435482; cv=none; b=FSvhi7loJufVsJ9J+cKyYUlff8LFVoH6qPloL1c6SEtdUMEl7IWsRPqLxkpn2KdSU28dYKaZprLBMoqWqOXc3lWzbPUgmfVkVXaQvNwM64faY/WeosZnHD+xnva/xhGcMXh/MnnB4OAvtcaZgMmDBFTcnB6CkNsd0VaQ97QC5T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435482; c=relaxed/simple;
	bh=MZS6+kfQDn3XnVGaMmoY2Vg/6DpKm3HfF39YP+7iMd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQ57JEqQ5RSOQL8DgIX0WhnrJ5jT7XxiN7IHf2TQF1EeL59zU0GasIZxGZYRTDHAj4qwnZAyz4Ytoga7ZjLBrP4S9w5mMYcgvbtP8l0How9do1MF6I1gj1OE7Xxnl4+DFDtqodJArWXD2gYDygonCaDNLalEyR0ITXEwRK37odY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTkb1qo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBgyrN7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8ihXP3380400
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yk5NL3Dor4pgyCLFEkWip3Ik4KEfLeU9uRCAL4pRym0=; b=YTkb1qo2rK8maVrA
	U9DntdM/WtTefYsP0Lan1/nLpxjq+GpSUX+cIq8rnTVhQMs6b5q89Co5VCzCUUQ2
	P493F4zIMLlXVgX1Yo7WHlTCuw4SsgyRXAHp7RgfiOb0sY6pG6iljdI927XSPVbh
	WL0Tt/XkBjHH3nYVMGrh0VOAVsBJ8Susi4Gbi2HBXf5mi96TI3rKY5bUjHXYErSn
	pi09CIcHCCTxD6I0u+NwWzp/8QvMDjM/d39kjOQM2lk4Pj9eO/mMgouTtwfiNNhP
	ZAE2q/SHhMCE6ztphaiT/c0w5lWNmRXySKlcRUIoHj+92oeTo/3kj4ZzPFZfQfAs
	ce/+xA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyk6w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so27346785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771435480; x=1772040280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk5NL3Dor4pgyCLFEkWip3Ik4KEfLeU9uRCAL4pRym0=;
        b=LBgyrN7SZqH8LfvBqXqI6JoxZetqnTuzBDBB8GVzI9iOjbKTJ+gLS3vW6hFNi5so3T
         49jsRDFA8BBEI4UsIb0gbqcDnQAOQ4EVnbf80wLXW/Q42nnx4VhfyQWeDJz0Qi4/cC5w
         aM0ag77+QHxOZBY7BmMu4TrFrEpJuILvyPrKl0M0ls90d9Di4audIiRAaD1V8S9a81FV
         vxfDMVmt/PvCb1B5ZiMGUVDKA4lvwc2GVU/Z1htrHo3KAnmROd5KBJggjPOXc6tForX/
         bL6hn+kIYqpdRSLmCdCoceMr5wcToiWoN5JGolKwsGF4AsO83HYsQ8ZiVT8GB5gmfldi
         fIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435480; x=1772040280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yk5NL3Dor4pgyCLFEkWip3Ik4KEfLeU9uRCAL4pRym0=;
        b=HN7QifMckAQJTjrjDWXC+d3omMHBge3HblWtQVi29ejRC3rvzqUZ8XMZBdq/B7AyyL
         1Oz1vtQ8JlfDLXIBo6P0qVPKCCOidf6yrZUwa3on3Iml3WtMCSbivqtS9P5e7KCu/rvM
         Kpg2n0UdbJaZ9Onq73eeZhJmC5auHdAoiaCv3e539ov8tjYbNLG2F2XFQJvHDFayOYUO
         rXBTS12+JeKIYD0B0dVvmgOI86ipCqIRUa63NAJVcnl/Qiu5s/dphTa0AHrORfGA/axM
         vCkNjLxhovn9ojALYsjc9s6aWyuD5/voCILRDF9/QYm6bbO/LB2fYDOe5xwT/zPjbt62
         FLzA==
X-Gm-Message-State: AOJu0Yxv6emH153+2LTcFMfBNlznbWVVS3Eel68P/Fvmky0Zpn+VqZW4
	nypSADCUj0R3HGxGj4OoJvbz7wgae5N2P+Q+mPpZelTRoGDT9h6to19o1gPTD9LWSHLimA0eBlp
	KYolowQX5LM9gFUOsyChjfUkmvzDNVF3QNA9al1Ni2z1Malc2AwmeYQZHN+OL1KiH5SP3
X-Gm-Gg: AZuq6aIdgNd8RP3oW/zwh8obPdQa6iiVTvz4XPF2TcjPTdXljdvMOCd7QbyhKdvGOjg
	ZYiVEZgm96MP2A4NbM4wfgn8Ds8BsHVT69eeJhFPKo3LWrpUgHKYRkFQbCfUb4rnHur7nWlhIPG
	NikncHPK8kAcszc64uLP+PE9kVyOqw7OcZd5UV1rD+TXNxYIfEO/4tk3ktQbWcvM13mgMflEuxI
	BmRE7AQSMkJ7TMd1H7ra34saUsKZRWQs4IFqNuTN9hjfKLIqk8lbmEKr0UhX5lxmQcPESi0lTMq
	gtYqLygexd94RDUH+IOiBixFrKgAvlCkss9+3PyYLjAQVVDWP5+V6iuc52nyWH4pxjRoJz5dWKA
	58oOgjS8oAl97nQ2uCzV5a0osillEarppump+1Q8yrR/yOw==
X-Received: by 2002:a05:620a:4724:b0:8ca:450f:c389 with SMTP id af79cd13be357-8cb740dd323mr311780685a.62.1771435480022;
        Wed, 18 Feb 2026 09:24:40 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:8ca:450f:c389 with SMTP id af79cd13be357-8cb740dd323mr311777485a.62.1771435479590;
        Wed, 18 Feb 2026 09:24:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm44181368f8f.32.2026.02.18.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:24:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:24:27 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: sm8650: Drop redundant VSYNC pin
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-qcom-dts-redundant-pins-v1-5-2799b8a4184e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MZS6+kfQDn3XnVGaMmoY2Vg/6DpKm3HfF39YP+7iMd8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfXM6/S1exjeDXNnx73DKQIujiLXtv2v+XeK2
 L8ax2XUY+qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZX1zAAKCRDBN2bmhouD
 1xjhD/4tbOfmAxeLVvAxc4F0Hm7mPMxnbu2YGYpj/GDN4oichxPIcnVTlXEjn6JjdIkJTDNbidY
 ndJYJIkpnSUGwWWWj9Q8297418fYRPNB3K/9hmYyPqKimwJJC+C/rkgPKildX6scaWVyjfoI1Hu
 MCIwczr5HjDsaU2hV6otDMV48apAWXT2unwP4bX+1N1YUlKv5iuhFm34bnHaQsgNW0giVcnP+AI
 Ua1lO4Uh9L8hyjfBIfFaI9KOPZetfI9LrHMLWxgJt7ZESk2aNNZ9DGh7a2SnnzUc5dNZybfCx/g
 MfC1jXaYCafYS1FAAAXiXOFhMXh/kJFxrZl1BtBgfMzBi7zSmo0sfY/tO5MufP0dO+q4u7U3/9Q
 fcQBi5PEm7Jd8FMKQS1QkyQfpYoUhd6w66J8yuJuAaNZyz1ZmlN80iSBZME8iE3ZAGxfH46f3Gt
 vBRlVAOjItgxETtAbWY5FAhg7Lj6fabdg8mvspjgMbwWtlH3Xm0zyHYnmcRvscdUHEZ6zDdxVQV
 T5N9bzZ/2IXZkpoC15yQ9t4+RCO9bgl29PCBwU3yd4ry1qPq+TQ+8cY/Ws8JYHUY2yFjiBGKuOd
 xg4LvcehwJz6cUGSwX75srxZsdsvr4GKAXfgnZAzYJXyUMcAuiaddnyfl1FtKKwPFJF3rAQyijm
 Ews1Fw9SrFZuNyA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 7vvl2yo62TlBGOOF5nbRD190JQNa8t6m
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=6995f5d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kJUOvC4QKfPL0WEIkKwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7vvl2yo62TlBGOOF5nbRD190JQNa8t6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0OCBTYWx0ZWRfX0NNY1p49330d
 snB8tWErZBoU5LZAunkwomWA3CGeA+Z/yEtpB/U9aplCJgKs3TLJfahoVf+659gWhu9aAf9VzAE
 S0Hd9eIHqPE5+RiiXH1GViHbVC2dM8puhW94GiGbW8lOkd2L+MoY515PFaDp7rSR0n1zasbgoPp
 FXSpTq8qbKzXKvaelostVr9bLkFbRmXAAKE3OIBr2xPZV3sW0yhL49lYabs/qIlzJnm5o40VHSn
 FhQz5DkBXdpHE7hIK2Hl65yLcT9lpFGc3Xa9KCAOX5w4leUa4KNuznf2fCGp4PCBacr3kdBLxjv
 e4/1LOuTclkwEgg6WyMbJgxDWl3yJRNXxbPbPoYzqa5u12J+1go/gtP9+aAtNjTVh7F+3AWE3IS
 yhQkfEf+dKd1GO39pEIBAk11UuC9dqAlef1BWFJdaYt2b6u3LuWbJ2dpi1WeyCWpb8vgp3VrK74
 E6S1/sRLxeCTv+bVquw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93309-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: F1FBC158423
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index bb688a5d21c2..dd6e33d2dc5d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -618,8 +618,8 @@ panel@0 {
 		vci-supply = <&vreg_l13b_3p0>;
 		vdd-supply = <&vreg_l11b_1p2>;
 
-		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
-		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
 		pinctrl-names = "default", "sleep";
 
 		port {
@@ -821,14 +821,7 @@ disp0_reset_n_suspend: disp0-reset-n-suspend-state {
 		bias-pull-down;
 	};
 
-	mdp_vsync_active: mdp-vsync-active-state {
-		pins = "gpio86";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	mdp_vsync_suspend: mdp-vsync-suspend-state {
+	mdp_vsync: mdp-vsync-state {
 		pins = "gpio86";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 087828c60692..a3982ae22929 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -908,8 +908,8 @@ panel@0 {
 		vci-supply = <&vreg_l13b_3p0>;
 		vdd-supply = <&vreg_l11b_1p2>;
 
-		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
-		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
 		pinctrl-names = "default", "sleep";
 
 		port {
@@ -1244,14 +1244,7 @@ disp0_reset_n_suspend: disp0-reset-n-suspend-state {
 		bias-pull-down;
 	};
 
-	mdp_vsync_active: mdp-vsync-active-state {
-		pins = "gpio86";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	mdp_vsync_suspend: mdp-vsync-suspend-state {
+	mdp_vsync: mdp-vsync-state {
 		pins = "gpio86";
 		function = "mdp_vsync";
 		drive-strength = <2>;

-- 
2.51.0


