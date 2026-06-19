Return-Path: <linux-arm-msm+bounces-113818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p9IvDxPYNGp8iQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 07:48:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCA6A3FA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 07:48:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lsw1vQKV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V6NvNj+3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113818-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113818-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C1FC304B7E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 05:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A32932B11E;
	Fri, 19 Jun 2026 05:47:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790E40D599
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:47:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781848076; cv=none; b=ryVQ9JCUfNzoBaShM00mPBeFvgfBMARJ13ytSHqS55QdTf0uZX8m/MwXQhJdJEpUtiLpUgkKcEW2mPNaBd5To97edHU12HPN0pDzfpYQbMwxkIm1Qs6/eZtH5d1zv5lkhVuolvfkFzdqiKF0PRrXEmI7a9eQBXS3KetWujpPtZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781848076; c=relaxed/simple;
	bh=dxTYm7+fCcOtc1WgE33c7W7bydqY0UAaS/so9EHmsNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EBP2vTRkTwit2k/7HgN9VvcbwuRgK6nOgRcKESZ69Zo1NKBLO5TlxuUknAQHFBFkgTNNOD/8sppc+buiXKZQinPEr1QoWh0QQ1Lt7cH5MP9wPxVHs4Chg3aneV5ffqT6jt8Wn9R1hr1Q6mtIWp8NRcA2NNWgNNykNuTAv/1Izok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lsw1vQKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6NvNj+3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2uA3Q3629236
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6erC4mvveZnx8ekE3IpeKh
	+4kGF9HErlXeDjtyEV3fo=; b=Lsw1vQKVDY4g18tGgB3OJGSnx4bcjYYGYcOcRw
	XPBLYYyj91pQpKZ51BV6NHnvV2Yf170U5iBRCM4MiN7bI/5fWvbVP/RRlogxatyj
	zq09IGG/pQv5WUijn8MWLxRK/op3GL4Uqp1usl3KgeXXspvGBZ7GWVWrUmam5H3s
	8je91lSYfngzMAD4SBQq1knv73t2rVj9GcnrkDEcoEqGK2rQvCim+4DSNzsVUWT3
	hpnYHdcn/YTDazp4qZI2ATk6zYQtoegxkbHL2E6jvG07N6gg8nZ6ilEJp3vnXfpU
	91ikmcHkN8qqWBQdea90pGaWkqxe5ZUmFiK4mmTvwL4LkIuw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm20jrx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:47:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422ca754d8so1305045b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781848072; x=1782452872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6erC4mvveZnx8ekE3IpeKh+4kGF9HErlXeDjtyEV3fo=;
        b=V6NvNj+3PhfALvOvD+50Km370WQs0f5iuFXBWLXfvi2nxLoWi1lbDSvDdAtkGxbWCc
         Hwjb8fGB1Rcdy0L5HSNDwVknQ9I71D5+8VikWl+UvXYgN6RZuEYSTymT/n05m/CwRsSN
         So87g7JC1aWDF1mNJpQE6AyKWfdTx+bxX6CluzXhK2aDTOedlhh1w7BabjpYPaArngg2
         X0EapySs/rLwMVwyZJA3r6hDER4mvEtEV6YF8up8b4FotSwz9CfxlB37RWL6BKk/I2pO
         o20G+N4QKaobGhBJAkkbEKG4bMmlUluo3lXAVVcJXDAjZdDC1mb936krUNOs4/upzWvD
         V8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781848072; x=1782452872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6erC4mvveZnx8ekE3IpeKh+4kGF9HErlXeDjtyEV3fo=;
        b=oJELgvHyEUAzRxznUfu77ErRvamFd4krxx5HaQ3SkpechtNImmdkI2as1Zooghk6jc
         vmlRCLI1iZf6761jkR8ZceSlXfL9rzpmm423ve9b1hDcelWq4pUV162QkrlvChoDU0lD
         WBpDu241wmtW6lzEJp4HBIs1pKEns9SHxoaS3ERsbWMonGh/n27GCeusl3MLdI+5OnDN
         QtWzddxbFProK4TaDlXM0S0LNpWy2JfWxUxTvyzrE1LL800G89UKk9WUoBXkVuEY21Kh
         TZbKdCJqkGiaJlvA3Wr2viKe5yDUc7GtQzIsZqbO3r4p18UC5SEHIR45TCkHhNLntdyJ
         o0Zg==
X-Gm-Message-State: AOJu0YzQPC3p67gDXmMxACKSmST9WIjh8o3tuvNsUgmgE6WzduhPKR3i
	rNc4YiuWJomVLSd1mPw7OBRXpYNRjOIbzY+PXB4hm5dHEmEN59s43EHPnfYVA1RzBoxRU1Cy7Wk
	IsCP+Y1DBAOj8Lg/HOndbWZyo136+JCFap1VpBWOL4O0Iqofer4ncM23yjikyns75lysG
X-Gm-Gg: AfdE7cnVa/sbE6McQC98TdjFRj1z+a1cbYDzrch5qHRXZigxeXX5es+9V3sj3qiPh+3
	MyfZzE6tRNw/5xghXWq8HpxuydBheVgBHdjsEXAePz8OrIGsWXL9ayhkzt29BGKZJOHZo+blJuP
	mP8U9cwV33Edi09tK3JraeiPIBlCOxEU2JGFhG7GT9QWiCoy2D9mrcGgBCWBFGhywWXZHbZCULi
	yFIdyeBOHsGlHjp9M1VFRfAjIt792XrlsilcK9HyJ9X8ZWQKhVt6WZsPNewJdp8pTActNNDgZw6
	bFVcsj20WKT63qtUNqMlpx4EHZtBtX9/7TC9Jmtn9Ayr49JnIJt81yIPRLLqxv75p/GhE0gDmPe
	UAczE9xcv1b9578mx0xVaM9wOrFeDBaTOHewzK34GjW/JmA==
