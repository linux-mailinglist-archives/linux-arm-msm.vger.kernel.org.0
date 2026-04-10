Return-Path: <linux-arm-msm+bounces-102722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK+TJopF2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:46:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD63DB918
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DD4E3093D93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69624225417;
	Fri, 10 Apr 2026 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdAda897";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjA7xjfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA23E4C73
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846558; cv=none; b=DYjzEakP7icN+q2Q+I8XhI7yUK7Va0HHWaLTuDcHgzofFMdwTSTBSh/wKrXm3ziY5JGkrOW1yFDtf2yG4sIhOzzoNDvlCrTs+GVwhxuqECNR0W3G1pOPpvFZ/9x8BQCwVvzjDBUL0WlDSA3j7avsjzM2BIF2GQ6Ccxwj/BkRx98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846558; c=relaxed/simple;
	bh=O1tb22jORb/IcveAVBjJMXWs39kyqXjpLAL/TwOhLgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2Lj05DxoXp9pMgS15VOvijjnt/LU9kn3bJUplzu0wdLWeBPWN2s0Nb5Aax6QIFlS9D9y9MeU1PXGxCTp5ZfDREc/X+hhl1UVU+9BMgeMIQQhjWFRTLCeoWQ4R7GeCYUCXYxy5SJ8cHTu/JzQVZF4PnwT6U9cm7BeLMxw8qLh9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdAda897; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjA7xjfH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAgBx81925143
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PJ+4GjtwPpR
	6n2zHFjz+BYlNplimUVMzPIgIJDqLkr8=; b=gdAda897XkqFCEyGwIGXIMQnJcG
	kDzCT6UWh56qfIhVR3Rw3YMfPLNNX7xxu9ZTH/JurMq2+sPqeMNbVp+ShMUFFMQQ
	WzQ3IUZcvyZVQdNxdAmLmtJYNlw3IHNoQ+DQZ0A346gV4gS8ZkfqYzK1wyfzd7al
	W+9K44zdUl+SKLTBcDbN9zS3r1vRtvy3U9U9md5aazoh80931eWqL0lpYAW4tQBF
	6zOhq6ALAgdzTRU3z6G+nbrpqA+Gui3lVyMwq0n59bQYPVVNPmPyVMZFh0R891PH
	rCAp6VxPRJKDYEpk8+cBG2YXvkaHYMDWSHZ40OUC1as7BQggEDqzjgNAO/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjth7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c83bd48afso1279361b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846556; x=1776451356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ+4GjtwPpR6n2zHFjz+BYlNplimUVMzPIgIJDqLkr8=;
        b=FjA7xjfHVWI1ec4+WFVjICqVqeO5leaoobWnoMJn9TcTsGvJ0aUVVqqZDPEEVmHAZ3
         OKqivMGBywfh/HpnpnMrt0DbcFbNu9rFca3r+zrSVi1uK44CanxHTERU656ydCzqLNpb
         JBSWxS/VAxNBA6FaW5oQF1aeTCtU/T7BceVYLzjJbpvuu+VI7cAo8vGkZnKcZlN1zwmW
         hiSAqru6PkuKIf8NGr+7K+SR0iX/YHbdvkQtmsBdMV+E1nPP5Flx4fC4oW82w0zqmCB9
         pNuYllUeohCWfZSBrYhY5D3Y2cK5tPqabJNhXqnaYIULiLCOoQxqe4kQ+7O8Xcfom05x
         m2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846556; x=1776451356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJ+4GjtwPpR6n2zHFjz+BYlNplimUVMzPIgIJDqLkr8=;
        b=rh+7oV/CO6i6j18ltFfjAeYkWmCjQ1BFXgZH7W1eCr8N5qav2f1kZUOrp+K1PEOipb
         aL3F77GzTk01m2Plg0idqP/exhsCT+EfITV+xB5WGEimRwz1RG+f/232sEtRLimt0MpR
         PG/KGl6iq/sw6BL/Rutt49+Sk1G4yHAqp88oztOw0flIrGeGNLvQmr9JtaHX1MQo/Krh
         oE50+IaB0oa20knX5+AtwPdezbiyPFkk86wyxsmCKD+eBwuyggS8owc5gO8Y8F7BD8Oe
         LmQMmgG3RlZCeZ9NRTeSQNS6KFLL9NWwg6Gy06g8f52XzRqefw8zsn3Ohejtgx5XFfdq
         rgOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbLMiXVa+z6r51gx+hVrYIRwADjdmddhX0uUpOnDp8/wW66GVBkpAvF6OFvQ1hekbvTD/Vu5KLbFRDIHdq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BGM2xl+rQJMgzEXYUqUgKXlQv3xVoqKpgivD2oRUZ+Dup/EM
	lqmj030lSS484G9RWFCku12awdz3i+cmadQ73EQAu/aLYPFwZPtwJDqTd8yqgYfxgNu198wFuoW
	3KzKtd9C6XgRMEYeDdyvtRPJ/dIcgUXlGeG8EQmseydw/8YM8hMpGNh6nldxVul0XFMgP
