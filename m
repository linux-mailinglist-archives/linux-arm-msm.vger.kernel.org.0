Return-Path: <linux-arm-msm+bounces-109919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CkQLX3qFWqXegcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:46:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C135DB846
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14C543042C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4825C423141;
	Tue, 26 May 2026 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkSeWpaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G79Ifqkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E567A3C0A1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821087; cv=none; b=I/PhYKmcoNVReQt1M/DMwHwGkMluSp1aUYnUtI9tFmx69vT+Q7XeDx4NOdFdvstAeBrGl3CRmOz4TNeOVyVH0AGxtCdMhrf+Pu7LoD7Q9vCx0G2CmQ2oUiJuP4EbowVwM4hBmP15tTq+Jeg05Zk2MzXp2M2nOc9bUqlaQmNitIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821087; c=relaxed/simple;
	bh=tvQaf1UD99cLBwqLZN6ehrYMfjI2LZ3LtjJr3a0bqmU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TYlG7c0uiRC2or+p4wMQHxPsZGBaX998iXAaEfS3KWF3OxsWEpv/PcXn1ITELWnAicT9GeOa0B52ya5cWrA6WPpgANgLthteFgaUDHhD+t2FoRZlwAYoaFAQ0dgMg6YCPxIJRvzVqSrkp7pcFNkQtTkvNKA6dMsjTj6jqQ9NAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkSeWpaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G79Ifqkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0wvW3464088
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0wSEW2ON+E2
	SU4GNk1FJGyc6Ek7uJYGIs/wvnW8nuy4=; b=FkSeWpaVBOzEh/V2OZ3dxX/Bu2r
	WKwiZcMgfaw5TOmTV8beWZcMkBSQpL7xhcp96U4Zfjns/fFxvyh4oAxjO+awzmHN
	El2NQjs0UU+FS64MWY23+KgLj4BMH4/2iknl+pUT9zKDHGXGxGsq1Nc10/SS22nS
	GrcA6RJvB4F5ziP4UwMx70XR1hHKdI062rrjCkRVgD084n7LP11+UAgsxWXElWdZ
	0Icd+7/FIRsSghKy8+/WjY02jKOhvxrtpCEyway3ZHeSZKGRHFWF1PnzBTIcnjuz
	szUtXHX/Lb0tjMDk3/HXYbeQVaoLUVSapgHKoCtEX8U1xSLBg6xHnY0Clvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentgrhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368fe14a20bso2413802a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821084; x=1780425884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wSEW2ON+E2SU4GNk1FJGyc6Ek7uJYGIs/wvnW8nuy4=;
        b=G79IfqkpJ9MH3my4E0bon9DJsRHwonNWwdPDwGGbOL0vaB8SwbKzoFK9CUWLF9/opA
         87gRuE+2/PYtlg0F3gK6l5kB4N+ACyTRHcabYqDCDaBTo4piH0VErd0PhEBWEYKKYtnK
         zzzGEqBOIV/puRDAdm+WkX4iFhVvkPXOZOr5pBan1U0U7GFJLKyOqR0smO1pNY9ckmKE
         N5HpQUGYONIJvSH/vfmD5oIF3Flw0FP7SvWsX6Jcb71HeFuGsaL0iHSaaGJIewTpL8g6
         RZO+4QtFRxoErA7QFGIGOZPJ8WZjVd1wk4GZGVsmDa5pdBKYKJyECwqhw5wKh9LtFvKq
         FY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821084; x=1780425884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wSEW2ON+E2SU4GNk1FJGyc6Ek7uJYGIs/wvnW8nuy4=;
        b=Tw9A8a1E7XRCXcNQLjyoLO9VAUWKi1NroiJ9GQAndlbcNEO1IaMK+MhVK2o9Iad5vz
         fRwjzeOeGpob180BOsin3CONiuRnR6GyzNFnEvorKrLJ2mvz+rVPD2tcJEKYlHlNKn5l
         gUaMIuvRDo5UCq61Bd9aPzHrHZ08Mijt5UPw95k5u0aVrtsM8voEx+I65fpsUHJisA5Y
         clGBqYJXbDJHf0RSfTLUvziHVU+PX+gqR9zkbmDlG4lCz2De0dm7hn+Q0y6ba6pFlrhA
         vBo40s2h+SGVFEgpaDBRI1wApAgQewhr3OAZ6p1jzw7ul6wfIblso/2HLN69oY4mwsP3
         XZMA==
