Return-Path: <linux-arm-msm+bounces-98248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AFsKDuSuWk5KQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:41:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3112AFF91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64077323B589
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB1337B3ED;
	Tue, 17 Mar 2026 17:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSMFtdtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqR5DK13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FDB379EE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767727; cv=none; b=p6kaYLg1LucWlyQRzbO3qt5cxT7q0dMo832q9jLsq8Gtt0v19hv4KZvRZvIC0v/7I7gbOJ7wUuqmlpIZl52MJpgOsCfiFXXRfYRDa6gcNK9TU0VF7vx2QLxKY8DNEFyjm1D3N/8OtA/YGCDG9Md9PCwolPD97lU9Au0yJr6LJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767727; c=relaxed/simple;
	bh=JOZbAhPAb/jrYJluqtSnYP/eR0BQRIp7uBKX1lR1RxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwr4mZ9BkNpa8dzD8JSMTNPJez7w17vnzsNfuAofz0zdrjUW/NVJmS/UXmr7xPbjQz1ASnWeEiGzRTRIRaDnhBX9FuHWvM5EjEn5Q3AWtSRlxUoVgaFL8iUFuJDJTEvud9YNTgBVZ935wHXLh1u5l510+Mn8IF1MUXb6RkbjmUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSMFtdtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqR5DK13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HFOQOM536998
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=; b=TSMFtdtBFWgzeSKS
	1cKS8GEVIQyDG1o5fFU5aWplzQq/1dbs9Q1jHGILgAcVLV9qrGnzXB8zX/aBrXQF
	sP4Gycyznoy/tGiF4Y1PbE/FuOm7dhd7RMuL2kIaj/AvQMFbnU5J4skS+rJ4oNYj
	z38u6Es5pGOp+X6gdjCFejGhP53adF8pIZygfu9g2S5E6TQVwb9Bb77ThqJC0KnW
	azDUDJtoD57gGKryigqdw8TiTv5Wb/F/WFQbXd/ZIHnPs/5j4M53tQXcXN4+pBki
	JONdSTw/7Ae6S7WM6JT5mdjgH1tUs3UsTL/J7oZBvk9l356bEj8Y+Ykx8muNvRWy
	3oVHqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy9jr0et9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:15:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so43293101a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767724; x=1774372524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=;
        b=bqR5DK13chHo2Ki+uh7r3KRJwqbK+aTiEaZQTFkiq//5OUEer20b+4AhkNHNr8o2EG
         //IbGXC0TKnzCLoyfixibznBLC551AzutzGD1b7ANwYNdILggZEMXcpqIh0qHWJco9i1
         rJEjgPJbHBPVpWz8PazQVo7PH6J7gU0LV8z7iKoqSOAcY/HECIimMz9UeMiISJf+E1Mj
         vuqzVSjnb8+JmNe6bcz+sOK9U/GZ+TjnbwAvOngVxi8/YtLw8TT0epJH6ounw6UFL8Yp
         lZbOSDI6NeHJ0/WbdWU6A9bw8neI+3v7PLLKPMm9cyawhQp40295AxUGsl54Mwz3gFFf
         jZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767724; x=1774372524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=;
        b=rt8VAtAEPrc+mPmKbP+EVDU4KpS2vW/FUE6pCL1lX2DBZCcJwrEVuLZoN34pLv24QB
         lEEptMcTAxBNOO2WgQRhJeXanqltjTUYH0KwbYu6B/UYGXhmQi/NBQ9D3qxo8kpPN2W5
         6K9k3yx/QCoru7SHQj5MeLN4dk6bn+w2PFssLbKYyorJIPreIMCacwUrdaNKSaDHBEuj
         P+XN7A1VW3DMkx9z6x+m7WjWRg423kgEA1Yf2skJ5hhpnfZ7TrX3P/wnX+9nwzy3O1QS
         WD9bR2mJoWC21kUK1NPMTOw20En0t96ruSdggga8HJcGL+q6Ig0i10MgH8TR+s/ygJCB
         us6A==
