Return-Path: <linux-arm-msm+bounces-99056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I9nFxYUwGnMDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:08:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C92E9ED2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 972AC300CC9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 16:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2655367F59;
	Sun, 22 Mar 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3Psc8Hq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLt479E6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D1366550
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195716; cv=none; b=o95Ft57ihN9nZrqzZHKpx/N6qcvU71efN80cZyMF0LmiGW20nFJrQ91Nf68H5SM1nALSiR+3lmdNUwWONMgcodhmXyKWtujZuAYrIONDGrydtRM/U1/78A+j9UbtPNUWdZW0ghN2rNghvZ203bBJcKmHjN5lp7cOlNl0jAiabEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195716; c=relaxed/simple;
	bh=Jn/7kW+TtTWyzFJd33pnOfItUBbGG3+oelgBm4l2OS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBVXYwm9JFYYYUow+xTz7D0IQ2wWOyeC9ZtMTIkCT/qaE5HC6fehSrquSLBUZFyA2qL3jYuxYp8DLRgR1WWLGVJaWmuA4TdpYqSAnSBihXU2/LP0u7KgUYmV+0SRgL8+vNlki83Blc8fE5AH2lrNyU2v1kI/d6cxoK/t5VYKMg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3Psc8Hq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLt479E6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MEdMRB3535811
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6h4OnlrvZRfWeNvG2MAwP3BOgMWsgBjR7/TL6GoA5o=; b=h3Psc8HqdDGmeXw5
	XHCYKBTIoSgBOg7qRdSXWGRoDz1wA7hlla04/dT/TvmNQidRm7k9GoQVktuq949O
	2vXwf21m9ZPPooqmMd/B4obeW87zOWMu9kZyK0+wjP9ub4/VNPmybn72nsRbp4Cu
	t6wzu57PiCxZy34hOUp4Mqm6b+pFT8pe0wpUgi5Imbmu2HjPOXemw09jolwj9Y0O
	jS+nhrHMUhK43wFIiCepdMSEniC/KksPsj16j0i7Sb/2Z9G4XvJHnVR633bN4c3r
	MEVkaRflpQBWMCY8Zpqzi8y45qzJLJy9P2b2d983oapiHzW+NPv+Du3oinLQEIXV
	oHhv9Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e2t2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso19770051cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195714; x=1774800514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6h4OnlrvZRfWeNvG2MAwP3BOgMWsgBjR7/TL6GoA5o=;
        b=RLt479E6S225fjQWmRxsfuc13GzJNWfumhv7EuLaCRrGmc6FfNj4sCDYkH6fhsroOM
         WAOXwzbrnWG327HHFnnwZ4c9yRXif/V+PynDy4DBrqo8beYyCrqgyPph4p8Jula/dTt7
         tB4cv7ZmZ2j8OG3HK4w7UrTA67R5EVkrahtFJsS/ZmtjkIPecW1CP+6XMyaVnAbkOxhL
         yf5/PFXAZKVH+6VfUWlVvKbIu4j58eYmkpO7COftqRLBHP981JvTRA0dGhcK5HfdiVwF
         WWMjNdDTz1bpVELIEYtySOYi8Q1uWlF5Ka240LZhQqd0yZZDDevv/2EPDUH9bW4g5whr
         nSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195714; x=1774800514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6h4OnlrvZRfWeNvG2MAwP3BOgMWsgBjR7/TL6GoA5o=;
        b=R1E0VReq7dF42e3IQE/YU9jOWLt0vmJ64iQNWe4dOqaSsWhS7iD0ZauCLLpddBVSYT
         eP37yo/sGeAvxTYLWGl9p6aip3RfvlejGdiPnAKAgQkWSRxMLojVZqpUb4E4g6qoTi1q
         PVTmWljztIBISWFs9rlUa0uMvDpEpxEgVygmxEv3QsTiuGpt3eJD/xTkaMW1fZcdMWBV
         sFjlTvZnAdoIIjGd2CbIHKwf4Flp/UPyy1zNokSJDhjcqST4A0/GhZNZD5afLAWbkDyi
         fGD2UymE3N0lQGGnhzp+4QZQ6QTVfbDb9s35PQsEZgRl3TdmuKjvuNbDIqXxGwHUS/oZ
         Vnpw==
X-Forwarded-Encrypted: i=1; AJvYcCUzorXzRvlVPYo0mrAim9YppCRkzgaczrYfGrD4dpSG0IB0GE6mMmlcRpNBqtgdXifkbL18e6OcBzGvAjdp@vger.kernel.org
X-Gm-Message-State: AOJu0YzwYBlOksQvr5rDgb6OrMCNerz+0sJJ//y+UbY8H2lcIdEgjyOU
	Z8aH2l1BHFwxQfGbvQU5qqJGasX6j4d1oBytx9TX3UGrcIA8YkAKRAyWVGWR9h32F/ma2Re75p0
	niXd8VJpEd75uqWR86oOSUUnKKeJDiijXexgo3dOuK7EEUoWZlnmIkF8oKN/oraweDoDo
X-Gm-Gg: ATEYQzzm1bjitlSfCqCyjJ1VVm4DMxT6fbgG8c0/xZNihZjHGwJ+JgjXrCP0J5M6fvL
	bUPxrZjoQbQowDWLiQJEvbD7IG4DS0nGdKu26Z29WJ/b2eQ5yY3HtV9bXiplGsHRbcxB9BfDxyr
	UXpmo43zW5D4wpfzhF6DEIsAPXZo+Hrz1Hp3foSryiSIhgC8XKTPUrh/fmPZM/UZJnjv7fKwbqb
	91X3lgG5iUSRdgx3JKGOIUVvEI/hDnNYbgDq+qnkALyI605QOnU9S2k46SYtZBbahvcqFymVmMo
	cck2VzezOMfMI3qDLFt2dRRvKQkajNc02zRGecbS2U30nLHu4kQKJR8CIRXrEVBHJroqDX5SppW
	W7l6vFmChouiKPkFix8avigNmjAk=
