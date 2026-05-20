Return-Path: <linux-arm-msm+bounces-108778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULxLDJLHDWr93AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:39:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E858FC89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 108813011EBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2AB3EC2CE;
	Wed, 20 May 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzNT5s59";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jil7g2BK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3AC3E2ACD
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287896; cv=none; b=WBAesxByjwy4J+PsSeiQKvnwzh+O1iSs2iI0ofucerfrfRDtg8TIKp7BCAnu/NbOx6tddA/w2hEwlly+D0DDnMiY5VKBhlfHL41MwS3fpilwKB5ujiy9CwJ7gE3L2x7LoXY6H9fCWbLtofxGfDW9pKfP6GpkZ5R36OJaut4Xyn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287896; c=relaxed/simple;
	bh=A8Cn0W2kh/8y3Thh/Zes5CLutCCBA4fJ0InBehz3x70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nK21ElSGzkr4iIX9sybXOPoPXKQIbXyYIiRBMvBJc7QqYAjmQpbSfqb2zwCyWl5bhiPVfvfLUOpIzzwm879AE18Zdxa6xzJJJIDf8cPlXQI9E2Te3patZ+TAHNAqOu9SiHwyG+rUrDlkfsCTRLJRlzrTFptRAd/Dn7Ue7BthStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzNT5s59; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jil7g2BK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFgS8964044
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VwhVK+otSMFcNBpA3134xv
	v4d5d9O7XEMmOSqdDzA/Q=; b=QzNT5s59d4NTNiJM/9tv6gQ6QqUx9ltoRuxlWQ
	eCP4QhGFoTVFWfd6NlFAx4IEuTD4DqBLHozb8kxJDmW4B3Mw1UFYbnDvqbaouMLG
	hHXD+Zm6VbJud5lZbh/hpJkFNJjLqR9aR4g7s4ZHbSJFIgxWUAIF5Sl3h2xfTDYR
	gYk63OiyrN8d4gk0vyLu0KyflyeeTUL5WawQ7IFbVjrMPIk9sgGUN3KPJSdA9dfz
	qB3TFJXcdb9xYKHJX2OVqT5f5ygKUfLvSinC73y41pDHA5sk5L3c58TN3G//sV3I
	eoSgqhMtdVpj8zbiRSbsqmSVVa0un2ctwvdz4a0wkq0d0l/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh038f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:38:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba86e35aa1so84299585ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287893; x=1779892693; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwhVK+otSMFcNBpA3134xvv4d5d9O7XEMmOSqdDzA/Q=;
        b=jil7g2BKwC2WV+Qov2q23tuSf9PwUbLeLruvU2CVc6Blspb2DP/iixfBcu79tF2eKh
         B5tr1/ugWd5R/YQnOsCj/aleJI/NjTgbbwCQKTNk9LiJ/ilm1oSFa1Lk4mO5rWpsl5Cm
         1Tf7hjA501wSXJAbKPI0A2mzw8Grkr9sm2VR0EdL54cUH4NlPAaFkdmynytiQLs8WPW6
         a0TspM/I/f5gULc2jM26YbS5xya3cGEV+QaW+zlfQzUK6IbQkvbdALADgy7OiwpJbX4C
         0GORzSnu6NNuuGB3MCQ388tif8Og3WG7yfP5OzsLrFfLyfp0TbmBsE63/OybQE0OIPtQ
         uCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287893; x=1779892693;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwhVK+otSMFcNBpA3134xvv4d5d9O7XEMmOSqdDzA/Q=;
        b=fs2ZKSKSunUo+DNccV6bmcd1589mmgv0kGfMEKr8Wj+hvh44n7Ywz81CQd0MlFN7lm
         xUjha/dbAPGaSxQYx1WDMEi1hGewsHAknSGKmx/OCd8/N9pxmMINwrRzAJ2mGOVfk+AM
         FPWZFn9FVQCWRbb2uE9f+IPyJQxtAUNjSSmqLvOxUMLtYCj3CeAfSgxcDWMijBV1FyU4
         qcFo98BL6Ir9EdVbJppzwk7L5AUIuj2AmQnw6vRGv9nzZFMWH0aZnUYjGSe4laxsiF+T
         kJt3iicg29++WYMe53Gp/MUn9Is2ZH4VbljZr6iSp8o3CG1H31F06W8dMA2fhBbM9YmE
         fVXA==
X-Gm-Message-State: AOJu0YxENk5CI001dB+Y8zs/rbY207fcwga8Kk30XC5D3lUNrPYgowyx
	aQwDzzLpVddW+ydkGFrZvvLzJgITQPV9k87XfvQ0zluxd4d3S+rR+PnD3sVK3TdhRFLWUAeZX8c
	Scim7arxKJCV7Ydf6MFMQGEw+BEC76Ak3ZBF0UgVaT45zMdQhl30svCOhWPwify/FusWcGAPGZP
	LX
