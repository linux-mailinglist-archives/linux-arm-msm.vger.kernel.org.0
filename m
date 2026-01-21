Return-Path: <linux-arm-msm+bounces-89984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDN6C9mycGndZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:04:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33655AEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C709892111D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6AA481AA8;
	Wed, 21 Jan 2026 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyDh1crS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEROgS6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C11917ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990952; cv=none; b=ncIDrGlZ9ySd7HqWfAekk1gOyb3g0xJi4yOWBjzeUHfcuuEX+9NgTEt6DD1Aet0FMwp5XjoUN2E/vTfh18jdJVYUZ9JwGuf44XRXKyd6qnw0tSBexnSSQAPvN4i5dx7o6t/zskO2SZIPJlxx2prpGg34ys2A0KaSpTM+yEtlVkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990952; c=relaxed/simple;
	bh=NbgpGIO9xXRVK4G8G8tg2fMFxA6ighsw19SRSM0gsZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KQVPWsKlK+e+nODqI9uXvWxOsPIe01dWQ838eBNAIu25DOtJ3jvblXLnaJraAv7+iFAmUW7tdNcjs5yclUyUdp2CBDyPeV174RraaghVEcI/87PBkWivLos99HnHRf+7RMPCgn/0IKqJIQaD/plINjKARH6uLKbRd0V+UheGoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyDh1crS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEROgS6B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6X3K02353893
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PusOWKwtWskCApkuttG7Ew
	mnWrNWiXf47WccA6bIuKc=; b=fyDh1crSd41IUFO5i/e8pDc9Nb6FZiu2qfQWnJ
	9YuX3nYNJDVLVg0rfC8cAdhQoqUVHpXL/3A62vc9i7OfyiY6AfluV3bkIQmAIcDI
	skMBjga5FVJcrFqMacc5XkrhsmQs5ighDZQp9VuZcY6JQg2dcrPtfAJAbcNPcvGS
	k6D+BY3CiLzaEyV196W8dGfKxmFht+9MQmP1IBOz+bjPSaIztJMDds+wL73qDih1
	7BTO+wNZeGQpByxiFNA4zeNE0j7Lbfe0SgrAiTK6dtYGMwLW6D1JZHUiwZq/ZKQr
	VKp/5mLoDMHwDjs1wlTtHWjz9VRZVNFqnmMHIgRlJ1A2Q+Pw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmpryhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:22:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c2f670a06so5524795a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990948; x=1769595748; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PusOWKwtWskCApkuttG7EwmnWrNWiXf47WccA6bIuKc=;
        b=ZEROgS6Bgh2OMOOWxQo3oRJ6anFQFJD1JLAqI95hhXrw1KAo5Y4zS57cIgs6b4bLyn
         bc1BmluB8zQGJxyZ41M63Wi8MPRKv5LRaaGPsliGcc00ztpVLNe4A3MyDDYg2h11CWuo
         tYTJscMMpH3jFltxLSoUk+FB0aTffauTg0BVngtNWVOP6CUVnO5uRlvxMRg6rC98PckE
         rx6yiGPbEySOPz8AtuUsvB/pquxpx3iPTi9Xe8n+G3lEOcuzZgcISEgdWOsxGGbJWog2
         uvkAX+YQpT8w0OtmO5HJfnNRxlnxMK2qVjJGMVx8UhCAOc0M4X4F8fCYtEzLp15lSJSx
         RZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990948; x=1769595748;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PusOWKwtWskCApkuttG7EwmnWrNWiXf47WccA6bIuKc=;
        b=Pt0GkvD8IilP9QJzfi8YCYjHQjG6dIn/qoSgsX0frZRVcoVX5anKBjo61Yjrs/i86j
         N8XoQNcEZz3GghL5pvKto/patG1Pmj1/dZi35WJgLSo2qB0kcnQgT74srGKzM5+XG6sb
         q76kbEmBBVEorregG4jln5+EXvnqDTSY6amNHOGjTcG7L4XZqEaNqpRFXoqVHPwrvm8G
         8p4kZ4ymEeWVVTQDurxcWJBPoIaUd6tXAi5U5O0fsjCxJKNFupksT0KdX2tJ98HY02Mh
         jpryLh62rYGlqzlK9PKXUuae1PReU4YoBpm8N9N/vzJaNP2prGSLpZ8yUtnm0stLh03q
         7xJg==
X-Gm-Message-State: AOJu0YwD2VFiXHEVocOQ7jtn17/qk2ZQdKgTqYLWv2o4Hysx70HLEzti
	3IoSEvHrN+n1DPCzObTDQ0ROunBJUm58GNWGwtESFuyMgeaVh6BUlqESgUvmHkb9LjMJa7rLYN1
	lhjZMWXfRkCeuCGR+WDAN4klt+Z2F53y93mtjrx5kPPY2V/rSb1I2c2xZMkfnJYc4zTOd
