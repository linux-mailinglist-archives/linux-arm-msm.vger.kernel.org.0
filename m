Return-Path: <linux-arm-msm+bounces-96826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qONrMCngsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:23:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F4A25B650
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3C833073F86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E39B5733E;
	Wed, 11 Mar 2026 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxObMPsh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXoXN0m6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB02BE7A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199399; cv=none; b=WYDoSjHo0VylSedkE92X4kU2qguk2avsGhBd+6ztCREDYOZB535TfJHQNl703UHbMoZtEgixmWvnipenySwocovpebXWgpKxtP4QrJ/gJLggzKDrNOeL2l/kTZq7o6J1Emq2l4UCnqYVlFv+Vrh32iHL8/DHhuKsW5GmEOsYH+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199399; c=relaxed/simple;
	bh=eDXjJAIlX1A0WhKzFv1wwTdqrthIOQKVQ48ARl+jh2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MhCMUzyMt7KPTVm1t+8RhNPWqyKSbFiLGUFf6ROhwcj+8qYFxYLXYImZoxjZa13IVVeTsVQ5f22BcN7tpkjLZOlqTiIfGvuD7zY2wTPqtStlXtRLnWR3R7naLVt/hptqte3ENzB+MhiD3d1PpYHY9/KMana2xOhVYfCSvioLG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxObMPsh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXoXN0m6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIekx93893219
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WVsVtrUcpLfQdNFtghWiPQ
	sZyChDoQhaYXTf+An2VlM=; b=YxObMPshTcIdjnZtc7yMsnkxIFaSpp9gL2VC5M
	P4qshzrjbT0v1b0PihVIbYXFYDBBhcoYV4IrgI9AtwN6AnWxQ1rLUs9jJR+AhTkD
	iI9FPHp9u5aevl+MobGFcLkHOrDYQvDm6pqAOhbXLGHdu7P8guTKeAX+pI5eW1ow
	TKICAndUkueWB6l3XXiPlMhezkehRODbhZhFEgxx/11GisM9rUMwWytWrmipmS/1
	mKJPmr3Br28ou6eDvMLkH9ehsztueHQ1pmrCI8SUp3iTwvtie29OKucVy56w87dh
	4MUhHCxlEUGYDkWMyWzekCmsPGWfDvqHySHiQfQrSF/JDCTw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmytwh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94eba06b250so14777852241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199396; x=1773804196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVsVtrUcpLfQdNFtghWiPQsZyChDoQhaYXTf+An2VlM=;
        b=dXoXN0m6E+JO1Dvw8PRVBCi+fQHLH53ELsKo6fmHKtfZBDvA2LHlAaian1NxGSXPn+
         2MvLMc9fkab8XQ3tv8SRLNsj+yTUktcLuHi33dKNMs6LqGESRr7Q4u5uzJmIW4vYoDR6
         FSUCr3CO3urqO/EYHtp+XtJYIiA5TKnOCWH9Jj7nggqr6tDTzkkUtyMA/eNC90dJM0TE
         KwZVbiTMlN1dhDPw0eIpzZdNKq2eU2md8f87dyjO7q2wCUXCIZgukYceE5yFs3qY12+W
         GOmdVDq4EKqPM9LxpeiWR5gA86bALeyGiMjVdR46hJFFvNDxBcX3fhJRabnez7hYO3LL
         97CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199396; x=1773804196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVsVtrUcpLfQdNFtghWiPQsZyChDoQhaYXTf+An2VlM=;
        b=Uetk3mCRY7ryIgrGl6/U1QT+S4XtyaBRx6PFu/u33uskJ01wxBElxG1UBDIWZTPGBe
         uDmQO5lQ1XpoLsWV3awkWNtpUPF86Jq+IrFAVAKZldNKOaK0qVteKmmiz1rNyE+zRiV4
         r4R2fCo18fvwh9FrWWAcYuDj6uNkxH9eNIjzX+BF8j0Q2NBvSNt1FoYLQ+huJ45UvABC
         Uy2ngW1dZV/hl7vLRXwfMrf71Og1qDHK6yG5kloYdCbcbKIWQjutOz5nHgUUxJPfyS9w
         6k1KKi4ld20DI1hFC/A2LbQ12x1lhrLTd+Lo+agfye0nf8AgGnqj3khf/0XielWLLjxz
         IctA==
