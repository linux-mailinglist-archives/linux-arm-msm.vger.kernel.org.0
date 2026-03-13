Return-Path: <linux-arm-msm+bounces-97340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KfAOHrCs2mEagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:53:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BE27F042
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5960A30902FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BFF36AB5B;
	Fri, 13 Mar 2026 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xc7rT035";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BU89UBH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4E1DF751
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388364; cv=none; b=ER2OqO72226MYdqYA5gM5jzmz5DXexRV2L9mkFwp8hKE12gJ+RlN4IF4R8afQf0zLg3SK/vKHyEphw26lK50NPMSGoSxlB0OcTL8V8y++JZkzsyIUCt6PEyOdTgq1HtCYs2ahibrbKsVlk5fYZ3zmplnlntTVdSOs4fo2//8XIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388364; c=relaxed/simple;
	bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCl5jnZemFYB1OjN9aKqabHiiP3Mj1SIE8OrPjcWV6xNRCSZBhdksoqJFNeMGen84WvKId20oOX8phxLgN9tyUpgp8+WSLGWi8HlJHwUmhgWkNXeceOPOoVIoHcSwI8F2fyLBUtve3AZXoqRynlUGFN5QMFq5YG7z+AwCMhMohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc7rT035; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BU89UBH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tfJI3342548
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=; b=Xc7rT035dfFjlpCK
	27ikKlBLb+g6/EC6C+Kwtm6953+as6yEUSH8LC/fXD2pu2OwkFt5MejO/D9O/luG
	gNeRtruo6N87VnwgHfXC7zTLrCNH8bYDj10R/Knq9/uo3yVFEj18NIAqyErSV7ck
	rrHJ7dC24eGJ8JL0IMeSgpKUQby7tx8/YN9TPBHpkseG9FXnzIz0N0jDtNOk/KgW
	IJcCosh5FhR9514Cq3OoCeAp8ex7VEmac5rnW9R1zRMVzxVAm0E5tPrFVZA2uxZf
	7E1wbY0yk/rT4Cw78p0irxj3fh/2d5aKwHRnyHFKy1eXnNs9y7csrD/yFfMW2m/H
	vTgmmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w3t0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7de0e161so1299440085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388361; x=1773993161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=BU89UBH6815giy0TaTOB6bQgfHljYi6Xw1Z05x9A5JPjpLykP3yD24F19NR0g5s1YH
         enFr0dR3wxSXC3fRGXbGidNb6IP07ooL78xELgC9gHsqwY9xws6UkuLKcSGyD5z8t0Y6
         WAv/77MAzf37nAXaImo1EfXGNHAwyTtKZeZ95v2Z4doacPp6mzUspBc2Uzfli6InO4GU
         9je89uAlbSpxjwG6gOvI2hXERfayzmU6C605wrjrfGIh7Ax7n8IaxwevSUFf+6aHtmxV
         shRAaqFPdbWIq8gLsHM1krM8sX1pyK+Rp++dyuNIgrn88vcVWhluE1xP7WiP45P8EJPB
         JaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388361; x=1773993161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=FKfrn7wRq32GX+1ygd+KnkFexMOluJNFe94Z0uYSlAJbQiT9uYpuI7bgYI5Jp38RrV
         IDJvgBRe7P5zzkxSbuIJVVAGwNPszB6a4o5zUa0kYLBd7Wq08GbH/M/7G6ux/5nynkIY
         luZF3ME3dox17zFvqwTxvydi/dmnvMc4wjOGfZUkfEQVX0UIXsrfYiRZS+A4lPr5rFDJ
         1CH6JfqF+i6MP6agbw6Lt0vpExo7XlVfKvz1givC2i/YV5AKsvSJ7YDncuUBKzd5ae/t
         uZ3OViX7HfBq/s/8j829sLCCBx2D3pKHfCB3wl8J4n6mW5r9iAesOmNJ+nwadmGb+1dI
         DJKA==
X-Forwarded-Encrypted: i=1; AJvYcCX3ED9hW9LNH7gfACEKK++yoEtC7HJBgQtMezCobbw/ye4IzWKPIuS28uEw/0uf2rVhyNp0V9b3y8HDRUXF@vger.kernel.org
X-Gm-Message-State: AOJu0YwBkxn1MuTjgucazeeoCGpWp2qOS6GAUuJLeWRGNFh6vsAjG+Al
	PRbJsQBz9mAZpmk4DKAXtajzlkjFPuPCKtbpQxrMr41iX3lVhqjVtNm/Ta/QlIyw6SSyEcaWmfn
	YU7XRY7jdPbyNvN0bhpYwvKhlPY8HkXm0MPco7DekcAMBD4scCXjmI3nTVIq/CNqcXlao
