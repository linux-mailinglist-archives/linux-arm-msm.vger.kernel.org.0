Return-Path: <linux-arm-msm+bounces-112309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ll4zEpYGKWoVPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:39:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A1666568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:39:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ey4IBKwJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iHdraLsb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112309-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112309-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49C5830651EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D85C37B00E;
	Wed, 10 Jun 2026 06:31:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102A372670
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073067; cv=none; b=O65OEHSRtWCKkqrROUObhUNl2MYsNYF0igRfAj8+82p85lObOHJxTGwloAle+hjQbLZ6aOcS+0rPFnXaQurG11T7xw6XsHSWcZN+Yu6fLBeNUsTZHxRENZFmCoQbyvxSBoOhdb13Nff/EDcGDa2+HctJENrgTlrTFEVnnatKdcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073067; c=relaxed/simple;
	bh=mLL1VQMpy9N1BOZ45ldfQL+Mb3ztVhn7sg/R9eDAGTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmI55qzQ6EdWp9WMiJJleXwaCm3HGkAqI4FX7fPRxKzKKjA7FC0kzzDc+ddU8pT91C6lyc9qYj3QWSm1hIO9ksz7qyWSy3wm1nIi2BmDStxIo4pPOuDPYvE1OLwQh8P1dSGJwUz4JqLO92VOvPFlLPkU4aWYRAodbn1HDHvImJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey4IBKwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHdraLsb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2etnJ4097384
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2ytESqp4IIaVb4+TyQ22iWPJANF7n5yQgd0/Sz1Gvg=; b=ey4IBKwJmiEYjTLL
	qyHIIFqWbnknd0D8xBdjd6NhrfynT0khwDQOWnYXrDWecDc7XGfKIGdytY3tB7r3
	n/NT9KFDuv1DdMp54VbDQt06kwj8UPgNA/aWFq15Bo9dxzVV1C7jDdRFbNp9qsNX
	W1LSpDW2DkOmINgRYzeVVpcfxMmxumicJEEFKOvZnAYH8Ppu4dNK50Gqop6KE7hx
	69oGJWpiQ4NMlxwNfR5yp+tFMlLK5mFwS2BDEq4913U1633NnkVAH/QWenO1r+ei
	/5tSaufj4iolJJ1htyZI3gy2c1+L/DinPYb26PrYpebk75BDwVt9WV1VfZk7K9CS
	3jHYdw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jw984-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97415004so12438942a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073061; x=1781677861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2ytESqp4IIaVb4+TyQ22iWPJANF7n5yQgd0/Sz1Gvg=;
        b=iHdraLsb/5W4iSwibC2zAmFS07t2JFc2sqQo8pQkdJSNpvipdh57vZzKb+gq93tynF
         RnzhV65cpEs1gkJI7UkRc/2OH9oMB2N1rJIp69jqVnTNv9rhFwLr0QtaaLc+5V0Z/xMx
         TMdhHwGFX/s6ALfo7bqfSWTbJXLnfoAr9RZXHdw+yajTNDtXFGe6ssPZsHz26mDlRTPh
         anoBJRBQrNm40H9SB938vIBBNpUBi2k28cdBD3htjpmHa5Gts84EIYAnrpFSETCHFfp5
         UwJU/FbIVFh02rQmWhlxSedb1P7OrqRLPZf9hetsSs7M4QERekziCIOPd3k/BfUv1QRu
         HEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073061; x=1781677861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2ytESqp4IIaVb4+TyQ22iWPJANF7n5yQgd0/Sz1Gvg=;
        b=gka+0xWdHWo8CclsE0TaafCJ7vU6ievcLmqloResraE3m8iomUbgMyJVhfSUmTxat9
         tohOrz4raz7SJ4RFPu2tR6uRZVhjDpxGWY9iAu3AuLez727sshrPeP27uVfigHTeqckz
         sW76ExYgH/kH+zgjOlZUbzlOshEWyoxUTbyivR5/k4xBNpqR6tolnyhxEhbQLm76HF6k
         LG1+8MPpx34/oyaAUHGSryvKD2mCBV5ao92QAjGZGLn7tjgIg2xaPLrnpvtn3JKVzd34
         uVTYQEnW4kEJMuqm2aUGA32FX0Yg1tz+5RkLTPSN1RtT3OpxQzDCxLCSUoRb/eN3Qmm/
         7MjA==
