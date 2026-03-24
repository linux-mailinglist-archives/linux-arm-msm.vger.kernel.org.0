Return-Path: <linux-arm-msm+bounces-99457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF5BKjnYwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:18:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7552FF81B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 994393074F3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCAA19DFAB;
	Tue, 24 Mar 2026 00:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdylqIVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CX3vENIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7F1E515
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311066; cv=none; b=LjOMd9Idip87fM4fwDkPpZ56keUKntekGf/CCpZqwoCq64GA/5EsXCcA7NiH7G2HR6TIJV0ye8kNGg2AOanvtjevf3TOZbeNiMpgwhDmZYMfD79pKr70cnATlzt873gydSISrkmvQN4//t8MhEYEdIVD0A4gFCWd1HeA3oUgMac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311066; c=relaxed/simple;
	bh=yWGYHMvMuQOoFgMW09hmb437wfgDJSFA0so4gDay7xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rr6n6ytraj/F3m6pxjFKrX+Gbr0CjRmOPiJPb2TF0gjpLtgfsOKo29wVl48XigoU5hfFcrPdVZ1+E28KAV/GwiNTXlvn0lliSh7HKXxJoUXdmWG1yrSkxdiPwtr57SDIKHNSXUXCj0iptCt58/bcAeGN0oOmZEN1s7SSnHPNIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdylqIVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CX3vENIC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHquJa2972415
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WgxylbfbI/Yb32tDq9tOK0ZiL/pL/XntVxHahWXIwAc=; b=ZdylqIVrRNxYRz26
	hafDO07Uaae4shkVr+AdA6eryoDi3hN4bwaA65TW8IajnWC/4hhkGCBgZoDxryEa
	e+YhMyjBkDlX9zaEn54nbMCoEBhiWcDO+ya8lxkCH7hmfhGafpaex8SN+eOk3CgZ
	Z7rKy7ZqRuQu6JXZyfBisNaX2CAOr5b6yR1rXhreCKzOS2xmf4iRrBC14XEFydmL
	Ma6oj8JFmoErFWa3ph3dFR5N4i6j0EODsSFVZpTmELLPqrXz2VFbEvmujFhRhTzB
	aENDtLIrV+Mthuq84lFhFMB2ICCIL7JTS9DG7lsaCXbRU7G7vfo+QETURxxb2vmZ
	g557xA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc37y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509070bda13so358378751cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311064; x=1774915864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgxylbfbI/Yb32tDq9tOK0ZiL/pL/XntVxHahWXIwAc=;
        b=CX3vENICMh2V2iy871ozGy+WIdGR/60QaktIyWAk1Fl96+eKB8eL8+x6k26TVOIHu5
         /pI/GLO8IntGCa7gy2E5JU72gnjpEo1mX4kULAyFhtuE2Mw3DPmpAbLr3IOXUKoYyzku
         /YMUkolhHmQyRvgmx7ZTPahE6QuHRD9VL41SI8LqNvxj8gcKWGy7aFNbcFy8su8iABz5
         q8Ato5WeX+4DiEZG00keXBVK9dlHQ+35judD/HSq6iSfOO/5QK5kbBLOw8j/EqHr7IdF
         sHioxsrg2N202bTpG8JDyUo2jBIFKNERjSD9uzCaBQhwve0eE9oiQfcuPbDlrSoRKChq
         Bguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311064; x=1774915864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgxylbfbI/Yb32tDq9tOK0ZiL/pL/XntVxHahWXIwAc=;
        b=DKnqMmZN+Sb/YYFyqv+5BT5bQHssy4c1aWnoOoAncJdGduizAn/9Wr89qgBMAtI2Hm
         bPtXeJN2AAOdd+LYhl6vDHDXpvJwEVbzVDXQTBK8WtVgRH5kJbZvlmioWa3kpauLYjwv
         ZB6UjT7o1Sy87D2uN6yy3a2qKG6JJJPSNbhYmYDOyy8IMC2cH/39FVoLyHXte2Z7xYes
         kUsv9HQiWZbb3s2RKajSMp6EqxTl5C+CU04wf/TMEZJFBEH3luf8yeRgK+D3HOa1fEpm
         fj4ss4CxnYMuEO7QwbOR/zY63r3AgLSuroFPKspQbaib6osjHTdVgOVtO9yVfdF/BPdr
         4kGQ==
X-Gm-Message-State: AOJu0YxrrlMdSkJOfpwl43BD2j1/cu2MtrlBggxyDST57x/zYhjYQsrT
	cuR6Bmj+eJWTpb9Mlk0ZGfZg5DB12/nuOXhkLvlzA4dQAvt//lp7bkuaRpC0cBw6QJ0LJNX7obl
	fL1RJfE0pkSMqL1YzQcZiWOJ1EaEjTugZLhlT+QlWYmf2IgU+RWzXnre94hCoj/VXCK8U
