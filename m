Return-Path: <linux-arm-msm+bounces-109494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P6XMiXUEmq64QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:34:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 465855C1F2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9382301327B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3693002DD;
	Sun, 24 May 2026 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQLe+uDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMO4miUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2F3911C0
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618821; cv=none; b=LcVaOuXgSbW9U42+x1eA3Ttkc9ET4fF4C/XtfJc4Vg1+EX1moSje8qh1Hctn3+nGTdhgq5m0TkdmdaABBgGpVPHaXmVdVC4ysNcofEUNL+0T1TMjfCmod/suKTua/TgFwroNA3qXCvqUnPnkGJOxYTXSuN2Vif0ykSg/rgSE6LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618821; c=relaxed/simple;
	bh=sfsH6WnpUJEILc0y0cE4aFl7E8LK8Bn4UgByAfKVRH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oy46VUpy3lYnajbqaE6Bfgwkgbl0jZLTIXHD440binj95aIQIt0CcoGp4FWGoEEwz+7zRkwbbyGmgKKQVuw8/ptA5g1FPagmHsKAifQ+fpuAUFNccsZVM7M5SLZUaKxvREeoVFOG8YODn5bb00BUe/hNjEfdpbYPntDGSyXLsDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQLe+uDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMO4miUZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O4Jswv2812390
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUWlPZ/QEyxKEroL54OXFIzBc1cA35ddV/uy1RfQebI=; b=JQLe+uDX+o8oT808
	aOOY0B74sM++WMNBVSGHIzyayEwjWyr2pFUfDuxdMChnBa4pRHCcNPAeKyGraQmQ
	w982WA7Oh+fmry5Cdu58uPxJSYscyjWgksr/aip0WMfunlqNTeGADMs1IR7MgE2C
	ByaNzOp/G52hLJaOymrQDoOscKDdzjlAyts4lQyLRAsfUvRXmLK9OGdkJLdzUvm9
	bP7mfUuL9Lm0PTW4Z46DaM7E/VPGvrtYogteaOOz+u2jIuE3AweGSjrGqrraYrFu
	p5y80LzAWNKvIexgh5nnL8s0VTwwK59CFVgGkF3zEMMtdcYpMIuVLcmaWRU6ZYAI
	Agvmng==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3axk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-58489da5374so4266829e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618819; x=1780223619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUWlPZ/QEyxKEroL54OXFIzBc1cA35ddV/uy1RfQebI=;
        b=MMO4miUZcvbJQDdwIz3smR+lc6N6LbPtCZlfDEDlnTBXRl4HZ631J5oKfNpyD+T36e
         BkjrPwT+/dHgtuYiFlunmD/LBiDOI/Nu6NWlukD3J6nf2EoKnlx3yHrAa3GqTNz4ME4n
         popnvGGge6LNdfYFKrYSHHDMNDtvpkP9oNJAnZWs90IusrPMQkjtrwX26oQSlb1K5mmP
         cqDEMZfMu4drZ9xrYGWVuT+Mtz3d5s+ylrUvh5GRBZyBqSYWOHmbSo/invzMfdpdNqcC
         MmcYTIe+OPIyjZY6p+CFVT+xMsMk/HH46LeS6gEf+fuulZ/7uW91Q2yrX7FVGcGNoLOd
         0Rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618819; x=1780223619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUWlPZ/QEyxKEroL54OXFIzBc1cA35ddV/uy1RfQebI=;
        b=Xb7Vsv8qsSHFhOxCd9gveCBauQ9zBNIT2t83CRfSncjyJRAiS6pJo/Ma0UkRkeKOtM
         NtihJrNAEG+WBbHDZxK1q9MV1Gan4WndnPnzKShqfYAFaRr36h+/LA9sWwHFPS/RldoF
         IY0CJSeczQN33t9T2KQSgq3z22AcR9DIepxObP/EzMBZ6/NLSVqrJsJ8GaCM1cSGAHr6
         JDJ8DeUgbuq1K4IpT1ZeX1p2t9BcE+OXUO/v4b9IRyegoCVab5fR46HqNziIVpAZktrp
         ZVOvlW0jx7i+OTglRk9L4BsGjQpZaNNP86F24o52E61rGpNJBcmLRMly5ArlRsjnhfH3
         Hcxw==
X-Gm-Message-State: AOJu0Yykt7Jr3YmuBLPRrzXp1Q8bRdUPN6B0QaAe9jge723Dx+X0wEcD
	HUOmhht9U+Xip1hLLiHqwWRN9grVJkVeIPZExtP5HgurxaZ5Q5SQZxuk1+7XzkV3KjZol/1Phcr
	txmwyEFC7/oDzGYGnpy1CesP+0ql+4/46tN/2Q4JFirv5FaJH8wux6NfOYkxHBj5wG4q4
