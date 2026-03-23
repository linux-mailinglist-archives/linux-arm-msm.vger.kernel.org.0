Return-Path: <linux-arm-msm+bounces-99080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G6EKWKVwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:20:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C002EB6D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C694D30467CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36CA20CCDC;
	Mon, 23 Mar 2026 01:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV8fEx9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmjH3wzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33FB1E1E12
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228672; cv=none; b=CpuQOvUQd7RSpRy0Sq5NngT+v3Aw82FsMCFpiZfIBYEop4X3GdWf45PW6kTQlc6PyOFoRTKSO5pyJEZQiglXGFz0gkY1y+ycWCeMQaOO5aRrR/dL7ot8sTKeCddQWFPcDp3aPfvwwa7uxXRq/Jfpxl96SiE75JCUB/BlPS/Y/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228672; c=relaxed/simple;
	bh=1CMXLbBF5UJ1cF+lSQJT+spR7IYKrLBQpcODBY+BLHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PAiBsAL9IvrHqYuXfBkfBVqBEzIMXEzrcMmvcIFINpdBx7btUKQwGmD49JBJ2qa27Ix2dNFjBMJIBDcINXf+f1HP6t/6KN8le6VxIIt9GeaveEC3MBad/4CjnAXsp+J5K2kbsG2yTpjkv+q9J5frBs2M5OuPpUeVtHjtab1EdZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV8fEx9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmjH3wzK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLwQ201200097
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPZTPpjSRm+LRjpe7M/zsGj1EfuwzS03w8ciKVNoS8s=; b=pV8fEx9iHVR2wMGR
	5+jO8MBMAQYTn9ALjYXUPjRh3gNc7MShSz82EB4elDmFAuYafeGLbnfckBHKlZw7
	CFAZQRDbCGtyYm1c2cNf9hkelTCNWew+f5TSzIy6ekQDVWVAdfPrtiWkI8YlPnTK
	ftdtS6BAJo1HkZ/Q5Cgi8zo7u1Ys6f+m3buomm6t+511N6sCzWXH8VbP1e/0a3+m
	UdV8Y+qzKaQReWGb2h5DP50/dd1X5HNWtVhraY4kcXMPsgRPUfoAyTtQLqGPaI9t
	qkBdFkY8B3WvKg9Y+DqRzkRIpiSGL36+rcuHZPlkofNeWVp2OpTeJYIYc8vMpuKd
	YShATg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5u8a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso50848971cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228669; x=1774833469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPZTPpjSRm+LRjpe7M/zsGj1EfuwzS03w8ciKVNoS8s=;
        b=JmjH3wzKG0nCp+bsHTrlzD6Hw9uIHdrTLolng95l+v2SP1fSBe0Z4WOhF+54L5uYBO
         ecAvc4nxM8mXGQH7OCZudGzSCwf5Et7QE0qe8D0pmrO8C7HzRrpaswBfJFLMBlvD0YXi
         hVAVGjUjegZbNYM5kcW8HH3t/g+yuFSz9ouguiv/Ap7JY7BEYMd7PqfzvF8tubt6IhS3
         LGudBDnLRTsOkbFuHku5qyXPiySICbjkrz+I0lSKUyufDKfZWM4H0RStjYB2IZLZkjC6
         BGcKaLJRSD6NWG9VS1vkeCWcwjLQRfk8XR8njKuhGYIE1XFD0agDKCKcSmQuoMtywQ4Z
         Y1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228669; x=1774833469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jPZTPpjSRm+LRjpe7M/zsGj1EfuwzS03w8ciKVNoS8s=;
        b=dcjMA16ZyG5SrsoHsP8PDippQQhA08s7oZdddHF4FRFKD9JDSBXMgH1cbm6nbyiQ4O
         qVs/yOn0ORqXR6rc0gsb7fJ1KvojchNguLzJWxZX1kXsxY/JWxf8V4NkIcmdjM5d3kC3
         wQZpEVPXmXZf6hTM7nsnNtXhhHXYNOmVmCthFf6OZaViWr1+F0DQmlYfiYuTLIbMtiE8
         iQxU7nWqwNaEND1SIBDRzl+LqFcqv5T0vEh4YsATIohlrZ2ZLi6uLclo/lhfGdIjNs8n
         IU5JbyvBi4RJeowNhIDx2+vcnI9tWXyFJAJdyYMM/F+qPUlgVq/f0++7xVYA7OxiQ+8k
         +wkA==
