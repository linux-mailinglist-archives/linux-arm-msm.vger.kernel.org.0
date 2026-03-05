Return-Path: <linux-arm-msm+bounces-95569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEdRHf1SqWm95AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:55:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8EA20F128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49427305C2B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BA8377ED9;
	Thu,  5 Mar 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZQzHGR8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTBH7rv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C564379982
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704125; cv=none; b=ot1l0W37EF0p7osiWvqdvMJgmETV1e7/fpNGxjYBdP8BYwEVyYJf3kgqy7QHy6nArcLD4dx9HRWZ5DYWp2FJb0/Mqb/mufOXgLoHU3tWRcTesMU2jbxRez/UIZKMkBwAFbtZGV2VdQeEWrI/5l2nAI7NdJCDOJNSJKQFbijumuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704125; c=relaxed/simple;
	bh=ocMeB6H+TQusRD1+PzIbc5H+47Yxa0gXugM3y6FQ0/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvhTi5xsCcthwHXiFf6aLWlQWMpKi5THBhQIx6rxDPknml/qP+HcRlPFg/9FQk4PVx8bZhEjWfBcydBjNEK8BuIGnlM3yFbsUFlC8Sbbi/EK3PPVSphMPoZSCX/JZOw00+2kkrXt4TGuwUPAJYZ+bfUotiPl4l+Q8zru7PmiHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZQzHGR8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTBH7rv9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258vNqu2665250
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=; b=KZQzHGR8Tot2iguw
	3/keQudGyFTqPbRXtQ3wPq3FpnTgqkKkNlwfZe5+eI9piKZ0SZP7jZtgRVV8EEO3
	uIme+U9rCxm7Pxcp+VbrsZc/IToG3i1RLRVd69cRzHSxDvgZ8bF8Udbw7CL3Npqj
	Rlr+vYJbVf5y5HOqnKgQSG2aVGcw/deNmedg5p8jxbVXt0k/M1sYIh5mwSHGaliI
	KpMSVAYtu7MmmBgwfXAX5MI1RmycyDb1dc0muWJBIXSSrD1dBODHEd5oGZfZW8vz
	SzbH6TaQ+mEMZMvEX9rKzeF3n90nPqgNvi15guqhKcPmWPPkHqTqJNysC8+VFNOU
	n4z8Iw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb27qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:48:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50333a8184aso726909691cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704123; x=1773308923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=;
        b=UTBH7rv93jYmoBtNvkTCqzsdtqeFObc9zBps4RBDnaPW4T7d0efMF87pZ4XAWVMsYf
         7klG3DTH9oQ9gKNza2lb9m7OLO85WdmSWzBOlEdUdJjWIIG9szPNFbCxv4eg922w26Zw
         rLQRAhv2TKSe6fiU2XiO5CrMbOYjH07j5kBPyUKa2Fs/8PucC6Aema15h6wW824CTnIs
         +VYAC54T68fPuNjhzcL+idEdwKsM8ZHmJ+ffDgr61T4esZLw0WLgDRCxCjhz6lPTBuQF
         ynohyUmKEBYnCi5Naal3OR1BJYxAy5pM4H3ifiTl1A03VRlCwMJmsmEXoD1U9daeWbii
         itfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704123; x=1773308923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=;
        b=QMXAK7vb+om6bvWEvOmBUZw1GVTBEj8yaI2m0X1//1NSNdTx39mEQQh0IYVfs9bGDN
         POMYgKRSN4a1lKk58scWON/0IUlO+VyARdvkt3KgTlVM7TOZpJGgEfp7wAoUCqPUfJNN
         37CtBwDlKjOtTQnik3hAq1FFMleFUz+OpfpwrXRWiA3E8eYlApW6Ekl7QXE8/aJFklRz
         QWlkmmFv5TEtElODri0n7ffXGg38UA0xj7cO6wgx8A0pnbCbuoDALeFLfa8ceDqBogwc
         8bxaZxE0DSU+3Vf1PTi2Z1YkcrSd55d5S7yysNBqsovxfNB3Td3FtNSO91bIEe9Jog6W
         GZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU++QqCLS+mCbQHlvwFajIhhy4fRr+Nyvk8QTWYTZ5x8ljCt2C8sfNW1YrKC/TWtwxGsQasLDo69+/Kqywu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IWMZHj7IVw/Dui8JGUdCuYb4XK3YyBhS9yko0ayW83Kil+Ss
	50Gv+bKkeU/V537ObcWqVbKgnZzrrOTWN5CgaCoubz+oPQF1lzoSV39aBgqfTTIVwNp8qJqW99a
	fOb7AZjdx5+9FMLpMuFJz6A/OPpMlv48NZ19p5GqqZXOY9SZ5XPE7LMbA9GWuOpD9jiC/