X-Gm-Gg: Acq92OH21ixHcyCPCSxLQhc9ipTX0lyBTse+wCTEk+/Oj3aUeKyH2Ts9TpUQSGd1Uwt
	X9YU1ffJRtriEfCJK+bwFlmpcI5jsLY2qDbOUae8UaOIA5yk47oA3QVkfFYA7rOPQ/hD9YqBzKA
	6/99Uffzsxq1pPuRc1saIYbv0OhOiYZEGsjEcim/notiUWcg+46c5x0OsylH6rlxFHeawwxgRlg
	r667G+Wmp2Xw6JOVGkj0YUKGaRgzZyeyKvkmjp0HY3SJJjX7hK7o1xl6NzcqfgRmMJeP2Xm6jRv
	yX8aBu20utIr038ZR7vCFNdsZG+g85lYzgchBOCApImjUC1z++r4cHM+9VeIjGr9YtzXhPeePlL
	08/nrw1++ChsmRoYB4J4bKnyXNmks1Qp9Ro8TXCyjI7Y4dqifgpKqL7fam+H2P4zEcnjIZWk84E
	y7+z21QkdMYQMTN06eKsDugdPn/LRhRzyY/bM=
X-Received: by 2002:a05:6102:2c8b:b0:632:b111:965a with SMTP id ada2fe7eead31-673cbd0ce4fmr877002137.11.1779618818674;
        Sun, 24 May 2026 03:33:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8b:b0:632:b111:965a with SMTP id ada2fe7eead31-673cbd0ce4fmr876982137.11.1779618818286;
        Sun, 24 May 2026 03:33:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:29 +0300
Subject: [PATCH v6 01/10] drm/msm/dp: fix HPD state status bit shift value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-1-cf3ab488dd7b@oss.qualcomm.com>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jy2G9A2/jlpjEPih2lVO1QErbvDF3fvHdd/w5FC34jU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP8wFGMU4tIiJ5/Lc3BYbRwQXr4awMypM566
 5fMSLf/kW2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/AAKCRCLPIo+Aiko
 1RQUCACTjry843wsUM10VlJdaBz7l2Aq5aCNjGVjkkCwvBKif5qljEfaH810d/wq5qPcT8+9AqW
 oA8UbPEFB9SO2qpTeosO1ce1Kjg0m1UxlVyyTrTiYPvq3nyj4C5lYyeXV9v366kDZ0iRq/pScL5
 sYJSBeZazUEQck1OCm1IrnCoKki79G3UUmhLdS5udCY4T+SGXa2LfqfZGLRdznh3cfRCxC9E4SM
 8n1MB+dE81a/QdW/UTf7HeJBBb/mC9ujC3duz+JuYwUDay6oUOiY0gKagTnpDoeHAjgBS+Fl3Jy
 yJ6+OX5Lpjg2c/ANchHTMoJpW3kxcjiKAWEIYixqVNdEHtxG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: AsiKCDCDWbjksTN1_tLXz1m3H_bK36D0
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a12d403 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IBRk8GtBIsankUNt0b0A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX41fYj61Qsneb
 kRQ67Gnd/pmVetvTibUuEoBoDCESzYEWvMi2DSLfPWvAxFnw7gTmERppo6QfCc5+iMY4XH8SYWn
 FCKDRrtM00K/hxWkzNKK33VqTOUTuSBiyVjd/IPX6A7ZAZBqfTDIGMY3w+b7j4WK5+OHs6XI8WF
 rvfx+2BwWyB3Gd9lccddQPRSDz/ABfbHT0qtGnHFl1SDFwyy119UahHwmT4crpKgSoN5EWlSigq
 iH3zacHQHFtfLl8idmjbWcfe3c/UDdBTjF8vxzBHsRkEb17Qty2pcLNo8jfk8csXmlHvAK0zRi5
 ToQvTYwmdcvgJetqKEhRDeXcwp4jvQ3PjENCW+lnNsyqJOcTQXJdokO9uqpa6VJpJ4JBZvh5RGE
 X6R87QBcqp1YDR9tMeYnwQ3C7BHZDoaDj2B5XDSwx8/gX55AqCboLKRL6zURgQL6kstIYu3P6ai
 u7wYjI4EfIN4EzCdUOw==
X-Proofpoint-GUID: AsiKCDCDWbjksTN1_tLXz1m3H_bK36D0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109494-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 465855C1F2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The HPD state status is the 3 most significant bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..3689642b7fc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -68,8 +68,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
-#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.47.3