X-Gm-Gg: Acq92OH4c+hrGlv9ghkb5LLKvkAnQr6LLDp3oRViV28aHfC15F2SwcbjsL6qktc3ZAn
	6OOHYtqaNG2XKEBG+kWpXGiwMQfSYNRbjpro5AjLwXge6dxfBWCr1oafJFud71D5Xu6PxE5LAui
	HgpcxDuO8ND0eKxAsupY1XvA8XR4lE2xe3w28MsiosdMqufTqkKfUy4XDxK+I/AeKrbG7zcdb9A
	VQeKgiYg77dT2h26PFRQ/U9APRGT14wuRtMPwXeNECra/vvZCxbJPR24ux+xUwS3Di6dwX2/Ios
	hqrwqmGO/vZj/g7LfP5OHANTpbZrtDwDlxalkuQX0YVOJRAZEXgqxhwZUb17ff431jDEgWYso+d
	+nQvGka3cYsRdW1xKu/bHVvFtg0pDSBwTmBNiPl8pz1nSEfE=
X-Received: by 2002:a17:902:e882:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2be39bd8f15mr61828705ad.33.1779287892920;
        Wed, 20 May 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a17:902:e882:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2be39bd8f15mr61828385ad.33.1779287892442;
        Wed, 20 May 2026 07:38:12 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc60sm232999015ad.9.2026.05.20.07.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:38:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/2] remoteproc: qcom: Add Shikra remoteproc support
Date: Wed, 20 May 2026 20:08:04 +0530
Message-Id: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzHDWoC/1WOQQ6CMBBFr0JmbUkplgRX3sOwaNpBGoXCDDQaw
 t2tqAs3P3mTzPt/BUbyyHDKViCMnn0YEqhDBrYzwxWFd4lBSVVJXZSCO38jI2ikYIV0ptTa6sp
 WNaSXkbD1j113aRJ3nudAz90ei/f1Jzr+i2IhpKhN69AhopTqHJjzaTF3G/o+TwHN9ikgnJY0c
 /62bNsLzQnPl8QAAAA=
X-Change-ID: 20260513-shikra-rproc-0da355c56c69
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287888; l=1373;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=A8Cn0W2kh/8y3Thh/Zes5CLutCCBA4fJ0InBehz3x70=;
 b=tNnwG6yFU91YpKl/1AC+twP0Y8buy36PuVlpntGfgfEmI3tu1RmVw8l2/i0wGO7mWL6Uc9NgQ
 SjVtN97FDCdA52/3BeNXsW0eCyu3aFqqkc0NGrpaQRP1g68e2nrNCR7
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dc755 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E_Y9bAwo2dYQWIToq5QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfX4SRUhuXMW60n
 pVFqjexpWEkDKq8vAMerDEQ2MfzNOk2endBSOJBBUkrHMNDQ+wKSwLPTR5QwqTHy8m5Bqt9ZkkI
 QojH6GW3mcPPa/zvpauRIXLKFgsrq9Lyy+ipITnJOLAJegE+OWDFu+f4qQN0nVylFfx2QC+p5ab
 rRT6Ipdc1mmLSy/BFsu4ZcKVx6Kibu6CMlP7pm/DmGGNMRuNEE++E3C+5vdKF1EJYGlFu4DsucR
 oDtZWtjIy9VQJVAgtI3OrL0kp3ftsrUXL16R+EK+SL2fpbnX6WG7j+NndMTNpMQa76WWSg9pTyM
 T+t3rr51IFMS3us4hs9ZwlB8W6sviW62s817Aky1Bfn9JvUBOT3sEWky7hhTGC+2fdKnrz9XauY
 CkzR2U7+G7EV9tPY2NO9nmmdqXR28Set0pUTz8PdteNS5zPQgOJfU4T8qJZ1KCwLdZdCQFtmyrV
 5NmqMqVel4o3gQLBTUg==
X-Proofpoint-GUID: dIlTqB40ga4Siddljk4juTgwXKB82KiK
X-Proofpoint-ORIG-GUID: dIlTqB40ga4Siddljk4juTgwXKB82KiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108778-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E53E858FC89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Peripheral Authentication Service (PAS) support for the Qualcomm
Shikra SoC. This series introduces the device tree bindings and the
driver resource configurations for the three remoteproc cores present
on Shikra: CDSP, LPAICP and MPSS.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Add glink-edge, qcom,smem-states and qcom,smem-state-names properties
  in bindings 
- Drop second interconnect path from the example node (sashiko-bot)
- Update auto_boot to true for CDSP resource (Dmitry)
- Drop region_assign_vmid from CDSP and MPSS resources (Dmitry)
- Drop decrypt_shutdown from MPSS resource (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com

---
Bibek Kumar Patro (1):
      remoteproc: qcom: pas: Add Shikra remoteproc support

Komal Bajaj (1):
      dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs

 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 157 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  48 +++++++
 2 files changed, 205 insertions(+)
---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260513-shikra-rproc-0da355c56c69

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