X-Gm-Gg: ATEYQzxU1DFTPXlHE/0TM0UKGUWIK8f77MjCPbeRlKrLZMC2mq1rSwhR/F2CvxtoqBp
	W0f8NKL329R4SVv3EliRXPr5MvA01L60RBTPdhLBuicGBO2ZjD14S6g3gog+YnjVQSp/rV2YoTd
	PRBZPVy6OUBoEbCpxovvkByxDk/c1DKADVmAtLFBDH2VCNX+aaEX7gcjmay00V+FpgOUXws0GZo
	4NYxpJiKvGsJI4EwtQNJ8wxsiINzicgxVE+XxBC8WYN0BZSBaKgce6jHqHGwm3OT/eHHxe2/Sy7
	T/xR99DsUHQ5kBFs/dh8Pi2F2Dh9cI9WxXRaZLgSa8D3iXhaGh0faT8pHTm/WqMJdoaA/+CWszZ
	tlneBWOUeFEeHdJ0MLXhTyRTc5T2tbVNrAvd+RYxAaO0ztja3fk56Y/TfPrk/bbbm6kRYW5+AQx
	LXfa2JlzwZbzc3
X-Received: by 2002:a05:622a:28f:b0:501:423e:fe0d with SMTP id d75a77b69052e-508db28a748mr65556991cf.3.1772704122696;
        Thu, 05 Mar 2026 01:48:42 -0800 (PST)
X-Received: by 2002:a05:622a:28f:b0:501:423e:fe0d with SMTP id d75a77b69052e-508db28a748mr65556701cf.3.1772704122287;
        Thu, 05 Mar 2026 01:48:42 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:41 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:13 +0800
Subject: [PATCH v6 2/5] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-2-38ce4360d5e0@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ocMeB6H+TQusRD1+PzIbc5H+47Yxa0gXugM3y6FQ0/Y=;
 b=r1eHe5363dGkktsWBQgmfDY0cwOEKvk+62PE8e02/Z9CUDDDGixmXrU/gxV+vhRkka2SeuPXa
 qzTWyKZvESvDoyhiUaOHfn8pLsIFBSTrjEhuJc1c253LDCwUozR2+7U
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX/LNDCZCc884q
 Rv6rYM1A1JHaOmWsLq28m87q0n17yCmUsLUSKEQEP5VLjudZ8dakVlJ1+5ptCp0M/XULKT4/coM
 PJWMve4LbFF7fP11pYuKze3u87S0aYwn7Mph0xQedq8oy/40TP7xAQWZ/g4IEacOb83xCC2ONEG
 ml3CySAC5kAbYC0bsGzg4f0lm0pVNh+Vf0wI7Wl2Cl6XTQs0GejKQf4x0f0bUy7yBXhleFL0ueg
 FriVnsOiIp/howircyRYKnBzg+bBhAX4An5fWiaWSmXfyNYOaJFEXzyPqNDoApKmMwYIuCHtSO9
 9GlEbtEwnLUYbNF1te+TIC+Y8W4wBXJP1xN5Avyv94G++SKsUvStvahUI7Z3i5Nim83jmePEeUS
 cSiAxuTNO4HT1fkYpHsU5ZL0ZknYghgcGPCpYhcEZqLS0TbMIEeu9xSuDn0m/te+mnh5WL/zEpW
 YGs7iJIvtc8fuo3TOrg==
X-Proofpoint-GUID: YDMiwQBxU1vdIMdMetd9xVvlgXQaV3i0
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a9517b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aV1HOqfba-nwUXNNIVcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YDMiwQBxU1vdIMdMetd9xVvlgXQaV3i0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-Rspamd-Queue-Id: BE8EA20F128
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
	TAGGED_FROM(0.00)[bounces-95569-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,acb3000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index f69a40fb8e28de9559e8ea53394b86ab7188d6c6..054255a65c7fbb51e6c411d10252270bd7ef1522 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3789,6 +3789,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,qcs615-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


