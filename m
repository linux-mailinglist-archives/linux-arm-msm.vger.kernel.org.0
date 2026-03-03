Return-Path: <linux-arm-msm+bounces-95060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hj9EISYpmltRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:15:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D223F1EAA5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05C3C30C1691
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FC8388379;
	Tue,  3 Mar 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pps3kqrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqp02rYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F556388E70
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525271; cv=none; b=C+rZp2UkLkFzl5o/BCliWYKeYvCBbS1m7DTeJnt17MFmB0sKd0OEM3oOJRv9/tH2FmDKRkEk4fOgQIv83aHXeuAjXeGg9+0Vo1A+dZXYtBMnfb37Me9taPM5uuUvp0LmAXA+1xj5bje1XM0GNjNLn1vuVkm8McGxfbx2vbKLmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525271; c=relaxed/simple;
	bh=HZwFUQOQ6A7aTZLiMxZmYJR9QvaqliTJcqwhopazxpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OPUUr9tPJ5I9AUS796YaYES5yqSkwMOUwmTvbhj4M+GObz4g+AfQHbKq/+WlsHBG+1KGG9AYY+fQW5zHdywbrTaS4aqmD+8xVN/+E6m4EMunjENzmNJxKt1IzqkYsfvit39bE+WBQxUlJuMrw+xyhg6PK+N3bmhhU1VogY7Z2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pps3kqrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqp02rYw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236Hfbl959755
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Kl1wLQ1uXk
	gLFLhB/id2ti0lzPAVGQK+jUBMyUiT1o=; b=Pps3kqrhjjTr2AzzOEtQ22inpEo
	7yFv9lrYnv6eYqeDAkY+l/FbSEzH26BzPmK9YWl4NjM0Rd5HJwJFIlG8NThZDBI7
	m0SqakmPl8F5ZDRTkDmAGfVCVIcA87INRddUlSHsMhQ69qgRKCAuOOPtUUe17n3r
	IUyfD6ScrDIOF4dK3zTJ9VIyQZFVaAWYjOWLpPpshitYuVFV4mZ9HV0bwalR3ZQV
	3Rl/cnt6Fyt45Skjn8V91hTakzS24a0ctJraJOTUlqD9fi6OHI2gTIh37FyTvAAD
	0gW3flOUMiIxOfVQLym5KdpQLzUJEzXFB0FoWRFFNdJ1mxgufz+EbNgJRUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx59x6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:07:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4cdfc468so21111965ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772525267; x=1773130067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Kl1wLQ1uXkgLFLhB/id2ti0lzPAVGQK+jUBMyUiT1o=;
        b=aqp02rYwOfIglOWWDxqAGnAwW27l+auFZupX2oRw7E/EEZyTEEt1j2f6m6IEdb/KTa
         D3PqgnJIOO5/iJIDD7HsLMfBMph18dQmNqSxrJrQwYIxI1uMewD0W+jQeK/7818ou0tX
         QRIluknfIH+4R88052m/XiaW6FtP4gSa4BTAUIYtI215i6nxW0Zllj9xljngGND0E1Is
         LzkDH7bKr2UoCQp/sJMgLuifIGXMN9MaQm9SUr3GcSiYqkEP0nK2f8+JYj3Pt4i91SlZ
         Wq9Q4OzrNxe52WLaWGDZpJCFanbYwitnk3GQX0iO7hcRLuVrcIZ39MipTtRblKCnJrqO
         zV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525267; x=1773130067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Kl1wLQ1uXkgLFLhB/id2ti0lzPAVGQK+jUBMyUiT1o=;
        b=dJzvX2R0VY7PsvZdUBE4rxSdKEDIyoEFCkbLHbt3e1mL1gpg45+4fgZyzFhU/22aDY
         eySUbs4D1/KBDNozVMP6UVfL7DsNmajnvhDgV3GxdW/nRZvoWYCBy3BdKyx4BGMpykZl
         CCJb9xvy2p49J4c6g5ftFXnDtVOZko+RH8YsOgYD9EZasYCnTJ1wnEix4uUGrYSTFgPN
         rKbi/EeVEQVhQ70wbNh2NoNk/YuKyrCHC938DkSj1XWqDl3aPBKSoAAafTnHuSN6ULMG
         KdNJPxHHpJjMZTyCsz/wANNPq1mkuhqrWyOLUJTE1IhfUTLG7UFy7OV24pjC4omXU5w3
         P79g==