X-Received: by 2002:a05:6a00:6017:b0:842:6fce:6171 with SMTP id d2e1a72fcca58-8455077c299mr2148077b3a.3.1781848071952;
        Thu, 18 Jun 2026 22:47:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:6017:b0:842:6fce:6171 with SMTP id d2e1a72fcca58-8455077c299mr2148051b3a.3.1781848071494;
        Thu, 18 Jun 2026 22:47:51 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364c24esm1076840b3a.12.2026.06.18.22.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 22:47:51 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:16:47 +0530
Subject: [PATCH] of: Fix RST inline emphasis warnings in of_map_id()
 kernel-doc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-iommu_map_kdoc_fix-v1-1-9573e1cf30b3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMfXNGoC/yXMUQqFIBCF4a3EPCdogVRbiRDTqaYwQysuRHu/V
 o/fgfNfEDEQRmiyCwKeFMmvCSLPwEx6HZGRTYaCF5JLUTPyzh3K6U0t1hs10I/VXGpb6bIchIV
 03AKm+Y223ed49DOa/SnBff8Bpcwe+3YAAAA=
X-Change-ID: 20260619-iommu_map_kdoc_fix-906ad8a33f1d
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781848068; l=2629;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=dxTYm7+fCcOtc1WgE33c7W7bydqY0UAaS/so9EHmsNg=;
 b=pvgpYCPRLHSLBojBYicqa3PrHvI/H+OtyTj6y5c0Phfb6zsiE35HGspiGhSnxXEfP7uuoQtTb
 BD/zLp5WzSSBhPRiKwRhpRpQ/37UCSRCwtn3byM8ht6pKivqVz9cuhm
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1MCBTYWx0ZWRfX6VF9qZxhtBg3
 +3TqXooWWUPeblCT6R0rwG3utwKa+L46e4ASlVNB/8Wzjn7rmK0ifcg4ts2A72uteeyQQKyXr4d
 aKRWNFALSksw9g6aXgxTe4nv7wgztTREUJmLnqLkl8PD01inTe5oMNCa1wosWedZhOZuO54+0VL
 U0hZUw+W0cJLT6558fN9UAMTt76uol12l5BjjP0HLb9TNrctEiTHRgIwo7Cp2OHw3Yin797g7oW
 ghZwdT430eT3LWW9NNFBnPuNT+/m8NkTQ1Cr0FmmudUwZoprK31qlUkF85+OLh0up+PvfUn3xlI
 UG8enkSYSLwq3tCK5zAIYLREn3K61FARI1R8x9eX4qm0q1y0pYKaLNim0SoQ4c93447s0c9aDlk
 lJ1mKx4sW3SIr7ol5uN77XBNWaHTxrIaHxdnQJGvkDePsXSnX3ovckspypiZ5KSrbqbgiFKBlTI
 N9QrPGX/vugWdpJtzjw==
X-Authority-Analysis: v=2.4 cv=GKw41ONK c=1 sm=1 tr=0 ts=6a34d808 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=2AyYK9INLeoGlSRvxWAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1MCBTYWx0ZWRfX0juuucDbrUCb
 0kcatjYPK3vUyhPZRDWbUOfQU/GCm+kLs/RrqfhS+GeYbWNU7mCDFU6MoJGHoMm8GSqcpXf2uOj
 nv/nyhuntgcZmGJJhamrjrrWz0XQTBE=
X-Proofpoint-GUID: AYGz6MEplQvGqktQTljJRtM-9q5Tsc4M
X-Proofpoint-ORIG-GUID: AYGz6MEplQvGqktQTljJRtM-9q5Tsc4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113818-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:vijayanand.jitta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBFCA6A3FA8

The @filter_np parameter descriptions in of_map_id() and of_map_msi_id()
contained the text '*filter_np' in prose. Docutils interprets a leading
'*' as the start of RST emphasis (italic), but finds no closing '*',
triggering:

  Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2134:
  WARNING: Inline emphasis start-string without end-string. [docutils]

  Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2260:
  WARNING: Inline emphasis start-string without end-string. [docutils]

Fix by wrapping '*filter_np' in double backticks (*filter_np) to
render it as an RST inline code literal, which is also the correct
kernel-doc convention for pointer expressions.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606130111.ldC96rqf-lkp@intel.com/
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/of/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7cb0d7e88247b..6e7a42dedad3f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2160,7 +2160,7 @@ static bool of_check_bad_map(const __be32 *map, int len)
  * @map_mask_name: optional property name of the mask to use.
  * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
- *	*filter_np is also non-NULL, only entries targeting that node match.
+ *	``*filter_np`` is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
  *	@arg->args_count will be set to the number of output specifier cells
  *	as defined by @cells_name in the target node, and
@@ -2350,7 +2350,7 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *      stream/device ID) used as the lookup key in the msi-map table.
  * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
- *	*filter_np is also non-NULL, only entries targeting that node match.
+ *	``*filter_np`` is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
  *	@arg->args_count will be set to the number of output specifier cells
  *	and @arg->args[0..args_count-1] will contain the translated output

---
base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
change-id: 20260619-iommu_map_kdoc_fix-906ad8a33f1d

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


