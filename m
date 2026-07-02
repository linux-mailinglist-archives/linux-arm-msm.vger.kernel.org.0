Return-Path: <linux-arm-msm+bounces-115972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6TZbNIlORmq3QQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:42:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6D6F6DC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:42:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hVSYYrnc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Sy0d2lt0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115972-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115972-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34D7F302067B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8802451052;
	Thu,  2 Jul 2026 11:40:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBF44BCAE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:40:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992434; cv=none; b=STlt18++WHV+CYZMOqc16f/yl9g/rZZVDX2TTHspVLkQP4xCZ9HANwstv+d5KovcwGRaF8hAm5dmoSYaYdGeF7xXLuvh2cEh9gjmUosHpuF8Gm8uToi9qFF86mvnAHOhX2eQQb3NSEB0ixKk0xb7d/F8wmObvN2DFm4G0SR4qqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992434; c=relaxed/simple;
	bh=mZMDOZsidMvP4Sf7A/yARzoaVsw7RzwuGmMvlmFgEYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuiP4/MtUgbC/itVXYYzK1uxPJNIinKUwhWmeO28sFqu0V+YZWbV7DILZUizfH1WhChAhT870B92qQxYd8fBIZtLp79DYP/puEL9c28PtE3KPHWrvd9W6RnQlMVzHGimA9hCQb9Prnjw7CV9msD9nq+wC0aNLFvWqvnyHnKG1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVSYYrnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sy0d2lt0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KsQ04117155
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvIM1HHrlFL0l6iWI8La6WBY7QVoOM4JM/A6nRrd9as=; b=hVSYYrncySxKFDTN
	+hzAslwBpCCahQW05D7UgP0bmZ5MWcmElkxAfKrXLxyyIYR/gHzl9RkDTxHy+E/s
	bv9aU0Z6fL5qwHDBMXzkGmRgHwrN2G1pyebXEpT8E5JN0lHRld0K2T01V7mhQ2sy
	toOJWAiMjGEq5uJaOvblo3FByAXWqfZ/02MlCp2d/ex/UZZPSePU1H/R/1RfhWHx
	jwIPi+cIhdPdVt8syzSx0Dk3sdePz2qy9cjy9y2vrgIi2JwyY97UIyAmFOVyj+q4
	lEL7jBG9leeYPHCgkzMHL/0DB3Ok0fIcLzuZ8fpjcuzTH3WM9fvdKAUi4yQa/OL5
	TUXunA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bggtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:40:32 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so2001948e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992431; x=1783597231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvIM1HHrlFL0l6iWI8La6WBY7QVoOM4JM/A6nRrd9as=;
        b=Sy0d2lt09Sjkfh1vDvSUmY67km4SECpmOE2pVWTF/5aGHx2b2RJE4VTGBGoQn/kolJ
         Gw7GIe66HSVBlBQB5z2Bc2crE2vDAOXINjWDC01m2/Yl7AdlHnUbF/to/z0QsSlu+1Nc
         yz9XGSpWWoh2Eyrp2X9uq5lo5x8zj1J0x/WcY5Dh5C+ecBqoquj4BM3YgesCDby8gCDq
         OjOwLH5ztO8fxyGDxYHvZbyVoa0saWknA/Uq27GHqHjdl73ldC28TrC5K4Xt6db6lIm6
         vzYhRl07uvz15yvBXdNMY/Y4FXK9E12jrrH+UOwjOjmetSZnMM9ILPYIhIkG5jcWhWX/
         06yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992431; x=1783597231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvIM1HHrlFL0l6iWI8La6WBY7QVoOM4JM/A6nRrd9as=;
        b=WRkBRkJPeRaGuwDv1sr7KHk+xgL4c2gUyQTh77Ora12eQu0Utsa5BCMC5z8x5PjgXO
         dyLHwbCBMbyXE93RwXEBxMWssXjrFKs0PVk5695cfpmh1uemzUBpxibO1+Dt4YdWf0vU
         S/YQfE/OaATP1+WDsI3/dHN+56mDTYjKSGKD/QOzSlVOFJ3iuXXAI9a8vDuBGhztHSs7
         XwglUOr8bWfiYZ2Mkn2Fy87xmWgAtajd7T973myVxi6hL/x92pLMHvV27/1cBJJVvG/n
         9ES7Zdyv1UmotEB8lxqZtx+E5cfgRkfhyDkNPmZEsT26aQe9HkcV/N1FN3ULZWLsxLrt
         +SGw==
X-Gm-Message-State: AOJu0YxuRJ02UgNmtUV47nFY76gQvXvE+7oYPQqlDNLSl+TM3Ui8W9HU
	T7c4B3VZfXwhmaQKbASIrIAzuQye/KhEUveT8DgPLnjjflzq+3tl5rc9HRo7nLUu2Rs4xSudNWm
	272U64Wt0vJ6qvUvYRkGpeBmy2QzYfxDjUPONVPpE0SiOfV2ievOh1TEMsS75nPCFXxVl
