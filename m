Return-Path: <linux-arm-msm+bounces-98236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAK9Kv+KuWmTJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:10:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8CD2AF134
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40AB830087DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3D33F54CD;
	Tue, 17 Mar 2026 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ai9ROPGV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH9zvqf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADED3F788A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767315; cv=none; b=UQF0ptNtKdLvnCAIvAVIo8/bFpPYyyN6sHJ5Fcv5vikg6wgp0AyO8eKCQvpQZCZPDhpaZFviml20eVnN/hhDQpjm7+EkS3L8lXnkdHEAmqn4yPjMfZzPfYPd0T44Z0Un8W1tBFLH27J5vGtbCao7cK5bjVJPgS2pRnAv3/fbrLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767315; c=relaxed/simple;
	bh=MN+fm0uRywa6RXCIvCjK+LurNcdN1vZke5SuQyvo40M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5o60gNKJ7k3jDVy24cJwP5Eu7fBhk30w6YJU1roQBKcw1ojkENHc7G2QZTXkg/xBINFy6ALeEzPa8nrD/YMJ3QN03FuH61D9T1Evl8mnzstitoK8V1xS2uDZjok6DkSkmeYViRhsiavfYKgOo85BRs45SaiOlFs4HzMHn+Gp+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ai9ROPGV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH9zvqf/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HFOe85537838
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brjZW2e1tXJtTUhkh2prRm9WANFehTFkS8Xva+sRvkk=; b=Ai9ROPGV15hP/eqz
	CvFo+Uy/AoH6JW0QdyJ74D2oeTOex6UQtKBWyIFFxvyUUqBU8lGhpsng6DsNCaxT
	TBxT2wIZlbfreLje/p5bTYBwtazDAvrH84PGPTI5ab6ERTwiKufi9ib8xXfzVRTn
	NVxYMHiK1aB+HGVdkYuSuTGJIV7u2oCC01388lBClHDNbaeo1FjfJTBVI5yhouDd
	V8THpc0oQRQbqlyg7PMu08Jb7POxpAze/UzsM4ULMhFT6nTJQ1QPBf4dpK1GTAfe
	uPLfsIQtUK56fIvHNs4eJYQ+Mk4XNhN4yPcT/kZuPfZylG9rnJj7fHqMB48YjW1+
	zPhXyQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy9jr0due-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60270015488so5419656137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767312; x=1774372112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brjZW2e1tXJtTUhkh2prRm9WANFehTFkS8Xva+sRvkk=;
        b=hH9zvqf/kDJd06QXj18ZlHmr2FkXOwfcEeA2GqMsZkdWUt91CyT16BvMUUyIi+/N/s
         s1mHehzRjDZKjeACX4KonOklRbvx8Wb4Ii4pQSjaY3rnUeUnvK8jymDhcLjR/KiiGMg/
         ITuNFVY2feUPm3xbl7LOl28ePNnO2GZzdUK/hbDjLD0NLlM5e8zn5/D33IvUj+RsxJkA
         I6nEY4Uia6jfKhZL/ID2DbJ46H2FZZY4AlzIKc7w15GlaFI75XqX1FcWUZu8yJG2g4Jn
         vNPGenGZUIWYmu//x+ByNvuQiXd01wm2iH9bfHdTgL04Fbn+gfoXeQvWyuJn/xmQA2pB
         hhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767312; x=1774372112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brjZW2e1tXJtTUhkh2prRm9WANFehTFkS8Xva+sRvkk=;
        b=QSXJBbGvMxu35ea8FePPcJwgWprQ3VK7ypjBU0hYITngmJrFAgjdOFJAXEpItHM7SL
         dk8Z4+pjyc2daz8Xb/4jYFyYX7STlHbENwE8qgvsCmiM9cgE8sRfCskX3Fnq+8rIVGwy
         3zB1ZZheSno8Md1i+5SJHaE93hdF+1yW8uUTMfWBu3GkuhbxVk5E7d/WcjG7az2/x3Dt
         xPSL+TD7kXZvYM61+BdKNor59KA5Gp5lVdFRcBU5tU/QQzOiOfaM3pEmHEtTRM2i2iK8
         ko42s6gSE7PWd64OItucSlka2IN86Qwh7ORKog6bZyX7lkqSies/rC9U6KYh0axtKlf/
         pvXg==
X-Gm-Message-State: AOJu0YyVWDo6Aa67lbwA2E23uA8W196y7UBmPMOjE8APrCvLcuYd9vlC
	1D72gdi0fRb1LiaFxsBmJRvNWT7SG391RxoyVPXQcFkvz+JsrGVrT42s5jat5oCo2SfKyDvxJ4Y
	dq2tJCNqLo/qoit45fBSElYi1nkc8JVt6MjawESFR5qPGlsIDVy944y+pLp3O7Z0rYI6j
