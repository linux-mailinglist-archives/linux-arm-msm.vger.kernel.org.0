Return-Path: <linux-arm-msm+bounces-107047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCOOJKnSAmpJxwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:11:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E138C51B87C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B77E8306A343
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 07:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEA33672A7;
	Tue, 12 May 2026 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RREybyxY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DU5XFf8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1353379C51
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569515; cv=none; b=VJ+coG0+6RFur0w9GWHBB9AOH7Ho10z6+RS1HGH7zRlffbGEx3kKLvlbKeKYaJI3eQVc6u7H5tg5GwDWeeCw8fIH9hce2+Ex/G2FUfYbsshOmXvjxoqG4O/MQuwARuE0y4mFZ3xBXuTnB1zvMuzyFYl07ymrZyUc0vfzhvnal+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569515; c=relaxed/simple;
	bh=9AXM41c/CFmxW6CjzvCZjX4c4mZQ3fsXpGmcF6Ejg+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glkvQjxvOkVlcm7ScE6ZmqWUZIzgHy1Bde/tsFiwhxRUuWesNYLwEOLGpdavo/MdWO0hHFRHwb11WgE5lm5u6At9Lb6mynLPPZu024ro23r0AXKDrx5SbjU2lcW+4zPmUCthZcagYZvcIKKL1XrS7jER84Z7SNzvav6Smx9nD2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RREybyxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DU5XFf8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5HTFM2186196
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WoFn2XA+69GleLNnsHwn+2x0S5QjMtSmGgBjROqAkvQ=; b=RREybyxYBRFrldZp
	So6ufbghC/w8WFu7Dh3+UV+ip/NQ6UH0tHD3UdPBxbMvD9FlLAjH360CzyX1oHw3
	WXmGtldhr98oBTnYm7OB37cdevTyor7bWj0zEwqFIPPu/qprakDRI7CJwQzert9m
	8/M/Jy8sSxqWztFTA/C9GQ7ct9mAL6p6sRfpqIW1tIdUZEmtrmoTeeHSbW2LTgmu
	LOQVDRKkXIYbfiD++g5ELFZt6AwLJBzkEtAkDp2N/UsOVwsLI2Fwx6kkfGLxC0t7
	fksEpB89lB9fl8Ncua9SkVn246o50qenQrvibv/yYZ3jqkRyJiY6DXPlqOn2JJ5l
	owOwug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29yr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c827c0aac70so1553087a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778569509; x=1779174309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoFn2XA+69GleLNnsHwn+2x0S5QjMtSmGgBjROqAkvQ=;
        b=DU5XFf8W5inLYAak9xL2OJ3//lwkA7tGr/iDxMWitKYdovVK6a1dqz5312DdA8Vvce
         UOwjJvzoV1L2mnWd0T8BmK1OAq+1RyU/AoUJGg2EDXPA+HMuZrppiTujTP0uM/IeBvCd
         wKJ+XB5cEWbru9o840bI4uD7k7zqgZQCN/82afQlWlom7wLXJUiG7+rKkJZl0eW5tBuq
         BJvqSasAopDlb/RSavT+u2yLLuy/T1fuS01jQqGsrpfPXcADtp9PhDJ979Z5B2jU86jb
         dMI7e773/zS6uVUVgzIdUvoAqThFBzkZnOgt/Qs57bTjyfh8EzFXGZoloPeCsfCS/GLx
         PBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569509; x=1779174309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WoFn2XA+69GleLNnsHwn+2x0S5QjMtSmGgBjROqAkvQ=;
        b=IiLunxtKisNLpA+coJ+h8CYQox1rf/vuB6jcttr+Uef464H+Mhh0mxoFJxHpSkkD6D
         Onog1IBnQcltQgwWsvYI6Kf0YanC+HBAaNh7zY/NuanYFs1VemYNwiEJaMd8QJOr4Btv
         +4lpVzd2Ay/yVBBQLtGuQXtJjwqM+rREOdoqJrxy4ov02MeC8HMWAUSlU9yANftEmRjw
         NjLeooWJ7fSqAmM5jP+54VOYSdFcnFQYG+BaJaQxYM8UZYxc+r+e23h/VWkZ42D67W5H
         54hdIfMfyU94R1wbZUd/MPqotjrlHPzQXz3w7P4lUtLIKRJQz5hyS7WV7DdYk6JX1daH
         YrGA==
