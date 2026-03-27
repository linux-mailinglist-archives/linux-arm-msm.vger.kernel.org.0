Return-Path: <linux-arm-msm+bounces-100506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO+mH2wUx2lUSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:36:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1703A34C5C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBEB30F488D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26313290B6;
	Fri, 27 Mar 2026 23:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRKpaYiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDmPw/Hc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36B393DD3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654159; cv=none; b=Wx6/n1J7M1gDqZmBlo/6Tk4QjW4dErD1xR/xtK11MjuXVWn2KopXq5Iwcx9weXYpq4lw+Eu93WmfaaVxEcx+fR4xXLy9sfvNjblGeGQ9RNomnlrF9pzi702mjJFp/9RmQUTtBoOztJ2EhZK34Y5l4xC7Yvj+mH6i28sHnUy1d54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654159; c=relaxed/simple;
	bh=zh1ftPGxeFGHAkFhmHaCfKwMjNGnY1Er2XhYuU4Xt8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFtnvnGC/ljwM+2hawXM4U7HFlugLsbw69mBqWS/bYnlCPwLUzazaa0/Me/Ll69kdea1vu0zQKrd52xhfeKoJ4x5ToSr1H/zz2FkLopwSExeGJRByIjrLq2tqVxUNeS+gR+fUR8EDQQE3K5Z9PUIgc68E+QRHcQGlQM/wfCm32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRKpaYiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDmPw/Hc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3rFc2095988
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6Tdn/7Z1pLbIgw5i2DyFx+KougHn1YOQ3OOkdYRo/Q=; b=YRKpaYiVwFW2YWOT
	g6TER3OYDv3QWnDTMnhmCx/XA+O8fvv+AIetbnOfD7LThhRD9aOyVZrfHQf4msYv
	/z4a1lXSdOzr7o93GfVrwcPOGsPzsPaB1m6Xoy2ec6wy+wKygrarfWyyzmjlLKXn
	hBcwrCS8e7mp2cLlwn4wuF+IoXlUPsp2XA18rnlpVykmp99zW68US27UlBx7Hp4S
	J6SyRP2/nGWKfoZmImAIovqIS3YAGL2+FG2nz019g7YV6wskzafBDf8mY0oEuChW
	OQ3Wolgk/rjzPiMp1yue33remPztWT8Rpy3+htxyk25Oby2xwvJVjcYwaz+QfAOs
	awtfxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d631q02eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so66517281cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654157; x=1775258957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6Tdn/7Z1pLbIgw5i2DyFx+KougHn1YOQ3OOkdYRo/Q=;
        b=aDmPw/HckA9D7QHzsxzqDdG4/KiHTosCWNemXFGIoTtzbUH7x8QhGPcy+QBcawffAs
         aO/DUufqYyTSRVHeOxom0hXjDpvxsErjl0xlP/jhFzO9Z4igsjOqkoTGHX4flIARXy1+
         GqzAf8ug5xoE7OgiqAGE7O+0mnw8A5cnSd0boetse3kXiBzFYbABTDJTS5UPKsALnquO
         VZxt1WtFscOIKGAOum+NensLNdPNkAVfExlzQSso2fArtPCWIEuL5owoLX1gyptCppNl
         F7BNx/V1/F5LJIdySszK8vH6fm2O+4v2bRBtUwZZ10ZRybdzobqZuaSpL9qYnrFkA7qg
         7JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654157; x=1775258957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J6Tdn/7Z1pLbIgw5i2DyFx+KougHn1YOQ3OOkdYRo/Q=;
        b=P8PgQ/eOlXzrr5vFDv35uhmGdbvgfSS+BhGWNYI56UnzX+3v3P2XQ3cRgbAA54yIzg
         yb8MWyuiZ4QiKDAZ5/sY23LZhlUfLzpDLuDF8PEDri6XrgEtIn8YRFmJMK1uYQK7OG+O
         l8TF7Vt/e35dqml+LE6WFyxSmS7W12uMRFZsb/YbBM0zHdAHpvkyaIqE8yc3FQ3US2zS
         EvjkAiD5G6bLJEGc0scJoNm3sblsrNouabN10PrzsAh2wSg3NGMuKPXhpD+JDI62+wU7
         b4RiHo9nYAob+4X0IRLkgD3Kq7TaqgtPkcIJWNmwxAqazKSjwK6GblHEzz/2er//G5M2
         7iYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZt5S6ZjDahGuLRXKLPDXZ1akwU/BjxqgwKyhrFFUSPnwWkWIpOQmbaJqaFZabcQhVcW4k5alvXVjRGYxq@vger.kernel.org
X-Gm-Message-State: AOJu0YzNf72Drx9y/syXyqpmghGUpi/SduD9EMfUhcUSzRsTdUnLUdui
	gWjT00o70M3iG4RQ5yHDi2mFwKzIEMFemLsJ3l9KELtBMTvEDgGy1owWlRNIGhfuYQonA4HbFkb
	X1sXZFJT0Em291nIy89rpSeXGodmeLE+o+QNTWaE0MpSHnq0E5BFBINsTvJCy+aR4uRd2
