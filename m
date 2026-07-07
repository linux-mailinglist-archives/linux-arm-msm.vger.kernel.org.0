Return-Path: <linux-arm-msm+bounces-117414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fQ+sIw9/TWqT1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:34:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 008B77201F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:34:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X2n09zQP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BnoukAi7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117414-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117414-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 838CE303DD45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABA13EBF23;
	Tue,  7 Jul 2026 22:29:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10B3DA7CD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463370; cv=none; b=Bl8v8uZ/ShXcuu+zNB8WpvT+QklVImiQxNWCwQGs3ntDFS02xc5rogU/tjMrt2rcj4+y4/OPkF2zymnOqA2wyCiTjE3HK+MRwGqhxuFxyDVl85YSrXxvOqyBmyy5VFAsAE+Abbhc6N5ggCFh6/D8EkkAVL2fPkaOCvDkscKNJzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463370; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/Q1Q2dxnxknCcRFZ+SCwOBxI5iewy2/n3u9OmWqfzlXDXYXzKxQ0B9EdueoVDs5ZEX5o3MoHZzGE06z/9S2qChdtKxs1T4c5C3ncAABejU1hq7wFaCrl1Oti5ykcbTS0qG8KWJ1BRSr7KGTL06cdddmkYoec7qnDCv3HgZfOZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2n09zQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnoukAi7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Mm6341630
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=X2n09zQPwL9gWXE9
	OD90iq538Jgsj4lUECmkVF1aKfmz+JbJhTHUs7vI1uVAGAwoHGMwDPiEFF5uaoMD
	PDsPT+KORlTPY0Kv8L0vfMBXtu0Rj/Y4RA3AFOISHTYQqhdXXthjCZMQY/1PAY4b
	zflDjRro7JDaA3VX0adxfY3Wv0ReapJ5lxb6qW80t/bf8OGGSALxFYwLm+itS5vb
	0vgVFqV2C+T11QjDrwa5G5KQa6akB+z+y4skshgOmaOJS287vxEfg/E5i1UZN69V
	bFuM5LqQ8DHC8dtKpmzclxH74g6XCbvFFsNKR++LOufaS3DETanx5LVY5QBZTVQe
	sFdsrQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2ubv7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7395c3d6923so5740137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463367; x=1784068167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=BnoukAi79nDp9IhIC1nJ6S+BlycjQI9DiWFduVY18qjxpLBiDkBsdNjo24G6JkY6O3
         Laqci6CxsQZOvRmPkz6knOf5cpbQbdbZ2OrUglMP5Wy5vdqN4AfRzany0XRJJGLoeYyh
         E2cwOIOMAYEjPJU2fpXBC3beNXLcg9+s3hlLffjlUo0jjRZYIfcT6wK9FaDSIKsPSrFt
         HWnvsYaGHmMb2kHQMB1B1mZ5nslrBar8NfvZrFUzSf+6gjRdQbBq8fEVXx4JkUSK17LP
         a/kubeph5m09vApiAKhpG+9diJdGnhvfwjdyu9R2dsmkTBhEo1nTJql0QePO+f7Aq5jw
         1Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463367; x=1784068167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=Wusb9TU+3O3F/laxF9xDhgph6WmlB803HG9XgJBmqP1kLGtC4rQIdWYOBNJZ4GrNNP
         O7uG3eXVxFndmv0abqFTDqPsSASBfHsOThTAxQaTZo5QhYOaY5lHd6XXGnEVsSl5tQVD
         cID9l7smwgje1Q7sKXIWk/6sykkdGEMRnH8787pHgHIU4j5HqefRY5cw3F/nbgGD8Wk+
         eRokOek10MVA81aN+vTykw5H7LVygUfpcgdQRucdoDaKPmJNCjwAqWenmUT9XXAkOxkk
         xv00ugLAnxELXDK1F8vhtynGUZVxsdkI0PTF56oiHP00M1araLcGWNsrXVCIRbLhcmSk
         u3cQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgkZrkPwS17lehb6lxREHG6/QlSSTHr7n5iU7fkK64yBKwkqxz0E/SI1XnaPLHlFdLhTR/ES6J49TqQ0vP@vger.kernel.org
X-Gm-Message-State: AOJu0YwsX6JRwhO6jK+K+O8+FVNyfwtgRYAY4nJxZR1ib1h0rYswRDWq
	3TG7ipM9z8aCJ9YXujxSWDsaEMiJmKZpDqPDsEU10UIyJTvsg7s+aJWI4WxI/ptWF7bRqlmzvIV
	wtfy+ytMzmJZOViDUzoIZfhi8EAhmSpbDvP+SakyIKNq60vbANW+ojWsaR25+sDrp/IwR
