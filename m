Return-Path: <linux-arm-msm+bounces-103805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCWXEKFh5mmavgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:25:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2CE4312D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 786C0367581C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE63833C18B;
	Mon, 20 Apr 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fdc3dIm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZD/rl8xB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E8336EDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699844; cv=none; b=FaclyV8NsN77cSVgn70tsOd0NRHYlAoxKMumQjvRDHynQ8MmaHi35OW2xJ1T38ThP6C5kjwUrZ35mp0KG25QsPHyWZqTU7q0KABtjMz15TmS1lFMZeqEQyR6Z6dW4DS5Zl88vYed+rhyg7IEEO0npEjvW/Btz57Q5r2UPZXRnc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699844; c=relaxed/simple;
	bh=hceIvuPGmyPJbNLLQzC4kG8qVJs4lI1EpoadEbPZt9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxAsXM6xWtYjcgupLJE75VL8SjxMlD7UYggywxqWt3Ggdpn4P+n9DRnont1mCPZrXPA+h+Ce3qGkLHo76ggPtQC4aG2RsTXZZCFbvfzqi851KQSP+eJmknAUbMLFdrkt0zA4c47bK6L7DhDOeKZWogCXa0QRNxXdwpfC2WyMkqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fdc3dIm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZD/rl8xB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFWQUs2281713
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUFr47Nbs2cw3/rwDSVbJGR/+YBpzMv9q1tJ7gau3U4=; b=Fdc3dIm5QBlMBgnN
	Q0AZyRJJUhi/CbJokyXM5+Iu26gTm445lKWOkMI73o+WNdFGqEp+uOCzdTTquFr6
	gunKsD8XHxs988RQODXq1Q8qeJCF5x97ZlWxMFZXMe+XIz/UGOOs1ToyNGlxf9fs
	FibyyoOMOb80ySmcjnXVS2ZILo4K1D7FvxPSMRuSfBLpdb2+ulhqiUZ7CPufdui1
	vGhSxY8Lsr73NqkC7nV+7fbxNplK3iwfdiUSzIJSnNRo+6mxOPX1wM+JrWTLmvoy
	jLGSffsHXM/Ha5T+dBYe/bAh6QSDjhAu1X44QoptwffGFCzeuj0wtiBr8zSpLZsW
	lvKEew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599fft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:44:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c709551ec08so3334070a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699841; x=1777304641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUFr47Nbs2cw3/rwDSVbJGR/+YBpzMv9q1tJ7gau3U4=;
        b=ZD/rl8xBO/gSQwG8+xzxiFc/Sh7ENIQVwEs6Xf2igCUwoKRaeG4KSC8Y49k6IWdov0
         Vra84EXJHKiqdE1SXWf31vrXyFsyoDAf9AUvrB+MtR7nBc2GKOicKpCeatnylq6oc1YG
         q408ssCBfaI+Hu1+VCCrw+9/+uYUhOVHTLd8kbVlFTqyIuZzUjCMZ51j5X1foPdxKU4T
         m18RNlSEUqh8WYTyJ5Km9jn3NbPlTZ1s6MY+KbMJfMJIgOz1vtTpPeq24f9TkP9CW6qj
         MtIRBqVM5TWi1zKmgJpFpZJRGl98MxRP8spFHuTTprnLl0rH6wMM1P/Ey0za/4tMO9+g
         3jGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699841; x=1777304641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUFr47Nbs2cw3/rwDSVbJGR/+YBpzMv9q1tJ7gau3U4=;
        b=UVebw/ezveOOU+B3RDOuTeeG4i7g0zXj9eODMePRabiUUTNN88RG5MDSB11XdPfVKP
         IR2dNcJAWZdmfZ5khUIRnb5XHuo1M0m7gGK48hwUGjivQdm/Vl+IKT8EiThXwltqRTuO
         gQ6cUHC/MMZFo0uChNdOlulh7OOgQmSpB5/2nfNSSd4MdRwGqFFTmNeW23T5xvMuj5HD
         xkfcz1c65+RADV8zboNFoX8Wy3oQ13K1MfWj/vjghf3w6z4CvGOt9TNDo19N/NqU9T6y
         K9oKaymiacY26Zl/RFaPJTBt4DTy5E9r12gTWpDc1QgbtE7M31hBuZtvZ6DNlCCIvE9A
         1kQA==
X-Gm-Message-State: AOJu0YwZg2WkKVj+1kjfs7A/sCOpZHdat6dp6XguGMINd7icS0BAaooh
	UvZr1ppI0ciMKSmpUStg0KnQdzWx/zVUAk4GZKUhrDngxMzY70KJSTY7lNuwETL2vvXBnz81B/o
	8BoqJWgtlYTrMcCPXYk3DTj1V86zrXtvbxJoOnO9fN8Wrks7gv6t9iEntCiyf83iA3y67