X-Gm-Gg: ATEYQzz3qw00jgIrwodu5/VRVbLa8u88qnHEqnKUbEVj4SDhJ+CptnFr5XEbA5rBc4H
	rHjtH5LpvBFqgJHz1tVp3rpQ8m5amR5o4NWBeCdeXZmDa6/QkHJRJTUo7lzXJh8hnb2LSQXG4Iq
	h0e8KxyNe83USyG89LWIEcUg+VZ1wSdPoWByOq513aZlDUmhwsbf3Hm+U/sboxjmoBoJJbpyTCg
	zfVERjr5dq3FpcczEa7OiIeybG8SqiNZYbY5DzbEAZDIKdbb5EsRiKRxGqtcjJYRVnT5j03O9pu
	ThCLpZOozBoD8eZmoyEwzQC7EFfJwV1UBrfoUYxS2b15TPwaToSEdUHQbMi+QPsUSGSff62prv3
	2GmIXe+bPp01Riz1A4/4dABJ5AbX2DFtjWb/miLOV4E+k
X-Received: by 2002:a05:6102:e0f:b0:5ee:a0e6:a9f4 with SMTP id ada2fe7eead31-6027d12e741mr288328137.12.1773767312250;
        Tue, 17 Mar 2026 10:08:32 -0700 (PDT)
X-Received: by 2002:a05:6102:e0f:b0:5ee:a0e6:a9f4 with SMTP id ada2fe7eead31-6027d12e741mr288310137.12.1773767311834;
        Tue, 17 Mar 2026 10:08:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm877072f8f.21.2026.03.17.10.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:08:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 18:08:20 +0100
Subject: [PATCH v5 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-sm8750-display-dts-v5-2-fb53371e251c@oss.qualcomm.com>
References: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
In-Reply-To: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MN+fm0uRywa6RXCIvCjK+LurNcdN1vZke5SuQyvo40M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuYqGJfX/cgT+ZaHWFYTyCOxaSomSRI+3hERXw
 +pAMIquPAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabmKhgAKCRDBN2bmhouD
 1//YEACLV8VU/h2gaIGXVvlPYGcR7UoNWENlJ1AdHA3BJOTd8PiNBQsCEdV0MTxM3rtB5nfCVlg
 1+3gwMcCK6BsQiYZhiP9YvAW1yrZGU81k9VIIJU0nMin19JTCWEx6NZ5cThzSqb5Pn3MmIcpkph
 +/ZoFZ1mSw1mm2RcktVc2VMP0JOLvLh1eXx5nVNSTUQXUgVyEi2UBTWMZHYEKWOcQk+owxRrNPE
 IXNuomN5jL3S8WtxpYVo7UHW8RJCkfyutW/9pndh7HLx3pucYzmvLjGj48gWOyH+Q3QgiVrlCfH
 iIRyC9K8L9UHN4beLivdvbICQSXCMElc7XXW9aRJnR/sOiuBtyvWlCqcJVE2+RVJTxP6wGXnRdc
 /PozC44h66oPbaUokd0lXBIA3rxQQdGiG8Mc8sOqIx+tJgzE+ZpWB50mowX7gZcqQyQ0UG0KU3c
 4Ma/kpbQUTcMh7TV0jUSW5/NSc0Lx4MkMEso1xPTgegejaqN1ug/vWcJePIREyh5L5gI9tSUxSz
 B4HpHNMDTDoeI1VcVHxluaNnahiLJ3Shpmyy0lm5xOqO0dG1GLtjzWEsUeArmWpbW+wG1wMexld
 kh1o8tL/p+GHM01gSQXWTjgquuw4nE59z7bf0un6ylp+hDs8/4PCbsObmkZjvH7B5MqOk7svnt8
 LbFLytRgtHqj7pA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: IUPkVaE5g63EIZ1IS2Sf98gKZD8ntSPM
X-Proofpoint-ORIG-GUID: IUPkVaE5g63EIZ1IS2Sf98gKZD8ntSPM
X-Authority-Analysis: v=2.4 cv=NdjrFmD4 c=1 sm=1 tr=0 ts=69b98a90 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2EIfaDKYVuuEVWmasugA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MSBTYWx0ZWRfX92wo1jN2TxtJ
 V3YEXtjMPMaFuyivjQUUeRarfaqtUDjkNkOsfFZoluNzyx1dBjuR3+pLoTJo9icmAXGTcR6fXpu
 CjjFvG1NJzR8iZvVYpAfiq7neENhrBD313fpuhILgtNA6hrrjpba56GWnjUz4foFz5I76aY36Ri
 Ky0FXRMbQUDeR+gN70A4jW1X/wflfNwTZKgGfIg6ws7HTC/AtEZHIf3Y8i1fcldvhUwaZOpOkoz
 4htyFcTWH7tUNgqZaXkrrtEFg1HvO7Hp41aY8hNPoNIoQ+QSx76UkNY1J14Quwywau+CXw9t16L
 uiXKqk13Wvuwe2KSunZpWx8uP81EVdwmm6Fq6b7YyrYYzxkOo17Sn0osDGBGFK1wjgrClgXXYx4
 IHB1/FWa+YBLVie2LM9ZgxMMey/MddgPar9jOkG2vpUqXno6cm1MNBZvuE+a+LV4fswQ+Gen04E
 9DQSnkJu9Zk8EHOiXgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170151
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98236-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F8CD2AF134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable display on MTP8750 board with Novatek NT37801 panel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 63 +++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index cb718331496e..050a85df7358 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -937,6 +937,48 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -1225,6 +1267,27 @@ sdc2_card_det_n: sd-card-det-n-state {
 		bias-pull-up;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.51.0


