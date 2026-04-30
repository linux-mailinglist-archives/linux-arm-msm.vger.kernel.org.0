Return-Path: <linux-arm-msm+bounces-105360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLQ9ON9C82kMzAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:54:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 988264A26B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5419F3003368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574B740149B;
	Thu, 30 Apr 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEPnXFMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8y1Whe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBBD402454
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550007; cv=none; b=uoIO4IeBQW9CCT+Ijgkh+XUP+Dss0wJgaeEhugnVQANrAA3UQ0H+i1wbZEUOFVNfEjYFAkrGpYcdMuSo0LqbjKzCb9Gq/nqxaAYLTqs2L5g78YPa+WXsskuP63gXx5bipSa9DmBIxj8TmqV0zVEjiIULkC8m5UwRCUp0DZ02Rdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550007; c=relaxed/simple;
	bh=vikEhhQAY7TXIp5ES59NCIBAjRtu15zwPhvd55/faCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZ010OMVNL2kqyUOG5hhPixzL24oCv3gDzo7w+xFB5DoLbtt0Yzb0A5zMTd9Q+UBxlPVt2Q1LqQ6KIV3ta03NPXMAxeJNCDxUbOOi8IP0Rr8j6bL+zn3wXiWQ/se+/rM4KUFSpGXo+TC/+7Ijot0+30EcOXBrIvl9ugN14SaFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEPnXFMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8y1Whe8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UANCwh914822
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVcuG/PRSIM/38eLRkFer673Cx8cl85lQ3sCn5QG5Uw=; b=KEPnXFMIlPrEM5V4
	8nC7tE5zbPzmLnZsJ6z0qw9gb+IWODv2yJ7svR/GP+U0yW+l/Ke9b8S9xG1TTym0
	Mnlw6+Vb1X5JKKIldlgwq2i1XzQzOs7Y45fjVz9tRvr35/2txGkRH6NN/qyjHVLk
	6GOYioCHCwJOaQ54OitlzFaDsdG7gqQAPLXMF9A36utWhmUdnGIYgcPm7Efh0T/c
	++zSBiLbeP2G5uhrONC394/8Fd3VnR57zndQ8S/E0NEB/KaZo+AqUh8x8d3UFJx+
	oMEzxrUBfgg6EKSqtOGNiZiuxcQAFhIaGlwKvQHZ1RV7DjBD17m3OwnxI3uSj/UB
	S7AlGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3xafwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so9023755ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777550002; x=1778154802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVcuG/PRSIM/38eLRkFer673Cx8cl85lQ3sCn5QG5Uw=;
        b=V8y1Whe8+QiViHO1vn1jyuf1JGnjS7SXRYrz7HnG6vcTOg4uBzJra44ZRj5lX6WZlU
         1Mq+R/JztYOGgBu77hOSkSvqaJG8yLwi2dlM48ibXs1GAEjFV52xAerLAlewp1uQOKml
         +N7xhUwzx7vIMqREfSSW91IA+/2vcPhLN6A40Z6GTnvLAJf1w0ywWor+Llm9HSUBrwlY
         rPt2pfqI5PyZDjrHPy/IYfilK87s4dY9q19T6TysUYLyGnlUhKVB4J6V5WdmjFxXjy2d
         3TmX4lC+pbILVFg5NwC3WvR61vdtw8ki8oYCOnfPDS8/adMFiwmW7JEFiHO3yNd29Ulp
         WEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550002; x=1778154802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVcuG/PRSIM/38eLRkFer673Cx8cl85lQ3sCn5QG5Uw=;
        b=IdGIoQFd5Hgz7uc3nFLTgceqFzR5e0wh+/3Z0cGyOhDOKmEV4N14gXEPLk4Qgos4t8
         w1YP8xO+EWAqUSTUQR41x/wS/8IAWREPjunTMsUJQczV+dcszdCE02gtBv6zq/ZEpppN
         gb/lJmXAG+Ha+11YfIGwB4ZwerudSNjQkuijCmbNn9BxrE+hLIouF+Khd20HFttaK5PH
         JKnvePQXgSHhj4cNZet9H23HBgACInEnw+P4BvfebKGF5NY7o5/tCRUyZ+U/Xr3fh4RT
         kZbI9SwtERIph/j5UUpZ1Lo24TygcYOuPhMT9im/y29zHX9grfQPiYcPSCzxwHZ3JuCR
         LaUg==
