Return-Path: <linux-arm-msm+bounces-116293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +A2XEcmaR2orcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:19:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B22D4701C19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:19:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fiy+3sYJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g+ftBDvK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116293-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116293-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 051FD30CC128
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2273BA244;
	Fri,  3 Jul 2026 11:14:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F33BC664
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:14:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077243; cv=none; b=iFuPesV2AsLHy424AFUavmiIQB8X6aJ5nV9dkKEkcwzVuZSxaXaZFCoKNvw13qOiTZDVKyhVUZhO40+530z+qvAmjkTWnWzVjYrjpj7vUEmaMto0inA+9NhuHnrL5u68dvO7oUtNpLNvyFBYm0UzP43T4C9e7sCJHUUhHWp+D64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077243; c=relaxed/simple;
	bh=jgXcpjbDSDiYM2j8SMXtXfJmjeOAt7TDNTcEYRT5SuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAmxt8kwioJqJLcaaO239Bd5BrpRSchbXWC1+L1s9hajmTteRhTTXwcGpyReYGCL2rr9RNJ9jj39bp8U0UU2TCBtpCzHL2rhJkA3w4D9n44MK50di6drOTlyu1/4dQwwVyZsjlIxMZmziUkj8zD3LDLNPJ0PUSrAN5AWaRqf8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fiy+3sYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+ftBDvK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IWFS3195271
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hc3pHFnXxHDFWcSnu+aCSp6MZ+FCUOvJzOmXLiQZnZ8=; b=Fiy+3sYJLs39S8iM
	3/C1JbMin7ZxwH7k2NZZdwrxrnR0pRGz3aTvIAIDHhyGMciKYQ2Toypc9Sl47StO
	z3lOk8MonBk9h1xm3I4mz3+GDQIKDVT6jmRKT8G25vi7yRPlE5MLVVHygV82tOI6
	lRK8cedzfheJBTZDAfbVxtlbX9J/m03+wCb9kHw8xajxQPrFp4BtqYqrcYmRM7nQ
	5GiCsFMOQKJud7JkKZaV85TLfXsImMBfLTx8R6FYiUh5abP7hdlYKEqCrca+ztGO
	qIvzCFK0JAzFnT7rGkP1Nj0Yj4M38lY/UHqXb5ShTIjVxrGY0OvmztGiH+I7odBJ
	EAGTug==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrue5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:14:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so668975a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077240; x=1783682040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hc3pHFnXxHDFWcSnu+aCSp6MZ+FCUOvJzOmXLiQZnZ8=;
        b=g+ftBDvKSjqLERR2GPjMhgZlAFN+QjZ6T7u7JUHQKOa90mCQBNq8kb9LtF5BhcolnT
         84eZwgJypV3h6kxSQKlXhk+HswDlHfsPLT6IVYX1DEjScBKf+Zgnsyeo0U085u3RxCmX
         vvjDPbwPKHXHE04lL17GfHqSpdj26t3/JMesKgFYr0+1zHfTXJq/cmEEd4aTthTxYdP4
         rP/jTPxV4gtElm5T0zZhCWMg3mh4mqg1AiAQQnT1odePTAVJ2lb3uacct2rkrdWPT1M9
         2J3FcCM8ECyo6eXhc2+l9QukoH6YwEIMoIQ8RJFhJVMz1uu34KOhcymvI3EwRrPSpK9r
         fXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077240; x=1783682040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hc3pHFnXxHDFWcSnu+aCSp6MZ+FCUOvJzOmXLiQZnZ8=;
        b=PgRS9JOfHblm0dwPBTau0bRnbZAATxe0rPwJH32cI/IipD1rTtylet+BOgcOqv3aLS
         NAXxNoGhCUQdWHsnQphMJqMifv3YnSGGKKMVpAAxj/29gKwc8QuMQ65K4tvsbZmPG1t8
         B00QXwXw+lpLPJAAOM6L7LZBDRfLh5F2sJb+66CvwCy6wPvJXjmp7OGXDmfvSdLkNZFI
         qegfUtrKVDa0SyD9nEsZlr+wehOyR7p25o3ZNGJQrwh8FZp3BhD1Xx4GIiwuepb85Wkv
         9B7NeYdFyoWfF7mg5mCvfoodbxyL4vL49HgqEFZ/F1IWfD2OMdjby9f7uhH8Y61rOawq
         WFKA==
X-Gm-Message-State: AOJu0YySnBBda71cu/2P93ntNH9RvcdJn2AZijvp7uJAZ2wE3Do7sFkA
	J+fXQDbumLUnvu/VE0G0sOovQ2v2RSlUpjr9jFenIKlLcjIOjmZK5v03I3rsDIKuhDnI2b06FlD
	wLle5xw+zlPgitiRyQknYu4Ymr7SjIj2Uqax7BN5FsyLMMtpgQbIaOAvENo0QFrDSF790
