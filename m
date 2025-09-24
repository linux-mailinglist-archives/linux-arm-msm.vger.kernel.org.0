Return-Path: <linux-arm-msm+bounces-74747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEEFB9C966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73D3C320156
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A0E2C0289;
	Wed, 24 Sep 2025 23:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULgDI5fK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187872BD5B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756708; cv=none; b=GG8le4m+IEq68qVtpIPJXFpNB399Q/Cv8vQie12PR56l8MLwK0AakfsECz9b8Rq9Nr4/vtXvyojTC3ZHsBygYa644ZxxHkscaJCVbwYt42QBCJupr/rYBIr5IP98dqujH5vlo95L56UKRXVu3BmFXR+QcfVPzmXI/yv9f2S4wps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756708; c=relaxed/simple;
	bh=a6tErwu444vJ3lJdP8AAwFEzMZveKsdfUtifIz4DZO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJnVEe7FpHuUZ+ytgL1wIIomjQ+tSb8G1lEpVI7NcZaG74AfJqiiS13WnQi2yH5Wdh9nBckxDKk+7SK1fMksKR9o+gtPXpV8AhGTLoL9R8+WhLOG5YVqvyiHaWyjixt5YXWiIO8sAdx+rGDE4ZxK3MoHi6YTcUX4BSaW00K89go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULgDI5fK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCiXSx002657
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pnDm6xqDtoLBGOZnN8uGeh/XS9FEtKnaAOUWoj6fMGM=; b=ULgDI5fKMgZDhtYv
	PKJJSFzYb3lNWcChgziUZtWE13cAPKkplDrmm7Z9gQjaMAq8IN8kYjUCM9KBTaZP
	/V57mXLAb6K9wYLj44noUgttkpZj09VsJ0kylUB72xQlxG3Efn9lf2kDTLvB8PLS
	rkJgbcTaDQ9AdzLfk6gfEbFqtLgXFkZgpVfMqt8JRcGi09wlrvUsvPwAGmoGkk1Q
	gC2dj6NeWnfM9IWxvOiOWm7GOHvqQ5iygwevhafbZP7Z0KDEMBKXBZrWNW40R5ua
	LQC5UmEXNG4J2EbUmzKHQfrs11HPMGxvyU7qAm4Z/bVrXSWvyj6sRr2uNdQnTCKK
	qrWhlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0kfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so547105a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756704; x=1759361504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnDm6xqDtoLBGOZnN8uGeh/XS9FEtKnaAOUWoj6fMGM=;
        b=rDTbmdeneoLXtV/DHVim11u2j+qGzSPYzfYn/Wln1U4wJMXeSh4cbmkrieCGFM0QQv
         dyWlWb0GaMxvMIREA8QxvVkvBz/d4StR/gPkHF64DQhcJilt/fApXPQ15yjNQU07pZfA
         uk7UW+z0LqrIdiOLpk/JPaSFUnsX+8KySGY5VxPwON6LJOHMDnnjHAwcr7mSVrQ55qEF
         WPXcny/AKvy04Zsvfl7cz5DwhxSN8+TL1n8SOJv6IJ11o5KfvE0tJRCx5xHvsXt4Ya6a
         RIjbubzFSN1xe7wt4w8WXBjF/1CS6Ttdg8iV4yByvOHx4htypQCp4qU/N2Rl5+nE2m9W
         J0fA==
X-Gm-Message-State: AOJu0YwVoAnqrRMynRHx7Mdg5sgUobscSrb8+Fz1iBbdLZ95tjRqfkDU
	LVwiZD4OJV6dx035k4LClj59erziIry4U9Q5mfYZfzcbIVfHCFgjxOxQ0VgHReIToD8TtHQAy5G
	DSMABF5zXHOz8VRNpn3WV1YI8GqYKTOyBYr4T3mfvcm9WF9F8OqkSaGOLSUU8TKL+Yhqa
