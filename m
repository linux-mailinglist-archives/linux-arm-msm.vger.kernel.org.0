Return-Path: <linux-arm-msm+bounces-97303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Kr+IRuFs2msXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:31:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEC27D208
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DDA23155378
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25957342C8B;
	Fri, 13 Mar 2026 03:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpfoPj9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sxisp9Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194B434C134
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372636; cv=none; b=cOAbDLLLRXzixCnNWZKg02yN4Q6Bd+2WU/dB1npWJ61k20b9qAEqdrRVgCA1x0xLv0koj5SD7Xs8D+a+AzI0zc6r/chVXKEgv7sxtGcZeegssa3nWL776N5JDXEtvUGZIzOFN7EtHY9wXy7aL3TnLRTmfVMxl1FPpxjAKBu3mmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372636; c=relaxed/simple;
	bh=dKd+e7VXpOLrs33EkmmfTfblgiU21vmALyxPTYH2etM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9+sm6ujMPsNj5FUDmkgjM+snYjlpOambpyGrhQuEZhyOhBSZMyFLNR5nH6OMVwl3IeZ/vPUuY6AWOWWNnYRHkP+NJlA1z3H4c0BVFmfbGqyPlL67e99umBntG9jdHP5UIwU2vbXWVji67XFxjWqLC9UT8L2O95n1IdjGuM/cBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpfoPj9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sxisp9Qg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CK6CXi263571
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDxcjhAqOb/kGi+fNZPYkRZoZ7JQxWwf0K5Qbx1wh5o=; b=RpfoPj9WGRA6h3IM
	yeC2lzFrhh0cVNTydnrj1Qi2/ii8PdkLF8w10EQSfTcbZCDaVuIVPh+EMD7uAfJ1
	50R1z63gNwHs/lLlxYecQzHr/rzoLEYM+Abc8mIGCnK3Y4ITX+r5lBOfIiOvMsrZ
	Dygv0QV4+UZYERW+bVpUxjX0vTfGypRjiPUZplyREYG9gISQnlBhp6mZUpUnRj5P
	/u35ep5SESSu7rWkAeGoO7umQGxEpxNiXYr9IhZwDN20OWh5MLwG/2CqdRyDGNcd
	rPz8vLGuc2VR2xAqb+Y9PrsCMQJWB3wOq6e6Y0VbZ436ZpLX1gF820zgkkmFSNfU
	8cqLBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymb9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7de0e161so1168259785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 20:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773372632; x=1773977432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDxcjhAqOb/kGi+fNZPYkRZoZ7JQxWwf0K5Qbx1wh5o=;
        b=Sxisp9Qg1PyNMtjP2MKi9mBVQUPTJmh29t+yH4vC/NF7BxE/J3aTr2AiWSoAhTii2z
         MhaaQCdgg8ow4o4Cb88g+iEOBEF3PGVShHqf/WCQAucoisi9aqeCiJzK6dR77Cxktgus
         C8cOE78uwtUyi7DW6Bt7/Kpz4RnYWnLJ4xo1r2Ssyu8UPPyHzlojwSZDXJCpw+GjibAq
         1M9g8d6OZY+yv5nV8yXSQPjISdKezeJqx/3msYA7W/M+uXO0W1YacqqJ8coKW3SQzx7i
         pSxUeqOmnILRJd3vlE+EAbaEhjABWnINwQG2L50yn8JY52ieCg+ix9SpURnFOfb4btn9
         xXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372632; x=1773977432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDxcjhAqOb/kGi+fNZPYkRZoZ7JQxWwf0K5Qbx1wh5o=;
        b=ebdIqY2AuLhMZB5WWvUdxb/JobtUO6edVHfTIZxONLUEc/kTaTatYA5RhVx7mGMZT3
         0at2K1Eagky/30p8tKkJmkmuWEHIHj9QW5jlTt4Y6j9+fBfvvodYYLg8Cnl6YsGtqUQy
         Zk8U/uZAmh11Bo5vJ6UOqFDsq7L3CZtcL/7azgl2haKvlLUKTqwIJPaQrZRZ/LShhnz2
         9H9O4gso2z58Chj7js4SJoVWAd48hbfT7DZ8sxd5+6QXgBQfX0fceAKR5YmHBOUyLyx+
         TUiE03ViadRj1DUT1Qzy7eRuetu2fu7foUL8hTuTVEBTHk457Sc80h7PLixdWXoIuTqB
         RKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXcNnlwOS4V/F4BCsHnygI47888cUIju1KRyBBOwUYJVbGBj1I1b3rRR4UkTBGHDXlhRHtGnP3hNsMidMRq@vger.kernel.org
