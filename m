Return-Path: <linux-arm-msm+bounces-107879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG4/LmMNB2pwrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:11:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B19F54F349
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AFF3320BB10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BFC48B39E;
	Fri, 15 May 2026 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0VSyB28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8SSHsXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7048A2A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845715; cv=none; b=Bya2FGSz9H+baEAkBXr2DVaFPQSL5j5mfsNoGlKWSc18A9mD5I7anlLcoBHPslH/5XKpy9Gw/41EGGVhdxVaeQLC1XaSt0ktRqmGayOVd5ZcrrgjL2R3uXLTPnLtH9mBoITecI8J92fcP7a12h5WWMdyqEJhtE38JGA1gItW0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845715; c=relaxed/simple;
	bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHYu/29vpHIoUl83d8QlSOoQ/p+I/FwLHA/iEviW8Yx8c5LyT/5or+4uKe42duoVrdrzP3r7iTWiNRoSiEDYZJ+B1eg/2xRh3RgLzlJkJtP0RTmg7RWwRgKCYAM8PD5g8D0odUydF9w8dJOwUM6SWgDUyEGwBWiU094ROnU9uyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0VSyB28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8SSHsXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3njA3219661
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=; b=U0VSyB28K1gDS3aE
	ph6pliUxQYD+nNQdolMJYknIXMj6N1LOkU6q3tRT7SFZmQ870IxHc4kbCEeEin/m
	3s4VFLRrejvKUtEsfDLlh34SCVaBbOYcLCDN86PVo4INLoctumkjJyp1pUlt5qeb
	6K4gkph0FNiY/SzwJbsMtrq0Lek866RumNZGfuw3Ns/bCsFPOoJDiY0bjpg6p13E
	+v0FNOGF0qKupLZNol/RCO3qFLcvDEdhJ3aAbJ+y2E3vFXE/SCKZgEsgxrH3ojfO
	d29OF9pgzQCFQiSnzTLiSuMympk3DZtDz/4SX/bD4NB+kkZ/NkRLhizdEl0QPKZr
	dFLxDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s3303-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc70cfbdso219432341cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845706; x=1779450506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=b8SSHsXe03XKIqHO2exbd/cTJEdzSIh0u0quoYeo/eJArKrUjTw3erJp/3aN6uYrqN
         Kb0SnHv3VgsaJ037vN010k6wSyciFkmIPThauANrg7Y1PbIll6bC5UCJTRa1cMFFG3Sn
         nAOxhKRe8/S6sU578f6/ek7h00vJNrgpmiTuQOlImbatXjZBlmkwPTQ9rNt5xf4/HMiR
         tZxbVCuRFg1Ghzpmqrr6KeQVpQccYI7Qm/WF0Sp1VFCXdRjAfgO4k8tmhpOdgRSGB9Tj
         9/2KAiSTS84ZGhqonX0yq9V4yQAQgkmlOs+66IQ+Y0ChyyTFa8EksEat5FLwZWMtBcAq
         RZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845706; x=1779450506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=cLrIHMA/tY+9A/+1b74yEGsKH++G89veav6f39j0LTAZ0RFD6/98KXGEC+nBBSqrET
         jyCleu04nhmgLwF7oPt9xXgzG3sYqXv+kmGr4JTIXbFirOQ/GkSgmI3cew08/ENoQo3b
         FYSGXGPf3YKUZ0/gx+riu0VThJHWJ2xtOPmwp7q4noAkZU16jVxd1ePSmYWNowy9j5CS
         YPfQlztQJQQmLB9j5/wRPj5l+as2V8Q2jpaUO+ByYQdP63ZU3uRIN6HCAenyJZ2R0csb
         LSauChycq/jnaKq6J+P/xaHa8gsIzTsFR/qn1hBzV/eDXztW/5XfX3F/ia4hAt9uQnLN
         feEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BLlA5+Vw6pOb9HQqMTWgSCuMUWKYdVeQMsEqHkoFxG8/s3dEN6zxa49ly0y3jlZcwfNig5dGYAVXGYLus@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9W4wb3gwFZ3LhBwO5CJKAKwmIQBdMX6nSbyx/H2YwjxXuMNjd
	untADTjO2kRT66oqe9aEuC2WLIdSF9t01KMK+1N1W6ngN5zpiwg1FpkVzbr4AZMMzrItxPXKlIg
	lly9dUGOBkZPTpL3dHUb1AM74SOfbBVlsy9k9D4ZjoHqyaf9Gw1hIkTLLKUj6gGq11mUS
