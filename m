Return-Path: <linux-arm-msm+bounces-109556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOsUOCzqE2qoHQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:20:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E8F5C6492
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3046B3022AAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74AB397E9D;
	Mon, 25 May 2026 06:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHLv35Kh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isx8k18J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959433291F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690019; cv=none; b=eDkzQPQH/7ugSYvd3snCsxRrUodUwIc2+tG4gpAdiySA+8ClbRrjyTBHkocy1m/xMrgeNSuc8+LOHtFbZTMB3LetioZRAuZDxNGnr8i2IrxIbYUQc1KIwsZjOCiWi61/xm/rwQtUOi6zoRZqdKJlJEWBBKvvj8LNKwV3YLyInC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690019; c=relaxed/simple;
	bh=960m/9Z4WWieVtPzeUUrnPor92ad2oqAsT2Mj7D2XZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L3/DEjDgEJd5mIUiKhH/fOmRKJQTjfmFroZlx81VPehLYwwMykxhv2mwNq3Pd8w7DsOhMsKHJQx9iByzbhLx5EIX/Wnq/6OCp4tbkLpXcC9rGu5xcjLDGsEJ/cXLQJkc2pWyDAiquCH1JBVxW4utZb7PpK9ZtC9A35dmlwhjL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHLv35Kh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isx8k18J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6Dl37723934
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s41+5WfvaShROC2zOmEnUf
	H0d3wfCy6LO58hVmGT8XM=; b=RHLv35Kh1vzxIRgkpWf3Uw+yWk/5fNU0jve7hr
	ay6Sei9Yhm4MpNZ89O/j3XhuXFizncZmEczn9mV8nFMW/ye14338NmIw2tl+NlMK
	9FvU1E/RsxGQ8E7hvLFFnU6wwPSbdOIm3N0sf830QY7eoYKCoiJW0P11eSLhK02K
	Fe3aI902XEgytIRn1ElhQQyQS7JNyYGA6V2qXyNxRgF+ZEwcsFxxXL6RzRTvmjWI
	d9QGmNchdnzf7PJqn2QvktdAeM1YMPvg/veg4L57hFAAd0xsVgIs3lLq5+EJva1G
	Idv2Dnf0461fWrM3jVOcdcq19vDbMU+TbdICfI7PlA8ClZzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w4q12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:20:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso5339474b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690016; x=1780294816; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s41+5WfvaShROC2zOmEnUfH0d3wfCy6LO58hVmGT8XM=;
        b=isx8k18Jhgzs5lGA9XjZI6XK2Dt/LoObpD0EaFnP8tmNandng9ZbU/cxs56IO0kiwU
         qp8a/n+96JVLXi52PbsBMuTeRpJ6zMseIYfKhOxYN2pBG0YMN4AVNna1SYgDnkFhzdDU
         KNgRzdfO8f5NgVtN2wlUtdFRHw++HI9Ok0BzvQqF0xG/q+uYHFL/v4vKW2KBk22Qx7QC
         XrfOlEdoLJZM/+5eA9L/82QBljoo9OE7o6GGnds+AXRTS8A6QFtHL0lUl8mOcVA/uzu4
         nGXtVz2Kupt0/FRKHrriMBZXlaOT0gBbfLnZbffBmY/EApuQI8IUOz9R3DPkA3JDVZFH
         4jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690016; x=1780294816;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s41+5WfvaShROC2zOmEnUfH0d3wfCy6LO58hVmGT8XM=;
        b=n50wr/oIwWMBZP1sbRPcrvG/sq0O80jMI8kAcGe7Ui9Zi98FRq2nCcr+DVFu8rSlOb
         0jGl81rMinXlzcEsI6tUehEguDZBg91TIJ4m5ejcpKAppHXf1r4yCVRg5b/sCKGlHpWT
         ugLbBrjuvkF/VSIfydmJGstcefJ2lB51oAeaRI+y2lJVaOx47aYENNEKxrgvzqHNCyD2
         eGhfjGNgWpb+jEK9k17sPxHM9fK1I6B1U9UMNWx+QN3lPlL/iAlggmazevtY4/0krXUa
         snXFDLIgaoNz3CCfbrqmHVt4fqZzTGO2tQGLvvY43Y3s6HLfZFksVFpoRavRESIVVRY9
         MylA==
X-Gm-Message-State: AOJu0YyHAlh2DFNWbtaj5TNUWv7fdZ7Uf2Gt9SkI4eIan9U70ItlhtJo
	+VXbgiwE8RJ/XmHjS/mkLEsDKSrZ8wvCjaQbA8r8Yi8Gf/3jupfbSohwCGnf15BemCrVCSJmKNq
	icH34oOd+XrqpV3JJEmNZc1nI4re6TSTBhAniKkNOR9oPvx1AGCexONx+9br1V0+Z2oBW