X-Forwarded-Encrypted: i=1; AFNElJ828EArTtsNwVJ4z17PPCyp6ibHtlC0KPfi4QF/qtpBQ6TdzcT4gQmXNofDasz0M6BMNY9V30bEjS778AUO@vger.kernel.org
X-Gm-Message-State: AOJu0YwdQU0UazXgeyq5YbjWiZzyRQ0rOMOh5qAAATMrnmzPCKbQSzRp
	EWkFsSE1VUK65AF7kmkhkhEayxGwziGFhH+lcvdPuExKVnR5yba5PF11i1We+lfcQ4sG6meWxrP
	jVpq70h0hefGeoFKIm+nDQS0RoDQJHR4JUNOPDtSKaM0Mom6CrkeoacoXWNvN5BnLb8GK
X-Gm-Gg: Acq92OG97kWGSGy398gqLgxvexCf8cxT2qU30JS7Zz5fnIEHKwQywHtahPwELM/YlzY
	HzwVn2C2aCaGIlay0/zjuY7THcXdO7K0POz+soDPvsBUxgnGmAyrUU2wNRQpzE7HUMojg+rlF60
	IkVpIBMlKaQ2S+H/IP5L2UJmBVaKXvL56aSEVNlJtjKg9GEysTf//GxxxWvYBav723SXucQsBUO
	BbUb86Hho2IbU8AFX8sjxPMtpzNzxzlooQxA4LN8pTKEJ8e3fFWmjzuave0O+xMuVa1Fq4adpCR
	N7N5nrgN1YIL7Il+kjy8bxX5qSB8DqOl0aUHWFyoY/+bkuNvQADjdIEB3+/k/efuztRj58axQp/
	Rz6AFQnAQC0cmiBaVYsP0aHfwxse8QqwBYA1V5sjo+FEAIRoIBogkova8bkuMAK9SIw==
X-Received: by 2002:a17:90b:4fd1:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-370ef2f077cmr27350387a91.12.1781073060643;
        Tue, 09 Jun 2026 23:31:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-370ef2f077cmr27350357a91.12.1781073060211;
        Tue, 09 Jun 2026 23:31:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:44 +0530
Subject: [PATCH v8 08/12] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-8-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=3528;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mLL1VQMpy9N1BOZ45ldfQL+Mb3ztVhn7sg/R9eDAGTA=;
 b=/Xd9va40294R+8HlxRq/gaDcnCW7BShMsRLGRWPPOvltZR94CPuN4ZK3YoENes8SdkDxtR8jc
 FC2+BJpXB2fBB9cQ4gyMkiTQgZydgV/XjudA/y95v2fDl/tN4c3wASR
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: zS9Pi3FaP4hdjcXM36ocu9-yYi-B7R4k
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a2904a5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfXwkxgmnp7X9RN
 kIlrnZKlucFH4hqd4uD8eVK6Ev2x5ULb3OYdyjUDI9nTQwqMach3FTL62tIr0G8M7y7hnIr9VZq
 FUDjH/57iYFBwLJkR301IfbN9mrCXXslcjuylIasLo48wuXpr9Rg3cbsgOVbFVU+47e9oVZqXoE
 lhFtFIslvdi12BMQHen/yyJt/bnei4+rv37wBYBtISLh1wpIyxg+oqaSA3xaE17ZEHzoEptW0yT
 1UkdvNfEgqbUcUbvrieBiPvfxh7ca076lK3WjVW5x8g9/qyabK12K26HIeEJEuh/8sDRMrB0oBY
 cheyKR5MAl0sWrdFwuwW74rrShdheYttNYsIRQ9QtLqRPtNJSz2BeicnmcVs45OOEDi7v+jGWNk
 xlAG8+C9IpW0H2cKL//hQ4mev5ler4rOz57mDoikKaO24mFQzuf0cB69sc6NDqpyUDc2wvCK11J
 dTDFYyhvdXyiG7uIesA==
X-Proofpoint-ORIG-GUID: zS9Pi3FaP4hdjcXM36ocu9-yYi-B7R4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112309-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 485A1666568

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index afd2a0e2a3a5..bafa2ab645b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -313,6 +313,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -346,6 +351,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 330fc85d232b..a42554272964 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index e67d98b8c91e..de6a91041ea2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1


