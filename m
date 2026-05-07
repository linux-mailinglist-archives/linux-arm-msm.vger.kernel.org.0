Return-Path: <linux-arm-msm+bounces-106269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gILtI9U1/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:48:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D85474E3AFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12B493086A89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE22E3502A6;
	Thu,  7 May 2026 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkcSCxZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWOH34C1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7734E761
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136155; cv=none; b=KKsan7bDvxCn06MgIB0uZWTUAr8aOk35iQnbFC66vv2wyd1EQ0dS846M7WXIkTUhEETB1qN89rahBYWnrNJGigObhH4PoklM9Cbm4D3U2pJNmaED/iLsXzyux+pqql4pBg0ic8vCJ+ssBvMupldHKtK7KbDg7D+nEUgSUm5bqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136155; c=relaxed/simple;
	bh=9oShd0lxeYZuc1TmMkA1ib+fm0aaxdo95GxItjv0DYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olzAcVHddK2plwjv8EhBcpyUH9Qi2aNrVKwHh/Wzyf+CyPGjGpRS0QY1v5snDRDUBS99tmURtGSR7phzt0AuVz6PHxBf3rC1J+ee8M+sJ9+UABBBZWx8yz4ZDkbGqqopaJ9czB7iHmbegEM3c+D8Qxqc+0BuWh9ijAWQ+amdZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkcSCxZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWOH34C1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745uKu879630
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=; b=KkcSCxZUnVfAEb8F
	4yhIz0Ll8ZSyBAVTJC6cvHJY/d8lAwoyPFppva65GZcZYZEZoi2tv3nnfZMLvDX0
	iJC1x0XF+a2T1RzHiNEP9nNEj4tdPppnWfYDRjnGJb7Ol9sYMESCG/bPbtLYjzHy
	tp5uIhO6SSggUetMmFSG0TDiqQuPAN0zTolDsFi+CD2JVglOO2JPwhfx9txrbF2v
	/gjaG38hn04KDySmUHOHc3kjHBzWjq8AsNIcV/JCKQZDypTSavxNR2N6zzTI4pzN
	TLjj4E5wqUpLPnf88WL8FNT9ESpntMeHz6brnp01kZK+Gb2hl5iYyse6knJyNz7G
	wedihQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0fb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so10506721cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136148; x=1778740948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=;
        b=dWOH34C1GtakmbbpEqGNC2jhsfCoiBZmF3TEsF5WHZNft7wHjFnfcp9EAd2kRUotvP
         bFVB2Stjj6zkSBiRcQm8hioE6fexfQhAH4ZL0SH2bxoPkxvdzxn6ngFr2+DzAfjZqGb/
         4s96i7bCGZx40m7end135+Y2PkfoqKKObAfzyp2HTeuDo3Kw8hMrSumviW+nS0qwiNzX
         PCwYa3KNDRTzLlMNaaw9gszHymousujegrvN4Lp7qIgZ/dICNlRORAFDmF9eZX2gpwzC
         Krsb8huW5ZfuMFKQ6vPATI9sYJ1W7yZ3Mw7XJ0XkoLbBJbQHRBJ0yhExZJE7FnO2FlBo
         xC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136148; x=1778740948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=;
        b=SuE3KFGrQRleVu4QORbxmfD4er9eF3TqWAx7KE62DK6j5bivIVP6EeuNh1SXXHUum0
         iBrMT5G3pwj7fM6rKQsuqpxT9KJHOaRGduiVx29jE8alDpTXGkVp5dq1rx5hqbJj+KX+
         DG7FAd67Tr/t//Mh+nWjicetuV7rLCeuT+4UDM7xUsMaBWsRbSXDR/hMmPNq6w6wLJZX
         9vH0ZbT2UzcYTu0YvZbhs2JRrmbSKbs9UEmovVxQtRPHur5n01W/oDRMPV9/bkpWq48P
         2LQt8Jw9xnSgWJZMamorHL14Al80guQofy8VRNWvz3hn1xuxprnam+4PCRfet7bJkCyM
         5pkw==
X-Forwarded-Encrypted: i=1; AFNElJ9mO2ocq9CIXKoT7/1LXnGqYtgbj895p5mRWfH2zMQWRGvJLJSVTG6JXoITAtX8f6pP3RbP1/37KhyLQnt3@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3ROkwXjn9pwps6lpzHcsbRwK4hQBBau5dUcq7AbrfGFoS0uJ
	c3TlQh5kVPtgaFaISXlOtBb27GyyyYqYV/OHynE8rQRQnVh8LzJVfjvXKRVSbWmblTG9qSYLlyl
	H4/xkHGWnjXYbbDHY7fJ06o6nodfqIkX0jg3MUTpwR73GG+2zuIQXbEHT3d6+QSf8YnO+v2Drkn
	ap
