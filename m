Return-Path: <linux-arm-msm+bounces-73632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DD3B58CC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 06:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 310991BC193E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 04:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A69828726D;
	Tue, 16 Sep 2025 04:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3KIVLyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B2231A24
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757996665; cv=none; b=jkGUPCDkbTX3YRAN2YEVyLREEBd5tBy9+MRULjnoUejsvqdBhgVPiz860OpzrjbLIJE1MFy6OJtHSd3TEyMRLHsMFpog8gu/srq981bJCN2mxOxRo+soQxJdYSei5/pga0q7IIIDeH0iNOlFEz4fBWPX8MO6JQNkFZKRK+qOMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757996665; c=relaxed/simple;
	bh=GHBY92tAisIF0dCXKGH0+ZSrCpQeHtS7vASR7J/okEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVT8IqO8XJLpos6ex2RvJdknUV0bVBuNi4eWDLKNC3jHmBBwYnw1x41GE9ZnoQrgOpjfR8b+vrb/kmsvC8la00TvtL8Z/uDo/bNBJsrj1muh1jpVXC7vesxp3smHz00pDf/y6fxGtPJo/KXMj+AiWdyTa1nwRae2cjvjxJ8elGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3KIVLyo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3pmH5019594
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cc5PmNjUmGl7DIxKUn3MAHeUF2bV5HooJbNXG3CREX0=; b=Q3KIVLyoQkdJdQx2
	xPnYYZF5cJov6x90gm9VaTu43YWkBOeJfpl7IOnulNsVGUlbobqnpvs90eQl82RB
	LTe8NFHHUWk3yLXJaiXTEkclY8uzE2WleFme6vGGI3KVqJ3TAQhdGw2pOJ3vxMJJ
	9HcTDBjpcbuxHDFZ2nHCdqU2vLjXaBiZ92Kf4gux33zkzYQdbGKRze/cCYjZG7Ji
	y3rKEiCJkAWv4Ice7v4eh3JZgvIA2/ISxBpTr1AzkTNrSIsVEtzjUMMZ0tGtmqlt
	FWuLUxWQY7x4Ibv+mnuZuZKZiBWhPYm0nDDN4TCo8H6gguJrcQ3igdnCMNwli/bf
	H5Sbeg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma7cky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:24:22 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-43b9a919030so2868909b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 21:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996662; x=1758601462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cc5PmNjUmGl7DIxKUn3MAHeUF2bV5HooJbNXG3CREX0=;
        b=dO96yxKAbuGZuPt7crxqHVskePmO1fZvT7QsYq/DrgaB1Uvqbe1q9v3jQx664jiGBx
         J/daewfopMDJJ9qVrFcDHYGzUsFGgDNLcpej/TMJL+m/lH8jG7RAqIvm1+orXyhr1t+x
         wZvazI+b/a781adKTXY9ls4FhO8TJ1yjwI/sLOSxcQOB2BxTxRzjUqzZ+fqC+2tSH38K
         geddWbwD7QepkQw1S4M9DmEt8rqtms0trG3ZSzLwRI06iCiCvh1WDI8bHHhdMj6c1Y15
         szkfJxsZJfbEU+ggyLYT7rStaXHL156kamBXYht5XM8rKAt/ATncLs9HSPGnubhdkn9/
         UwvQ==
X-Gm-Message-State: AOJu0YzQGccbQ3Ao+k7VMykXPhPFEzs7DkfJPc0NAIiLb9rHc6xheQfL
	qMYhGdNs6mFgvp4inYQBU6o9AKJ1dCP/Yt0DPtjxBoh4v37WyMIEQz7WLT7PqSe9M3Fph9LXxxl
	85uDeLklm5RFtOxkXH64Dg3jjwmpC9lun7HMDOa2iu1k1dVcYiS8KnP8jMIJzQ0CDg9ap
X-Gm-Gg: ASbGncvX1FDFghwzwot4lW9h8QOTQl5vTXrbH3HMT9h56047SLHxKAsPbDNxC0deSxQ
	TMH+m1S6vX8glz6rEi4lkwB2ld3DBHIhrPoZEqaiX6yS19fVyW9yTC76oUg8tWJE5F9iLFzbONF
	v6M11Awbz6NSmJFWkyUWVz6l+G3L3L3ZsbHuYT3sQMjf3YD+ZVufNhxGs4wHYW8ufhi/qgQKOVv
	Lz9LXZCb3Dh9Zgxp9Po6s0T9qQ87tlVH9v4qOaTtQIaofEocQ7b6wYySl1mLg5Y1FO0Esr1/CHf
	kE68YCyh/Rq24HWfDd8RqTOWjzsIgg1tyxIqcmfoJ0pFyRD1mCUzEb5+9tkKIMPaAXs6Jrj40fm
	oOqaV+MJz0klsvVbrnDtu38SEzvKxJpYI9rhXi+0=
