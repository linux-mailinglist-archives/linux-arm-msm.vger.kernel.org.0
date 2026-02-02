Return-Path: <linux-arm-msm+bounces-91494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFThEp+LgGnO9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:33:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D17BCBB27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B029B3004D93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3E33624D3;
	Mon,  2 Feb 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZ3n2q6X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Knu3mn87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09D53624BC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770031976; cv=none; b=qD9HMp8IoAGAPbztjzyF42jC4nGajw6/JUHn/+ld+Wheb5SQ/rgMnnku0ltovLxhag++wWccXjHoT4w1bcWBz1Cav+PAmyv/sT/7W/b8U6I3lXXTBHAXWkKBKKp9ZQG61sRvfei4bRQzKUu1Za1/Wt10ouBvj6zsjn7E7bSZNUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770031976; c=relaxed/simple;
	bh=rfi6eQE6px21LkC2PRoxlojpFu4lMD82BLpffANahsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lH/z/YWaSVb/qjbKocU2l7Pcva1B3FEvjNiBhCAiDP34OPsi/bclG/XrcLbwW2qA4gKxl1ydncD1Que+opjj9YUbO6UsaIJ5mDJGE6TDxu+LjY4TOom0aEaK0IwvqPo58YJLf548R6agijQQNc4/I+6fZyfWmJWPayRf+WQka/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZ3n2q6X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Knu3mn87; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B0OvB2899938
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 11:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sWfr/UnliBsthHuEoVeZeoGLOLDSeF7PTji
	S5B7qFDs=; b=VZ3n2q6XT+me6rj1rpKfU/d2NupPusOjHddPhAtcU7EFXUdt/lO
	36aG89mnrioPGHwpnUsgDTwJmFIyblCjufww/uDyUh68ZhksVCWB5bdSYRiNPREu
	X1H7LvZYM6Fe+GzhgSVdF2uidrLXyAi5zfjQ4lts2TWCL2z6/6DWpIOmnnwvpa0/
	/kvpqXA+Hij6vk4nzjgl3XGkrM4wgz3AJ6AZUL3k6g2AuS8mVvcsNx/Gn9PiwITS
	IdduEIBfh+rJWsYusBfRX7NoyjVpnrVpgw14qmmGYwJDX8sSY6XJCNl3/hkhWNTt
	lQEPIXw50iWKauQW4l0uTu0DWzTgWSl1PpA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0r2km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:32:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso11796024a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 03:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770031973; x=1770636773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWfr/UnliBsthHuEoVeZeoGLOLDSeF7PTjiS5B7qFDs=;
        b=Knu3mn87qNszyrZoLNX9kGxjRvQ+hw+tkwkzKd1Bdg5hIve9pCA3Rmh9paAZoW2RjL
         KAuD94vMUJCb+1wbkAbp3LX9jV7d+pY+ozodbo5PN/I7RHpQgXoKo45sRlZE9PTdMilL
         jofjsuOBYNDl4QRPvzLf79/5I+X02APCP8+d1o/BcH00QBnP/oelTMMX1dZrWHEQV5MP
         2LuLBF84F6cC4/jThpoiYkSIYuDOgF2Bw8OjFUHuYmmZeDSHWWuZagUO4eNPRY7suWK+
         Opu5gy1Ab3WSOIn/vjiIUGgOtyUUfe9nWOJBljf0GJiDKt66S6i/vmr7v6+pgfRxnVZx
         txdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031973; x=1770636773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWfr/UnliBsthHuEoVeZeoGLOLDSeF7PTjiS5B7qFDs=;
        b=uDV+JPpisI0idfII4VCWgdv2xDEeIFA958DbqKmy2Q/NwRZjYqgNDCsDaf3KZqpfTy
         vH16PXb3zgr1UzB1BbSxOeRhFqGkB06PCKUPUz0cRHcBNImjfVjOCYUFiQGBTxRyb/58
         cpfw6VtO+t7rfjHHmZF+XBJOIgj6qfdNTW5zWQEjrrSx4EwXZ80uVKZhqWqh38V+nDF1
         YEmo78AKEdlo7UySKNRuLljTSh7hltJnlb1yYLig7YSBipCuIc2Q7miuoE8FKChsziYz
         MQphRha5SnDTD5nqJSdiSG8On6eCUAqbbRoK5X+VoBqueiLdZJNZJv54SW9Xjd+Mxztd
         X/Wg==
