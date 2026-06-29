Return-Path: <linux-arm-msm+bounces-115221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AgF5IVfGQmqlBQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:24:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73C6DE459
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:24:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=evSgZQlC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Nf7bxInV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 775513044F21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 19:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B463E3976A7;
	Mon, 29 Jun 2026 19:23:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BF639DBD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760984; cv=none; b=n6LZ+ZN4jSN3pN28JqqKQfH3MI4hwkqk4o5jJtDu/lKrynMFrAVMLZJ1F/BE+yXhKrw+dVPPY6Ww7PGdMSawOFkZvKmqLdy7dpHeXn+1kSo2K9EH9UkMYkWG7quD+ueJ+xVQD67bbLf4l2AlpU8tL231vn76AQR5ebXpTSrjp20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760984; c=relaxed/simple;
	bh=x9pPgdTso6EIovFSVop2osdIAIu/Fx5ph/TfnxYaKtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhHbiQomfI7kgA+RHqg+jo7+fcki9nbSlgHpBcsLXrURhfPDb1PiqwuUo5jPTU8aDdRKlt8HBbXDt+N3gIyxPTtBgQ8tFNjTMmzDzCIECqIlirVmm5w4qcAxOrfTOrP21SxrQwKUv56ZrDO9OsHqYaqXyhQdS2BYLjagJ5GvvEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evSgZQlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nf7bxInV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TIT9303764941
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBql9gcBZhxQh7BK6YGOj7bSZ4xiJfLOpbPh34tULK4=; b=evSgZQlCDaNRTGiO
	/89s57dCAOIFHo75DCDMLqlFc1jNuvh8pm5HqhwiTQhQn6/D1hZxGoKy1W0f8LJy
	CfhLLxx9N/Y6aHKJwwv+iyFIv9yODoQFSdkOgr0cnN6lva+o1689ZXqrmQ/it+fs
	L+XMH5dAPvOYvJrKCI2kMKqD36WahXLRdrl8jjJW8z5L3QJmyY267BBPRPOHhGUX
	NnRkm+xbxct/mMJW4kZsFSlEP8/tIIlzBE5bZWLSgMPhWsZlHlQOklWtFkNpVEEp
	W9ZgF+6BjLNwK0pn4diHbl+7QbptZA5p20N8B+ObEsi6/73atEz1VSGG4eP0H1bL
	T0+RPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cr71c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso190698285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782760981; x=1783365781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBql9gcBZhxQh7BK6YGOj7bSZ4xiJfLOpbPh34tULK4=;
        b=Nf7bxInVLH3YZzcl78SooazP/WFn5jZLe/n7PbNMGWwW+6H2Knn6TDR5c68YTLvw4I
         2Um0LSThI4QQ/hwgSfAWIFu/Hz3ONzXhfS6Rxl7fF6DkoImHc1+bBXp/xhi+q76nviM7
         n9RVmLAF7WtRdHbmVJfZLjth6DKKLNd48Aq5E6hjES80+Z7H5jvevq6luAex710OOC2n
         2/kUeestOhm14KhlFO1y/xrb+oy7Z9KEU3+DRA/Jdf5mpMAmftFsx2rwmPnmJ5dTjRrs
         viQY2FaxiKPvlu8pK5YCHd2GDntig5rA1EHTaJsdg0QrDCNqtCNYAprQK7f8z5kXGqQU
         nITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760981; x=1783365781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oBql9gcBZhxQh7BK6YGOj7bSZ4xiJfLOpbPh34tULK4=;
        b=rb5CvECQ+CbuDYBP8LJLT69mZUGGFBXD2et9Rp+gtfSCi6Y3B3oqY8zuk0L2Q0muc6
         xwzQvRquSsE8X5orv8JK004bAzumYhMW/atd7S9qGK999JefB3sehMCcmhyxaBnJsj8+
         FYPsqGwBILZDLeQPR/aD1xatZGj8KeaVG3Ok7uMayH+5eKnRWwb2RqwFDsyqj6HTVcyH
         sZyTvwCk5a6eb5nGzaC4mAX8wx3xjjVuUvQRSF6K6kGyJjHEX6RfsngVTtSSB+8j+UfD
         PCiPGYQh+8BHdsEjnasUAh6fZ0bFcQ9sSafcgxHBi2u65KvLhss6XI8/E6Icub2aPWPn
         Jqlg==
X-Gm-Message-State: AOJu0YymzmDcZVqolY6NX0sFkFk6+pxiAsB5W+NThSV/3bKjkFRO/58S
	3zt2O4rgA1mZX+aHIatfxSPs5Da2h+f52m9A8larATIvRDjJmt4OM8VW3dDblpkF86rqu4hlhHN
	vqEVSg2mQYqwO/gp9Yi6iSMZKgmej2dgaBMsuugS/wlKK3gl2f2rUF6j86zyiItT6oRPIc4nM2e
	qGTeA=
