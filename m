Return-Path: <linux-arm-msm+bounces-74718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45AB9C7F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E19304E29DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF44D2BE7D1;
	Wed, 24 Sep 2025 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xeu+lEEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1766D273D83
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755838; cv=none; b=NWSww0Aiy8Dv5mdM9SXpSad4HGN87aolXDP0c7mIlNTLT6k74wWF9ZQ0LVCHmEZcoflpHW9z1nbr/QrFzKOkSxGHpYr1+UvQdgSN58KpxqstxYxzq8fArf0D2V5mV1WJwrKS2pFVojbq77njwDP7jOYKq7H7OYWZobVUTQWq85g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755838; c=relaxed/simple;
	bh=NDqSa0uXUcMg8nDk+VWW/r81O87p/6EtZwi1Ub6qOys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7WBhd1qwtJuytl+s1SdN3wIGQtUMGy4RR/6N48brxE2uyYSf/iN772HlYe8K8YhDFmRNU6iuZTQT4LN1ptjP1HUUNm+tSbiKmu9QtYgtkXz5FrR+6ZufUoJrFtF8DDhL0rqPRtJTD6dLTYJlIg2HczITGZ2ZLNiWvspNBBqbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xeu+lEEX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODMWEH023756
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFE1K+StjtZuaU3kr0iFGCxDv2nXJ/zhJydE+MCjc/Q=; b=Xeu+lEEX+YSBb5yb
	RAXRU+x2o/HM4BPg4yFpZaZYqgA0/1mw56aLxJYijfXcyLZyeREwcoKAe+G5tftH
	+WNPcd9NGWM6W4FCOGEcxe4LkhhPHC4IXUeS7CWC/njLy2tDZsOOfPmkGXs/ktsr
	1064ZIg57k0Xt1NSkAJZHh1LX8fN+uGulfGizw+/lTGXhxHk/1unUjLfJcsEql8Z
	kzGu9VUKTjPBMPbHmFAzPnCFuRrRscpAjWQm3f0zKjPjbiFgWLVWtn/APQq+noXO
	wgSQtQU5G4R2+CAVIu9AD1lK7QJw+9QQDnMdAmydIWIcd86SdbX0i61XV76jCqml
	WAWd7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d1k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244570600a1so3259365ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755835; x=1759360635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFE1K+StjtZuaU3kr0iFGCxDv2nXJ/zhJydE+MCjc/Q=;
        b=r/8+KmubMJtcmDyCOrgHGGGKWZ9VoMF9ut9ViKTqLXdOeOfuUn4MBaE32Z0eM0yVu0
         lAPf90QPllrILprhxxP5NFDUb2rUlZ4eY74gpJiLtdkYeZVZmdbSbiItO3QTUNT05/RQ
         5XMG8LC0lpqOfvxH5owuvDdLwpY2SZWzwQWqeNOkjKvtcZTOd2oarM5W+ApgigkEyqgz
         ldwaHvL38qUmu0vOwS3Uy12iOgvuhOO1t7SyONkzwyiukjN5oOYbtyqJtT9WtDabWI6R
         gRYO1ix94/FzWrwyZ4MQmTXAGI7fns2cnFGDtGfzFeQt0AnqZxF/JrWazGQE7o1m/7sY
         M7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuoDIgBg68NDOh3qi7RznBqEfN7uEoQ664XHhvNCy6qtkz32GONVlM1ap2PDj5U8gl/Q9HqI6bI4ZniaLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/Yam7oh1+xshUWoqi9s9Qu+9ZkkKo4wMFRMxIDikEBxpUGtI
	NO8iBkU8vnSu/kFBiJo3aTSZR7SsmKDR6adhFbrf5SKeUVz4Vhw0Nx5uEsKoAUq0Fx7wiePYRZz
	76t7dq4wmbXMrwL5TV8B6SHqnBLSZQOuwSalvsNvEcD4nyi8x2mae1tQQjK4AJNqPW+Ag
X-Gm-Gg: ASbGncvdO0jIGg6unao9k2d3J4oAnb6RiGR94z6fk8PPQqyclNk+iIENrXMDrNvUboT
	keJvw3I2hVkStfNNyJJifbJDix88tR6x9G162d7C9WGZxkKtI4ruR27DvEZSujyEiaUsJdwpoIx
	JqjOHRnObruf0wJ31rIB7qx6Y+SMwYdZa4OgBFI+oflElgG/jL4Cutq1m6cqJ+8OiuvJr+NDFJc
	3egbPm06Si8eVfZpl0/LGc0VqfVWoEfLfhvRTMKkHrVIlebNq01YqFwVF8TKWJmsSn8WBgGKwBl
	JiQF4XoaxuoiXFPq2853xXXxyt9Yh5NrllmTRwkG8Qp7aNS3RfZntwTTMh7noErX7zaUq4fj+sM
	YjsMLgFsSLoabE48=
X-Received: by 2002:a17:902:f60d:b0:267:fa8d:29a6 with SMTP id d9443c01a7336-27ed710a48dmr5412245ad.25.1758755834711;
        Wed, 24 Sep 2025 16:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMlgdGUr/ZjZzWyrhYuIgs/J1eNkrBFx3tTLh5d32nm0isAajEsQqljF2fCZZEsbjYF9SNTA==
X-Received: by 2002:a17:902:f60d:b0:267:fa8d:29a6 with SMTP id d9443c01a7336-27ed710a48dmr5412065ad.25.1758755834290;
        Wed, 24 Sep 2025 16:17:14 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed699cbfesm3892125ad.108.2025.09.24.16.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:17:13 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:17:06 -0700
Subject: [PATCH 1/3] dt-bindings: power: qcom,rpmpd: document the Kaanapali
 RPMh Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pd-v1-1-b78444125c91@oss.qualcomm.com>
References: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755831; l=827;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4qbu+a2M6+r0wYZDajhJwhrLqY8WqPugFl0GB06oldo=;
 b=+/FwS27n6/duMm1JCxEclW5CXGkYV+JJxwphU71pknluHoVMix3RRe9CulBDqK2xIxQWOPTn0
 mWccJk1Cky4ALCw//Qd3l6vT93BsmOLMXflwP+xwCs9CgsAAT6/Jhqy
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d47bfc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0Z_xqJqdlRmHXTOusawA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RbjZmjQsELiQ2kqpoy_TNnbmgDGKdfnZ
X-Proofpoint-ORIG-GUID: RbjZmjQsELiQ2kqpoy_TNnbmgDGKdfnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX0dllLT8EpRCC
 e5+GGGrUskggGBlUUmBAh7VOMmEwdjawBZwtDVoAUI8AYGM2LV8hLQieuz0BQdLGKjouMUa64Zx
 tVQgUkNXh5z6BKi6bI9AjbZU99c82EjKkN0i5pgmBAijAoFPkTNO1cFlAaYU66WRSteFGtFKa0q
 zF7baly70QBUIf1eFPB0gCYpEGO9rjU8/YREjdlsY2WIJu1byP3+w6Q9VcxGesvO2nnK281R4pD
 F4+aXZv2i0CP34voX+1TAth5npKTrsoHA2SV4+yJakc9rzusQkH/bhvmfF5n2LthK+zq5fFI0fO
 hhWzi0VQ2jVjgOFvYPxAP4RVkxZ//SSVWfqKPERqrSIpm4/49TCoFPfah5Ey4KBZGiqw+p2dF/H
 SjFhZqJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Document the RPMh Power Domains on the Kaanapali Platform.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index af5fef872529..27af5b8aa134 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-rpmhpd
+          - qcom,kaanapali-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.25.1


