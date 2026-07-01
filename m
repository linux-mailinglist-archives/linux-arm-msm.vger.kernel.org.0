Return-Path: <linux-arm-msm+bounces-115718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zVinNHkgRWrq7QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:13:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE446EE926
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BTlgtthZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MmUDbRmu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115718-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115718-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76A2D323BF60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E043E1D16;
	Wed,  1 Jul 2026 13:39:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D012D3F86EE
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:39:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913158; cv=none; b=papNxGkq5F/JaZxx7+oKZxs/Bu/GxD7DuIzxW0JpBioHKTkxqZjluMe4ML6drF5EZYETE3lk8ck7GrhDRT8Do2pdxR+XoDf/RiYaLxueD99ybhdDOQ2Vifpu79nwwNG0cIf6o3qQE8Z/NTktM6/Z3M74zJv1zKJot1WmcCcnj6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913158; c=relaxed/simple;
	bh=IypPBtbtEojFxeZi74vIWdNRQH0Ig7E3O3gte7AZJME=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WdkGaFYppnIPjYscaAmYaOkTBIDchSq8aOaPT+HwXKZlfVudqhF2juoYFQT7g9Z520PipAYKFPA4fuVeLz/i7SA5SD2UkoSLHUwF5+jsjZRgsEoEJewYg2wmE5I8AG+BbGb3fRIdG4c2TYctuvu5J7NYiZfI5YKhviBBaEpmLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTlgtthZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmUDbRmu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8SXP680617
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+ZwsGSjZzI7u51pcIgHWGF
	NgEbH5Wj9AButtMvoB/Gs=; b=BTlgtthZIjxEBGN5za/3t5cLrQHahgAmlT/mi+
	rImiKPMbbtj2od9/AJVzPnq0ohrkqvCF0iIYg/YkfHId0OtZKoamglzHQmxQ5izU
	0BhLKZit1eH7Use6tovFsG7ITOXAAdKhvKHBhl5EVOqB3Yf7Ck3IZS3gGGT3d0IM
	41IledgIlLz1+i5XX9yHrFLSUkyLJLTFM8dlLOgNogB/12jiZQFO3UDNgN2TsyiQ
	neMQ9TlykJfvAQqKqbJ5NNOP5PUayBLLnJtvebF/+NjBXk5JE7rXhMqXlJ8cv62f
	wAtFtcrNfzz7ULOdqRQM5hgw1vehwUNMemyMYTHnLzJGayPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3smfan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:39:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5740so87022985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913155; x=1783517955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZwsGSjZzI7u51pcIgHWGFNgEbH5Wj9AButtMvoB/Gs=;
        b=MmUDbRmuvRtfk0/boXTuICYitJk2xYQ6YDLmWrD2ipB6teVXcRPWCcfGFSggugO06v
         q3Q+m+ItKzW6XyvL0CPXeYmdDshuUsznvw+MQQqgblLwGgq45pGddXxqkuFLCU9zn3Af
         O1BNSi7DF7blFhUQGiucjCjYN8ESQ1oABcPlDkZKDHeIcDbzP0LfnoQVcxHktNPYMZAF
         hum62QBwbyZ1Xz7roAl01tD05NhtmB6z5ZD6ulsuZxgp7+Gjo57f548HYGr/xYSPWNnp
         06d+/7iA3S5wkBuceFpUC0iiNDHOdIsIIOo2kI8uzhhLOhEvZhMdmnjFwT0f1C+IfFsn
         tyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913155; x=1783517955;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZwsGSjZzI7u51pcIgHWGFNgEbH5Wj9AButtMvoB/Gs=;
        b=I0Hbwu1WyNhVZqqcjUBzj4vmjAyZ479xc1i8th2V+CPwA7KOFwvJE/5RjrL04k53Bt
         aMNxImSsQiUNbsbUWskCYq6iM8tmdqKxfJ8DPYvomIW9Ly0rpRijxZUzSHf3EU+NmmjY
         livrLeh/OCbxWIVwZJ2fp1VY0s9CTOBoSFxL3rLBrom5ugisdRijC5B9CJh8K4ycZbCU
         xn6qR7Ru5VPg3567JiWjzDeGVlQhcjeRN0SLxG4qwDc4ZeTmwlPBGZjcip61jXG3FKZ1
         T4EecMFEzYlpQTFJqk49OnXNhvfYf4vGB28cV/0oi85HHSZ2x7fArEPWcMnBPYiLJhKC
         Ebww==