X-Gm-Gg: AeBDievyQl7AABsrMt6FcZICQSgrO/5nMXF4slMra49uqYs34OavYGGPO7dgHptmCQt
	vZVNqFrCeAwBQ2vSTJm1zcMu+KULgA11xsbKgftOaDj6U7kSCFQf/hYQYbGFCuRddgh5G3EPnFl
	Wk6CzO6Rm8bqTaQTWSr6f/2g4ibwxeKemDSeRmS4xJsP+vTCy8qnmCdZkA2BZSywLaGNi3UzsZ/
	ECC4Dpq+zk5g0o0Iem9CKUtQC+8BklpzLiYE+ARH+cBTLUl4BMl6kVT4CEi6+ROoln4kEiXhbsI
	mR5mEM+rRRppEZ1wXdEkIrB4aN+epwxsa5pD9OMmzYXIVApUuCJf5pBR8COSgpt5Ss/OWEgLmFH
	owniPPheeYnjb4TSF1N5CHXQyQc5Tlumd16imYW12qO5ne0whWFlBkaoXa/v3QQ==
X-Received: by 2002:a05:6a20:b39f:b0:39c:4af6:4303 with SMTP id adf61e73a8af0-3a08d749274mr11616309637.20.1776699840726;
        Mon, 20 Apr 2026 08:44:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:b39f:b0:39c:4af6:4303 with SMTP id adf61e73a8af0-3a08d749274mr11616285637.20.1776699840222;
        Mon, 20 Apr 2026 08:44:00 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm10533230b3a.13.2026.04.20.08.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:43:59 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:13:41 +0530
Subject: [PATCH v4 4/4] regulator: qcom-rpmh: Fix coding style issues
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-read-rpmh-v3-v4-4-70c152e6c958@oss.qualcomm.com>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
In-Reply-To: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776699822; l=1066;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=hceIvuPGmyPJbNLLQzC4kG8qVJs4lI1EpoadEbPZt9A=;
 b=Q5/8ak9O1QN4R6sYkw1EqNaSd3+Ysmsajp9vKoSUrqo2KfAd8GIFaFqKz5O8MzZ98BVl7Npog
 3OHAa3QKDZsAaufIrmwB5eAvEZC4AjBn2aRTgpozqS43cH3bBgLZrYX
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: mN0Oogq9FnzF-IhtZiOYzJMA6lqDfH87
X-Proofpoint-GUID: mN0Oogq9FnzF-IhtZiOYzJMA6lqDfH87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MiBTYWx0ZWRfXwA1KCQFGAowX
 /kVK6RmyMowjB/11Lfi3VMW197mlPHG80SSkD1GO32fCZiHc19jgyjD1mtYo6uTStcBd0HinbMM
 7hrbA6VCKRWtmYazxU6hTYRLvbSGs7e3EnKv+6py3ksr8VLqXZ2vdSwnaAnnoeeqDUF048LgYFo
 3ltPWmrmXZCbqN16gl+7rt+WaqaPGciJo8oJuar6UzRBKRBjRnMKm1OipZMXa1q5cmIBlGSdxyN
 2evA6rvAOPaMBcOARitnCgn4R5ekezsy4nn486P6OT8s/kaoRdRIeCfB6Cs8X+aQ6BXjuhN6ROQ
 wAjWgx2PUI/WqbCaeWV++tn9ajp5WZuDzevKgEamtYpW4PVhiWUYIcJhR1U1B2tdL0S/9y6pPQB
 Tdc1O1glcebBWtBE0jkxJpbrskMUYaiftbk2gJfr9TvUC6aisozSCtv44V8HpFkU4lCjc/J2t9M
 XoM/vPRQ08/h6FOBRKQ==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e649c2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=f4Ffjx35umjis5ac5jMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103805-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C2CE4312D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the code style/format issues reported by checkpatch.pl
script.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 1add15d73cac67ad8c0b45aaad6fb2ae9b388180..55e6983ed9b150bf8a4e47da46715d8d5081cf4d 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -110,7 +110,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  *				regulator
  * @ops:			Pointer to regulator ops callback structure
  * @voltage_ranges:		The possible ranges of voltages supported by this
- * 				PMIC regulator type
+ *				PMIC regulator type
  * @n_linear_ranges:		Number of entries in voltage_ranges
  * @n_voltages:			The number of unique voltage set points defined
  *				by voltage_ranges

-- 
2.25.1


