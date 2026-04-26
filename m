Return-Path: <linux-arm-msm+bounces-104553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKONH8/e7WkzoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D516C469510
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99AC5302262E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 09:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B591FECCD;
	Sun, 26 Apr 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIt8Fr/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kl8g0k2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B143009D4
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196711; cv=none; b=fl8Vx8alEiM6qwaoI1yAqGp3IWYmeH/AZxhuY7RTrQAlupRjWnX3mY4wYvV8Z3RK/KuL/cwvZiGB6n4K+ji9g/Dl2UKVefaucISBPlswKT56ZV1EDZOGRW2ymZxCux9vCnP0j/BCPbAuVG9MSSzvJBdSZa2VamCeFZAllDKI6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196711; c=relaxed/simple;
	bh=RTsLaYVLZsWbbMOZumDU3n539t32lNjAo8QQqqvI4Zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aIa8+dKXeG2F9jJgfSRS8ClfKuzYtiG+hRNPBQ6s0ubqK0UHvmBxquHSGEYmS7RLlyZcv8tDGqJwRR8YZtWCo7f/pKTg41zm/cETV18OhfTimwXqeL7Yp8hALrbKDozbmIhLe0rAh5WHYXNslnK/H3xdq6fef+aR3ZeG2S/6ntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIt8Fr/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kl8g0k2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PGNWOM2175129
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhUmUF4vCsrhu0gLOmS7LtwmtfLWZkig00mssiTCx3Q=; b=AIt8Fr/8ewSYKA54
	nt5By/O9dbx7emqcGIw9DM5cok5LVPNc3hvAB5UC7RVNKlsq/FPIrn8OnC6hYl3H
	L3rNYfaiOgVw1TV+DUzboNYHcmkshzQcuHEpPNpm/ypbW5KsW/Ii+/XQvvN8iWK7
	x4h9XfaMqlCpGn90nH7vq4gYbeYOi+M6fV2I4XtS8lueFKdABnPlT3yvL+swkjSK
	jtplMPmboU+iwN4BI+84EWZm9iX41UXvP9oMfboOD3eQ8hXDEp+EqfTnfeU5OgR3
	p9wbkaf71m4gPW5OwskmDz125QFwRyWGeEcxCtAcqVeCTCWCkUkb4w2tINCc+EFP
	k2OhyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2tjfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so74402675ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196708; x=1777801508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhUmUF4vCsrhu0gLOmS7LtwmtfLWZkig00mssiTCx3Q=;
        b=Kl8g0k2hkvsjx2n4I+KnheWecW4fY1NJmm7/L+NINA+DfeFp/MoVe+xuAm3yd60wPy
         HWwtaVFwsH55w8M/euuLOwRrC9a90DCEoaPrJtk0GEcyf+OYmU3semfM4F4tTKLf05ec
         JczJyfDwO5fr4PZGr4V9lK1dxpEQ3SS69YnXw/M8Img2QT57TPkd6wHH7ucEznomZYRu
         y5bONCmipQkcSAJEOl5S3b0Im7xtKqImwYPQG5PATpsgx7yFXjM/veFocxp9/Fjm5ujv
         u1PBk38MmBNhOZV8r0AOhI/VcewtqzTc/5Brq5CiKjRfv3JpcugflzHOGY7ft/wGP9x4
         aSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196708; x=1777801508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhUmUF4vCsrhu0gLOmS7LtwmtfLWZkig00mssiTCx3Q=;
        b=WhOfQnbREmsl6xahv0IIIaBXGbX6fGj5rYg4MfBcQDDG/QgHtFhoMD8svOVGW7QPBB
         3i0sA2bPXbDOI6Y8qKN7mKOLbn+MgZflB1RSVCph/P5fXIkxWGnzz1BMVrNQ+N3YLHIb
         ymHtUHlKFe5t7WJrk0fx5sVAKslPFf1J0K87orNoABZ+m/2781ychQs3vXVVAc3pJAR7
         bQisxWdNQy3zf7Rb9iqMpVCSJEXv0/b8lyBnYufeCOLM3obDR/26Jno7GRfi8H/egzxf
         darhLQf+AxCEdDPmdFK5JAzhXvmhzAZA3r362mB/Ov9QLTiBJOoPM35FOSvzskcuYNL6
         105A==
