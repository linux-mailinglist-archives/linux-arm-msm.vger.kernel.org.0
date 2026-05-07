Return-Path: <linux-arm-msm+bounces-106227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ2uEGDn+2kaHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:14:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72F4E1E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6937B3085BAE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 01:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20EC261B70;
	Thu,  7 May 2026 01:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXy8xgsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyAmSofv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9492BCF45
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116268; cv=none; b=E97KLvxHuIrdS7EOFY0ZpqVfkO4hOPx6YOr7V6DUY01Aa8p7V26Qz/4kUcK0reYES00iHk91YtiOiwqA9gyEWNR+TfNsIUxxuSMFnwUEPumVxpKqGnVIPnhhgm4RUFyZgyj0TfrCViaHshQfEd4ENg076KYC4ZaZ3adpGrSlQO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116268; c=relaxed/simple;
	bh=/9nEVbBbZylkYnurLYSAS/hZukhtGTEGsaxE9DNa3To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XcQgIgFk3bsofQUxuB9NdyzhKLHUO4xgTqKkSflTW0A/lHFtxv0eD0aTzv356E2o2p9ah4iYCFwFNul5VizTuazeEIY2gUMO4cgRI22jVhvxI7ZxJRPl5A7wpFapt7XiwUmh5zbq/gyE5pfF3zRUCrER9sDGTBkxOLnMSimm4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXy8xgsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyAmSofv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GQYcv1953130
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 01:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=; b=EXy8xgsRBbltMzUU
	9/w5mfj709mmiwudJx1TszpPTa986/WfdXQScANdHdhZj8CvRrBrDm5t9YGh0Z+E
	76HNIQvo467oL5ayyhLZ1L4RacGuu5VIn6Z9djmz7H1IudDinwHW3el3D4O3OL8t
	mufFritKotu32BNt2JHdKfDt2RzZdKTBxTgP5ufp9W8DVw1t9sz+lJUP1vb3TaH5
	fn/3UwCyndlvTcn/7intSSjdeFbUV1LVGZdvHxaa/kJUyiOrI7hZPuRNSJ1zP93d
	IN/kFaspDCBZzwhv5Q5kbyO6frRvXetRsVLA/+h62Z1Dl65eXjoS9hmcV1sebb5z
	LlDtuQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc323r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:11:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ba9baef44cso6053486d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 18:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116265; x=1778721065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
        b=dyAmSofvm+Qkoxt7dqUnniUZSYNMKV7PQYLWuFoHyRdAzEfdjvltSgdYDA2ooNn6/e
         L6WAHyFjLAcXmI6AlA25PIaJCyOJJzPL6tgiQzQHZcKSND2YoNd//EvX5X46AtZ3BLDR
         KQZ+xckQ1Bvjk+cDBHLfMLjvrr3dBWXBcSW04LT3pXrIpbGVQXd5YrsR5ChxCEukmXXy
         E3lgioxvuvaLViLSE6LVD6wEejdhmfZBQWjD88HwCB8hsLQ3d7qkopJDCeNwHFAj7NiD
         iqQQmYxqgC90fNC1qT+sIxAiwKuT/lR9oiYWtfwd14ss5/iC5vlYUtF22ccIUrBAJJ2e
         n/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116265; x=1778721065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
        b=hgXRTf4SP1I4FL2+BBc+ZB9nRn5eJh+YpoHi0jYkXVhBniQgIQAp12U7ddLbEUNE3f
         sansDVI/54caXIljCKU30w03YoaSQj0sZCKnb/fLckfLzjRKR+Sz/ouIfufG03TFOAkw
         Yv5a2d/IKBWzUAhacmID4YeUxY6Ns55A/j8enicCjslL8kPpwtSvkVeD9wmYp8/emsuJ
         o2myWpwoQG2haHki51Yqkwq1w8bvnzyymtKGqB1ry7lb4ylc3oH8+cvSdMGZX0tE93Xq
         WjRAora46/QzumtEHMVi4IGK52XkXdPEJKvsibzYc90ubrGXwHG8SSNC67UrSuNYLQkV
         feQA==
X-Forwarded-Encrypted: i=1; AFNElJ+WE6OfT0XOBRhIbCYIfewFZSYTQYO5onB0IuTE0A0PiwJd3z3/qMMtq7GjVckS8/afK/a4jVtkYeGz55hW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6iP6Jdmax5R4QSH0ZcF6ELFw+qluA+4NW3RQbMdypghHQRbu5
	GiDppNV5n7e2kJiQqIQsAQTH/FBATLAQb9TLa3R3culc7Pii2e9R3O1lYz+z9gODBRWvWUPikBM
	IIu1w35qGEbn9zVerI2P5/w0kNZdpolv+mkrjE/3iZX+zxn2VzAJaLWTVaErAwPC3V3OL