X-Gm-Gg: Acq92OFQEZ+nKvQeJlkyOzIKz6Z/s2chY77bAtw8PBSHnfQeEhQe0YaRKnFEYsVMA4a
	am39BKw744JId+yOaEAom/MYPRwD7lIb0sXpzxEa3j7FhmHLZN8ZQvzOEFwfuyzqNN/ygr8QBdo
	Yp0xv7DqLBmF+bEclGNFFuuBklJQOk7+MbwipCeHrVEjCAQnZ3XMUjowSSdmOU4if6cLnA3oOf/
	DiJ3DcQyoNjkdObZxVv9jRWcsrpbOIfKG+IGexE/DQeKRLq1Wx5f9favbxjTh9DhFULqsFMsKoF
	xxRoF//eqyRXrDRzw6bh/OoHITOyrNiwMG/LM73nLG1EdC5ubvHTWiSclSNNB2fSRWNhTAAFSCi
	ZkjLS7ykfsHkJwy4OrV/2jFTUSGJ4PpYjRdqgZdxu4NhO9g1qjq2lA2mg/2rSfnfL1dXoxrLNSa
	PGz63ya7TuKauf1jwR90MYg6V2txh4lzc13/c=
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr50218401cf.16.1778845706164;
        Fri, 15 May 2026 04:48:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr50217721cf.16.1778845705537;
        Fri, 15 May 2026 04:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:09 +0300
Subject: [PATCH v3 10/16] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-10-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1nUSEEicmWRVL0koIcPwHeliPRrGfuCQ5L
 xuDoXKe1suJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1euvB/48aLOJly1Fx/5K7xUNvTikyq6bfMpYFur3cGp0Mg+itl9zVX7a6bvaSXI3uZUm3ZO6oYn
 iWESlLBaBBn/0H1LEaNzDtKMl22QV/cKIBtylgxxdbyY61rLSjy5PxC0QXvLefVyyRApFhvQ2ob
 pmZadP4SHDMGoTt1Jy/mWvBsVwlpC2AiKONwZLkCuifBzb3gGy/nVTtiEO2hWT83iK+HmEdqe3u
 KDnQkRHjrJk8d8BFHgAnDpU4Pyysvyt6AsfIyvD+MVfYYORk5Sg03nToGwvcYkIAz3Pwl+LAYCX
 sI162Eg7aa0lrKnkigD7FNsJ9PP1EHkmonv5GrbAwC9zsJXQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX/W39XwkliYeG
 razQAgZS482L7eEWHqqj//5pvR2m0tCyvKrtIWKbvxl3WGreY5cEAVdOKGZAVTrJLqm9qKZfGG9
 cOjZPvt0W94LvR0hF+hyTKT3FY3qvGiJqkDfv+mxHDdCD52wOgaXABQ4dzRMGkAroV6mI9jKO+7
 HkN/6ZuVB+Qs6f4/hk4la4kDpBh6CJV1ry1gcUNK/FDKLqYu2pP5dInimkudnAg1+R5YY1Klyqq
 GXMSfRzb//suTLvMf3JfqVgR6RF2ryo6yKK391OUFSOPahWCnInSRBDX4Lj3wm3jaeKeR++hcTF
 9SvVqaQfXU/Z5XRsuNxVPVOEb7ggcdl5LovIVOMbI8rEjX5/P+RzCOtM1g+kx2xIM5JUntyRFz/
 1MpktEoJdXjC1uQJtCiywoWhOd5sbQeY1ju8nCaGiZWot9P2Zo/13vPP+nzYDRSqH/Ka0ecKIjh
 s+FW88HXluKO4YZcGig==
X-Proofpoint-GUID: 8AbaVQKz4L6df8cCMt8Prsus8JnFjXs4
X-Proofpoint-ORIG-GUID: 8AbaVQKz4L6df8cCMt8Prsus8JnFjXs4
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a07080b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4y4YWC2vBVg0P_IM3hEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 1B19F54F349
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwie it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 83373862655f..4e17fa3c602f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1063,10 +1063,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9..1b770e830c58 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -186,6 +188,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -525,6 +533,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