X-Forwarded-Encrypted: i=1; AFNElJ/j/Q/GGGBgmQnUg4SZ87ETaC57s2rDF7YbqzCtGSQ3Pgw67l2iS3fW4Z3rHwBsuf3SvoRXFuYwbdO/UweV@vger.kernel.org
X-Gm-Message-State: AOJu0YxnDhshch1AvUFyltJJ/VpwNLytiV+I1jmuqK9NzFBXeL/eZqVb
	FMLtS+h41xLtfCqixmHRpAH4SlK+F0vqV8q87CVsL9FVIM4Z1BGVrWQA8pYvYAoJEc7MpG5bvEz
	DqLjigLmPNOewqqJ9e8ItjOufajdzQGG1UgDyxt8u/DwcVIrFdRB+STVYndONBGiq1S3o
X-Gm-Gg: AeBDiesd0zQCKvklG/eBX+BQ0lQRGGGkshhWzXKP3sq1A9qD6MGbCTj2ajjlXimNNzN
	+ct2qOUKiAffQl8oJerRIOnmDZfm3W5+6IwX5cp8jB9iRPZt2O6duX8941bUlKn150svLJM8ufa
	PJY8Qc15XN9eRgWXHBPpJVNrMX6vEFGkzvtE4EsocZW5aL/JhZ2WMNWzPfRfXYcS8fvVzZB+5ZO
	ox1mc+VP10pT+wKiDhDtm0nMD4tpaWeZUYN7VYMO6qiVneR3e5Mtm2gEslgPO3ZIUeFG6E/I9DU
	mLIkmVAesKnhyd41gA7DOHbv1ap6H/MBaj2WCXZ/ioKVfrfXNfrTcvUBkyp9vxW+ABw5eB0Yo2r
	j/as3Y8ibzpYzT6YiE1bhb28KTiy70k+kt1+u2eh9/zOZeojTi0LCAVQF2WFDjuVrNjloqLyTsp
	BDGEsDBwFd4p48BSNZ3dbDCqgU
X-Received: by 2002:a17:902:7595:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b5f9ea84f9mr242443835ad.19.1777196707952;
        Sun, 26 Apr 2026 02:45:07 -0700 (PDT)
X-Received: by 2002:a17:902:7595:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b5f9ea84f9mr242443715ad.19.1777196707479;
        Sun, 26 Apr 2026 02:45:07 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:45:07 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:44:39 +0800
Subject: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=6125;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=RTsLaYVLZsWbbMOZumDU3n539t32lNjAo8QQqqvI4Zo=;
 b=pdxoK888+GzGQuMMx9eZ2XIJmH6NZuYJ19tPDe0spNNCZ2u7wlKxqg4BiVWFr//D+1IWqosX+
 fSayxSODS08Ape0rthWit7LG6odGbNnSk2tQT6QRjDFoVSP4n/eWFSI
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Proofpoint-GUID: xyKL9ulkOhQl3JZowQlUYFYxPNSIs1AR
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eddea4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JIbpoTx20AKeDh2nFAsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xyKL9ulkOhQl3JZowQlUYFYxPNSIs1AR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfX8yS+EAy/N9OA
 SpPyV1C8tlFsXZ5s4GRbMDNkAUWuGwyygbRvZGMyalEG5RZ3NHNHMujny/SsLdZ5vQZzJ1H3q26
 CjE7KMmmSsE4y++jokL9qO6FGoLg8XpV5wmWSHO/BjwM3VaLUkVSc+6nEycCF2AxJGeHhnuLlvx
 KfnMNdXYr/Hq7gpMfwPUEZl73O9kLYotsuQcot/rSCFYHCzTi26MkZD6t6YeOnGWyXAVM6o6d6W
 LgS+pJNpOHgzaVJaBPZihG5BhPJNiR+LaXETsrw+Rv0hMWxODKiyitOt313LwGJl/Y+ejNmhfrv
 VZ/MHo74t5zsg3ELmf7U2QXYtyC7slaV4g69/IWcHdVg9yVdGZ39Pbc/+2/PvYSmEb31Q/ETGjd
 KqnMPQH1+UPiBzzH2d+imnBALGw4TJU/ZaJ3/fb75mk35T1GLL85ipbcNHvl4mC0WHQKuLKVZrW
 ZiSbMcRVJYhrk05qDDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-Rspamd-Queue-Id: D516C469510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104553-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Introduce a small encoding to carry the register index together with the
