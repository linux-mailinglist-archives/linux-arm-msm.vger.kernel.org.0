Return-Path: <linux-arm-msm+bounces-107106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JNwOEo2A2ow1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:16:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 393F8522294
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C3734CF269
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D8A3A985F;
	Tue, 12 May 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vfd6PmCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZEypaob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE93AA9D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591705; cv=none; b=BF/T7b73B/WWJZcftAZht6qdq96xD4CSoXlcszUFz8hnDoh2VPGQFyjstIGFHXivHlQ3583z+5ooP/s6NtMGiCrcsri0ac3EktLJTHC934HwSfKppCZpys+CUUw6Wb1IqrMXQX/+FR5AjjujAR0AMYrIvyrWx+bZrLft9bPcaoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591705; c=relaxed/simple;
	bh=vngOrHkgNad1Q4pt3o1jl/qHUnWu7b24wMujj5oCGFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f70jF+jxhpDDfQjNLCK027TTA4WlqewSFFMX33yL2lBRtsQlS390yEs3f2ctrxh/E7+oC3Qm23WSvujX4AQ4aio88R5p4rYE3JbmrRrT3M/F8sGgdRxwlidKYROg9oPMO4CN4mNpIdh1jNjLIfKhPg3xeX82tsp8n70BnTn05tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vfd6PmCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZEypaob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4PJY3320938
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=; b=Vfd6PmCBfd+Rg+jg
	6RluTjMnnwSC+KO6mMAwb1VhwaU+ETxHk1On4h29lWOAvELvVKushktz/DactpZH
	aZpi+ZYncxm/KAlJPw1z29B6OKjsifsIhaXHvJD/4QE1C2EF2DeE0mMfQ7a4dkT5
	/B8CGl7H2zDBoXz/m7NWcpy9C8wQjcrCuyYP40tqix3p2xrL51dFiXPMua2F7NPv
	ktd8z9LhM6x9Mp1/P3L4CNMP6DbqU/PNhPVjfHfdttlRr7s/LqpsH+AIPZTMPY9Y
	D/jednpjaJ9TbLescHV0RXQEF2boCk5FHCQ2O3W2OTssKsGJkP2WI9utFiLmcy86
	OEkvow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1r768-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:15:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63308aa427fso1113009137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591702; x=1779196502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=;
        b=TZEypaobp60AKwUlPncDRpWO8xAmNnHBTZmsuKP30nLJSCMAHUNSf5V/LWmuVt7L4h
         KYQjRbRVJeQljjY0tcRhFgaP9KjOs/c0ZshXQ+IyLABO46NSWAizlCPQK07pCVF31npo
         sek86r6xjVDo+2Ep/UJcRlcfJYRVomWMLxCZqJtJS6qid1Pyed+w5DCJ65lh8NyKbWA4
         D4YStcOaTRYPSRUoLly5wehT0FR6g7G3warj143NALYfbuWUie4eoOa66nYfc4tFgjWD
         eMIdO/kmn7etx1T2ave0GVwbYr6Eju+athYCL5Jgog9Mlj1GOv6Qkdwju1KQHN2hcLAr
         cXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591702; x=1779196502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=;
        b=iRKPN+mh6YIPtkdyt/10WXoYf6QMo68We3hpselzlUZMxnn1/5Uw/zv+vYl0X+y9UO
         FguBooI5OgCnGlFsQnaHmZr1u5mUUNDegEPJ5Os1XPJ9ithLPGjUAyfUx1cdND0TOthe
         0YcTIMbFDqDHaFi6kPVgBGIic3P+nis0yrx1k5DB+lahBqGLP6voYnwHgH1dpoCM014w
         Y9kvTJBpQcFYFsEep++ZfQtZyf4wnFJ5bJ/OuDyHbLA4PkwgkItGVI5dVp0KW+S6FNSV
         49zztI53OVrxxr/qsy1zI/axrJNh+L4jWH79xhq2KbWg7aNuCj384GppBBRggxcavOcJ
         W8Qg==
X-Gm-Message-State: AOJu0YwZUwjNSmgFj4oXsaAOEkRhbefcjPXPV/q0ynxUynDeg2sKMvFt
	nzYdWDRFQihSRTlWSPX1ye8ZnQPYenabHQCZevgKIL4hWF2OalK2l0+E/6v38rZwR0uyp3Q/12o
	+Xp1JNWx1PXwgwUv3/1pZihnZhL9QPqi4vwtyAsBiwm3SAHBv5L4gJM4jRyIInjADAr07
