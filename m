Return-Path: <linux-arm-msm+bounces-90290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM4EDnIgc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:17:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3571913
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFD3E302BE35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB77366DD5;
	Fri, 23 Jan 2026 07:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kl7iLzcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtRMSXEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB93364021
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152378; cv=none; b=IfDMc3T9HdUhfYBs0KOHOCTS6Vtzqp0kQQraqg/wl9p/8b/krB8TO3JbjwGHBMFMY8I0evtC7xJ0zvgjFjGObQwFA0DSkrVTsTP3HmqvHvkVCBkYRLLEUFKq5BAZubPqnNmXZKsHUY7x+SSozOTfSRlFkg1NLyHzdt7xgoZIpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152378; c=relaxed/simple;
	bh=y5OhV5IZZ4cD3XJwqbL5xsBPAwLjd4WvI2VkiE2j1E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcZqXEp69QqUpIcd3KyLLCGFcQIBraUPRSyXQb1TbFQ1qE2NjP7C4XfPqq81gzxWArNzIoAhfNvH9PEaBKDlW2euUmWAlv0qPT2bWya39GfxjeTnxpf2UDhDQYhGJ7KSAxYEv+TFOfISHG8xERvUSaxR6PjkXS6p6hhPtqnzCpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kl7iLzcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtRMSXEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N1DkJl3650164
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQjs1FmarwM5vchbBDR+me6FCHg5gu3uiOgQdYFOa/w=; b=kl7iLzcw3E/VPf1F
	VluIqBySLg20siFCPq7A6OUcl1/zrN/R2832mHVTUsc47/WQo1FnHiGjM6Vx0PDR
	RRArge2rliGlU3AfnJjuuM9/Mo5KBhxOsuqUeb8UVymNOvKqxTe8SGiuoPN69M0/
	diOAK6wpwaDd574Y/spj6jefZXw4VtLtTtUl0IF+9RjWbeM3dnG754bzt5cYBEvJ
	AI22WKe1yAAeXIBZ9lHnEx1wUWhtZms+tv0MjkQ24yYgG1nvYdbyz9xECXfxg1xz
	OLWC3qyjzsQDy535XVOnMFZXNEC+0Tz+/4JGeWoUdOFAAfDcZeLPOkY4ik868y+Z
	WFVkdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4ns61r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35301003062so4192591a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152371; x=1769757171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQjs1FmarwM5vchbBDR+me6FCHg5gu3uiOgQdYFOa/w=;
        b=GtRMSXEv8Lm0EE5EQRkCydNrLiH3r733qpaim6oTrv0T3EpevmkKv9UI9utZeqqh/d
         zuUx2z7N2i8IWx49gbKoW1fzZ+G/g/pxi4DhAEg5gIYDkue3CbYRwX6mbMDuoPEuh1YJ
         2JVuXUdd3najdcdM8uGwmJElGAEDoUsHQCIJErAJklQVd6bKXprPkVN2lGGIeA6S6mau
         HYPDn9eiQjkrojq88lyjhdWPi3uJT3nDGpny7ft/sMWRh7P6/G6fzsFfbWVn89PFDWji
         97tEEJEqTofE55AqfZdFRAyVq7ekbts79GKZMi65EkYFnh2H6bE7VOufcLaXmlCz4L1D
         kbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152371; x=1769757171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NQjs1FmarwM5vchbBDR+me6FCHg5gu3uiOgQdYFOa/w=;
        b=oeiBg249c9YK7ytyzpaF157FV7428QGFYMrE64W/kPU1LrdCLCaqpssVjic2iP5RDi
         RDG+BSfGlaeMSwzmWlnFvPcDHVosV5IdY+oODW2GmOn4MY/xr24KdjgKXUKoaxCVDvEZ
         CD9H25nMnqGYdl8Cte29ufmOarqmYCn4guId+d5abqBjjpG/+qLsq2hL395FRjl/UiSt
         VUMPj2TUFsOoPSoSnxNr5un3nN9cGRiYTrhj61SKaqMTtymaAcFJaaajve0P1vEzdKYs
         IoMWQkzJ9GE6HtxTBd/O7blSlQtPVKPN7XingiocQlMmR05BOy22q/SmOuVTA3Kpfp5r
         TznQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhPZ2e53NdnZeICwrnOw5QIAFyCC0fK1988I+BUldoXnn3SUhgpRKb93tKk6XS0c3xCeWIq3MtQFJLx7Es@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/HVAASb2VRQekYY+rm0HEBJ3EU0G9kIw6fdeVZ8UHaZnNAS8e
	vyiqCz1IIR81VjIGvHtUkHtg8fM1AD2qGB+9GfHCQ0OK5rPIuhJ4zxtjOzOTliVp+AFfL+SSlqs
	7sTzKgZIL4hedbwiuksX9YMaJH3J8IpnnZsiGCUZkpBSANxKjIza9YcjuYd3Y0Aiwhz6x
