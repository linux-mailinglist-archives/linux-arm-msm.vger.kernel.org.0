Return-Path: <linux-arm-msm+bounces-116874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g+WtMKG7S2qBZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8322711F87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="OZR/QZL0";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WaAhJ1F5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116874-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116874-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2CE7304B06E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2430345CAB;
	Mon,  6 Jul 2026 13:53:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ADA33D503
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:53:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346009; cv=none; b=dJABr+FnmTTbqaTWhRytJ5UpVzHyG5XT3Itb56QozGOs/MdNi5G0W2URQ0gXgryus8u/ll10FbtecO26E69YYNfguQsvUN6A6b1ytpOora8MpqMHM6sgiKX3LOxEiRJgeKQQn0d0e0KMHW1Ba5ezYVbLz6GbmhMjTrwkER191O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346009; c=relaxed/simple;
	bh=0Zby8MYfFSRwktg6RL97bzxRA8Ua1+HCPzDewLrqorU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qA768EAuoajKXx6T5lQgbFg0nA0Imo0LBHwH40XP1CjP28xyjt7SxSmvbtAfRAGlYIB14LK/ANO86rbBKUKdXdezPF8VADWL7bvI5aZcQzd/z5olDYezHVK/vnDLifnTVfZl311zebzuRHbZMzvvJsGxA44zGEjWhWL57nnFojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZR/QZL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WaAhJ1F5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxF13387079
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdQpLezsbJjyrDZrcr7035e753eL68/YpvXIbeQOnNk=; b=OZR/QZL0Pimb89Ub
	CS2/OXbyJzhlMWNJcSt7uI+koqL9/vs8OeCEwMOzVSMvyJDYnJmMX1C+QixDsxss
	BWYYQ+J3l8Kw1Yo5L10SlfafvCrXzZ0SQBZkCxIKcJvUTOA2AZOSzex/mRN8rTJ8
	n5kCCB8rlkeaTgg0LmZPmwLcNiJQCe4Adt0te3yBj9ElWtBMlmNXBqqQfjhu9+Sm
	WtxrEAH4TEHfoTla8403m+F979QEcgymhcGlfi210b4K4h6/nQ2it3R36FX5K2pf
	MheHXZLuOQ6LkIvdpz/csCdT4ru8S52PWVC2sbB+Fq4VKzmizQtPt8R+HRz2R91J
	2zhw5g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0wuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:53:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so4588991e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346006; x=1783950806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdQpLezsbJjyrDZrcr7035e753eL68/YpvXIbeQOnNk=;
        b=WaAhJ1F5zMXlUPNbyENjxBfBSjtSkqrtTxp23wvLc4JNCzG1jTa6lTUEyBYp8jjpfS
         DPw+kF5h9z19ITNjw8m1hYGUM2rLg+aerIxC8WJwuputksUqSFURhcK2bYLuBlT554cq
         JoXDa2kLXYyhgXVoD4etF5r/swpvGOpRo2S93zzs8FY0x7DPYvmIZ7wP3xfafPnaDZs+
         8a1kNXZdk7az1jT2+G1Fp3MXa3Q5y+sTUR7HT4hJZDfN/mnljTrcqC3+G7j3UYorFLBu
         JnZ1qJ7Ym3u1iu3tqkP3hoLIfIYftBO2ObnkicIxI+FlhhGWphy/Pavh2pSEFsrLc6As
         gQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346006; x=1783950806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdQpLezsbJjyrDZrcr7035e753eL68/YpvXIbeQOnNk=;
        b=mYggKU7HrvH3e5Y448ouhf6AlXXIn4hTcJdtLU1CjxUcYJlU9vLD0aEegKxXD845yY
         vBXYjieSWhx2Do0ZcCS42L6N+Xsy7VNz0jlnYJxADc4JysCXn48F7/p4G2xdV37u0TY9
         8bj9BC0P/ZVyJGLB+1+IMXPKcIioIoVTU7GfxhUvbAADMqWbKxJ/qJxClwA7gtpp/NYa
         nyaCnlvnisGPbpL9x6kFlO5BUK4TOVZMpgesBOlrx+cMQvwVYPgCtePYBivkzXnlbxBo
         H/Uuu7ZWkkv9I6cRZwTZOc+h0PP9O/azmfXUx4PvPjus3KEEywVUWCa/F2BovhvF2YPd
         HtwA==