X-Gm-Gg: AfdE7cm+svBu9iuovD2+u+3uF1Hm9XotraNcj+xPBX/R5q/zPWEVVCKddN7a8ycYa3i
	DwOM0C81RJNhEvBkGSzHb/DOejR01WdbjjIf58+oRSueuiNGl5j+ppVeEZp2TcexGNDpBJJCav5
	DigopQvmpN2hPpHL4fPiQnEx5k381WfbAd2lbQwqoYRTSzCUDeHjcyK9j9LQggWhdx244G9sisQ
	tPthD1pDQloci6fd8ceMhzE6YZPkvaUBwu2Bg1OI1kU2aK/HapNyBdSLOpfQRMf4fkmluP4IQ6d
	0DivZD8UoE9YjaVLONYBxv2oxqUbJ14NeDxf4yIc9rHyR388I/oBs5LFcm4EKKTXGqQHcBtS1Z+
	GnDM8xIDwp7YPVHgECRTmgldGrZRVSfSwo+yzMl5//sQcnS9d18Q0/riRBlewG+LXz/R0QCrJZ6
	u1lJGZZTijRbYW50FL4AbECErP
X-Received: by 2002:a05:6102:5691:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-744b7b445e8mr3854124137.4.1783463366672;
        Tue, 07 Jul 2026 15:29:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5691:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-744b7b445e8mr3854104137.4.1783463366204;
        Tue, 07 Jul 2026 15:29:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:48 +0300
Subject: [PATCH v6 05/18] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-5-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2oPKN8drf4UqCJTHZ31bVuO1adnIfKPTA3x
 Cp1hcorwmmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1XvvCACQphdWIJgYuyX8RQLL7VNjFiLlJkvueBVcrBgf+9T3xQmKq+4dUhl/dm8XcXTKH/Bv44A
 W4vn1l3uR47KnvuCJ/5hp13kw259KvoOyA+j9eeNqPEqQLg0TmORio26TEdYJ/icI0OzvChWylf
 mM7BVXVDF06HgZkvVDBFnhBbaPgRhvu6EFhMyHBNlEf54WGLJMsznblIHZbOXfqliZwFvBBxTVm
 tamUPGoG9+QQ2V4N86tVHDOo+U899OwyHquqmq6/s5Ku0NixIcAx/PAPp0OAh0V+v5DCYiYn2nI
 ZCZ4YW1jDJiuOM2sINAJg/ZVk6R4eapw7lkc9TLhaU28JspE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX5RoMXzqmSb2q
 ERVj9b8RJWK03wXaB9uIeAAYsbnMV/LqZV4COXjVmU1OT1QHuh7yHJxlSvxoB2HIzr/RgoSS+oS
 K2v6nFvwaZnx3cb0OZtaTZXR5Ng7RVM=
X-Proofpoint-GUID: LwMALLYJpwN8SF-zrKuM4F7dxClO8Pzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX8baUXRmIQ2Q5
 5lCbv0ObiXBEdLdkC0oCHROksJbOY3VwJKbO4mUou+X78z7xWqmCpi222+mr1sPe57ZRhEIwQJ/
 9+JChvKr4XAUE1+u9KvyxDX3PXT2+CmgHnj9kh7JJzrfMLs0U5txg7oF6nhNHFYn8lUxF4dF1aZ
 plzoJp1TFFUeKZ23FGF/Zd4lWJR0yhhRqYhJOdXEqGT+kkwbO6Nnhrwf5wvOF8sKlKgrFzVpJMi
 h+C+vdIylTTUek5tDhoLB2VPvz13QVjhLq2KlpOOl837fWVzA6RTZCgDJ5sVwUcgoFD3Zq/0aGb
 q5C5QLiigyU8HRFblHUGxm1w9A2DbU150BojNPDCfCxGWjQbvWa39li/xv3Edt72W0edBp20YA7
 7UsZ3+svldYmVEJrbV2Vze3d7XDPST5NlyqXzDqn/5vnFdpxi9TUMKFUqFFQmJtYZxxDzB4XTpH
 gLeWBXTSjkXJKmoSs4w==
X-Proofpoint-ORIG-GUID: LwMALLYJpwN8SF-zrKuM4F7dxClO8Pzg
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d7dc7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117414-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 008B77201F7

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