X-Gm-Gg: Acq92OHEZo0KSBiy54odI3AMVIXOuCxaDDNUOg6M0z8o1JjHZQgRf1vx5uLiKfxy2kr
	cif4Wrp1S/ZYIUoqEA41dI5y7peUVdhzkDPdttc0NAV+uqmXNdsQ9Qwkg1WMyteQkAlbabuQBiU
	6pzwZIR4xHmQVxkNhQBGR4nhNws7bD3sDEDgnYuyM/mdCr4VyN8uInLsF4qYRJAb0eVuMkN6PAt
	7Xxar8FVUW2zQBu9vfT4SxLFAD8oJtpZ3UmM30jAMSQJgVPU+OLJAOzqOvvJ/hFEbzVV5kCjxuT
	VtnzfoslvqVWjUXgnw6bqIGoUuD0LFVKL2nBLA46V/ZsvRFgQx69SKvCooUOgDlxu1Nfr5xSv9K
	QUmkuyOjU9LGuiZm0biiLHsz66oKx8ZLhfu+sTLTruoTjLDA5Hx6dqpPCCVoQPvEf36RwJDDCm7
	gHymKtGT3Dsjx8D34U/euKjUORVI3gk6eUstU=
X-Received: by 2002:a05:6102:dd1:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-63615810378mr1185926137.10.1778591701777;
        Tue, 12 May 2026 06:15:01 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-63615810378mr1185809137.10.1778591701211;
        Tue, 12 May 2026 06:15:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:14:51 +0300
Subject: [PATCH v6 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-venus-fix-sm8250-v6-2-51856dbef83c@oss.qualcomm.com>
References: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
In-Reply-To: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vngOrHkgNad1Q4pt3o1jl/qHUnWu7b24wMujj5oCGFQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfM4ux+oBQwIZEZ6sAiS58J7gOTOLKiw4t+w
 A5ZjUc/POWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1XgnCACOk+6lr+9DepHGfXKgOi+V2oxMVbImOmk50sdWQH2yW2zGxO3qMWy8WDKyKFcYwDTVMGE
 bbhvZOrvJe3WNY6XGx08fVJ6nb2jJlHJ35F13lYNj/faKykaE/e6tNIjkLRALQ7x2lNuViH0woS
 JXBb3+VF7VNK2oxsNktug9TrUpq2rTot9dFilMmlV+A3qDd/4k1uRmRFiqPTyT9W8tEERKuIo+B
 /gj5V0c8PgMrzptJLAZdln8bLe4NDEyi07YLT4m+OApasGBFAQ6viNoxnKsG/vA9USyorLdJety
 u149cXE1vBy/nq6wWDaZSEJXjGA/PKIYl7BNSc53rjLpPt6m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qvICMVug3cvmpuLLhgBkso0G5U4jtkIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfXyfUzDRBIMOwu
 XyYsOrpSnJZgGuh8iU3bfopUlCBe/qrvhi/hzSzfMoXZbXwJzjx68Mv6QlfxJBXkS1Q13jGJOC2
 WQSqwvRHL6dH//x9R6hlp90zPXxFbNxQK085AA/Kcg1DSvgepeuwBpJn5Sjj/GLNe5nipsCF3CH
 cSW8tM1mn2X75J3O21dpAJREAo7VWA324mTc+krotMr3B3Tjcqp08OYCkvDvia+CocJbzR/ViHl
 9PH6mkYGQHp5RauvO2rBT5iXBm4Z1v/PFVema30BCzpYzbjKE/Ll5tk4JCUobLtCddLqNiA8eyB
 3L3B8gHrprYvBKRJOUT2aITqf6cnaKRlgv7lWP/9gwYEGtlwlvOY9zIusntPnwSmmuZmLct/aUP
 KIJVruxk/cuZ1SRG4pGVWsOEcdfHwLiGYdy3/C0JsjkWjyZKCpWR8Y0Aw+Ry0oDbftv/jX9Yy+j
 ozNxjtKKasuRKaIIoZA==
X-Proofpoint-ORIG-GUID: qvICMVug3cvmpuLLhgBkso0G5U4jtkIL
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a0327d7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 393F8522294
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107106-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1fcbd400a3be..9ef6f3df2d48 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_nom>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


