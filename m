Return-Path: <linux-arm-msm+bounces-106576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOTxEPR1/WmyegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:34:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B233F4F1F20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B45A3045B11
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 05:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1AE33CEB0;
	Fri,  8 May 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7gCElb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNYCmPpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50833260E
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218472; cv=none; b=gO0TTJg9VLRFYC4+PX/s1fsx/0OC4FfTN5ypTLF4LuxVWCWADAVKCSGxEsgW0eu0i0/FmCl05VWn6NIhsB3AgoYHJkPTMT4Ye65xg/l1ZFrDsdP6T6gvH6Gre49cL05kH5hkeGcBP0KtGP3kBXLW/8uQM/40WxgfNOJvHLJvavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218472; c=relaxed/simple;
	bh=pISyNZIuCFXRI/CniHWZu2oM98s7b3kt4arxfCTfhQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6EX3vcNDgsXPqFjRzZdbyrs4rUhOYzt7+kLbSFYxJR0UDtn3AbIgepVX69dBcgeMy2vR/FsULgYbXsXvnBqfmVUy57PXhsBs+TbMeqokvgZBTVD6/nwFGsOcqwIItf1TxOTCDNkeAHtYWOj8r8gI9A6mjLtyvC/wgXI+6uggu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7gCElb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNYCmPpK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6483Kine1971721
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 05:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqruoExKASOIObZge/m4GTc+sgArJrSylq6nzpIlxcM=; b=M7gCElb7OmmitbUt
	5YlhoxFn6TlDm0Y88XFLokyWvYP1petF+Ku3ykpDEgeDQ4JCGfmqc9n9H1fK3q64
	i8iSdHgR38daYOYNM4L0h1AN7k9X5mzjCQmALjhjG1oljEjGNThE0hWGhuEcrq1i
	ClIM9elUflw79bxjQIMOQwYc0wbPVDjBRzq3UYMT1vMJ9x5X55ZrLYE2iJovRQaO
	z/XnlwjZRGmo82j2msZcMTKasQHeqqZxiN1823cZFCHBHJsx+PnLuEvv9DcZ+ToP
	7vNqyA9KzgUhuzAUFgnfPZBRkgWNdP9N0SHvkLAoqEf9zTSP4H3or8gTyG/DYlce
	ZgZzjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tejbhv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:34:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2efc342ef15so2505258eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218470; x=1778823270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqruoExKASOIObZge/m4GTc+sgArJrSylq6nzpIlxcM=;
        b=HNYCmPpKJPudCkfrBHmqLs1YoMJE96YGVop46lnIsx9vKQykSLuXNagwQ05rPKJ4im
         V9j9aIeQfVUIyqSvDel+CaF+wkupqZyAcENCw+5AJuMox+ojtu9F/tSLWHcqGCI5YLye
         FkhktpO9REsSz+ZnD/k7a///8Znkx7DkuBQJPvHuWG0SjwdKuJ7PavwBNTn5FNK3io6g
         1xRearP8NZGuj4+0fdnP6uEHUMzhYmPB2ignN3c1F1iEEalZzqFkyrTbt5wn4jR2kaFL
         gCxKRExRCw9+vIrTapiBwZnVxI5febi47ZTFzR/xq7PWu4Yx8iC6UFwzCnCsfwjTX8Aw
         93Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218470; x=1778823270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RqruoExKASOIObZge/m4GTc+sgArJrSylq6nzpIlxcM=;
        b=J7o+RwXFgDlF7FkMUkK3Tmchom+J7pTSt8WTIJPP7i4I/sFBzNB8cB1HeJGvnJNgnY
         rRJLMmvIy2CH64+TJ2ov7NHq5offWyDM4TBtxo3mtMEvDuvPsqF4UB3tu/3Ny7e5uTy0
         pJKzZYL7wmw+Dld0LQjV0ltg9+zXiPcouCxEhGBFUEqGIjMMVC/XXFSbuwcyfUm4JgPo
         IULApPgWuzPwNFpKpiXQ+fggNFvuLPm7cmr8NUvpRkQhYP3D0KDVFKihyWWQ/+XMS33m
         gVbn3gplRvSGRZJbogyuu/2qEB7L9ouvHbWh/SwXSE6u3qMZsoqTk6OK6oIyZZr1McAl
         t+tw==
X-Gm-Message-State: AOJu0Yx7ugS8GN9Sh1YtDrYK3nudNO8TastKiS2x7hyKp3JwzWPb39CX
	K8guzfTCOwe7SUE0EZsUm+YXbtDgDm49MHXEqOhNVlKhgJjc9a352cHuF0sggKF3VpfBNWfRUYB
	ndg6tY4Yb6U8R36oVhgi06j5JsCVdoqAzGECukt/2JenaxB1pRQYd/Zj2Mj9dfqT/85Hu
