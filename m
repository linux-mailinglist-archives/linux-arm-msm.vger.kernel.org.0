Return-Path: <linux-arm-msm+bounces-99790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLnWG452w2ktrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:45:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA131FEDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 458D830AA004
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D1930FC1F;
	Wed, 25 Mar 2026 05:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mr94mDjb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbP8X+e0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1930E0CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417448; cv=none; b=VKOexQaiguVnFGFMPROL1gzRH4E7Xme//lg0jNLpt2fGpC21nAJKmjv8kVvOrkI8oVl6TWYMUtVIghqFLhYUpjQy+SeLwVkJxgf1Rct77UW8r0+Nat3Lpnv1rHWFON9xBlfPWqLJkHoNaDwIpMLYRMnsIVIP/ZGbketokCSmwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417448; c=relaxed/simple;
	bh=7Av2HAUAr7KB5Ak4a2H20M+seSJyBiILEkz7dpvzJfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CH3h+scH3pEF2Q5L6DYZQy74s6hEW+EsXl/+hOwVbBtDp5X9CBl/qzg5WPQXsDFOdmpKhWvf/IUJ61NaIUTwKg3MY0VZMf/2isRbvFpHKZ6fxuigcA1yhQfE+l2hYwL++MHWVamEeePwl0pEHT4uLKdnBpAVhJnOdhAdkkDZ3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mr94mDjb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbP8X+e0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3xHkZ919634
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uROBrYURmQMKmWYhSbrHteOFKQsLCjR237xB3AYYOI=; b=Mr94mDjb2yNvU7yw
	Gs+bsDbAGwj1bFgqGYMVnoh1yvJTR5CjDhG7N2CANnqEENGIzHGuC+RaiMyBPcuL
	p/ZQ//lO2lwaL0h94YAkgBxs7OXFtxwLkNvH9JDtgLpaAu7gkITvaYYlIWQ8XExp
	W77KQZp0CHR3674LrTjcYLAy9twGSiJBQ3xL6mUceZ+JoZXNhYjzvAMxPrPxLWyN
	+XYuQY1TIDnkVoh0Im5kISPCIjZ5ey9RHNgHIjrve+z9SwFaotDhxp3IgnLABUdA
	Z7KBXdW1yD6ujsbsia8qzFLC+RFJGPQ2vRfb7PAMboTtU4KB9KqGKQ1FCTNveK8/
	HGRAdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mg9vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0565d77a6so30076405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417445; x=1775022245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uROBrYURmQMKmWYhSbrHteOFKQsLCjR237xB3AYYOI=;
        b=QbP8X+e0gE87tFN1NHAuX38HmFQQ9ngBxq7NUWJ1Czvof9Hh6cEhUQsmc9SgEgxNyP
         zc0Li0Ejj6bdI2YowxyI7ejeR5z+Xur9dmDF0lrk7QH4/CajIGvLVaxtN3A5syOLqCNp
         b/MCDfd+CQpY5kKk6H+RKjUVsCrwh3peTC102lINjltjJabJ4vzG83Dit6TlQiEZ7FBx
         QEsRtBsA34J1fMV8Rmiqo3EWERtfxa8xIBofqbJ0I9cbEOm+yVR0ljHbvm9VTlIgQjTP
         7vmVLeu77vPWouCf54QaZmDACqMeIk1N3IeM9SEkQwo6j/pjZTJei/KIYjNFL+cwrD5W
         CDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417445; x=1775022245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uROBrYURmQMKmWYhSbrHteOFKQsLCjR237xB3AYYOI=;
        b=OIEdVDu1QePP/3+bQC4Rr8mMgXJunXvcbeI8pvuvR2CfZbrd4lg+5LXYwNXgYMPTdG
         2osS2odvFkPaNLeRRXldefr8e5VSAJKh3LZz3CH/4Y6WFO6ogCSmYCpvNkIwHTUUH73Y
         VM02Wh80SYJeb5R+xhKPZ13YtEWZcoDleKOUT8LXpRoRvpnAWQdrjiZGRZzxjJPIajGy
         Sdm62IzkXeEiI03BP3Vz3LYi0HkDoFJTomn/sd6w0wIjeAl9sK55qT/FK1wQ5HCuIboh
         UnGzsHRj+Uf4gFpH6tunBY4Hm0pKqYdLzqOFT/wP3xY+wr4oxalaesyR84NUYK0eQaEC
         Lq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU21zv3o/Rs8vJDpn0ssqSWGReu8G/LA8A5nZKrsq8D9LZD99Dql+wLmU61BWDmx/bvqFz3ft+cQ76gQ13m@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQxyjEMVe6afpfuemTq/ueZq3jZxEPqJ/9lNL3MK7dyv/tQMl
	2mFKpfphp47fB8talIcB+S+f3TJvGvQt+57zuoTtC8Gee1RlFzT9cF1DVovlSVq3RPcQsZxQO2u
	CqEc9SOyy5+Iq7cQ+Ws8Jq3SI3MNFXEPCu9FDmD1zonri757ZvYqDN77a43hvYmdbb+0x
