Return-Path: <linux-arm-msm+bounces-115722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tXJ1EtoYRWq86woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:40:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B69986EE3B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:40:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VVsOCYa9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IjMFwe1f;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115722-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115722-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A8F6300E613
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BDB48C8C4;
	Wed,  1 Jul 2026 13:39:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1CB48C8C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:39:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913166; cv=none; b=iT1RUtIr83uy0LIrQtXnTeJyknhzcWrdD0haevoAMXsZQm5xylANzFPzoBmUf31ufCgbAl3bYfN4XLlLb38sbnlyaLO2A/s0ep1CARZgf4L87Ix2liiMl3kj7Q8jA0JYj+nFO1k9lN0UL9BNheOPfFVxACEFDQBusFg7ctjMBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913166; c=relaxed/simple;
	bh=EMyyLabYEMmqUAN+TyNoAr0pinNZaaIovqrKQGBvp/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbtHilZ+jXJqNRvCLZv5YdQwFMucax+y0MNyOSiKpbnh5VJAQ5HP+YP91i5BFRf+bRtwoCKTgoEd36EQhHnw0qJvs+SpZAiDxJoQiMfayL67R/SfVxeJvMPKrPWuhoH4j/3MItAslRrLZBvdNXggi53w0cu1QbfujpRNLBRaEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVsOCYa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjMFwe1f; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8ZGc761867
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/stzRFiJFzvN4KBr+m0+UYp/HdU2Bo8/nzK5QAoL+yA=; b=VVsOCYa9z6PUlNL9
	t6sTjMCwn83u7DmuHwZUszDIyi+dKaRhJP5e6QzTacKVK9iIkRW4eGaZUSgcbxOK
	sLkSkJoDLBOMAoY61xUrhEyEsoKI38JJSILnFfB9nEwFQPC5swEhpuHXJae0rhzD
	E6LsYkxGEep8f694EpMxd4CpoNZlJHFhlwgJtdhafB4yFAt6saHyXBQ+IcOl9xqo
	EuYzFKCpj1T5nFzeH4wYwNno/0hNCMIOtnHpZFSEeoLA5C3Eu8U/fg7C07J7OQ4r
	It+YXO2BVcmmeyPA8rV2a1Y4jYa3enez7dcqrmTf//R1sgpFEjnaT4QYRxFJXCk1
	f95Otg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw4b8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:39:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so66541285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913162; x=1783517962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/stzRFiJFzvN4KBr+m0+UYp/HdU2Bo8/nzK5QAoL+yA=;
        b=IjMFwe1fxljlsWHQHri1G3iTU4YdMn1+8EuKB0IwQQYCYmyFvW7276odyFCOxi3cZ5
         UU1yl6vXI3Q21pJHVmraJYGRpmORYKzam7VZncpsSCpOHcUSyTTqA66v5ODf9NLl1THE
         gXRpqsOXEwnfRBlPZsfupPbIallORM1MNzAMbQOEVSY2YX4+4613suHgy2aQVDV5SReR
         ONVVBZDc2sktLuhCxENGdu1uvFmhbkJZ804IunUamOJZwvf5WMYI0RTppXsJJuzQBsHp
         h/0xOfnEGmXBvqW7Hn3REefBX+WPuAmsydKZwY9bTItiufHwD2evF3I5KC3F7Sp9rF1l
         /JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913162; x=1783517962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/stzRFiJFzvN4KBr+m0+UYp/HdU2Bo8/nzK5QAoL+yA=;
        b=aq2s6XKfQFd5w8Q076SO8PTV5XSjvZUlp/F14qnLFAWcrQsEnKY7gIuFngqY1mKkuK
         cxyRy+TivY8zavxo/xByo0tra5I7c9WCdmkjA7A8XiExnDBnHz0gC3Gyo38uaAIKk9tr
         DcYs9s5EYglgrgH0kN+dehrWTliWBrUMjQTRW9JKlXwMgOe4/NnDdB+XvuvOt2n1TSbA
         LAuWCRSPxyP8bwMzHpl9nNkRqPb1n9CKMng4nZWgQrGi1xHdcpHi10FZR+kQMZblxkru
         bjloOYszNmJfAfa4OpbkDP8AnEh2RhFSaELUXY2SOs/lSxxbu917cmeDD1Zamd/0z0Vu
         Gd0Q==