X-Gm-Gg: AfdE7cngFsV/tRVaFUhQw0XSblFEdK1TbIPkjUYORHkU0XDAnLio5bTEw5C7PLWZp8v
	yi7zVnrn5Tr/xxty0Ic8WLqivHACfQ2TuX57Pte4PS7CiE4YFNouAGwp04BZfZYsER8plynHkUP
	E7FGrvhke8spsdpbN14S7EpYPpC4zUNphYRKbtX8G/lwx5R7B1R+j+/PfABR1ZGqDcihA0f0scL
	hPmnycdvi1UHuV6GMisAg7tJDU5SWp37UGrwB1LmVRDLx2G70SWz3zA3YiPZ2AedtflVHZ9z1o1
	jPMfzJpjmmvLYwPCw02yKZ8+dxEiHASCbZB++wgl/58snV1XUoTeV86kZI6B0iLkcmqfJ7kfssC
	fA9DB8eLmNViHHeIJ7EM1H+GtyvqyNqqGftpunWIs
X-Received: by 2002:a05:6a00:8d1:b0:845:dedd:89b1 with SMTP id d2e1a72fcca58-847c082cc4amr10323105b3a.34.1783077239714;
        Fri, 03 Jul 2026 04:13:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d1:b0:845:dedd:89b1 with SMTP id d2e1a72fcca58-847c082cc4amr10323077b3a.34.1783077239196;
        Fri, 03 Jul 2026 04:13:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2729490b3a.33.2026.07.03.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:13:58 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:43:42 +0530
Subject: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077228; l=3101;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=jgXcpjbDSDiYM2j8SMXtXfJmjeOAt7TDNTcEYRT5SuE=;
 b=Wxlzf2ipWyji6rBsDVJfGMgAEbf2eSOZlPI807vKnwHyDOfrW6MvCH8+zTGEnVjF7vyiGmDTG
 8OJCSvbAxdaCKuMLg8jB5PjCSpMsBWLceirOgIcY+LgLNMlKLsb07Xw
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfXyqjzC/eOivf4
 +yFHx6+6XTVOXONsIWatxPQUtzdFOXxJgtJfrtg+JiHT6JOyzbQa//byKLED4+rWbe8edS2iBMc
 lgnWBunSG6sHEhKiFjyIG8p2msKjv31ArgBqs7ZNo/b9XDhAG4hlpuDKCR7j//JPke+fHXo+RwU
 DdhlzvmMuqlKnazfVC24sFQxKaxAFZzVPFDPE2Fg/rfmgxWLS28+GGZUr4/+Mo/siNbb+e9vpaS
 L1oAPsPXK7hR1J8Tr9W0P7HvlsYpgFbrCYsT8H35oLnHJjyQS2C16uXgy3jcxkwhXAfmd47OGTL
 kHFygEB9LvBf0xHESIky9dxuXr9uKDxZoeWazC+vpvPb/+N38wJviPrveqspH8epXqHUXHpnrZN
 rkrvmaM8WOlhJtkxQv2+sS7anTMvRgzygtzYxPrR9CUkpncDAlsx49+T9DoEjLDZEQs3aABe5rO
 aL+Emin/FepvfEJAAhA==
X-Proofpoint-GUID: 6zkYr-XG0nN28vMuVxn25Yc0tRYprb7b
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a479978 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8CqzcAHETZK6sRVTLr0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 6zkYr-XG0nN28vMuVxn25Yc0tRYprb7b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX5J40vHx5Cwei
 nWKXvW4HfpZ5QXZ92qfOlhpmYR8jLE85YOH9KExpiBX6ZoavxJsXk9qw6nOk6JRTr1NNvV+cdpt
 qyao7VB0MVid9VG170YhyjtLbv3zoRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116293-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B22D4701C19

SoC sleep stats are present in RPM message RAM and subsystem sleep
stats are present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem sleep stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats
configuration, along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem sleep stats      | SoC sleep stats           |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading
subsystem sleep stats from SMEM and reading SoC sleep stats from RPM
MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC sleep stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem sleep
stats too along with SoC sleep stats.

Below is an example showing sleep stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 2e380faf9080354fae120e74f0b9bd1f3786d3e5..2f1615e583bbc6ea596d8b73d9bb0a2a00953cfb 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -376,6 +376,14 @@ static const struct stats_config rpm_data_dba0 = {
 	.subsystem_stats_in_smem = false,
 };
 
+static const struct stats_config rpm_data_shikra = {
+	.stats_offset = 0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = true,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data_sdm845 = {
 	.stats_offset = 0x48,
 	.num_records = 2,
@@ -401,6 +409,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ .compatible = "qcom,sdm845-rpmh-stats", .data = &rpmh_data_sdm845 },
+	{ .compatible = "qcom,shikra-rpm-stats", .data = &rpm_data_shikra },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);

-- 
2.34.1


