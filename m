Return-Path: <linux-arm-msm+bounces-107913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOKwKPUZB2rnrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:04:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C4550250
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A64313666D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4424F38F254;
	Fri, 15 May 2026 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjKVFZCa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ikfs2QKy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704E47DD4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848970; cv=none; b=jzIf16DhhBBaBrQEjBrM892DFRmzqxdPs0fXL4f4j8/heGHN6ya++x/4Vq5U0acygG/SHBYtXYfQY/NGdBbGH+4Bcl+lcCUYH1qLSzrNnPWIImvrck8/4uLLGhx2z6THPhhYlrfYvBF/yAgwPc5KX4wwvuPZ7c40zmXJf7HoKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848970; c=relaxed/simple;
	bh=gL4ujTMci+xTNRSy5BscBw+c/sx2NSrZmNjtFRPlSoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bd/8puwQ78+WDf51yVsBWCGLKgp/trGTyKVNlLjLQexPYzaW3NMLyJ7R7MEH04RFVWqnuYf7FGLjcJuoGIh8TCgVJEcGVYOC8dKb81iJMkvHrxMLMG/aRlnTZcApDhH52DoyU1pMyLq6plYuvAvND7hm2/BqFVCnb1B8906jiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZjKVFZCa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ikfs2QKy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBHMdd3219669
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qJmRCeRB5pJ
	apgPzBhK677pMIluwek72W5Okvem7r3w=; b=ZjKVFZCaEbYxcZM25k+mYVMckN2
	Bth/8ulD3NxjowSMtDrBI2dYj9pgDoQd/qNPgzdwyhJcSfjXw6NhzPb+Ql8qELvi
	z/wKp855zMDcS8k8gzWlvEdStZkRfngISv6fwj3WGwFOJtyEG2rx3Br+XWFu+3To
	uoT0O83+7H4aXsL5O6Zi30MY++hgCS1uwjZx09Lxi0NXvM0eCF+POAvkLeP/ZKJ9
	Wn/Tj+F6jHaigH4Sue5aXkwJLynKsgsRpZcdK6PJmLYFX9SmBXwhV/MmQ2ULPKrF
	XuBK3FBVOxs4AkYxF26bwOTv6e3xbTflTsRJYmpz1YG2QwEp7MxyuvEs50w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s38fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so70244125ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848967; x=1779453767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJmRCeRB5pJapgPzBhK677pMIluwek72W5Okvem7r3w=;
        b=Ikfs2QKy/sFuUHY8AqoB9PrFgfsr4QLSakKE3UdPE1V/xhYqr7bN9CGHIkNa8uO8y9
         DCZ87SY2OYfF3nvI+qzBzEoKTvis3oULsZ6dV57G5pefFT4/nasDHietZZib/0KJjs5P
         lxYdGeiDvYHP31vPU6cy78y21551XOTZbfOslmyek4TJqunT3XUYhEExc5DGHW2Bu12b
         U+6Ez2bmo6DEeQXxlceQDBQD811We9GQDUXmDhyGODx32qJ/PFjI0AuVClTFbckmZqLx
         1uzFEW048cyI77Z1R+dvB6Hr2b1kBCYaKmFBYcazZLk4sVK+x0Ni9iAYAm1Ga+0nGip3
         UQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848967; x=1779453767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJmRCeRB5pJapgPzBhK677pMIluwek72W5Okvem7r3w=;
        b=OOt6kHj886qWgGvNe3Vj/iTSry9mfu6/E3SZe/8P+jmqYX1gLatI2eCUdRXxTIwdq3
         0XPcX0w81kJsUG57PZr3G9lA2/SWDMxdngDM/Jl/4XJpfnejlap6W/G+9LtxmB1BsEXW
         U8FRjaBYrDQUDRbO4WfRqj/jn/kSa5GooCbbxqe0tZPC1UgBt9dqbDrb3YD5+0hVzyJ+
         svw9GTAGj+ZAaA8omc3q0mjopYZ3dp9MjFsZ6yKqsq/jOvo7MzOHVEaD0xITUfOcoygQ
         u8+oks5UZROzhgXU87/EjundQfDxfjBHC5s/M8YVyrqhPBn96EHhcwLobVGXGQZMUTOk
         KyiA==
