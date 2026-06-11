Return-Path: <linux-arm-msm+bounces-112651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id In/AD+J3KmoQqAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:54:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F236700F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:54:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WeE29izH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dd4cEKGF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112651-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112651-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB2DE306EF22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F513BAD94;
	Thu, 11 Jun 2026 08:52:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB338F25F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167968; cv=none; b=Xv1AsEqEInPJG7d2gSuGMxafunubQdhbVnntcH9RiB+6waiBstZc56rwJiHvmOM2l0Cv4nvRGIkCYt0vQGJBN/BL4lDcoO8WY//93HLS/Qksk429vxVAj1mJeAuVo7HjqgxL9A50iO1uHDlBMTYvOYEtktLnfmDCgcc5FjKjE1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167968; c=relaxed/simple;
	bh=UnT9kdkbdsjpn4mNUqtDCIOq/OqOL9pEQDTrclzHgsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnMJw9/EphZKq/g1RYdg2w2J3GS5OnCGAjnlm5Ri969vkqP+BnsVQV2q8BruN4m0jzwtYk14+ybR4XH034t0YYTIlUeMf4aoJnrJHgJkBHcefmfpvHZTv82PqWGJ3NpJNM2IN8PFDGQ7Il+WSVyKOPJsqeYUyi8k++YtJkswAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeE29izH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dd4cEKGF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GYUh3812629
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=keTHpmzLjiKKvVsrQmqSQw7rrdCYjGdElQI
	+2DcEM00=; b=WeE29izHjkDUX+aTDNAtxH31uwusBX9GvpqkwJqSdGhbOTCJUbk
	x+qoGbLmOHmdcGYrEI/VGiYfAfGIyshjRuelaNGK4v+q206hDifkuJbgwyJUhkA8
	5kjN/ltPZ2OOAnwsvLzjGmqNXbP/cBgNlKWLzkE0tD/FElJXpigXEO7Rit3pX/0b
	B3rlPTSyPX2n3GSWLIMAxwq33FOkcViujxzQ3VJXehnT10oogK2zUA2NJWEHQPRj
	pHvIvadk9NMuT5L+nnQYhzCNQAJWovNigTbxxnU9fA7eyMxyA9N5UeKM/nq5l+g1
	VToAYQnSYAy4RCNil1kM0+fH/P5KMojg4EA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71jn2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:52:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517878a92c5so170995551cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781167966; x=1781772766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=keTHpmzLjiKKvVsrQmqSQw7rrdCYjGdElQI+2DcEM00=;
        b=Dd4cEKGFkASkzCtGcQOFn9AUjLEtaGWCaE9mkUdzsBY8dcEGzQPh7kHyRqp24YpaUS
         k1ujEF+sPdX5g4rsYK1bfw4MRgoxuuAuRdsF67XetGWNhWsarxbPwt95e6sqBnhmB/rO
         Yp1DKCyZWZSIG5Tl7VEiVFRF+lVbH5MKARnYsd+MufA1GcThD8I5NgMOL8zAPWO7/2fl
         5sUiDQF3FHFaSWO+z4hU3UDx3PPCKivpMl0wIciYOJZe0J7+gUuF0kDevlK8qJFeGp0K
         XIYc2PIQj0pfMK0Wnu3QliB9Lchf+EpAcLlBV1+CasVcB7JBFXwQIClVIFJBTgxaCtG7
         OGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167966; x=1781772766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keTHpmzLjiKKvVsrQmqSQw7rrdCYjGdElQI+2DcEM00=;
        b=bLZGHnuZX54XGbV4NNgDvZljTxvJcmDy4FYQFTV0NvU/guc5M6J3nbJcCxNLQBZfG8
         pJN43Ox6CN7eqFUc2wx7wgFvsudm9DQK1Gx9shMrBu3Ac42sVAlAqhyGWwjB8Ppi2Edb
         14xJUyLl/uf7guPQnZcBfM8K0iW1eDIGhuKswAvze2sDxnfm9ZMc+4MLF9v8gn9ykzCh
         oqXouNKLohR73xlsVmJ97dEDtLM09ZM0tjZyLBiaZVXRev0x7pm3FABEc7G87btqO4Di
         Um30z79Q0/MGWOHsZeFeqjDQCBK5ELe0rQQamcrz8s0Z6y6RCWSt3nxz+CCNoVhOO9w5
         0CJg==
X-Forwarded-Encrypted: i=1; AFNElJ/YZckvWBP9SZU/bfwh8wrbNzwvxaBKpqVVf05iBbwVDutmor7519Jx9PKanJ73dsx89uzicLIHIGpumw38@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvAE6jSXaKtDsSEkyLydBR4sL04ZrfwMyUxAIICNodXdF8HhA
	AR7Jq44CUaAOeeiDxZMc4hszefJ9zApyjm+AXI1aHFNCF3QSvg1v3qSLsY0h/zcMBjXh2ypPYxr
	PAIHO0Qnv63oE2dKWxiCXNE82djCj1oIiANBG2+eXgQspJnORIHS0r0CrdxvZlAvF4cUa
