Return-Path: <linux-arm-msm+bounces-83897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B789AC94F70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 13:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D0064E07EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 12:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FD6280327;
	Sun, 30 Nov 2025 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJ+n+iKs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jqv8g0P1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335A28151C
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506186; cv=none; b=SxKahyg7j9Skw0BOHU5LMzETplupBxCePKdM6tGglKn9zcX+YTi/UVavGkQK0rb084DkZBJjy1jjyXdLKljZibNpMUfc6T97EAlBDm2Ittz1w32VHueGW/doFIetHLvc/XUffYngCDu5oFzG/f5kYG864uTnyrwizfOtkz34s74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506186; c=relaxed/simple;
	bh=iTRd+rIeM0i/pGucaXFPZ9D6qmjfk35erqlIaeNAJhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqrxRkISyXa9H/Nn+nORHQolvx8LLkuFBBFRYWkkuAXuv+UGU0LNFYYP1d24ilOUifRTI4IRjgel/rKi2xUtLbx6zp2q7hCVUWyYyfJDYU/NSSZ7J+OLgviohOlbhF+RZqjsqO2lHyGxiP/fiq637rg/7UoF9Mx8PxesTXnnAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJ+n+iKs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jqv8g0P1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU8bYwq1037086
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dARi/iKdT6YHQNj2xjIFbOozMfb2GveeEYQmMb8Fa4k=; b=oJ+n+iKsmBVUZGJ/
	CXjTgMsh1G4BlD+ywIVzUrt/gfNQYVj/tdr3kvkch158U2ApUXVDgczPT4kcxPd4
	kHqkxKhFHqdc0HlCPlz6QGuXiAMWd9g1yd1gEWWk/b9w3sh8kitc/J418Ga5gW05
	5aw1rW9FCIdg2GpMZTXdkHAPAu3q8KdCrOUOAtfX8oi+lt/t3oSK75RQwNcnNWmi
	0WMbAcNbSWsULGhNKuFnlY9qUdmDos96osmu6FrabLU4nqjUWOozn1iGDaPm5ULg
	HwX3+KkzCf0X+J6O3M7B3hRJjHEis9H9hpZ09RqFq6GbtlEdwMDYDuTur0MZNTAR
	BklT4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqj9bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e9b2608dso575982185a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506182; x=1765110982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dARi/iKdT6YHQNj2xjIFbOozMfb2GveeEYQmMb8Fa4k=;
        b=Jqv8g0P1Q6YgaLN/j/6pMp00i1A0sjAqYsaNU1aoCKJPRq40f+1h3JZlMZ18lyB/ls
         CWZbHUs1+RPlWjBUEFh1HqdJTqSBdDGIQOz7O6vr+cVga6ximiBTPujI+kVbogf2U0yS
         yBEcZU5bozWtNeyP8Le2RehQZp3EYsPAEmtHwFLvl/+jDPrs/ESmacocW2LG+vlyVMlG
         hrnDpymcMygxuqoaTlpIUT/+9nqN+sA4TRk1JAWAYAh7K+PdOS/J/psSV7Vmn2ViyFbN
         poC2DBMh/O8pmuC3b797cYulx9yA73/iOkFBBYO0Zg6I29AP3HSKlgnjc2QUu5t7jvSZ
         9KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506182; x=1765110982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dARi/iKdT6YHQNj2xjIFbOozMfb2GveeEYQmMb8Fa4k=;
        b=pddUBSgQTjKYAEFijxELtdxRhqJXC0myEX57BJWp7pgoh1O49lD5n2FNLxIPM1TSRu
         Qp3IqbIDB9xx3gVhoukvj4Db0uJBdAJMYg15SmRpxFHaW4k5qJWheWgEhtZAX6BPyxno
         dCbHwPzTgSvEaj8vpEd7bfHQUt2JUbL4y2t1TZPRzYrVzABmm42Ue3BCA3Cje0024J/8
         gOIurU5/rcoWnJ+m8hOs+cKU1H1AfsFIHpiUgP/Jf2J3JkN4RCsJVOBcor1eDWq+ZDFE
         PuuH52aqgT9xZ//cPR31XjbAtM3zUclgijNHrKciYGeTh/BNiS7JozSHKkff9G8UAYfK
         8hHg==