X-Gm-Message-State: AOJu0YyETlIe2D9QEUGYDEF4Th3Wb2qqMey7kJFdYXHc+1wZJyro6OLJ
	IPhGsqjbEaYDqaG8okSMeejyW0OdKDYCVy2iuiO8JUOI0SRZzf6uowpVom5jHMxydAUaY/zQp3w
	FXnp5cYR05hnLuAW+SUL//PPWiaUpXvpYN1ks0uxEOtlOWDszTT/3UxxHxHhszhXfT53l
X-Gm-Gg: AfdE7cmEJhkHum1jus5ZkaZ2Y6ZKOAiJ0GDIksTfp4ZJ+JhcwTIV9FAqx5BooaM24cN
	Y1FVRuXydBgDRhL00HwGpLhAiYC2UcloeXC5Zi5layiUj5wpUJdyDobhkrrh7DOZxU8vClf4pzm
	9htvSA6sJ+ACovbjMHI5EOkGCvMeUl2Mr0fUboVpyK1gOLm7m6bZ9sq776RBkp4t5pjC3JrOnaq
	KSlcYss5K6NKjJ+Z64hvL6umTMMFYsKi8IFcUxwv93Xl6HJREunldDhZR2RFAmEd0v+793407bQ
	RSkSkumjRZngkPp86MAMILfjYa6TVW4m0zmd4RLlJH41BMzvo9lamxg6aQSJVr+v7jfvxlYKgU2
	4zHKSrFCzxEXfkGDlzjbtoO91RPO+3TscAdB7onSw
X-Received: by 2002:a05:620a:6919:b0:915:675d:a2d with SMTP id af79cd13be357-92e7b419984mr141261985a.51.1782913155119;
        Wed, 01 Jul 2026 06:39:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6919:b0:915:675d:a2d with SMTP id af79cd13be357-92e7b419984mr141255785a.51.1782913154488;
        Wed, 01 Jul 2026 06:39:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6619:ec60:6996:ac02])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c3874f62sm18349985e9.2.2026.07.01.06.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:39:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/4] firmware: qcom: scm: simplify code by using classes
Date: Wed, 01 Jul 2026 15:38:54 +0200
Message-Id: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4YRWoC/x3MSwqFMAxA0a1Ixgbq/z23Ig4kTTWIrTYggrh3i
 8MzuPcG5Sis0Gc3RD5FJfiEIs+AlsnPjGKToTRlazpT4EFhQ6UNKVhGXaL4Fek/Oferm6bqLKR
 0j+zk+rbD+DwvUfPSw2YAAAA=