X-Gm-Gg: AfdE7cnNV+3AMEqHJk4o9nA6B932QJest6VMM2tW5xvHVGQVr4Rwf2Ydh1ZEHr6m3fl
	wWKn02M4QN+nJzDrPrWXHfCgx6BDsHevDUYlXitnBPpJbvyoYwb+kOv6S6e/zoC9CYHekluO9xi
	PmASXkt4mSPnsJ7qXUn2HTIViRKk6GFsaCB8du+osQ1vpgNSbUMYikysgLuPrEBEaat+PvLQQ4i
	7gKvzNShZcidWIW38wzKsz8H6+uUzBnJhI+I81DZotU0JNmYi2TLqp8qd4d3iqobswu+cxL2vW5
	iIjAZ9YqPYwZaWcIE8srYxMGJyFfoLXFneLpMqJbqtYdZ2qT/A1ucknPFHb0cdgrhXovUjqRgJJ
	GabKwAtJFhh503c5ei2nX1R366VJx+3E7G4+JMD8naq1nrLdLzekQEAsuzfM4EzzppKj4IsipOl
	9NPmKezbTjD1KetfFnf1cuPoP6Oz+CYIfSrmlPpYqWMT06Uc8FdrUmTfxGjWzj+VICXfrT6ToLf
	qu5lJEeIxbDz8RdrZYR
X-Received: by 2002:a05:620a:4706:b0:915:b9f6:719d with SMTP id af79cd13be357-92e62785bc1mr152056085a.30.1782760981109;
        Mon, 29 Jun 2026 12:23:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:915:b9f6:719d with SMTP id af79cd13be357-92e62785bc1mr152047085a.30.1782760980374;
        Mon, 29 Jun 2026 12:23:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475674af239sm308506f8f.30.2026.06.29.12.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:22:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:22:55 +0200
Subject: [PATCH 1/2] clk: qcom: gcc-qcs8300: Use retention for PCIe power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-suspend-v1-1-b601d8a2f2f8@oss.qualcomm.com>
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX6Bm0R1JCRsG8
 /mWTpk2Fevqwh0BQBfPNwI6a1L5lDJcRZenTMaRJUJWSyPzju4D6utz0kfYRA/CpwqwJ+LLszdj
 kjKT2ke5VenmWt+R0kxSWjNCvfuEKHtQ8o7wsr25WJD/zVgfpqqDOfBkJV3epc7TJuerC/vozP2
 X4bVAvGC4EMR0/CQGfIr14VmPiZuXYxZ8WU7fjyFBNCWy9Qsdu6W57SvXp2pboKgr/KGiwLYWp9
 WgWD/3NEPJtfptcxSwleAZMZwOohUbHbm/XRmnUs+ei7pHcxTOc6bfHpEvzcPRpme7XvKwfXGOL
 VHfOmaNzU3ZnrYjtqfAM9sZxIHi5Qz15zS7ZYyLTFcuYerP24yIhTiZmRmVRbAN5RqzfMIfLRXZ
 lBSLkbSkFACPnQW1E2Y6lLndvIeGH2fmX+YzlRo7CBiCEms/5pKCZTkSEdUNRQm4YpvMEe7bRzK
 8PrqleFJE4kJdbTlIKw==
X-Proofpoint-ORIG-GUID: 4vYmNEStijrSnWleh5bsTgv-oORueNuM
X-Proofpoint-GUID: 4vYmNEStijrSnWleh5bsTgv-oORueNuM
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a42c615 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=K4BkOEyOW4MAsK0yrNYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX8k58MzYsw+y2
 j1Vb9PPfBWmGRhgRXnBU+qiLZJs+OMB3fb8t7/VPlBQfUgvmigGu+bpSxCZ5IhlXyKkKKIW7VB5
 tM+9vc+16uogqg4zafoxWX2QpHVvTh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115221-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:quic_imrashai@quicinc.com,m:quic_tdas@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF73C6DE459

As the PCIe host controller driver does not yet support dealing with the
loss of state during suspend, use retention for relevant GDSCs.

Fix the PCIe link not surviving upon resume, and GDSC error:
  gcc_pcie_0_gdsc status stuck at 'off'

Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 80831c7dea3bcde0ced46054783df02b07a985db..009672b75fb9099cb0c6db7af3863654f2fa6648 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3268,7 +3268,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -3282,7 +3282,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 

-- 
2.34.1


