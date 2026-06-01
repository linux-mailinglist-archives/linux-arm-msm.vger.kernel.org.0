Return-Path: <linux-arm-msm+bounces-110627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mElqIrCpHWp+cwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:48:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C2E62206F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89DA733B1BFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ABC3DC4CB;
	Mon,  1 Jun 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRMXpgxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqbFk/2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BB23DD51A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327885; cv=none; b=bJickmE5fh1QS1wY6SRAYmv4z9y1h3LzkIJgQ+JDHKY+drocwC65o9K5pUPNseKX63OQDms+PyZ4DXZ9fNoQbMpYQQMgK2bISbnHHDvJW55FDqagTnpNy3cyY3OCKJaK3ra1NRRIHF1VjUzoYJPgYsAJj3kMEPKYasvYrNxX890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327885; c=relaxed/simple;
	bh=adx1msWxA++Fh1PpPgwxpWK7N0yQf0Y0EEQ0cVJu9KI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCtVmjePBmRSKA8s4rDrCp0z0A6XuzTJ+CfVuRhEvbllKxeDKohk7N7jN0kyF/HvRsgthKMMBN6IVyZZp4iCH/M1AhTZ56Izdn6vtKtldUF2VVCHi+3x7da2GdP9QjmsuyY70mvc60lY+9qqpu/3BSeA73+mSSW0MTl+MZSDQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRMXpgxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqbFk/2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651AxGbt334647
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 15:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ii7fyGQTy/LBy1oCRVi7nI5P43TAFRbH9oiPCikSss=; b=aRMXpgxvpNJwTDYI
	m5lPVLJrCLXdgf+5EIIMoHglObjoXe0pFzMEB5T8BjGNksSN+ZqqbYHGngCOp45O
	NlOsvWQRVKrKjgw9PLHIaIf0A0WIbs4OHqXyiOiYbRnZtw//41wPgBCy6ewYG1kx
	U8je/XJBXJMnzImvLs+i01PND2aX3CyrM9H8BGX+qBXMG097zbd1j5Vyl5lqmycC
	1lDumkaYHA+jzktCX7J8A0rUwL1tkfHo6ILeX+Y49dOTe5isqW4jxzEuHYj1dJn5
	EhV28trRwnAwrpn7JdtdvkD7heZ3/n+nwWdN+LrKvI2LK56FlTsleKF2QzS+ot76
	b/GBnA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfs61a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 15:31:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e7fbfaf5so3415952eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780327877; x=1780932677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ii7fyGQTy/LBy1oCRVi7nI5P43TAFRbH9oiPCikSss=;
        b=dqbFk/2oae5fxumTQq43nKIX1dF5bX4Gv+aRl8HYrePEBUSaeElDkaxmBK7aGowUyk
         k4kJaqRpAL7uug7ybrF+VHkTZQKHj634tmiJC207Kq0o0+Cm/PlaMH/ycu70Df/1jnrf
         hJX7A99YrPgp7y1dhlwKnASBOIVQOB4YT90DtNy5kqTOJhfdG4KFA73QqDZ0rhajtnb9
         6IeZAbhO06qay5iqrmO4PmXdBKAOTDZ9eXgLPfhJ5C080ySQMyXhJFhh4L6dwifKg3/a
         KlHULxZMsSZd2hY4EQfrL/3RrxMACxcnuZLOcUkCvJw0Yb21J18qMb3UoMl9OO5zYVgn
         pzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327877; x=1780932677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ii7fyGQTy/LBy1oCRVi7nI5P43TAFRbH9oiPCikSss=;
        b=osupK2CfF0r8yGhIJM0ihT+taTDIlkbdybC68PSdCPXRR+Tc2amULwJNXasxY+3SDO
         WXYdlYNy5TA++fKT6qIZxLwzlNj8J8zPeZ17zqfB7ZZ719uyPsNV8gCgG5VTUhxruluk
         xr+AyleNQUik/Po7Yu3j7Nfo7eo6Y+QA/WwWwx/LplDaMKXxxFkssoR5vUDAiqOvFOQH
         glUOS9TOdhxCMFl406wyeSt4zVRJYsDp2XdbrOy6l/P1jCHleEYR+OHmCmvQmZMTLNcR
         uDJu++DlRnW5qNJmUJ7hxhJJYBXQj4ZRQ0TmIPC4pCLJx4Yw99Fj4CwmBPvACypg7Zns
         NK3w==
