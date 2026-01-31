Return-Path: <linux-arm-msm+bounces-91372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEEuOsgKfmktVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 14:59:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164EC220D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 14:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 331923007ADE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 13:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EAD3563C9;
	Sat, 31 Jan 2026 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYLhIWXp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoM+d/9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9D9355034
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867940; cv=none; b=JaFiDsk+BYRrX0yOMTQ0m+m+h5Qe9OZOoLWdBt+pG+7C67rFuWcG8f67WRhL22DobYpUESxedBqaNTZhmELIaFwgDK6PZ+1wzZYadZsShnl5FdnyIDsRSJBmGLSFPbu2m9peFyMgIaik4OU9dXHlBF9E/2gZNgZe9Ev8d6nmoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867940; c=relaxed/simple;
	bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sogoKqfXLHVN7cW7rAEVfKnA3w1lrWzgQGDp3U6YTjFQsK58bL4sFX0wTv3elajeNXHQIW3ie2pfdhuo5wnBK7MH4ytFm3rVK65C3/XZGjmZ0bWIljSHTbz3/3Om4FuN4jCwfXObsK57AgGo3I0wqz7JKGCysnCNxfL6SD4ir0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYLhIWXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoM+d/9A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4djtr1943293
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=; b=XYLhIWXppzMYAg6b
	05rkqr6meNnYYwE89mgK0yvRl2Agvd0bOgBgXPMGzUktiP0YCfgtSThKPMnHIGjW
	N8kp5CD34s+T1I+hdUTk/DC76PjZ3b2s1U/7wFUMTfuIpTgqKLFHPgSGwUsGAf/B
	Zj2xO79fsiIil3p47sQmPAGVPp0x65tcXFZkZLzSVZY/XcFr0DZqj5SXcbXkTe6V
	KK/NdAp6IYvgST5nT28shAX0riCsIwr8eXr0GBBlSz0FhlT8ektO/NrfuiUnycQQ
	i+xMjfgvjWYwUEC/sQc0YdbBcVOpvOw06oLDZb97s3J21ScYZBMSJ1ybjP3mNGVs
	vA4j6g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awd8ujf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9412e67d171so12598361241.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 05:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769867937; x=1770472737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=FoM+d/9AaHBSBbZgAGWoNYsKtrAxYyJlfWBPqKkrXBY4UHfNlbmVfQbJgsFagaNDJt
         +tUeK1qcBZTJ7M4nCsjDLJvKSqbi9P2nY9nFq+6VxRWUuLUP3+K93utfvub6HEwprqXN
         wCwv4E9SSXiV9SZUK1FpMR8+E1zIErbpo9NGnPm43j9mEg3GSn6Dza0D8J3IMLysyjNs
         VikAeKmpaRY1vke1t2n09ZzvRgaPc87vUuipqBjZfBGbktSsR5gQErf8uXmhtbYpKXaD
         jLUpyJWfu2C0QpmJ3lAkvgMBgNc0QSUnvQyqDjoKTkSJsw4XUXURbhXFLXYNWNRZWpdi
         ELAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867937; x=1770472737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=Z2a875kCp+I6XlNr3xEaMQq4k/g+VzX669TM8RGHVFqAab9g1i6J/E/d47V/n+FJ4F
         LQErXuHbwBmA37uJwMHP8J6r/Ie6o1jXAYyhIv7IJ02Wj+mGFb+bqRHuS7CYmQSSoNS8
         Ofu6fsVL3czY7EbQqRtd7huJeZWvAkLk2e4NWBv9TJbnUCzkG2Xcz9azgfXsjfh6BUge
         I522ycgYvrYuJVHcaNJf3beXUEiXe0zcGuESrbXv7uNaldRQ5UeLEi5wfdbzbCpMaGSr
         9VxWcagK7DbkUSYeHPNHp8PQHaYlujzTUugoTB/+SXnrXypYYUIlXPW3X58CP87iqH3n
         QNgg==
X-Forwarded-Encrypted: i=1; AJvYcCUkGA4dR7co8UFA1RdXqV3nfi57PwLxM5CRP03XrE20+x0QH+cAjtIpOnuZyG4heWlUrMHZ2I42GAoOu3gx@vger.kernel.org
X-Gm-Message-State: AOJu0YyCz/+ZEBmD4YUFPWg5Ds6XuhvhoRsw5ShaXMZqxJBQuS4aOs2H
	ajjjwO2M5IjLzguCOTfb0Gdc5yEZ111gcyER3AlXS3m5UvDgKVomds6VnkkcMksAWtm9uCv2Fzl
	zO5d98O7SRpBIVmKbAm218R8m5j1xjheflM0b23DzxYP92rHpL/SDwrz4FToHqW+87MeL