X-Gm-Gg: ATEYQzwX0xAqNlp9BggmiU02dW83A0DhBYy+CUUdo9Av+uDRjJAtQzKbnj1OZnLbYGl
	bDgQHoV6TmK5mnGeCCjDbCkZjwS2/r/59VylbPUYjrtdHXi6YrCYpRdSXdS5v/RTW9FVOU9zQSV
	gjMrSKQZAUmeMb5AZOExf+mJAfwiZjC1fh8Sf5xO0KdM3sS1A0vf3PCn9okmetDMZLYcoiBNQ8k
	PidBrwAyb8adrm+jCBgEPIjWC8PD5N1XYFXSiFT/hG8axTjNrntLHUje8u/1LJdC4Ou+VUrO12l
	X52nsDUUEnwMXgPsbxebhifOsQoUYvdBZe/JU2zrsX2rqlxA2ihUAn9nNyDJb8pFP9vMnz4FG4j
	X6kreYd0V5xC4WaCoeFCluyoyYjZhoi0vVrj0db8Csd4ZCjNcFgH8NWSroZjFtt5TeSsfgdI79C
	BDwrhIGCu9wP9EW5noFfk82SOS9oBoWzZnMaI=
X-Received: by 2002:ac8:584f:0:b0:50b:328b:cd41 with SMTP id d75a77b69052e-50b6ee5c052mr21001951cf.20.1774311063883;
        Mon, 23 Mar 2026 17:11:03 -0700 (PDT)
X-Received: by 2002:ac8:584f:0:b0:50b:328b:cd41 with SMTP id d75a77b69052e-50b6ee5c052mr21001701cf.20.1774311063413;
        Mon, 23 Mar 2026 17:11:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:39 +0200
Subject: [PATCH v2 3/9] interconnect: qcom: drop unused is_on flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-3-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yWGYHMvMuQOoFgMW09hmb437wfgDJSFA0so4gDay7xI=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGnB1oahCW2r4LK535qVvTz8S3JBzO/RFA5ilVxiMBx0KZkkW
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpwdaGAAoJEIs8ij4CKSjVQd8H/Rht
 xJkIJ1HHj5QdKUIqAhUDI/+EMbEIafva1ilOAhlKYfntQV2xkxPur3yHO12q5F1C+VYANPV0Rz+
 Y7kv5Ji16T+OzgnxSVJgclSSRuo6OlzB4tyRPv2+nNYlCDFvM7lyRy5psPMulvUAQfWhxCA4+r2
 FIa81M+66A1quO3Vy4xDY8Iy9BPlTvZqM67vhV2LYwG1mK7wYB4hAp5FwUl7GXYa5Gn1xlxYYJu
 uVP3aLnwxIs+ZJV7UgiKiaaAaqNJC7qs21+cxN784Q4bmlltO0RaiEpf+4S9kSBCdAEpDQyoWke
 7iSXTdKOdm1jFOldo3cu3hALUSV9SXjL5G+qfJU=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1d698 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=snkofG2PpA7MSmzZjVYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BVjtgkGWpS4eivFT4etUxibjeNsMsKuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfXyJwlEOMzbRSm
 zKT27S2gpqvWaMf1MkRc7MvZHvDh9zTiO+M7pVgLGa+mDZEj38BHjyM6jA1Y2Qv4ipPlwdQUUyF
 cEMqnyo2Jxv1dLIDK2fHqc5gdPBFxycsw9tJgLy1H0ml+vPK0B3DSRmLiUlqdZgVIc8xn4z2o6Q
 +04H/hEXo0J5jmNtuSkvC33njbtE/rYZbKAuJ/cRQR5txyx4Gv2grgw379BGPrF1vXPWUk0Ps6F
 1Tih5wQlcQ39A5KCslRVkeFoJ5s0rpCSU+zPKy7G0phYwipczYOWqCXszzTSi5XEwcb8bTDEZcS
 g1nJ4SGi5kQ01TNNTlUTtHIUE3GshDePFxTzFz/+cA79aC39CKSACjeK4xEbQqsLaK2HnpKKakX
 jw5/F/kdlwrnu1O5dnFu9TMYHzf6GkdAqP1rdMApOTmgbfUOOQSgIyN7nyd1J6YYqbk72y1WtfA
 wx9qgGj5sfeFNqztdkQ==
X-Proofpoint-ORIG-GUID: BVjtgkGWpS4eivFT4etUxibjeNsMsKuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240000
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99457-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C7552FF81B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
clocks") has added the is_on flag to the qcom_icc_provider, but failed
to actually utilize it. Drop the flag.

Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index f4883d43eae4..3366531f66fc 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -51,7 +51,6 @@ struct rpm_clk_resource {
  * @bus_clk: a pointer to a HLOS-owned bus clock
  * @intf_clks: a clk_bulk_data array of interface clocks
  * @keep_alive: whether to always keep a minimum vote on the bus clocks
- * @is_on: whether the bus is powered on
  */
 struct qcom_icc_provider {
 	struct icc_provider provider;
@@ -66,7 +65,6 @@ struct qcom_icc_provider {
 	struct clk *bus_clk;
 	struct clk_bulk_data *intf_clks;
 	bool keep_alive;
-	bool is_on;
 };
 
 /**

-- 
2.47.3