X-Gm-Gg: AeBDietiqN00pFIma3UrIbyHs+RzpEuwZXlO57OCOIEwxUU8yczFMz9ZsE6EBW5mUYn
	dW/QgP4dguTY/tz5fERtTe75anTG7z3wUMPjbrbM4ESsAvhTPCpsmeN+ttJN4hgfoEDrUYre+J9
	83t6Dyh09v6UWAhnHhfhpO4If0pTrCtc9rl2eGsxb2D9+QkJNHXT8oK+xibHD3KjZy0mmLwNfPP
	nk9utm3pJQB6bnWd7Yq86cID05y93pxX6pedbT7+mIbeHpVilyrywh/d/l66MELUk5aqsYkv5XI
	O2ed8GhA3ZTeDcddgOyDJRnC1b3RI9Jrk7TXhqe34YtEIwrEMoJJRen5juvK2SlwIB0qQC2We4/
	9U0/2jSbUBO1oGZE0LG+Il9biHjK3Kgf1XIeY8BLiKNrwMuNvv4low2HJoguAk1h0WRmd/FA5Mr
	AUvuu7DMi0DPtKSyuOy4Od+K/VG9m4sllE9Btki70BPndI7g==
X-Received: by 2002:a05:622a:6204:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-51461befdc1mr94388031cf.12.1778136147945;
        Wed, 06 May 2026 23:42:27 -0700 (PDT)
X-Received: by 2002:a05:622a:6204:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-51461befdc1mr94387721cf.12.1778136147520;
        Wed, 06 May 2026 23:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:08 +0300
Subject: [PATCH 08/16] media: iris: skip PIPE if it is not supported by the
 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9oShd0lxeYZuc1TmMkA1ib+fm0aaxdo95GxItjv0DYo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+E88fbCRiyGMK955bjuiw2fsdCyCEHHF7R
 7aLwQwisJGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1Y1zB/0ZN5oWIvaZjrlCAvAy5ojTx15Q+TzPU8LD5zkRYk1c85Qmp3OE+n5wDxfZPFil8CSLkms
 aIYy3SSN+VmlIPyDf/uCqD4imPZ/2sX0LcAjiT5C17B+N0j/PAjtFVBj0/n8VfOSoxzoiDuYnNq
 JejszHPwbMTTiDqlhmhGs7k4t6cXhj+wiVduxOynDywurFylGrSmNxF7Edhe38/WZ2MJZ2EVErH
 fVdlh+d6aqWG8Vo1qoGQPnpqNSdtokuyfPtGzdxaF0X1HfQx8OgSSdL0OHTUaELg4ddFhxNnJmT
 6ijazendjw8O5HlWo2aPrAoGAjbdaHCf3a1UXROO54PFFOBj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc3454 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -tFKCBN-V1G0VCDbZDFvM6W3LMnPXb5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX11I6AGb9YgAm
 wB/1ivDAqnMoL+4WZKig9ovOqqZLk4vjp+5ir/wNTcza0Rwif8/iS/9kUs2aNxJSX6Ep4cOtTpY
 QPdHWSsNbE5RYeNhReIQ3DLRXSL1sTxjjJ+4NGWF61unMYHflYROxmBmST+Z3AXPhyG/m9PuZfa
 MVygG7Sp7WI2PXVlmOftm9td3nPlgDK+ITARVfTYjh6d++oRhnBPVJm4TIGblku+4FXQJ65thWN
 1hTw48xAksNra1e3/kYyjvmpNTWTyGlby+xvSASkhkcbbfwTO7Rm9FBAkl1IIeeymeKfoczhPhc
 R1KW38mStugaYowfFnjXumV88Sc5LS7L7soaucR6AEoJ0joQqDENJ/La6HaC+GrHozRM36TgGmk
 JDqrZgfvG9XA9ctndsgawaC+yd74SzpcHtOa9DWivbNP1/8gKISo4RD/OL3MKfKgx0oP/pQjXn5
 5imzsr5eIJNhlw/pwkQ==
X-Proofpoint-GUID: -tFKCBN-V1G0VCDbZDFvM6W3LMnPXb5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063
X-Rspamd-Queue-Id: D85474E3AFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106269-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Action: no action

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index ef7adac3764d..f438dddc19ba 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