X-Gm-Message-State: AOJu0Yw9O0FcGl3i+oJf2kF1Z0DmEn5AHMX6KOQLqt0lJRRvlCMKps0T
	geR9LMPHpqOArbSkDzTF4Rq2PtonY5u7TDRw6jSROHlUz7UjVMi28NPUal4zEAg6o3Zbg6oPkKw
	JvLWeViqdYS97GHOuDLjAkWvUukMh2se1JpPAf5pSUp0tu70gI1Pq+4oEWIQmUlfz0OwA
X-Gm-Gg: ATEYQzzZAHh0xXg8P8A3nSCZ4x53oADw+3jnqmfaI4MNuVjaoyxUAAS81X8lQqm6BZP
	clQsxmEI3MIzbIg5/AZ4HARlpCzCTF95zj/8ctlxihIgDXu3oHewWbPT95khuPLyoQLTdSRPbsy
	TQ9OErF5da8ejrL3AKAw3Bf//P88VqhsH28kSdVS+n16hFwKdEILJoIt/RiYCbe1n62KlRZYVcZ
	9jFFxpy/gvVUmD39XSNWKg1jZp51qsp9X99B9MIEyPTH5AyRGsOHlMDglTpNAQuLGKic/Frp/lM
	t7id31JeaCdQOynxz+urUTRvBzszl7mL1WYTx/psYm3icWyxVpIET+qgjeiRpKKncsLb907Iftb
	82JUlN25Z7oEdG3nWS9wS8NosvB2MRh0jbLbM89hjWv/mRYjzNH2qMQ1S2bQmbSghU0O4+K0yx1
	HuxQ+QZYMu9Ukd+QB9tE8QitXyUfbALpkuRqU=
X-Received: by 2002:a05:622a:354:b0:506:9bea:3229 with SMTP id d75a77b69052e-50b375d6367mr161626291cf.69.1774228668905;
        Sun, 22 Mar 2026 18:17:48 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:506:9bea:3229 with SMTP id d75a77b69052e-50b375d6367mr161626041cf.69.1774228668407;
        Sun, 22 Mar 2026 18:17:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:23 +0200
Subject: [PATCH 7/9] interconnect: qcom: msm8974: switch to the main
 icc-rpm driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-7-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14953;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CMXLbBF5UJ1cF+lSQJT+spR7IYKrLBQpcODBY+BLHA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSfcqH9q4hqksniaVw3TkffTaoBRbGsdYMym
 yzj3x92n2SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUnwAKCRCLPIo+Aiko
 1dKnB/47uptj5qPHeglDhgs+zIlZCaeXPkeZ8t1oYqK/GVg39eVz4yqwd1rqdvz6LdN32jq96OB
 fhJcYQ1eCadti6DlbtJ1aZL+GGj35B6U29LmPoBGPY0CdnOR5U8rog/YuPDrakMZgp5ZiBOgyXO
 2odW+7yWaWrxWrjijkfkJhVd0u3HErUQEgA4zMIxkhjFYDeyBPO3vALR0sed0IcDiHmjGRzjCPV
 SEEkcc1XJx272XM7b6DnZyZnEi7gyiDE6YqOUkbwYtguR4xHoQKX+ImFg7Y6mku9qAbjUhR6yrp
 +DGY8LEF1chuDvv4h0ZOu6LN6PYsu9IkGfPKEDoVHeIHvrbN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c094bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vNxNlsk0RTatv9OKPSEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX5/5RfpwrsRu5
 GpplGErB8wPKlo1MQeR5rs1fQmHiWy+tukvuYjCa1YffKpeS8DNUfrLzT7xe6Zd+AXM3tnW1sCs
 ajtWriyaABJfFlg3l/WtjQtd7YOBZvjPUKnz4ebGqqKxRz92CDwQoSgR62jxVDdlArtoh325Ew5
 9w/cWi9b/ymsshkyHd8L7sh+9RFNXDRPFSVD9Q+JKAvq3pg9mCMWBg6zQTg9kBareLx5AjVFS5h
 KwawOtet3ZNzfB3C0kEqEGVefbVa0SEC6K44+uCuB8LZxnMvEad+hsvuiKdPBhG9avo0l+P+EF5
 pmXgjO3b2kM8iWR4fp5HAWH71xhjK9fhq/RlJlFU3JRsGKUgfSNkgcemxAvMnGcJbOLi2BrrbaG
 423uUJ+2pwj0aTBA69n6SNT6zGmmgSg2BkA1foVIUjkDxRY4WK9hMilIhIkNSMUI3sjR4ULdSA0
 ouc+wOl4AYOnaXb5KrA==