X-Gm-Gg: AeBDietLbG0YD5eRz3WKMlyk9e/JE0JYVXeQ+P7PZ8pXxZ6Ys0kX4m+VuJOeuus4kSu
	NwzukbCanpnbRiumrnpiSWj9q2N814feBH82k7AsEMqe+APPKdJKd+AY5AaxneCyyKb0objS1kt
	Y5ajOaGymsz0vs0zAff0oAR9d1lzfvPPjjUGzGsES1Ah75QudyEpJteXmZIVeqmtTsEegUtJKZC
	gfPSIh24Vb+YfY6mbkmEKGJi6Y0wqqQcEyFBXHbsaQBdnrz/pzn4OxI/TKK5dxFm6CdcqEcxwEb
	ALLzvV5g8N5MSPhhWNdQIX5wj4wK/M+ihviSS5vbWubD9zkfFFmfmFJPFT+Xw9bbURjDjyjrnBm
	LdCMqJw2hSrMEUNh6PEMy1C/UhD9OGSyOqOIx3VJ8nP3B4qUN
X-Received: by 2002:a05:6a00:1896:b0:81f:4566:ccde with SMTP id d2e1a72fcca58-82f0c16a5a3mr5006257b3a.20.1775846555446;
        Fri, 10 Apr 2026 11:42:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1896:b0:81f:4566:ccde with SMTP id d2e1a72fcca58-82f0c16a5a3mr5006223b3a.20.1775846554832;
        Fri, 10 Apr 2026 11:42:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 08/35] arm64: dts: qcom: sdm670: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:45 +0530
Message-ID: <20260410184124.1068210-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d9449c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: WKRF61BtcU6K1s8AfRoQ84A-sFzK5oQY
X-Proofpoint-ORIG-GUID: WKRF61BtcU6K1s8AfRoQ84A-sFzK5oQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXwRfceb0N7QJ4
 S1RutVRiqokBkXHyn0z0kDvq7G88IBCTvAK3St3AoHmZDT6j7Ez1vh5Zo9nigvgShfiXe1OM4Oz
 tyxpu0pKHNrPsNGgLWIVZCKyeO5whftCG5ZB0+geKEDE+dDoPviJSGw5AAqZ/QybjNI6is+eN7C
 mg/c4e8br7tZCMrYkVJEq4nAaQgJ5LGU+eiAiyhb//OgVtP2UOeFs1H1XDGyp289eNW1OCalYyw
 i/JttJnaLgEWq4uM6B+17Ja8lldyMIfLNaoH/xVHg6VARso7pYNm6ReUFABgwefQ9sUzp8udubD
 c0fmNYWJSh8ceoVRIgrjAWleBvH40Eb+kxTg6ZmgbbQiMHhE0rN5Xpr7ePOhasSUFAu22+wHMp5
 6tOSf+gRlXn5eldRrDTg8sEMjXvV/kjiRpqG1vgm/umLcv+4DyfHgD/VTyXvMWlIZ+tJ2IWF+Vh
 1SQ7QnRCP06Usi2z4JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102722-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBAD63DB918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 746e9deba526..e4dd1fff7444 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1607,7 +1607,7 @@ usb_1_dwc3: usb@a600000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm670-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <41 521 7>, <49 529 4>,
 					  <54 534 24>, <79 559 15>, <94 609 15>,
 					  <115 630 7>;
-- 
2.53.0


