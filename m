Return-Path: <linux-arm-msm+bounces-94571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPWnNnWoomkn4wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:33:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0031C16A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F30731A58A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFF63E95AA;
	Sat, 28 Feb 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqlhvOU5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REdSt3/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B43E8C74
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267357; cv=none; b=jq5mZ8nmxqw6xEa0ZWAEBKh3HENmZCnZhUyHjMQqFALMjGTgeu66+bjS8qP7L9jv0H2ID2QEqrH0FHfUv8l0alTDdjtkmRn+T/hKZCwOqeQD6FCLxoQvsRxWNC9W5MaPw5RB4YHNg4E7ISI3s8oXELJK+Rv+AsB/Y8At3m6N9b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267357; c=relaxed/simple;
	bh=lcFLNWS2IG7XBP2GmwBY21dnUEBknQz29whO0klw2/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqEuPuQq/75pUExH5bwmJ8vXCSCBSJtNp89P73FgYVjSJQ2lyGjr8FFt33nld1bkvLBqOI/d4oVfzFYuZKvfdXmwfueiGWT5FJzhzzQqrRs8KKBzvEL7/Vo1ZQQmyug2rIUDp7TwUqHZUVijLVIi0PGoHXXxICGCILxJNmB1MMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqlhvOU5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REdSt3/p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NYvJ1782353
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z67VGHsM9CA5Ay41Du2N1HGupggcwxzardoZ4R1Zmmc=; b=dqlhvOU5xZCIeakO
	cROHszGn5VM/YLfwr3/IItF2oravvfx7GZV5QAsrd0erEg8LfHyGBWwwZsfYRWHv
	WvH1vmdPcRwCi0Cn1knFMvjSJ1w5wVyCsbynFS8F8sdWJUqPLurB2TKsf0owbpHG
	+KfbdZR5OZejJJg6bTyWw9p3UF36RNhAhxGe8hTZcrAHfV28ngs2WOHrCPle7kFw
	3Z3967a3dGLFVAwGppnoAg95ryrLCUZXmfjHRDKHExC0vXldQwX73r4PwATzt9Vm
	4YO0cLafr3EKQFjhoQrphgGgzGbNblIs5DogCxLiFqARGnyRBExuibTgSl7QdjN7
	BcWwOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrrj23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so2087136785a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 00:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267352; x=1772872152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z67VGHsM9CA5Ay41Du2N1HGupggcwxzardoZ4R1Zmmc=;
        b=REdSt3/pop/Pkuy4OAOkQ2jA7494WhZ+EuHRSZS3AlAVjBnrNhHujIZTjT4ymibhvj
         nmQoQqk9WRSXU4SA1H6gYZbqhy8oJYoNVrdNpuR8edXRnx0av9mcsExVKZ+LTa1tnFRn
         PofR0/vgWjDRd3B7jvhRBceSeTCbCRaMpitE0GDgsD52PQfEV8fNbFfILyE3VsnUf34k
         sS1qtNS3vjInUdrn0FzD2vaGiwkqrG0Al1aO/9jrYrjSutauwrsPLGtklslRkNSZhHlm
         zaTWsTC67ADRCkgRli3kptQFKUOmQXbfEJcQhDCg4lOnnwtNPvP9a2N/UBm7wEnAz5rn
         vL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267352; x=1772872152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z67VGHsM9CA5Ay41Du2N1HGupggcwxzardoZ4R1Zmmc=;
        b=eoUbEV4tcACuv3o/ygweF+BMMo1M0Zo8V3yxGNkkXGomXiAGI9l4ep3rPEsd5q3jIE
         p3Gq5vZmfz2+gOgVP9jueWbaEE8LU+HoKXa1rGaA/YIhuRFRZ0ZEVX3TiVEzv4n5YAkC
         JW3yisyGe+ZQd5wDVBFIcTccQWQUwEZaCqbctV0cW8u+KFGpPQc0KtKNTCrWvlBZ4xMt
         zoN1sfWcyNTjRq8v20wkhk3mQXmS9+m5/OWLWLW7I1B6k7NIpYxWYtEjEYjQPFhxjHFs
         az9Uifl0lhGk/FYohc8AflrdIhSY5P5CakGEL0lFBvXAWUGBqPXFwWSpIyiRj0nKR0rT
         CVqw==
