Return-Path: <linux-arm-msm+bounces-101130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAjsAjsdzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:15:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 663F0370713
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8277300E241
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513503A4508;
	Tue, 31 Mar 2026 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0myJVTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1yuBUxf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E023A4532
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984347; cv=none; b=J0j9eJ/yJF8eRcBZ39tOcZ8wwo6vbO1i1tpyXMoJUTt64CKnUjNzIBX1i4TvWaMdgh38vw7ADxwr/1It3Gc6jjp/UGyiH3DJ3S8QjhfKXB6APQxqPBT4B3/rvH5ez1PPlNc13DVryUj6itmfFgZ9pkJaMlAp0eMJq/8eNVvSVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984347; c=relaxed/simple;
	bh=8Mci/N8HrnioiDtPa3az8DywJt6Z/OJbU/G/Orj1cy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOlB7PBx9f4vKdLvRa+dHaD31AExmSfbodmDCIdewnlx53UQUIX/MLgIi1E9ww+pvKCENvcM17U1t4esIIh9MyAspliYT2m1OSUZnj7ktvxM7wfVwOpYdhAv56Y1BPXmWbFTNXimecEw4QuAB4ebpQP51JoWPBqxdYNIAz8ckR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0myJVTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1yuBUxf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VHWxPf3103850
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D3iaAm0TR8npLcJOk9xa+SDLtG4B1S3n9pE
	B5/zzjWE=; b=e0myJVTp9lEn3t9zJ8MFnnMC2UyP+aYnbSXc/zX86si7OjWfnFa
	TuClVO1XWeGBNClhMmMSJP+V2VdiMH9y0SPKiw5TaN3TaMRJGWrRPZ17JxXVelMr
	WRXOYinFspr0g9vjTswYu4DDpcw5VDtTRO7k1I6O6i2hp0yONUZxQlTYnNY42kLn
	cIFYqDPkbFxEfEJdWveTNE0jqACHb0GGz8Mvl5ntGt/7VJzUqACzl7SE0Xr04mrd
	7Mm0G7xgOt9V+OYz+N+7AUvEJDcnqWrLbuhZA41Jl1suuczJ9CFYNOpcRZbLGFZI
	p4vz8whiLOixyitvGkabVqG5XDAL+Q3CNCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js20ewn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so101762045ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984345; x=1775589145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3iaAm0TR8npLcJOk9xa+SDLtG4B1S3n9pEB5/zzjWE=;
        b=A1yuBUxfwHvSnrRNA2P+xSA5l345i1GBvRTNAtvmRv2+byAM1gJvChjVbHicLEz6dE
         X9mjgxHxsMei8RvXOvE/xij6NUnW02AWZWABOBoqft6IwswQedfFigLUEJPGB8Kih20d
         HJkVFP+1rCq0IcgMEydHfN1ftVZKa8plcKLfWiBIVXUazyEcXNsaUXmbiMnyuPdsCdyS
         Ap+P5GN5ddBICdifr3B9fTlGIniBm8pbWMEpDTVNdRzfFpDxfVj34e1Hg+UZnK/od+8r
         50Tlwi1dXORC6H7CeEY/Juq5tMcKDiugmAnjSSAnaY0/npWNQf51guXaSnGC6tn7Ef+W
         LawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984345; x=1775589145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3iaAm0TR8npLcJOk9xa+SDLtG4B1S3n9pEB5/zzjWE=;
        b=c/4tRfmyDaTSr0gbWpGr64L7vtr+mGaK9z2gmVfvqkopnf4Uvv0x7CUOZuumcNNFXn
         xzS2F8nRWbhCzQkFHxDO3Z8hyWufNNrshLhJi5c2RrnM/aDxxSlakJr5BNMH2UVzu+4o
         2XpeSBra9vSbBMew7qnkjZZwTjA88XecwAwcvPWyPMUOAC7gd3zshIvChmtkBl5G1+oN
         XT0et9PAYstKY1XW+TGOnks6uCkUEAsw9cAwBsHSHmt8VHE/eB7vHLqZFX5rxM3ubC4Y
         b+RQuoIHRWb1wYrKfRMxY7v3C4VdHaci0HdKSa6XNEQXdPfNH+ELIKCy6cKbUfhzqIrC
         duvw==