X-Gm-Message-State: AOJu0YxD+nR3d6fWhfN/JaJQHvNlI2NZ5i119HOqagsnfHRl9utqg7tF
	wCigBSnAaV52dwAoofl9wTlZWIp7kSJNp+VKV+pBkBK96HNluSHs1SOGwBhViG95AM6w0v2wUtW
	FeXhTfWwbPnK996yZGAo61UaL82w3wNmlxIfI6Bpb/ofdKGOrcK4q/jHn1Ajw9X5jWmOZ
X-Gm-Gg: Acq92OFZr+aWUgmkPxYLPH+jefiVBsfpWVVZwTZbCvGrILr3Q+mlzkXVDhVJ8b99N+U
	3nxjKcw3lCWqAePJrv6ryrwHaKD1WE5wF4pQlTUSzZ1pmjV9cnSlMVXrCqv0KLoNIyCrSEANOVA
	6QelFM6Xr6haw6kPXoFsKSEubv3Z7nRN1IQlsKbNupIuzOA3Hsx82EQDzbFzP4NT2MF8lYIa6N1
	OTVTmAzH8dhTg1mtFMnO04pxjODRJa7nrGriIMYic/cQVueHb7RR+HHZM5TFnRxCbjtssdq4ipu
	jWbFhfW1JmbybSGEYLY0FOnWlLRcjygZAey0YcHoEzt7xED8d5V522bnW2WTS/poP7n8qty7b80
	EfK2TfCg/YAdRiryQACroxtl5rILFfcfHNY0vcqe1D2huTz6pRTEDaiCvU4WFFiZZVnb3r2B1Dy
	CByvs6H2vKicj4j/yerjAk8e+gLFtBp8oOyCOFkGZIaBe9BncMkEd36xV4
X-Received: by 2002:a05:6a20:2449:b0:398:8ea8:5f9f with SMTP id adf61e73a8af0-3acd42a9bd6mr2567050637.16.1778569509276;
        Tue, 12 May 2026 00:05:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:2449:b0:398:8ea8:5f9f with SMTP id adf61e73a8af0-3acd42a9bd6mr2567019637.16.1778569508771;
        Tue, 12 May 2026 00:05:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11354488a12.15.2026.05.12.00.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:05:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:34:55 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq9650: add the download mode
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_more_dev_support-v1-2-c4c627351d80@oss.qualcomm.com>
References: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778569496; l=1000;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=9AXM41c/CFmxW6CjzvCZjX4c4mZQ3fsXpGmcF6Ejg+s=;
 b=E8hqeMEzp+28XhECNKkjcJmWns5SyV7R8IptXYFhS1W9keYOtqLhTGBQj9zgEHU4iNo4BsN0G
 9wtSyb1km47Ba/X/Bf5OixwVT6UaDuhAlx9vS0HX8ml6lVb+LNn64sk
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: y6dHKhwoJQG4Agc2peYVKQbuuKmiYp4l
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02d126 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HaTVWnLGvC5sb4-HCggA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NyBTYWx0ZWRfXy4JmlZMSNUUQ
 zgNkTJDzSF6MrGlK1gyL3lMozdkNs3pKkog002HY3/7JiUMcRpBhSXVGTcbRio7swOh4ajfzX8h
 TSehLY2bzFecF+P7ya8KR769HXmsfWdrqNxYzONKyyBZT/SOqEr3ekmNPxzEF8bBTMC7YCaihYq
 HtpJOb0mg9nWHOf44F5zb4+jLJ5aSSfDeMGC3xH37y6Ivn6BhTBZOjhYKQOA/I77Jut8LM8Z7LE
 LlnmH8iaCVG+JMCEF/RlwQ1RevKXR/jueEmSXtRlZGNY6QrNtzm1+Y1FiKj5ggr2vaPkbmnl7VN
 TZK8FIPap3VEs8asKcJ7zTaYCsrf+nQtsrlKj8GLXj/fBnIJ6aWh0ww5kgo76GmSKUbiYzYQodK
 Z5/IBgVCrqgEt/6irrB8w1/1Xyg6XuQAij2WCj63aa9WTtx7F1mL3fZGrR7TCHbS9TTxMVZjFiu
 1KlXaNDsPGtH3VnXPYA==
X-Proofpoint-GUID: y6dHKhwoJQG4Agc2peYVKQbuuKmiYp4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120067
X-Rspamd-Queue-Id: E138C51B87C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1ac0000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.29.142.104:email,qualcomm.com:email,qualcomm.com:dkim,0.29.64.72:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107047-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable support for download mode to collect RAM dumps in case
of system crash, facilitating post mortem analysis.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3e7527609591..1f7f547ad550 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -140,6 +140,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq9650", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -233,6 +234,11 @@ tcsr_mutex: hwlock@1917000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq9650", "syscon";
+			reg = <0x0 0x01937000 0x0 0x37000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1