X-Gm-Gg: AeBDietMBQ46teIe2n1Rs8pDtpyYG/Rfk/Qu+a4F6169aPcKgXlsfPRdbuAhnNY1mdQ
	OKfIF9YI9bo6CT45NMoNar7KEdYo5HB3Qkzg37jAOPuXB8RzHLamzA6tyaWIDc6M/YD57GYxIbC
	EpHnRqtxqPR4GwKD43Xj5otQ2EOhLC0SVQ7Et5xKXmnPaTaERTxo+N4CE/7c3e3mxsqJa1ri4y7
	/cDe1kefbZp+rtqeQTYq3XHP8SC9aQ9rhxW0rQo8rwdaA/r72eZ3uyzvqKEyK0KAuL1Q/laroGK
	TMSdkQ/kzb8k0YKPI90lX8khBd6miblT/VferZnZkR9nIb76ss2fqGDLhS1Vul5RLHwJnnVaPiD
	p9zYk+svSv27RRj1FIVE2FdVfGQpnhEu/NsTsexKz48kj82YNGXzeLZGS4dANUwLnkZ6eZmebh/
	elTsJzKBYOcOwfrvbnPJ8M2Su2W/5f7Y3SxqEAW0cBpiadHLJzSWDZXvWL
X-Received: by 2002:a05:622a:5a9b:b0:50e:6139:492b with SMTP id d75a77b69052e-51461c3620dmr77944721cf.23.1778116264676;
        Wed, 06 May 2026 18:11:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5a9b:b0:50e:6139:492b with SMTP id d75a77b69052e-51461c3620dmr77944191cf.23.1778116264100;
        Wed, 06 May 2026 18:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:46 +0300
Subject: [PATCH v5 7/7] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-7-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9nEVbBbZylkYnurLYSAS/hZukhtGTEGsaxE9DNa3To=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aVh6IZ+jV2o5J5RH1giNT3lNZ1unZ8Ayvb3
 s7MFeQ5VAOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlQAKCRCLPIo+Aiko
 1QaSB/90X34ni4hJpeXgAwDtXwokYiXk4Qv46OD4sJcnHVYnKzUaWG8aTLWdHZSGoXcn4Na1BiE
 EJmtv4sxv20sxG8H0B5IdBfP6g4dRWr2z3Ot7JdPRDT5Y/pDe5dVaQ5bbDALrpUruyN8Xh0FmSd
 MSc9KjQYKVeI4EmCKbOxrRG19fx/rAJqtP7DRSIMBNxGBRd7Goo7PmN05FKpoGeNq9uYYc6DHLx
 5ajgaJlR6hsdeWo/g/EmKW2m1OMhQG8YRjWRZx08yYolcNBoMO7UvbxGbX8ddQf15zFO1cBFrFy
 g6F0LQ97Nvdni0nFdGahwz8hxdLjofJNWqErd/EWxqgjnQ89
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX0rLD8Y4BOBFu
 ANd+RooQzKOz8SMswSvjwoiL4xVQGQ9zfLotQQT+C/zdqBD0r2ZD5h7DhSE7MBCCNKs07sLvdHP
 GM1+ZPp8diKCKo6cMTr9sstlyvteEtejhbagjbXeyloc2w4ISgoXA+fxmF/cmZrYR2mq1yDpS6P
 guiMx/jNfzZ/udlBu2LhJ4JM0kJQB3XqBS6Pk3EqKyTmVk76UmCow2OiuyQsdpaJcGY/dnVnxpW
 hU7A9CkK4xcNsy8ywau8nupFuhYfyUjlG5Auex3PkF9guwMnwUNZyHGKuJdq8ibUgQZm0EPNzUz
 t08X3Ddh86TdsBK3NiRpzPoNOjmjUSFFKYMvYFQE01KwNrFPsSYM+vWnI80iMQFt6EN2hEK3v6I
 F5ejKu9A2g/FtqQdFR5hLkP3k7GkSqUT+rP3uBBVA42mRc3Ymo8N8D7xhRGNVGkT53CPvhPcIdC
 V8K2i0PRK/4Aa5v2e7Q==
X-Proofpoint-ORIG-GUID: OPEadSnPibT_q0P5UwRSu_4aQeK78z87
X-Proofpoint-GUID: OPEadSnPibT_q0P5UwRSu_4aQeK78z87
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fbe6a9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=0TfDEXg-tPZCovj8PBUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070009
X-Rspamd-Queue-Id: ED72F4E1E58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106227-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e8b5446dce76..f42e1798747c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -75,9 +75,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -241,7 +238,6 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 05b1dd11abce..a526b50a1cd3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -790,9 +790,6 @@ static const char * const sm8550_opp_clk_table[] = {
 	NULL,
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	{
 		.cp_start = 0,
@@ -949,7 +946,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1054,7 +1050,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1150,7 +1145,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1250,7 +1244,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3