X-Gm-Message-State: AOJu0YxbBPhpRVJI1+2H2ZwJme4i9U8t3inXs6j05TAjovn7eBKq66C1
	WwENE2cvM4pnRaUC1ErUIJddwjDLQmM/JnbF4qqm1zMRWVNTAYl4CFBnfTgVgp7isgQryNyGM6F
	NyKhq4rnrhbMJkS77i/TV6VWSXNEafujiElyeQr9NWF1EyHg3Ayy0INPfIeJWvfVSlWWF
X-Gm-Gg: AeBDietr4//Mnq7bLFI6ggIBVWP4FcN+RCDuapEkQo/E7gTDQbr3HI12cn3NJZBkBd9
	zmO3HKi0ofGH2T4zCSoePEy2YDHE6MKoHivHODd3mYIn3NcpRAVMndoBqFwZ9fSe7qwjaegMVva
	Bt9KVOtLB6d+RSDhwGKfVBme9z6jwBnrUKWNJnRWaX7iemrLllwf4Z6iLyKYmeIk5JpoxVhHIby
	DqZc37Ppa0T+T+U9oQDcgQKA/pKT3EwED+ZG47EeKemm6jNX+3+x1RL8fyxySaXPO2mPADcjtH/
	Rl2qp6dAYbX+U95PQTOe4yyx5qHcmoX9WB9iOCnuuIRDnHa/I1ZXS1xMvp4/Vp1HGqL9ffkITXE
	GzlUFQJANZp5p3KQf1qHlMrsFr+5V9BkPtBS6jccKpijtYj4=
X-Received: by 2002:a17:902:b403:b0:2b9:5d18:994a with SMTP id d9443c01a7336-2b9a230481fmr19609665ad.7.1777550002471;
        Thu, 30 Apr 2026 04:53:22 -0700 (PDT)
X-Received: by 2002:a17:902:b403:b0:2b9:5d18:994a with SMTP id d9443c01a7336-2b9a230481fmr19609275ad.7.1777550001996;
        Thu, 30 Apr 2026 04:53:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:21 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:28 +0530
Subject: [PATCH 3/5] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-3-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1054;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zn6uUGX3xthVUxa1M3JyRW75bFS3MIMC78KkLqwsXyM=;
 b=oG97Mr3hq7o3oW4gmpi6A0IpQDxDYkoztOwCzA1dH6PZZWoZb2GXuAJH350pFj451Zs8QlpUu
 9fCN0zdcVp5D9cE3QbLqS+i3qh5eJskM9ww4Qx/h7b0iuU4pwDpsqmZ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfX5bzUqQIrPUgW
 2glIepVsJhSfEO7a51ZECw13hyscs5VdwVI60GKEi0oDP6BtZCD8ta+UKD7P2lr+5q/PiVJIRP5
 5n27M1JHTxbgkJXO2oO8VWNZiWEMwRxzSf41+bVDx9aHRaxQ+WN0WSurAtMxSzi2CWtyKiC+Ggw
 p0VFUK3QtOdaDOwtTA904y82yp5PjNxinyr+Al5YvOlj8wtggpd4sGLs5ceWX2diHGFbOerMHXm
 GDvihn+z6xF8KFjdu9IZH6yKy32dJ6oOrWz68AS2YzW655pwlx2nPTvOP5FCPB1Ty8vtgtJKgWI
 85yRK404SxOk+BL0vq5o9TQPhx1ghCmKOzf/jXe4SVkLAmrE5awP3aPtQBvsl/P/rVguHdGzcaB
 WD6XENcFTZtAQ/gElJ29q+0LD/iSPglni35/9dr77oBAQ0bedulLtvM98/xRQ27uZ3QISojJBKJ
 L54yEp2vOrX3CYBy8Vg==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=69f342b3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ohkS0SODeAR81OU_PL8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: fF8WSPlBO0OZU4G3hcwH6nzU3IDzOi--
X-Proofpoint-ORIG-GUID: fF8WSPlBO0OZU4G3hcwH6nzU3IDzOi--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120
X-Rspamd-Queue-Id: 988264A26B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105360-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Update dt-bindings to add Shikra to QMP Phy list.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 1636285fbe53..8402fe4a96e0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,qcm2290-qmp-usb3-phy
       - qcom,qcs615-qmp-usb3-phy
       - qcom,sdm660-qmp-usb3-phy
+      - qcom,shikra-qmp-usb3-phy
       - qcom,sm6115-qmp-usb3-phy
 
   reg:
@@ -116,6 +117,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qmp-usb3-phy
+              - qcom,shikra-qmp-usb3-phy
               - qcom,sm6115-qmp-usb3-phy
     then:
       properties:

-- 
2.34.1


