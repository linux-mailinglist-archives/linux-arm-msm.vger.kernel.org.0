Return-Path: <linux-arm-msm+bounces-90233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGMVHQxDcmmtfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:32:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932268E80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80AAB30004E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7B43659E0;
	Thu, 22 Jan 2026 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fEQlgQLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ozxr4fZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38A136A008
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095468; cv=none; b=Lwy6z0L0fXhqFE27lBhXGpMeE21o/TApgcKGPCrrbFtmfHTJXd6F/zLsocH6kh5dzK46dxX654plwT1Ozba54lCMsE0dhPvMzUxkcMZJTwEZ0qeG7h36/IyqN3OT+IqhX5phy2hZGpOiQNlrEIIXFH2SqSBBjQrfHgA1Yk+ZS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095468; c=relaxed/simple;
	bh=3zEQ9m2W3rLO5HYuql/PzsGDa8f85lYMm0p2GO/cc8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixStukU6zFN3gqyyzzTFEdSwg/Su9CE25kqI+yWXny1goRLUlfiDOnvYyH5JPjA2xbWol2iEztRXE7GkwR1zg1p5kICiML7atd6QxOFQGk1JuK3VW1BROdie+2JQaVuutqLQ89sWNqLQS8Ks+oaYMl6a8emRO048lpE6RSfRZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fEQlgQLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ozxr4fZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8kq4N3463197
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipXcPVqW2KR4kHqZ7Q8Ex4yhjIP+Tz9Bt8QAaxGEjiU=; b=fEQlgQLFgQ9S2dmw
	5H+4DDB7l1RfbhUF8pTMTiVFk4CuqsLnu4jsAT3Y91kvpACBX7/9W+0M2TKNg4ue
	K/2A+1IDosnzZnFTGZZxkKA+nfhw1uAUA9bPMHG2aVecz0ZGqvF+1fRqJAq8ZelD
	IrdWLgnQ/BjCWUXRfZlO637m+H0XVhGR2Mxx1pF3WNhJKQPf64u/+VUx4VqxV6LY
	rfKMTNBs/IZxdR4AwwLPJt/V9UC/1hSvXn0N2kMOQyZR6Gdnssxg1APe61r6kKcC
	77p8h8vWCzj4r3rYqBrAkuDO1/ZQhP/328HJZ79cSUby3W93tJsjwULPds0UQLRQ
	qC7sMA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0654bnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:24:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so979511b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769095465; x=1769700265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipXcPVqW2KR4kHqZ7Q8Ex4yhjIP+Tz9Bt8QAaxGEjiU=;
        b=Ozxr4fZMEe/kX4kGUuu4b2Hn//Cb07g6qGn5voTu421mq8a+JQ/t33bqYImUZJqXqt
         QikZgKe8LLY1A3c2Oef1blKdyD8t8Emy9ZwIa175Z7YL7dI2Cby10T9CDgLV8/4kgAtr
         lvLygXwxkAomd46TcuzHD+TxvXxyPPOBw4RI6NyHe9KMMMhk/NfVrzEsHDCqQ8/+yF9X
         PRU/5JjnmX+XP62c8fJvyr5zd3pVtF5c2BzX17+IqekfiWKK76ritLqqpK1r+yRTTbFR
         KZto7tPyfy2hIKTH62AlXHF8o4gva+ifYmG9U5Ws962CxBczK/Lw8JjQohGiHVidR113
         1yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095465; x=1769700265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipXcPVqW2KR4kHqZ7Q8Ex4yhjIP+Tz9Bt8QAaxGEjiU=;
        b=KpVV5AIZBtZsPekCshu2kQ9gVZTC/UWHdI+2BzqMmLpmc8KQxMhfXp3/1VBRjCVgHF
         fpR2nH98OV/dpLyP00HD7n7rBZNe2x4jKjTdNwBZxg/Il+uG6ZdhN1J3nTSd3iZiBsdU
         fHkOfxP8t+FpWSzFfhslbu7gGpc2DnlvnOjEVWEWlHp8A9VhBjkIHuTsetyE6lOWrIYE
         Nq7W94o8i2w9GSFQy6K208hGsqMgzH7v+shqKG2Kq1zp6w/nbWc2o5BRDZ2jmIRHdTjf
         NJR4NlkWtmHOnoZr4+TyI1wJsiXI7YQbWlW3SuGL33P+FuDilmOJoTIhd0ccF4uejvlz
         diSw==
X-Gm-Message-State: AOJu0YxyMtNTg2t/5KMQ7b2E5hy06IaLUOnpwPSErY0Ouqir/7gfl3CX
	DIelpWc4HbnN1PaLSWvMohFCo5V690qk4m8q9VkmNBLk7tkLvZbKWbqeQ49hZkkG8pWh/In9W5h
	iLwHbT20AB/C/0ObSld1C3FaJeI86f26BY/OYAG+xmnvHmTxBBJ3odDPFF6DPMD8xRqsMtNKtjP
	ac
