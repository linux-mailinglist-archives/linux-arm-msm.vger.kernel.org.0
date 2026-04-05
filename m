Return-Path: <linux-arm-msm+bounces-101865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NQAHq9z0mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:37:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63639EB69
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 917C43034B11
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611B82FD7C3;
	Sun,  5 Apr 2026 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdjYm0L7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT0PMfZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1145D2FE075
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399667; cv=none; b=psON4Zm8kB7nM02VuntPSkx/aDtV3xj5KwG7khCNmvnIu54tL2Lzq1rz/7OQMIQxu5QUPGVX4rPw+DlVyZ6zUpnJExdfJKtMNIImdR/j+V0h4XUyDqMb/gn6w2nj/NqNUl148WRB1PAtmU4ux5XiUOF41gDPEAONIzkfKrw4jsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399667; c=relaxed/simple;
	bh=wTyBsbVFmvsQqpCgq/J1A/2bDtZjhyAk8KLBFxuWu/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DivugrqUeeQFAfHqet8RNTqSFc8Pkk4lrkbMoHz0TvJaEptn3GfT2wCUjrxyjt2cGCBnISDlHTv7WvbFlMsPQwwFBDB4RBxude3V95PmVomiDbeYwQQdfS4J6MBVsBXy4x8G3oHixvaGSX3DwAPq2GkEzDONTaMK839Qyng+ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdjYm0L7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT0PMfZk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6355102O1154411
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWhtw5e8ZkAVkw6AxfuaycLcF65AIqs8mxtqI1auKNY=; b=KdjYm0L7o+p9mvMG
	FBBo3horl/8L6+VyWogGhCmc5Y/NQ2IFJzN8PYIAWbxzBsJOC5deVrIqZHvjtv/4
	ONJNifPKfZOf2mGBpcJ1D4tEcMDFZwSR0zd5gijyRNhLBOIAPhBT2K6IyiM6Q9ZO
	JndkryOeBtjgj8kl+aOz+6nDYVn3ci1sq9Xoco+R4qLyxNxtLkhnAhv4DnXD6LE3
	tvD3ZDCA7Q1Ei6e15qSsdfqJ8b3BW25Z2OBGse++nB9C2s/iEj+C4NeUOfHT84fT
	3RNhLiOAiJmrl3wr7qF+gA0krChEg3XtyQDQqCtWzQ2A6McRmQ/9TLV1thO9As/L
	sTXpFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7uap05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so23402931cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399662; x=1776004462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWhtw5e8ZkAVkw6AxfuaycLcF65AIqs8mxtqI1auKNY=;
        b=MT0PMfZklsV/y8ZtLtmMPN5pIEfIRyAFNkbFYthOPoc1Qddih/sfn0CfgYpLDFWkYs
         eGTK2W8mVmhUxLHL/9MsCVdXSUyTagDw2GH886FEbMfQUMTAzH0ilxu9rrA1bXWQatWI
         1zUz8scPU7j6DLWi9DAhF1solFMAA5B4AMir077futOWzy2c+gBjcmGQVaG/r3EAI1Ic
         gHfwDC55auBEQnM6UG20vGguyAzLVOkckK+pB/+0TUJO1BVMl5dWArALwDaK6QP8pczd
         W+bAd3uIPqt8kkgWbnHxkeMQ9ApPsSNP8WHlFHyTdE8FK7t8dHAPcvA29yQnxONPHLRX
         aU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399662; x=1776004462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWhtw5e8ZkAVkw6AxfuaycLcF65AIqs8mxtqI1auKNY=;
        b=QOBpJM46mApifkMcT1D49T/f/JM+Fop1kDSxQiGVTWfMtMT6PjkyGWBzNXBKls1kCv
         1VidiCi53X7xeJH/kjMyZ/JEHLSoshs5xuKRPVhiosC0UC5CJpgzcKhOnaI8c8m4/+46
         6y2t36iiLHv0zD+me9jMoCGlhR9hTD3dioNir64TAn+wOSQPohTLwaolJ1mMjkHKBjd/
         xC/lFTfW87SrjyxFQOcN+RnoPPwFP7aC0qKss4exSjcNhe6khn3boRxr1RIxfQ4KBUQF
         joBFnTK+Fvz9QUXUqH69Z6qAggBGymFp5CkGHYC8BMrfAEzisYI4hqYKukZJiBs+gU6i
         cCfw==
X-Gm-Message-State: AOJu0Yw9WflVU2Uo4c0C1q9lGWHn72JhyEebOxK9kJ+Q3ZkqiXld/SW6
	7k0KIYk2Yt/6d7k3W07FsRm0NFj4w7Io+7aLWRYZB9FjMt8/0McXbQRCCmdXiAWdt5rCI1rlxeh
	1E/ELZh6pZRsc74GJiUoGw3F8ctWSRf4Qu9Qe/P2c7FVe3CqWUECGPziW6xhiH2P3oXIZ