X-Gm-Gg: ASbGnctnEpn+7LHFYG9v8QaxbW59rCQWNV6hxcIcYZxdgz6nnsH0HrQ7I3IP52cFBGz
	KQbWzhBrcGHChJW3N7NvGyAkLub20dOLJ3fIB52l/ICKqvCNU1249gIg4W5WNaZx8nUYkX2ri3Z
	xZTO/Nqx3bepEyiBGzirTsLmlCs2MtfwEqZwemNDGxrHkmpE6NVuV1ORLL2B2oZqRE1Edsz9OIb
	4UurOzMJ09PVTO+KBQfrpSlylICHuuTJdkSCp1284lojGYQRnMuIVA5jKC9TQqAwsrUKpD54cqD
	AVQp3ZRdrjRmoGWzg8Eh3rWlKKJu9bYWoa5y/51GAi5XWuhQeTc3j4TPVsav34kNa8ecJnPfOwl
	qgNUDEqHT/j1ZUfs=
X-Received: by 2002:a17:90b:380a:b0:329:e9da:35e9 with SMTP id 98e67ed59e1d1-3342a2574bdmr1377893a91.2.1758756704617;
        Wed, 24 Sep 2025 16:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+iQOgjYJEYbcOSaBV1oIz8mqjYSCEc/JNX+/GGUPAp/+PU13GrgkljYC04qfxOHTn+4zmdw==
X-Received: by 2002:a17:90b:380a:b0:329:e9da:35e9 with SMTP id 98e67ed59e1d1-3342a2574bdmr1377865a91.2.1758756704129;
        Wed, 24 Sep 2025 16:31:44 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33474f14e4bsm194322a91.28.2025.09.24.16.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:31:43 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:31:38 -0700
Subject: [PATCH 3/3] dt-bindings: firmware: qcom,scm: document SCM on
 Kaanapali SOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-soc-binding-v1-3-93a072e174f9@oss.qualcomm.com>
References: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
In-Reply-To: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756699; l=1090;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=a6tErwu444vJ3lJdP8AAwFEzMZveKsdfUtifIz4DZO8=;
 b=Zt0YUnIbbTeyoD644i05+8I/uPnlkDvSPxaRdkrHYXXym6Je36Fsp/N9TkfYCBxDUVPdmz1jK
 pJU1wiTtS38AYsdcDC3MM/uwGJ4Tnej6c4FcYh6OGx7788NJZpG9Gka
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: iPkVhVG_dBza3LqN9N2VN9_crPf8NQJp
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d47f61 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ffYJIid-Q94gFHaen9MA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX/n0GYf8tdBs6
 GhmlFqs9xJOuWp9Y45p2jesN/FlxcTOXu+d/zKS6ROXIDDvEEsOIYXn5p6H9YN2/QAIW1Nblwwj
 b92dH8ahXVadYy7vhHoynL2bGwJPcrUtGNkyBjruem3tfLWtlZR41li5DR0fVHeTdVd+p0K8o+c
 DXA6XApX3ku995/SJdWYVuRQYWP/HyBSNyGZU/32zdkUI2cAYgdm/JByZ+s+WyKDRVOWSYx7ADg
 NqUecQhidloe8LULoa+aNjVJ2Nxywe0I0sn6gMCKJBdai+Gs5p8nyZjaMyMPwSwJ2wS4Jb0ZhbS
 GCizbJUBnqoTrK+dWUZNwVfLorhVWCCE4wRTW37JX9T1XNBaGzK0jhsu+Kr0/25pSbvUk8e9Nmm
 7E3sG4We
X-Proofpoint-ORIG-GUID: iPkVhVG_dBza3LqN9N2VN9_crPf8NQJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

Document scm compatible for the Qualcomm Kaanapali SoC. It is an interface
to communicate to the secure firmware.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index ef97faac7e47..340b754e6322 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,scm-ipq806x
           - qcom,scm-ipq8074
           - qcom,scm-ipq9574
+          - qcom,scm-kaanapali
           - qcom,scm-mdm9607
           - qcom,scm-milos
           - qcom,scm-msm8226
@@ -202,6 +203,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-kaanapali
                 - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550

-- 
2.25.1


