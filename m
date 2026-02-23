Return-Path: <linux-arm-msm+bounces-93721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KlJGcJ1nGmwHwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:44:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2B178F3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C976307318D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296802FD1D0;
	Mon, 23 Feb 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+ygIY2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9NG0LgH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1632F83CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861083; cv=none; b=AXc81pQUTIcbagZ8+6nGkwJk0KW8T8+T5zx6we+SOtBMIcoi4P5yghS4u17s591yY2yHyLs2u2odEUVpzmqvYR69gvxbYBBtqqbpT8psHx9+dwAv0ckQmn8SFKnKwzaDJ3n26IuYPiA2EVlDcSgcWD6/K7EQJXY0xHm0G9vpyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861083; c=relaxed/simple;
	bh=ZJhZIon/fjcaufe2HaSY/5xlurC+ejRJ25ruSgZ0viQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGo6iAm8WIKYvjP95cbqQGu8JoRUZ60nUzuhpzqQ31pca1x4QTiNYUymP4K66eA0jm+GuBKDhSzWtsAvppDUP5zFDGRE320Wf/PlY3D0hxJjls0VYqyJeyXcXfFH6DYokFcb80F1/0dYmTcj7gSjVGAOwx3MlEkkX7FC9ZdsAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+ygIY2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9NG0LgH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFBBi11745021
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZxK/NzSSMmuW+dwLBRWgJMn3AMRKMXxbCaIsI3e8/Q=; b=U+ygIY2yAVsQyAFD
	1mNWq1mb+zFSkl9KfN5cR+xNWSNFa/JBEXMzB2J+IQI970iWXT3RH6Z8ZtICGy42
	2cmZMXCYTataEDM8VccGOP4xVQugMIFgcgi4qxoNixT004+YHk4jnVC6mysTeiDa
	SJ4Wx3x5jBvERA0UpyPcSvuB0InxbvyuKn+oS5uOOEq9oxEjLAvI/Cw3PZaycg9r
	K2DWsSOMcUnyTcQ7nHzt+BkbZGiDwEORBEix2ft0xlyEU1wGzmb+k7EZWHwjC2id
	z7ZSfk+mWFfCZ4OHd0+vxYKVDQ5WUt8q3bcc22h5+ltisSWzLOVuHnMM5pBPKMBr
	liLuxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgwb5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:37:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so646989285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 07:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771861079; x=1772465879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZxK/NzSSMmuW+dwLBRWgJMn3AMRKMXxbCaIsI3e8/Q=;
        b=E9NG0LgHySkaC2rFWVHX1Is8u8c+pwSvGA0YAGyPcZH65D/Cu1GVWhfbS+U032LfaP
         VGD6CbwF+qpA1ZEYJS2usPfswZN8p4qhmsulstP5inTyeA4FtiDamUuUceypPCwVR9pK
         DeOrDD/p+aa4FXHFUmXS5st6qhsGD3FmgZWRx6AvwlJFTKQzFWRUmiAtB50rAxTedsY5
         w80hKxMFLoYy/R/W83ZRV8uy0MXGvOLOzHPfpN2ENAgFfGGsHsNnTmfb3QRzb2ViyeJl
         0LT+yacA7Tk9DATRhIhLasWJMol2bEaOPQ5Y6PBPXhW4GbgILTGi3AK/eV0mZ+WOb6T/
         +6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861079; x=1772465879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZxK/NzSSMmuW+dwLBRWgJMn3AMRKMXxbCaIsI3e8/Q=;
        b=BfXh5x0pSVWNP9jsrC6/rsVbYohb/c7uEy6v3ED5nka3cm2CNR/8vXa4kj5kiCLvZR
         xk460e2xQlJ/+i4qSHLOIhjy/6WhTuk+fN7eAHUm8gporfn9pgFfiR4w5Vz8d941UY4I
         bRyuinhQoss1PUjCVNUE8r9gFIyVevAlyeijWkUENYW3AoLjcwE8fcFU/JPpoRRPMFot
         mlkRIYjLFyFRGc8ejohKFYVh2aJddXshIyHHotN/BG1X0cttZegOnq6sczEqYlcIbfHQ
         rLvQz56yEQ1rEK0+dF1Y9yPICh7e7AoXmCzLWrev4iXCSfRdEGppkeEV4t7uvwr/419d
         tVnA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9B39DXiGBSDdQ1igYeA+htNZ9VYYBmOx6PLQz45X11hUrECxw89m8hEGPlNI3BOkqt0QRzqCFo1OHJvM@vger.kernel.org