X-Gm-Gg: AeBDieuDQNWRWpF1YKt/qK0oMPjDrTG4Aq1BXsZS/D04LUo+OkquvRtfIqiTkh+zbcv
	Qw2AqhMtmuav5MC6GWyFcSb/HA+PSJNdcRXtNjcyt4RFTPmiSgzfMmhIXJWC/876tqnllWsuilO
	ApvEQfSS1E9eCD/DwqkKTGytOV/92vHuDAkOBRR0XmppmGLw9+brzxLQRxRqtuiBClgiinWvOEt
	gCB0aspfY6GvLhkcdYL6pN7LGSfzCEH3ukPADNMEPdrwsJYx8gVaTMqY/nS1TMVpUmfzsW4XbwU
	2qr4ObiNidgEScLNu4oZUvhOqY+wSgAz5Kzzkj5CRWPYBuB85zlm+jtUngrNCZlu6ewVbSDGWud
	xKrxMjqMdU8njyw9ixnTMUVT6tREQjjJU7sL9TqYkplSD
X-Received: by 2002:a05:622a:2b03:b0:509:34b8:a373 with SMTP id d75a77b69052e-50d62cbfb5fmr148458371cf.32.1775399662522;
        Sun, 05 Apr 2026 07:34:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2b03:b0:509:34b8:a373 with SMTP id d75a77b69052e-50d62cbfb5fmr148458021cf.32.1775399662103;
        Sun, 05 Apr 2026 07:34:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:02 +0200
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm8650: Correct and complete DP
 address spaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-6-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wTyBsbVFmvsQqpCgq/J1A/2bDtZjhyAk8KLBFxuWu/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLcRbkorQilz1WXRwKlfKpQkLKwFWGuCUWKw
 pPFmo7H3hGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy3AAKCRDBN2bmhouD
 18yIEACRaZMlJCkZSZY4is0XxsJoPu0EwoDPSNa4DSA+on9+goqgNFKDZcbVWPzPJL8Q22NEEyy
 3FwmkYot2UwQLh/6okJF67xUnf/Rdp504cKtU3irRlcrDTdtPOopXuD4g2EgiIx0jmMj1ssDyg/
 SBkFLRi3b3KlXTKP4JzKBNTpLQM6he0X7dKLnla6U/3zSmW48sc64Pmqpg+31DhlMgU14Rfx9Jk
 sHQ+RA6Cyi5yEDHl1KM9MvnE90om29GmA6aR++RLD+0CQTOsIS2YTAcmcDE9oCS/VOd8m0GB5kX
 CsplJJdBOXqg9fkRYES0/BmLu9HJc1b+l5pmaT2ZvGVcuWPZKDQz3+H9RkmrqnMXEpu4vRaXg41
 imxg8/gH8Flv9LOsscI/iMqTH9XVCJ/3IGjqh1I0RXRiQ1iE/vCtdn6JumothjL55baErPAmNrg
 qWNfQeqLmrK4hK2P4eoF46G/TH0adku/6jo+1h/PT4szsWZj5huI6l+9Ghu8jFVpiDHsQ9VJufy
 oZQN6OyUcrHshBgUtdoiTHwBkTKk4r0Ca4iQ4B6l2qoNa9w6mQZCE0jyEPK2U/eUyD6y0yw44h/
 fQ8gVtuphIfLxCGwTTGQTrxPJhgtBjSF3LNpvoNiNRq8I9bbSzimavh+/gxjTr/UibON5+htGSu
 OO/QeL2IYjgJKZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfXyY4NseM+u5ow
 q3J2SDOu1/syaX3vr3Bo+W9WFOwrAwQRtEWTi/fxHq3m4O6ExbS6XjQl2/bItv+OCGdPahRgd3o
 wG1HeEK/ErUt+IARMenf0jksSmrURG4HfTVwMNNYKyeKtdCONfzukKNs8IvO1v/YZytTrEXBcV+
 tOWzRf8c0AFPtf5waY7lwmJVqm55ytCEUM0rECORCjThEndmBZMupRYxLIrWDi0k8AtH8esto+1
 PYA2kjIk3V362lZcW1Qz9FLyKSLqRlQCgR/Fq5C+fLrovcnekviELrb6Nfj+9CSpOCEfTtRZcGq
 ehdlcEWNi6c/DQFO/mo0TGybrpAHUl9rrqWern+9P2kN7XjdMFMNT5J9IlmJYH0FIbSLJYbOvy2
 Zp3oQ5BrBGSZZUPR49Kd/t0jy9B+dHF8WKLp4dFotslUALVqcXHOiH7OZHBSMsDVGO8xpNILBJj
 CqDaR8YGu2olJVGnVeQ==
X-Proofpoint-GUID: g-fKgaK1Orb1CvjetvQdz1ANPIpBp0OC
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d272ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9LIhnIfllzZggS0j5EYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: g-fKgaK1Orb1CvjetvQdz1ANPIpBp0OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101865-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,ae97000:email,af54000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF63639EB69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DisplayPort block on Qualcomm SM8650 has few too short address space
ranges and misses four more spaces.  Complete the hardware description,
which in the future might be important for full feature support.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
dtbs_check success depends on the binding change (first commit).
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..bc420a44f0b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5868,11 +5868,15 @@ mdss_dsi1_phy: phy@ae97000 {
 
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sm8650-dp";
-				reg = <0 0xaf54000 0 0x104>,
-				      <0 0xaf54200 0 0xc0>,
-				      <0 0xaf55000 0 0x770>,
-				      <0 0xaf56000 0 0x9c>,
-				      <0 0xaf57000 0 0x9c>;
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
 
 				interrupts-extended = <&mdss 12>;
 

-- 
2.51.0