X-Received: by 2002:ac8:5893:0:b0:509:3025:ff59 with SMTP id d75a77b69052e-50b3743b32dmr151308701cf.20.1774195713830;
        Sun, 22 Mar 2026 09:08:33 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:3025:ff59 with SMTP id d75a77b69052e-50b3743b32dmr151308221cf.20.1774195713249;
        Sun, 22 Mar 2026 09:08:33 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 18:08:19 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jn/7kW+TtTWyzFJd33pnOfItUBbGG3+oelgBm4l2OS0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP5mK8fQ/AWmspi7gaqDC3OQxfjaDhMx+W7L
 d1SoNCgLE+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT+QAKCRAbX0TJAJUV
 Vt4GD/49JKSufspCV7U341xtQxHLue4hXlHe0uitvEo35ndPm0+X+LJKXORMYWtkNjMPyNW7cJL
 RnDB6n2FRrk3J1jIhiUoKrV+Iwf63EdGV7Idp6SDlRlBr6/Xq38ClM4dDkzWdIIZqRb6nMH1ElF
 01j7jG9ZjdMotmAhKXRkn1bAhM+TLj/pL1iqfIickF6hBTnLe5+KL7bASBgFVA3D3AlwssQPnPf
 fqSqIRVbkuTahkpIvSe62Dnep6roVl7vyBzg0hlnDvxT34PAvF3TX3X0ryeR2O4GhkzyBhh3CoY
 HSPnIMMPbgL8PZM0MQOwR3nnuTCxkA5ZDwQ/b1Zr3hcT4JuqMs8PurdYBiysmX9AHs6GJmzuEDo
 sN4puG5VxKKsYyqbBGbp6YM3GGeO9nrnX4LyXqr8vJ45VI3Rd/ifkF+T729b4Drra4RXm/zARQK
 R8fUu7rOglSyu2Vap2GuzYhMkJkJTGkTsIgpe87ynfKWSBWvX643DX+jlw4n7c8DELGqjLjXJ3c
 3KZEj/+qTnCN3Ix2JPXqBvBSL9SaUIuLQLkGgICIkjTR1tXp+OYncVRooatpRrNagCgwXmnF9qb
 OzF4iEDryRpy7k4BNuWjMM9pzCn5zGyfuAyY2YbV78IzrqS71xcb+1dbGpzzHsAMBdCRtzOijQD
 JGix93wrkPHwKsw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: yKjSMMxwE9_pzHWFgNjMgKHYN45HCZda
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c01402 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jx7dCe-4cp8LvEwUiLcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfX3IdZktGYFMTk
 vjHNDlWt/5akx2j5wzFBYtIiqvYV+a37/SIsB6SKohLgcKgc771+uSpuig05TJX7e/MM9mRML0N
 gCgcuPrRjO1TkSWQUh3oDpE4ZLiux8XHh7ihITPeWFkxtwjDYxBrk6z9uPx30B3uUxgDkpvquiO
 NK8akscgpzkVGGZxYiT7MQjS2ej0Xdd/OOaqtOkiXA2u41Oy7Ll5z7UZlA+pT/fW76feLeYJgyQ
 7TO75fOBBccNufz+QT6UyagoRXu3RJx0nbkECTTsPSmYmRHjB+nrYoJFHaWgJynjCi4jPM5yy6T
 eezj0IeJ9T9NG6aEc99LrI+1GpjoCibNlSWti1YDsrtbyRHDfbiXgjCFN11tQTLBVE+tBNB+MnQ
 e7QkrdQJClcQAONZ9ImSK3rYbYdxBJT30JF3xWkqy5GjVmdOxHAMe5FdYlKI01iN26gA+FV8UwU
 ApGPvjjkkbgx3wVyFXw==
X-Proofpoint-GUID: yKjSMMxwE9_pzHWFgNjMgKHYN45HCZda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99056-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 123C92E9ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some coding style issues were raised during review but the devicetree
was merged meanwhile. Address them here.

These changes are non-functional.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 190f10a77d74..5dc3aede6842 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -686,7 +686,7 @@ pcie_noc: interconnect@16c0000 {
 			reg = <0x0 0x016c0000 0x0 0x11400>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
-				<&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
 			#interconnect-cells = <2>;
 		};
 
@@ -722,7 +722,6 @@ ufs_mem_phy: phy@1d80000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
 				 <&tcsr TCSR_UFS_CLKREF_EN>;
-
 			clock-names = "ref",
 				      "ref_aux",
 				      "qref";
@@ -912,10 +911,12 @@ pdc: interrupt-controller@b220000 {
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";
-			reg = <0 0x0c400000 0 0x3000>,
-			      <0 0x0c500000 0 0x400000>,
-			      <0 0x0c440000 0 0x80000>;
-			reg-names = "core", "chnls", "obsrvr";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr";
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
@@ -925,9 +926,10 @@ spmi: arbiter@c400000 {
 			ranges;
 
 			spmi_bus0: spmi@c42d000 {
-				reg = <0 0x0c42d000 0 0x4000>,
-				      <0 0x0c4c0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c42d000 0x0 0x4000>,
+				      <0x0 0x0c4c0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -939,9 +941,10 @@ spmi_bus0: spmi@c42d000 {
 			};
 
 			spmi_bus1: spmi@c432000 {
-				reg = <0 0x0c432000 0 0x4000>,
-				      <0 0x0c4d0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c432000 0x0 0x4000>,
+				      <0x0 0x0c4d0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1


