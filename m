Return-Path: <linux-arm-msm+bounces-101350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ15DUQXzWmMZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:01:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8AC37AE0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B87A1300A506
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 12:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C600A2EBB8D;
	Wed,  1 Apr 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiGQcWWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7bSG+I2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13663D5672
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047895; cv=none; b=XRSYabPsZMXl8FcCwo6SGj/8eBlcgE8yumDkDVH4DyWDUgzmHsZbBIB2TElAW6pIHJMD82LxIpfKfXQYbsty8JLmRYJHFCqz0PYphzI9g71V2byKW1p1THCzzF4GLCDiS6ygBVSLGQNQ5Sbbc3TTrKnD5Zjyf0xgwLNcDxondSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047895; c=relaxed/simple;
	bh=P9EWS2HwoWEJHCZzZcdMPtH3zC8HKCi+f3oLHKre2XA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ldoyh639Y2V8cK+qjkCpPaRx5FtKekDn0G/6m+jzURnOqoyIkQyu0sqZzLnN2ovacqXigo1+RIuFFU7ytQ51YIAv12FrX4Rulh/ZNYgHaevSNrSW38TKJQ1UunY6P0YB59jpRoyfCRivSY9wk7WbhycC+q39I9ihW9SgxS+ZUro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiGQcWWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7bSG+I2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631CoxS23081386
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 12:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mNf1y06fxqQ06Whs5aztg9LwFEIyFIfQgR4
	WfWBDfDg=; b=hiGQcWWRD6yWuLceFErn+kXs9OrHvf/Q3Bay7L/163Ey2x5JaoC
	ubqQkn4Iqoz1SgN04lyghqnr8zytGH4hUcyvhieDgJCNmMiPtomg/Q0h7tIxZOAm
	om5QaoMo/ZprRXaXZSgU/8k1IJNMEjTIszyeXXzBh87SvJZ3cdkRZeCbeFjlbaCm
	tmS+cNVuJ5EAj84xHY/Y4/GBlX2n7NUYpZ9EBu802VD+/TOlhaWDqsV35rCdtrkE
	MlN5lVUiVNZwomOyC+gyxNShNTZJDNIE+jS77nycxxqoLza0EwGU8G3O1Z9ec6i8
	ApTcdmXPNQ/Qr1iiiqisVC9iUGavIFFkfmA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkv6rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 12:51:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741f038f7cso4585615a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047893; x=1775652693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNf1y06fxqQ06Whs5aztg9LwFEIyFIfQgR4WfWBDfDg=;
        b=Y7bSG+I2uhqd8FitHz6nklyZ9dP3VGhuMGOVNzO8qXQMqsazJrDNu0ZwwoUQg4Cbnq
         Ys0Fa/DpWTUNVqtub2jMX7kU4O/xgr/jQCvrYsjD0U9NqsGBAUtXS+w4QYTJP7oSX0P5
         GZw1BaH64tisVvFZlHJEeaOBuO0PnShxOGnU4Kt+huWFP5LoHaaIvWV5WA/ntZjSt7zs
         ffmdqWEU6OD6aASDWaiqHt4lH575/RlV4bn9BLB2agXs51QH0FtAOBoMADbgA1B4pSJP
         KyqVw6FXX/bU6TqoYKHC9HOGKPNVBb2jDXvie479p7gouxv+RoVR6BN3qim9rDlM07xM
         YC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047893; x=1775652693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNf1y06fxqQ06Whs5aztg9LwFEIyFIfQgR4WfWBDfDg=;
        b=fCo8Gbs168ahu5IUfNZ/5x7j6RiONGiFQrxsr+MLYg1U/DrIn6/UJjuIw931BGMO/5
         gAhv9fCXVCXqtbXNi+jrnfOLE80cD3vEGMEfC0YnH/LKZc/w89SXaAovFilAGnIndbxV
         0PhkJg8o3LserLIqz/mHSVTTy8qOTPGaaFVMjwH/ud9Oi6Pmn2ITwEG4gPgkWo/m0Lfb
         LAJU0Wppb7aJfIAmPzAtmwZ3OVP4JgSH4cQrXv62gARiTD9jlCLnLCEt6rKLMeFBHIx8
         0ZQmk58lKdJ0VkEBupcRHQbq4wW/2BY1k1Gzi0zS5m5TVrBAUjIfpBRTKIOrs+fWVFz+
         BWyg==
