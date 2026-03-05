Return-Path: <linux-arm-msm+bounces-95571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBAYLghTqWkj4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:55:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDAB20F13E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A05C313C38B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A08B379982;
	Thu,  5 Mar 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0eanmbe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSyx1BRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E6F37B406
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704143; cv=none; b=tPvRsR4YaNvuMk2apxeKi9pmKpnZM0aaNuZyyWlSWTGdfWWYVCwKe/Fvo43OXvjtfYI9bDHlwjmZrTFFYA9cvKgK4bv5fCM6c6oLGdgOco6oPVs0LSbgyopTSR0Ez6VcDql/wD9eyjfqCGoX5uwmUgkTEacOqpyuuvfSSHcRaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704143; c=relaxed/simple;
	bh=PxCok/m06RL8EtXvhxkBdkhQnDrY29ujrliEFTX0zGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYJLVP+gARsc/dOdAijSfPXw7yFYyZFd8pc72hhyP9qdHz9T4f7c58v/745EmeE2pMbs+pehyRbM7TTdi0lJ8htfEgj9XtCw9j2+YPnM5UiGGyAKLBmujdYm5TyI47DC2wgc52nt5qSAZW6OrFUZVqa7Dg8NiaxsauZs9HgvVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0eanmbe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSyx1BRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258q71Q2665149
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=; b=m0eanmbe0KpQ4EZG
	fwJYyZ/9ahL9lpyukyALogpv9cxSWSnZeI46S33ZVe4AVK8y2C1BH+uW8WAjj51e
	wT92BFgBGN+/uIHznYeinmRIjsiyXz0wAeHa0DubAIIEQxHOABkmvXPce8xeNjyM
	6AR1gEQzM15hAJwrCcq3KU83KNRg3jWTigIdr/QVnxcjxD+IA83DSU9OYuvVf8zB
	PTBe0+x9CXtha7Xmit5ktXklz94yEMA5WUH85/oB8mBKtl82+woEiJZdyqIWmucm
	DuhMQvbH0wTiebtcRz8pTsHL7y2RymWb9eHAw7H8qD9b5OUxTsiAyhhdMdilG5Xx
	xDkiQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb27rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:49:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50335bd75bdso615423021cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704138; x=1773308938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=eSyx1BRDhzr9Ulhh66Qs0pELnVM9ZRxvXJZXgWOIKRkxywwGOaYsmsvxUAe2tOXsQa
         PdLi2wwZCyEoenrprzKaTHSCdxSpkPGetTX3+VQklJjC6D6XO1WA9Yu5zwgCYLMafQGe
         RxCbLfsYCkjICckWrl35AxfmMwVltQHMZADw1wYaf3l61ITb5+X1p7pFVulXAbDbUCIH
         +CNc069c4adHjC7HTy5w/j4zuWbbv4Xs1alrf+Q/eMIkJHcmMYnXkDhuzejjNagI3S+w
         F/yKVcq8kcD7HOeJs39C2VJkTnbEI8YHQ3i1fJ3GeEdZLsWZ9pqvNWvFeVcTicjqMffz
         3YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704138; x=1773308938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=n3m6Bs5ofC4x7KboEvkJ+reLZ8MvTAPdwd1CMoYQOn1z/6POmvYFUj2QM1s2kLXaxM
         JHohfzVAFYlPvacCZNQK0OncQ0e+OYqi2O8I2p1/D5slaKTe2O/HJxM5GWvdHSm3uBvy
         GUeTCNXUYdHR5GOp8zML9eRlUjG4eu5cK6Q7Mb1sNH92x1GHnOSUWm1hLVic/Tnv+qda
         Xl0OhoDbiF18OY3G3zwGcUEISGRmSGuaT9zjtgDXTFSU/SntZpQOG9Vsr9D3JdFO+bx6
         ng52aWwxY+OUQMYBApsOqPGiLHlpRlXmIhtkLj4j4IckErVbdXMZLpMUS2VhaSgbamsP
         /q9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDohMAf38/BMXpC4+a5jQIwGLGa/7Z+rUKwMmXVQ6CcHjnKNIIuN0lOdfgrW1T0IEgjRwt5KrFpZHGPf9n@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxMcI5BMC8KhplOaA5c8nc6DS5EaGgpvoAoQqt5J4IXbLWZrU
	Lx5x5EHpBqXhwNgOrKAzxhgvYLmtktaPtALYizWh3venLWXKrRYp262NB/syKLZW7PYXf6HsQsg
	uOa+VO9Gaf22xsLDhZVweyPTT0pANsKdOKB1iQzeiOgwv3zDrrF3MwyCMUrWN0t/cxJ/0