X-Gm-Message-State: AOJu0YzOSV06J3yOkXB4eG0LkxBRAhp0AYVX1trz29Aql3oEgrmYCrYH
	L3RGPjO5J0I3Eb98xWzEzwTieOizjDymKBfYl/RchdNpCSBDVQVtaieBINSHS1EtwaiAbb5OP8G
	NRjsRUeIpIOmdIzLpK+HB4rZln7yj7Qo8b1+kR0S7LGFRfjUmmOh5n3ajP9dQkC2P1d8b
X-Gm-Gg: ATEYQzztfoAXb8h0kUEqr165Er18ocLmDVHVPLVzjts13tf4IdkOFMbVTKp9oZeN0it
	HxRL/p0S4YkT9X5D+XRUm/9LAwRoSwn2HC5v2TNCFwlQ0tMSgQUx0Zn3Hf5HZ0EekQtlh67CJq2
	nrmcIPMjMSc235GBes++mgxx0LyROCJDAm/2z+lSrz9R9Vc806p3ZZ2iOUTs76kBA7OkbdHT49U
	6UGz1rRFuMuTbaSzyDR5Jnv4gXd/aTiRtIN2mVec/y84P+HNSHBCwwg0G3xRyuMp0MeyEZ51nd/
	Zjd82FjoNunwx+ZInPEcErikxDr6pYxYz2IVCatVBv6DQiojwub3RoT2Zx/i5SE9HOGAuWQCm8C
	PBQacFnOIWX6dgt/iUkQvnuf80pPImEd71GF/ibEhe1kMEblDktu5tXGrwseuKYesNKfe/J8PLJ
	Z1Khv73sTVuCf/pnzIf3/kzrkQMOiK+vK2lWw=
X-Received: by 2002:a05:6102:549e:b0:5f5:48df:b85a with SMTP id ada2fe7eead31-601df064929mr504268137.40.1773199396294;
        Tue, 10 Mar 2026 20:23:16 -0700 (PDT)
X-Received: by 2002:a05:6102:549e:b0:5f5:48df:b85a with SMTP id ada2fe7eead31-601df064929mr504248137.40.1773199395860;
        Tue, 10 Mar 2026 20:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/25] soc/qcom/ubwc: rework UBWC configuration database
Date: Wed, 11 Mar 2026 05:22:54 +0200
Message-Id: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7gsGkC/22QTW7DIBCFrxKxLimDDXa86j2qLPgZYtTYbgA7i
 SLfvRhvWqmzGOmN9OabNy8SMXiMpDu8SMDFRz+NWfC3AzG9Gi9Ivc2acMYl4wB01ndDA96n8EV
 RGgTbohackez4Duj8o2z7PO864G3OS9M+JFpFpGYaBp+6w4iP9D6omDCQ37yM32gAjPrg445k0
 snaaF2Bwm6p/zNw3tLMp5frc5jDbnOyqawwiokWuoWXK1UyfXEJbRqbi52csbp2oqpdW8tW6Up
 ZAU0LUjZMSrKF6X1MU3iWTy1Q0hRqxeSfpyxAGT0ZZ50D7rjWH1OMx9usrlvuY27kvK7rD6XPS
 Hl6AQAA
X-Change-ID: 20260211-ubwc-rework-e6ce1d8eb520
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4557;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eDXjJAIlX1A0WhKzFv1wwTdqrthIOQKVQ48ARl+jh2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAcX6wW3QOQdL8S6jlgxfWik8WpEzSo3RCC8
 12rHs9UhxOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHAAKCRCLPIo+Aiko
 1fUJB/9VoNsGdV3O4puGELD5vFHXadFBQZg3RRmovOsc4tcTQFPxtOGqVXax7FRDPZS2ZJniGUp
 phlNmMgBdRvqWCbh7CmJjXANU7NyV3Dga0Z+kHpAQgdZp/VtLybB7R0nCkYTLYd6YW4GY1zm4BN
 4aE7MMDyXtGDLc4AsCXuCGkQdzVwmOxdDaUJPQPWEaKvZWZPen9QF4ZkrlZKNe8IGhkrswqmAbn
 wrIkUv2R1luA8CAW3lDcHr95xhisbnFLkcJBdsD244s7N+ogSsl75RuHU4BQxwChaNXfgMYZAcD
 9lvv/wCFPGVbqe5mA4osy1yRokyNNa4dZsZCYK+HK6dand0H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0e025 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CrYQme8I2PAYreAbDuEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: FGrRC2IKo7UzZUvwaCQU20YoKoBjV9kl
