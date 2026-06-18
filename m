Return-Path: <linux-arm-msm+bounces-113765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tnx8BHbfM2o4HgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:07:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6479869FECE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:07:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HGckqdcl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D8kVBQ6q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113765-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113765-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4714C30A2D56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF8F3F4130;
	Thu, 18 Jun 2026 12:04:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6FB386429
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784246; cv=none; b=o9/xQi2Rlt5bpiz9GrthAr4dvXP9c22oG2VBAPUcQf85x+pinuLjU5f8n6GZ6cJfQ7cfN95J6Wnqkx3J5EmsJMt1ppKiEC/F+pgefyz8gaP6Yq0M/UOIYrzcd4kt6/2wi3uFFmLoR+yC5HkLyK9uJjSdzhsSzYEl3WXttVCK4zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784246; c=relaxed/simple;
	bh=CN7B+Lh5v1f7ljPZ/xx3A2oW+MMpv3B2h0zOfhfjcDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkAtppjfpblTTzvSmephYzNnEv4KEkL/GQMG9XcTYNof/VqzMQbadaVXMYPVEU3nA9SS+Qnn66SyvIIXfWGHf/6Z8dt83rRV7tGNTY+LUkYlDWA+n5Ktue+wgYPsJSX3CIgQqEaqF6esnFduPZiMTh7m6kdAWRLER0KGh731BJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGckqdcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8kVBQ6q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAriZb1054973
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50qpAKaZmU7XXgHmmXrFtM7Lmi8/JSAxN0nLlW6ovKE=; b=HGckqdclsLaflah1
	jgUNZj8Ku+8xIBefwXwmbnI++7ADnFRepx7vNcQOsyDUdwd9YQCvSLhDmaROLy1r
	M+BYWAbaQojuHpNxP8+cMd/PjkTxaX/wHbJuyfIK/QeNc61S88P9c5BRz1uXv/by
	371tU/Fe/rFfeWFK4ssLCpEopZiMZot/Y1QqksI25xuQT4bRjTKV7vUzvIomH8Uz
	YQbfE6+eGl5qIc8juQXrjq35kQr55ojIzOGIStVV79kk55gt5GtruzE+6GzBLh8s
	a51Rn/cBo8XvXcQewhjAJWl4sjnqXsVk3hobgiBIsOCFoDMoZ7SbqY3DGGVeltgB
	k3pX2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cccsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-307fd7138b1so1309691eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784243; x=1782389043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50qpAKaZmU7XXgHmmXrFtM7Lmi8/JSAxN0nLlW6ovKE=;
        b=D8kVBQ6qjm/2szSbBnca9TQOQGYIi/N3Ode3XOgTThN9DKdRLTM2QpyGQ+uc8huTVQ
         XKj5/3WnF4JL9erjI8dlURVkjLwMGFW70XBVkpQJP7frtUpQhIqhxyDBIxvVTu09pn9a
         xmyveeDvlt5j4u9s3jCYXpksig+lJsvYWqV+NjFiB1ID/caykPAfw/M6d+w261RVUAgd
         hwfOgX4qrZxNtaVyYeXzO5jZXk38eGyDAIrxFAy1VI7uc8s+wvD3EK+MpJNnL11wfvIK
         EoYD7d4i6KJjV/QeXxYXWHRck9bzLSqDhPAvI8w3JLUWGCToczBdG6uW6F0DYl5v3A91
         rolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784243; x=1782389043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=50qpAKaZmU7XXgHmmXrFtM7Lmi8/JSAxN0nLlW6ovKE=;
        b=LAiu/gqhiPC+eNnIGIQ6Kfy0O/BtwHth2EbGAQY6proWl/hOZGvQkqinpJBpiYPHyu
         bL37YwVr3KneC3H2B6Bs+JHCtulZ9Rb7snLY/Y9EEM+MHCq9UmAR5fywcxjgTLXeYYR7
         A4fJP7uhllkVUIJ0M4FtPPPUZtL7UWEhRRRknN63S2Xg44KVjFeY6CGH3m1PpU4RfYIj
         s7CWGo/mOltaigrugqspKaqKn36gfX0uLm39hUoT6OMiuDJjkbw8SsZqkQIJobX+gHM7
         H0uQQLgBCh7x7Ww05AD0PJPsMwl3GB2LPlSAEj105MbJF48vU1+F/cdATpQQSjF8HvUz
         dOjA==
X-Gm-Message-State: AOJu0YzBfkRgovB0v+3Keu9sC5u15o8uZUbMvxxcFYFYyXsG4SKVFx+J
	JZW6RX4PIh5Fb9YDPK/qwSxFTa+wjVp+DqGy6UlGCop2jWBNJMxLBGpBYg8oWT0JDrDEXslNQbp
	jBR+JZBZ+PSoD3epFT6b6IBO/Haq/TGAoQyofYx12mM1Jw8A7EuH9AbehbUaOE5GT6wk/