X-Gm-Message-State: AOJu0YykcTf7G/JQOv0NNDr3GMAYh52KYBkWuoi5pLk9jnkujrE+pHbn
	Dc/sz346tfoxWx1Mb5P+iPKMEnZalFuYO4uRzY6V5LLIc6ogLQNP9j2A300Wj1SrrZB/qO/X45q
	bEyij1QJHCsJukyX8aYWnlmNZav91JGc2hz+4agGOBBDaZHkHqHmBUjJddY2opWUCmBQ7
X-Gm-Gg: AfdE7clkDCkI4ZoE00Y42wEkp2xjCABIka0AF7YmI+3ufwsf64YbWPmXmhk1m9onj8R
	xDFQruaVQlBI8Ef+pQGAEXpgw5vnExmD15PW8gOLLwMRbfQoSGhsw5WwQEO+dqpUYuahyvm69Aq
	VibQVp170jJA41O/CwJw00CuYmS943lAE+sMRYa7mljClwRuv37Riu2qB/1lNi4hEfDcUlJnCx4
	KW9wUfvSNSLCMd+anp9ycTNUoAivQHv21evIBLvS6OKXa/IKY9IxAaG9seGV8xaOrV6C5O7POVg
	yK1rwHhEry+C3YvTUdFbTckx0SJKN8WxtlUE7XIgeutGBcTTItRhAV+n61wvT3a3i/Lv/CQR3ij
	gQ4fWLxeCn+OjULxT03WYQK6bTfTMEIN0cV9e+0Li
X-Received: by 2002:a05:620a:8805:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e781d3781mr225647385a.5.1782913162174;
        Wed, 01 Jul 2026 06:39:22 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e781d3781mr225641385a.5.1782913161585;
        Wed, 01 Jul 2026 06:39:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6619:ec60:6996:ac02])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c3874f62sm18349985e9.2.2026.07.01.06.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:39:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:38:58 +0200
Subject: [PATCH 4/4] firmware: qcom: scm: introduce qcom_scm_bw class for
 bandwidth management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-qcom-scm-code-shrink-v1-4-02f5ce02c95a@oss.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4165;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EMyyLabYEMmqUAN+TyNoAr0pinNZaaIovqrKQGBvp/I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqRRiAwPPSyF03iMc/6PYk1N9Wah6+F/C+JMtia
 HIaIwxgNfSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakUYgAAKCRAFnS7L/zaE
 w8p/D/95oOUJoG8m4eXV86NiSqmqiWrQyuSLvAWwIy4/U7OK89/LVKM5r4Ps1a9NuMrC1BHxkUi
 3pQ/NgtOrLSx2LAIxq1FQJq1/SY5eRDVofCPpD2TPQ7eVaghpUAC37wILkOx/abEdR4Yc9jXUNn
 sRFFiRzlLOlvBassmGwJy98SMWQR63VI4Z2Hl+XbnfOaZplWG4ZNo7siVmGZG8fNrMKOARTmWpS
 sDWqWyxMhnZ+zZMkgUd7mzhvfuU44STXU25TjbONOSW99wyFmAnF2t1m5XznyWRJyG7rpicJsJ9
 91eOOO3Iz0oEqNuJSrqnMS1dme3m3YFsMQj9OxGQAOl80vLl36HGUPzsE8UH1qR9qL1rJZ1uc7M
 skUCDy16mc1H0TrH75fHP32pEC+wQiYX9FNVaIsPpYfjmetOSi58zMJcum4FH8MJ0S/96Uvm4QS
 4HDiEPA6MXAlJPF81Sh5Up56D7I/GCSnaP6t7acrGQ5Yr5vtMpADCbojcTW0gHy5EUmfv8ZaOxD
 /1nGQESDPFkOi58LZyRfv9CyGTmT+RIVirialyPm2VBAKn+g2UeojK6vk2zw3r4o+MvlV6/+JTr
 qI+xQRggB4vaLLchNq/0T6w5PsMPZRTiD2OsRmRKHid1Z15cYKwV/SqfyplY3AJrOen9ju45D8C
 06RXXhhuRfqhXtA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a45188b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=AJRLcc76jKkRl9dWX3gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: uRkhXzEwsxEjvPM0-Eqs00CI3N-roq_l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfXwnypGkA7Uq7O
 NhuyNaHhquF761wOUqDNiAM9iUDL4Ff8yWigqpAJKEcOp6QFr2Kc1dykHnxyYIGMTU0zLEtqza9
 sdMlF9d/YE4tkVj7Ndwf9BTrAmvxd8M=