X-Forwarded-Encrypted: i=1; AFNElJ8IUa81Pks0Z+aOhFGnhUkiDiC5CZ0FkcJEX9Lvxq3yVCUhe4MPHzSW6z39dz3fXQzmxNAl4SdfQGQF4lEe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4v1wPwNFX9iKSft5b1pGbeNyWW3ycDjANtrDt6wCZE11z1MAF
	CEXVeZNDf9WIxsqrN73tN0C+R8GMaGBylq71Bmj5XwyypRUKwZoPW926KdO9oCgI3dcEvOanrNd
	k+9l1NOEeKREcr5AAXGQ+Dynj1aGvpdHw2eEEE4Rfs0YOivuvdm8Ud+Im2rNvq+OaURup
X-Gm-Gg: Acq92OFfGve1PIU+A1Dthimn3Nbat+hVUItzWR0SQ9AXHk3iI/OyTKVKOcVXmBlXa2A
	aNWRfx7Cq/MOpuUHtVI4PfvNXo2GBwN/WfoRlHJONnwTYF4JHE4KUnLBMV/9DLnJgz1ELd/TEic
	db0EZh90WjdgofWj/W4easI0zOLGPV4oyGWPBwP7wnxKuON+QyqKdXsjtqAnT19AnKNjOGVVJv+
	o4IsJtsHYKrRCWUHXbVI8rFY9hKgSnybSlZ68d9aro5IqMyDb9kV0sc10UqB+aGu+p6O+FEcH74
	tyTWlKHVCtacz7c7YDexsMiVYS+3Qg7wmHhJ9fG3czF1oFd5pOffFKtiV+sD8BSS5rMwP+SunDh
	1Xm38IwEMQwT98ysFJUQtxEFk5iQ4d3o82nUo2hlbVVrbgU9i70tXY5YRHzY8Jvc4GG+JEn40vj
	iK9X5hciT4xdlITJ5FY1M=
X-Received: by 2002:a17:903:11d2:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2bd7e8c0530mr41111185ad.19.1778848966802;
        Fri, 15 May 2026 05:42:46 -0700 (PDT)
X-Received: by 2002:a17:903:11d2:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2bd7e8c0530mr41110815ad.19.1778848966259;
        Fri, 15 May 2026 05:42:46 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm56119395ad.25.2026.05.15.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:42:45 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v5 3/5] misc: fastrpc: Fail Audio PD init when reserved memory is missing
Date: Fri, 15 May 2026 20:42:15 +0800
Message-Id: <20260515124217.20723-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOSBTYWx0ZWRfX6uWDgadQNe0j
 CXUrJVOz8vgLa4mZtf7XAXGI/A3ZMqYMIJNrZYX9RLveZ5wse4Dy0/B/v3hrJhXUvlTOwMNnb0r
 xhh2ni4lnnmvo/XNQkMTRjK0H+ZBMKrLmP4/30vmDB0q8v0piHzAYvhyIU2QLUPWu1ewvBGDml4
 CUEcoPv8Naz+MvWZzlF+vBbkK6AKFBwjiN2sMFBDCl9x+6q7EAGI98Quoqci/WfAyq1waBuQCXs
 jXAAVR5uZB9/nErxxmCgwo0igirfFx2HTTEueQazaqVeh3YGUG6rlHWNzrrvpKSHTzfgsurjYC/
 iEP9Hf370rPOJa+gH4MlqwBIGzd4doMj83YK/7y6OjXuxypWjH5OduSXDYJ/b7U3ysBcxYxMwp1
 WZ6wh9ICDBcKfiq2H2rucUrRqU1rpJ2fXs1z9R7CSq7f7CObb3JDcuHrqVaxWPXkfQ0+Cyws0Cn
 0h7hAlp82221b/dCjXQ==
X-Proofpoint-GUID: _dvtwygbEM4-hJAm3FoqEMRxHYMa88IW
X-Proofpoint-ORIG-GUID: _dvtwygbEM4-hJAm3FoqEMRxHYMa88IW
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a0714c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ESjX33bb3rDV4MXBDX0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150129
X-Rspamd-Queue-Id: 410C4550250
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Audio PD static process creation assumes that a reserved-memory
region is defined in DT and exposed via cctx->remote_heap.

If reserved-memory is missing or incomplete, the driver may pass
invalid address/size information to the DSP, leading to undefined
behavior or crashes.

Add explicit validation for remote_heap presence and size before
sending the memory to DSP, and fail early if the configuration is
invalid.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 3c7c3b410d7d..a0337cce77f3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1363,6 +1363,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
+	if (!fl->cctx->remote_heap ||
+	    !fl->cctx->remote_heap->dma_addr ||
+	    !fl->cctx->remote_heap->size) {
+		err = -ENOMEM;
+		goto err;
+	}
 	pages[0].addr = fl->cctx->remote_heap->dma_addr;
 	pages[0].size = fl->cctx->remote_heap->size;
 
-- 
2.43.0