X-Forwarded-Encrypted: i=1; AJvYcCUfltKjXz3viqxkukzw4ZTuss24gLXXxqaIFonQPD1djz+CikLTReR3Ie43o+Ry0qeSU77MDjwUiutf12Lp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcz0LqJxTD3o8H8jjdPaPWfDy2JMTANSffEKC5wwXuFnumcplT
	tk+dcrsoRATrvy+ScUUIAah9y3ckEqUJrMkriZkBvrh584zbMPAyMQ+MGuCZq9B9pkk3TyUaceg
	0evez4PKduIwbtsfP6tCb8jIlL2+Wu9Dcn9/OLCyFEKhCYP8fqbRxJDchiHBtlyHZ5fBC
X-Gm-Gg: ASbGnct4Td5KCe8Nc71AC1xGX43SLtwmmvlt+LzGjaAXzZMR9xkCNiZDO4+YCkBYTF1
	8HjF++COh1qvLd0okrFvzUBuLYoKOCBA8GA2NOnbhYtXiZ+5Rj3ksv/vivqIfj2OdmdISnrrwJM
	CuMPBSOvA8+sN//kRoZCqpb3545KgpJYQtt3RVvzHmC7k6BGDNzgOfpfb1l1S6qmCSh2cDE05lj
	zycboxgHRngfalZ6hObdVEf8Qk1Bw5cMLkb4lhzQm5GvEIRBNEQWJx6WBlUfZ1D4gh6PXlhX3Le
	UxEF1tuQAZdrxH40q//N0QuSph3e4h6QITs5JW+Kedks+IzSS6pvdmBycZh8kRR471tGVvsNeDs
	clGkR2RGom3SEF6PTHTqLpWBB+kEBA6jbAQ==
X-Received: by 2002:a05:620a:45a3:b0:8a9:b1bb:fcb1 with SMTP id af79cd13be357-8b4ebd54520mr2850376685a.15.1764506182052;
        Sun, 30 Nov 2025 04:36:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEgZrd7ydwt7marmpb1vwhLSYebkPk/ReUbPpzq6DcU/1phgO3nPD29R+bvHO+ffA7kL4GXA==
X-Received: by 2002:a05:620a:45a3:b0:8a9:b1bb:fcb1 with SMTP id af79cd13be357-8b4ebd54520mr2850371785a.15.1764506181462;
        Sun, 30 Nov 2025 04:36:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:10 +0100
Subject: [PATCH 3/4] rpmsg: Constify buffer passed to send API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-3-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iTRd+rIeM0i/pGucaXFPZ9D6qmjfk35erqlIaeNAJhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo8N/dNhNeRqEnlC/v3jVdSTzvhCqXPENCaD
 Us6fAJ2xoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6PAAKCRDBN2bmhouD
 11ZREACBOq1dY/GNaTLrAA6ziQ59OT938SUPowxfvxNxZPPOS+rbuOswQZxkPHF1t8R+HMt3WkT
 +fihX5v7rbFzhKUkWtOqVWYY8UHoIUAdx2/MGhcEqwIQn4PCeT43Od+58rUPCp6eLT27r/MNs0b
 +0pGZdsCPsZ5xL1f4TpQTuUQx0le+azaUpnLvtzEdohuudxoeT6Bnbx6dzaFqIUfbYdMb1m1UPM
 5YEbzBXgnZGPBT0uywIOb65O5AQcXPcJiEgOq1TkrmPDoU4gDnaVdQ3nr3THh/AQC7W2JoZm/5V
 WqeHpeLgMWOpZbhYZR4GHDHg87kPmpzDagDwrSaiggButugls5iHKSqE9I2c3YpDINjh0Vt2dVn
 KT9vu56ovP4oIptRFT2LZEYcUa7I5gWhYnIgk/KnjnDxC9o8caA+5N9Lel5SqrNckoxB5PJvjj8
 dauNBbNguJ7ZnsGvKSyTYaA0XswWCeQMUJXLuI7/RfaO57n8guKey38itk14dj1e/CnEbXpGotB
 DyUxk4qCAjivqPt+/OvPaLqeTYY1Nbmoc8xP1juSDnuO+tQCUwn7IlwKbueRZCCoYeD+bs0FqqX
 QlP00cpzev5ABCUXeX69X9W9ZgUSrFzlti83zMUlBkFkNIhTWumqlwU502e/6pqtQLXOL3Lm+Aj
 iuE1Ulj8f2t94IQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692c3a47 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jKNRGAx6QiKp0B1Iy_QA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zS13yu3PPBqvkjROULgQSbgGVcdv7WDg