X-Change-ID: 20260701-qcom-scm-code-shrink-c9aff845537d
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IypPBtbtEojFxeZi74vIWdNRQH0Ig7E3O3gte7AZJME=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqRRh4uC9DTwWrzM8mH0jHihm72nRPG/M7XYdd8
 gDbjkrtAReJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakUYeAAKCRAFnS7L/zaE
 w5w1EACObCR9s6YcCVZ01JlMMponFUcRTrVrIPTKH+9npYpCTluMaOCfV48vlVhFp/KwB/wokvI
 ld92nSp2minbiBqzjYg8gPI1IyTa2u9SIJ41sDDlMzVuL3bCaGggvTeA8rpQUFiru1gHM6fAKv/
 f2WE9dhALY3PA2O6lzArlGPQ28c6HY04OgPaBm21ScIK30DSxZe8qG2YaGKQVWYBeUC7G2HBd1+
 Om2+8KUSldI8YVQJCO0RiEeB7OO4Y2iKd7nN0w3cHjjEfVyGnEan5T1l3/1QBf9dT77Ni4Yxfm/
 215qBzkiMprOkMlUjhW4qfi/sdWdeVCbzW44nEO4mdpPjL4szWlWQ/Y67UlXsWNGwz0izeDJJei
 YQg37x3sR/f/U0w+O864kIdYym6iOv6lfz9KZiUIQg8I0wXpJmPuptADqJzjdjIAOHm2ObzNs8A
 vFIxJp0ypFGMZtKvAbFXpBzGCdY88IVCz/I5iiDbfKC+1Lwb7dxfi+Fzwc0Pn78/fvJOLjUW6gb
 Rim/RxRfsP0ICDDR1E7PAPqY3rtNK/kNdktKgnr539cg7vDJNmq8ZrXv5MrrujdsHY0YlzVlfVT
 DKnNnakjOMni056tj6GC91lFOaUuPOgIDh3bPD1pckpy/gGmXUL9fix7UaZe2qejkG1+ZLRjlbX
 R9yobRsxH/eThWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 7GrMulKZM0DvdseCcArylHRI9GpjMVKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfXyQGfu1ifWleC
 vnN44v63rlQTv/1x5c2rp1sfbz5zKWfNilYNqcN/4CLxvHqJ3jtFyYtRnRMxWuNNX2pm3abFc1s
 ZMyRorT8rnV194oqvVe/vbmkp2oR7IzbWIZ+Gu9TQU9CvvN9G7mYRSu9QL8l/KmDO0Ec/sgLj+Y
 S1VNuVCwEPv/MnwUs/5Yka96WO46OkBMzzRYstVfd022NM0uvo4MUsO/ENW9zdRpBENiA7OncXE
 BWNyRMH779kXf1LDlGgUGz8tWvNVPfOqX77m/dqaZARs0OiFCr6FMPqa+uVlPwBV4WjO4gQpd1d
 qbhIKnXm3N0t6M5ikCc5s17cIgBaRBiYh5pLQtr7dcYrcwqVNcj8wGA7YzKuw4lQtVzO/2Zuc3Y
 pzHWnqNqSTSE7WVpKM5PSATDLLnuWkLdR72wvbLSvlnuhPmPSwM3o8MT3B/roxJHky0CrJbbgeZ
 kdGWolw4dviZpZ9KeCQ==
X-Proofpoint-ORIG-GUID: 7GrMulKZM0DvdseCcArylHRI9GpjMVKy
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a451884 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=9qASb20qi_AIfpCrn08A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfXy2QpwvugcMzN
 Jz3X2azIq7cE3xP//57afXIJ6zpCnw7OnccHmql0HizblcfcRgkUDMGsh7/jwBTpNR5ZNoZcYmc
 YHHP0V3OmaPMgNkCrNBmsdBnLyatCmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115718-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FE446EE926

There's a pattern of enabling the clocks and/or setting the bandwith
limits before performing an SCM call and reverting the above after it's
node. In all places it's done unconditionally and can be simplified by
providing appropriate classes. There are also a few places where we can
use __free() for tzmem pointers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (4):
      firmware: qcom: tzmem: guard against IS_ERR() in the cleanup handler
      firmware: qcom: scm: use __free(qcom_tzmem) to simplify cleanup
      firmware: qcom: scm: introduce qcom_scm_clk class for clock management
      firmware: qcom: scm: introduce qcom_scm_bw class for bandwidth management

 drivers/firmware/qcom/qcom_scm.c         | 184 ++++++++++++-------------------
 include/linux/firmware/qcom/qcom_tzmem.h |   2 +-
 2 files changed, 73 insertions(+), 113 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-qcom-scm-code-shrink-c9aff845537d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


