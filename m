Return-Path: <linux-arm-msm+bounces-101859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJAnOKZm0mnLXQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:41:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBAD39E982
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71B413027951
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 13:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFDD347512;
	Sun,  5 Apr 2026 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JN2vQzV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMR2Robp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB3B25783A
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396406; cv=none; b=nM4lgce3SfetvPJGtOsoFZ0yiQiqjkRNYp7WRQ59/akrbfmT0DlhPKHbIUGm+gzjBSxcHr5gbVHRvt3QG9z2sqSP6bKcg8nr9gPb0X7zx678zwtqtQQdGjkF56tmGQpo6w5eYjXeunT8CxGUu5rHQS9NQY/P/F/OsLcLSwfOwQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396406; c=relaxed/simple;
	bh=E809FubXeDT1bJW8CG3RRWjrZl8CT76GzOCXhNrpQ3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MK3AuShoyEto3RYjoya+XRdc8wl4G2AVX7R6AVOgSweSraSgx2/g8uBJTmaLG5Gq1fj7mzjdxGmGLONGW3G3bX88sBr8pILFwfifDFgMtcB3Vylg0WipULlpIlGSTHcLl5KpfHxi8XkLaczQcOcRR7FJGTLipXxyiE5j8gWj5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JN2vQzV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMR2Robp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635AUfdQ3628652
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 13:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7d3loXoVs6deYz5nhAWlPQmOukAdKRKrSNxEbWJjEwc=; b=JN2vQzV5otjp/Oqp
	uEVt2CehG+J62NMpX0BiEbMP08QcSY8Rhky256NGKAEoKfXdHKv+oHUEwAS4PjCB
	CUmgbdf10/BCMSpszHgrZxwZyrXcGpFmWo1Zi6VUWlZp+1aFWZjGhRrWytURZHpW
	t6NSiU612Ctes3Sl3oeTD81dkwRgUcRjKFho9rR4UmgVlbQoP/lCilf2wvPer7m7
	FV/Up0HIDR12x0tTbcOvuu5mwKDv1p3kZH2RWyD5tMfF+IPS03jxwzf7Mji4d+PP
	5DKFYMgltTKwGn/4TiPxvk7nF5UjiRV6fjhjQcv0xY1xal+NGJStAoSFtey6MiEg
	6XNsYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfjkv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 13:40:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d58bed44aso101136901cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396403; x=1776001203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7d3loXoVs6deYz5nhAWlPQmOukAdKRKrSNxEbWJjEwc=;
        b=aMR2RobpZSo/TRcb/1wcnO9iAPeemKeR0F475CNInNzf8GJ3JbNyHK1WxmSnUVoJ9U
         +n8URScS7d3d4tmPXumOFPCRtNvlW2hGSkpBSi87C7P44Q2BT45g6yraAbfuSD/+SjJX
         XyDBtbw78tPujMjdyH/jfMF4dJmtJcDYOjeUFBIwNlHDVl+Md8l0MH1YsV11uUkzEVUY
         +rpJGaPbI8HatUkbsA0FovmzMrYKq2co1foHFJrZGeHfkhXIzgWksb/FldaAViUZ820S
         eQ+bIqAw8LlIm8gRRfkpU44kAFQAnOV0oIoSolDrHbczogU6P4hfAYguqhsk+p2nvHjm
         vAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396403; x=1776001203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7d3loXoVs6deYz5nhAWlPQmOukAdKRKrSNxEbWJjEwc=;
        b=jS4tuhueobqRuMdYFKC3Lz/QxMWEa0Do94bb7IUromo6Tgzh/8dabFBPzs/aC8ijWG
         /VASYNYiy5dHpCUTL4rSfbnhuu/PTkDPvvf1hiV9cBWdJeM5ki7jF5ksy9R86cSqMYo7
         27NffclfPbB2Fdd914ZUn1ao18NPcFSYwkwU47MkH2Qnn2g+yP24f5yjjFiTBwbX6Bxd
         16dDNDonfUjrA9I8x/TiPO9W3i4s5PDxgkV++No3Q+lqZlQba9ySdcqSTSWEtACAL9Jd
         HEj2Hyb2C/5fLW/0qOExyy4AHrHzb40rIXLfFczmmRWkq+8KszBlwvlWt/BRO23j5AhN
         w1tA==
X-Forwarded-Encrypted: i=1; AJvYcCUWksLZBbSbWfULS35PrqtTruQxKi5vQFIlZx6Dq6O2NZiyJyNy0nR450gZaPhGud4U+CJBNWNbkHbovTHa@vger.kernel.org
X-Gm-Message-State: AOJu0YwtQKRosI6bNjRmb+1OTRcmSdMRW/cTlQ2EarYer12ztt8CH/Ym
	dY1b3ulLr2yxZ+XxQ8R25a9atR1+Dr2cC6NHgvmed/22nAgdtRhJo0b7Dv7oCifP93Bv2M81rtn
	DFhC/C8aDIhvWrR0BPpnjzVB1IpNEXs2RTQxDdWezXgwb8yw0fsO5iLAB3qVVlvYSvqih
