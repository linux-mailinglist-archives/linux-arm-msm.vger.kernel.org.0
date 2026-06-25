Return-Path: <linux-arm-msm+bounces-114507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ZGvJM0HPWpxwAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:49:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE986C4D65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:49:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IAWvewx+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fkUPkpo2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114507-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114507-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0109830B0453
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D380A32E696;
	Thu, 25 Jun 2026 10:46:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3A344DAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384401; cv=none; b=cxGHv7SHqITWJEe/DFOcxsVh7nwuuiDQ++irU6rpj96vr2JY0isXrDRE0VWm5UGa+2alupPgnOUgeiDfEXX8xuOd3e30wFA8ctt87lCTHcsP0LhEheU8ANIEvjQgXafVU7btdX3Ih9uoFqiuL/SxC/grFjPvlE6x9oX38XxJLZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384401; c=relaxed/simple;
	bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlenvbqHmUZUtO8oO1Mvcz9hH5w2YmQphlm9WuWd9J9bG+NpyK4mz0+ZTps/8fzfBnbK1PeQCKcUb5Qkuy7WFfrKauBpeEWhwy7IPBRvasMBuS2mGtEkhNANfYnyFm8IN9ghV0VGzirjIyVs+LB1gwemI56deL0Q80WYX4FLC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAWvewx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkUPkpo2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k0VH1398023
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=IAWvewx+UfFggX59
	QOup+8YviA4zd/pUe1HoM5Fhuq/KDSaOgDuQK3BbyKjQINnZD5SkKQt7DcZkf3CW
	DpzjOVpK7H/JK8Dhz5haHq62lXo5C1uJs17KOZVkjYqgJ18MJx54o2GI94IDLRW8
	9L4XU2YPW8E7F0znMLhZ832Y6QAs44OmKjmLBx+Cl1tLSgMLDaUMMX6nkXMNZNWl
	iTT7I2GyBFvSX0Nk0sgWxN1F1G/XpiNPV6Q95Zmf57cV2jaoEZMZrylR1NNvuS7C
	WpCsijJYDgtgPk60aB1T/dt8PA7/hnOHH7EZCwqGn6um8U6Bq1c/JPCqwFJbVTX1
	LGv4jA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudhqq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a9bbcc53so20711175ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384398; x=1782989198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=fkUPkpo2K2mXN5rUvdtewRoPj3KHl7vHZvgBNDFJKjhRYm9jBCK3lnBmZQO/ex30TD
         aGBJqNQEzBHHlknA0hfdweTGYf9vKDaqGJxrFJVpWzFRendCKp5BZrtElb9NRj1a+/Kd
         jvwr0JuPV3fw/6V2VYplroNLFCaLwuoenHgz+DhoRRTqy7h+BV91Ms/2DeWgTWN7VQYm
         ExDmJbFLLPETaR/imYpQvujvWgzwYmVWo2EpkGepx50TB/+nkughBIoun1m3Un6TBNd4
         fMpEn4Mj99JKUGc80yTQoLHff5g+S5yGgRjeEInqKYvnEYrvs/3dULOMS58qB4Mhh9ua
         JQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384398; x=1782989198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=o/XBAbsJ5FMB5OP9EMLyT7GaepWA3UnItJdpdREIN4yJfwxAjozEwlat3b1j2Y00jD
         fwXnEzzctteCyY1KVVxns8IQO8w9iYsOHT6hxRAMInrpg3QLQ/jWkmWRrMiwZI+J0txn
         /a9bUKVHhCifnkdqhCCnvk6XAr4y+bjAG6BWRg9Sya8SCUuE9ZyMlKETR0B40D65iMkL
         riH6p4e47MEXkWMyqzIJUbLGjemI9WIfgLXAyYkZJd50MaXkRUyyaAci7+wkb5JlJgrT
         175lqvXY4wn830Dtkv2jTq+PCIGOE5y0HIsmcuneLqM0Z4ueudIYH/6Ve5tE0OMQgiSj
         8HMA==