X-Gm-Gg: AfdE7cleHbep2XwgT4ExglSNK6oIgRoiMpSj0CTCphyPnDcnCs6m903f6jfNGnTjDyA
	CqdX9oHUb7t1I/C3Sohtq4iFOJqI1r75ttlriEt2hqRXK1Eh4AZ5xNAUXVm9W6w40ihq+ckbkSV
	viN8xVmOc+H4aDxXi5GspuzgFmX/TOoh+RzlLf6FAv9+5gww2HBwqar3p+S35u1oeCu+R1icLMC
	zg4EolLa9yftWZfSRIJcGO7sJPpUItTi6mVOZFDrA1VhDpXldSPVimjA6MXQQ89H4Yn3ZpVHG51
	xc+x0BPmUut00TWHHabcsyursHGE7i2wOqUVMr/Qa0iuS3TMl/BzZN5VwClggjGTD+BbBGZXqZP
	fIkXMk56suEgPpXFfRuTYyIMRu+DvcPJTYZRfwxPi0lmE/h6ASStde/BUT1GdxC892BwywWJlTC
	a7T1LvJ/FFi6jfKujuEQgwaEqf
X-Received: by 2002:a05:6122:2218:b0:5bd:89bd:3559 with SMTP id 71dfb90a1353d-5bddf69e4aamr2427568e0c.9.1782992431482;
        Thu, 02 Jul 2026 04:40:31 -0700 (PDT)
X-Received: by 2002:a05:6122:2218:b0:5bd:89bd:3559 with SMTP id 71dfb90a1353d-5bddf69e4aamr2427553e0c.9.1782992430858;
        Thu, 02 Jul 2026 04:40:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991affsm626240e87.13.2026.07.02.04.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 14:40:26 +0300
Subject: [PATCH 2/2] phy: qcom-qusb2: fix autoresume handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-qusb2-v1-2-b5cf55621524@oss.qualcomm.com>
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
In-Reply-To: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5398;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mZMDOZsidMvP4Sf7A/yARzoaVsw7RzwuGmMvlmFgEYU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqRk4phLT9hZHptz2O7KfLs3K9OZFhzyFpChdtF
 KYg0OYYms2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCakZOKQAKCRCLPIo+Aiko
 1Q6/CACPuzxmqJ8UhIx9wTczhBRB6KVAqPOWFo1rWA5GjmYW7pDcCDuZhNC38MIJODmpfv6JQwc
 PkfFi2f4NX73BeWYfoDu9wMHqHtKaNmA9M2VDYeA14HIqY4spEk/tdL6z6M6FE+1fPtIT0HlmY2
 Bir8p3rB22cZWKyxa661hl0tXO+v5/29ObXngPsxr2AgGCGg3Dj4z8eUzZReDwiMafJI+tFbX1O
 ElwbXFn8rjH34xKOYYAUbOgEGs+OU4eqP4DaGennA9J8fJgSqhAdhad1DBVKfnDnEBZCwvdy8FY
 DrvVMYecwApMUzVoSL7F33fJtMo9bKSvNx6LbwYx+7I5h0Ao
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Lo0PgOvWWc1YFpw2qfdlwrl7v3-_5LG_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX34W9Oniuc52F
 0kmO7YNjGAZrv8XnQA7w4R27fr79vOe3NKw0UvkBhdtmIS50M3qid271OP2S2E5mgBPrGUS5rZQ
 Wg6QlqhX+wAoRBO+encXrt4Z5xQB9zU=
X-Proofpoint-GUID: Lo0PgOvWWc1YFpw2qfdlwrl7v3-_5LG_
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a464e30 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6YfJv8JmAF87wY5fNyEA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfXyXXRnWH3ygo4
 LC/p6jC8SSqXiM22a07FU8/I+XHQrkDTCI+4aUWXpunmc6OhAxM18Aq5I2NigOBzG1pRGmxuqV8
 cuOdhf0mkmvs/vaY5g7l69VYlm87woXJEHiSStpBfk0Y6313EIl+vmNCifBUV1O1AAL+4UcBiOz
 naMjEN7+gK5FQK/0jaMSouNyRky/+bshnWgmHpVRVq1Md30j7e70kwG/uIWUQODwppIiA7H/3aA
 npyhqGCNjjRDeUgUHvUL/UEbS90tWbJwDJTCU2nAfujGiSLHJxh3KrnvG+F/F8hrM9txRsyzqNl
 hA22nTMa6hbBAkBoouOx65qfyciJc0QfKqOnNMg4RB5nzokiuTZaMAIWTEJlN6xZntKSSWAgF07
 MT3okqDHijqbhwjEI7Teb860rVbsOReUzv+DDwcEX58xgOGfR+P/3M9qAnZ7gm7iBs+iacxcZON
 5WjOVTVIwaRuxH6vqyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115972-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DB6D6F6DC0

