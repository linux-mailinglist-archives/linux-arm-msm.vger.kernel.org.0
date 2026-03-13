Return-Path: <linux-arm-msm+bounces-97339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JqoFGDCs2mEagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:53:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FA27F006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A6F23055C86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BD4366DB6;
	Fri, 13 Mar 2026 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfV/bFWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQM8nkmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796F344D80
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388363; cv=none; b=FAcwZD2zXt+GYsGkFmcptBUrE9oStslCsm+wxD7d6/+9dZHWWYVkhwJJNtk+akEo/f0SdAH4TWSCjNkva4Z3a1/F1FN/vj8P7Xe+5wGQYrhELUXhWaV7kZL2fMqVz+pabBVXDpYB+rZ+TSX8ZJaUhtgZQADknpoqRwtGGCmMNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388363; c=relaxed/simple;
	bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MVv0gOLHpqxM+us3B3/AhXKTCHG7P6hr+FVuvhrPvQk7tZQ3qMMeRTfoRvKpNvFCygcdDKX4Uqr27qDmfTgBvEUnytUXMklR1zBYo1rSVaL/Cl8kHweeU8YWYm5Tczbi/oQtS6AISkSC7O6le5dmpwE+nlyglTkM9Hdb7HdGAC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfV/bFWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQM8nkmq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdZD1574569
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=; b=WfV/bFWAXvM3nw1a
	J6ehXTfX1Wr+m8M2RgX/XDsAB6ObiKWc4tjHwta0R5V8eBpOsq+BwcOGLWq9E0ZN
	5ulLS6QFZH6vu3uHGO0FftGKmBmknQJkRQhhWR8/tS+t8tDQSAAxJQiF7E5xOUqj
	LXfx1WPde8n0lgWKlib9yAN1N1A2Djjx4IOE8Bgw+zb2XaIPfFjZGc2FnyNcJE3c
	5MZRV8Vup2Al24W4ISTDzZqEa80BVbt6+m+EhzJEndckdvPU6J7OFqFwThaRlhlf
	jtQWH/mK5ROdhCTFO7nPJeo1A/Wy6y/UcrpUdP+bRA9EiGFPGiXrYS2nGjxm4yWa
	fzYQNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53n2yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so1131614285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388360; x=1773993160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=cQM8nkmqhC0gnbhLG+rsvDc+wyvPac+o5FPOGbbRxn42zDYGLcL+gb0bCDUkdoa4RD
         GAYxYB0uqLJ7+UV47PF4yEDyxCsgx7mKUcTeLRaOhO3Ymno/GqULvx7YpqB6+i0Ri5o0
         fG+zqyfy0G3NKBob9OzUKbItvCs60he4qsjvxhkMtBSZD/uT6bvzCdnFJ4WdKs09bbKI
         JAXyRu4OkcO/TAfLkP1PUAn8v/YP6VAmK1j0O2ZO5t3DaBoWPUYdxGy7oiJK55siyDyc
         4L6tqZfyCR0XJaY8nabuVZ/u+SZ+TszScEvWojWUOg1lb9z3AbTu5475YDnrdavD7M1i
         MZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388360; x=1773993160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=coznSEw/IGXkTsvhHo55JM/qOTG728uJVTZwtEH94TfkZ8ASvfsRRDneNFMxIslfoS
         AvRlIfplsknI8n8r+NyVjejS2PUu3VtHcwReyXnLnFSN5CRAqJcW/WVNiAzOXRMBLlXP
         gulG0EM2ddM6dObmJIYxhHFNqSY6Zj9JTLCgz1ZDUAha4m5hoiFvr/AD6eza4ald5xB2
         NX4v09flhj9hxt+U6FEdl2+T5LiUZ5GsZCZc+VAc6H7SwzcnMuTofu0NFFeG3J+11VWd
         fJGXG05yBHN511hBxiwO0yVJyfT4MUyL8EKrN12xBZZaPhnpmTuw7tdksDNtH8+sbYVo
         RVtA==
X-Forwarded-Encrypted: i=1; AJvYcCXW+Ycr/EDOnhrnYwdhE7prRbb2QBF3VKo2VLmpSoHLJsldax6i8BHPPscx8HzYyxB/e8YeDcyWERsV5X3C@vger.kernel.org
X-Gm-Message-State: AOJu0YzxG9Z3Pp1LXuhl9By1cBmEdRzqcmj3Zw4LI4S1vPV8/Ftoq1uO
	5+cOnvFT0J1ABEKKBwi8I8HF5dZZ1GXEsjoqng7PVC/dA6DsugPS1zpn5YkAR+Mkowi3UNPtfLj
	epZS0SkU+A+LRW5j/8JOaAoub+PgvJsKUz8KxAOR1iQNifNzmphWNUYd0W6/vwcSNLZsn