base offset in a single u32, and use a common helper to compute the final
MMIO address. This refactors register access to be based on the encoded
(reg, nr) pair, reducing duplicated arithmetic and making it easier to
support variants that bank or relocate trigger-indexed registers.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
 drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 4e7d12bd2d3e..c4cbeb64365b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
 #define csdev_to_cti_drvdata(csdev)	\
 	dev_get_drvdata(csdev->dev.parent)
 
+static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
+{
+	u32 offset = CTI_REG_CLR_NR(reg);
+	u32 nr = CTI_REG_GET_NR(reg);
+
+	return drvdata->base + offset + sizeof(u32) * nr;
+}
+
 /* write set of regs to hardware - call with spinlock claimed */
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 {
@@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
+	writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
 	if (config->asicctl_impl)
-		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+		writel_relaxed(config->asicctl, cti_reg_addr(drvdata, ASICCTL));
+	writel_relaxed(config->ctiappset, cti_reg_addr(drvdata, CTIAPPSET));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -127,7 +136,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
 	int val;
 
 	CS_UNLOCK(drvdata->base);
-	val = readl_relaxed(drvdata->base + offset);
+	val = readl_relaxed(cti_reg_addr(drvdata, offset));
 	CS_LOCK(drvdata->base);
 
 	return val;
@@ -136,7 +145,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
 {
 	CS_UNLOCK(drvdata->base);
-	writel_relaxed(value, drvdata->base + offset);
+	writel_relaxed(value, cti_reg_addr(drvdata, offset));
 	CS_LOCK(drvdata->base);
 }
 
@@ -344,8 +353,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -365,8 +373,9 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
-
+		cti_write_single_reg(drvdata,
+				     CTI_REG_SET_NR(reg_offset, trigger_idx),
+				     reg_value);
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 2bbfa405cb6b..8b70e7e38ea3 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -386,7 +386,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index), val);
 
 	return size;
 }
@@ -427,7 +427,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIOUTEN, index), val);
 
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index ef079fc18b72..dd1ba44518c4 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_CORESIGHT_CTI_H
 #define _CORESIGHT_CORESIGHT_CTI_H
 
+#include <linux/bitfield.h>
 #include <linux/coresight.h>
 #include <linux/device.h>
 #include <linux/list.h>
@@ -30,8 +31,8 @@ struct fwnode_handle;
 #define CTIAPPSET		0x014
 #define CTIAPPCLEAR		0x018
 #define CTIAPPPULSE		0x01C
-#define CTIINEN(n)		(0x020 + (4 * n))
-#define CTIOUTEN(n)		(0x0A0 + (4 * n))
+#define CTIINEN			0x020
+#define CTIOUTEN		0x0A0
 #define CTITRIGINSTATUS		0x130
 #define CTITRIGOUTSTATUS	0x134
 #define CTICHINSTATUS		0x138
@@ -59,6 +60,17 @@ struct fwnode_handle;
  */
 #define CTIINOUTEN_MAX		32
 
+/*
+ * Encode CTI register offset and register index in one u32:
+ *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
+ *   - bits[24:31] : register index (nr)
+ */
+#define CTI_REG_NR_MASK			GENMASK(31, 24)
+#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
+#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
+#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
+#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))
+
 /**
  * Group of related trigger signals
  *

-- 
2.43.0