X-Gm-Message-State: AOJu0Yzx+60GTNGN1H8HBnse3vUEJZ8yCgcwUSUgTePzqXJS74GJt2rm
	BNMWH38RF9wHJM6XpBG8sj1GDYSbq1sHbPMOrd6WyLaPaJ7SUedlGyMHAuOm+8lC3/8mA8fX6kt
	f2Lw1qaodDbNej6c3UYvgQrUnXD/059XAC2TtChGLD/P2uOgNvPi6dmZ17KqAoIAkRFIo
X-Gm-Gg: ATEYQzz6HxnxZspQPzqN9XG2NmK9/9h+YBSXIr9RPXupTglXOfPWME8+nKcmFLRdTPC
	Nh5j3A2wFLIzSFw31CIzA4XkXGmmkfj66bY1M/3ExVxyyUHXEbedbwqhS6YRgXf8CqgDILUzD/d
	aHAUvBM9PidPX+G0OPCxOCntW+8okZ51nsTuRb3uWYKgjOz+GUMRvYm1xndWdfVLaGneAG5U+0s
	b6fcqcNohHrYIQDKJ8fQGG/0na6UvH9l1jrTykg4R3eq8uCDe/S3wHyD6179XoaMeIzNGQGdkUE
	V1oIvT8MrNt77NBt+rNLt5ifQHVn9w/fFp3hARbdRVPOcQNwPqjP81CM6yJAtk/SxYfQDXKv4gh
	HwCsepscdAoX5xpCuuCO3QiBUQGapx6MsFd35I49qjSPH1mI3
X-Received: by 2002:a05:6a21:32a6:b0:398:7d6e:4db9 with SMTP id adf61e73a8af0-39ef71d9517mr3581373637.9.1775047893141;
        Wed, 01 Apr 2026 05:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a6:b0:398:7d6e:4db9 with SMTP id adf61e73a8af0-39ef71d9517mr3581342637.9.1775047892580;
        Wed, 01 Apr 2026 05:51:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cefa82b24sm2199735b3a.31.2026.04.01.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:51:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Hawi Platform
Date: Wed,  1 Apr 2026 18:21:26 +0530
Message-ID: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExOSBTYWx0ZWRfX+E1Ru6U7VZCb
 SlbmoNWxr+DYflQDMwFqwD4WZJcXOESMsFLMhHq1NcqmciqPAAOJR4DeWNdGPbmZjB8R5Pu4pSQ
 1nb9LcdiymCy6gKWoPwq2UEvrVWshlKB8Vg73Lj7gOaKHTHbJJb6mwcIK/U7t7/u6KT15lNTpWM
 z5ODhxlpXJ5TPTeA8IOd6NLGzy2cfIxS+ZAZb0roKPVfEKuTnpLm1u00BZMlzq5F8IR00+PP3K0
 frrRSS2HiNBTMHF+g1i4Lsx0tSr6LzSe7V0UzoOleW3SsFjYKgkoM3TKGO+FAWRIymqCzgpTsCQ
 WcHIsEgjW2oRTqo272YBAz1P8bP7vAEc/yJyZmb5X8EuU9sxaPz4Dp6CoXDoAJ/jn8YDTvhOeNM
 coSmMJObWPLDI0mAAc82tITYnfVLfl1Quz5ekKFPWaW6OEOgv5hFVDJQvl8yWtV9d53USi8uMgs
 Q9mnID4MCK+S/Z64yMQ==
X-Proofpoint-GUID: 7xkzIgU2VFTQO2P5UHjh_wwvt2nBs4PO
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cd14d5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1_gLH79sc8AW4wFG6YQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 7xkzIgU2VFTQO2P5UHjh_wwvt2nBs4PO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010119
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101350-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD8AC37AE0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Inter-Processor Communication Controller on the Qualcomm
Hawi Platform, which will be used to route interrupts across various
subsystems found on the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 7c4d6170491d..7dbc3ac6c5c9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-ipcc
+          - qcom,hawi-ipcc
           - qcom,kaanapali-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
-- 
2.53.0


