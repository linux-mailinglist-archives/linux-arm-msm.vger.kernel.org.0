Return-Path: <linux-arm-msm+bounces-99444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH+CNszIwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:12:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A282FEC81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22CDC308533A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E904E3845B5;
	Mon, 23 Mar 2026 23:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGN/LYrV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BleIIU9S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994A3384255
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307270; cv=none; b=BCSO9qGMmIr7P3tfpmlNWpOIEws8U9ut5SCGLvlvdejbEv4LhbYNqJilt4R8pxexl732vOR/z43Cd0U/bTiUy3eRKnYXo84/m5K2haqiGrhtIjFqRO9/+fZ72DFwmyCtM1bozU73AceHEmay0F3xQIbGhMfJN+qiL+4ZkHLMy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307270; c=relaxed/simple;
	bh=os5iiU4/0gD+5ahhcUVb8zKkHcX3ZJ2JeKfAwQz+nVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZY07eV/5Kc+qb38y0+kJgtA68PU7IfujpFxKvbN0VT/1+WIfzj3VJpHRh0HTcCStOb87j7zBCmGFkICcwvifV5227gibxI1tumebyQz6fRu+M2hQdpRqU05mvhwmsJgrq1QHcIZGDBDAITZAYTFm/eSUmszsEAWhTMH4XrOoATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGN/LYrV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BleIIU9S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHr9Hc2972957
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMX8J5sTPM6aTcybfgoO5NDB3MAf6+jUheLahQen0KE=; b=UGN/LYrVBxNh5nYN
	r7VyDc9H+4Pmkc+tYuUzrYFvP99I2O1MNJaZNnGumBET6PO6KBn/2j5WW65n5Omg
	/Voeftlc44o+HbS33x/Zm0F/pe7FYpQjpq/BjU1MltF+M5YeRWAFkVTQ5aMPY1r+
	cW9kSb3VH2Ho1BCrsW2FvE/Owap4pyFIr54l39fHKRJHfzA+09d0QeMFMrBT6WrF
	CfEfo1d2m30qkiPzYyKYESOJcUehJMLUI/DwpEt+KFEl5x7LivaTsl1IIqLxo+4q
	FdDozlThJyoiP13edVjmNJKWAFdYVZTSj/6dMJaPWUShfI9cmmfQm5WRMNphV86C
	p7RRSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc334u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso188561771cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307268; x=1774912068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMX8J5sTPM6aTcybfgoO5NDB3MAf6+jUheLahQen0KE=;
        b=BleIIU9Sqm2YKMSvt6siOzPijcSVkusTsE5jodyT84hvtuCK2m7ct7WpRL6GqTo+lV
         e/rdWkwrpTIGYaHVjB6v4oNYDmpTnk/AaXx0bzdQEVuIbJgQOGdF/IAnKCwq8H6JNanb
         kte6v0ixTw4f20Nyuzts4ZNkgjzXDW+4po8dCBgweuiqBcy3/U1Uf6wd31aQCJ+3rk3f
         /1ip1jy43xVlOdJJJKRBILPDZauDxBMu5Dfwk+4SDZ6rKDJd264Wg/66brrZq9XfAW0v
         oJxSj6dOX/GJO8L9lpAO26RtuM/Q1nfItx4hYWql1aTcnGfIuF1UsisyFCBnmwv6DBi6
         sZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307268; x=1774912068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMX8J5sTPM6aTcybfgoO5NDB3MAf6+jUheLahQen0KE=;
        b=mAHcDonpaogge7+7NLbVBC7rq3cs2pk7zwW3xOvs+Ft8tSSiJNdoE8OS74HzPPYXhA
         u6UfXzIe/ZvAdZWigCYBMAiXqGJ9H3iatl5MOEl4PXDYQ2VIsrbJc1SyRCb6ceGEviUf
         myAerEkJv88nWAz5aNpTuuSPU5hLfdAyzfRRUZbyORt7veGibByvLkS76dz/1SIwF1we
         Qm4MUJ4X/SWk8m+fiEObhfKxiu74T9Uphh1KNk/UKmg4zpDk0q4pI9Mp0bX/hUV8T+An
         ddWHUa9FYYHFNofm4slo5HMbJlk2imaDYJ5NfJG39j4b77rlEI/Ki1TGbXW05eZQQ/MF
         l0GA==
X-Gm-Message-State: AOJu0YyR/r8ECHei9EbLeh3pn9ET+xpAMm4exgcpTSjveUSCvs8nepJ1
	lmT0CWKNVnfJjnUdSrRN42Bj+ks66CKGE6wq3NFkonP9XyR786NJBgbHu1GAIwSAmThf2LVaTEc
	z20ELNzmtkJDgfZH3spc6Anz0V/p/K9zl4c9aGsmMYp7VSAFFVnqoWJmwDQdqSxWGea88