X-Received: by 2002:a05:6808:4490:b0:43d:1ffb:1b05 with SMTP id 5614622812f47-43d3f3dd73bmr422918b6e.20.1757996662040;
        Mon, 15 Sep 2025 21:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlaxewLL3VqDMROXpJTxeLcCDfT6N/XjGMO6WD+HAgxAXLq4aurM24nOrmruFkhfcQRuwwwA==
X-Received: by 2002:a05:6808:4490:b0:43d:1ffb:1b05 with SMTP id 5614622812f47-43d3f3dd73bmr422901b6e.20.1757996661639;
        Mon, 15 Sep 2025 21:24:21 -0700 (PDT)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82a73075sm2772862b6e.19.2025.09.15.21.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 21:24:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 23:24:15 -0500
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Particle
 Industries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-tachyon-v2-1-4f8b02a17512@oss.qualcomm.com>
References: <20250915-tachyon-v2-0-4f8b02a17512@oss.qualcomm.com>
In-Reply-To: <20250915-tachyon-v2-0-4f8b02a17512@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=998;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=GHBY92tAisIF0dCXKGH0+ZSrCpQeHtS7vASR7J/okEk=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBoyOZzJ4GzmAznlrXAIhLFr8p8TnhRurfJbRu6a
 HNmJeKmj+aJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaMjmcxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXz9Q/9EI/fZnRos8igzHD+r34ErqTE+lspYe4CYk1bgpU
 OuSa1oyKiCaUkYUu5vVhkyNTlqbAzW7l4VgUT0j4W28o6YGEHjj0RyoeSTK15YSytQdIW1rVO7g
 VzPC7lXbYfdBXZy8udEI2kl6XLO7kffWVbEowh09zEzb/jzGYZq3AnfLGe8LAfIWICzuzAV+YmM
 A7RID4JSY49vOy3wVoks9FKE1MHfWm+yZgegkcxzZ0EHPZN2DjTRzAoJevoPIB9U8zEyCI0nYgX
 ZIjookm5YSu1hTJzmNAVlCQbot7SXi9PFDjuQKywHTkU3FF6eTAI+ZSHfDbufc5X0UMJQU2C75B
 lkK1DRSkqvWvDWCzfpeikWn1XuxXTtKnzeGlqkLSnE+ngbWAPkLIJYWK/dsXtN9vHDDZRv6RUXG
 9zLu3glhX5ylBq5y39dxucVRCTX7sGfe3LVNLG9x2pOsEjweoVnJvWqBd4ByzeFh2iIut/D/p9u
 Fnc8I5JmsHTYVj3ibhBJk2gz4jowrXMPTd1LvNyW34Fu6abPpjRwq2JyHGQ18ir3VE8KAxwTRa2
 IaUXepP/LGL7/uDJov7W2CN/bho29f0yTFlYY88GBYaWbm+nouCQ/LGb3q4qW69YuGDzQ6XAIQ9
 IlVTXIrQql3HUwszx9S1VPQaMUqih7oqHdgpM9jCoyws=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfXwt8xFcQammnr
 di5o2to+FtYJXAttBKWyAO1UcIHsgpVQ+qwXCZevgshidNTo1JIcrdxnYCD+Z1lcYyEtkPBRKou
 xog1XZxKtqC07VYnOXBGSamCBy1pbXxvNzK0mW8HX/KiYs+EPprIlbqyRzOFqcDd3kHKLRhHyIq
 BYi/sLxhht0bb6YCzZI2RFbqdII0hdWRHsWWcjMfqSEK5kprTVIoHPQkwJPrmv7fF72ySKNB1hG
 qi2bEe9EF3GO283z9MjAG6xI4y2UDyi843VBMzJpwd6LmdKyMh8sTjU4/MYZ5hDCj7wEVdwXO8C
 9Mp252qT3WjehUT+EbeXjGF3evYjQ4FPI8otpoFZzeFpVmSr/HVw3H1IAZQNp0HzW5qo3RaQxSK
 IA81Uk8b
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c8e676 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=7AODkVuKAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yJQI281MYtr6_Kcd3kEA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=sRHRY8H3vKB1GfNvUtpx:22
X-Proofpoint-ORIG-GUID: 6AzS-qTQ0CI4tjeH8acGWyrcHjxXLhm_
X-Proofpoint-GUID: 6AzS-qTQ0CI4tjeH8acGWyrcHjxXLhm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

Particle is a San Francisco-based company providing an integrated IoT
Platform-as-a-Service.

https://www.particle.io/

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b4ee22ea7f1687ad6659b6846b070a73c9e27574..202c2f6d5942eb0efb9ff4d938c5bc447957df06 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1221,6 +1221,8 @@ patternProperties:
     description: Parade Technologies Inc.
   "^parallax,.*":
     description: Parallax Inc.
+  "^particle,.*":
+    description: Particle Industries, Inc.
   "^pda,.*":
     description: Precision Design Associates, Inc.
   "^pegatron,.*":

-- 
2.51.0


