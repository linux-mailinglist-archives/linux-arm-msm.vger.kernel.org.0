Return-Path: <linux-arm-msm+bounces-91384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EV/DkQ9fmk6WgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:35:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE698C3439
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B6F43008C2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCF7362154;
	Sat, 31 Jan 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6m820uO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OB8kQSMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D421435A93E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880846; cv=none; b=socBbiYVMq8sf0FvUhshSNM52SXF5ipsMeWvdNUqkDODbGazPLaVjc0wUiGzl7bAChonGAqccgNq0jCHqplmsjTJI1Aehd/Mzc2+8Atwvb0cY1vBv0YjvCALBYKa2rT4jWHu25UPXtc6xrPB6lUnN0pDylTchzNPefs1WFDjh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880846; c=relaxed/simple;
	bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMiPLJq76Q397zGlsiwauTOd73Sm3ubaScQ7IjG03TVcJvHjDEK8dtClh+bZcTDUSwVQ75rg+atFOWAhH2wI7/g4/5xknQeSLpnmkVQBaShqTEHIDi4AHus0aLZRhjsRhAzC5s0nO9GvmJ6Xs6d+2Yngc5f9NTGTdIY18TDdjgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6m820uO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OB8kQSMC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VFoW3o1731290
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=; b=Z6m820uOoVDRQPew
	WAq4x1ZVd+loxuvHT9KKogpDpvVbLXQitnvoYpBtmEa6uadzeRhH97EO4yRZvM5t
	E/ljoNXulQR8dM03tdMB8v0uPUB+4iV09uNvNP5XG9fO8sTCPjdEYwuQZeCzr9EJ
	H7/krzzSlfJ2S+3WjBehOFXcMbUgDij4CA2oz1o8b+ps7Dbl8f/7Sh3Vyw8oiVpl
	DyoXiRdeMXAwbbH4LZdZ1XddvWjE/BXPS/6NICdBByZ7t5uUgMSjktovaPxMo1vY
	VBRVLHzQtplt49SjuWMj1fPy1EP+BYGXPJfVPdOltlu0+hvPDCE6Y7wTDk4COqxi
	6gLiuQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awns695-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ec38a3265aso10551625137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 09:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880842; x=1770485642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=OB8kQSMC6Ky7Ey0FnrccnXuz81sqxKqueD7TW9Ch1+EyiAZzPPWzz3HJ97CUGHlDMA
         0rhA6b3iBAS1kn0s1ckMZ7EpGJ8N2LRx+kWc1mwAcSUgKkSGP0JJNeverRqd25szF2tf
         b+60kI9z4867BJrswXr9vyhsEDtdGq0ZSgZri8beiHijCj5HBn8nCx+P+Rerr3tWb27c
         e1TB1oRBrlEi+NDVeTg7j3T13iJGMvR5/+IZMw4IjiRsAr0f0AiuJJcHQN3aBrg0IbgI
         emntj+RGT+1L7M/HDumg/6IUBJDcrsmGZMl60wN2AKiBdym+xCEKez6COmfRtydiKww+
         75cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880842; x=1770485642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=CR+6p6pFRvrpp3Rawz6MrN4UHKluqG1MPqAyZS/mY4rVfn/aXPuerrEAfqTfaXHESj
         3ZR2k+uabW601ux/smhwqERJ+gpQaqsqu7D7pVra/MLrLISbjP1ARYEDEOay9g7+PGwU
         iB1+/QSqJ60NJI//q4ZrcjN2unU3PPUvSAAGCmO7PIEW/I0CChqTCIP8SIAalG/sz5d8
         XgU0LXoqaD6HhnCavDxTW96xZCLecq+X6rTHs4SDAwfWZWWkPvOXUQnAAqzRiHHAfjlF
         X6rRcGlm1ntKuvkYvEYpn7JPrbog5gnlFFBQcbd86Whhw9Fcn42JeT2ZwDVvUj3tO2pb
         AJqg==
X-Gm-Message-State: AOJu0YxUkv2k7E9gxUNqKA+PY7CpraNhjAfkrDZNSwKFd1aBy/PpkOUj
	zyHD2eWvD465zNGAzYND959WVkOTN3gImXsnF5J6hh52fdH/e344J5wr7J1OHOiF83uum128eby
	BhCXFdwbaUSw/7D0MjKMM6UQ79K36YP1Nks/bZGMBaKstGzl0FCnpTPZvmp7GP6VKB6Qo