X-Gm-Message-State: AOJu0YzTGUj1vLlFSkoOsI/Qp4V0x/o9DTqy6OTJvaPP+1EhFAaFF8Qs
	E/Fg5AU/wXQJWtWnn8HEcTB3lpXwn2CbV87foxGqcQtn3sc1zVLce/rk8i9INlNk1dV4FOCwq3T
	VSjFCg+Xv2XzGyEfDgUIpfdQ/NEvVlgig7Fh6cb4umOfruNFjkZwlAz5G2PvIjLLHCDvJ
X-Gm-Gg: AfdE7cmt6qKrkPArkKgzhTKWUTlC+RAzqQpc1rmJGQ0sdaC4usC0jDo77kmbtaI3YxF
	5vwWMgIHMipPeoSMUB5oGT2zHi9sT9flyceGUs7l3ragFgcxnZPexloE2vFkJtUI6LgiYo+yDpS
	6TUJ3xK76qbamgIulqBzHpLZneLCmLproAkGl+4vEUPifYwmOrO4OSpQ0bKHT6YQsuNJOSwwPFC
	cZZvc1ySH/oZEtCMom298V/9XC73AlCSfco3/KZI/A5zCnelA4Y1cu/6QU91gLUC+gvC8bf7vAy
	lYVl3ciuKsyGVvdw5CjQIYFJJHy7vFKnXO72Tr69vt5dvSXHeayhMG+Hknc+dsNiFRniehi0uY7
	1ZL4BehXEPaAMjcjPkMktY0z3oNEUdN6lXh4pwOAhRIT86JzTvgPMHpVQiZv9H6tsNJfJFjkm65
	CcawElBAfivQPGurXqrGK+VXpC
X-Received: by 2002:a05:6122:659a:b0:5bd:a810:b090 with SMTP id 71dfb90a1353d-5be907f3f57mr369459e0c.5.1783346006369;
        Mon, 06 Jul 2026 06:53:26 -0700 (PDT)
X-Received: by 2002:a05:6122:659a:b0:5bd:a810:b090 with SMTP id 71dfb90a1353d-5be907f3f57mr369426e0c.5.1783346005707;
        Mon, 06 Jul 2026 06:53:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm2932551e87.16.2026.07.06.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:53:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 16:53:16 +0300
