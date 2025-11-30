Return-Path: <linux-arm-msm+bounces-83898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10855C94F76
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 13:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA8B64E129C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 12:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32FC28506B;
	Sun, 30 Nov 2025 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Psd4w64s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTQUSjm9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58DC273D6F
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506187; cv=none; b=B8JFzI4o+DJSRyZqP1Op7dtyanxuiY8TlRN3451VPEKgWqtbD8uVBKKmP1YoVVY+KZli/LHe5FfSJjRVhyETAGNuwjv4bFX1xZKNPqKV9VfoqauSzIjyBovNgIJ3NV8xtcxFAsxwphgtrREPBn25FyTYr+u+C06N5skPJ3FygiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506187; c=relaxed/simple;
	bh=9gu7wWK680Y+R77IwqaMtBNCQ9pWc92nao0jPv5FZKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIBPGAeDiAQYjgMak2JjpseOLoxzBbtsFvh6IiwFoP5C4mXLy5A/FTmTIGcwmWaL0gXIwSEMx1c3dsICIt0Ra+3M8dNkeS0ntz43RLP/pLisGWTay23VQlIBO/iN1sf8N0v+nSpZKXPyDgj2OpUAmzE0hi33CwODixV5OV/rLu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Psd4w64s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTQUSjm9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUCPRLg1480862
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=; b=Psd4w64sy2iM4eCI
	tk6IzNgPxsp0zPjf4ZUTwUfnNWHLeTFuxhK/+qfpmUXarSJ0MAAD5AVhXfqVT9b2
	U+AHwxeEm329DrK4GI1jkIr7MUdaOCiSxbFYuiPwhHDWL1E0oIN9NPlX5WfeQmP5
	lLR5gkp+KywEXuZn50miAxq/ZyBUKfGfhqYKF3lit8j2+lgPQ09ZwrxjcRpOhtzh
	eO/BR5F+hohY1QCKJNFGxWTHKm6SO3L6FDILpOhznRYL7ReI+nN5i4Ym2353BPmW
	Jc+4UjIYbMQG6Qd4C1iQwF3YYebL/h82eJGvfBl1Jq33S4WDx/AqIEJ3wNFFcQ21
	+ckBdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqj9bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b51396f3efso472149285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 04:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506184; x=1765110984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=;
        b=jTQUSjm9DgED78Og3MCeP8t40ZqZ/LbV8+RJjG3VLBMO2ikw3hBTSjHkKvE2j1wnp4
         ISHhNa0EJgrYtvHfwZ96Bj+3MW8HUnFp2+OYZsc5fAYJ6K09jYoqWo9tPxwZj0GEkRb9
         uJLDGqL9T/axtYGfJkfdmmO6fKzPYV0vxrCYWokmPb9Vr2aUCGyrxPgPFJbHjJ0K0s7h
         5m2iVxS0O6n/JbL+3SBozE9nJsxfmep+iGxiJpXb6DeBUAFz0EDswkc26IjGHw5bAZhm
         8C5ZLYSiGa0723OWfbOYWqEJVAwpyJ2EIDMYXxFHRi6qIbmY07wXjpazJ9HsloWCtBu1
         G/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506184; x=1765110984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=;
        b=nd4jvTO3eRaOIJEpOJNEhyPhMd8CeKOUNhPzotKnjpBeDAzpxaGdwPjKKE0IhITF8K
         dHv9y6neWUT1RBXmX4gJAsfRN/46vOuRdBdVbVQRS8x5uK7AXaxz5kMVtgrsSGGtLyiy
         tdZtVl+ma6UB4YxHGmczxsM/yXXfgTv+4H0QC8NgIsQ8HVXCME33+Yrm/FEsiWIbv/B+
         NaHGt3QunkK230nXeKSLhpJziUsQgytbsF0P6hEfPh0GFl91fuPE22NyZ15ZjhjNkdSF
         iKQEt/nRfJRVQ8TTwHQKsBapIYUEcuCp8nkwxZbUhryJkyxp3I9XMwtBX1rXg0Ni/oEN
         46sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVptHEO6deZz2PfPdVb+UM7nVrN+WhUsXteZvt3NNXx0YG3rJfVRrafaLd+gaikI+J5Ixg2KJdoI5AM6S3Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+yRuxgOMK1x53t1pLWKnjVU3WHX/YPdM+4bKk5FlbEpo04n6
	dj5xSvFRB+HzbK0g3IdaXv96NdJord9NwNQocuIAlVvs5r7U/vcEzbmpDgQSDAfRXk4rNNyB5IL
	gmm8h8lYrMvIs7/Q5qN/dJG5D5V6lJHZna4zh4iPJKJ88lTQ27JpNcUe5INRM16LNg+pw
X-Gm-Gg: ASbGncs5dkMxeZiaLIa7wcN4fcozeiu1rFxYAcQjLEF1xTl2R75mfIdpecKarJbukV1
	WaIWD/l3myfg1WEh+VwJt2a5PNQHBjaE3GneNVi5W5TpoKzINYzdkBauIeE0l9+fz1FJoMRDDqI
	2dpJRKbPH/MOUDbfyCXXDz8ovX75KsdeO4vq+DDS1XXx4CgYmCm+kSiiak7m6VZodcdlWIq779U
	qQ3FrbIlsPZ/mNTJLsFhmN+YegTN8y1UnJT40m4+69YJQ+itb6IGiNv2boZ2PMBW0538PcZ3bEq
	tviJP1k0Cmdqitg24ebT5L4o5zpRXmDw+0x+s5J4momfqp6ie2pfqj8eJUnr+KuylCEShS1/JqI
	ncaAHKCj0H9OomfUiTdEFbzRSPFBOdpt2cA==