X-Forwarded-Encrypted: i=1; AJvYcCV5MNN3PYQEMNQWnj4qDsCt9Vx4l0ZvXjzeazQ+z+LlV4RnBFLdz4Pb+63NkIxO7ANEIFO05lOI/aYPzO/e@vger.kernel.org
X-Gm-Message-State: AOJu0YzUwXHsjpSsOOrauKyNbgV92LuBEhenl+EfA4SzKj1XUeT5nRFL
	SepTQemiGPRujM2oGHAT+VT86fUaa3iF7qYbJxLeNF4W+YQtWKEVeJF3JvGNzc2sp6p0QDHkCWI
	aMT9RMWuzKZnjtZPg1/G8hwn0Wy7gL3RH1agN6zsrYpjOHrHKgIJMqTuaOda/sQNXDirv
X-Gm-Gg: ATEYQzyYcJT7A/6qT+RF5RBPkWAilrgYeNWiy5vgGbQC46LGIEdJvN3iTKYpgF4gCgy
	RwniJoIVWd8QCbf3Lg1jS9ID6kVS3v3nLuNYxgJZqHLr2yNrLUFEjaE2nNSkgDG7eC5/CF4Vuib
	2cBTkdpN7Zm0QFLwpG9ZrABn4xAP3y+vdxZ1JyYosWgPDR1atil+GHzMQQNzdagkVtATlr7/fZh
	4KvQmmvjXMfpPS4XDFFFtJUZLR8QsKL6ir9Df1ccNd0JNnRl6tMzfpCFMKHFHqPkTajXX5aNeMw
	qo1XA7XAmidhEi9YIR7uVicMHAE0VhsPPa0/zfZy8Z4nycenDV3o98oK5ykmbZ8KtivMa+LkFWz
	MDmgcCV411IBoDvcDswHbuj7r9UW1tOWcb6oiJymMHhwDnFuWvn1BfDHiNdCtnH7SnuYQCJi09M
	4ORd5qp38OTCWC+ug7588duM0F3I11+u8CK+k=
X-Received: by 2002:a05:620a:25c7:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cbc8df6970mr752077085a.45.1772267352400;
        Sat, 28 Feb 2026 00:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cbc8df6970mr752074685a.45.1772267351940;
        Sat, 28 Feb 2026 00:29:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:53 +0200
Subject: [PATCH 08/11] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-8-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14556;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lcFLNWS2IG7XBP2GmwBY21dnUEBknQz29whO0klw2/U=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ai5Q4qqcJs62xvLJZVqVp3tW9H7tkc8SCjKScLvRlbD
 Jvz+6Q6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRMBv2n4wihdZsqlX/f/Rz
 tMVbt89PU3t/t9t0nc63/HPV+Tnfn3jstrBZ/W7GTeYHvBFLsvYtc36w8MTh/+zr35cUmf972CB
 +9cDqRrP3R61Lg5u8bGcE8ddxdEs8zt3w8G2+zacrUkpbpq5Uczk286iOj7F/wsmMO2LuW28m3/
 6t3CrhwdpZXDrDnSX34pEIkc5KTrkn6x8XV0+bE1086+iv5JnaMode2f5LTfeUZnjpVOz6NvSyy
 sq5JqtuTHHhsy2/undt9Y3qOFuOrO4txgkWCut4nA4eivvf43ryTcZa0T3Oc5wzz765qsh3crYM
 6xalblnTIE7t3nItjUQVLbWIa67bOt3OLH1yMnfv1u22AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX8PkzG8NXqgs1
 o8C/jI0zWEKJO1hPIdn2p7BTgZVGjbyB7RKziPWC/YrRL4XBtLWASKbehQas0RBdzk/CV5BgAet
 KbOFea9bSRyQelOw7TJjUYWaeWaue6EIWnaoJXojIMLmbep3ms1MyTIgwJ2Ic4kMhxK2h4U75GX
 6Zjm8HcDgNHil3bG+b96SdTNFPjk9rwXVTbd41KWwFaSHf05ua1S7+r4s1/BYsNcojNwQ6vSIYG
 iUSEpr2aFL5it5WC9xk2cUtlldFywWmezRNXwJW9vIagnNO1a39T5eGhUgpR/ojXMiqwzd3Vr2B
 UzqqeCuUjyhkWqMM5ptaQ68XE/H7ilT2f4VTnsc0M5ua3AopNwzIn/T7jMo7AXAbBd4VMDuz5cI
 jSol9R++r+omYMWzu3ZCVxvpHjvc1gGlKDgDVJNIhn3TbAljy8LDsLVbUgo47sncbdWUGwHconY
 xoioLiFHYooDGaR56ig==