X-Gm-Gg: AZuq6aKxoHC6FNW41NBz0nt46Oe+4gyTWthviXLBXz1fpWRHyG5FKP54XiWheT9SIcy
	0F1bWQK2+1MSojbx3FyAMqrmwMd9Uym/+8iNqLWIlZw8mqUudIaRTO+uUiDOkjESwGJHQxNUqF+
	ow4Tv3SfopuS/sssThzBPVty1A9AnPT4X6blr9djiU/cTgyzpmUnL/OI4w4G5lvNWsjy7JWZ/pZ
	gS1aBKK23iOiHFIwKYEeH/1ryeedBuV75n4KyGodFuXaDB2EyXjUdlz5k6abxGNG+KZr/4696Ey
	IaRdVE0wVghvyG9sdFt+1ZRffIEgaTqdmiEw6ammq2d0GS/5mcrFntBkIVuTNIE1d9gDNLVjz7h
	YBARDjvUW4Z0mQtyiv+zO3DUMVNSoF2P/yo188NBIdAFTY044fbeFkciBIpBK/baVHWz5zXygAg
	R6M215xPemn9VDjbig8OOKoqM=
X-Received: by 2002:a05:6102:c50:b0:5f5:4e0d:2046 with SMTP id ada2fe7eead31-5f8cdbf6decmr3348401137.15.1769880842018;
        Sat, 31 Jan 2026 09:34:02 -0800 (PST)
X-Received: by 2002:a05:6102:c50:b0:5f5:4e0d:2046 with SMTP id ada2fe7eead31-5f8cdbf6decmr3348378137.15.1769880841606;
        Sat, 31 Jan 2026 09:34:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:34:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:49 +0200
Subject: [PATCH 7/8] arm64: dts: qcom: sort out Iris power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-7-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz/c17+bd6qhjDuDDyzvSrSs0Hej9DaCSZ4+
 EXTo6V/zC+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/wAKCRCLPIo+Aiko
 1R9JCACaB4CLTA3yu35nxhYP/dRbPYEyYygXz0L03fZeu5cKmKY2gQl8Y02bB2Wj3lqZLMwnn8l
 5bgpZpxsazZ1dw4cO4OGMunK8pT/Tm54IuPnSdDnvk91o3tqLRwtMtBULAgQFmLonk33fkEugHF
 DcDbiuKRuZtSF7t5EB5uHjPqXSdNubFHT4QOl9Xc+Ec3ric7nKRxiDGHE+aJNzsXzUe+oZF0BPr
 fZZclIeJX9R9hWhhDQf5oYQL6+mk1fnDcwBOnpX7tTFOAgLeuiBoUzULgzeK5bwdJqpBSchWLLm
 zFRIzOPzBIdYdzC2PeP4RwBIsB6wdhr8IRQrpM1FnqOLhZFh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697e3d0a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: APkZUcfVtLt8UtsLmlxqLYmT4h9Ep7Wb
X-Proofpoint-ORIG-GUID: APkZUcfVtLt8UtsLmlxqLYmT4h9Ep7Wb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX/l2BDhqXP7OL
 otYJjKykZmjR2PyAEI/hpTsEkzeetqm9vObyvS5bvTIxoLy1OaUhT0RrtBY04WaiUvGRS+Ct/7z
 WMwJMvgQujqiv5PlQ8KGudMeTcNmreri/wbkJ+gm+gdnfdP+2t91TS2OjXbTl5Qj3omhic54HLz
 x25rmon5Ya9DTC/gbBkhn+X9MKPgTCbCqROdrI3nUsjyRTjDyFpo/nexpQ0IbOpOCHNBRTe0TUb
 aNvSOKcLxUSXjCmutJYyWcreKUEfvqcvA8c8S9CX35V2NQUwBBszimshTUH6ZfpBPYvgBd5NLGF
 io5Jg8xWap/F/skt62ogfackpnPOtYcUIznIo/QJjDbyWn20R++JT5UM5Z5Q1HHQ2w50wTdLFYn
 IJ0Fnhmnk92G49xFbyfbvOLC5ZeV0+dM11xo3KDVvHW5QGUZE4sz7C+YGfxVqVwxwNlM9oSN2Ix
 xO/98OS5aD3E2F9cHdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91384-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE698C3439
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 980d6e894b9d..531470506809 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