X-Gm-Gg: ATEYQzw753gqDQWUINjA/u91cEWqzpn0Hz/S93+SkC+OG1FBySBlBQeHGqPnKtdgJT/
	x4AfEZjtFCGBwT9YZ5E//WP2ecte3O7gO5ndANb4/k5vH5+faSEfGXqLMf0VzOgiW51WIWRrDjI
	aF6R86sLDghoBOg/3JX0YQMeeILi3sMKhj+bIxHpVzGU27fGqiRiHhnflKOWu0SrccksWF/cmjl
	jV5uoddPyTw1Yd9F19WUov6/2lWgZqiexpInrOaBucEUVqhLf7I2eH9xeouNRCaGm2F9uSnr3cf
	+76S0BSihFaYO3vyk6ds4eJAGDnifBUjFYmGNniz4BoJcr1qs5pjWEYzp6xd5q5HPDW4Bh1CyNo
	SVzI/wGAL91/kwwDoq2sRWQQf6veNgcrtp9cjH0EiTDquDJHJAmyx7YsvVoLw87m1yNgmRl4Hqr
	/WNBEUum5OekeH0M/pMT6XVjgBLUH9Xp8MIqk=
X-Received: by 2002:a05:620a:1a25:b0:8cd:94f9:1bcd with SMTP id af79cd13be357-8cdb5a502a3mr329414685a.12.1773388360060;
        Fri, 13 Mar 2026 00:52:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:8cd:94f9:1bcd with SMTP id af79cd13be357-8cdb5a502a3mr329412385a.12.1773388359562;
        Fri, 13 Mar 2026 00:52:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1347475e87.89.2026.03.13.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:52:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 09:52:33 +0200
Subject: [PATCH v5 1/8] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v5-1-180484af4490@oss.qualcomm.com>
References: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps8JChHLuMWER3WcYb/SgoN1GyOJABWKrz5AMs
 dqfty2dyNuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabPCQgAKCRCLPIo+Aiko
 1QKlB/9rzmpkFlP5Yyme3WU2f9pLacBXGXsxw43wGLEEjQlt8iP5+EbaZPMO4W6OxSMZyW7Uba+
 es4psPshn2GY3iLl9g2hBHc1yuM1OxnASIHGdCtVsJxVqzbHZq4KNk0TUOSIshadd39KNAayiLH
 rVXQPkvA3W3f6Y12G16AIaHOG806mraZ6jEdxx6lxW9TtmAUKlmr6olT7OZL7IJDiZf04JNbgxm
 8f8yR5NjKvcky512magYeSM6sj+OQ/c3Ccg4PW87OVgZQTDF0ePayRSMjodDOYiz1dtBU042p7g
 CkHO3cfbLdrQ2emLTsC1CtcNlDe+7RnjJdP5tILYvVpJvytP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3c248 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfX5rFZPrJlr2jH
 hhW3cDebrGhJ4K0P9sY1mph16JHq8VOqFOIy/kAJyymJaXh9ciF8K+bwMFcGEKHclB/YmgTj85V
 H8e2Q3BFoKopQH7tQKf4pEPg+aFI5WcPdwdCGVCVwGYsluXBvsN7td8ymadaU3ZmOwlG7rqTem+
 EfFgCYpbvwCH2s8NUZuQPXE+vDfYkthhiavf1H6vaPWNjB4H95wgPzIyBAHAimIutuiAmSCgYxB
 VuJgnhDeYr+3et4EcI3jbZSs+PsVStzNDdcSVjxGBdxVcupEjcw01mHSpyhdYolH1PoAXjvk4Sp
 H/njSG4BuhHAQyGVpaAV95i1KI9s9W0NGI726seOtZ1NBcTQAILwFCs4c3Is2LB73/OC+s+zZc4
 tR4OUTXokPZJ7lDsF2fwZF5XGYCEBkpS8uGSUe+F+keQRE+PYrjcoG9hAWqRYXBJUZQ/t5TquVb
 p1m7NZcfAvGmWGwj0Vg==
X-Proofpoint-GUID: YtOidTNJH19XpY1e9xDLmhk6i2JlM5nz
X-Proofpoint-ORIG-GUID: YtOidTNJH19XpY1e9xDLmhk6i2JlM5nz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97339-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A82FA27F006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
 drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..bc6c5c3e00c3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -12,11 +12,12 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 
+#define IRIS_PAS_ID				9
+
 #define MAX_FIRMWARE_NAME_SIZE	128
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
-	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
@@ -53,7 +54,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
 	memunmap(mem_virt);
 err_release_fw:
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_scm_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
 	}
@@ -103,7 +104,7 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f42e1798747c..e4eefc646c7f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -12,7 +12,6 @@
 struct iris_core;
 struct iris_inst;
 
-#define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
@@ -226,7 +225,6 @@ struct iris_platform_data {
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
-	u32 pas_id;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index aa71f7f53ee3..07ed572e895b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -360,7 +360,6 @@ const struct iris_platform_data sm8250_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
@@ -413,7 +412,6 @@ const struct iris_platform_data sc7280_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a526b50a1cd3..1f23ddb972f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -934,7 +934,6 @@ const struct iris_platform_data sm8550_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1038,7 +1037,6 @@ const struct iris_platform_data sm8650_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1133,7 +1131,6 @@ const struct iris_platform_data sm8750_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1232,7 +1229,6 @@ const struct iris_platform_data qcs8300_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,

-- 
2.47.3


