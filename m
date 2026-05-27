Return-Path: <linux-arm-msm+bounces-109955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJNcKT+9FmplqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:45:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D995E2009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99ACA30620F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FED13ED12D;
	Wed, 27 May 2026 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O409bIrB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDlxVkRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1153EBF02
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875030; cv=none; b=mhmbySigtaW7/wxoRrCCVjI0MZoeBd+0plrAdrw0hgkzPIFQpQHovzqfITktz2ieqA5AthmBVYjLwpjz+GKEyr2PC0T0M5TFOK7zwa8aaq1ocPQooZWdBqpzbPBUf188hPC59MohlNK5BXE/sMu8hR2SK1mSKsS2rQU54t/bHzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875030; c=relaxed/simple;
	bh=8CCmb1vf5Xo9FjKwBoU3h3S8PCw2w4l6hhbrHw4YAZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHlTQOt6tAwg9JQLDDl+6mFuck6FIJ423ElMJygDzVVGKerCHoZAzncJsVpxFIo6RwTr712EMp7A9YWdU0IDb7GFQx0WaElvqXiTfsLo/4TzakO09vrRWTFXJPkV/4SVqk2Sn7kDj48tkpGOOBWuoPyl6fU/RIFm5ErjDJk6RtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O409bIrB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDlxVkRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mR7k879279
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LQgmjY0zwEZ
	89X1Xk4mdyExHv8CNhlulbpnXFW5LEIY=; b=O409bIrBoWoUzkYezXfOX9T5ueJ
	GXCT9LLQihkg7gkZDjzvZPtb+yIPtEv27+AtHJzZG719Ba5TJ0XC/h0l4ZvMj3AV
	ntrmcI0hDeCOjJ7KMs3e5PBDQQT9Onax9dJpe/aCbUL8cLgvcR6OUtyFl8/3F+yc
	TEQEn5ArrcJeEaxzr0ChFTwRtS6HYkq0PBmetHaA0bp4AtK5idkRQeZ6R9SK5tP8
	0Y71T1tzBjhXtY2mhCEgGasWWBMhWzaokuexNBD4ubTX36mA3/7Q0+/q1LRMRTX1
	1x2Es7j6ob6uodBqLzYD6n+DPUS1WVyHxkO5r8eDqE+cOfnyYIynYNvI6ZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrcpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so127685165ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875026; x=1780479826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQgmjY0zwEZ89X1Xk4mdyExHv8CNhlulbpnXFW5LEIY=;
        b=eDlxVkRWDu3TTtj/cCAVxDJNqVzmW0Uj423k9PX4bPBBOpbFE9E8um8OQninjg7C2i
         f2DaZ/JYbSRkJHuY93S9IfX0Z7AaEyLZ5d8n2Hb4IxW8o78yEbQQ0kuved3dNr+NM+iQ
         nys37aXt78rJW3Vzg6VYBZckxjsAy0Pg47ZCmbIaP9MHlE3ia2MsEPiY2eS9kq8x3Cwz
         i2OoP0bC7O4F2e6S6WQylxScViHT3a1/PSbgqGdqTbA3j7lRkJX5Y9Wqc7991pov9t1+
         Xk7HP+cvnDEd5pjtBYufz715czi71rOAxvlXxwQ2c87Od6hWsqjmXjsTJpMgpZyG6xG9
         RP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875026; x=1780479826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQgmjY0zwEZ89X1Xk4mdyExHv8CNhlulbpnXFW5LEIY=;
        b=VsxLQ9t1+jfwO3q4DFc8DjH06RFOf9+xhBMO14l0Xs24A5gD+3sH9koLVOGRCplBak
         hPT5H/vl31wgUKIll5UY38CgZMg1BD5WcVutFbjbRhSp7Pm0g2N8MbvWi+SGKYOM2Vp7
         KtybuRKh0431pxlVJALiWeQTcBM1FkFjvr9tN1/z2p6Ms2Si3x3A52cAUVt7JYWNHAIi
         MoUt86g2cTOXPZa0NAp58D4fQW0cqnI5h1YXopbGxazcW7KFEFZSqEw0vVuLZupEuPR9
         kSmaPqDhEprw2HU9KBEan2I8GToAh6fdn0cVenK6bb8dZi5YlWdXm0zzetfovilnpELH
         +qjg==