X-Proofpoint-GUID: uRkhXzEwsxEjvPM0-Eqs00CI3N-roq_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfX9kVwysSW5JbN
 +03Srx1XB4+UzR+jQSp3yJ0/hhlk0WliGWXVfN8SUseWykfMD9KtddnhVMHUOdzhiWyfl9uzTHa
 RMKDlo2JMLnlyjisSS+n6m5yG523Ds2g0N4dm9ZWihzgcAnFAFPDk/xTuYWzVglVhl9pG95eOdF
 33JEaoCMSnO939HmJmG5MQ/QECMCFKmRXjxinNXwFiA0dWWkwOKu9Q3RgE0vbvVN+qODEZe1uF3
 pNwUcRoVeQzSDPQE4g0999yFRarSWqxeHLLK94qC+W86N9pjR0piXMIe1Er8KDf0zB/Nc1k4SMK
 DzB3WNOBifNgQG5ttqzcSec5emwQp4N0Kn4vpbHp6I3usNMhba6p1mleHXKjqg4OqmpkEcz1kEU
 BqWrLvOnWwR010oIN6CD3sG3y8muvSUscPFeBHm3vvXJ8Lqygkg8tHT/DnFfMc9CIIqNqJy5fAk
 407OXEjTMIpXkhKMrCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115722-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B69986EE3B6

Define DEFINE_CLASS(qcom_scm_bw) that calls qcom_scm_bw_enable() on
construction and automatically calls qcom_scm_bw_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_bw, bw)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels in cleanup path.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 61 ++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 35aa9e8886b6ce8ab8eaf16c83fef7aafaef2822..6b64ed5a2b70a5ad3e57efb780df7dfa43518f91 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -227,6 +227,9 @@ static void qcom_scm_bw_disable(void)
 	mutex_unlock(&__scm->scm_bw_lock);
 }
 
+DEFINE_CLASS(qcom_scm_bw, int, if (!_T) qcom_scm_bw_disable(),
+	     qcom_scm_bw_enable(), void)
+
 enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
 static DEFINE_SPINLOCK(scm_query_lock);
 
@@ -621,14 +624,13 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(__scm->dev, &desc, res);
-	qcom_scm_bw_disable();
 
 	return ret;
 }
@@ -760,12 +762,11 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -870,15 +871,14 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
 	void *tbl_ptr;
-	int ret;
 
 	CLASS(qcom_scm_clk, clk)();
 	if (clk)
 		return ERR_PTR(clk);
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return ERR_PTR(bw);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -893,10 +893,8 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
 								  input_rt_size,
 								  GFP_KERNEL);
-	if (!input_rt_tzm) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!input_rt_tzm)
+		return ERR_PTR(-ENOMEM);
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
@@ -909,23 +907,16 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 							     input_rt_tzm,
 							     input_rt_size,
 							     &size);
-	if (IS_ERR(output_rt_tzm)) {
-		ret = PTR_ERR(output_rt_tzm);
-		goto disable_scm_bw;
-	}
+	if (IS_ERR(output_rt_tzm))
+		return output_rt_tzm;
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
-	if (!tbl_ptr) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!tbl_ptr)
+		return ERR_PTR(-ENOMEM);
 
 	*output_rt_size = size;
 
-disable_scm_bw:
-	qcom_scm_bw_disable();
-
-	return ret ? ERR_PTR(ret) : tbl_ptr;
+	return tbl_ptr;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
 
@@ -952,12 +943,11 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -1032,12 +1022,11 @@ int qcom_scm_pas_shutdown(u32 pas_id)
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }

-- 
2.47.3


