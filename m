Return-Path: <linux-arm-msm+bounces-106645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDbXIFS+/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:43:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D284F5343
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2591E308B0F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F3B3D34A8;
	Fri,  8 May 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuS4G/KN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGblgnqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44CA3D411A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236880; cv=none; b=Bl5bauTS6VRL7TB8JTEO4cFZcCN8se4XqC5ceVEvCdg2O5L1D0iHo7g04rNEpAOwAV3wKJTNTIrNMSbF/XZGAoFTcaY/WkqGohfZ704jFDPYbsVHQPdgfJGcPhDA6bHxv93e9SxtyPwgq0px6UlSLV5wyMFV+K56i5D9s/TPnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236880; c=relaxed/simple;
	bh=FdSJT6D2xuJXBvgDlnbYS33t9DDGMH2c6pzndhSzc9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0Eqpsh2E8kXy714TBbZEIgWm4618AEUFlZl/+gaa4/CUtchmu0JyqiCRrsTvTkhko0NyxCgEfE4Zmk7cWSs6LOSmjv7gHNhfCGae14yMRAr+1EW83bOw3i0tJuG9dtE0CKq/Ege6Gi4r/0hq9PT6fuwaPrwNuMznx6tK/Q1ayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuS4G/KN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGblgnqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485aElD2199588
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=; b=PuS4G/KNYMBBCBci
	q2DnS35ikkPFflQqcO8Kq3ulREbYTryHHTsXcqsUGUzjxMwoO4SeFbiaHLIqhyB2
	C3o/QyWNYPlTuf1cXanaAAue/OQlLyk9nzuma6qHaA080GNA+Bms0oZRzvKeMeOV
	7bC7Z4SnLxXuoLcTx5Azm7MOq8RBAUeymzr4KlyrMlJ2GkNNFSBh/vM7FVZ7zcZI
	Ln4nCQPL4wRgzh1ndREsmShLhio2szKc3m3KQ6VcqBfavbKr0WPOw++AmUy81jrH
	lTzb0tuEW0lHAcXjc83JjIua4LiNOpbEdsY0dNThBWYgv0dyP6cxjQCBXAIAUk3n
	EqYC2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjwgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:41:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2eba42b8dso21515015ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236875; x=1778841675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=TGblgnqRxVdzR2ybGaU792yyvYBAhbkSp6NUqc2GzsE8e1+CWRQQ/XlPn9ugVIPF2R
         LV9uGd9T022lFW5o2/r+G305LHS/U1jzjttmPpwbRtcSF4U9Ds6Q4V4QsUyp0Xw86qj3
         kqLts5B1nYZv6ZLrlcn0TpV+sePXJl+fbNMxOVfMB3b9cpV4beaKpyCfx1llauN54Ett
         i1TlueTj2CHOGnkDrOx0z4/f4Vdk2g3n4b56gBdpg8v9zl+DNNwSnH7A1PCO7V/ow8ZE
         GWwo89VM9KjX5a258NrbRt9QZwzGYr8rIjeS/FRgSC7Wvn02Od5F7/0Ux2Lyg0lQdw1z
         Ulug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236875; x=1778841675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=X0BHJQtCfP791wGZWhbvSQjEk1j/WrsoGptpDlUNrT8S9+ts2ITRf7+zDnNKa/yZv6
         z1HzbfpGwMnGxEoiHSV/NDZktOaU1VtkIEvNoTBxIsrRCvE0fbdJSl0MKdJFc3XpfZxA
         VPEeQ8t005TXt8dqwTU3Bqv3na26TAOwg6C++u453k36hhVT6ZWJVbs9WV8m+1joIt0E
         i2PQOIber2KoSO5+RsKw5YTxnT+o9XM0dMcOjQ2Gx4FmDX4AxigTX9iEfyFXYwJzldMg
         fy/lrEzLIcEHRhKa3ICd6ZPlt8TAnTQ6QeUrPi8zK8Z/Ebvvzw+2tCzeW07O+JJQCL/W
         UUXQ==