X-Gm-Gg: AZuq6aIQXI/U0Z3rS/Q5wjOWjev1CqsfGwsmncQ+tl48MD7Mk4v9c3yQWbASGCfgDEU
	wsEbRCEAGIPMX1FD6B8jdoBKsxVwPACQARZISw3jaFHpSO7Zhoa4zmGEgjaqiqJccgunzd26P1w
	cqUFlDPNXrTOSWq2doFMgrYOb6rwkeOTYCDSTgYxlxjAbnBKWzta1im1HWaz4bwYonpanIpbSWG
	uvNgHRguY2+dzvdPfCrxw14Ljv7Gzay9nNIY3Z90OqLep4sTiOKdxzB5xO69wqd8LxiY0vPyEMF
	fPN+VFYBUs/8S08k6MbqwYMZh80kYkxKSUbD+GCKxBtKv8axlUsxmG9t+q2Tl/dKqpXzTpyRgn2
	8HGFwmf8eAATsPP1cE8iogIVVVlJB5kE5/3o2i3Fbfxcfn9pcyOnzv9lEuzAV7xNUTxhjWJIxm4
	qVaigo0t50vrQpqokgpQtiyWAmJm9lyQ==
X-Received: by 2002:a05:6a00:1797:b0:81f:9b0a:812a with SMTP id d2e1a72fcca58-81fa1780e68mr19308219b3a.14.1769095464440;
        Thu, 22 Jan 2026 07:24:24 -0800 (PST)
X-Received: by 2002:a05:6a00:1797:b0:81f:9b0a:812a with SMTP id d2e1a72fcca58-81fa1780e68mr19308174b3a.14.1769095463712;
        Thu, 22 Jan 2026 07:24:23 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82180636c38sm3743474b3a.24.2026.01.22.07.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:24:23 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 20:53:59 +0530
Subject: [PATCH v6 2/4] arm64: defconfig: Enable Glymur configs for boot to
 shell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-upstream_v3_glymur_introduction-v6-2-245f408ed82a@oss.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769095452; l=1615;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=3zEQ9m2W3rLO5HYuql/PzsGDa8f85lYMm0p2GO/cc8E=;
 b=FFH1lLqjTw12LWV+jBHe4j8nZDGOXL33sRtV/q9aPBDJkwALz73XA57SXP0hCvWvvrk2mCTpr
 nYUhYa1eUDfA8teCnqOnD2+JxLTRT3RhPtKPxP8mNviQedOCvvrHhIu
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=69724129 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G4s3PgB1coGp2Q1p4bUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: lJMB3i8KKv5_ozNArwcAs1qNFRlzqtRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNyBTYWx0ZWRfX2NDokw2a2zgd
 f4d1ZqBoU2RCDzQOY9R6iGZoNb7l9eRGoAGXaUnELJiPF7/slXo8fm4wtsHKezICiuIr0tq5Oye
 /rjRgbJnUtTW0/WsNvggSFYX8ME+Tk4I7iwAwwBzcPu6/RemIedRwrG8JyiURv7nSB4MyLkrL9J
 jjzUF9LwTYfbLSzKHyNQWWuLrvdM2umQMzPrfBcC0Bqnt7XWDc1wo+YYIwcfRKq7R8LzCKFHBbQ
 vbz7IwXfgd8L3SAuvhjwpht8kXodYYqcYb4//PqExouXBSdV2YG3EzcI3lQyOsFKBqTqNXz1U4e
 LLW3bFnB1PXBTUVvIblec65vOgYvdsGeaO+PffB9dKMfD9tKU+4jUq9cja+dIpOb2t/qK3RSB1h
 pnUFgPZDbnvINHaH5URtCQfq0lx5oeltCAVDk5eSEZKqMU1+VfACU1lAihjY4rN74slUSGVNaft
 ajtejusqHEg4ZTYS0FA==
X-Proofpoint-GUID: lJMB3i8KKv5_ozNArwcAs1qNFRlzqtRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90233-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1932268E80
X-Rspamd-Action: no action

The serial engine must be properly setup before kernel reaches
"init", so UART driver and its dependencies needs to be built in.
Enable its dependency clocks,interconnect and pinctrl as built-in
to boot Qualcomm's dev platform - Glymur CRD board to UART console with
rootfs on nvme storage.
DISPCC enabled as module, used for display.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c43dcadabec4..807881932132 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -645,6 +645,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
@@ -1452,6 +1453,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_GLYMUR_DISPCC=m
+CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_TCSRCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
@@ -1844,6 +1848,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y

-- 
2.34.1