X-Received: by 2002:a05:620a:4113:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b4ebdb059fmr3114733985a.41.1764506183748;
        Sun, 30 Nov 2025 04:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGva41J52XjZOZU7QbLozxUApp8fRFBP8lWVjOor8lQjogi2oWu9rXWmJiA9F+qyVfN4igasQ==
X-Received: by 2002:a05:620a:4113:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b4ebdb059fmr3114729585a.41.1764506183284;
        Sun, 30 Nov 2025 04:36:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:11 +0100
Subject: [PATCH 4/4] ASoC: qcom:: Constify GPR packet being send over GPR
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-4-cb11c7e0a024@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5742;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9gu7wWK680Y+R77IwqaMtBNCQ9pWc92nao0jPv5FZKU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo9F3Cb8NTt5YnUJG7vYG29zfGYJNTxXFDJt
 8YjFrKuC3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6PQAKCRDBN2bmhouD
 10uYD/wL7QRRrhU/H4mmKeOeLk03AFvbCsXoTZfBu3jKO/5Vj4w036GolvoqdUaOp4X6KW4Og9+
 pUtWYb2x2vIX0vXbEqd84RxA6riHyU8uHPxSNqZOefGwtyPcRPL46wGIWL46UFYocJLELTOsD/p
 0eHJ5I10yZhUIA7MzVpPOf8kd2kSWj9UMcIpuhRQvAoMWrWHheaqOQT+ROjlcaaU/1i2rbevMGV
 pcxdKpD7yMwSamCiS5u/cfw9vXZd3DhL7IwoXkwIf6T4J0S6UIKu3vrci5LUgk/bBaAWZqOLySY
 b19+66fFjdfJKD834yt4O/2/9bEYnRm00QUmDslv7+8IB0aOgZB82Ii9JxkNr+AHS4VCUN+ldGp
 VmsGUvWXS8Uu82zG90DZCMUItjg++EcafrVa7lhtCm5tRt5L9eUR61FiEfWRU+ol1u0ueqFgEhw
 psCiNk18Q1s254rhBR7woTjjGBiNih5HVh9yE/zDEAf6IKpu7be0bzO2kPZtVLtyHvKEB+Vdmt3
 LhStPsZf8m0efgknijdb0PwjTbF9Uog2BTkdWwVDY5f2PnM7AEsy39+JKoX/+KKnTrTsleVGpyY
 /zbSdC34+6MGgi//8h91XQ4i2iAP6LivYk9Zz0KQFbx4tBJ1qxQQ4wiCRrRL3/PZ+i1AwxFaqKV
 MRyrzjWyfv2hnZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692c3a48 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EI0PQj488oBMEGdooaEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: m6E5PPyiWj_gq00bagLdvuoMTGbghOdN
X-Proofpoint-GUID: m6E5PPyiWj_gq00bagLdvuoMTGbghOdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX7vGIcYL1xT4z
 OvJ+OTFgvozJvXAFZx3TQi/rEPn/VLCATVAet/hGQEeeVUuHmSckGrwiUHL0ZRPUUY4YO96bmO7
 lAdXEbTOz/VNyNqgfBfPSZJIdzMnwNxWk2U1djBgn+ZLHnYaKC0iuhGQ7HTsTGW+0NqSOZ6bYp6
 8NuAAvL8NDOhVzPJH5vu5ZZJAR6fcWRAxYOw3Bwry8kHA7G6DZeq7xRaSbdBmfRKxPibmCaq7+H
 +gA2vwqRUYv/SaJOAMhV9MJVk9djewIdGvWYvIKTLk7IoYHwT5Qfa0PvDAetFUgh4y597qSTgTz
 3YbTsr7rhejSHCYupUefdcSPxD0qCs8EOLz4rS+H8fiFmIMrQF7RKs6uAtiyMQvfgskGeoFJFIc
 251Bfe4vPlqsNrehC67VLrfOYl0+pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108

gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
they receive, without any need to actually modify it, so mark the
pointer to GPR packet as pointer to const for code safety and code
self-documentation.  Several usersof this interface can follow up and
also operate on pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.
---
 drivers/soc/qcom/apr.c            | 8 ++++----
 include/linux/soc/qcom/apr.h      | 4 ++--
 sound/soc/qcom/qdsp6/audioreach.c | 6 +++---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 sound/soc/qcom/qdsp6/q6apm.c      | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h      | 2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index a956c407ce03..b2e1d9a351de 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -123,10 +123,10 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpr_alloc_port);
 
-static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
 	struct packet_router *pr = svc->pr;
-	struct gpr_hdr *hdr;
+	const struct gpr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
@@ -139,13 +139,13 @@ static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *p
 	return ret ? ret : hdr->pkt_size;
 }
 
-int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+int gpr_send_pkt(struct apr_device *gdev, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
 }
 EXPORT_SYMBOL_GPL(gpr_send_pkt);
 
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(port, pkt);
 }
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index a532d1e4b1f4..3a02bca34b3a 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -191,7 +191,7 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
 				gpr_port_cb cb, void *priv);
 void gpr_free_port(gpr_port_t *port);
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
-int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, const struct gpr_pkt *pkt);
 
 #endif /* __QCOM_APR_H_ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index ded49124581b..297592b77925 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -552,10 +552,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	struct gpr_hdr *hdr = &pkt->hdr;
+	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -595,7 +595,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d1b60b36468a..995a7283c805 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -805,8 +805,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 94cc6376a367..d3943d07cb99 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,7 +29,8 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..a39f6046f886 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -138,7 +138,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph,
 int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
 			       unsigned int dir);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */

-- 
2.48.1


