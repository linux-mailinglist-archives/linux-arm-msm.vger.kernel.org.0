Return-Path: <linux-arm-msm+bounces-107284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHnONQtxBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:39:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 347DE533286
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A84D312A1B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5135423A6D;
	Wed, 13 May 2026 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBernZUi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3X4CZJc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362D6379EE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675698; cv=none; b=b+6Q0GLjG2drESMyWhXAYGXMH8nkCyMADKdm5v0S7a8PqKujDTjlXVkKzCm/SLJj2i2a4/QFHIgT/cGRDHPAOzutKBAtxMQgKdwPsWrbyg4dTmv0di/F/nsy3weBOjpXtTOXph4TdQyrfVQjADns2v1Qv3jUXjVZP0W0dAcLiJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675698; c=relaxed/simple;
	bh=rhMmplJZHjgETELIHxU/vsgM7ogB40pqy4Io3V4J9OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT1ZkDrdBI1jbYyOKc0r6N5Kdgipj3Me3oBCz7LzT6wytrIv9bPYIvQsv8S5ImYpCEckPHo1GOyi+q7DpEx0DSvkolcAgm5LxBKxzYPjhve6wGQCFSlrKGiQ11IRyllpS2sS7oRUPudbtDINXZDt4FJoqr0Zd5iH9C6HHVhXWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBernZUi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3X4CZJc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBKfaw3324682
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=; b=ZBernZUiQXwaA959
	y4LLxUq5GRM6LekP2yCHsnv4Z+YgDwc+QRaY/vyUPK+mzSwE2bWMQyoCib6MjoIU
	nUrFpaPPmkGVdBDa4qS3Q0Ax1UVXscqwdNE2eJPeTnzpxuF1uZJcFNCDXs4pYUZR
	YkRbGY+XfvTPwXv61l5J3OUHD4P7Lamjc6KHcDBaEpyyP1Vfrt4m3S/C7SjlehX5
	+YHrpgNN3Dn9scmCbK3PLR0OkcovL50Rirq7GeULzqrK/dDZSC6Kwf0TC4FctoDZ
	qjrOK3kYGKki+HSQ2YUZ7MEGn2Bin75PuiN+lSdVHKuxm+9aq1nskLgb7zgjsqs5
	rKg0Fg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9dua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5162ee45a77so15900711cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675693; x=1779280493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=;
        b=P3X4CZJcF/eEz5GnyuB8sE9Ipn6Sg9eIz/dz5oaCWoqkrTLLLnzNyJyh7Y4iqcTu1J
         QLWa1Se1RgI3DzNylIw2I0j244hqkixik2Lc6gEUo7x5JXoU8lpwfrvkiwXvkPI2LzXo
         fo73+qRY2sfOf5KUMAFFkjAmgfYp1/8waJ9gGnLypwo/3CwU6G1kYpYM9IZXRm6lOYaZ
         owVqPxbN+dXavo4FTMad4sw/Gocf30mf7xe23z1lkDDpRNqUyRJ8eVw8JVmemadFYupb
         IFg8fpP8Md+7wNyqoa4kJ2SVGhWWq0ukuZ/XW7lN1l8pS9hnsL42PSAO8t2p2UbWlJ03
         zjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675693; x=1779280493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=;
        b=NSzc5D88oxROjMf3WSXBe9KcNHIEihPqEyek5MjJsbKADC/F2Ibl0UoaPRvHopcGg+
         IVko1+9pHSmoWJI70dsSgKselJbKagnYifk2IuIJWiA00llTdtmNovsthDg3+gHhGBr+
         Tl6lYPHayESbTfozjd65z1cmeN3pdA46U9WPO+LG0tpUpTrGbDwJOzmhhE/rwhZSkAj9
         wYoj//Dww6PlqcVGVBQs1EYXIxTkKE7us0HIVpp4vk32KBgaYV+it7jtzKXDOK77wq9Y
         gUFugzgN5/syMl7AeRGG5QQsT7DeNa3o0aoHu5qMqj8mc1zVzTXp3NKGIi5XjtW8iMY0
         cYEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H45v6Up2G02dJGpvD60TYhU6D7prEURnUFpVk8Q+/AEOIWSN5F/obpDwau26RWJGd6QhBiG7rCNDwBjPW@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJOrt20yYsBEeEybAzSPcOjlAHfwPg0OcaPxylpnedRbkUWsC
	15+9PvXQ1O3KDJ9xZLkOhfhpxor6WYlRLcQGd1j4XQAiLBQgUmp3HfKaRP0WUdmf2nzzGQP1tMs
	gFgDbH2N89YgQ2mLZ6kybaGfp2x8mLnvXdsk3fcXgC0RV+oNIFpONlYXViy8i8jCvRrRk
