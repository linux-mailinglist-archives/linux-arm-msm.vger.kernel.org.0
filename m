Return-Path: <linux-arm-msm+bounces-105999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EjULbQd+mkJJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:41:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2E4D17D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC825300F758
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 16:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A7148C8BD;
	Tue,  5 May 2026 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yd4oFpP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duAUqXbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955B48B373
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999282; cv=none; b=bcXakhnqV8zg83r+x4wMifzthTcUsSOs5jhCTdwgo98DbhaAzQEYSgovgsCWBkUeWKLApuEC56foXMBM84XPurejNi2d5gh5k+UlARjLlFrhAmHJboXBtQrNmMQo5G+XRBIaifOKWVZVcIjNuUTDdcMrINiGE0KRCq+jxw5qiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999282; c=relaxed/simple;
	bh=n7q+QSOXUUtcuOdBhewHOjwiqkfPLy8l2ei+/7DfsXA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rYuzNXSdvxG54nhhLEJw4V7sM9vEaAdqdscv2SmJK/loh3FA/iaFWteBV+t55K7Z0/ppx5ZyWfXT1oAXOdUE3kqyAdkEDmE7UT4wquhTTijyGqdDRDELJ6rUMHYEtiPNk3BbshAmuhxvh4ildClqWsTC/3futeJDZHNByMr42Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yd4oFpP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duAUqXbU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645FtsAR2445713
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 16:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sj+UnhV/J0x1Z5m/JKJpix
	jg6zZ5soqB8xlRmp4waiY=; b=Yd4oFpP9CBs63EGCPKoRhv/Kh1nMDRaKmVB3WB
	CtNJ9K6sFytNjTlsKd0nD2xxTBOvTMPCIkrZToOund6szUxryqINF1GHsdpfIiTv
	W94I4ieDGX03FIAOSmzysmLlzkqTbaDtzh1FhUrqz3sLKi2tL14hI2DEOXeosG/d
	gdFiMW9iBvfvt9GlB7oAQIFl6RNhKBEylXdCuhtYf99depDRX3iT5zKeUcz67Dbv
	3+ADCQAMtMbYhM5s1TT5bqzMTG1GraS8fY9fsQqt3SJooE0POc51DMZBobJr/IFD
	JH4L3+OJcnBYAMUTNKgJlrQs3Jnu6eMDP0lG54vbmdCS7rpQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dykmhr720-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 16:41:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3653638874cso2917095a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999279; x=1778604079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj+UnhV/J0x1Z5m/JKJpixjg6zZ5soqB8xlRmp4waiY=;
        b=duAUqXbUxIJPFBbaJkAhr9Ik9B60Bm+MSg9w1F81gJBAZERYe9vPPDBufXmvtT9Eib
         7v9QxSDjLOBHIVsXMU4t20lsGoB5nAjL5hwv+tn004gFL8qDNH6j09vNLMnzy+ZyRgnW
         ttdAm1YodpOv6OvCt0UeHhkcdOcPPppgcUBI5O3+ko+idQ18tgYAYqCau9WSxja6v1f9
         Q5ngoGjTg14Z83gZDPwyr3rLvYtIWMXuxUBiN5C/P23i86CTcXq7KB/JLEMhtRQTxlIs
         R8ZQhSRBpZgzOTVC0amGBSqeXhWiUB6aodgamYOnIuViHpuJVjWOA/mekvah6svlqRif
         AuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999279; x=1778604079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj+UnhV/J0x1Z5m/JKJpixjg6zZ5soqB8xlRmp4waiY=;
        b=RNuf6VUcyp60JmDmOblU8h0UJ5OAFTXZn3SXZsaLiFUStvM2McVTR6+SzeiENS+oKf
         fsjgzrMtJDJ7BMjD6M7QhlHRgdDWnpeGapqVbsP/2/bzl8r39bvtrkR5scUtsKG2Asfg
         h1GICuoyFkGv1WaUlmBcb0i7CcfcG4/GNWe/CesHuvlTYdEN/dsUXy75xU20yOvtiKQE
         YEKIh4weokeYuYH5zhGdHyh0O1YhwezZv9w1O2AkJUHjRwgjLExAmzZA+DL81erXb6nR
         wkjXuxj62yMSHf9munsxVCn0i0cNmyqnct+ZYkLVhzGpKLyhxw5MdYb86bg2kD1j+cM1
         yjkQ==
X-Gm-Message-State: AOJu0Yw6HLMDviCG6Pq1RzKSkmiN6YUb4vpOTcT0fGkBFKhzUn4bw5W0
	smqtqg+ReD/ZDb1kNwB4RSLyzR3BLg5sOsl5q2iYWuPNbdGutCm4CqD/433gfjZIBOmZFm57Nct
	cIQYTjutFVJfVJGNAK1bOzKQSkeUHEXZFRRKAs8aO6dHMVvGJsNyZe2bdbfsR0uOCTeIJ