X-Gm-Gg: ATEYQzzj5QY6H0Oxwb0JVzB51Vmuo6MOz2VniPj7KerSgilHRGqDpIQAPII0jKv8WE3
	z8lTNgKRD0z3178YSLH02gR6hCwJJg2ltL6Q/c1J8YRt+tgokuZohof0VYHIvpu0i4uB5zm6o3l
	WwmvrtD1HagAf4nev/VZZ83Ct5u/GB5/jSQXGGR7MHPe/knELoRsFD4I6NTK3DgT5jUvUcfUbNv
	e7AgStLdoGRYUu8a2zxsYJZLxJqta6FqU1Q8Z/FZi+db8GX1lxDPFKeRkf4zDq+yy5xOvu9Pd9Z
	zwdTQCv+rwl7f7YQczVk7OiQpRwm8g1mqNn6mOdcBKkcsW/T84B/7bTftslOCslvdoYg2dJRUMP
	+0V99lOhcO3CGWcx4J7y+ha5HVMkIiVGigNk+CjoYyVywsnvdM1UI0SRZRRwBaRQWJWJS2fy/a/
	mKxd5RtniX2vWi5e9RcE0kVFyklBaSUT/7Kw0=
X-Received: by 2002:a05:622a:5c7:b0:509:2579:283e with SMTP id d75a77b69052e-50b3747c903mr220947501cf.28.1774307268081;
        Mon, 23 Mar 2026 16:07:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5c7:b0:509:2579:283e with SMTP id d75a77b69052e-50b3747c903mr220947141cf.28.1774307267662;
        Mon, 23 Mar 2026 16:07:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae39dsm2777970e87.36.2026.03.23.16.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:07:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:07:37 +0200
Subject: [PATCH v2 2/3] soc: qcom: ocmem: register reasons for probe
 deferrals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ocmem-v2-2-a9daf5bce036@oss.qualcomm.com>
References: <20260324-ocmem-v2-0-a9daf5bce036@oss.qualcomm.com>
In-Reply-To: <20260324-ocmem-v2-0-a9daf5bce036@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=os5iiU4/0gD+5ahhcUVb8zKkHcX3ZJ2JeKfAwQz+nVg=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGnBx7qgqxZXyjy95a38kXYn1f5ACAOwlqFY0Cyrtq69+/QuB
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpwce6AAoJEIs8ij4CKSjVZ+YIAK3W
 nVE9X7nIs/5rP5Vt38r4RXN3tD1uhp91fUgM6pHd54/oEzP8EjmQVd9lOvMzzf3/sMl6PH+8i6a
 G9m8eLtDMAaqGAgLiRQcVlIB7ngolECeO5oYp8LkRufDchfKvHMMTMfi7/TzTdsON1afGmOmvxK
 2juuQ/ha9rM6kYD6VjB1eIPEsB5ah//Rh38joZG0XAZDDgy4UXFJkOD0rqE3wg3RxC1UuxMhgZv
 ZlGgdFgcsoBaPiUrqlGpvY1Pp+8gAXqttOtHoxJ4ae7dzBCwHeh5WXoSNi5vX2q+T9gTcq8ai96
 RKmd48sAfogfNAdCZzItF7HqrAB0MHLBvRvFQnc=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1c7c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=UHoQqHecy3V7gIibuZgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CaIK6o6cJgfzqLY8PaeXmo-ounnzKsKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfXyIeLhtON8zF5
 Uf5L5NARZgZCs/pWeH5nbRTdoVTDSQBq/UoDQsH9QGwp/2ekb0NIpePqxTT3/SLyB21sagO4fW6
 Q3qk83nUQmel+WGdM04R8mjaBUhoELs78US11RScBTatWgY0KKZjfotznNXF4O5RKl/pEMR0FsE
 XA49ylfSD5VRFkj8xQLx39ulrPz4ZjyerVOdDFegP3N39rRQFij5Qnc76GINLRjXHwrBu6dvIpP
 jppVs6KDDWWXME+VGbVtHDPOVA2RK7hB1S8PVO/wwPhrC5CDtPxLmggv5QwS5273vd/o7veCb8S
 xYBzUgC3+WE+nwFP7Wf35lukzECEAqikgW0d7O21xJX8+0WzsSkqf23UL5Dr5/GKwLDfzTu8GGG
 jGUDSyiRycP1lMEFlaW0CcYBo6pvttE7kH/9OxL8TAlycSlcGC+E0X+1SKjiAGd4W5+z03VAz6q
 elZcBq093WQoe5QcLfQ==
X-Proofpoint-ORIG-GUID: CaIK6o6cJgfzqLY8PaeXmo-ounnzKsKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230171
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99444-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40A282FEC81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of printing messages to the dmesg, let the message be recorded
as a reason for the OCMEM client deferral.

Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ocmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index dd46bb14b7be..d47ce5707fd8 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -196,10 +196,10 @@ struct ocmem *of_get_ocmem(struct device *dev)
 	}
 
 	pdev = of_find_device_by_node(devnode->parent);
-	if (!pdev) {
-		dev_err(dev, "Cannot find device node %s\n", devnode->name);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
+	if (!pdev)
+		return dev_err_ptr_probe(dev, -EPROBE_DEFER,
+					 "Cannot find device node %s\n",
+					 devnode->name);
 
 	ocmem = platform_get_drvdata(pdev);
 	put_device(&pdev->dev);

-- 
2.47.3