X-Gm-Gg: Acq92OEUsE7ET3zNpoIsab6muLCmdCk590t9RYpQFYy6PBh6eM79SyTWQjA+m0LEokN
	DcFpfieeWw9xHAxH860m2uNwM0hUF3VeJ6sfgVqwzMwuKbvKqWYm4JnrQ0W4qOg0nMtlbDjzHnO
	RU/Vw1WTKs0aMkv3SOYgHNaDpOm7V4yPL7DBAXpD0GX+3sTEKCj78kzy9ljzXCMeCwyvk9sSqEN
	rKSIU+3kWWRP4hqHYiPGIAe3/mJi3a4rQmFzkdRdw4uO7+10fF4EKGXva+YCZzkzf+uDA81byIi
	wPSqyusnpGeRRvqmj3xV+oJ53UX7rcdMT71AVf+wmFL5UFvUvzCVSeuzcD3kN7dDSDnc5DPHj19
	pMvpwWIcCzxKVX8tf5G4Gb3gzKDkn0+ekY0jnm2RQI7UIHzmPncEcPuQxfvc/ewXZfh3FQ5VXj2
	OwOTTKZb+O
X-Received: by 2002:a05:7300:e82b:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2f54b897f52mr5444487eec.5.1778218470227;
        Thu, 07 May 2026 22:34:30 -0700 (PDT)
X-Received: by 2002:a05:7300:e82b:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2f54b897f52mr5444464eec.5.1778218469575;
        Thu, 07 May 2026 22:34:29 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:34:07 -0700
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: Document PM8010
 GPIO support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pm8010_gpio-v1-1-3bce9da8d2ba@oss.qualcomm.com>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=1418;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=pISyNZIuCFXRI/CniHWZu2oM98s7b3kt4arxfCTfhQo=;
 b=U40Q9VrGLn9fOvNj7X0c3hC28kI9RKMw0q08SIAhZybrBs48+XsiJiM86BNPy/W4wCm8e61mE
 mEvVvlesejsBk3KIqRL3Qy+OppTp8KI9YMxZL0hXQyuOu/CBrfnd1XW
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfXx4Q0kIQwt9wi
 puW3wrUO2FoKNHmkkKWfQuYUGA7DXWrUAxGEHV+lRHn00IZwYCI80hSLKqHCqd3yXuPkhD3DO34
 V6eQqAzbfa3kcbkLZLKefX8Wov6usiOQBmw3Vv7EPQTIiyr/xPNWkkpwvnZLWB+fhkga9gA3PVZ
 hfZ+fsWgbbYx36cJIMaFcynEQzn9GHIwGrd3XDe9GTiVRwSXEFfls31NafzBhm2fG2a2hh71tcS
 09On0XCuEsOaClfs1qS5qpaY41RRhF+OvWFAkqMinZ/tu5mA1Q1WkFcpHGywq4zZcElAjy0EOHB
 swZ6LRMSdTsH+IRDiLWbinnC/j1WkPMfSI60IjWwpMCJ1x05HCi81yRVWqOTuFZCfV1b3YYhvLK
 fQSD/PW6TDhNl6yQUUEGASdWfuVt3RcZG6X+YjYjcZFP7dflAr3VkjtxWTMyk08FZhFFLhH24nE
 T2NcbO25BI7Oo8gkR2g==
X-Proofpoint-GUID: 0Hh9eU71ygu--4Lo9fiM9wsLQnX-Q-6G
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fd75e7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mgDomjQpAil9CXNVPgQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 0Hh9eU71ygu--4Lo9fiM9wsLQnX-Q-6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080052
X-Rspamd-Queue-Id: B233F4F1F20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106576-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Update the binding documentation to include the compatible string for
PM8010 PMIC which has 2 GPIO modules.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..b8109e6c2a10 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,pm7550-gpio
           - qcom,pm7550ba-gpio
           - qcom,pm8005-gpio
+          - qcom,pm8010-gpio
           - qcom,pm8018-gpio
           - qcom,pm8019-gpio
           - qcom,pm8038-gpio
@@ -134,6 +135,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pm8010-gpio
               - qcom,pmi8950-gpio
               - qcom,pmr735d-gpio
     then:
@@ -465,6 +467,7 @@ $defs:
                  - gpio1-gpio10 for pm7325
                  - gpio1-gpio8 for pm7550ba
                  - gpio1-gpio4 for pm8005
+                 - gpio1-gpio2 for pm8010
                  - gpio1-gpio6 for pm8018
                  - gpio1-gpio12 for pm8038
                  - gpio1-gpio40 for pm8058

-- 
2.43.0


