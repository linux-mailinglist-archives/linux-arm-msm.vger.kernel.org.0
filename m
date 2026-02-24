Return-Path: <linux-arm-msm+bounces-93987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODF2L+WZnWnwQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:30:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B16186FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65B5D308BF8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4B9396D23;
	Tue, 24 Feb 2026 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A35fU+sp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGzJrxhj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE397396D03
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936149; cv=none; b=fwbmJZG0d0VEVXDUMwcMuqjm6TtIjIiykk+mbq95Uu0TCy5BoU8EFOaBUvOBSGner7xB14Af0GtNRIPjk5PHKpfjsmhU8isCS5Mv5ObygUQ5/Yg8kK6qbr7Pvg2bVhm3mieKz4/SbkDKXp39mBeHJhOMqqJS4n+I+XZSf/XOtds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936149; c=relaxed/simple;
	bh=8RsaU3/B5fb2quHCDoVeS1dPgopldxdyklh+QihXc+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ivGVp+yp1OISyPd/wYfG1/3vfeMrWCFiGnXAZR9XbPdgqFxT7NygcRc3Ya0IKCJzIJKX2nXLt24v4pXtRZjOESHZm2C9/XQNjKDhTHsKmXxWWQpdaUghd68SHmknv/1z4Nyi+2UosH8Ip2Dtua0aypiXspyLIVKWCY5m/vhYCto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A35fU+sp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGzJrxhj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFM1e3884219
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EtWL5kEKqebQO+ye3tOlSI
	IdbDWLjDqXwNvEGkrFCb4=; b=A35fU+sptSXCvq0lHDF+5yQZYgEJpoOGup4A3/
	nymcQ4pcTrcufDUnTJY0u/OweTCyO0Ym9bycdpJ0OcqAMEoiVTuAP5qc5I0gUHw6
	Ll/zI8GRxsyBJd2+oZObCJHP5Nsy9JhIOqDdnUVPFUx54kqVQDwMSKi1zL6q1czw
	UM+cidlF/M9YCu+RzzLBE8M9CXqMU6L8D+hDMr+/z7DiL3XtcL3a/KH1Jm+v3uBa
	oUTgHoWI7pv7VuFFU8HIwvffv63n1ksyNxJfwTB3oGu/L/uAC4NvBXTxjN9Tcy/O
	cxe0s+7mBiRlyV8FZmlYAttqsvAA7QLN6XDTO33T3EFZVJ0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8u3wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:29:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so56681685ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771936146; x=1772540946; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtWL5kEKqebQO+ye3tOlSIIdbDWLjDqXwNvEGkrFCb4=;
        b=HGzJrxhjwpIgivuO0sn6p8NbzqXUW+gu8NtNku4U5kHJBYOrfyNmvohi27zVz4qwKw
         Ug/KlbnWIcpqUTPChLB9byS7YwK+uIz19cC49krvBzhMWD0rNbzkbF//TmcZt1DSSR1O
         toaX5I6MdphgqBm10cD2mPDbyX2KnX+1CcWuObJmRHNLz3q7GPQwIeXyUA6sOXgtSzlU
         MXc8UkaIaHaU6l9T7p0aabfA9e4NsFU8THvA1EzwmL4OBjVK+qHFS0/Rde46n7hObd/t
         BE4FJuSCUX621wivAinJoU87q4n3zOs4kPs9QthNrTOyuzL7r+7f4mAoJlwSQbhHMumN
         A2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771936146; x=1772540946;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtWL5kEKqebQO+ye3tOlSIIdbDWLjDqXwNvEGkrFCb4=;
        b=Dy67aD4sVjcIfu4BII5mR7mVDM5xhDEApj7agrREwLW2vMS2cO2gR16dfV18dhowzY
         jWnAwaTpuESoVPFR1oBScukuwEeUxAQGjzuV8YSa+j/0glynn91ub/dEuJNpW8f9pQFs
         l0m9SlqdTfwDFoEuhHGpgydJLq6nq1ZuEyXjiQKLV6ruQ07ayZqGdCH7ANt0lfSa5QFr
         awKKl63IJvkENMk/hBrC1bab4z2/Ei8hukFHOhvjw7OBb5gg/k2Fo9xMzu4q4rCUqPRL
         UqCu2YpzLyqmLQhpFcZixKq25s5U27NO9aZmsdtZeC9CMgwWWTQ6uJhgErQEF4P67AXA
         pwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4oh9xpMSyi/2a0P+6slu7DRtJTYAhcZn1z0DC6Suo5TaaKuAuCyZUpQuKSviXMMbeJv1ilXZDEQvDY47u@vger.kernel.org
X-Gm-Message-State: AOJu0YzMZroNt1NDgwy/mK8i3zrAuPh4cjLv6Y49Xg1RVgF3mnzz094T
	k8y9PP88G/9aimpiqAVW0C7dLNr/C7tLaeKRpWC1rns9pVVDhCDHHfma3ssS1p6EiHaM/dyFhEd
	zRVPSFRET4pmM7vN5k69SY/vtflNfTPwTPRqaKr/yXJW7TtbUnaTp6fy2XZRZVh1+9Jn39iCL3u
	mf