X-Gm-Gg: Acq92OH/7NwP+DTitL1QlqaRq2Iep2cVwlZbqwmAlzd5/UXH/HcyeiJNprYnjaz662e
	v4G5SQGNhyir+fIQtSk1+4g8GTavmMR5X+q3/f/asbw1g2zEMJvgyC+WDpcpylnA6TNBBd7fqhl
	pN2gbFJ/reKekIGRjzq/mxpQ9yBSBzEGb6q33MDocdnw1aBlB0QXK4iWXYARmBHF1qT/dL9TfHe
	koOxfkGIuvvrw+tXTFzxXcilRzWhLlzEgZjCULSr6E9dY7ya6wPZgwbey2d/knu4VBwuRMN4Wu3
	hRoXyb6EVF4kNZu6rVprf+3dkXlVDNZY3uV1v/pVkC/mzLibWVFm6/x8/P0eT+Iiwy0NmUhKhJc
	URIKMCfNZenltatzLkr0QsoeBPmr4asB7PbZTDxFxY/2+qvVZ
X-Received: by 2002:a05:622a:4890:b0:516:de71:e21b with SMTP id d75a77b69052e-517edccc944mr29945231cf.9.1781167965919;
        Thu, 11 Jun 2026 01:52:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4890:b0:516:de71:e21b with SMTP id d75a77b69052e-517edccc944mr29944891cf.9.1781167965397;
        Thu, 11 Jun 2026 01:52:45 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm76083078f8f.25.2026.06.11.01.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:52:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pmdomain: qcom: rpmhpd: Sort table entries by index name
Date: Thu, 11 Jun 2026 10:52:39 +0200
Message-ID: <20260611085238.37666-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3516; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UnT9kdkbdsjpn4mNUqtDCIOq/OqOL9pEQDTrclzHgsE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKndXbKRGmWRasFfy27iyWTGMrPElqS3xFVh2x
 X18SXt1oiKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaip3VwAKCRDBN2bmhouD
 19/2D/4g2nn/PLcrm4E0rHxhtv/FVpdeNJkvhBeYSAcbl0hdd6Adf7/dAratbIxWtjHRvvQRG5g
 m8Gh42Ot7925DWiwlhK5UTYPoSTIdJOnzofCPsvdFiK60BGI0jCGyneSHkJ3Q1MZV/W2UAUN/Q+
 snCv8TbAvx5A46Ro2xiTkgo64vB5K28Dt3eO+hzDnkb7tFZTJxiktg/UTY/s+raB+hXdLovxKbs
 ov3QB9mnTz7P8eqyT+eU2Zit0TDhcbcyLNRrULnQQT0uAHTjEBj3wVszH+O8bF58QPArkEKCqch
 pNo3a0SmB0rbBnWyEnaaGTCIhJmZPp5fUCQEd9GgHWzWI/d12a92jUA8i4wz+jKLE2wWeb2bcWh
 sDCWZgcQMS46dwjgK2mW1ErT4pZRSCiKvHUKxvGeIlykGsxLPah0v5WVBCLZf0DtVqix7N1QIoO
 UsekWhXoapmEE1v8BgBmfeODjIC0HTtLuoEkDObOootOwRN5ie9F0OgnXqN4GGbHZ1KiEF/I2kq
 bi385V0ltux98lj1rJS+O7gh0LGBCvocBW9zwMimWfxgpzChFlu+hDdKmQioJAof6xaQQG3nzgs
 rlpCkIvnaEDdzT/9XhJbzeGPvSBq97bFRwgGNUlscWUojN0Vjo2Fg9Y4ea95SH5wdbzCbtrn4Ng FzTXVSraDxVyJrg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9WYLtw5xrIREKu3tEqc6SSDBknRQEr2M
X-Proofpoint-GUID: 9WYLtw5xrIREKu3tEqc6SSDBknRQEr2M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4NiBTYWx0ZWRfX3ltq6y21K3Mc
 FLujBRaH9/uGCthU97LwIiR579/LqKhS5MiZj0xNg9TpC4Yp0bpSmQoTHuGgnyDuZT2vVsFsZ9v
 sMXrRNcwWUa+GIoF8YqjIfYdLas2ydUUaO/zVZcTJdk3QVb0qVY5IlvK0FyRX++rJoo3PNMp05l
 ZgTTcbdngUzjZZWC0fTkx9bDS/CyP1c2V5JI2EuLWtK0VZUvdg9y6+QD55G0CH0rvouCqkJraNl
 ltG717/pU5rJmtjE4r0X71pVYR17E4QE/kGHTaUqrVrZZc4oJCNA3rxt6W+QyEwY5lfXD88FdX8
 5irjp1CxpoArDzaJlEmekJSrYj6/6MO0gKsF4pIscJ2VYd7EpTwltmjonjs8be/NagxHMPtSKT0
 eZHvCpysr6flIwHmzpru705qdOSb6WFHJuudISpC+slnjedA8vbjGPWryLT5kFyekhIYvBndfCA
 bB0+8rSLfv/JRlzD6pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4NiBTYWx0ZWRfX2vGtkrzYFPI5
 AsE8vgEQGmd1ThzB994khRhgjSliox7NuwhsDUru5JZ3WEVQw/wWnogSuTZu/dlQ+G0Kl6WBHE0
 5HjkU5bJ4pxhg0UkYxgBQJZRaU0/O70=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a775e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hZapHZ590W6VK0aE_pEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112651-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82F236700F9