X-Forwarded-Encrypted: i=1; AHgh+RqiaAiiPIW6OXKgrxLDYJE3uj6gH2XQ3QrQDeWqJuT6whYPMNmABOtCDShizIg3AUwqStEsJ7PUE89/ZhjV@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6e3ZZHZpfOrz3oEhwOokbzHB9ZG8yAXD4gvuRqcktCRBrhtB
	bizvjhUB+6sjJA52ZGn3WtHU9w2iteOCzTq225bHnGu7PQuqBHZ1zHqwzCpSnAIOu8c/rsobeO7
	NXAZC/lv0ElvST0Ehismc1yEy+lKkbcjJ91BkzaoskwEJvhv1gVBXegHg4nmRCQyVw+WS
X-Gm-Gg: AfdE7ckOoJuyRL8keJNgPtc02uxZe9MdC8kU8thSka/0D8m1sUNS9WM1LC3CGUq5G5l
	+qxSvG2otJXABt/l+FaZmlWOUs2vce9eVzcTewvmWJIKABsaingj1rHvm0zbNJjX9Z989NYWEle
	7AAZBYoZFCcXlToCq+A4ENtotLvZ3zqK43UM7pb4hxoP+yc+JIrpb10c/XOOgmofVVj9JkM0sqd
	ttV1AD3j140X085f7QZcPeDw4ZOYqS5muvO5FQM2XneRRoSWZ39ikIh19No0cSzSpxxWJ+4Br4m
	YgetptlP1VoiLYuERukouNnRzS7bnq4Y7D3BFsPE98ZZEOXfekiAmGme8VdpNJXVcxKEHtjqJGw
	qIiqu9nJWpYmKI0rZ/MEQ8H3h91BBK8e0Rij1KeCWXoDltlYRSqSUtaov7jQSG26p0hnIzvWr5g
	==
X-Received: by 2002:a17:902:ffcb:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c7fc75a023mr22142965ad.6.1782384397657;
        Thu, 25 Jun 2026 03:46:37 -0700 (PDT)
X-Received: by 2002:a17:902:ffcb:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c7fc75a023mr22142505ad.6.1782384397066;
        Thu, 25 Jun 2026 03:46:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:36 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:53 +0800
Subject: [PATCH v19 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-3-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
 b=mAH0BMPCvVpUPe3fys7XXrZMV0kBBjHQcALCqQixnnQY8J3MudGkw+q7Jh1fOiIi8sQK8Cp9/
 AMvYYPUBqEUAsYKHF9x4A/F4a7D8MfQQEHmUBcguH4mjbIrcBpdaSPI
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX5CtNbUNHLPv2
 VNs++ph4dDQxBF8jO9QAu9cwhxExln5eCfUs1SaBNUFtI/QinwIyUyfqLDmbsqGc6rerrN+e4h/
 CVekecl+OFdn7XLm7hteEBVPNJJaROc=
X-Proofpoint-ORIG-GUID: MWrZLtb3GICIVPFxUVWoQ5m6CXiK9dcg
X-Proofpoint-GUID: MWrZLtb3GICIVPFxUVWoQ5m6CXiK9dcg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX7+at9Jbj//m/
 dxBKCgwcm534MxIcZzqYYMa6DxAUwNJdQu4m4rKuSQiCmXttZEGs08G7qfoIvZCvwuc0N9WtcI4
 1Ci3aatiofbBVPZCkuAlDZVwrNcO49S0GB4+zaqWbEavsArscJIGhS10q+0Nr/2zGPzzGpBv/bV
 I+IgVIcVH2y0U8ZyegjHszQ7wQtuvCX2NnAjqZIG89wPwgfudEi/MSYgbL8y0smd5W0DWCdOMfE
 /2AdX433y6gEHS1VK3ItDbE9P6RcO241djPjCC/HOOJRC0FyvFpTCwJuRJBNNSX9Ucz0C81SJyq
 SkAMhO0pX2gQsf7rxdXu88KLDlROb5AnMOOwi4pRBMnxYlNhs5UvR6FHGedXlkehE4tp2To2bgq
 BEcuDVKWuvQr4G/2RYLGx/RgLbvBFucciq/U9jDmfrAMeoIoI9suRxSyPglcAwl2zg4DoIZMrt8
 0CylRV0YuqI84TBTPVA==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d070e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114507-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,desc.name:url,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CE986C4D65

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