X-Gm-Message-State: AOJu0YyoctLgrK7p/gVLqxlpTJAIKTp0cfgCUwGYTkA8ZpnBi10dX8YA
	NhA2zjg0oGoUP20S6SO9kBgjSzYz1BDyHxb6UDkFwYfK7DUWWZnq2RJfKacL/BdNjA8CdXJxwfm
	gOukB9H1IjuBBWtSFSwL56R8+ycGCVNrEKygwrxHo3WLoVmFV0iEphdvXp7xkHGTZmZLb
X-Gm-Gg: AZuq6aIuF8ZX85tLk+iVn434RukSpjoexIRhIcGP6lE4iPcxlOxjQFFMLi/5HsrXKok
	3GEckakDcig41RZRWiUSl+ROi0029IPD/WTMgVP9ifiY8Va9wGyh27r1dwzEBHjA4KxpOKw20Vo
	4KIiQnYnfRtjYZjN5QfMuIj8bzXAM8o0ner/3zeMckBFIguaQq23Dd9d89OJxTEFY60gGBPS0qa
	jXkNUg6dMOeA8BCL8niCd+kcO7cix0Emn5mlCKHe2nT+nghk0uduXcRM/WR4ayRUlTS2538Wcj9
	jn4ZA6p5fKux8KN65yyJNT+zUUeHIH0Ln4m4N+0ZA8I7OwYulj29vSttrhpG7jT60gC4uInJFwa
	pwQYsJrI/oIir6mbKqJIuK5lcoLf9fQ==
X-Received: by 2002:a05:620a:46a9:b0:8cb:2732:81ef with SMTP id af79cd13be357-8cb8ca0d770mr1154474085a.35.1771861078592;
        Mon, 23 Feb 2026 07:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8cb:2732:81ef with SMTP id af79cd13be357-8cb8ca0d770mr1154469085a.35.1771861078014;
        Mon, 23 Feb 2026 07:37:58 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c96csm21880679f8f.30.2026.02.23.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:37:57 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 17:37:44 +0200
