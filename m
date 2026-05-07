Return-Path: <linux-arm-msm+bounces-106265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MyiLWY1/GldMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:47:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1636F4E3A9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB5D2301E6E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA66347FEE;
	Thu,  7 May 2026 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQ+q2gMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/4aTs6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41946342CB3
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136150; cv=none; b=LqndZOfqj+d41ImLfjIdskhDYhuhg9QTIhnjbpdmzVxQhOLpmq/nZHEIJb7XTUXOA2lLpZAQBiksdq/pg/IYxpUqWlHWrNDBKh3C497a2SUBdfYV5pWYdZFzsdgUHygzWv2/P8Wzu1K0RsWY2L6KCa1ek2+lfY7R5r0n1bRPLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136150; c=relaxed/simple;
	bh=13Wy0PboXXprJEYnsXJ5D987/r1HcPUtw7hAtJCEM9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JN3FbQSaptO1jvh1b5SF2xo22ViIcB2aHADDjFqV8NTXoU2oeA9sFaWHPCb2/t5Vq/0W7JhTs4mUHzMqbtweyyBiZOTniVKKpeIbsuMD7DPnDPmhC+tJKDIa8esK7ozuHEpC1PHodTFtTj1kdu+kLOOrBUrj2p2iITCBnJdHn/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQ+q2gMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/4aTs6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647462d8880188
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4KLMY558TYgnElAbsXo7fOzEKP9ncLvusxHoHl7/Q8=; b=VQ+q2gMM9Ux3NzZF
	FzjnxQEgX9DFy9hqYRtGqukxh2aKC5PbUkCznQ/DlhTS2ojxzv4m23KDMGyevJF5
	3FKMVIGH2qIko85CeO/2WA8dOo7TT86ZwIz2VPAeHz3tsZ7Sc6iDWSLxJJ38yvAM
	nzuVJwZog1mG9r4zcoppmvx0LzmCPzH02kV+NlBzRD9hdqkjUZkYp5BLAcv03yhK
	eWhJPd/XNzh8e7QplONUFuHxwryZSK+skptCvJCEt/C1aXfZDfNKNICSgC/EBhJN
	5JyqFph3OH4xlEJsI+WXYOC2EG4euFWXYgAfKz8AsNWovTcGaWP/V0OKXaQ7dHEl
	eXrMPQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0fap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb6d713ddso8131191cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136143; x=1778740943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4KLMY558TYgnElAbsXo7fOzEKP9ncLvusxHoHl7/Q8=;
        b=F/4aTs6H+J1GOeZe8HifdSUI0FwM2Q4XMD2xfwgXjVwSODVYda51r6q9cDV7/fB53v
         an8FBWgjFD0E8FBLxHa3aMMDlyni8K14fcxVy2dubmkWlwMKpOD3tgals7edNuRkJ/ss
         8fnXwb38d9nypkhZbOkD6Ns2I5f7baG37oA+9IfwMr4xdhhsCLtbPYoFMC00+cMcuK92
         aLToHfcjoUJbeWK77JQCHS7lWfDJCmOCLNi5QMz+4dw/XNPm7D2tlqm9tNNhWDSY47vN
         BvA1vverpH7rRRzr44m2vtVRMqxkhC5zqKSBtSCGnzPp7AfCA5KOX9whHkQlxPApN2zN
         slLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136143; x=1778740943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4KLMY558TYgnElAbsXo7fOzEKP9ncLvusxHoHl7/Q8=;
        b=glHAp9KdSoUVykzuJDDBbyU0xNPS/dY/WDrO+T587eIM5NUiw/cvFhkhkMC91+wzAv
         IJ4DwVd1bJoXDONS+Dur+0Azc8owpA4185skDzumc5bG6RdfzgXcwc+E6xyDpGlT+Rba
         1Br1FZS/XdZdTFaUfL6v8snmCFGeT4HUjV3JoEH6mZNBjS9BeyZNTjFom/qFo/d7VcmF
         XQSyN1MuUd9ClgKhJ3Clguiy6Q9v7Fy9x9mRyghnjkRJzcBRsTs6mzmrMxSspp8MfHAB
         PU90v5wRik40RvEmU9NkIo1NdCskooVT2U5oEDK7JMYzX87UUEFL+UT2Svo/0kmKRAZS
         O6NA==
