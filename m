Return-Path: <linux-arm-msm+bounces-116109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a6yQBtmyRmpkbwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:50:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C16FC4E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:50:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fbGKjUBQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ImzsNj53;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116109-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116109-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C803131D623E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300D236896D;
	Thu,  2 Jul 2026 18:34:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B318536A01D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017264; cv=none; b=epi7cJSaltpO4l0hO9nvSKgp3O7JT2gsZJ/wMOGcKaK4MfaF7BasvJ+OdpyJS+X2rwC72OP5jjAOfnWp4BO76aWyP/qKtD9XhSu6Vj4GPW6zfrP6u9Z6we7l7O0V++xuaMaIgHWTJuUjAe+jhNt1RXcKaL9GjYrBYQysusg+Axw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017264; c=relaxed/simple;
	bh=coucDPCtTPijonyA8RvkPeT4AJ3BXja7sjzuQEwuMh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pogO2BryTZbqG2f1zGmRZ41Vj6xaIGJHjSHxKQFA7JmbdQT57pE3k1gilrhFCdnQxvoX8XhtihjIrZqeQjhr6TLm7eVe6GhWm0FB2lcwSXeP5nPCYa2iOgQYN6XSUwJDTI+kJaZm5nTXGpEFyPYWSsn2fECPB0ZS6OI2i5+RwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbGKjUBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImzsNj53; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3MDK665955
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=; b=fbGKjUBQo9EKxPT3
	OyMXpjY7I9SmebKfHqzyO7gb8eZ6v/IY+je+Y6WXUS+VyRQzbgrPB8rnJl2Uaxw+
	KEVO3acdYY0BeQ2YrsYJQuZdoZT0UcbW255/CSHQGiDiqqQC7AUFcISyGL38coT+
	ePnmuEM2PX4SCQZXEGPdllZeex0eiN5MNlfnjey0dv4TMrVir3FxVj0zSn6loNRe
	QpCu/qm8pz2GYnxta057a/mEaaOCk3pd05Y8rSqLGq3Ui5l71DUdwRSRcqn+6eU5
	2jsU/6B05y4jrF21/DFPbk79s2eSowovxktgaCEKhXyB9jx4vN1IM8w4PeKuiGcv
	eMTKfw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc2qux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2786387a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017261; x=1783622061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=;
        b=ImzsNj53rhWwJczGlQPHUnAYiPEor6V/Dj+BhN+6tOlKhjgaafEguY9oyY9sGVj+Mx
         2kOyileeTnEMVWQYxfatfChsi7pdZwraT4YJNcKuuhw/lXyB5Bau/UB4Olyomu/xjx7D
         hLKAAHTLoD2FtfZDgmBBcdfLnK+XmXoYrhhTLwdaW/LNkn8SRaoGvPRBnPM/bXCnAIf6
         iWYIlfQuCIYeLdQHpGVMr/e5kwRNWKbb8eHVWMmRTEz3TLH8ZZjLbNnY6XLcfZBue/8M
         hEHztO4iaiLFm5fr0iXsJDhSg8uejr1QxRPjJ8RQeavkELDk62F5ZkcUM02WInVtBtIp
         eFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017261; x=1783622061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=;
        b=Hljl0jqAe/5zIFJvFAOtzZCzTKT5Icu4UD2uk6SW86/Qcg0l/HXX7KNmzp6vMAaJJ9
         /UuCL8dBIYkxBOv5WpGGWHBU8wB6ZDDdrVd84fYq4mg3TQk7n/GEe0OWbsKpPWgRZ4St
         Epvjh1Yy9DcbzioxAV0+RwVq4k+uFy6PzI3OUX0vqbpMDEGh9ZrbyMp5nXAUcyymC2Oe
         gtnTrGhyiXTS49Un5mXhDsQo3MOtoUhJfakk9VzmuVJBhyrCiPssTFCdSk+fpWQL4xcN
         nPvMGIbIA6rVpvVoRYiPmnZ/We2EUtt2gGMH06wjz32CZSZtmhhLG68q3BidyFb1Y56c
         CywQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PhUFjqZAeV4WlOmZXmRZNrDcK1qpvmYebZXmdOC8oS9Mwdkvvq7Okm+qpyLlf8PryFt2pXhAEYUpVTEPD@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDCMJXwDNJDQPn5z9AD58xtsPidoqc+vKfzZDDnnarfvcLmvJ
	xYnf6XB9S48l68PJfldYsyzPDm0m8fAjHE7sSZQpdjK3ZqzpwXCE++zeWBhF3NN2lA9oBUd9B6V
	zH/NZWQAtV4eotDFNfL2z3A9Kyn2tFnXrqz3Zm9RJiptDF9whoiVxN7PsCGCJvf4LAHvq