X-Gm-Gg: ATEYQzzaT9eWzced9QYPDq5jKi5FoQukS6trHKqqZXPJ+BCsmU4TtN4ZApIkqK2wqtH
	SwnkiiP1SOod7unlZUuq3nr5QHmroqx0KVlxJWBgw08HAltSiWbaIWVzNpLe6eEeuaChICMcwn9
	zxx7aymz8h1Tcd2r4jiTgQHUoAUxed++JKg6NE3BIWlmbDBLj3QaZT8XAqvY2EW1AXL9oUp5l+z
	s5YgKcLr2E6+Md+LiNWbpNNXRdsW7pchWuPlnJu8ykcGC8/B68V+5lHbCow5He2htrNPFQEHVXs
	zt8PYSOmBBUuw+Y+5nIarV4l7Nnq88rva+gl+Pq7q5MSuzoZxVTmqg+4fWe3nwPrCQznSPC2A0w
	4uX35c9eKXijZQY/ReP43Ss7QBYg1gKFu2d4g5oVbYoxHnV3g+I4bdV+6fEknWR3YupuTDL3KKd
	FnrkraYNhhg0BGdA==
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr25199025ad.29.1774417445412;
        Tue, 24 Mar 2026 22:44:05 -0700 (PDT)
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr25198645ad.29.1774417444850;
        Tue, 24 Mar 2026 22:44:04 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:04 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:45 +0800
Subject: [PATCH v7 2/4] coresight: cti: encode trigger register index in
 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-2-bb406005089f@oss.qualcomm.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
In-Reply-To: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=6063;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=7Av2HAUAr7KB5Ak4a2H20M+seSJyBiILEkz7dpvzJfA=;
 b=0fa+nmYg96nSHuDJGRyhZxDSsgOWgfT19ZguSiSwp/vuHjyKHTiCh5Iv1Ms+1Yb0seEIvbBxL
 Iy4Sk6rijZ3CEYOla+zqiEFOdEYaibAZICIYxobNu9pxZ9OjWEDc7mn
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfXxvyHVR54JVtM
 2/taboQCqJGfw1c98tBIg9rQOvBnQrLFtLEbCy7fbpygMHrt/vae5UlACU7k1Sd/gSd4ZL6/yGr
 5Has5Hl96WPKNhcB3ONwnNRXG50QOa7WRj5oyjymDirehmLZ1cd2hPzzOJGyP1uym2LA16XmFej
 e+Kh6sN3GJbVV98CMRtyg9sLvczRIVutPe7nUeIhwxrO7Tqqu2dABJpLmjFBZ1NzwbmIhJMQkoe
 tvQ1C8h31nF2/3FPjBxd2RmWH15XIFnfgcAVCgSy6nL4+I6+lo4DHGdmBt9ZeWxKKyQcnAiadK9
 xRTsaZwv7CiheeNHRDiA68UWtfH5DP+V6zQ/FKGWkQxdaY/06X60gM9AhuCByROcTdffmFdtaK2
 DIgUvxDeZdLyrMFytKZociF2dlVWM0aPkctj49iEz6xeyetDvT84nTJ791cTanG8MEF/YTUhJkE
 pqFDSDcjpiK1xzWWzBg==
X-Proofpoint-GUID: bxSNvKNYgy7PDoZxrDmEq05Ms34RCVLh
X-Proofpoint-ORIG-GUID: bxSNvKNYgy7PDoZxrDmEq05Ms34RCVLh
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c37626 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JIbpoTx20AKeDh2nFAsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99790-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9DA131FEDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce a small encoding to carry the register index together with the
base offset in a single u32, and use a common helper to compute the final
MMIO address. This refactors register access to be based on the encoded
(reg, nr) pair, reducing duplicated arithmetic and making it easier to
support variants that bank or relocate trigger-indexed registers.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
 drivers/hwtracing/coresight/coresight-cti.h       | 17 ++++++++++---
 3 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index d5cb94e33184..023993475a2e 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
 #define csdev_to_cti_drvdata(csdev)	\
 	dev_get_drvdata(csdev->dev.parent)
 
+static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
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
 
@@ -342,8 +351,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -363,8 +371,9 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
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
index 88f8a08ef778..075f633ea9e1 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -385,7 +385,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index), val);
 
 	return size;
 }
@@ -426,7 +426,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIOUTEN, index), val);
 
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index ef079fc18b72..21bcdedcb95f 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -30,8 +30,8 @@ struct fwnode_handle;
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
@@ -57,7 +57,18 @@ struct fwnode_handle;
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
+
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
 
 /**
  * Group of related trigger signals

-- 
2.43.0


