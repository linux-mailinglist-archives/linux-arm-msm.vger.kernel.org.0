Return-Path: <linux-arm-msm+bounces-60319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD08ACF10F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0BB16F276
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 13:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126AB2405ED;
	Thu,  5 Jun 2025 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayWA3a9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B58225D547
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131008; cv=none; b=rS+qr4QO/lAdXCKjb7Cpd3iqwEs1dLXUwLlIgVVuUyh8nUfKegEW5KD5XyPb+unYBSo46ntnQJT+dE9tM/SGt2r0GTrsCj93NOvlTYZaWvN4qnbFmsXCAimKO93+e15nktX1tmH2yEezbj2JYgfzWuy2shGfDdZCoQozhF3tqZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131008; c=relaxed/simple;
	bh=3Q0QXaolxWY5w9SU15ztjaahCT1/EvDyEuICk9gmC10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CxLlm9QSxWFlszPbaHSk9u1QMP0UsA0P1XhH0xDIWwwswvolyfA0GsVtvWMqipZD1kwy2YNqffJrijdFx65CG8p+pJtQiCS8sFv0IARaTlhMQRpyjYsEFTKly0Z3xwkblFdrbqPUa2XLCdUmi6jgHXacaeOeUCcjCjyc3ERTeP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayWA3a9I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558LQ2I007534
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 13:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aVk8k7cpJXs9jx1Q8NkhQx
	ynOKi9vcuv9OFvsSclvyw=; b=ayWA3a9IjQVbHPcI8oG0g8V6j6+vwVu/qm0CJ6
	EkJrWAtLx9+vfak6UFwmn5I6ZogT7r3OGTGAYMklmxc6Ev15JRpd/WX82gfZ9l/E
	O+ecVtdCCqUWLbcFTzfACQ/N7VH+l1AqAafLnfZ8o/2zFCOQyc8W9UT1w+xT7iHp
	iF+F1AGQEgHNr0b7bHsTQJ94QwEzhRjnnLvkJcxZkfbd+6VzC9j+WTKQ0n3gGNNm
	asoe2rq23xsh6XFoMSvKxQpnbqAX3pXkdkTUyq4VfsBQgheSjGolUugZW7KiXRwX
	ETvqeuZARy0U8LtOGyrGuP6dk9RNdtkVE25nkx4R9WO1ZvnA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t1ehr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 13:43:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-87e6a27d6b2so769955241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 06:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131004; x=1749735804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVk8k7cpJXs9jx1Q8NkhQxynOKi9vcuv9OFvsSclvyw=;
        b=Qnue4vKch9sOHf/2o+nS7vnrPyosScnKnxKTLtJV+eR0wvVUVXYl/cFhYQHRvQL+VY
         6DJjK1YBz46XcylRTCWgBkj4V7lYDPLG9xlUY4zooTkL+rKlQfU4pchMKw+tmbmWn8hM
         gG5vLF2Hu010aTEgtVAeSfi4aZzTluD7wf3s9iX3i1YJVXglB7q5jLFpWEdIs8qRSj1v
         RZWiFZAy1+pnM8nGXlDjGcIPYJbMFuQUrj3tS1lVnDzb4HWLSHsnjxF1cv76iOn1gPHw
         YcUMTnxe8t4F4X3xa3UCU3oqLsSCFtb3dG86VKrP7NRVy5uovmdLXU3dryzEA8jP/VsQ
         dS1A==
X-Gm-Message-State: AOJu0YzmB+kUKUsgzHLgJv9eYX07UHT9exwB1YXhYzSE8/vs+XGwSMom
	eBRP+vJARxdJ+Xq7pbXip9k69JD5uBp4c2Rb1LRoManc+h8/WX85TNlVCjNDU8dr/bqpaaTmdYB
	mn5/+Sc8M7WvMEi5e+HQnlA+IhnsqZ3fo7s0a+H7pw4fpWPpAqO9ohYUEbzIHTwAo6yMuoN3e21
	E2Jr8=
X-Gm-Gg: ASbGncvt0MlrQTOp6xNHH6YES6EOZ0Fj251LrSi0MKnIqkeKAREujC02BtJoBl1HTg9
	nWbWgCgGhLnxPX/nXBnFAwyHocU9b9nnzGJL66frEbofzt4gvKAYw5c2zYMVlRMmiwQaNTlUAej
	RlfmM2d8fshbY1VvWJQr7BldZ4sRvgQ4Vsyw+H6VKqS30nqP4cCue/64tTKI9vtj10quwQfsXU6
	niS1mQ9JjREAeNnNv2z2+l0bKVgGiqwVyIhqGN2TL4n/YqLRd9ztRvJDMyEZvnXx9MgKT7Rx6V1
	xCh62U7wLAUi/UotOvI4p9o4tQO2uGxOHINe4iIGiFP/zkwiRI0Fjr/bGJxlDflMB8svm/oIMB2
	+yeA+u5mhPCs=