X-Gm-Gg: AZuq6aLz73XMUSep0dfga9a5COdntzt2DyiTImwuXXSW8tY2zbFlmHPxsM6YPL7Kp5i
	wM3UVgpBb+9WP+SQKfC9jDxBjF7xjhVteJSijG9TaNyHwaAS9cLM86GoBVQz/Oz6YdWUqmZ8YvK
	VjxuoBEXGlnUJUO2aKw6ilefxCYBuMPpxbtRwpuM+Jrg+1K0WsBO0+gOgSF3fYZ16eKa35tBo9s
	yO7DuLTxx47cTW660ekEjME/3E4RPN73zLOv525wbWs9NcRvQ8O1PIPnKFLBNJFmH9dXkCh5oQx
	0BQhyb4cJ2xKdu880PPu7qF5sXcx5l4Mr+44N4MR3Kq+1ApdZOMKije5ZioeJjl7Y42g04dgBnO
	gjbt1ueglgZ49xfcVOY96Yxk03qYUrjVeRyqcCM4z5X8m6Tb/vs8b95tQXMzw70MyLNGi1xabG0
	lwD/AxZWSNNlWbpXeqWXnT4pc=
X-Received: by 2002:a05:6102:5093:b0:5df:abc1:e6b5 with SMTP id ada2fe7eead31-5f8cdc22805mr3029569137.17.1769867936965;
        Sat, 31 Jan 2026 05:58:56 -0800 (PST)
X-Received: by 2002:a05:6102:5093:b0:5df:abc1:e6b5 with SMTP id ada2fe7eead31-5f8cdc22805mr3029562137.17.1769867936572;
        Sat, 31 Jan 2026 05:58:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2373021e87.61.2026.01.31.05.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:58:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:58:52 +0200
Subject: [PATCH v4 3/5] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-venus-iris-flip-switch-v4-3-e10b886771e1@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfgqcv2i4Z2Cu2/nEoloNKxr/I7lBhK4UHDtz5
 k7mYLNxKquJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX4KnAAKCRCLPIo+Aiko
 1UZEB/wMCnEKm1Ku6n/MNhTRxuEemTMOeN95X9pnxNtvBgJjV/vMgNEB4K7wrtaXqybRBS+0ZPG
 JK8NteYIdpzBG7H4gtdSE2zH486LUacGvfk0UmUrj9ETFqBJfkopzWTgxztrS/PT5drCD/K/gl8
 yuzPQl/vCFnDa3dkr6AanofiJ1sGCMyV5xm2aaWboiwjo76oUloe7h/EkKjKruY9uzg2oPHOHVb
 0IAKO74dEztUtmC47HfnStPcMzPotnD+m2pOWWVz+11/eXTHd6CTUVt8IqVMq6rr0q4OniIRdyb
 dwbLMeMosw3BFwYpSPK97siSx99XDG5KaM6Zc7IgvzaS4QwV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BaCwdIPtbD8DcKAaEYvAwaqVqUrBthaw
X-Proofpoint-ORIG-GUID: BaCwdIPtbD8DcKAaEYvAwaqVqUrBthaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDExNyBTYWx0ZWRfX+XVUGHeOJ5aT
 x4liiwCqSsmrF+kB69mD7BL9JMvAHtaCQut7mjTtVFfWtWOZGxExNdVLUYnEhgbshoX7b5leGxa
 ETv+mT/9BsVsz4yQImOwEtaQU6BVIhqItAG1bn+PB0rStbE/iQf3OHoSxoau0V1WlsjTIycGRmd
 7uYjIBLFxK5IZheNHK/0mG/Fba7Sdyt5LXE1n5rzqtZ1XpC+iKGXyOl97EkFW9A+Dn5LdHJHkgZ
 y7BTBThYMVGgMb1Tf5Lz0huNx+FhUOu99NaXsTvpOx4ztx9vDk+KWaq4+ZjXWpDxwjm+bI1p7Z5
 daxRCCYJaME7LsYEUiIcWMbGHPXccoxb6cBbOIvpDssAWSl42HLf0GepXWVH8bzOiyRQWjUUnPT
 ZEzYM105vbWAvfgpfonNzBTHD8hNMTyopVeX8mHVofoBD3lkhwuonq3ZpFfytTniVqlF/R2KdYU
 DoYwi3tJZoDnH3WTzrA==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=697e0aa2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0e9ukYqe-uxmdYkeUVMA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91372-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1164EC220D
X-Rspamd-Action: no action

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

These properties do not accurately describe the hardware.  Future
platforms that are going to support non-TZ setup will use different
semantics and different DT ABI (using the iommu-map property).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3