X-Proofpoint-ORIG-GUID: U78kip2OWNiEl4d5kx6YUZJrcxQx46MU
X-Proofpoint-GUID: U78kip2OWNiEl4d5kx6YUZJrcxQx46MU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99080-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04C002EB6D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to restoring the ability of MSM8974 driver to work with
the modern kernels, switch the driver to the main icc-rpm set of helper
code.

As platform-specific workarounds, set the get_bw callback (returning 0)
to prevent initial setup from programming INT_MAX into the RPM (which
otherwise might hang the platform) and tell RPM programming code to
ignore -ENXIO errors from the firmware (until the QoS programming is
sorted out).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/msm8974.c | 304 +++++-------------------------------
 1 file changed, 43 insertions(+), 261 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
index 3239edc37f02..144f225ec885 100644
--- a/drivers/interconnect/qcom/msm8974.c
+++ b/drivers/interconnect/qcom/msm8974.c
@@ -173,65 +173,27 @@ enum {
 	MSM8974_SNOC_SLV_QDSS_STM,
 };
 
-#define to_msm8974_icc_provider(_provider) \
-	container_of(_provider, struct msm8974_icc_provider, provider)
-
-static const struct clk_bulk_data msm8974_icc_bus_clocks[] = {
-	{ .id = "bus" },
-	{ .id = "bus_a" },
-};
-
-/**
- * struct msm8974_icc_provider - Qualcomm specific interconnect provider
- * @provider: generic interconnect provider
- * @bus_clks: the clk_bulk_data table of bus clocks
- * @num_clks: the total number of clk_bulk_data entries
- */
-struct msm8974_icc_provider {
-	struct icc_provider provider;
-	struct clk_bulk_data *bus_clks;
-	int num_clks;
-};
-
-#define MSM8974_ICC_MAX_LINKS	3
-
-/**
- * struct msm8974_icc_node - Qualcomm specific interconnect nodes
- * @name: the node name used in debugfs
- * @id: a unique node identifier
- * @links: an array of nodes where we can go next while traversing
- * @num_links: the total number of @links
- * @buswidth: width of the interconnect between a node and the bus (bytes)
- * @mas_rpm_id:	RPM ID for devices that are bus masters
- * @slv_rpm_id:	RPM ID for devices that are bus slaves
- * @rate: current bus clock rate in Hz
- */
-struct msm8974_icc_node {
-	unsigned char *name;
-	u16 id;
-	u16 links[MSM8974_ICC_MAX_LINKS];
-	u16 num_links;
-	u16 buswidth;
-	int mas_rpm_id;
-	int slv_rpm_id;
-	u64 rate;
-};
+static int msm8974_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	*avg = 0;
+	*peak = 0;
 
-struct msm8974_icc_desc {
-	struct msm8974_icc_node * const *nodes;
-	size_t num_nodes;
+	return 0;
 };
 
 #define DEFINE_QNODE(_name, _id, _buswidth, _mas_rpm_id, _slv_rpm_id,	\
 		     ...)						\