X-Received: by 2002:a05:6102:e13:b0:4bb:e80b:473d with SMTP id ada2fe7eead31-4e746d55980mr5288733137.6.1749131003944;
        Thu, 05 Jun 2025 06:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYdfhpp4FJ7SmLqPejCmqbxXj2opSUrnqug518ARGUG/eIE28eAmWYKD/8Tdocm8sfAG6kA==
X-Received: by 2002:a05:6820:1987:b0:603:f903:c85a with SMTP id 006d021491bc7-60f0c73392emr3549900eaf.4.1749130993365;
        Thu, 05 Jun 2025 06:43:13 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1eb719f8sm2691359eaf.28.2025.06.05.06.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:43:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] (no cover subject)
Date: Thu, 05 Jun 2025 08:42:59 -0500
Message-Id: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSeQWgC/x2M0QqDMAwAf0XybKDW1bH9ivgQTeoCro5WRBD/f
 cHH47g7oUhWKfCuTsiya9E1GTR1BdOH0iyobAze+eA698Avb7isxJJxp0WZNiuQEmPUQwqGqfX
 dM4axeUWwyy/LLWzSD9f1B9BRFkdxAAAA
X-Change-ID: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=609;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Q0QXaolxWY5w9SU15ztjaahCT1/EvDyEuICk9gmC10=;
 b=owEBggJ9/ZANAwAIAQsfOT8Nma3FAcsmYgBoQZ7wzuSNIDoxicO+eNJkk389eTziZ8KRF85s7
 6OX4lm7xhCJAkgEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEGe8BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVb5g/3XMzQN93Xb26ritBVMFl/NWhaWaDwsj1E21MPfrC
 yPS7y7dR/q/qmdY5PQkuGtBLuPwsR5iBqDWY+OTupBuvfaBhUTwiP1cmae8wWpDyJK42VXH+tNU
 nYO467XQnRtrccGV3tZEWKGjkdbag2rIycxrgo/jmiAzFVKhYD7Laf3WCtzxXd4IFImImxpoxJH
 IPWnOCogvs9L2bm6wkBZ86r+12bnXMXEfsVoaQvCbg89ZwEhbbDcgDSxY3evv5YHw7Q4fP14zaX
 Tt8KVGPi4dsgJLgpBIKLZHbZdmSnUDo/HEZ1tZIJ4qdhbM1WIvhifS/TxWgyLeixTXt2YaZ9jxe
 2n5DduGlUyQXfjAQynecszk8bM5R/ZLKuFwS6fHUTutyewTjmUzuW4RPZ+5vQzHOZPmGYiTjnQp
 9U7wonMZA0MivwxESLvptyHZcAMerE4arcYDp27z3MHftPMTC7PBDU8O7zIJoFEIdoqJ63U2uWO
 k3x2WAqJ1fXdddf8w4L/Hodc5O6U7tvIDEseEjhOCrkVGYGMrTtSLjAtkbeX4iRxyOXHQ7deI7X
 IW2WG8EbkQauEn3SN5D9kzpt7FW+g8Vtx0oQL/02ZW5sFBLrf0wxNIBs8qP7ycuvKN7z5u6jenr
 nLUiT2LUk4rWW+tZk/CZKe76IhBS+KROFkiFiULge/w==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=68419efd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Eo5HmAVCleSnqplLZ4EA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDExNyBTYWx0ZWRfXzUzD/FSHfYNp
 JSRPeGCD1wXDVVmo/rpQJzDN2Qh8dhNUP7YIaoBFvObMsOA+7fkbS44wdEcozGuU+3RiN2itx0r
 WuvkAxgYXrQ54b8Fmwuww1679aAQRupcoQAkLjWm6KfpvvPpTWtp31aUPSun5OsUH0blOqUde2c
 /NAqXG5/UrU6BIPr6+eKH1FljVuwqWTwINGmhioHwxwPVIx9mTNfCvZ6fYxNBRIPrGzm3MaGFpL
 A81TnOBKYjlNds8lhwCWQP9r1IxWYBKnojsum5bPS4bq3icAtYdDLWYCGnmSbmcB5zWeRMgPjSP
 54owMv7HncxCbv3NGyuOgXlbUq3+V6q0hhNhRi9k+Ib6MQbBDhPWiR7bRT8Zb4QT1N04Vr13ML2
 M4eHDGvdMuMmFZi/aixZRPcp7Sw77L4aRZYAsoXOsyflEWQpeNcjLqp/6Lc5RIjegKAgHOLT
X-Proofpoint-GUID: DvilDdqCj5tn8WjF64LIPe-PCWzqmI3A
X-Proofpoint-ORIG-GUID: DvilDdqCj5tn8WjF64LIPe-PCWzqmI3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=853 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050117

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      soc: qcom: mdt_loader: Ensure we don't read past the ELF header
      soc: qcom: mdt_loader: Rename mdt_phdr_valid()
      soc: qcom: mdt_loader: Actually use the e_phoff

 drivers/soc/qcom/mdt_loader.c | 57 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 10 deletions(-)
---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