X-Gm-Message-State: AOJu0YwAz63JF9MbgXf3ovMuiXOtohDuWOm5fKfq2On0to/8spCAoDB2
	YABhcryAO2o6QrqpGQXqct4os2MIaFEUXfKKJ7+jaLBqbNF3ur9JAlgBx4dyQR0irwlW29dFBK0
	sbCdD8lGcThuE81GBY3piJ/clNVGQr1hmRFZL9iimIHHNKegOFqwQNKTYOsA55uBQHaxr
X-Gm-Gg: ATEYQzzewEQAvLAD69Lvj4QY2FwqAuwUvFGwNzafDhIRxXhbFr3THqeigTQACYUYdB/
	gtsUii2RHBMUTydBmN7JfIU/210brg54lD5O9c10HQ5E0MQhcajthhodsI0GIrSKFsikrz+mWWx
	+Wt1PwE7755PBHXYFy2zJCxRvrKutAUcK/Ij9kNjUGmC/TdgrMlcv8cosi+CYQCGnngCfsbX5a2
	BRDisDErTXq5GQqmjRz73LMPxeWakSj7LQce0tCvhNRIXdQoerT/QNLosbgcvtea/KYUawKYaSi
	/EujyOPBt3nXpj/nYNY/pBqc3oYu6h7Gq146vIgxZ9WFeYncBgCmEnCU+WZpxMWHQqSbRC3UDKG
	/HT/FMiG2D0gLKwcjwjl05XJrBegqUl+Qaz/reoakh4b/lZb6RQc8kIL/+48RKEBliVKrbrgqfN
	JXpBd9aOJPoMZi8OMF2Q8sS/0Yt3MtXwRHrGA=
X-Received: by 2002:a05:620a:4589:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cdb5bb2133mr297272185a.78.1773372632186;
        Thu, 12 Mar 2026 20:30:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cdb5bb2133mr297268885a.78.1773372631724;
        Thu, 12 Mar 2026 20:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d93576sm11254901fa.11.2026.03.12.20.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:30:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 05:30:19 +0200
Subject: [PATCH v4 2/8] media: qcom: iris: use common set_preset_registers
 function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v4-2-14927df4906d@oss.qualcomm.com>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6432;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dKd+e7VXpOLrs33EkmmfTfblgiU21vmALyxPTYH2etM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps4TLRcprbDcJwZdoeW2lpQipWloREBklM9Z50
 qN/sEUR5auJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabOEywAKCRCLPIo+Aiko
 1alWB/9FB/BE/ZM+JW3JpxjnqX6Xh9e+rpiYN3ZClgZa5J1mLmibpY68txsQisViIDWbmAHG5l/
 O+VX48QKEamBdGo5fWhzM9kC2DeZ/AGMFqTUpKYMZEAKDQ6GbixU4QYQC8IDIZVoPPAOY+CM98Q
 jxn2heN/N9jJvChvVWn4A+vnYwBep3CdTQrgtliTrsSrcG3zTDbyFT3a79vNey6DNnbi4yJ3ndL
 r4UQ6nmT4obcKhaV54XfSnuMlQFfMqn9parVyn8ZEpmkLKCK9hanPMjVnS6zLH3FexkqDxY3pQX
 HOj6bsBUhDjsqZFJ4x0eoipsZRu403rNv6sw+4grqkoWJhvM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX+yJacGnWh+0Q
 3Aye6MD00VH/7wp1KXuEgcpjAZVnOFgzGyoBLrlEXuW3fccLkR512QjM6zVO4nZW46AGn9MboFp
 lj10ZtSPVAjIVZxNOz5nFZzDWYNvQaHcdHQwE+e3P+ZbOrAXizAMu81f6+zjLJRlA92Nb7kpG2v
 W5f2/fd8Fw9Of7NBuXNLR9TEYIRne8QmKx6qso4JHyUQuICNkUxLOs2UZ9d2fSgUhZx3hGPxGPW
 rs6qZUQTCKgA9q9fDv0J4ER7LUNlWNwjQ0pzZSwk5vyn3RO43isgojIW8in3bl+DgXStqdsgd3R
 j1I2KgNi+LC3luZFdfDLJLarKYqGHmjrdp8rHXRUy12rUP79XO6CscGxqjf1FBGU4Z7KPnfAulN
 99CcctawcFRH8W/+IYyYv1w4nx7FOC3XDIWHTJQYfvEM/OJUqoGrspN7F21XcgG+hOwaGnZHx8Q
 08giLtWd9BgZx/Zu6yw==
X-Proofpoint-ORIG-GUID: HJe30bRC-FV1nvoS6CeyrwGXRv-pHct_
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b384d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HJe30bRC-FV1nvoS6CeyrwGXRv-pHct_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130026
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97303-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFDEC27D208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..d7106902698c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -207,7 +207,6 @@ struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
-	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 07ed572e895b..ed07d1b00e43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,6 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +391,6 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..c84d4399f84d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,6 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1012,6 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1107,6 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1204,6 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..faabf53126f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -468,7 +468,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	core->iris_platform_data->set_preset_registers(core);
+	iris_vpu_set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