List of power domains in arrays of 'struct rpmhpd' are sorted according
to index name (the define, e.g. RPMHPD_MX), not by actual numerical
value.  Fix few sorting mistakes, so comparing the tables between
different devices will be easier.  No functional impact - same binary.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 63120e703923..c12127d8e8ae 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -305,10 +305,10 @@ static struct rpmhpd *sa8775p_rpmhpds[] = {
 	[SA8775P_LMX] = &lmx,
 	[SA8775P_MMCX] = &mmcx,
 	[SA8775P_MMCX_AO] = &mmcx_ao,
-	[SA8775P_MXC] = &mxc,
-	[SA8775P_MXC_AO] = &mxc_ao,
 	[SA8775P_MX] = &mx,
 	[SA8775P_MX_AO] = &mx_ao,
+	[SA8775P_MXC] = &mxc,
+	[SA8775P_MXC_AO] = &mxc_ao,
 	[SA8775P_NSP0] = &nsp0,
 	[SA8775P_NSP1] = &nsp1,
 };
@@ -325,10 +325,10 @@ static struct rpmhpd *nord_rpmhpds[] = {
 	[RPMHPD_EBI] = &ebi,
 	[RPMHPD_GFX] = &gfx,
 	[RPMHPD_GFX1] = &gfx1,
-	[RPMHPD_MX] = &mx,
-	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MMCX] = &mmcx,
 	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
 	[RPMHPD_NSP0] = &nsp0,
@@ -480,9 +480,9 @@ static struct rpmhpd *sm7150_rpmhpds[] = {
 	[RPMHPD_GFX] = &gfx,
 	[RPMHPD_LCX] = &lcx,
 	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
 	[RPMHPD_MX] = &mx,
 	[RPMHPD_MX_AO] = &mx_ao,
-	[RPMHPD_MSS] = &mss,
 };
 
 static const struct rpmhpd_desc sm7150_desc = {
@@ -698,11 +698,11 @@ static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_LMX] = &lmx,
 	[RPMHPD_MMCX] = &mmcx,
 	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MSS] = &mss,
 	[RPMHPD_MX] = &mx,
 	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
-	[RPMHPD_MSS] = &mss,
 	[RPMHPD_NSP] = &nsp,
 	[RPMHPD_NSP2] = &nsp2,
 };
@@ -809,18 +809,18 @@ static struct rpmhpd *glymur_rpmhpds[] = {
 	[RPMHPD_CX_AO] = &cx_ao,
 	[RPMHPD_EBI] = &ebi,
 	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
 	[RPMHPD_LCX] = &lcx,
 	[RPMHPD_LMX] = &lmx,
 	[RPMHPD_MMCX] = &mmcx,
 	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MSS] = &mss,
 	[RPMHPD_MX] = &mx,
 	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
-	[RPMHPD_MSS] = &mss,
 	[RPMHPD_NSP] = &nsp,
 	[RPMHPD_NSP2] = &nsp2,
-	[RPMHPD_GMXC] = &gmxc,
 };
 
 static const struct rpmhpd_desc glymur_desc = {
@@ -834,15 +834,15 @@ static struct rpmhpd *x1e80100_rpmhpds[] = {
 	[RPMHPD_CX_AO] = &cx_ao,
 	[RPMHPD_EBI] = &ebi,
 	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
 	[RPMHPD_LCX] = &lcx,
 	[RPMHPD_LMX] = &lmx,
 	[RPMHPD_MMCX] = &mmcx,
 	[RPMHPD_MMCX_AO] = &mmcx_ao,
 	[RPMHPD_MX] = &mx,
 	[RPMHPD_MX_AO] = &mx_ao,
-	[RPMHPD_NSP] = &nsp,
 	[RPMHPD_MXC] = &mxc,
-	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_NSP] = &nsp,
 };
 
 static const struct rpmhpd_desc x1e80100_desc = {
@@ -860,10 +860,10 @@ static struct rpmhpd *qcs8300_rpmhpds[] = {
 	[RPMHPD_LMX] = &lmx,
 	[RPMHPD_MMCX] = &mmcx_w_cx_parent,
 	[RPMHPD_MMCX_AO] = &mmcx_ao_w_cx_parent,
-	[RPMHPD_MXC] = &mxc,
-	[RPMHPD_MXC_AO] = &mxc_ao,
 	[RPMHPD_MX] = &mx,
 	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
 	[RPMHPD_NSP0] = &nsp0,
 	[RPMHPD_NSP1] = &nsp1,
 };
-- 
2.53.0