X-Proofpoint-GUID: _KhRSevXa3nqSklBoXnYCyFmQf-xPB9T
X-Proofpoint-ORIG-GUID: _KhRSevXa3nqSklBoXnYCyFmQf-xPB9T
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a2a759 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mB4mtV4qES501vYzmaIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280077
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94571-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 5B0031C16A7
X-Rspamd-Action: no action

There is little point in having two different structures for HFI-related
core ops. Merge both of them into the new iris_hfi_ops structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h              |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c        |  6 +++---
 drivers/media/platform/qcom/iris/iris_hfi_common.h        |  8 +++-----
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h          |  4 ++--
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  |  8 +++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 11 +----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h          |  4 ++--
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  |  8 +++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 11 +----------
 drivers/media/platform/qcom/iris/iris_platform_common.h   |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_gen1.c     |  6 ++----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c     | 12 ++++--------
 drivers/media/platform/qcom/iris/iris_probe.c             |  3 +--
 13 files changed, 31 insertions(+), 55 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index d10a03aa5685..d919c7c16106 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -112,7 +112,7 @@ struct iris_core {
 	u32					header_id;
 	u32					packet_id;
 	struct iris_core_power			power;
-	const struct iris_hfi_command_ops	*hfi_ops;
+	const struct iris_hfi_ops		*hfi_ops;
 	const struct iris_hfi_response_ops	*hfi_response_ops;
 	struct completion			core_init_done;
 	u32					intr_status;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 92112eb16c11..d6496e0fabde 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -76,7 +76,7 @@ u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients)
 
 int iris_hfi_core_init(struct iris_core *core)
 {
-	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
+	const struct iris_hfi_ops *hfi_ops = core->hfi_ops;
 	int ret;
 
 	ret = hfi_ops->sys_init(core);
@@ -109,7 +109,7 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	iris_vpu_clear_interrupt(core);
 	mutex_unlock(&core->lock);
 
-	core->hfi_response_ops->hfi_response_handler(core);
+	core->hfi_ops->hfi_response_handler(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);
@@ -144,7 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
-	const struct iris_hfi_command_ops *ops = core->hfi_ops;
+	const struct iris_hfi_ops *ops = core->hfi_ops;
 	int ret;
 
 	ret = iris_vpu_power_on(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 4f26b010249a..21bb35261073 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -105,11 +105,13 @@ struct iris_hfi_prop_type_handle {
 	int (*handle)(struct iris_inst *inst, u32 plane);
 };
 
-struct iris_hfi_command_ops {
+struct iris_hfi_ops {
 	int (*sys_init)(struct iris_core *core);
 	int (*sys_image_version)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
+
+	void (*hfi_response_handler)(struct iris_core *core);
 };
 
 struct iris_hfi_inst_ops {
@@ -129,10 +131,6 @@ struct iris_hfi_inst_ops {
 	int (*session_close)(struct iris_inst *inst);
 };
 
-struct iris_hfi_response_ops {
-	void (*hfi_response_handler)(struct iris_core *core);
-};
-
 struct hfi_subscription_params {
 	u32	bitstream_resolution;
 	u32	crop_offsets[2];
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 19b8e9054a75..1c970243532a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -9,8 +9,8 @@
 struct iris_core;
 struct iris_inst;
 
-void iris_hfi_gen1_command_ops_init(struct iris_core *core);
-void iris_hfi_gen1_response_ops_init(struct iris_core *core);
+void iris_hfi_gen1_ops_init(struct iris_core *core);
+void iris_hfi_gen1_response_handler(struct iris_core *core);
 struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index fde8219309b0..7f0e5a75a301 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1028,16 +1028,18 @@ static const struct iris_hfi_inst_ops iris_hfi_gen1_inst_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
-static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
+static const struct iris_hfi_ops iris_hfi_gen1_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
+
+	.hfi_response_handler = iris_hfi_gen1_response_handler,
 };
 
-void iris_hfi_gen1_command_ops_init(struct iris_core *core)
+void iris_hfi_gen1_ops_init(struct iris_core *core)
 {
-	core->hfi_ops = &iris_hfi_gen1_command_ops;
+	core->hfi_ops = &iris_hfi_gen1_ops;
 }
 
 struct iris_inst *iris_hfi_gen1_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8e864c239e29..bfd7495bf44f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -688,7 +688,7 @@ static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
 	}
 }
 
-static void iris_hfi_gen1_response_handler(struct iris_core *core)
+void iris_hfi_gen1_response_handler(struct iris_core *core)
 {
 	memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
 	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
@@ -698,12 +698,3 @@ static void iris_hfi_gen1_response_handler(struct iris_core *core)
 
 	iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
 }
-
-static const struct iris_hfi_response_ops iris_hfi_gen1_response_ops = {
-	.hfi_response_handler = iris_hfi_gen1_response_handler,
-};
-
-void iris_hfi_gen1_response_ops_init(struct iris_core *core)
-{
-	core->hfi_response_ops = &iris_hfi_gen1_response_ops;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index b9d3749a10ef..b981a1ba6954 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -34,8 +34,8 @@ struct iris_inst_hfi_gen2 {
 	struct hfi_subscription_params	dst_subcr_params;
 };
 
-void iris_hfi_gen2_command_ops_init(struct iris_core *core);
-void iris_hfi_gen2_response_ops_init(struct iris_core *core);
+void iris_hfi_gen2_ops_init(struct iris_core *core);
+void iris_hfi_gen2_response_handler(struct iris_core *core);
 struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 502767f1593d..12d286be94a8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1405,16 +1405,18 @@ static const struct iris_hfi_inst_ops iris_hfi_gen2_inst_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
-static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
+static const struct iris_hfi_ops iris_hfi_gen2_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
+
+	.hfi_response_handler = iris_hfi_gen2_response_handler,
 };
 
-void iris_hfi_gen2_command_ops_init(struct iris_core *core)
+void iris_hfi_gen2_ops_init(struct iris_core *core)
 {
-	core->hfi_ops = &iris_hfi_gen2_command_ops;
+	core->hfi_ops = &iris_hfi_gen2_ops;
 }
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9..c350d231265e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -977,7 +977,7 @@ static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
 	}
 }
 