X-Gm-Gg: AfdE7cm3uA1/WHXZcFO8O9FF5X0LFZqIxAQtUKbw+s4fWxKKBBsh2ab5y6owMDfdJkq
	UUd5XgrBP44IKhQTgpmrVIw8Gwot8BotxaSfg12IDws9RVHGe+XDAeZvw7E4ILOWBEwI6pp2RlZ
	l39UFsm7qeog69DkUGd4pxqUxfU8ZwOz3xsN6A5vO1kKGAOB+1ZC4kFB2O2MfxuA5CDUh6Byme8
	XIfOEfmGuBsVBKG9RV/zhTO9PpCnFy2Uh3Qf/mSbk6hK/yUFKUntOilVkaDOqPanpxj9xbAoTXT
	wVW5BhRzrtb1tWk51iQ/dYFhwKmoLJhpTTeKArE1QnH8whRbieC9am8NYzl1NIp446xT2n3vzIN
	pVixqYmsVAw3kuoBlQpAV+rAJar+d6dOiQfU0f+7pu96g/UeHdcRaF52We/gtxzuDQw==
X-Received: by 2002:a05:7300:cc0e:b0:2ed:6f94:9d96 with SMTP id 5a478bee46e88-30bf09c7bedmr2371527eec.19.1781784243360;
        Thu, 18 Jun 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:7300:cc0e:b0:2ed:6f94:9d96 with SMTP id 5a478bee46e88-30bf09c7bedmr2371469eec.19.1781784242643;
        Thu, 18 Jun 2026 05:04:02 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:04:01 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 05:03:50 -0700
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8750: Add camss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-pakala-camera-v2-1-9fbb729fd242@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX7KznxF/7n+T9
 +oGS9/ri9Mn8UU1LBt8Qi5HxWw7h1UYhvy5v1CdXNT+HPKLQNlNtgPdsglI38iUu0jsLFHruLvF
 lZWWkJG2uG1CsdNv8wn7/IyfRMPrHY5Rcr6A+xf86prI1XrPU5A58eFJrb7qCtW8mVfUiRooeSm
 NwJv3x+gxZxbbEWxiPD8J6cL0FOF2dfvpFRPhM1Y2GEcgNpBGS3evzy9OxdugpvmdavCDNJQRdg
 ajnT9JXbvPHwhT1AZIk7qhLQr/nABeqdEEU86kws5sbglmvGzkw+fpyN8vMM+pwqg7bBPxB4gfO
 x93gbliDrYvkLBaVa+nkkqqJ8QVmwDt6ThP0SQ9INsBC9ot16ZY/Wh038Fk0sHBANFzti1ykJpV
 3Pbp6ZL5aFhMrcH5maih2yDThqv04R55ClyQP553rccxwZHin7+yf2JehUWuaAWVsDr0QsLdXOf
 cpKt9Fk9G4naJOFktNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX81iG7kvNow0C
 Guhyfwub7KZ1Mq2eh8HfVnFs1Bq5ZYzGJTd7yiQKlZSzbDVoi5b997Ixy7ezXQXkOaQ5EwM3UcR
 0+IK/71xcPBrauqVerDxke5YIPqJHss=
X-Proofpoint-GUID: eAXenUk3Xfs06IgZOfq0JyoQs0H4Qywd
X-Proofpoint-ORIG-GUID: eAXenUk3Xfs06IgZOfq0JyoQs0H4Qywd
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33deb4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=T-Dl8XKw7-qrnIs-YWIA:9 a=FRvXc2ZoFFwWrJln:21
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113765-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jeyaprakash.soundrapandian@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:hangxiang.ma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6479869FECE

Add node for the SM8750 camera subsystem.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 203 +++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..15eb588acafb 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3037,6 +3037,209 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@ad27000 {
+			compatible = "qcom,sm8750-camss";
+
+			reg = <0x0 0x0ad27000 0x0 0x2b00>,
+			      <0x0 0x0ad2a000 0x0 0x2b00>,
+			      <0x0 0x0ad2d000 0x0 0x2b00>,
+			      <0x0 0x0ad6d000 0x0 0xa00>,
+			      <0x0 0x0ad72000 0x0 0xa00>,
+			      <0x0 0x0ada9000 0x0 0x2000>,
+			      <0x0 0x0adab000 0x0 0x2000>,
+			      <0x0 0x0adad000 0x0 0x2000>,
+			      <0x0 0x0adaf000 0x0 0x2000>,
+			      <0x0 0x0adb1000 0x0 0x2000>,
+			      <0x0 0x0adb3000 0x0 0x2000>,
+			      <0x0 0x0ad8b000 0x0 0x400>,
+			      <0x0 0x0ad8c000 0x0 0x400>,
+			      <0x0 0x0ad8d000 0x0 0x400>,
+			      <0x0 0x0ac86000 0x0 0x10000>,
+			      <0x0 0x0ac96000 0x0 0x10000>,
+			      <0x0 0x0aca6000 0x0 0x10000>,
+			      <0x0 0x0ad6e000 0x0 0x3000>,
+			      <0x0 0x0ad73000 0x0 0x3000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_NRT_ICP_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
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
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
+
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8750-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1