X-Gm-Message-State: AOJu0YwFc5M0CQ/8miqqN06YODReVLtlohebWtlWJE1sygJ1WbaPh91X
	MFpZQYIkpw1OgBj0aMovkNzSRhmTTx/6Vb3FGKtAPyL6RFs4j2LgCZHJW7cmGP+aPwd9wkPiJD2
	U41xO0HT/wQeh0lfIMBlZK3QdKBAwmkItWQzRl9GnAcdNGfpZOU4wX/9B/2xADzlnMe43
X-Gm-Gg: Acq92OFZKTokxUXbbXaVxuol3zvo41tFYDHHujTdCJWtNWw0H8BWvXXlKfICWacEVgW
	iKFZNE5R64uNJqL8iTaL3IhW8gRPcLu6gdkUsnOhv6lE5zaz07cpRblqYcK2kHa1rwvh2tG7kLO
	lEvU+xnV57pju7+1ebRmsxKt8mKpg0NnnrZVnUr6Uwnf+s6wqKoW+6RqmTZpafkN0UIt5q3Y8ra
	mjZKMbLG4WWNCDuMLEXinpo8bJg8UF/D7ExLRQZ5fQaSWBK7gH3v4jUX51vXXwzW/GSsj7ScqNc
	+kncJyFQfyTiRttyznQnWdinGPlMM2lDLyMHllgUDltgURtj+HqiNihUBBAukwO1MNGGCZiFNEV
	xFNvQmpzBssz3/UNsSD9ZIbc40r0uBWz+QufPkm221NiPFfCEiGIjB9oUtqzJSPMHbHp1KsQ+Is
	KOaoYXUtNKVyE=
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4571160eec.27.1780327876959;
        Mon, 01 Jun 2026 08:31:16 -0700 (PDT)
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4571122eec.27.1780327876327;
        Mon, 01 Jun 2026 08:31:16 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2efb4esm9207707eec.8.2026.06.01.08.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:31:16 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 08:31:09 -0700
Subject: [PATCH v14 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-kaanapali-camss-v14-2-e76f26aa6691@oss.qualcomm.com>
References: <20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com>
In-Reply-To: <20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: UwdFgTDIPZ42HG9ve8g2czE1uV0HkkHC
X-Proofpoint-ORIG-GUID: UwdFgTDIPZ42HG9ve8g2czE1uV0HkkHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NCBTYWx0ZWRfX5xkvrF0OzJJD
 xHFLdT9PfRIg8PkPd4qzNvCYtTv5RVKANh6HQn8Y6hnHR7nolo4gRjAyRmjI+VrWwxFyz6wXp0D
 SGnmxVyLeBvjov7zL4NkfNKweph5ZkByn2nBr0pX2D5SUwayn42X8INT0slLMV27Qdo+VUozGeY
 bVXtRbx5yJlgPREJs6xAT+RZ8veGg4lIAgf52BJIVVwEK0scnM0Oxs/KhUktaS1EwuJUJSmhUck
 y6QN5MnrHfoCS0QVm5MfulIU0fzla0RIvnaTFc1G0TrLEEO0cwUs3gBxNj5ROT0r+WtvkdCe6Zs
 92RIBuK9zevIyvNl+KX5B2UwYDrMYgoA9JOk2W+zQnytO/jKjV89Scr/WlRwHfG9LSzLo8tVfFL
 ov8W7ckqEu/16Gk6FKl5UtVks4zVupgBOWRhreQ5zrbNUOIAwnekC9WxtVLBf7gsINYcI4urX+x
 406+d7xr0p/CeQle/Lg==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1da5c5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110627-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19C2E62206F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..40d74966ef9b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5507,6 +5521,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5740,6 +5761,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..2c7a0218a82b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