-static void iris_hfi_gen2_response_handler(struct iris_core *core)
+void iris_hfi_gen2_response_handler(struct iris_core *core)
 {
 	if (iris_vpu_watchdog(core, core->intr_status)) {
 		struct iris_hfi_packet pkt = {.type = HFI_SYS_ERROR_WD_TIMEOUT};
@@ -997,12 +997,3 @@ static void iris_hfi_gen2_response_handler(struct iris_core *core)
 
 	iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
 }
-
-static const struct iris_hfi_response_ops iris_hfi_gen2_response_ops = {
-	.hfi_response_handler = iris_hfi_gen2_response_handler,
-};
-
-void iris_hfi_gen2_response_ops_init(struct iris_core *core)
-{
-	core->hfi_response_ops = &iris_hfi_gen2_response_ops;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f5eb17ae072c..8e330ce5e726 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -202,8 +202,7 @@ enum platform_pm_domain_type {
 };
 
 struct iris_platform_data {
-	void (*init_hfi_command_ops)(struct iris_core *core);
-	void (*init_hfi_response_ops)(struct iris_core *core);
+	void (*init_hfi_ops)(struct iris_core *core);
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 392f9ed94ba8..1906e480e2ec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -315,8 +315,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 
 const struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
-	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
@@ -362,8 +361,7 @@ const struct iris_platform_data sm8250_data = {
 
 const struct iris_platform_data sc7280_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
-	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index ef70472ecde5..09dcf01047c5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -820,8 +820,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 
 const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
@@ -877,8 +876,7 @@ const struct iris_platform_data sm8550_data = {
  */
 const struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
@@ -929,8 +927,7 @@ const struct iris_platform_data sm8650_data = {
 
 const struct iris_platform_data sm8750_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
@@ -983,8 +980,7 @@ const struct iris_platform_data sm8750_data = {
  */
 const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 17bb11513648..c2d174a6e160 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -257,8 +257,7 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_platform_data->init_hfi_command_ops(core);
-	core->iris_platform_data->init_hfi_response_ops(core);
+	core->iris_platform_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.47.3