-		static struct msm8974_icc_node _name = {		\
+		static const u16 _name ## _links[] = {			\
+			__VA_ARGS__					\
+		};							\
+		static struct qcom_icc_node _name = {			\
 		.name = #_name,						\
 		.id = _id,						\
 		.buswidth = _buswidth,					\
 		.mas_rpm_id = _mas_rpm_id,				\
 		.slv_rpm_id = _slv_rpm_id,				\
-		.num_links = COUNT_ARGS(__VA_ARGS__),			\
-		.links = { __VA_ARGS__ },				\
+		.num_links = ARRAY_SIZE(_name ## _links),		\
+		.links = _name ## _links,				\
 	}
 
 DEFINE_QNODE(mas_ampss_m0, MSM8974_BIMC_MAS_AMPSS_M0, 8, 0, -1);
@@ -242,7 +204,7 @@ DEFINE_QNODE(bimc_to_snoc, MSM8974_BIMC_TO_SNOC, 8, 3, 2, MSM8974_SNOC_TO_BIMC,
 DEFINE_QNODE(slv_ebi_ch0, MSM8974_BIMC_SLV_EBI_CH0, 8, -1, 0);
 DEFINE_QNODE(slv_ampss_l2, MSM8974_BIMC_SLV_AMPSS_L2, 8, -1, 1);
 
-static struct msm8974_icc_node * const msm8974_bimc_nodes[] = {
+static struct qcom_icc_node * const msm8974_bimc_nodes[] = {
 	[BIMC_MAS_AMPSS_M0] = &mas_ampss_m0,
 	[BIMC_MAS_AMPSS_M1] = &mas_ampss_m1,
 	[BIMC_MAS_MSS_PROC] = &mas_mss_proc,
@@ -252,9 +214,12 @@ static struct msm8974_icc_node * const msm8974_bimc_nodes[] = {
 	[BIMC_SLV_AMPSS_L2] = &slv_ampss_l2,
 };
 
-static const struct msm8974_icc_desc msm8974_bimc = {
+static const struct qcom_icc_desc msm8974_bimc = {
 	.nodes = msm8974_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8974_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
+	.get_bw = msm8974_get_bw,
+	.ignore_enxio = true,
 };
 
 DEFINE_QNODE(mas_rpm_inst, MSM8974_CNOC_MAS_RPM_INST, 8, 45, -1);
@@ -295,7 +260,7 @@ DEFINE_QNODE(slv_ebi1_phy_cfg, MSM8974_CNOC_SLV_EBI1_PHY_CFG, 8, -1, 73);
 DEFINE_QNODE(slv_rpm, MSM8974_CNOC_SLV_RPM, 8, -1, 74);
 DEFINE_QNODE(slv_service_cnoc, MSM8974_CNOC_SLV_SERVICE_CNOC, 8, -1, 76);
 
-static struct msm8974_icc_node * const msm8974_cnoc_nodes[] = {
+static struct qcom_icc_node * const msm8974_cnoc_nodes[] = {
 	[CNOC_MAS_RPM_INST] = &mas_rpm_inst,
 	[CNOC_MAS_RPM_DATA] = &mas_rpm_data,
 	[CNOC_MAS_RPM_SYS] = &mas_rpm_sys,
@@ -335,9 +300,12 @@ static struct msm8974_icc_node * const msm8974_cnoc_nodes[] = {
 	[CNOC_SLV_SERVICE_CNOC] = &slv_service_cnoc,
 };
 
-static const struct msm8974_icc_desc msm8974_cnoc = {
+static const struct qcom_icc_desc msm8974_cnoc = {
 	.nodes = msm8974_cnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8974_cnoc_nodes),
+	.bus_clk_desc = &bus_2_clk,
+	.get_bw = msm8974_get_bw,
+	.ignore_enxio = true,
 };
 
 DEFINE_QNODE(mas_graphics_3d, MSM8974_MNOC_MAS_GRAPHICS_3D, 16, 6, -1, MSM8974_MNOC_TO_BIMC);
@@ -363,7 +331,7 @@ DEFINE_QNODE(slv_mnoc_mpu_cfg, MSM8974_MNOC_SLV_MNOC_MPU_CFG, 16, -1, 14);
 DEFINE_QNODE(slv_onoc_mpu_cfg, MSM8974_MNOC_SLV_ONOC_MPU_CFG, 16, -1, 15);
 DEFINE_QNODE(slv_service_mnoc, MSM8974_MNOC_SLV_SERVICE_MNOC, 16, -1, 17);
 
-static struct msm8974_icc_node * const msm8974_mnoc_nodes[] = {
+static struct qcom_icc_node * const msm8974_mnoc_nodes[] = {
 	[MNOC_MAS_GRAPHICS_3D] = &mas_graphics_3d,
 	[MNOC_MAS_JPEG] = &mas_jpeg,
 	[MNOC_MAS_MDP_PORT0] = &mas_mdp_port0,
@@ -388,9 +356,11 @@ static struct msm8974_icc_node * const msm8974_mnoc_nodes[] = {
 	[MNOC_SLV_SERVICE_MNOC] = &slv_service_mnoc,
 };
 
-static const struct msm8974_icc_desc msm8974_mnoc = {
+static const struct qcom_icc_desc msm8974_mnoc = {
 	.nodes = msm8974_mnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8974_mnoc_nodes),
+	.get_bw = msm8974_get_bw,
+	.ignore_enxio = true,
 };
 
 DEFINE_QNODE(ocmem_noc_to_ocmem_vnoc, MSM8974_OCMEM_NOC_TO_OCMEM_VNOC, 16, 54, 78, MSM8974_OCMEM_SLV_OCMEM);
@@ -408,7 +378,7 @@ DEFINE_QNODE(ocmem_vnoc_to_onoc, MSM8974_OCMEM_VNOC_TO_OCMEM_NOC, 16, 56, 79, MS
 DEFINE_QNODE(ocmem_vnoc_to_snoc, MSM8974_OCMEM_VNOC_TO_SNOC, 8, 57, 80);
 DEFINE_QNODE(mas_v_ocmem_gfx3d, MSM8974_OCMEM_VNOC_MAS_GFX3D, 8, 55, -1, MSM8974_OCMEM_VNOC_TO_OCMEM_NOC);
 
-static struct msm8974_icc_node * const msm8974_onoc_nodes[] = {
+static struct qcom_icc_node * const msm8974_onoc_nodes[] = {
 	[OCMEM_NOC_TO_OCMEM_VNOC] = &ocmem_noc_to_ocmem_vnoc,
 	[OCMEM_MAS_JPEG_OCMEM] = &mas_jpeg_ocmem,
 	[OCMEM_MAS_MDP_OCMEM] = &mas_mdp_ocmem,
@@ -423,9 +393,12 @@ static struct msm8974_icc_node * const msm8974_onoc_nodes[] = {
 	[OCMEM_SLV_OCMEM] = &slv_ocmem,
 };
 
-static const struct msm8974_icc_desc msm8974_onoc = {
+static const struct qcom_icc_desc msm8974_onoc = {
 	.nodes = msm8974_onoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8974_onoc_nodes),
+	.bus_clk_desc = &gpu_mem_2_clk,
+	.get_bw = msm8974_get_bw,
+	.ignore_enxio = true,
 };
 
 DEFINE_QNODE(mas_pnoc_cfg, MSM8974_PNOC_MAS_PNOC_CFG, 8, 43, -1);
@@ -456,7 +429,7 @@ DEFINE_QNODE(slv_pnoc_mpu_cfg, MSM8974_PNOC_SLV_PNOC_MPU_CFG, 8, -1, 43);
 DEFINE_QNODE(slv_prng, MSM8974_PNOC_SLV_PRNG, 8, -1, 44, MSM8974_PNOC_TO_SNOC);
 DEFINE_QNODE(slv_service_pnoc, MSM8974_PNOC_SLV_SERVICE_PNOC, 8, -1, 46);
 
-static struct msm8974_icc_node * const msm8974_pnoc_nodes[] = {
+static struct qcom_icc_node * const msm8974_pnoc_nodes[] = {
 	[PNOC_MAS_PNOC_CFG] = &mas_pnoc_cfg,
 	[PNOC_MAS_SDCC_1] = &mas_sdcc_1,
 	[PNOC_MAS_SDCC_3] = &mas_sdcc_3,
@@ -486,9 +459,13 @@ static struct msm8974_icc_node * const msm8974_pnoc_nodes[] = {
 	[PNOC_SLV_SERVICE_PNOC] = &slv_service_pnoc,
 };
 
-static const struct msm8974_icc_desc msm8974_pnoc = {
+static const struct qcom_icc_desc msm8974_pnoc = {
 	.nodes = msm8974_pnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8974_pnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
+	.get_bw = msm8974_get_bw,
+	.keep_alive = true,
+	.ignore_enxio = true,
 };
 
 DEFINE_QNODE(mas_lpass_ahb, MSM8974_SNOC_MAS_LPASS_AHB, 8, 18, -1);
@@ -516,7 +493,7 @@ DEFINE_QNODE(slv_snoc_ocmem, MSM8974_SNOC_SLV_SNOC_OCMEM, 8, -1, 27);
 DEFINE_QNODE(slv_service_snoc, MSM8974_SNOC_SLV_SERVICE_SNOC, 8, -1, 29);
 DEFINE_QNODE(slv_qdss_stm, MSM8974_SNOC_SLV_QDSS_STM, 8, -1, 30);
 
-static struct msm8974_icc_node * const msm8974_snoc_nodes[] = {
+static struct qcom_icc_node * const msm8974_snoc_nodes[] = {
 	[SNOC_MAS_LPASS_AHB] = &mas_lpass_ahb,
 	[SNOC_MAS_QDSS_BAM] = &mas_qdss_bam,
 	[SNOC_MAS_SNOC_CFG] = &mas_snoc_cfg,
@@ -543,209 +520,14 @@ static struct msm8974_icc_node * const msm8974_snoc_nodes[] = {
 	[SNOC_SLV_QDSS_STM] = &slv_qdss_stm,
 };
 
-static const struct msm8974_icc_desc msm8974_snoc = {
+static const struct qcom_icc_desc msm8974_snoc = {
 	.nodes = msm8974_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8974_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
+	.get_bw = msm8974_get_bw,
+	.ignore_enxio = true,
 };
 
-static void msm8974_icc_rpm_smd_send(struct device *dev, int rsc_type,
-				     char *name, int id, u64 val)
-{
-	int ret;
-
-	if (id == -1)
-		return;
-
-	/*
-	 * Setting the bandwidth requests for some nodes fails and this same
-	 * behavior occurs on the downstream MSM 3.4 kernel sources based on
-	 * errors like this in that kernel:
-	 *
-	 *   msm_rpm_get_error_from_ack(): RPM NACK Unsupported resource
-	 *   AXI: msm_bus_rpm_req(): RPM: Ack failed
-	 *   AXI: msm_bus_rpm_commit_arb(): RPM: Req fail: mas:32, bw:240000000
-	 *
-	 * Since there's no publicly available documentation for this hardware,
-	 * and the bandwidth for some nodes in the path can be set properly,
-	 * let's not return an error.
-	 */
-	ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE, rsc_type, id,
-				    val);
-	if (ret)
-		dev_dbg(dev, "Cannot set bandwidth for node %s (%d): %d\n",
-			name, id, ret);
-}
-
-static int msm8974_icc_set(struct icc_node *src, struct icc_node *dst)
-{
-	struct msm8974_icc_node *src_qn, *dst_qn;
-	struct msm8974_icc_provider *qp;
-	u64 sum_bw, max_peak_bw, rate;
-	u32 agg_avg = 0, agg_peak = 0;
-	struct icc_provider *provider;
-	struct icc_node *n;
-	int ret, i;
-
-	src_qn = src->data;
-	dst_qn = dst->data;
-	provider = src->provider;
-	qp = to_msm8974_icc_provider(provider);
-
-	list_for_each_entry(n, &provider->nodes, node_list)
-		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
-				    &agg_avg, &agg_peak);
-
-	sum_bw = icc_units_to_bps(agg_avg);
-	max_peak_bw = icc_units_to_bps(agg_peak);
-
-	/* Set bandwidth on source node */
-	msm8974_icc_rpm_smd_send(provider->dev, RPM_BUS_MASTER_REQ,
-				 src_qn->name, src_qn->mas_rpm_id, sum_bw);
-
-	msm8974_icc_rpm_smd_send(provider->dev, RPM_BUS_SLAVE_REQ,
-				 src_qn->name, src_qn->slv_rpm_id, sum_bw);
-
-	/* Set bandwidth on destination node */
-	msm8974_icc_rpm_smd_send(provider->dev, RPM_BUS_MASTER_REQ,
-				 dst_qn->name, dst_qn->mas_rpm_id, sum_bw);
-
-	msm8974_icc_rpm_smd_send(provider->dev, RPM_BUS_SLAVE_REQ,
-				 dst_qn->name, dst_qn->slv_rpm_id, sum_bw);
-
-	rate = max(sum_bw, max_peak_bw);
-
-	do_div(rate, src_qn->buswidth);
-
-	rate = min_t(u32, rate, INT_MAX);
-
-	if (src_qn->rate == rate)
-		return 0;
-
-	for (i = 0; i < qp->num_clks; i++) {
-		ret = clk_set_rate(qp->bus_clks[i].clk, rate);
-		if (ret) {
-			dev_err(provider->dev, "%s clk_set_rate error: %d\n",
-				qp->bus_clks[i].id, ret);
-			ret = 0;
-		}
-	}
-
-	src_qn->rate = rate;
-
-	return 0;
-}
-
-static int msm8974_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
-{
-	*avg = 0;
-	*peak = 0;
-
-	return 0;
-}
-
-static int msm8974_icc_probe(struct platform_device *pdev)
-{
-	const struct msm8974_icc_desc *desc;
-	struct msm8974_icc_node * const *qnodes;
-	struct msm8974_icc_provider *qp;
-	struct device *dev = &pdev->dev;
-	struct icc_onecell_data *data;
-	struct icc_provider *provider;
-	struct icc_node *node;
-	size_t num_nodes, i;
-	int ret;
-
-	/* wait for the RPM proxy */
-	if (!qcom_icc_rpm_smd_available())
-		return -EPROBE_DEFER;
-
-	desc = of_device_get_match_data(dev);
-	if (!desc)
-		return -EINVAL;
-
-	qnodes = desc->nodes;
-	num_nodes = desc->num_nodes;
-
-	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
-	if (!qp)
-		return -ENOMEM;
-
-	data = devm_kzalloc(dev, struct_size(data, nodes, num_nodes),
-			    GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-	data->num_nodes = num_nodes;
-
-	qp->bus_clks = devm_kmemdup(dev, msm8974_icc_bus_clocks,
-				    sizeof(msm8974_icc_bus_clocks), GFP_KERNEL);
-	if (!qp->bus_clks)
-		return -ENOMEM;
-
-	qp->num_clks = ARRAY_SIZE(msm8974_icc_bus_clocks);
-	ret = devm_clk_bulk_get(dev, qp->num_clks, qp->bus_clks);
-	if (ret)
-		return ret;
-
-	ret = clk_bulk_prepare_enable(qp->num_clks, qp->bus_clks);
-	if (ret)
-		return ret;
-
-	provider = &qp->provider;
-	provider->dev = dev;
-	provider->set = msm8974_icc_set;
-	provider->aggregate = icc_std_aggregate;
-	provider->xlate = of_icc_xlate_onecell;
-	provider->data = data;
-	provider->get_bw = msm8974_get_bw;
-
-	icc_provider_init(provider);
-
-	for (i = 0; i < num_nodes; i++) {
-		size_t j;
-
-		node = icc_node_create(qnodes[i]->id);
-		if (IS_ERR(node)) {
-			ret = PTR_ERR(node);
-			goto err_remove_nodes;
-		}
-
-		node->name = qnodes[i]->name;
-		node->data = qnodes[i];
-		icc_node_add(node, provider);
-
-		dev_dbg(dev, "registered node %s\n", node->name);
-
-		/* populate links */
-		for (j = 0; j < qnodes[i]->num_links; j++)
-			icc_link_create(node, qnodes[i]->links[j]);
-
-		data->nodes[i] = node;
-	}
-
-	ret = icc_provider_register(provider);
-	if (ret)
-		goto err_remove_nodes;
-
-	platform_set_drvdata(pdev, qp);
-
-	return 0;
-
-err_remove_nodes:
-	icc_nodes_remove(provider);
-	clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
-
-	return ret;
-}
-
-static void msm8974_icc_remove(struct platform_device *pdev)
-{
-	struct msm8974_icc_provider *qp = platform_get_drvdata(pdev);
-
-	icc_provider_deregister(&qp->provider);
-	icc_nodes_remove(&qp->provider);
-	clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
-}
-
 static const struct of_device_id msm8974_noc_of_match[] = {
 	{ .compatible = "qcom,msm8974-bimc", .data = &msm8974_bimc},
 	{ .compatible = "qcom,msm8974-cnoc", .data = &msm8974_cnoc},
@@ -758,8 +540,8 @@ static const struct of_device_id msm8974_noc_of_match[] = {
 MODULE_DEVICE_TABLE(of, msm8974_noc_of_match);
 
 static struct platform_driver msm8974_noc_driver = {
-	.probe = msm8974_icc_probe,
-	.remove = msm8974_icc_remove,
+	.probe = qnoc_probe,
+	.remove = qnoc_remove,
 	.driver = {
 		.name = "qnoc-msm8974",
 		.of_match_table = msm8974_noc_of_match,

-- 
2.47.3