X-Gm-Gg: ATEYQzwKVfR+Pqva4wtNoakDGdgq9yRElj5tX6PM7WaxddyUhUYVG5M3SHwmhAPuwCO
	ksZYnniQS35hg2vGu4eG0t0FXCIBO0twoGrn98JEbVu/GuixGMeWEKRhwIQGP1PEO3yaBRJHhCK
	zEVOIOXAEc41cn0wbTzS2p8lx4tnnM797+tSogMYSmvgcPo3wtuk78ujns0/JGRIyHHoEivTSpm
	x1vonnt0kspObNfBZlUpOD6LcnDFU+Hxl0BnOx8waieq3px5zgMqljRXiy/LafIisD3EdPLpNtg
	4BZz6HzVIf/KWgvXIZr3hX7WCZNaBCR3ueoxl51pMFFrmPmsn6/R763OtmXRP8R6dcrhfV5enKb
	xmvBchlkMzb+NYrHD3ZZIfdk/WNncHlBUTlLOxBJIQ5ZwiZaf/mW0eJ7WuGNriAqaZW7YntaTLv
	bvplvm2o/f1eebL6K4Wg/9e9TuYbw1aKwK66w=
X-Received: by 2002:a05:622a:2d6:b0:50b:3705:c0af with SMTP id d75a77b69052e-50ba394948fmr63612321cf.53.1774654156973;
        Fri, 27 Mar 2026 16:29:16 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:50b:3705:c0af with SMTP id d75a77b69052e-50ba394948fmr63612141cf.53.1774654156600;
        Fri, 27 Mar 2026 16:29:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:29:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:45 +0200
Subject: [PATCH v10 10/11] media: qcom: iris: use new firmware name for
 SM8250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-10-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zh1ftPGxeFGHAkFhmHaCfKwMjNGnY1Er2XhYuU4Xt8E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKpDo8Iy/TNwBKnNbG3wNNE39XRmWHnOAm51
 W51u0ONOBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSqQAKCRCLPIo+Aiko
 1Z5pB/0YMDCtwu2NMmtnBz3kfo586cFtwbvzjs0uwJrg58mzZOLcnTlJ3lGAdsK8/hmq1Qg1wat
 Q57DZvDv4aZhIsN8oN4LVydFk3pyTv8YXtTPnlZ1y2L/UfDEGq556EoNvF8IasIP76DBNhCzDmE
 JReT9vZWW4MG1V1BPDSssxBcB6xb2QSbIMXMDUE6OcrnAbdE5/iyd7O6aCO2zsSRxEAIq4gYXhn
 bnD94akGnIFuXs8qcOq87IGJxYDUHl56gNB8IoUEgRoPwP9S7+AwWWoIsCAtoqShI0pC0UCtooM
 HzANrWiSfAHtWlycDJarz+DhTalUuKyVQbflhAA/gF3c0j51
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OcyVzxTY c=1 sm=1 tr=0 ts=69c712cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nz9G3-SO7wN5dIpBwN0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XMARUepDI_7qGY5Kqt2axEDuxNBYl9Ok
X-Proofpoint-GUID: XMARUepDI_7qGY5Kqt2axEDuxNBYl9Ok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NCBTYWx0ZWRfX0iRm5YdW07pJ
 RCZZzA8PCUfWANOsdxhyr0LTtEtwRuxd9f2AgX8VnZiUT8H9BtqDqM1XxRlAZuG2B3mKFFq3M2m
 TAovMbnLJX9XQXxEDHnwrCzByYbzB17FGtmSndRhkT6QFAHPFBAIXgCF+Kykf49waf5eYzwwC5R
 GPqtHNxMfE/IB1Ma8a06a3hw/8LfML7LoibkeVAGkBkHdPh8CO9W76SA5qVpNk6XRbaRkONDLaf
 P3BKfYfsmNJ6Z9Z/fGvQpoFQFY3HG1gtaNtxz8MM1AwRgYRMiCvpE/lSzhXijSuMLleeI6uK+vZ
 dUcVHfmSKAbhMoFG0xlpJZ1G2KkoxUt8M+AOHz1Rc5zSQdbIrdHN7MJDDcbeVR/eMJd5yk1G9YH
 +pWPCfgNLrjIrHWrKaX11wbp27FdRwqYHU3PBT4GTVoHtQuNF5kdvItJ2JONLB7NykoZXn0crDM
 60TkXFTwnFGsEsSqR6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270164
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100506-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1703A34C5C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
since August of 2024. Stop using the legacy firmware name
(vpu-1.0/venus.mbn) and switch to the standard firmware name schema
(vpu/vpu20_p4.mbn).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ab2a19aa9c36..692fbc2aab56 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,

-- 
2.47.3