X-Forwarded-Encrypted: i=1; AJvYcCU7I9jhUM3Wn0cQBAiIPaw6VUMlhw1FG5eAvhsRsP6oG+wLcNAKys8z9Qq16vOytgltT00FaKT0VVkDsW0S@vger.kernel.org
X-Gm-Message-State: AOJu0YxR/rucrWxIsG0XVAG8rlqP15KC87lpQ+ZXyPmN1q7WHEi1783I
	g9Z96jx7WlSkj/c7aTRI7TdLlCi0AtPLe2Edu6aUSkPXX8Lc9Vy+aT75LZ7/jsUIgSjcTEMEKwE
	POs+jVXL4MbA2X7zWt/5li50TrbncjAzIZGm5Fmour4bmOASSvCXt3lpFbZ/05zNPvXS7
X-Gm-Gg: ATEYQzzA3dwDFXnhedXJUWwYKQ5dWT3BHqA/8LT8vLmbf/t+TaASRZOnOt4dEEG3XxT
	cYkFt/ePoWRD3qOsLgwdAEkIBeueHp9m8QlDiVN4FdVgfS9JuW1BG8FlRG3PpdCFWSDiSpz75sp
	xgOjSZghNwkyFvSSnHntlxTl6UJluox4g1oh8qyOv2i/ktKmsdzJm1XgAOfsIR7PRd56cCrFDuH
	BhvKj9SKBaiI/mbj/4V+9ETiSGJ9vt3CpA4Mzj2Cvmxk6tivF9uxqZpcCmZF2WTLh7Kt9mFt6b7
	MJndNJc6tWQ/7f6ZjB1B4ASPvtmUqK50Gg7LFeW/JWFFia77Kd6m1Gp0dvh0XL4FyiUuvvDytyA
	rFy8bd+1aGcOU4RzPSXc1O2USfZO51r+yYefMGhRVlhP85A==
X-Received: by 2002:a17:90a:ec88:b0:35b:9894:f6e2 with SMTP id 98e67ed59e1d1-35bb9f65b32mr160855a91.33.1773767723906;
        Tue, 17 Mar 2026 10:15:23 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:35b:9894:f6e2 with SMTP id 98e67ed59e1d1-35bb9f65b32mr160810a91.33.1773767723206;
        Tue, 17 Mar 2026 10:15:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:15:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:28 +0530
Subject: [PATCH 7/7] arm64: defconfig: Enable clock controllers on Qualcomm
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-7-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: XrGLvUzpr9l3jZK9wKW4PRx02_ukmdr2
X-Proofpoint-ORIG-GUID: XrGLvUzpr9l3jZK9wKW4PRx02_ukmdr2
X-Authority-Analysis: v=2.4 cv=NdjrFmD4 c=1 sm=1 tr=0 ts=69b98c2d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sHU3hrrlAqMI5U2SAHQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX+G/8xqT/s6pZ
 Ga9WdawD0pvkafcVknOdz1U7sdEJKkQG3O0AlssGFB2vRZUL/KUUzQxQsfOX4PAH3yPppeiiQQp
 AIpfA5IGcCDDN+rVsgVguZhgNuPOX2RtNhf2tdxHu5PlkEbh5uJRGs9fCVEDLJWFyr+MD/yqZVg
 yrWbacBH6PiOZBtlyJKpnORNqHj8F4daCAC2WnPcPNKL6SvUnY4ETtMgkjUFO+fk3IIileylErB
 0owVQ6biX1IcLWOzAqZRRQE0U7AgZcsRm/wu8f3v1U2may8forKR5iNjm/EkeDMy8NeS/NSX5w+
 Nq2cu40EnbvM9/7BeC6/yTX2LObpE0VAR++xI1UR7nBVyRUgjvg8RMMR+o/wEr6A1JlOmsd3yum
 cTN0kLTOeD38Yc4rBtcjN1QTx9Jm1Uw+lPavmSPVlP+E9isA+V4ZiSO9N752r+H/+xCKgHL+pUH
 B1Xq4mtz5w5PobzkaJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170152
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
	TAGGED_FROM(0.00)[bounces-98248-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B3112AFF91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9c53e74ad5caa492bace394e4fde7..dd45d275d30a32fd567432b5c324896518aa4ad8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,11 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
+CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
+CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1