X-Gm-Gg: AeBDietFjK2fxp+5L/Imh2Q6V7UfUmFyedXbcWS+FDmJ2KKMEpBxTYc5zraYSdvD1Cu
	oQgkQQNeJnhr3WqZWqyUNjQBT13j08YfAWym/IWXnq29jOHgQOMzshn38pcZjxlRVbFGPuUBSrQ
	ImQUysSD3ZeUaMWVgugxd27+J8LR/lYBRbWi9hSEaImTnQt/NFIBdDa7vpN0DjxFQkYGS6u8GGr
	QrLTSiC3AuQ+mwiROkGpWG82WxCtzhkr0N5Pk0V2cxQyeaxuOiAg2MiXAuDfwIoB2a24EbxPkpG
	8YkxKVgDqUwj4VfoKiliah6msx8pMQcRk4zUeQRmyQcYfIuAQNWibaJ5gL9oFY4B8DXrk0zIrLI
	z8SsMn0MXzM5eePUFi7gFYKVvx8ZpF8BILiqkPLMosjFj2Ai1GauB+0A=
X-Received: by 2002:a17:90b:44:b0:35e:3e86:e2d3 with SMTP id 98e67ed59e1d1-3650cdd0a99mr14726265a91.10.1777999278860;
        Tue, 05 May 2026 09:41:18 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:35e:3e86:e2d3 with SMTP id 98e67ed59e1d1-3650cdd0a99mr14726238a91.10.1777999278386;
        Tue, 05 May 2026 09:41:18 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm17944836a91.9.2026.05.05.09.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:41:17 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add interconnect support for Qualcomm Shikra SoC
Date: Tue, 05 May 2026 16:41:10 +0000
Message-Id: <20260505-shikra_icc-v3-0-8e03ff27c007@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYd+mkC/23MQQrCMBCF4atI1qbMJGlrXXkPEanpxAZto4kGp
 fTupnWhgpuBf+B9AwvkLQW2XgzMU7TBuj6FXC6Ybuv+SNw2qZkAUYAUwENrT77eW635AY0mo3I
 UomFpcPFk7GPGtrvUrQ0355+zHXH6vhklqm8mIgdOUsmqAkmNwY0LIbve67N2XZelwyYtio+Qg
 /oRRBJWCGWBJRIg/BHGcXwBmu8G2+0AAAA=
X-Change-ID: 20260320-shikra_icc-b1fcef45122d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=X6Zi7mTe c=1 sm=1 tr=0 ts=69fa1daf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=OZudk8sDxFVV_aZhaj8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: OaXgtEOSpWSxmkISSzoWrB9ptCdR6W_8
X-Proofpoint-GUID: OaXgtEOSpWSxmkISSzoWrB9ptCdR6W_8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfX6FvyTC3AnKkk
 HNXJldcxRPpMp/DH5/3CpMJwm9knMTMRkgKIHjkRuneOio3SjORb0WTP1WDozcmhfezTzUmPlWP
 UvkEnYKbtVYLgPUIFqFRQmDv4fA8EpIrK6v+IDiarCHtm6AImjnLVrvOZoH1RDg+BEepLBvKz1M
 nFF/lE3AXXUcMNjQfXj6QFVwV6yS4AGbuUPIxc0Jw83EJzJKJmOnfdfj19u0TGe7wkOP1m3FC9z
 tjbHrZ4uqs8A83DYfBh08YTA4/g59YUI5A33ORqpHJc/uwGZCjoxiP7s3zIA1sa3B5JVcQ1nNyi
 OcI6t+3vuTUlMAtgfha/6ARDUnUjYsaN1JbRHPL9fHIRy4Nqqbi1SPqE1XBKM0+OUWHl1G/vXek
 71xPsr9+5jlJnG2slf+u+18jMQqWOWvRFtAbJCOHfGR/o3dHlHkQqO+yD1ZaCdZwfrN9JmP+bNw
 L9o/7gA/DAcStQ9At5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050160
X-Rspamd-Queue-Id: 59B2E4D17D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105999-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add interconnect dt-bindings and RPM-based interconnect driver support
for Qualcomm Shikra SoC.

Device tree changes aren't part of this series and will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v3:
 - Drop labels from dt-bindings example [Krzysztof]
 - Link to v2: https://patch.msgid.link/20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com

Changes in v2:
 - dt-bindings update to disallow patternProperties for the NoCs
   which don't have children [Krzysztof].
 - Drop the redundant clock property checks for child NoCs at
   top-level allOf:if:then:properties: in dt-bindings [Krzysztof].
 - Link to v1: https://patch.msgid.link/20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPM Network-On-Chip interconnect in Shikra SoC
      interconnect: qcom: add Shikra interconnect provider driver

 .../bindings/interconnect/qcom,shikra.yaml         |  134 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/shikra.c                 | 1837 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,shikra.h     |  121 ++
 5 files changed, 2103 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260320-shikra_icc-b1fcef45122d

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