Subject: [PATCH v2 3/3] phy: qcom-qusb2: describe autoresume bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-qusb2-v2-3-8d9cd73b1db7@oss.qualcomm.com>
References: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
In-Reply-To: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6855;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0Zby8MYfFSRwktg6RL97bzxRA8Ua1+HCPzDewLrqorU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5b3Zt/G51eSOSvv2W9f23H9XezGZepRciU87W3H8jpuH
 jxTEnSqk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATqWdj/8NbGHIucOE7/Xiz
 6RM8hDuUF3v+M1aJk4g59o3pUtesNR/DNFaX5XSUNzC+CQxcy966/awH77I7sZz77HQ3nChv2HD
 f6YsTT//2vnebuXyu383o/RxnGcG+v7RzfmVcW9kFNVblwLzHph2LNq6X1o499CHurpN1sYkZE9
 MUQ7mlS/eeEQ4IN2npn/ZnYYuw8cdzUVE7dIo72mPN0vtXO55Xt9BaP41/3xuJUpcMMVdJrx1/Z
 jjUrT3Qyv806NtGM96zDEd+XzWLLNRVaXJN9wuYmtVnPm1SzEuv5ZrTH5ZzG87k/52cwBAjyZt5
 aH4kR6BF+fRkARbxr/znk10nfSj2n73P+3+tgb1DnwIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX1F2B2tinMaiV
 mQLvB0+07Mf6npex8a7DWPd+LCzVGNiqgQgUv07URLnR4Xuxvqlnu/PNgLM5SFyO+iSeOfl8CG4
 nkiJD2OG1uH3Ua+uXfLNaKZOQrExiNEzwhpm6SH7hBebevOJMEP9lAuwvR0lW8NIxBOtTY6wds2
 us+37e5Z+lnCxaBVgtYWXLtY/z8LZ8m6Phe1lHefXg4ZzldmXApanq12u14wIpmbK1ebh4aG8IC
 tXgORpxNvwsR6I8RgxezKQnY71AHjzQdqal7OcqYn7ve0GfXcJISFZc8bAdJRrltnLTv7AuU6sS
 WWlxfL13hP6kT0C2rBI7blbbmn4q5Et2uviQgOGYgmqh3tDpi3carOQsMY8otiXB3pkO93AeBdu
 YM3aZDcUSWU68vm6p6YLmw9s+/jTIGSjGe7M1gZwS2+OiJT2q0W2UpJUgvRks1XSEoldpv8+mR/
 gkjssDQsVJ3AkcU03Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX71/k+GErG7QA
 mg+LTbtOf/Mi3GLQRWlHwuu8okPrL58qZuRwX5ZcDS5syC/CQaN5W8wdAXm2pFyjZQ3qpFcaatw
 kgUJ2MV4M8Fvw0QDfIZWRdF+vcMWDCg=
X-Proofpoint-GUID: Gx90K5w_Dajs3yM9ujYeRqUWr2WamLy4
X-Proofpoint-ORIG-GUID: Gx90K5w_Dajs3yM9ujYeRqUWr2WamLy4
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bb357 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RF7xEcOzHiF0mxsXtxEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116874-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:mgautam@codeaurora.org,m:kishon@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8322711F87

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
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 48 +++++++++++++++--------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b1d34b080cfd..b22b3c6adfd3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -131,8 +131,13 @@ enum qusb2phy_reg_layout {
 	QUSB2PHY_PORT_TUNE5,
 	QUSB2PHY_PORT_TEST1,
 	QUSB2PHY_PORT_TEST2,
+	QUSB2PHY_PORT_TEST_CTRL,
 	QUSB2PHY_PORT_POWERDOWN,
 	QUSB2PHY_INTR_CTRL,
+
+	/* layout of the autoresume bit */
+	QUSB2PHY_AUTORESUME_REG,
+	QUSB2PHY_AUTORESUME_BIT,
 };
 
 static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