X-Gm-Gg: AeBDievUY0WAZrrjafgmwTojWemanu3zWNeu4IuJ2uV3jH8YCD0XoENF4WU/n1zHceh
	Onm+vvNyJeUpBykda7rYJR+HeskB2tMRSycRxrwI0EV7OoAU8QiP4uYZk3fElFP7UnwGIk0VNA0
	HuG8kSSNxjeLalxKnT8g4RaN3LVWxtAgFdPCOaJKKWvaqzWtIksLBJYqHNCpai01Ft/RIPzIUvF
	wjSlPrWr+ESlVIoDek4i1djbiqkjmsZ8XP4EHweLXd3oq5iSlqN4jN4FIW4Q7qj9Sk6zvqgEnb3
	RwwaEK87VbtBaKUyELFsGuCT+0APBHb9sVnis1LOJrOATN0aIvsvwmtdNV0j6FpT51ZINUOeM8s
	X6LZfaeGP066u9qEUdD+OCO+eSzHrcm20uXIRg/j/415J
X-Received: by 2002:a05:622a:1103:b0:50b:47ae:8abd with SMTP id d75a77b69052e-50d6260c405mr145779431cf.2.1775396403499;
        Sun, 05 Apr 2026 06:40:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1103:b0:50b:47ae:8abd with SMTP id d75a77b69052e-50d6260c405mr145778821cf.2.1775396403002;
        Sun, 05 Apr 2026 06:40:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:40:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:32 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm845-mezzanine: Fix camss ports
 unit_address_vs_reg warning
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-5-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E809FubXeDT1bJW8CG3RRWjrZl8CT76GzOCXhNrpQ3Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYijPthMskIlJsdUCJ8Ux7ynYYcwhblPCvCV
 GH4m/AagbOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmIgAKCRDBN2bmhouD
 17q4D/sHRh3bFcPXof3MPUshJqEiRcxQsW/cqsUfZ1fejSheJWEsNbVDe8gqSgNPYjBFUHY+Ftz
 BVU3Fx9eN5OtQi+tlhaAGmrezO2Fzja6EwgnwW/+u1leVuHGibOA8v07oVepw4yZ3J1C5zlas22
 Hy5hrJzith8L0q3gZQUILsKnttipeoIHXatA63rMzvcRFQ85GdhfOABMDlsexQ4UZoAcyZIpxuU
 aUx4DPA9Juj+SpeNQFqpoXVQyvFhEdeaUS63rP9CE/GSN62/KWM0q3rk6eTqkFFwOZhssk0EUm7
 b+OPFY3zPgX74k0BAYonfCv9oBr5ChGUMdiFTeEflJ6wGqmpMygLPi1oKxNkml5e5lC0EZD6ahQ
 lxr/BZ5/QNn4lM816Okn1eDFFDm1xP0fM8mx8JXnPfqGq7zbL9YbKI05uhzdq2fB1I5zCoCD0vU
 S+1FvcAu8SdqwHBvTdz5OVKnIsV+GmV2CT22IeHm6dtYdOmh2ywIH6/kuWMvMxB4S+U+4nwALfi
 3PdCUYv28Cydx8hDVKPYNZ6MUs11EHrGLXy34qOn9xcpR/5ixqEiPx/0Y+5J4YwL3STl5aagThw
 oRrrOJLh5Ea/SQ8u0+SzaLjMkGaOeaQCMf1FevbwsWVYiR2K6YUZ6QMQtk8YRFSqvS7fJVn7Tr5
 PxnA4frEV6zpntA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX9vtKPnJ/4Xn4
 ZVVEwEIKDvAJ1xtecpP4M7PNioV7ggadlCmg5HmT4o50BQl8qZXOZzd6bQQvmLILw7nUzrGt6Br
 rPICMzv/BXKaivXK+N+WkPdn8NJligK79kClRndBDwyDVnjYTfVScqN+vqx5ziQYhWpBXBItZQN
 Xk6WHoYxV99EBaZQl00E/Q0dzYiYmW0fzeFT96fM2LQyHMYuqG54RcKl1cSBYIJWHYzz8voV0Or
 kDpaeswwsaqes0FzteIl0g3hnKOd0k0XqHmwHwEZ4IfNxni2YtHxt72egpR8q7iXJPB15dPj32Y
 HxPXiBXCPyHqgrTARbMcIaGregd5yVwWWsu8CJ8KAU9acplRGv4uuLyBF4pAk0vJVWnQW4a5Fdt
 chA6ylEZPVFUrtQ4+5rDspZIDBbeW7iPDKVbPXqEJ2XSWQ2tWyN5vWvdFfDctD0CmXjjVYWHwAr
 80eW+R1XX7IxoDnyTNg==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d26634 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6Yl2zW-OJvWZmFEgjvsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TNFuqXN-Q7SMr6N7kEgh3rHQcTn1u_us
X-Proofpoint-GUID: TNFuqXN-Q7SMr6N7kEgh3rHQcTn1u_us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050140
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
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101859-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DBAD39E982
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add necessary properties for ports node in SDM845 DB845c Navigation
mezzanine overlay to fix W=1 DTC warning:

sdm845-db845c-navigation-mezzanine.dtso:19.10-24.5: Warning (unit_address_vs_reg): /fragment@0/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property

Fixes: 30df676a31b7 ("arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index dbe1911d8e47..678a17c805f7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -16,7 +16,12 @@ &camss {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
+			reg = <0>;
+
 			csiphy0_ep: endpoint {
 				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&ov8856_ep>;

-- 
2.51.0