X-Proofpoint-ORIG-GUID: FGrRC2IKo7UzZUvwaCQU20YoKoBjV9kl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfXyeYNxpurYoWf
 67KIq1wxRtVBZeAyd5wqI+neHfEw1NQ+KucjgnZEfoc21Ua47pb+/z6CT+IXBM/0PIgG9/G9LWV
 ntcIh9Fvyh4R3Cwokhh0hjan+1b/sgyF9P1xN4brXlFnD103xTidGogAHShTAP19j/c84M3ewlG
 7Gs/phdu9MCh6CUlXmwpDrnm7i+4QSIyjuozW4S9F1WKXd8/ZNo8XC4ViMmXoZOARg1sa7diLa7
 w2OkI2wqJUGfvZ0WNLw7ePEm/VHppx0C1A6W04PMUJL4Gw+pB7/zeh/RGvmwxFUHBDu62lvWBVQ
 +jbGFyiThjK/ZqO3LMhgJLaB+nUcPwnAr0aJxqgYbnMmZMNk3n+naaw2XezVCRGMhCUWztnkHEG
 FZ4cbEBx9lzTSouXQrRZBqg0BnJqhmihk3ZWMhXyt0Y3POH8hT/vThgY4xCthNDR9LtR0YXRljh
 0xMIbtvtv4MnTpZ3d3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 52F4A25B650
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96826-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Currently we store several settings in the configuration database. Some
of them are incorrect or not completely matching the expected
configuration settings. Others are directly derivable from the UBWC
version. Rework how we handle the values in the database, trimming it
down to the UBWC version, HBB and several flags.

Note: I don't have a good merge strategy for the sieres, it depends on
other SoC/UBWC patches [1], which are probably going to be merged
through linux-media. Any suggestions are appreciated.

Maybe the best option would be to:
- merge SoC patches from that series and this series to the Bjorn's tree
- create an immutable tag to be used by linux-media and drm/msm
- Merge relevant drm/msm and linux-media patches to corresponding trees
  after merging the immutable tag
- Merge the rest of SoC patches in the next cycle after drm/msm and
  media changes are in

WDYT?

[1] https://lore.kernel.org/r/20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Renamed MDSS UBWC programming function to make it more obvious that
  they are related to the MDSS revision rather than UBWC version
  (Konrad)
- Brought back the patch to use qcom_ubwc_version_tag() in msm_mdss.c,
  got lost in rebases (Konrad)
- Link to v1: https://lore.kernel.org/r/20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com

---
Dmitry Baryshkov (24):
      drm/msm/mdss: correct UBWC programming sequences
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      drm/msm/adreno: use qcom_ubwc_version_tag() helper
      drm/msm/mdss: use qcom_ubwc_version_tag() helper
      drm/msm/adreno: use new helper to set min_acc length
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/adreno: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set UBWC bank spreading
      drm/msm/adreno: use new helper to set ubwc_swizzle
      drm/msm/dpu: use new helper to set ubwc_swizzle
      drm/msm/mdss: use new helper to set ubwc_swizzle
      drm/msm/dpu: drop ubwc_dec_version
      drm/msm/adreno: adapt for UBWC 3.1 support
      drm/msm/mdss: adapt for UBWC 3.1 support
      drm/msm/dpu: adapt for UBWC 3.1 support
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Konrad Dybcio (1):
      drm/msm/adreno: Trust the SSoT UBWC config

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  91 +--------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  13 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 124 ++++--------
 drivers/soc/qcom/ubwc_config.c              | 281 +++++++---------------------
 include/linux/soc/qcom/ubwc.h               |  95 ++++++----
 10 files changed, 198 insertions(+), 439 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260211-ubwc-rework-e6ce1d8eb520
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260228-fix-glymur-ubwc-f673d5ca0581:v2
prerequisite-patch-id: 7982b5ad797f83303a7fc6c932c0c6973114e2a4
prerequisite-patch-id: 5bc7dddd09fcdb4f534f8468ab3ad51781667066

Best regards,
-- 
With best wishes
Dmitry