X-Gm-Message-State: AOJu0YyIQHRJONUIl+stf+Lhkzrn2fOpkzKb5h766dNVRuvaeSporXIn
	VbbL5sSosvDPGmaHFjZ2AwRJN5rlhjQyyVUfvSGGHYU4T8DQIRPxKR0Bh2nuCtQAzuo8osbCq/T
	+FACnE7X31UYa7z08GP4YPdrKB2+pqWJwm/ESkvKDNiSb1Gwmf65DQU+0lQvm+t68DJ+W
X-Gm-Gg: ATEYQzxCXBjz/rtVFla1Jb5A4UfyQLNFGhEZzRDWghB3WikBmzh6tTBrAbc396wLFEs
	hl/vABGaCvadQIFDYjZc7jTOwemK7zEaTg59X9NDyxqY6IdQ5/TV48gO/jPZEaMD5l5ECOf8ivr
	Ie6cF9n73ux39WXKEMOouaDyoD02ao8kV34dRSfl17aPlWTnW2g8AThjwF10F+5Y4Ng+u0qQF3j
	djNLtKx5kemZaz6a310ROixWdrd+DNOKcHbcwhya2SLrJk4SjVS7eTXGIPxUGq65IifZHny7LbD
	Gi7dBXSGVxaRQsTUdl1OF+u96qh6EQwpt0/L7KPyRgathEstW5uF8F5be50bKqG85mjOZBjoaL0
	RiuxEZIRBXRF8nWzoaQJQjmFJUxJ4xTLTxgdzhOC4tvdL7Wc/NUXHB8o=
X-Received: by 2002:a17:902:d590:b0:2ae:456d:b836 with SMTP id d9443c01a7336-2ae456dbc70mr97978965ad.47.1772525267558;
        Tue, 03 Mar 2026 00:07:47 -0800 (PST)
X-Received: by 2002:a17:902:d590:b0:2ae:456d:b836 with SMTP id d9443c01a7336-2ae456dbc70mr97978615ad.47.1772525267086;
        Tue, 03 Mar 2026 00:07:47 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm1445883a91.16.2026.03.03.00.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:07:46 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 2/4] arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for tertiary USB controller
Date: Tue,  3 Mar 2026 13:37:26 +0530
Message-Id: <20260303080728.479557-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
References: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1OCBTYWx0ZWRfX5G9k/Na7NnB0
 G2mnVRz2m4iqXolNY/51N26m8DJM2jTCLEDGJsLHtNFXB+fzHGVIuupPzf4cBJ3NF2H6fX7qhnN
 jEKw9KGRinpIZcIv3KG+xDoAsUCYsx+RiFlVEgNyiqr/cn2expV5QEHc/lqI75GNUQtUtylrkYb
 NntwTOywbIzSTGsHPCbmKTSOOP85r5OAAm74gPo6ACc1Ri+0YaeqxgvrKCZwtQE7C3fr7X4VWxa
 Gf0mCoSacFyfMNtSJGccG1PbFlejuVHKS+vENDPn7UsPqdaqGwvppjsjIbVWf017Pz4zq1vogUY
 gvCbcCkLQjrx4ixyPZWX6RbTfY+NB9AHYdkMgA1HhFdz9ufHoSN2y1XFmnuxpQ9xW10AZdJIVm4
 9vVRtYPwONTqBBfG3YZG1QXM7WLHoWes1joSVLQ2391ncCC2qDx+5UXG7BA7pDQL6pSy6lgtXQ+
 3cVfKK9f0HOxSagckSQ==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a696d4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZrvUoS1E-TgtW8Atug8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: kXkESEWjsZmOOgjRLvURoBbmPzSHtey0
X-Proofpoint-ORIG-GUID: kXkESEWjsZmOOgjRLvURoBbmPzSHtey0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030058
X-Rspamd-Queue-Id: D223F1EAA5B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95060-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[a400000:email,1f40000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable usb-role-switch for the tertiary USB controller on Lemans.

Additionally, add a port node with an HS endpoint so the controller can be
linked through the DT graph to the corresponding connector.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..d0e63336be6b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.34.1