X-Gm-Message-State: AOJu0YxyCfuCJ0pQYMnUCCfcd4aNVT+v7NumanxTtsD/5DXT8yakEkQB
	NQDcPBiPATJ9GRWU7u2EfY+rnzrIOr0pUsCIBqOqVJyzl3l5MynkUsEh4rx05FfihNtrZuXIwiT
	Uodba1R9YLM/mGk66gUMns77x8NMJNCHge34iXt2xcb09y5jVhBPIsvGLnTVzOYrLraVO
X-Gm-Gg: AZuq6aIYfWg/ySRkVxZoHTVyWCt7OEw9XVWyZMbf9UwZNkYFSGfEo2+gmCtASOXdpFp
	LxgALW03I39gj84QtrXFeODcjDrepGT3Px8a1a+IfUtQJ3IhPJsKpDGZLDSuTywtjtNAmcoftXN
	/xQ9HoM6nqUeNKAqsiNNkJMbUStW7VvCn3dnLtjg7fVH4n70ucXeg2JssbAYEs3WIQgMZujwPwp
	Uihw++Gi9iexOFaxH9UGpAZ94iWYi7m1yHmOGxthLLJXIz5YLLRy6EkJgx+L3UJIS0zHC0Q2nx5
	FI3jdYaILbzjHSg2rz84a1T2rkN44BBR2r4Q7YP19mdqQR4quB3Hp1W4iWHdHk4FWmKcbCMDNL6
	WrSTwP2O/3cyvWKIX0NirXzPIN8ac0J0KFNfr
X-Received: by 2002:a17:90b:4fca:b0:34a:4cc0:9e38 with SMTP id 98e67ed59e1d1-3543b316875mr10805432a91.10.1770031972667;
        Mon, 02 Feb 2026 03:32:52 -0800 (PST)
X-Received: by 2002:a17:90b:4fca:b0:34a:4cc0:9e38 with SMTP id 98e67ed59e1d1-3543b316875mr10805401a91.10.1770031972057;
        Mon, 02 Feb 2026 03:32:52 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm18340861a91.6.2026.02.02.03.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:51 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: qcom_scm: Fix coccinelle warning
Date: Mon,  2 Feb 2026 17:02:41 +0530
Message-ID: <20260202113241.3058845-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ss6qBNA1PhqNtHvOm-v_8l_lE68_I1jF
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69808b65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ALqghNSMGTUMVJYEeN4A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5MSBTYWx0ZWRfX0zjrbpvewbMb
 Jg0fIsZfvdm71OsDbJb/CZVXkUr2fvNHTJUhU9FKlxILDkRKamIHPBPoxez9MQmry/2Tj3bTdwR
 owqu8NjCPtB4L30X76XdrdBoihU9XL2OQMETJVX13j3+UTYhu2U8y2GOsmzkbdR0npoV6SzNxm5
 i+T3yCStQZG0dwh1y3JphSYohQBo+7ndEloND5BvMcd9EyZtByzvxO3ZMsTjuIMCvIsJAnccGgc
 9wviYtyWrCfx8xc2AqWsmPvUj9jg0nQKLoP41raHhLbSON1FfTS3I3/orVy1UtnqHrevuUzbndw
 lvpMkLAgPm8ZCsd0Z/SssppxKwbwdcGPWBoldyif5PFSeew8pp43KngWz1KWNNuRprVtZs+15gM
 EH8bo4tsyI2nJJOy4F/vuuYg1ZBSq6pmfnC6v3gAZKKLUJjS2bYfB1PrTLG4qMJO0kx1wGs1z15
 mK2ksv4d37PtIJEKgHg==
X-Proofpoint-GUID: ss6qBNA1PhqNtHvOm-v_8l_lE68_I1jF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91494-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D17BCBB27
X-Rspamd-Action: no action

Fix coccinelle warning of allocation and memory copying to allocated
memory by replacing with kmemdup.

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601142144.HvSlBSI9-lkp@intel.com/
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Exact patch where this warning introduced is in Linux-next but not yet
hit stable.

 drivers/firmware/qcom/qcom_scm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..d439a9f5b62b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -923,14 +923,13 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 		goto free_input_rt;
 	}
 
-	tbl_ptr = kzalloc(size, GFP_KERNEL);
+	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
 		qcom_tzmem_free(output_rt_tzm);
 		ret = -ENOMEM;
 		goto free_input_rt;
 	}
 
-	memcpy(tbl_ptr, output_rt_tzm, size);
 	*output_rt_size = size;
 	qcom_tzmem_free(output_rt_tzm);
 
-- 
2.50.1