@@ -164,19 +169,6 @@ static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
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
@@ -184,10 +176,14 @@ static const unsigned int msm8996_regs_layout[] = {
 	[QUSB2PHY_PORT_TUNE3]		= 0x88,
 	[QUSB2PHY_PORT_TUNE4]		= 0x8c,
 	[QUSB2PHY_PORT_TUNE5]		= 0x90,
-	[QUSB2PHY_PORT_TEST1]		= 0xb8,
+	[QUSB2PHY_PORT_TEST1]		= 0x98,
 	[QUSB2PHY_PORT_TEST2]		= 0x9c,
+	[QUSB2PHY_PORT_TEST_CTRL]	= 0xb8,
 	[QUSB2PHY_PORT_POWERDOWN]	= 0xb4,
 	[QUSB2PHY_INTR_CTRL]		= 0xbc,
+
+	[QUSB2PHY_AUTORESUME_REG]	= 0xb8, /* TEST_CTRL */
+	[QUSB2PHY_AUTORESUME_BIT]	= BIT(3),
 };
 
 static const struct qusb2_phy_init_tbl msm8996_init_tbl[] = {
@@ -217,6 +213,9 @@ static const unsigned int msm8998_regs_layout[] = {
 	[QUSB2PHY_PORT_TEST2]              = 0x250,
 	[QUSB2PHY_PORT_POWERDOWN]          = 0x210,
 	[QUSB2PHY_INTR_CTRL]               = 0x22c,
+
+	[QUSB2PHY_AUTORESUME_REG]          = 0x24c, /* TEST1 */
+	[QUSB2PHY_AUTORESUME_BIT]          = BIT(0),
 };
 
 static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
@@ -259,6 +258,9 @@ static const unsigned int qusb2_v2_regs_layout[] = {
 	[QUSB2PHY_PORT_TEST2]		= 0x258,
 	[QUSB2PHY_PORT_POWERDOWN]	= 0x210,
 	[QUSB2PHY_INTR_CTRL]		= 0x230,
+
+	[QUSB2PHY_AUTORESUME_REG]	= 0x254, /* TEST1 */
+	[QUSB2PHY_AUTORESUME_BIT]	= BIT(0),
 };
 
 static const struct qusb2_phy_init_tbl qusb2_v2_init_tbl[] = {
@@ -293,7 +295,6 @@ struct qusb2_phy_cfg {
 	const unsigned int *regs;
 	unsigned int mask_core_ready;
 	unsigned int disable_ctrl;
-	unsigned int autoresume_en;
 	bool autoresume_disable;
 
 	/* true if PHY has PLL_TEST register to select clk_scheme */
@@ -318,7 +319,6 @@ static const struct qusb2_phy_cfg msm8996_phy_cfg = {
 	.se_clk_scheme_default = true,
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en	 = BIT(3),
 };
 
 static const struct qusb2_phy_cfg msm8998_phy_cfg = {
@@ -330,20 +330,18 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
 	.mask_core_ready = CORE_READY_STATUS,
 	.has_pll_override = true,
 	.se_clk_scheme_default = true,
-	.autoresume_en   = BIT(0),
 	.update_tune1_with_efuse = true,
 };
 
 static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.tbl            = ipq6018_init_tbl,
 	.tbl_num        = ARRAY_SIZE(ipq6018_init_tbl),
-	.regs           = ipq6018_regs_layout,
+	.regs           = msm8996_regs_layout,
 
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = PLL_LOCKED,
 	/* autoresume not used */
 	.autoresume_disable = true,
-	.autoresume_en   = BIT(0),
 };
 
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
@@ -353,7 +351,6 @@ static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 
 	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en   = BIT(3),
 };
 
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
@@ -366,7 +363,6 @@ static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
 	.mask_core_ready = CORE_READY_STATUS,
 	.has_pll_override = true,
 	.se_clk_scheme_default = true,
-	.autoresume_en	  = BIT(0),
 	.update_tune1_with_efuse = true,
 };
 
@@ -379,7 +375,6 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.se_clk_scheme_default = false,
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en	 = BIT(3),
 };
 
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
@@ -391,7 +386,6 @@ static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.se_clk_scheme_default = true,
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en	 = BIT(3),
 };
 
 static const char * const qusb2_phy_vreg_names[] = {
@@ -679,11 +673,11 @@ static int __maybe_unused qusb2_phy_runtime_suspend(struct device *dev)
 
 	/* enable phy auto-resume only if device is connected on bus */
 	if (qphy->mode != PHY_MODE_INVALID && !cfg->autoresume_disable) {
-		qusb2_setbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
-			      cfg->autoresume_en);
+		unsigned int reg = cfg->regs[QUSB2PHY_AUTORESUME_REG];
+
+		qusb2_setbits(qphy->base, reg, cfg->regs[QUSB2PHY_AUTORESUME_BIT]);
 		/* Autoresume bit has to be toggled in order to enable it */
-		qusb2_clrbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
-			      cfg->autoresume_en);
+		qusb2_clrbits(qphy->base, reg, cfg->regs[QUSB2PHY_AUTORESUME_BIT]);
 	}
 
 	if (!qphy->has_se_clk_scheme)

-- 
2.47.3