X-Gm-Gg: ATEYQzzMEGYWan9SBwH0wV0+kduT80VYBW+dcKrsDoPdPhGSpIhHAQIdCeCZzX4ZgLR
	dZmrFuhCkNFm6ypt7/hTqhbDhkJh+EMNifcjeWwpS+bPtyrk58qG0nik3S1/uPMSNruupMuMcSu
	G89kYlB5UutQsiUBE1KonJCQU6WU4zYOp1ng2QqCFL9lI36fvotIBY0GIIs4sKT0AQSIJ0MAGhZ
	PT5atLBV6uRBAJymsaJzzWxukDN5GP2H8Cjd2UE9Gnyy7fTIp5uplIB3NEVWMJVn3632TaLXlGa
	GwaX2yydpdeWWO9z0qUJWaGNjASxtlZ2ku6K+40JL+87Rdcym36FVCKAUpbknIJI4zFPjFEZeu6
	aZmh/tdplPdjKQ/+XRO4Jm9Uwv6gSnzBYCWXtoGIDyUtaKDddCNfn8rRjCl6F581WiJM0kMyftP
	f9HxcW+EA87e0F
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62094881cf.34.1772704138531;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62094771cf.34.1772704138150;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:57 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:15 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-4-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=1578;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PxCok/m06RL8EtXvhxkBdkhQnDrY29ujrliEFTX0zGs=;
 b=QCvqamsbtXSXBcZDLP6JGVj8UEFEM6iTAPbY3uUtSzvfKRzoSV6fuCQYY0vBFV5l2El9SHEjF
 TWyDUqc5QqZANTVRm5sUT2Yqc9F9T6A+NHbsPYIv5LDxHIpYi7GFVTx
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX9axAZeOd3Cc4
 qAOxl3NljfIfM8traIFwIu+GoE+ys5BOZXcv9iTSqGVIz+OxWM2le3w2thTdVzlQOpMBsrJAdl2
 QM2M+yk0tkgl4BnVUAaDivOdDYfvwlQQNt9/6gCku9K9BXKXryP+6c8lXEZCG7z9B1itzxMOqKd
 dCnCJgnYQ4d/FVYHhWjhcARMSFQWM8uvzIcXK9tFOGm+RjWZ7q7wSk2gENDkodVbfo80fiyWCaf
 epP8SoQZH9F3uicmUoz7TT125/znKzL6rxXGYRaO1WIElzZ0PARXCs7wzIsCU7RiTXr3y6UlZWc
 wHNL81KGz5i04ZumVHCX55r8sTMWgWiYU+Twh8Y1bkJhtIgKiUFNw0n0WamWMHhIk2FqowI3IUE
 fwpHD+9/breELAP8bZCvSAygmFufPkSPSjpCkX4O7lrEyCefaKQysDFkVYHn8yFVm2JAGMWlnEw
 Drxqo7NH+BEw/VycQcQ==
X-Proofpoint-GUID: Z6_j4CJqQe7xksuo5Fyi4BaXrinUC61t
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a9518e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Z6_j4CJqQe7xksuo5Fyi4BaXrinUC61t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-Rspamd-Queue-Id: 1FDAB20F13E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95571-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.47.77.96:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ace2b2a0bf2b7e574b0d43f98ae4624df03b477c..9da6ae131b9195885458ff4b7688773620af8e8c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