X-Gm-Gg: Acq92OHX4CjgSjdSRn7vJdS5owUWnyCnUul0XbWsXwy1fffSjiIalrBbIf4gPtcjVTm
	bVDGAN6bnwmvDbpIWYgERf3CDk89fGnbXEdKPArJLfPlhaL8tRU4y13LHbhIYYo6t4kYau2gD+0
	3zWkl2gOS4BjgTqIH8tXS1V/knn1tMWp25Pwtl9nj3GGXidHpedFx+s2il8zfxpkmQvlWwupLID
	5/O43JW2u3EljJZvkKAIPjhAUaFALXzbpVaQVxmVV/e2BNHDw0LogDM68h6KqlBkukS1ka/EQ/y
	R+G8trN8iypwyKL0NgqE6+KaYsDRKqpRvZOPnwT77816SDn+4J7ZlYVdblqIwzb5nXBK5SqPAiL
	xfTsKTXVaTdQBIUOGSjfnwTUsSOjeAO4a5c1jn0j6if8slVOmXay0gX94jv9HuTkkSeXeIikFKE
	LS1Q0GI1D5Wf5lVXY=
X-Received: by 2002:a05:6a00:180a:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-8415f141d5fmr12115767b3a.11.1779690016252;
        Sun, 24 May 2026 23:20:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:180a:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-8415f141d5fmr12115749b3a.11.1779690015759;
        Sun, 24 May 2026 23:20:15 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fafe14sm10040849b3a.42.2026.05.24.23.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:20:15 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:19:53 +0800
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Maili cpu-bwmon
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAnqE2oC/y3NTQ6DIBCG4asY1iVBQSpepXExDENlAbZgfxLj3
 Utrl2/yzDcbK5QDFTY2G8v0DCUsqUZ7ahjOkK7Eg6vNOtFp0bcdt6+4JE5olfQOtETDqr1l8uH
 927lMtS0U4jZDwvl7HaGslP8w0/1R/6yHPiguMYZ1bPpeaKGcRmMNeRyc0AN4b5RDKVptFJzBO
 yI27fsHveV/KrwAAAA=
X-Change-ID: 20260512-bwmon-ecb43fda63c9
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690012; l=1281;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=960m/9Z4WWieVtPzeUUrnPor92ad2oqAsT2Mj7D2XZM=;
 b=E9P/oZH7elw6QqgFN5c/EhP+hAaIcUIKw9DSGy9l00gqmNjMDFLyuMb9eZg9sStH+Q1D7wk6g
 FwQX7VttMJ0ArIM9iz0fUPW9YMbX5hEbL/hb0tUg62LKW9kOoI12IZ9
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a13ea21 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=axenEgmuRSwQYXswx6EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MCBTYWx0ZWRfXysTcjVEGbn6c
 tzbuSLH8XfpW+ru2nd3l4urwbgahUdY6afRNL4FcaBBu6XFLjy2c8xzqDjmjHwhTS2R3psaqMNM
 K6Xx6NHkkUQdGl7pe4tm9J00O9dSuCqHzjtOGFf0xYtdU+ZQXVAQmF0na5ocVGwBXRmfeMY2wID
 9Y4QgpM5rM1M3rdDYtX2j05mOT4eiyTmWRcMclMqcv5eM23UdmcQWVDjo1zG2yiOaA/jZ1u8Bj/
 TL91IHy9R1zVduFMyGvJBit73yh97JVgd0jUrM8aB0hztbnqndC/N+ajxBPSbWTquT7Fj3XjuGT
 4VKhXX0d+vtFCXuHhBBtw2TijrT2Cdeqj+PBmTjts6v5eTi1IzB6QwLb7Bm7pu8A3dY0Sbgbb6a
 /98cg+PzX+13WPBK29VC2FOqujNWr7Yp8/8LiLDBUnAeoWsH6BqNSVzJNwPbp+3c/B5VBXa7SkQ
 Dp/NeDDEWKCwRaWpwGA==
X-Proofpoint-ORIG-GUID: wFdS-rAszCMjx8-Gy63-FQYNlvkuEGTt
X-Proofpoint-GUID: wFdS-rAszCMjx8-Gy63-FQYNlvkuEGTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250060
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109556-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85E8F5C6492
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
consistent with the existing pattern used by other recent SoCs such as
sm8750 and kaanapali.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 82b1d94d3010..7989db1aa774 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-cpu-bwmon
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
+              - qcom,maili-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
               - qcom,qcs8300-cpu-bwmon

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-bwmon-ecb43fda63c9

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


