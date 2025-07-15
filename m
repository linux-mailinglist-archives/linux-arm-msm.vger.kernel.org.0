Return-Path: <linux-arm-msm+bounces-64973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857EFB05583
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0CE3BF886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1682D6611;
	Tue, 15 Jul 2025 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FLZGuVja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D22D6402;
	Tue, 15 Jul 2025 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569607; cv=none; b=aKIdNRLrNNjAtDdaR90g30a0CQsesz+0YxSJJqkUrPsHrU/moHoqkE9Q/vMeVZfztRfNagN2zkPl23yZo2ZtTZvDY3KjI21ef2TFKFpLTCl+PRcX+4seb9ag29Blb/+XdZPZlsQhjgny/GEsTdP1bMX7qiEfcl5T4PUn4AUiZIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569607; c=relaxed/simple;
	bh=dLeLI6Z4FjKwIOWMA2g0zWgg/TP0SnyZNeM+LjQEqgI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWOXi4XFEa/NHJJx7mzB+6v1Z59vBQo3EqXcEeOil0PjoTtYvRPkjr+Aq0p8+35/tfCxZgdE7SWFgB5JNs3St4s/+yGoIEoyFD38wLFDvnLYjVTPTPlSOoLZp+yq0ZmVOK6wh9zSx0Ld7IWFQHKHuiTNS14sB94c8NSZvZKaJCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FLZGuVja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8kHnw026550;
	Tue, 15 Jul 2025 08:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPIGQmV+hqdlsR9ccAm6wBh1uGhtNO9pveoOBdEfVX0=; b=FLZGuVjaGlhxgDV0
	Km2kX9Eynk7Dv40bS598RmxsFOrrG+vrJSJlBTivIA+F8A8GZ81+FZScyBK3xvpe
	0hvnWiVMASSBAQJrQ8APyS+TqA00pXimVQ2S5r5LesKNwp/aYOqkFtJibwHupeOF
	IgbeZ+ES+tWDdee3gY6greJxIbQIWGB9Xw4CBjC37onQG5i9R+qYJk2XvhW0CdlC
	JOgYIFijRE5rNmL1s8s3/BQjaU3QGH9DJaH+GPJNLtPyJQIDz1H9Au080682TrdB
	Y+8pzg1fuv03yM+eLbBNsrOQYfk4EfxzRXQOxK76DlGM2fYas9g6eLXvDbc8Qypp
	gAREqQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrug0vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F8rK0F013103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:20 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 01:53:16 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 5/5] misc: fastrpc: add support for gdsp remoteproc
Date: Tue, 15 Jul 2025 14:22:27 +0530
Message-ID: <20250715085227.224661-6-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715085227.224661-1-quic_lxu5@quicinc.com>
References: <20250715085227.224661-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pdnk5SgZuNlATzv0Pg5IlhS5aFUvLsF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfX3/w4NcOhBpGH
 CHvQLnWROLV0o/WA6kq3WXgdNzl22v1bN87k/Qreq8iOpQtNJVokSoGeUg6ZH0tOi9khc53JRWb
 KxnuiRlJfFj95UIg1DDTeWQ1V5rEg8tgj8q3ZbIGzOL5WZAbOptcS/xmH4pSvvcr9FevwhnslBv
 hgAYYceZdnkhAeBywxMehfEd2XoXmX1dvO6NyEHCLcB9Pq3AFMBaE+YI5fR/Ifh2qlA5sIY6WEk
 KFlgW7S4IOpJ+5EbjtZ9+4ZiOesQz1mXTu7i3AOLC4P0sR1dXD+iRjZ0JeGU6aKyLRcWoHf+M9Y
 50kEYzvxh4F1TA6fAlz4mbFTu7dYt+AwGCyeD6XYi8hhUg8XcXl7xL11MlSdGWYnmidjSoKJY80
 UWpqk7WMQXGlMwKftff+xaAYJ8pQ+HL4VLBzz/5tnBkMQp+TT0dh1QdQDTaTrqKrH2x0paWa
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68761700 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VHSkhjcgKWVwXbDC_XQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Pdnk5SgZuNlATzv0Pg5IlhS5aFUvLsF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150079

Some platforms (like sa8775p) feature one or more GPDSPs (General
Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
a FastRPC implementation, allowing code execution in both signed and
unsigned protection domains. Extend the checks to allow domain names
starting with "gdsp" (possibly followed by an index).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 85b6eb16b616..d05969de406e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,6 +27,7 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
+#define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
 		return MDSP_DOMAIN_ID;
 	else if (!strncmp(domain, "sdsp", 4))
 		return SDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "gdsp", 4))
+		return GDSP_DOMAIN_ID;
 
 	return -EINVAL;
 }
@@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP */
+		/* Unsigned PD offloading is only supported on CDSP and GDSP */
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
 			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
+	case GDSP_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
-- 
2.34.1