X-Gm-Gg: Acq92OGrN8XNGLYpB6xbcS6KjA9GudQC3NniDOUSPovzBd3N9ogW8v558XQr5VOARxo
	Z8l1TzLytuj4yKFA9RAXJ3igFrji/xakzFXAbyll9n3T7+Ps8GhgGemMoUrZb/+f4VAqG7Gnw+s
	TQT9qApo00JQAFF2++BCdYD0DmyMMq6pIHFjTWrPLu39P9r15qmNImxovLoNz7ChUwdvly+xIif
	D0Ngnj0Sm2LdGVyePxl0+shseBOhF5nOCBvwmeSd85lLaIeYihDHiUPnUtdaL7X2typd9fNFeHU
	cvpiTMPFirSzY6bxYheqqTjYBhZzMxjHHy2kXDQH1XZIRYrpxOeOOFUo9YVD5hoCRt8imCLsmNc
	mZplCMJyoSck5i2wNwqHBSXQlLljbTHMAE+H8wtobq5eoaIP4bTOtuyMeHndqmBU1h7KoHd7BU3
	wtGCyGmJAUWn6MRla7A1RVZ539bA7kbg1ZXEo=
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38051181cf.48.1778675692800;
        Wed, 13 May 2026 05:34:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38050931cf.48.1778675692371;
        Wed, 13 May 2026 05:34:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:45 +0300
Subject: [PATCH v6 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-3-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBq7lynhN9JvmvojL1BqehFO5JLgP9wZqWKF6N8gCwU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lla63QjlAipiccO8+0MWldtsTwZNH6YvRb
 H2T74nC4miJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1TA6B/4ln99sRe0thHKm+qtJpm+NsUZzDU2r2TufjRmqSxbUB1nafm8Svsix5tYb8WvYKT2uK9j
 v2WzuOBcto0MgZVXyWFdBAB88yTbi1GhuWvVI2gLO8QjYyT6OE+aJSPsOh3l/7vhSmhFFfthedk
 zsqaCIwoX1RA9bvP7p3jGg/oB6/31zM5P9pksbXVBz8YO4MtJQqxv+cE5pgtkDuLAEUyN09fKZm
 nP7IS/rdM/F6tLks9f4q1Ewa/oePjtOr8sznymqzrdrycjS/VPXz99YUZzPx44Nvu7nacfJBzYN
 aYLSY6G7xKQ6sgBGSuucOwitpFRqurIMOCe9V/fuRGydoISU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HlhgnWYiPoRKJY5bp6RBG2AOoUQjNXcp
X-Proofpoint-ORIG-GUID: HlhgnWYiPoRKJY5bp6RBG2AOoUQjNXcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX51nDTGqDO4aw
 V+VtDLwKoIpzrmAddmOvPYWRR3hHUVv+/nryPEVLqIl2hXC3/PZjZZvss6oonE99b2BNk78ztmm
 jLt3c6wrZ807Nx32bbFuRU9BXr0DkzOpEbJrcVLMYlfDjLfhQJdJO0Ut/QbB2/uMpQufjm7pqDb
 zbThP05xm3SH7q2n5yVO7ccMOny2z4O9lekxaaNVBqoTgkCrVGM8FUrs+kwCNfUhuR72mSwuKnz
 KXqxisIXtId0TDLHt0N4n8ykrgqtn47cR6Vpgiz5zD9Wfti6IU939LgbMgJTSnk3IDwQAnGdTi7
 7KK/LHvWftErK8XxzKfRjaIzfOIJA8YITqbsdjcIO/qG5Nk+cPpkTYQAjl7yryEnUb4IHdKFX9s
 MDq7uJ2uiSG7VkVC/dyPwYSGAjhH4hMaXA3IRgX+vxRUCzpv/vxuEABHbSlv44aF8dpFLHZ4ApS
 r5cZpLbEWRR0sxacLeQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a046fed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5etVbCIt5GNeBr577cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 347DE533286
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107284-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[abf0000:email,aa00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,85b00000:email,ac4a000:email,5.42.239.224:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Iris core on SC8280XP.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index b09bc6f3b518..4f540f2a0fc8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -11,13 +11,16 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -692,6 +695,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4182,6 +4190,97 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>,
+					<&rpmhpd SC8280XP_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2a00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3