X-Forwarded-Encrypted: i=1; AFNElJ/KFjN7rshcaGbejY8YnVEp7vNJ+ef5kMovXiiw7OyOFvZb1LCJJGneyKRYnGL+wyRENvHsJ0W4xlh+akTu@vger.kernel.org
X-Gm-Message-State: AOJu0YyfhcafZEXCV6Cv9Up8ZhxYVbxu19pB6wwFvKwxEr4qL7fWdjgp
	zlFaCPgIWcj6DDb0uOIioevqtxNW+I+YorqWIIPl63pJHnfGPwngU4Tt4lIAR4yhRJwaWVkHBm3
	jR1RJHkjOzLOsatmOyjinrPoP4DtF/HsY/B98VSiRYUx4GqKUXHKIQaUV53jch5SBW+qd/u3Lf0
	dN
X-Gm-Gg: AeBDiesAnrAO83Y/Mv4n9R8BMe4AdsEB32SPT8iaK63n8urT2NyFNue5qfhP2wb7uI9
	hCVMCw2sb4b8lbGXA9K1HL7pT4W8x8CvAYAWC6N9ttqLIvw7YBEcMh4JlTIBlqgXYkSpHlZFqUX
	jxDmxb1DjUgDHq8J3lE5gQ09QpUjnNZOMUNy1kZUz7jzMOiJ+icHiMZTdSYdVxG72JtmD1Gg4bv
	66RKKTIRjtG0aCzROwKKUvpMRqMMoZ8foEVxXsSrhfxrl9qfpdK9t2kydaeM1NN+Yr39GEJd937
	mk9jvUuzD0gVhysamBxLOY9tB5/u2MFPjh8eF+g/pHYwn6/r6qa1s8RCcUleC753MiyweKp0+tW
	bJXTaLJTVDtjXu7KeqkVWQ1388pLWfLbfcpEMhe7ddJCza+Pp26T6zYRwa2rhJTWXdFPTIXWFq6
	UsFajPOmA4gecwm/sBjGROpL4lD4aKHwywHqLf+1m59oPuKcHyMB6wTUFC
X-Received: by 2002:a05:622a:6096:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-51461be0cbcmr92210811cf.10.1778136142810;
        Wed, 06 May 2026 23:42:22 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-51461be0cbcmr92210491cf.10.1778136142359;
        Wed, 06 May 2026 23:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:05 +0300
Subject: [PATCH 05/16] media: iris: add vpu op hook to disable ARP buffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2941;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QxCGqIHVv5yEowFiMuTZ6xAme5VboAgh/OSRfsnG4Hg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9tmmnqlSEp5UE7gFt9FU8H71wEiO1dbXTQ
 jkjAVGFcDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1XpdCACC6mrJEqsscLzoZgPLf06Jbpjt8r9O37DC1OL9K7Ln2w7QO88M8yQDFx1g3wxmnrmKJeI
 7eVKRRCDu9BuKyT9i//lp6BHPXFIGW/lfD37Y4/gizmVbQhCvanQNiABnyagYfty+CoPMRjyv5l
 ApfcPXQbPc7wLhsfO2w3T95HuHN5WAnQ+XhIaHcER7HAbTC1+V/h6STBiGgMFqmS78CebxFhc7I
 9Tn1+ZFxTD77rN6ydttqWhkZXQjq8rpH9TVOcwXw9yRCNEMePek5FYddOswaFewBRRoN082fa2Z
 6XfQ7MEHbQjxCiU59dyljf8P/I2eN4Id7SFvJeH3bRLqf2i6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc3450 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=S07ZqrrhDxmTjaDOwnEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NhQTqZqA7q0qPHJJO394KR_Kvac8JIVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfXw394z6odRe8y
 9yD+VKySCEV1Das1DhTkpemEJmf9cHoh16ftKzWnwxqThKVTkJEcLW/fCaEdc7qA3bhpNRKZNMo
 dl/ma0xnA4J8+VeEkcQnMmV8r3R1CyPTEMF3ydJenH7BjNEE0EMyZ3BSIXG2FRMlV5bJCAfqW9N
 LPFYEv1JngHYeUM9wBEKGK42h26ak2SOFNGm5B5EdSXBwoCRcqrpTJ1X9Dbie/EFzsDwqcO1cNk
 5vmrzWUkJAjgHyAgIdjLc2Mufs1fUOwXGkoWUZHa2yIpnYH7s9sJXruCdhL/xtZSRVXHs7KtVRQ
 bCAEIDu/J3isfOI+hKenaxPZLbASAVjSSMHptz3wR5VEJsF0agpWGAa2q/YrceGsfcLBSL9nXM9
 lO6gZ/Uj9k6PdTB92B4rQWXw9YXrwqNJ1UVwDOlySa/18+AxBNkCp7APKu98+A5nxdqCIXDE3iV
 1v1QxB1s76L62ucH0rg==
X-Proofpoint-GUID: NhQTqZqA7q0qPHJJO394KR_Kvac8JIVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063
X-Rspamd-Queue-Id: 1636F4E3A9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106265-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