X-Gm-Gg: AZuq6aL21mgpMnux1CZsIoM4DphONTySqWrKXMgEbxrqwCc4fpJuXlyGXnjFmFDmMKr
	XUq6Ev7oSWeVN/C994qC5TRtVT4AaBRktUvtgcclZvarF6c5XPDwHsmdSOgmXruenUbtRiN1ttV
	8ohnJ9fIDiUnoQzauUQbosDQrBfsj+2jwng7BnQ0ozVm+GNQ2N/wvLalFJX+IK943P4uJZuvUaK
	t/4NGk0KECAs0fLWXJHkKa9p/MMssaDL3KnVEkadxYt5sEx5aGkp3wRLBsc2vEeMxh/StGp+008
	3WUgRR5mY4dsQHn/7pP0JQSkpy4QIjH9M4VoN9i/dL8lifdvU8kVzTcHKSM+CEKSu5NvHDj8I2/
	DjR2nZJVEdz87ehXlKywCg++O1CgAvifpbgrUX7hjeepS
X-Received: by 2002:a17:90b:180d:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-352c4034c61mr3641998a91.27.1768990947958;
        Wed, 21 Jan 2026 02:22:27 -0800 (PST)
X-Received: by 2002:a17:90b:180d:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-352c4034c61mr3641966a91.27.1768990947496;
        Wed, 21 Jan 2026 02:22:27 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352fae8a65fsm886160a91.0.2026.01.21.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:22:27 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 15:52:03 +0530
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present
 on Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMqocGkC/x3MTQqAIBBA4avIrBvwB4q6SrSIHGsgTZSiCO+et
 PwW772QKTFlGMQLiS7OfIQK1QhYtjmshGyrQUvdSqUVrvvjz4TR84LeWTQdSW160xkloVYxkeP
 7P45TKR8eIRcDYQAAAA==
X-Change-ID: 20260121-glymur-pmic-mfd-37e023937310
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768990943; l=1130;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=NbgpGIO9xXRVK4G8G8tg2fMFxA6ighsw19SRSM0gsZM=;
 b=iq0Dn3mbmwoUaLbWA0HRy7Y5STwp9qEFWMC91R8EvwiUfJjfK+WJlmOQ5t/Jxbn+3s15kmsCl
 zhsSzlZFY4KD4N+iX5ATc3na1wM4jvRZzVeZcpOAVwkd+DI8fSWlIZV
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=EIcLElZC c=1 sm=1 tr=0 ts=6970a8e5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ztkqtL4izKQEyfKyNM0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 6kOgMVgwApFcKMOil80EBrtd6JT4K2ER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX7hGzmOw8bDbf
 R260KIr42lRq7uZmpPHPBPnx/HbSrmoLYFQnKgH8ThG/BNopTD0aLikF5MNYS6Mk5MjMHuLdljo
 0VTqGqcxeL+H/Ji1emP2/pPwP1uT+nGANQCB7JCIo2jnC0vhxr6t/k6SP/q0GU0d0YHsmTlg0M6
 gsdm1S6hbWiszJejuZvJn9CDcTSQTC1/vZ6p+PNvzv9fhqZ+DfsdJ1EKWNkLJqS4iabOViAF9Rt
 y2HWb19bE/OFLvis/5C5g+Ofc+wDv+FF+Azp9K46FNdU26V7bAYgQ+AnUVZhURitolPQSxnKxU0
 FIYak+pxIgzBYuxJZ7g1hctYcKxYJa1PBapT7eEFkBZ3ywbgSXZOkz5cWLx5to13hjz7Wut24uH
 3hlP/TYVJZjHaLAT035lSmrIoyVeXScGoyhP9pfGP/aybi3R9sYoZ+5f/o6kIuVbnVkTEImIALv
 oQcXZnuJkbc7rPWokcg==
X-Proofpoint-GUID: 6kOgMVgwApFcKMOil80EBrtd6JT4K2ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89984-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A33655AEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatibles for the pmcx0102 and smb2370 SPMI PMICs.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index fff2824c69d5..e5931d18d998 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -77,6 +77,7 @@ properties:
           - qcom,pmc8180
           - qcom,pmc8180c
           - qcom,pmc8380
+          - qcom,pmcx0102
           - qcom,pmd8028
           - qcom,pmd9635
           - qcom,pmh0101
@@ -105,6 +106,7 @@ properties:
           - qcom,pmx75
           - qcom,smb2351
           - qcom,smb2360
+          - qcom,smb2370
       - const: qcom,spmi-pmic
 
   reg:

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-glymur-pmic-mfd-37e023937310

Best regards,
-- 
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


