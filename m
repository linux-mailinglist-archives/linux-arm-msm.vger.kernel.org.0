Return-Path: <linux-arm-msm+bounces-95467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHwzDRvFqGlaxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:49:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 896BE209230
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D591300B9E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 23:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C034836D9FB;
	Wed,  4 Mar 2026 23:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmZ5wYzw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJBCMKNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410E264A65
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 23:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668042; cv=none; b=jxVfIGnVqxrX2Iox6HUEQiN5d663TjIaRDmu3dAhHAXMtt4yVSniixCtmEk0UFJHoJB1CRuSrgf2JDq+84kmmTK4VkVUbxOvxZqHgu5LzTUjCBI/COBaOn2fkKwT/ovMEQUZbcV7gebhNd4AWIUFhNYVnaoOINVXuBzU10GjdQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668042; c=relaxed/simple;
	bh=EddD0jK9xDGmaxIRtN9XorQUDW4OMYW5Z1114ll89LM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ck/YlbLNNcqAb3rNvC7qsmkhzY3vg56RyEMUURs3WsNNc0eChdDy282F3Dcawal6ocY2h/8RDkooEAc9Ltxa6LKxrbuSS0C4l6i5p+odQjf51dDOqKRjPACRxG5gbuWT+MFE+w7KOkMy8jlqDyk8cLfdO9PpCFHKnyYftFi8Oz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmZ5wYzw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJBCMKNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624ILafr1213714
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 23:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dRQ8uRt4/P5Xnnec5FFe6n
	/FfmAB6R9vICbGidBFlm4=; b=NmZ5wYzwIxyOrtsZ8up/X6ZzXE6q0Brt136GTa
	1y0Fqr2l+ua/4vUaey6GoRyQrEq07cAO6SaHFVorUs4rRIEHU4UtvOEbRNzzht1c
	WjgOZNNArEDS3Ye9CB3EWTYnF3ocgwyn1HebqJ+zYvYgrClaLbYzX3r1NB40/aN6
	9mJjBs+69oII0uiB5NZ9q55vKj2TLwXBHuXJmQQ4j10o8q0V3fBnjFtYbayf+EEf
	TQ7rf2KE3gI+OHi6ToOXtaPVF8LKjJv+IxI/7P4HriyjsbbK7/3uq2vqrNo94Ytj
	6YC047SoyUMkPv1+krLW4n4R6dTdd3O5aWjcWLbIpGLrkMJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5td66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 23:47:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cbb8040f48so5041133285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668038; x=1773272838; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRQ8uRt4/P5Xnnec5FFe6n/FfmAB6R9vICbGidBFlm4=;
        b=DJBCMKNfMPySMGnqZZg/6+sEjUCpimyQoeaxoGaTHoMpzjYxmKUdpXYPVW47gOaJqD
         7ltejH6un6JlYQPceHDS0k2Uujyhvob98xWJIr4ROsQI53OSxARbrGyT5uZFxDWoiX1M
         HOhnKSggQUyYeXAT+7VYzNKZ/uNs+tgU4ykYTKw236TDxvle8pa7SeO13d0E/ETvC5eT
         hUv5pGezp7IjL8YtFlUQJEmiI89FfyPdnmJg27i3wxVpxGuD8Z6tkHc0n99lmMtSaHcF
         zpAu3byC9q0t7fZr0NxwADX0BWGlENwCPA6iOvoOxmXEz8yb9r5ROe2ZDrDWPFvejIzQ
         Il4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668038; x=1773272838;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRQ8uRt4/P5Xnnec5FFe6n/FfmAB6R9vICbGidBFlm4=;
        b=OChnMSnNG0kdq9Ao+gerZUl2+RzwL3dzSDnn2wuqXotDqAUGQVMRagnLSKIBD8w5Gl
         KX3uXBN+rzMdSAEZI4WXwSVA+E4QuFn19sBohY/tc2XgvUyYDnBCGJqtKHTb07A8u3AG
         gImOkCfiI5WNEFVCArNSg/t+uCMLX/yyUqSiCjLnrBgVheiHEpQi6JYv9HMetpj9pD0y
         83EoTlByJOjs5CWCNE9jcYMItUqUioAEYDAa5QO73HiKHsbX/rebCMVuOVXOFQ2ptGW6
         VV9wj4lpUODI6VWPyJwgbYIaAL9pP8vqRTBO/DlS/STIFElcXHLhcO1O0Xwg3XesFG9T
         r3FA==
X-Gm-Message-State: AOJu0YwXQ4u4SwfvQSJTxXjce0SpX1dhXy73ehPi0xVd5VRTzKxPPqw9
	7stYiIctFSD4wZKV63xeyj8w3J4bKkZo4/pUTcOH9OF0Fy5yWSb1dpnVrNvktzDgR0LMvBzTFsr
	4BP7F6xWBZd0wjAwyLIgLFPR5zZOVyjx5XJsYVHkIIqCDbjUEfWNllId681jMZG5fOft0