X-Gm-Message-State: AOJu0YzNwM/7xyrQ7GsWH5G5tQuvts/8KUW074dx+bgptqc0q2PU++1E
	YqTWhwXv6vIgVXxeZzCYlxESJvbkfdQrUikcoeO7oHR44TDERlDZHOEjKE3e3heAOs1u+OGUSbp
	pFi/ADEl+tvdzPtfP3X0bBVzhxLmEE7P7FKPRbSDhTi77HMZCKanPLdKpPaJoIoFoAqG3
X-Gm-Gg: Acq92OFGjP53RdXe+xj9QQNETVTv+BUK/odu8qmwc0uRsGO35WMWe7ASuCIrd9kZDKR
	jR5yAhjUuSrm/ggPz+R9ngsXO/qVZtzu8WtliD0VBfivX3xPMziC1qfNmogWR7qGOLO9w7z1DqJ
	n+BaGzc7gLk+BT643Wa50C+3ZzfzQqMpL21etLKJKehYYKtGQeH7BPVd8E8BXiAqEohCPV+A+9N
	EC0hvZEDrdjLTDWyVpUe43LqFUYJFHXrN8dDvXauCReKG+sjoAivxcO0lHRV8jw+6p8Tc7TcIEZ
	Y4AsZfpMsik6p72HKvyKvLK0CDsflaYfJDvRXoRzVaiOwgSKo9ChVnXKFzRHzzKlBeaXCXFeY/M
	BklsJeTm2fGiruHNnCLegvTSNHItA0v1xznyZx19FZWiGMr6hy8o=
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr25002035ad.4.1778236874782;
        Fri, 08 May 2026 03:41:14 -0700 (PDT)
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr25001695ad.4.1778236874295;
        Fri, 08 May 2026 03:41:14 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:41:13 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 16:10:48 +0530
Subject: [PATCH v3 3/3] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=1036;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=c8/SeVqVj0VIwMhz140zaO2lQ7IVuDyupHPGVMe/Wdk=;
 b=5n1W1ZjoJldxii4uYKxfCywv1Ykd/6xTuZLCPfUBElSma5qAC+Qaa0cYoh8pZhXl77swfoqKQ
 WN2goHph21eCaEyIyOPugcDESJ30YXUkeI1TL4DBqK2vljOX18wk5Kj
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX4+NR6tErUfR1
 t97Vjkhz1N71L2b+iVRHGBOWJyt9ij6CoPFJyaJTlfvgKCSxOuTyB08Py29AdFJK6iee03XO4ES
 Gh9aYFl5hVmiJ5omm0KbFnZ9LCxhY+hUeyU9+LL2JV2PPYWJyahaOsunlJkCezWRyH5Pgf/YBuV
 Yb3VCBwVTP6P6VyX68OiNqYZR0Xqxaa9LACoxjns0Wany3XA5zodal0g8B2rK+SsDqVwxyvJt+5
 /7CtKAfj8Sr/nJCqb7N9itVN2Q3Tj8diKx/FAIJv/fg6t2yedSOikJwqIcYA66hfMEVx8mHzPg0
 PKLzJIblhpPzzIJMCDyzBYJbtqTE7vuRHk7cDP5yVaj1rsxp0T01T4GWFld8ghfFuAnrjqWM3g0
 DrwsZJ6vZ774pfsI9gHj6j7/VlsZtKA63dvpE4KSG1xFaLW8eC9HXrYOhyxAcTMTjiy9+cqho/4
 IQFNo6j/d/1lBfCj2Kw==
X-Proofpoint-ORIG-GUID: ueZx7JO-yrd_COSm9TeyHJpgKFIJ5Wry
X-Proofpoint-GUID: ueZx7JO-yrd_COSm9TeyHJpgKFIJ5Wry
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdbdcc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QZub9Z3z2oi6Mc85LyMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110
X-Rspamd-Queue-Id: 24D284F5343
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106645-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5ab2cfb2bf879392 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -49,6 +49,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
           - const: qcom,sdm845-apss-shared

-- 
2.34.1