X-Gm-Gg: AZuq6aL8ewkrN4TjtQ43dHZIagzOBu5NBn7HgyEI0m8Wnhw+FJ/uiWFEHp/5XXUVLwy
	wH8qDbsHoNX+yFw/EUPRZ8ECLyW8AIydaK0mqqC/OqJL8DjLhOF0cQqI0dPCLGYbM06vstMoJDV
	38pkCVU4Z3E8tB3+MbxpfZLFsiMRoH4/veFgvo/mvxkfwnAz7InHwnQuVezMYyz0rAKniU0/sUt
	5xINiWn8xioUZrX60vFHNamiRvJor9kxoyYOVMa4fkTiFR1lgOG6aDPsR2YGVIEdA23pxiDUKgO
	yt+3M6GrW35qfwhP+hqHUZaCKYv9I5WIM0sm0XyqoUqt651LvgQ3z7B6upXN02io1XsDbk1r/F0
	XJe+Yv60l+Topf++PhPT48tjIQTEnlvYmJyY=
X-Received: by 2002:a17:902:e784:b0:2a7:9592:210a with SMTP id d9443c01a7336-2a7fe61a635mr18596365ad.33.1769152371175;
        Thu, 22 Jan 2026 23:12:51 -0800 (PST)
X-Received: by 2002:a17:902:e784:b0:2a7:9592:210a with SMTP id d9443c01a7336-2a7fe61a635mr18596085ad.33.1769152370561;
        Thu, 22 Jan 2026 23:12:50 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:12:50 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:26 +0530
Subject: [PATCH 02/11] arm64: dts: qcom: kaanpali: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-2-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152356; l=1198;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=y5OhV5IZZ4cD3XJwqbL5xsBPAwLjd4WvI2VkiE2j1E8=;
 b=ZpGsig9EG/I6gxF+u/H78n7MpylmybmMXBSXtcZAYrl1aJj7A1j9flgX5DV0tXJY1pIZ89kbY
 QxpdF1C18gSDwOFlCmHDGNtZHsziliqw/rOS/POfkpTvQEKmL6nCgqd
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: b52gS0QHXHlnwlq03Bnv7p5Yj_Zd2Z1e
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=69731f74 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: b52gS0QHXHlnwlq03Bnv7p5Yj_Zd2Z1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX2brU0L464hDQ
 OO+2HD0dq/vverwlAWOdTSkddJCDiaE+qvm/XGHbdYdZ6rCIaDAwHYmMSAZF1AkOwQbeAMyPOSb
 a2yTm2l0/HF1r0AzVMor/j1JES68v5RiyX8RpWTK7XyKkDueka1uIUMMEIYAFRHRd+lteskZ8qC
 MJdV10TLhe7l80seP6DJlvFTkXj7CU7fiONFZcO4ZM6otMcygAJ0wdobGbsS/qYLB1o+ZVZtsqn
 R5Bv/Xaf3OfjPZMF7bwLi18GC/GLijfnJlb6L18YsQzjUKVt+Pxy6wJnTG3JjuX5EHTfQTvVsXQ
 LQANh7wqzqDlHoZ9qqecumIGc3oJny3MNUvSNDTyOnb5/Aut/B2z56Z0fYtrVBChvado8BdJbHJ
 +pUPXSgGo0i8TSFRfYvgus865xWKUk4J6av6apiOv9ApWZ69ZEOHBB+51JLAc+/FZiu8xuQI7fN
 ngz0jZ2e9TYuSlRcwYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90290-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,oss.qualcomm.com:dkim,1d88000:email,1f40000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABE3571913
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and 'core' and 'iface' clocks in the ICE node
for kaanapali.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..7dea93d80636 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -868,7 +868,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