X-Gm-Gg: ATEYQzzzX3jjKDMbaV2BJXSxMJC6HtI2yXYG9h7ZQj4aR9aEz2FGLcqeVEUWVgMHP0r
	ILGuA6NzuzOTKrmgdtauEuqtxhgSu47Fmvm96XCPoy87t/k8zmqDh1YqdZiO1THsEPrcMSqcbGC
	Z3R/g8u6fGA2FG1gRn7g0GwEBcasXReMN11EI67oc09RhJ5uHFO3OlCumpBmVEnrlAuzZ3XjBaR
	x/YwxjLUS2QqEQdIRHMhxw9HhoqC73amYUOfxuzJtj5OoEgNsfhTjXk4qYij5cZNC2Z/7W2z967
	bADM4u2X5qr4FFhSN6Jxh6SdJWpTCaHGroPMzoKw1PojRXz6ziwzK9MTIJ3H6iRLLXE00TZaTAo
	5RN/DXeFx5wBrYAcJFTGBV39gpKTzs+fpg38g3TzJNm6KQUe955Nio/tCOPwJTmmvAzBO3pxIHq
	plRS138w5EpSIDPGt9P3IegGAtj0RBVhzkehw=
X-Received: by 2002:a05:620a:470c:b0:8c9:f9c2:118e with SMTP id af79cd13be357-8cd5af1bd5fmr444192585a.32.1772668038450;
        Wed, 04 Mar 2026 15:47:18 -0800 (PST)
X-Received: by 2002:a05:620a:470c:b0:8c9:f9c2:118e with SMTP id af79cd13be357-8cd5af1bd5fmr444189185a.32.1772668037874;
        Wed, 04 Mar 2026 15:47:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12d8162ccsm574403e87.77.2026.03.04.15.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:47:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 01:47:12 +0200
Subject: [PATCH] dt-bindings: display/msm: move DSI PHY bindings to phy/
 subdir
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH/EqGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3dziXN2U4kzdgoxKXUuzJAMz4+TkVPMkUyWgjoKi1LTMCrBp0bG
 1tQCPGzCUXQAAAA==
X-Change-ID: 20260305-msm-dsi-phy-96b063cce7b5
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
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EddD0jK9xDGmaxIRtN9XorQUDW4OMYW5Z1114ll89LM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqMSBChCi8G8GUO04pbQErRlAh/8sb6jvD6jiI
 LEO6ahwb12JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaajEgQAKCRCLPIo+Aiko
 1fUAB/9ffjvy59SgM3ObKkc1S99icLVUP31lNo757yTgpK6Z0w4BfohkBt1Dht0nWd6M2pr3a6a
 k34ZnoYhn9o+nKDORGFM4IqhzBn7yw6kGXbKTnj/ook+/69HT8QIqaTqku72NC/8kHR7p2bHsDp
 gqL4GH+230D7nh4bqjhKd2u1lN/9p8qFmi40jTMjj+JDFvIv4TMkqfW6XfJWRSz5c/qhmDC8BK/
 NxBYdCFp7QkP0Nd4wnHw/Nz5UhrnUMApGAOV6gaM3cXH6RWIARkWZ/epmRmVqbBMX+vS/TyiVRe
 AfSAYvZBXNcilPlHJzzSTEawqTFPMBDqVQf/h7Uo9M0s/csq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SxTkl1EoSeJqIEbH78z7JUX_0yRx_r1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NSBTYWx0ZWRfX2Q3GwyUvEtqV
 ZiWTER8erfUIZnlP++w5kO2jgyvSzoWIIiowL8Gct2Eub0kSfhaDO2pyQNWHIQPgswg4gNdXB37
 4HMiV7jn2/qCQtgCEl5hxuU9izhi6SmacsazaHknnKH89lvuABJJiP1tkk/O8n+Ko5NagtbiQtO
 ClnaL13OAtSKqVKOdc8eaBPgKyKg6Q7WMw/NDlcMpNJmEZy+kj3b09jp3iayqEkSAdYOPC6JU4z
 TYEB06aeH5UEOi6LnY/qfzoFSfoZRqfHD4LaQQZ9wWrTAAbVv74a6oIta80iqEThKwaKrGvzRTJ
 LEE+j1vaBoS0Ep1RZX/sOrQL5jwyjs1h2F5n3pk2RDiF6HNU2yy7EMjgzd5uxCTtyZPzn2MPahW
 +lYziZcid1z78rtIxzy5Q8x5Hfja/egjmXdDiC2Bx3h/FeVVn+s/v3I9sO67QGyYNWmrWfI8ZDN
 iIx4zTHDD+CQZKhXrfA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8c487 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RAbU-raeAAAA:8 a=wepcCMuCHaKBKvurWtMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: SxTkl1EoSeJqIEbH78z7JUX_0yRx_r1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_08,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040195
X-Rspamd-Queue-Id: 896BE209230
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95467-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,marek.ca:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org,quicinc.com,marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Historically DSI PHY bindings landed to the display/msm subdir, however
they describe PHYs and as such they should be in the phy/ subdir.
Follow the example of other Qualcomm display-related PHYs (HDMI, eDP)
and move bindings for the Qualcomm DSI PHYs to the correct subdir.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Merge strategy: I'd ask to merge bindings through the msm tree, reducing
the conflicts for the current kernel development cycle. Starting from
the cycle after this patch is merged, DSI PHY bindings should go through
the PHY tree.
---
 .../{display/msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml}       | 4 ++--
 .../{display/msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml} | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
index fc9abf090f0d..d98217747ad1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-10nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 10nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
index 206a9a4b3845..be31b9bac9d5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-14nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 14nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
index 93570052992a..1d135419d015 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-20nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 20nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
index 371befa9f9d2..f8fe75fa29d7 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-28nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 28nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
index 9a9a6c4abf43..d45015e24639 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-7nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 7nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
similarity index 91%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
index d0ce85a08b6d..849321e56b2f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-common.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI PHY Common Properties

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260305-msm-dsi-phy-96b063cce7b5

Best regards,
-- 
With best wishes
Dmitry