X-Gm-Gg: ATEYQzxijCpgYFh9K4Z+Cx7hMz9Pwro69zvSGID/n+D2iYhPqYo8eSSE8lhY7wG/zvo
	aKMUXd2izVSZoJg/yid/ZTUDV8J3OTdVqnmJf44173xCoa6GpupGiScMbYDSjjiNWwHsGMHpFq3
	Bsx0Yp49VUaJQxFFf3ulquLTt+QoutGbTM5H7k+L6jyy8xsCjwg7IbYnarMjQ4GX+8f1fAqzbEu
	um+r5ny1Lt5a6sFU3bjU/2B0Xoz8pK8U//ZO8zHVABHHeoedb+DBk2/G5r9ufkMCzm691z1ykhD
	FCgBCuzfg9EUzaL+9cG7ubCaRzrH8pJeDjakZrjoYc7HlbltUkaq9XLjhIs6AmNResfaKXnrKMW
	AhPUleizbSSJY379c8f3iZz6CH6pUz14lPhFBqfKMl6xx3s3k9ZfPYplQ7/pHn/SQSrA0TboM6+
	2ROylXsz6wPZoqMxl3cZbGN1icz1aJi8ghrvQ=
X-Received: by 2002:a05:620a:4142:b0:8c7:c25:9e69 with SMTP id af79cd13be357-8cdb5b799a3mr323987285a.66.1773388361496;
        Fri, 13 Mar 2026 00:52:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:8c7:c25:9e69 with SMTP id af79cd13be357-8cdb5b799a3mr323985185a.66.1773388361059;
        Fri, 13 Mar 2026 00:52:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1347475e87.89.2026.03.13.00.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:52:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 09:52:34 +0200
Subject: [PATCH v5 2/8] media: qcom: iris: use common set_preset_registers
 function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v5-2-180484af4490@oss.qualcomm.com>
References: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6499;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps8JCMYRbcb7MpXbZRBD5hUvy45i1g3M9Ljoyg
 qUKLZfQORKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabPCQgAKCRCLPIo+Aiko
 1TvQB/9EB8yYiUiMPteGtEpd+PuKLjKCpsqmeK6dWtVufGLKx5pJPDiTbdaJaAsEPl5WuTMPSdH
 zOH4NXDFkAtz4Q1IqsA+HkSL1NrNHwGykIb3W48uItK7GmoPOXH1NuoUoU7HxubY45UF0QK+sTe
 +K9dG5Ur34QqTC/NirdfpStXiVFCecpkPNzigZJx18L+Pe5Lly+M/79lqEq3vrkqqgG49fkV1n7
 5E8wPWoSOtmPqvP61f9bYFIObfAGNfQGl0U3K90J02jzJmTgFbyxeG50eVHkE7usLxz4q0KlkcI
 dDXN658d0Q4bD8cjPvBxwJ3nKnHIzqPJaLXNCYDKTb3QuTHz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: IPjU1RxBTSpPc69GOVzqO1MXenCBsZX6
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3c24a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfXwxmQmlPPpT0v
 BzBPHz5TDehf2dnGn7QxmQYJ1A7N3sfVoKop5vs+Dt9f0XunBgO847Bi9Y1wQE5qtw6gaVywavh
 VY+8jKpZUXvR8145TJw0KOVkimFRUugn1G5OdhnzjBnr3THgPekfqHVOh83SxrZSkpQPDqJtKcG
 iTNv01y353zjlhOwsCdefvee4sbibxqJWKEnptad71qeIm//8Ir3M6mQoDAxvT5kJDKFSCrVsaB
 mxREdfILY4njOiFfYR6lFzGDhhg1NwsjiAC49wucwYPU86aurAN/N7W7U8zV2guykVg+BCztvwV
 SAJR446pY7CliG+IZEhbYMFUlPjVnbnVXIXBZCJDrakYRvnjNiaLcfhbJXnYDAOi5P6rTUWqrZk
 SGhMMMr1Wtbap8QgxTN3dSQqsJia0m8ce4Ar5MfRsdYo9vThIi4ARuzonYB+aGi0N/hAYKwLk1N
 Sta422S454U5MGhGxCw==
X-Proofpoint-ORIG-GUID: IPjU1RxBTSpPc69GOVzqO1MXenCBsZX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97340-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D8BE27F042
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..d7106902698c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -207,7 +207,6 @@ struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
-	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 07ed572e895b..ed07d1b00e43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,6 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +391,6 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..c84d4399f84d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,6 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1012,6 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1107,6 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1204,6 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..faabf53126f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -468,7 +468,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	core->iris_platform_data->set_preset_registers(core);
+	iris_vpu_set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


