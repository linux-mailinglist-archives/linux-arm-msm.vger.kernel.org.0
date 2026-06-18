Return-Path: <linux-arm-msm+bounces-113767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dcGYFrjfM2pGHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32869FEE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:08:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ARzKPccX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LuIccRul;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113767-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113767-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B730A30E7398
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686683F1AC5;
	Thu, 18 Jun 2026 12:04:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ED0314D26
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784254; cv=none; b=Fx7pVN9J3yknPuDnlWZnTLmL5QjrLhKrE1yf26ahxcFXsPlBagS2hgtcs5x6F3GN0NOpr/SFdLVtO3rCYMxw3YBRCDBIEVB+Xr/Cw/9qkSKMvtzp6XCabXvT9b15HZgw8IhRm4n+6ccPfMqcx88tbckmOgRYTOrIYIpFQ+2Df/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784254; c=relaxed/simple;
	bh=j9qkY+PEaviJ3uxuPaxM2e/0PVcYDM95Es5UwRR+OlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYJMYciVkuquGbxT6L3afqlVOrYs+N/h5/1egrX/v5GgK0jwEPhQGtlrUXnuan4f9u3DN+JeFM42s4Eso7L3A5ZnJK6RICxi6SMEGNzRJcBeixh2LcwCAnmK4hZwIZ/esQTsqupyfKn1SkSUEm+u3ZIQupcCVVSab/bLR8yLITI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARzKPccX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuIccRul; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArhZt2611766
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7PrDb5q95lzDbbN2mQGKU0CkhEh48l/XRLGUuhOMR4=; b=ARzKPccX9tmPXO32
	h9GfANv2Gx7Q+SBEQARXjnv8SenGgcKUdvrO3n0bifrwmo/JFeURXaa1JVU0+4Zs
	o8AeOq2HomCV474fw9yr4rfNL3EWCHvfHggxeyp8BNaiYIXfEjvmOaxBr5nPK2Qt
	De6Fg1OAI66qsc0B0BRX2wtBx9pBo5InbFrx8sTlmylKa648/YzlhRNGAyIGK4Te
	ulrK0lJMTDQwZa+uC8UOPa/bDBBvSPXN3IdsVK4i4DwiVj2evEjQL9wk9dCpXFfG
	LYAXuXUp2+LtVwNQoWbW71GqUmmyu5qbtlCyqupYB42sebf9ukko1ZZoxkN3Hmep
	gO2gEQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vmrps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bccca5620so985682eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784249; x=1782389049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7PrDb5q95lzDbbN2mQGKU0CkhEh48l/XRLGUuhOMR4=;
        b=LuIccRulyqAYh42BlYMKRq2QuvNoPBaj7BTnc61ZThzqMQf7nsmginXpuxnoqEkzWP
         q24Vz3SzyknWWsHhg+dNcM62K0GoJl/6+VDtIViv0Cpm5BnYZfjUoZR3hXwuBrn5Rjcp
         WYVWnin10f+XVOiI9cdeuBDfxUcNU6aeIPbxXvBYLiJkt5O8LyMtYIBU9Hp2c6ps7K9X
         QBJCwQFvzvEe/DGe5kuE2vnCAMKoXEm53IEbxOwolWBh1YtTKlt6I9j3eerrR2dEQQa0
         +OYwT+aLomI4CBwby40IkfNuVk3gI1tahlP3mH7eKXo8XOJ4upuWGrH6MPaDPn2IC//H
         Dgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784249; x=1782389049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7PrDb5q95lzDbbN2mQGKU0CkhEh48l/XRLGUuhOMR4=;
        b=b/ZgGsAF2KMNk6t5gKHfw9Cg4KbEmuqgaTdSv6SnUDm4ZChJ5vN7c8D6ogF+DLdHsH
         EPy0fVVXwk4A6zJMZtbK0iuqXBKh0CyRuw4Aa429Eodr0HDfzXHNf26Yv/k85P1Nmik3
         3g5v+1YMC1zApxSDV8nKO10I1msfUTXV1w7jMQRHg68dBJMy7uX2Gash1ELX3Gn92+Xd
         AwZdfQP65ZhJgzD0e50pMUKoVQ2c7bTkrqQWxvbIJgnrFMzY+CNWxisoq7kYdl+amNcs
         NSZClPRcryUgnFqPMyh/ZEk26dkmW1lakqR137ohL+9q2Frfk851gs92Xmph2QOiMTGe
         e5zw==