X-Proofpoint-GUID: zS13yu3PPBqvkjROULgQSbgGVcdv7WDg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX7zR5Ya2aBw8S
 jovjltbIyps0JIDTMpfwgwtgRdWNZKJl31Rq7l8Uy2/bMA9T1YZLWhzcJ2UN4NeeC4bZ9dT3BU4
 m5wEjPtbDnM2wUVt0wbtoxhac2KnBwMXsCxY/7aTT7RbYvNNSLDX8yY5PfkhmKfaAIHpuLfSTwc
 J9w8MzRNSwlU9bLHxtlxcUtl13nf5QyMBJlYqd8Vfhkbw5/CjA2+Kwtly43jqVEELwCZBWcQ5cy
 RV0axMqwrqozt3EijKlK9jseXGjtys8svzc8wI3NertmDaJ6RQWaOJb94qPYN0FVZaTEIpdnpsl
 Y78Kq/9lbOyaJqXWdKF5ZBWtB8G0Hzbkpj79HdUTbq4a+gdOL5NSkQtAN9oDmKUmoJ6dI9aWoKM
 EU86sA+x2vvVRZabJQk1Fmj+Nis6+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108

The rpmsg_send(), rpmsg_sendto() and other variants of sending
interfaces should only send the passed data, without modifying its
contents, so mark pointer 'data' as pointer to const.  All users of this
interface already follow this approach, so only the function
declarations have to be updated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
send const
---
 drivers/rpmsg/mtk_rpmsg.c         |  4 ++--
 drivers/rpmsg/qcom_glink_native.c | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c          | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c        |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h    |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c  | 24 +++++++++++++-----------
 include/linux/rpmsg.h             | 17 +++++++++--------
 7 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index d1213c33da20..4398f0bec155 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -135,7 +135,7 @@ static void mtk_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __mtk_ept_release);
 }
 
-static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
@@ -144,7 +144,7 @@ static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 					  len, 0);
 }
 
-static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 820a6ca5b1d7..db696e1c8ca3 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1461,7 +1461,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 }
 
 static int __qcom_glink_send(struct glink_channel *channel,
-			     void *data, int len, bool wait)
+			     const void *data, int len, bool wait)
 {
 	struct qcom_glink *glink = channel->glink;
 	struct glink_core_rx_intent *intent = NULL;
@@ -1540,28 +1540,31 @@ static int __qcom_glink_send(struct glink_channel *channel,
 	return 0;
 }
 
-static int qcom_glink_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_trysend(struct rpmsg_endpoint *ept, const void *data,
+			      int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, false);
 }
 
-static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_sendto(struct rpmsg_endpoint *ept, const void *data,
+			     int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, const void *data,
+				int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 42594f5ee438..1c6ae8c22100 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -960,28 +960,30 @@ static void qcom_smd_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __ept_release);
 }
 
-static int qcom_smd_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, false);
 }
 
-static int qcom_smd_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
+			   u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, const void *data,
+			      int len, u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 5d661681a9b6..cac8e5227579 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -153,7 +153,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -182,7 +182,7 @@ EXPORT_SYMBOL(rpmsg_send);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -238,7 +238,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 397e4926bd02..a8b7065fd165 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -63,11 +63,11 @@ struct rpmsg_device_ops {
 struct rpmsg_endpoint_ops {
 	void (*destroy_ept)(struct rpmsg_endpoint *ept);
 
-	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*send)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*sendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*trysend)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*trysendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
 	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 484890b4a6a7..6559de61da6d 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -138,11 +138,12 @@ struct virtio_rpmsg_channel {
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst);
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst);
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len);
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst);
 static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
@@ -546,7 +547,7 @@ static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
  */
 static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 				     u32 src, u32 dst,
-				     void *data, int len, bool wait)
+				     const void *data, int len, bool wait)
 {
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 	struct virtproc_info *vrp = vch->vrp;
@@ -642,7 +643,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	return err;
 }
 
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -650,8 +651,8 @@ static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst)
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr;
@@ -659,7 +660,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -667,7 +669,7 @@ static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
 }
 
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index fb7ab9165645..83266ce14642 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -182,11 +182,11 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo);
 
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
@@ -249,7 +249,7 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	return NULL;
 }
 
-static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -257,7 +257,7 @@ static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
+static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
 			       u32 dst)
 {
 	/* This shouldn't be possible */
@@ -267,7 +267,8 @@ static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 
 }
 
-static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -275,7 +276,7 @@ static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	/* This shouldn't be possible */

-- 
2.48.1