X-Gm-Message-State: AOJu0YydIh9ONhCn7bIHByX2I27pnFYDux2yRvmGHU7KNt24O7nYyfA/
	L+YGL7KSaBrfyXuu7KDkC4yLFpRCvbLuYXahfopGiefkDZtg9OcR9c/maUxPEO9WQHzI5KpNNnh
	CAokwOq04gPWa5ONoFTzJs/yXZM1FHwXfy2fLCBm5dObT4BkCj3+Z/Y6+B+QmAs2Fozc=
X-Gm-Gg: Acq92OG5NGQZ94dxF0t/9wRrTHTesF8joGIs2u/2xZ87U2SmBtpVlAke4jQMKe+MRXL
	ED9wy17JoS7glgqxcS6W4LNqFM42BPDWCdi/g873RRgtP5c87Nu5zGZYOsFriiBTdlKZZf7huqm
	YI/GPsg8/p+YjxLbLfavs0mHrUOCC/9bZ7Q8rFNutv/6uDbhhRcdR2natbr9Kr6t5NXhXjPxG0c
	irtGiGX9/o9JSrYL8KYGpbtyKoIBG6rq+XOShd0au6hklpzJSflPWwzzXHMxU5GnhFu9P7kxfOs
	S+ktPP/89e663wIZpMbXY0Q1aNUmVi/PlSDz48PmgUn4H62eOGoDlSfeBJG7a4xqQuiNMIr55Fn
	8Bp4sqd9f+nJCvcvfg0wbNDyj8AKtbNCaigUyhfUUax8z/aLu3h+Tzw==
X-Received: by 2002:a17:90b:520d:b0:368:f0a:1c49 with SMTP id 98e67ed59e1d1-36a671f4fa3mr10835717a91.0.1779821083842;
        Tue, 26 May 2026 11:44:43 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:368:f0a:1c49 with SMTP id 98e67ed59e1d1-36a671f4fa3mr10835708a91.0.1779821083427;
        Tue, 26 May 2026 11:44:43 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:43 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 4/4] phy: qcom: qmp-usbc: Add support for "phy" reset used on Shikra
Date: Wed, 27 May 2026 00:14:01 +0530
Message-Id: <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a15ea1c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=PuS4rQwjIVkbyJhllawA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LF-sTbCkZWIgOLfqMS25pXxoDsCr9oN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX1PXlTGD6aweu
 OjDuYiX9nd6EoWGKkUXVhm3t0sTrj97nMEl1ZvFRPbb+b8PHRAzQl6RQNe0RxqTVZL6DC6CAPZp
 k++WUfx1lD9AoZNRa4P9nUwC09P63XTPEv1p0OMFgE6UGcSpttEx4AlbBpmK0R1nUCDWJQx4sFc
 6uD4JDmBrYPAasM5lqfj3gneG0Kzq5VLbPZ5yOeitu1g8piIai1kccqTJOdBH76oPMqtPkUFtvt
 ciuNy9w+mdqDyKOe8FA3gMsiuHebEhUUi5ByJjIBD9Jovke7bP8BI4GID0Se/k5IbshkkHEONBt
 JEK1f9U4aaqQpQkvjB9ROmeS4vpWPzPu+fd4NsKlPor25ch0zXkrGWvF5rGYtaf2QbwvNWP/b2c
 cqqFBGgf52sP5Q48pPzXjPam23zPcc+grmNG9tcV8PaZUafcCij6jSnjZ35LiY1ltHLP8wTckzZ
 KcCmyT/4JEvKcMBWeDA==
X-Proofpoint-GUID: LF-sTbCkZWIgOLfqMS25pXxoDsCr9oN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260164
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109919-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratham.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46C135DB846
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Shikra uses three resets (dp/ phy/ phy_phy). Add the extra "phy" reset
needed for operation of QMP Phy on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index c342479a3798..067e7f6e5642 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -513,7 +513,7 @@ static const char * const usb3phy_reset_l[] = {
 };
 
 static const char * const usb3dpphy_reset_l[] = {
-	"phy_phy", "dp_phy",
+	"phy_phy", "dp_phy", "phy",
 };
 
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
-- 
2.34.1