X-Gm-Message-State: AOJu0YzP5IlH//Eg4P4F7QiHiGZdBBzDLnlWlvM+3RCf2EEcU/VwFzI0
	tSXlhsTzlqa/cwzqjtORseG8eThbmUxqfM548RJIGhez7YhyEcxj7wjpJQ1y9IHsVlHG3269ukA
	Gk7dr7iYgW8NGS690F/uCZ1yRhkktCDLrt1mPQu7KPTtpbSlcekAWKztA3etbEuZyCbtf
X-Gm-Gg: ATEYQzxiKaqii/uF0W4ohNS//RG+GYDiCg/T71JlAqe4PMdLsi635zurJuH2VPb+u/r
	JJJF5dS1KYWuq7EsIxOkJ7TY8K6VnnCNhXIBlG4hDge9X97+BV5c6JNO8ng2ekIWDNLg2ldfpll
	t2no39fh5eOCbxQfld2/aQ8W0LdH+guPHk5ybNUMJ1QMFR8Mj4YRm5UIPuomqtRAIkLCES/HG4d
	CTShLeEkX4Cpvd0ULG4GIcMbABI/LoJNqxd3GwtRRxJTHwKr3YFr7Wo952ppgsv1wAtLH8p2hyP
	NYFYWtjKwX4bRJ2tU4vG5uadXIq3PxKLUwNj40jsK7QXCYsyIUCBOqio4WP6DV7rmbtZ7djoHLu
	Jmw6bYG+2bS8HyyLmTuuH27flJY+9yy5Yp23e53GaJ5Zvgim5
X-Received: by 2002:a17:902:e948:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b269d7ba31mr3604235ad.43.1774984344698;
        Tue, 31 Mar 2026 12:12:24 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b269d7ba31mr3603855ad.43.1774984344202;
        Tue, 31 Mar 2026 12:12:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm152784535ad.19.2026.03.31.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:12:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/5] remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
Date: Wed,  1 Apr 2026 00:42:07 +0530
Message-ID: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qqmLxPMTQ3dRL-N1J9qQMnIqWNb5hPu6
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cc1c99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YY_etid4knfRxI3WhhMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfX1iNabMUHP8Fd
 8qfz14FYIMOgamYeIepsdrqDJMOUNYhh6W9Xvz84NV04fowq9Il/oUu+FVYOIHy5MOKvqaM79XF
 bdBZnegpPlClkIErOfRtn+okLQHM8QuOwtnD0ImebgBIihdM1kwmOlM3gP/TuPYG3I5hYM4P/7a
 Nbtd7KTQkQLSX+5yzXRBvc1QiBJrJpHxu4wCqXBStYPCtcrE9J95qtoXyWfjruJ7L9aFdHh2Oq8
 GY0dBzGBEk8+qp5krVgacGVxVvqMkXLkgvDq1t15QZsnZzkI5KCxmqNr6ONrCsNHGJLFmJXonsI
 HljCyEdKEcTDVixxbtIhk8GgvRDhurZFajP61qYM/bB5SKN4DGIGV2YGNfjDOOIZbM9giHlS3jA
 2in2PLd9psY2S1TKansI4luHAH0qbpm86fULoaDk6CzmYn+TqZ492jVSBXAadbaiDNQ5vOpzZJ2
 T7oo8H54+tRO+em8bxg==
X-Proofpoint-GUID: qqmLxPMTQ3dRL-N1J9qQMnIqWNb5hPu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310184
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 663F0370713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All other call sites of qcom_scm_pas_metadata_release() for the DTB
context are guarded by a check on pas->dtb_pas_id, but the call inside
qcom_pas_load() was not. Fix this by moving the call to the guarded
block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: lore.kernel.org/lkml/20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com/
 - Added R-b tag and split the changes into 2.

Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
 - No change.

 drivers/remoteproc/qcom_q6v5_pas.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index fb22f699c571..b957bfc86cda 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -243,14 +243,15 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
-		if (ret)
+		if (ret) {
+			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 			goto release_dtb_metadata;
+		}
 	}
 
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
-- 
2.53.0