X-Gm-Message-State: AOJu0YxXKmuRje31uwCpluTL1DJicnPqeWcvmp8dcvlDBVYg/aZIjeiU
	sc25njOt1BsA28ZIs0lP/mO4SVZlrL8FYQRrKY4naBt6dlQMSwwkpqBbaSSdkX53EUyrwHDV7bV
	eq1Uaa4gyrMxakA1w+KLp/wUALYLkJBWYv/kKR5MEtYCCHWGxzhyV/w2bM6U4ANyBRPSt
X-Gm-Gg: AfdE7cm4S6JbPevNtXnW3HJrM9DVLOXvQC2Mwj9pZUuNTyEcEG51M7yf5sgLyZh16lp
	mA/oTjmWBnoX2R6SB5+f76l+w50nda0hYgJy7yrf9yBA2f3nm3j6PBbTwoJNc27GKdnkLTH6ivq
	beYp2eI/6PegkuYwwtMYmj429X1pbDqAczONcS3HflCAntJ3AKYjQ5Fpui0Z7gx4yv8S4btKosF
	77MP1QbQZS/oRBdhSfGlYiy/ISNA+e7XIyUsFDpwByPlGyu2PfiKOsrgYDRX+7rLcGIXZ2jTkFg
	Sya1SGZGG1JnkJtE6r690lchsn59VYjQkLfV+VMSkxlLGpJ8QmVQ0m4ev6Jyl8de7nmXa2xiI8J
	T/2wsur3CepnLKfMiG881b14KjzJI01uxKaPaJXe+uukjmNQ10KIh3W0UcbKIU82a1Q==
X-Received: by 2002:a05:7301:6a15:b0:304:e2a5:689c with SMTP id 5a478bee46e88-30bc9f57d2dmr5139669eec.21.1781784248587;
        Thu, 18 Jun 2026 05:04:08 -0700 (PDT)
X-Received: by 2002:a05:7301:6a15:b0:304:e2a5:689c with SMTP id 5a478bee46e88-30bc9f57d2dmr5139617eec.21.1781784248043;
        Thu, 18 Jun 2026 05:04:08 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:04:06 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 05:03:52 -0700
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-pakala-camera-v2-3-9fbb729fd242@oss.qualcomm.com>
References: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
In-Reply-To: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9SaxtIPnDPMsKZ3eoxEbA5OVWg2IXAVK
X-Proofpoint-GUID: 9SaxtIPnDPMsKZ3eoxEbA5OVWg2IXAVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX6s6ktCstC44G
 ADeKYoDYL6KiBWXJgXOxhMday6m/zJIxiluDqLnGpYfOImYoVuh3vAvnnDNV2oVGdgHEb/r+/zv
 dBo0FnHPpXF2xlXgjZvs71iVatqnUYY8oyrbFJBPF7hutzAvYLdhECrvx2HhQAGQQ9wKOElTSzv
 7xcPbd6fQG3Ghaak8mVfAbLUXmDNuV3AJY2YF/f11IvyJQ/k85ZAyg4+9miDc/pZl8woYcyoWty
 Gj8sqNa8ZQLK5cNLMWSgtz3QnVEO9dhmbtfPt1RoV2GoawSmryQRwXI9fKF+VTKCzpbXjwoPm7N
 po3sDoy9NGOGJj75fMT6VvpMKzOL3AX3owBOQnciyYU6UVi3zjdqgg3sSnftjrT2OScg2VQ3hbS
 EL7qJkLiIiPeO7jXIl3LsYNZbvQ28Lgs+3XLvQ+xGWO4lyVBl8eYQAfB293KeU0buvUd5YL/9H+
 ZnMnAnyM3my5ekx5jww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfXzfwNkJYNYiv7
 S4jw/rEFxJZm74YZIdT0W0YRRf2wciVutHUopB/OKRGBTFm1y0SjKACv493zqxxOc1MQpygnyxQ
 fBKb1GclvHhF9P8F5aLSSPSuoJWVzMg=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33deb9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_lsunXYYtS7J6GFZci8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113767-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jeyaprakash.soundrapandian@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:hangxiang.ma@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA32869FEE2

Define pinctrl definitions to enable camera master clocks on SM8750.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 7dda8408c6d1..57d1b05be8ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3899,6 +3899,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_aon_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_aon_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";

-- 
2.34.1