Subject: [PATCH RFT v2 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-dts-qcom-glymur-add-usb-support-v2-2-f4e0f38db21d@oss.qualcomm.com>
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
In-Reply-To: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=18928;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=upt0jnxRG4VtJ/WIK9XnCHDgH9guv0V9Dzpg13vjR6g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnHROpmyZZ/aHStWB07p2JdUpHxTWiHmFx837m
 A3oABluDXCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZx0TgAKCRAbX0TJAJUV
 VkdIEACUGJZO2wITTPX11oDRbXdyZhJsAIpUhIf2TTlFgiVON5BIM5Rs/r6g/tmwDuyDKJpWT7J
 8zmKSESlVz2JbR0ZFPspcufnzlv+AeCmKDxGaN6+Lc6Fj7ZdS2cufze/zz+wv6dx9bfxzWqoJaS
 iVlBXnl85+21Jdx5jnogFNQ/zy6JlEWp7MAepkcgkTr3jFcb7FTWU7Oc2qWD5CZ5rB8uTBVUsYu
 NhfTJMxWD20u94TLQ7Oyh+xVRaVU7FErkw89nq8QwCDyAfauOKT3ilJ58ZQMFLdCBVMWx3Uk3du
 jnMipsux2fbMimfROiv0nNzR8yQ77H2GNhnpS+H4cvpRZmQL1aYMhrV1f/ww5vVkdqEnBdkaBR7
 ltjZ64Rm222xafH3U1CiWBDmAP/AjLfA07coWDN7gc2wZVRsFF/alPwj8BndDcxFFjUnqT94gbx
 flNGhi/hlBdXut3EYSl5YzoKASz2t1/v3tSWYoCvkqeDP03YVWLh2xA2KuDzDzL5pFv3bsI0wuI
 hFC9OxCnRMVuS4q3u2DkFR0BlZl9ZUSclhpaSrt8qmENiYIsIYdF7FiTFisuWPWnLyXX2zoWaH2
 X60PaCNP4F8Lx312F6MsSmAtO4+Qd3kKnnvuMOefOApx4pzYIPaGGWR4Ao66IiGn5OAzpEdvhHa
 l30OHSqYfwOu4gg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzMyBTYWx0ZWRfX0TP/8SXDhLtp
 HkeBBAr4QmhLUHCHRfVznYQK0GAJ4ojjZwJg+5Ovs0o3U2pxIVLds5FrLU1fwtuYRYw+FyN7H37
 oJF5XFbwK7o8ugqFmSCUh6OfG29cyAwIQgeSLstOJpfsHDuqUwvvjxcOrGXS10VHX+3Ueo0TioT
 O7G6ECMn7aVH/UQu+l5vy35yyY+KIKhEMWfIKWazzNI4NM5/nffEd9KJMYYu6j038GK5maeUfcS
 yh/HisVXDUpJ2seSpxRFhdHzL5UfPJ/vknB9Jfxg6PIBA9Q+HN+5OcGncl+1DyZ8ViQ7d48wQWX
 XjxghpN74aEhLZ6Te0dogsx8lEj/twcGS57QVsvhoktMTJsxZQc/4gGTltHIQFP6nqdmyXHSAJw
 5NxMfQFPMi5eWT3tZzhxOSJESNyS78Q2QfhNaFEXlMq38zYHvG3dAAyYk+webNET8S8cf6JZ3pc
 MPCelMkSTHRSDtbhsnQ==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c7458 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8wER65Pd3tfT56eRIC8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _JI6QRgJ4I4ry044PldhPGdfB1NgHbkJ
X-Proofpoint-ORIG-GUID: _JI6QRgJ4I4ry044PldhPGdfB1NgHbkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93721-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCC2B178F3A
X-Rspamd-Action: no action

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

The Glymur USB system contains 3 USB type C ports, 1 USB multiport
controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
DWC3 based, so describe them as flattened DWC3 QCOM nodes.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 691 ++++++++++++++++++++++++++++++++++-
 1 file changed, 686 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..2aa9af8c96ce 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -750,11 +750,11 @@ gcc: clock-controller@100000 {
 				 <0>,				/* UFS PHY RX Symbol 0 */
 				 <0>,				/* UFS PHY RX Symbol 1 */
 				 <0>,				/* UFS PHY TX Symbol 0 */
-				 <0>,				/* USB3 PHY 0 */
-				 <0>,				/* USB3 PHY 1 */
-				 <0>,				/* USB3 PHY 2 */
-				 <0>,				/* USB3 UNI PHY pipe 0 */
-				 <0>,				/* USB3 UNI PHY pipe 1 */
+				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>,				/* USB4 PHY 0 pcie pipe */
 				 <0>,				/* USB4 PHY 0 Max pipe */
 				 <0>,				/* USB4 PHY 1 pcie pipe */
@@ -2264,6 +2264,254 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		usb_hs_phy: phy@fa0000 {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+			reg = <0x0 0x00fa0000 0x0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_USB20_HS_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_hsphy0: phy@fa1000 {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0x0 0x00fa1000 0x0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_hsphy1: phy@fa2000  {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0x0 0x00fa2000 0x0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_qmpphy0: phy@fa3000 {
+			compatible = "qcom,glymur-qmp-usb3-uni-phy";
+			reg = <0x0 0x00fa3000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_0_CLKREF_EN>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+			clock-names = "aux",
+				      "clkref",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			power-domains = <&gcc GCC_USB3_MP_SS0_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_MP_SS0_PHY_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			clock-output-names = "usb3_uni_phy_0_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_mp_qmpphy1: phy@fa5000 {
+			compatible = "qcom,glymur-qmp-usb3-uni-phy";
+			reg = <0x0 0x00fa5000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_1_CLKREF_EN>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
+			clock-names = "aux",
+				      "clkref",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			power-domains = <&gcc GCC_USB3_MP_SS1_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_MP_SS1_PHY_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			clock-output-names = "usb3_uni_phy_1_pipe_clk_src";
+
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_0_hsphy: phy@fd3000 {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0x0 0x00fd3000 0x0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_0_qmpphy: phy@fd5000 {
+			compatible = "qcom,glymur-qmp-usb3-dp-phy";
+			reg = <0x0 0x00fd5000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
+
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			mode-switch;
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb_1_hsphy: phy@fdd000  {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0x0 0x00fdd000 0x0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_1_qmpphy: phy@fde000 {
+			compatible = "qcom,glymur-qmp-usb3-dp-phy";
+			reg = <0x0 0x00fde000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
+				 <&tcsr TCSR_USB4_1_CLKREF_EN>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe",
+				      "clkref";
+
+			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			mode-switch;
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,glymur-cnoc-main";
 			reg = <0x0 0x01500000 0x0 0x17080>;
@@ -3367,6 +3615,439 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		usb_2_hsphy: phy@88e0000  {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0x0 0x088e0000 0x0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_4_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_TERT_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_2_qmpphy: phy@88e1000 {
+			compatible = "qcom,glymur-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e1000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
+				 <&tcsr TCSR_USB4_2_CLKREF_EN>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe",
+				      "clkref";
+
+			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_PHY_TERT_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_TERT_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			mode-switch;
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_2_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_2_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_2_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_2_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb_0: usb@a600000 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 90 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			iommus = <&apps_smmu 0x1420 0x0>;
+			phys = <&usb_0_hsphy>,
+			       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			usb-role-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
+		usb_1: usb@a800000 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a800000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
+				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 88 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 87 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 76 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			resets = <&gcc GCC_USB30_SEC_BCR>;
+			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
+
+			iommus = <&apps_smmu 0x1460 0x0>;
+
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
+		usb_2: usb@a000000 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a000000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_USB30_TERT_SLEEP_CLK>,
+				 <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 871 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 89 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 81 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 75 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			resets = <&gcc GCC_USB30_TERT_BCR>;
+			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
+
+			iommus = <&apps_smmu 0x420 0x0>;
+
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_2_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_2_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_2_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
+		usb_hs: usb@a2f8800 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a200000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
+					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "hs_phy_irq";
+
+			resets = <&gcc GCC_USB20_PRIM_BCR>;
+
+			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x0ce0 0x0>;
+
+			interconnects = <&aggre3_noc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
+			phys = <&usb_hs_phy>;
+			phy-names = "usb2-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			dr_mode = "host";
+
+			maximum-speed = "high-speed";
+
+			status = "disabled";
+		};
+
+		usb_mp: usb@a400000 {
+			compatible = "qcom,glymur-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0x0 0x0a400000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 78 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 77 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "ss_phy_1",
+					  "ss_phy_2";
+
+			resets = <&gcc GCC_USB30_MP_BCR>;
+			power-domains = <&gcc GCC_USB30_MP_GDSC>;
+
+			iommus = <&apps_smmu 0xda0 0x0>;
+
+			phys = <&usb_mp_hsphy0>,
+			       <&usb_mp_qmpphy0>,
+			       <&usb_mp_hsphy1>,
+			       <&usb_mp_qmpphy1>;
+			phy-names = "usb2-0",
+				    "usb3-0",
+				    "usb2-1",
+				    "usb3-1";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			dr_mode = "host";
+
+			status = "disabled";
+		};
+
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.48.1