X-Gm-Gg: ATEYQzyke+gtA13oV7j3bsAgYZhDkxLaBWmouZCS+qVW50YMTftcxyQK8jWqKZX69hs
	jdbRp6QW2rdr9mI8h9TEYNMBU9UaoyJA7Zpspn1HjNW2cwYOygcv4rC/OteGSXyn2DLupAIJ7lw
	0wbHslbziDQyy6034Q7HBM4sqs6DQqAQQvzVPKt6tppkMffGsmckZeYSRERW2jj8C1I4KwUbiXQ
	wjVRSQy3oxKYvWpvGnNGXyRFfRsMg0oP/3QBMBVoFSWIOUiHoYOIn8AoCRKRX7o/HqfrJuF67WJ
	XSVIhJmBTNb+NY0KkPDGCElOv8giFD0k5rSHFUoDdWVYTsN/x5CNeNaWet8Aoh++4019pB00GxE
	C6RyppZnBg0QbF+LeOutfbC4Gn9vkS7j60ACF9ptavZYzXrWOH3Y=
X-Received: by 2002:a17:903:32cb:b0:2ad:6e26:abbb with SMTP id d9443c01a7336-2ad745aac7dmr95066305ad.54.1771936146364;
        Tue, 24 Feb 2026 04:29:06 -0800 (PST)
X-Received: by 2002:a17:903:32cb:b0:2ad:6e26:abbb with SMTP id d9443c01a7336-2ad745aac7dmr95065995ad.54.1771936145825;
        Tue, 24 Feb 2026 04:29:05 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7504394csm105763565ad.85.2026.02.24.04.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:29:05 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 17:58:47 +0530
Subject: [PATCH net-next] MAINTAINERS: Update maintainer entry for QUALCOMM
 ETHQOS ETHERNET DRIVER
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qcom_ethqos_maintainer-v1-1-24e02701ea52@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH6ZnWkC/x2MzQqDMBAGX0X23EDc4l9fpYhI/Fr34KYmoQiSd
 zd4mMMcZk6KCIJIr+qkgL9E8VqkflTk1lm/MLIUJ7bcWuan2Z3fJqR193HaZtFUQDBNvbh+6NA
 zM5X4F/CR4x6/SZGM4kg05nwB+UayF3IAAAA=
X-Change-ID: 20260223-qcom_ethqos_maintainer-51dc897e8222
To: Jakub Kicinski <kuba@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: netdev@vger.kernel.org, "Russell King (Oracle)" <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771936143; l=1070;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=8RsaU3/B5fb2quHCDoVeS1dPgopldxdyklh+QihXc+o=;
 b=fY3PGEOc/l2RdvZhTkV4m6hLWhNB0fSRhZDc4T+ikaVb85pwXln+m+rhH19LXDsM4dWq15Hi9
 0IR+FpIx8roCa1ELWpdfsGscQiO2aHvIwFszntPfdPptnQL8MTzd+NX
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: T3pl3J472xB6Py4YtKGTYXkfe_qMbH9G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwMSBTYWx0ZWRfX8sJ1m1giL0hL
 Iozn9TluUU9SnQsDuYSZ3L9QKw6GwOBfHazsSK02fYrujCksj8zW66TCm4hl4XbHHOvSnyndhDO
 YUpAFgupzrIkLfIh6WEC2PpQy84l5nGtC5Vlo7Xs6jMfYzrCVvCs9P6GGHchgKjwSJ0G9dk+Os3
 E0k22TzSQ79Wk++fqEtHEahmVE7fWCakj7AIXZeD99U5cFsZFY1WPtHhdyvpZBasmdvfQNd+f9z
 0pH4uVeY9pMGQb2calA1OeyhBAm/SklTiOQavsZFOpqqYU7vQAEYQZ30c8o+QAtqFn0WqKosa9H
 kQDUx3lVhAEvxaJvW9IJIV5WV1gcuafQBvW0WQDqHGsruHMBxMFm46mS8I9ftS97ZsEmEwXPUQx
 O3BchGb15o4jgeFLqSxzhVfKpLqcYVHMi1j0Jllyu9Ac47frPLoalh6aeVcX5UaCspktX4VWXrF
 RTbLhA5DZBx9CiRO2ZQ==
X-Proofpoint-GUID: T3pl3J472xB6Py4YtKGTYXkfe_qMbH9G
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d9993 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=pRcBdwvvMpn0FxNT3swA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240101
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93987-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50B16186FB5
X-Rspamd-Action: no action

Replace Vinod Koul with Mohd Ayaan Anwar as the maintainer of the
QUALCOMM ETHQOS ETHERNET DRIVER. Vinod confirmed he is no longer
active in this area and agreed to be removed.

Acked-by: Vinod Koul <vkoul@kernel.org>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8d8a5c415976a6239898f433484d391b444297d..2b84a64c1c26deea0927b6403ec023e6e00409f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21694,7 +21694,7 @@ S:	Maintained
 F:	drivers/net/ethernet/qualcomm/emac/
 
 QUALCOMM ETHQOS ETHERNET DRIVER
-M:	Vinod Koul <vkoul@kernel.org>
+M:	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
 L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

---
base-commit: f77c7b96014471f2c39823ed9fcb42967e7d9ede
change-id: 20260223-qcom_ethqos_maintainer-51dc897e8222

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