X-Gm-Gg: AfdE7cmZC0XTEEsFw/L9o9ON6xyCRdPhEw4kwYBLUSp1rrrhDkzRrYIg4xve1yjqcLz
	RiciptbXRPZ7kDYlnXgu1PoJAFsC8b7qWDBSR71w4GLJ4IONpVb3YTbQx8Rm568tthaNRbgfZCQ
	xhJ/cQsO39SQg/69i1f6J29rbQW5o11NxwqBVXRxfKirJefFSHzftSHdQH62v/iWD0SAlUBrRDQ
	7O584WLy/42/RruRuoazQkubYgFTBx4bzLSJtlmukmHMhw39bI/gvihYROST1lNTA3oA0o5mzC/
	kOSgNoQrSbGvVmSlOlrPlmkzRR/P9CtwLg5aLFrPoE8ynQ3tbTCU0Pd05MYyXnVBJ/gjTIJsF7+
	qNwpKfD8/SqthkUtdL3tlbNFJMhWAxyNp5RIQjxUyJA==
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr8198794637.4.1783017260838;
        Thu, 02 Jul 2026 11:34:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr8198748637.4.1783017260404;
        Thu, 02 Jul 2026 11:34:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:37 +0530
Subject: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: vC_YyxC55s47z1OQ5NM7iRkQiXWvo6mi
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a46af2d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8YD54ZxpffqQ
 0Y9aHJ3BtNLfyxQ6rbA7VrMqnKF4gDFVYEFdJJUgjTO4Tank8qgCs9SQQKMv3/jIeeW+VOu+aTH
 JWu8/NvSCqKLqqRaGJGWB5JVJQQEMtBrw8hp/dN0ekzBh8QBwR7voqFZzWwWVuPASO0Q+ODNHzp
 V8VtR/MmV67jZo2Fq0nMopMZzuEMk45BRrjAxEyVnFnq5Lz1la9Uy8vKOgm1SyBTZVArNi7Gjv9
 9S84epnFxwp2IkGBxV584pET3CC/BHhaTbZrnm4D/SsjTdAqOQwZKLwLThKJAyECzJlUKgI9Szz
 jZAQCI7sPFXAZBy391fRHiF/fMryiKL1lPNJlLfFb5RUVszieOmhagpDMywv0HE4zLjd+GtVAXL
 LkWGhBTGGCJEHuOdUedqKbb4TC/YSv2thTa3vpPemPqIseGlvUTdvQMwdb/nf2EXNqIIz2WeHdm
 gtgzD0E0Ww32tYa6D1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX78Z9vtE6h1Xg
 6CqYd1Y1c/KN8d9c97Mrx6j+6kyw6rAvsK8A36kr6mdeH3VI0ZrP0W7WzYcIx1BElOxmL2cuoxf
 tQw//YGehRKO2zkeykk9lF+0U8GCdYM=
X-Proofpoint-GUID: vC_YyxC55s47z1OQ5NM7iRkQiXWvo6mi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116109-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E3C16FC4E6

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