X-Forwarded-Encrypted: i=1; AFNElJ/xe8ZFOE1piYgKaoIng2dB0IALCAe/DgA7Q1ItbcDWr6rxF0tJgibWECxg6iC4xBs07fPW17cVcEThmnfe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6tPDhud2zZRVd2RUGS1TO7Uea38V1rb9Tjebag3L7amBTgA/C
	eADc93J/3RLEBWK0mPtQLafCsjH0DYhhAEnitXOR0akMf2tLymoYUq55IIuGg18eizbrV0WaCOO
	vpTynnZqJvB/dWcB9xuhC91vje12dv1TkSOlOk7savJSgPCI8OmQf+AK5X0i1do0X6rQu
X-Gm-Gg: Acq92OHpGIJGPQ5PdrdZLQLsNhY6/tOoUzJGSvNtWzS1n+l8Us/FM2BK95+ctZ4/TFn
	b0Mxg9y/weagzgY08d7abhB3eSyhIEa+S3KHKNILnkcw4BoB21PXrd73jTiqfeyUxe2RJR+biQT
	r5geLGi9zjtdLfcsaD8emx2GG3MZMQyMIZJOcxkHflUzwGsJ214d/prBtoKXrztOm8dMsCcogyi
	6D1WDxf6SRewQyDxVu1i58W/OV71Glhywac0UyAekYg3HOFLn7uw3uoExwHCfaj6ljAZ5D0savK
	fpcSfNbBzh4cOKHK1aIVYfScooEDrTQqJZD/wOlwZ4mgKeNmnTB7Tm9tkF86dHSej86Ez1ZrMmK
	2avD7cXnz00TXuE0bKdpyt4hVXxHhkwlUf/0/2vpoa2Tm9+Fy
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241582125ad.5.1779875026492;
        Wed, 27 May 2026 02:43:46 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241581745ad.5.1779875025875;
        Wed, 27 May 2026 02:43:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 01/24] dt-bindings: qcom,pdc: Fix OS DRV reg size in example
Date: Wed, 27 May 2026 15:13:06 +0530
Message-ID: <20260527094333.2311731-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXwQcP7VtRFt6M
 9wrpLN0yJhxA9r2+qiABlDX8cHSOQg4MNaMntdPHC4T4jNoYwYoVMwWT9uIt0VLsSO77ynxSQD3
 /v5lqjJ8vtPY6pUKuMXiUfn1KDT8EuoOVvYsfohttJjUekPf6qwZ6aOS3NQ3G0QBnPSkzgSWz9Y
 xHlC3BHwM7FOiRh9uQ8FvDIgAnwgBBu/FhQhC7jykAZr2BFszvc0oMFbuQp+UKToFgebpX3i0vJ
 TIDNyZoujXFSzpTMs7fALki0XzoxuqoLb31npocs8Lgm8d8CUUKC2wR6GVjIg6L+/L6xm86SOB5
 wUcX5RpTUVcHaVTnRiR9y0Ji9oJasNTNvZzA/MY0/CAIk0Ci7z0WCLGPw2utVgFJ64GnSm3r/r6
 ezVq51xqpa5qE6A/N2RG3VWjyrUQBqAkX9fee6qSkU4Lurn58R5q4LS9CenmmZVNbGHtrcq51Qg
 ZeDAP5smyzNIvA1yNyA==
X-Proofpoint-GUID: p04W2DdnReAv-FmGtDoOeMLWg6whpy6T
X-Proofpoint-ORIG-GUID: p04W2DdnReAv-FmGtDoOeMLWg6whpy6T
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16bcd3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=o-GPFHBAWWZfrCT4DHwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109955-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13D995E2009
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PDC instances have multiple 0x10000-byte DRV regions, with each region
serving a specific client like HLOS (High level operating system),
TrustZone, Hypervisor etc.,. The OS-visible PDC instance should uses its
own DRV region, while other DRV regions belong to other clients.

Update the binding example to describe a single OS DRV region by
changing the reg size from 0x30000 to 0x10000. This matches the example
with the OS-facing PDC nodes used on Qualcomm platforms and avoids
suggesting that the example should span multiple client regions.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 07a46c5457a4..607b0e74de68 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -99,7 +99,7 @@ examples:
 
     pdc: interrupt-controller@b220000 {
         compatible = "qcom,sdm845-pdc", "qcom,pdc";
-        reg = <0xb220000 0x30000>;
+        reg = <0xb220000 0x10000>;
         qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
         #interrupt-cells = <2>;
         interrupt-parent = <&intc>;
-- 
2.53.0