There is a confusion regarding the autoresume bit. Some verions of the
QUSB2 PHY have it in the TEST1 register, while on the others it is a
part of the TEST_CTRL register. When adding support for autoresume bit,
the code attempted to simplify the handling of those registers, putting
both registers to the TEST1 layout entry. In the end,
ipq6018_regs_layout ended up correctly definig TEST1 register at 0x98
(because platforms using that layout didn't use autoresume), while
msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1
layout entry.

Update the platform data to specify the register to be used for
autoresume handling, define both TEST1 and TEST_CTRL registers and merge
ipq6018_regs_layout and msm8996_regs_layout which become identical
afterwards.

Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 38 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 1109c480843e..ff3bc8fc2f18 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -131,6 +131,7 @@ enum qusb2phy_reg_layout {
 	QUSB2PHY_PORT_TUNE5,
 	QUSB2PHY_PORT_TEST1,
 	QUSB2PHY_PORT_TEST2,
+	QUSB2PHY_PORT_TEST_CTRL,
 	QUSB2PHY_PORT_POWERDOWN,
 	QUSB2PHY_INTR_CTRL,
 };
@@ -164,19 +165,6 @@ static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
 };
 
-static const unsigned int ipq6018_regs_layout[] = {
-	[QUSB2PHY_PLL_STATUS]              = 0x38,
-	[QUSB2PHY_PORT_TUNE1]              = 0x80,
-	[QUSB2PHY_PORT_TUNE2]              = 0x84,
-	[QUSB2PHY_PORT_TUNE3]              = 0x88,
-	[QUSB2PHY_PORT_TUNE4]              = 0x8C,
-	[QUSB2PHY_PORT_TUNE5]              = 0x90,
-	[QUSB2PHY_PORT_TEST1]              = 0x98,
-	[QUSB2PHY_PORT_TEST2]              = 0x9C,
-	[QUSB2PHY_PORT_POWERDOWN]          = 0xB4,
-	[QUSB2PHY_INTR_CTRL]               = 0xBC,
-};
-
 static const unsigned int msm8996_regs_layout[] = {
 	[QUSB2PHY_PLL_STATUS]		= 0x38,
 	[QUSB2PHY_PORT_TUNE1]		= 0x80,
@@ -184,8 +172,9 @@ static const unsigned int msm8996_regs_layout[] = {
 	[QUSB2PHY_PORT_TUNE3]		= 0x88,
 	[QUSB2PHY_PORT_TUNE4]		= 0x8c,
 	[QUSB2PHY_PORT_TUNE5]		= 0x90,
-	[QUSB2PHY_PORT_TEST1]		= 0xb8,
+	[QUSB2PHY_PORT_TEST1]		= 0x98,
 	[QUSB2PHY_PORT_TEST2]		= 0x9c,
+	[QUSB2PHY_PORT_TEST_CTRL]	= 0xb8,
 	[QUSB2PHY_PORT_POWERDOWN]	= 0xb4,
 	[QUSB2PHY_INTR_CTRL]		= 0xbc,
 };
@@ -294,6 +283,7 @@ struct qusb2_phy_cfg {
 	unsigned int mask_core_ready;
 	unsigned int disable_ctrl;
 	unsigned int autoresume_en;
+	bool autoresume_in_test_ctrl;
 
 	/* true if PHY has PLL_TEST register to select clk_scheme */
 	bool has_pll_test;
@@ -318,6 +308,7 @@ static const struct qusb2_phy_cfg msm8996_phy_cfg = {
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
 	.autoresume_en	 = BIT(3),
+	.autoresume_in_test_ctrl = true,
 };
 
 static const struct qusb2_phy_cfg msm8998_phy_cfg = {
@@ -336,7 +327,7 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
 static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.tbl            = ipq6018_init_tbl,
 	.tbl_num        = ARRAY_SIZE(ipq6018_init_tbl),
-	.regs           = ipq6018_regs_layout,
+	.regs           = msm8996_regs_layout,
 
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = PLL_LOCKED,
@@ -347,7 +338,7 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 	.tbl            = qcs615_init_tbl,
 	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
-	.regs           = ipq6018_regs_layout,
+	.regs           = msm8996_regs_layout,
 
 	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
@@ -379,6 +370,7 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
 	.autoresume_en	 = BIT(3),
+	.autoresume_in_test_ctrl = true,
 };
 
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
@@ -391,6 +383,7 @@ static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
 	.autoresume_en	 = BIT(3),
+	.autoresume_in_test_ctrl = true,
 };
 
 static const char * const qusb2_phy_vreg_names[] = {
@@ -678,11 +671,16 @@ static int __maybe_unused qusb2_phy_runtime_suspend(struct device *dev)
 
 	/* enable phy auto-resume only if device is connected on bus */
 	if (qphy->mode != PHY_MODE_INVALID && cfg->autoresume_en) {
-		qusb2_setbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
-			      cfg->autoresume_en);
+		unsigned int reg;
+
+		if (cfg->autoresume_in_test_ctrl)
+			reg = cfg->regs[QUSB2PHY_PORT_TEST_CTRL];
+		else
+			reg = cfg->regs[QUSB2PHY_PORT_TEST1];
+
+		qusb2_setbits(qphy->base, reg, cfg->autoresume_en);
 		/* Autoresume bit has to be toggled in order to enable it */
-		qusb2_clrbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
-			      cfg->autoresume_en);
+		qusb2_clrbits(qphy->base, reg, cfg->autoresume_en);
 	}
 
 	if (!qphy->has_se_clk_scheme)

-- 
2.47.3


