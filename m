Return-Path: <linux-arm-msm+bounces-104622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL+3CdMJ72n14QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:01:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D372D46DF95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B762030080B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB423390CB7;
	Mon, 27 Apr 2026 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBRJ+ksc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iW/NT6Jn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D203909A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273256; cv=none; b=iop5gvertY31J0inCsof1E8hC5MepbfrZrxESC8srNm9Fb/CI5g0arzDE3ni68LZFnYQAlF6ZgdpOyRCpicDqyF6nlW4joNd/Exwm5DGLD5a1Sm5bJGdwmzNBdKCnHU4ilrLQr+a4/DvKWeK+StukVzoDO+3o7KoPJGD4vqshrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273256; c=relaxed/simple;
	bh=reVwFnXqG4JCPAGIR03O9xtNh97cp7Jtw8Z0Syo5YXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajinXZRhdY5ZsIJjyD0h1VT9k0WQPxxqyjDa7mjCu+6N89s/Qqywt/RFSLx2XYTBpVFHyw1ze60FSbwCOtfNlrJg6cTbBcV2GiK5ld7nEE0gbxbWf9X/arnTZfNRcrg0ZJUoipe0PaKUi+UFRevS6AuhMEYpCkfXZfANfVW0ae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBRJ+ksc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iW/NT6Jn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R6waLk454000
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lKM0gON4wq3lFQ9OTFi8OQ62Hdqmr4RmfkZ
	3dDyXj3I=; b=MBRJ+kscV4vUf72IjvT1JjwThzXsd7yE0d+xSBWtGvTZkQ70uLI
	OLl9PnOY01FzcsPPM5CGkN8DRrhruU6W0qduuefIWDdicGdrwyhA49X56Mql84t+
	twuuIRmB3EPjeQiX22fECHV8xMPDYiWa+nLiWWbu8uaqp6o3tBorvzcffDlFbo58
	EElklQTRogHOr8WyA4qKDnUYNu77xWe6q0no+38kMPoGBjor0JSezT4uKzhQqbgh
	c6vELuK0tGKoX6kr9EOEeUghxZCEG+VDkql6tlaccjooKbcfrIrWHGpatrKGMYxi
	zkZPvE57s2Z8l9kvj+9/evMhGMCBtxXDxQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n00cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:00:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso261249431cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273253; x=1777878053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKM0gON4wq3lFQ9OTFi8OQ62Hdqmr4RmfkZ3dDyXj3I=;
        b=iW/NT6JnOLZilUUtwr4SArs6JeJO0viwFsdyYBh+4YaVhhFT3q/OYynE1nB23nWOgA
         yLLMsE1xMklDk8yLcnE+eBHlxEX1CuSX23RY0+RkOm2vzy6StvhlRJtBhV0i7MO2cGip
         r8PTl1R0AdB/XqH7BnUctNz28gZ1hEZ+dR981me2Ib81YVEmX9g/2z8ahD3baV+jj1dP
         EO/W5aCEDSTff0FCXfKk7e+1rYJbFp7VJzyUsIi9/ZEkM5OBtE6/D+5fd6O/ynDe/vLy
         tO18wJ9VxBDwrbqQK1aGBAznSfEfR2QG2C3mYOwBtLjYUpV05zbHfAvLIZxqIguspfpm
         E5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273253; x=1777878053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKM0gON4wq3lFQ9OTFi8OQ62Hdqmr4RmfkZ3dDyXj3I=;
        b=MUCBIEr0vYQaPlx77YNTIbnTnM2IMNBquKJ8jz+XmcZWtlW0WrjOYlvEo905o5L/kA
         N5v0OwgmLUJDvW0ZV0itRi6hPbJbb69x6ixvhl+821U2hvMrSJZVjnDJUmwlwg+LR/IY
         4hXRcc8XZIu5wVVNkxY9LPqbq6vkIw0WoKZGrc+/3Jq7vAT4wkHbGGRuBwk2lCUvvTFM
         sjlZFwgWE4P4K2TNaxx7+nWQG1TdBRBaggnl2krDQRmo/6jroDeRI+/kwrfAbCTfdagv
         Tilcx8++QQ+7Jt5+Pt4pmG7DLvEyJb0+tb2/CW3IBkE8FH69ku4IQBkhunre7rH47OCR
         +VoA==
X-Forwarded-Encrypted: i=1; AFNElJ85tbhDPmUdnFsuogA1l7yQMnzP2M/r4qOefOqDMgtnEgACqIQ9AWANftzUwxuBX2LkYUvX8PhmWBxhtL2c@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDF2j24r96M/YRFau7RP61VXjhfUe4U952fHb78MAPZndJWgc
	W/9Ce1tebrHqdkhNwK3fYVMBLA4mXuUi8tlTvgGPrn9Cpag7Qr26dfUfUoyPZqY6WMb81oUyzSW
	/FAnknYm/+yki2o4MfMKvb7f95UpkMSeMgG37l1mAln1zDvPDQnE01n90SdPFiDE3xCxV
X-Gm-Gg: AeBDietCyoB8jVaZlsyv/A/FMt7yd4c7n+hdiaWOqHQKc9CtiFC9VCEhQkglt+kcLbX
	nh3QGeOH2ATTx4F6uJEcZhkEEKAqZOK68YEZeOKTJqh9iUhZ67Obi0ugALoZ6v+kyeqC/ZJu7x8
	vzWW1M+1/N7bvAYJH740tt5I9rilBDoh/Exl7OqHQ4PwQn822Bk0W/+mFV4h0XRpirAsVCV50Sm
	x9QqZZYwUqIJQilW2pDF5B0gfMNcaFNM/glqcjzc9g7dMc0CWmWkLVUTMZ37Z5lmmL7abFzgdZx
	jrd0iKs1xTIypOmHFZKL1MX9w99TUtBMKFKBRfdZS0BeMsf2RMnJNmJ3XYD/DueCc9kmc0ACoss
	hBiYxNsOg1NAuR9NrxyrV3EKE5ynGO1rclTFEuNt3Re4Sr9P7vk5lfiYwwXn90TacEnEzRhsEPP
	anOqTzF4I/mQ==
X-Received: by 2002:ac8:5a49:0:b0:50e:60d7:b272 with SMTP id d75a77b69052e-50e60d7b686mr454914551cf.41.1777273252689;
        Mon, 27 Apr 2026 00:00:52 -0700 (PDT)
X-Received: by 2002:ac8:5a49:0:b0:50e:60d7:b272 with SMTP id d75a77b69052e-50e60d7b686mr454913841cf.41.1777273252059;
        Mon, 27 Apr 2026 00:00:52 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc10019bsm792875525e9.4.2026.04.27.00.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:00:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] scsi: ufs: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:00:49 +0200
Message-ID: <20260427070048.18017-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=reVwFnXqG4JCPAGIR03O9xtNh97cp7Jtw8Z0Syo5YXE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmgZA0UJzF5hqKIxrOc61exk5shUh3ZaQB2i
 HlKi9RM8XyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JoAAKCRDBN2bmhouD
 1+t4EACLvIr3eRNjKBH7knXiyf5EgIfm6z0mNxeKx0Mt6pTPXShzRS99J9pRZFsWT7CwqtIfBDf
 O6b3yZ14R9vsK7EyjJH5GsHIt/QaxfDuBZSFNAUG43OpkQw86HSS+3wANE0IF+a1GerMU3kzlzc
 MG7+FxVb+SsOhMGGF4yXQ/M8p3+NjKAhPyH9nWSFuj9lJiRMHxPMrgq8+yTQvbj91uqSbvKDO7p
 Kc3DyawlyPU8EwbiXxI1BlaWOxRpkd+sk2/UX9/4COQ5fp27inlsggjgAjReH+R9tel3MVMZXeQ
 jNi6ZvFK2tzz+o/IzJ4UeFaFmfuszqQhcXA7Du6qfOVPyEaFi7EabF1z4Muj2d7AGKglx1jyPqe
 rbV4NU0a+aDAWmbvcTXXpaOg+tCQnJP7791OL2wUYumvpVDHzfYC5sXIrKw47NZ2wNjXElnCxjQ
 WD0kCVaP53M7tOpNX3v73wrb+eM26I2lBajmtjs5AQ7TaHnbJxSen2YDXJMdNrGnXtz/FJGuKge
 QYTvrO6wyI7rQmkegVLK8DYKpyGGNF/KIsf9EjJsd+/NRP340nqvzA9HrEcGzG0HgqCES0YfYv9
 Z84VagDD7y9/pMttgTAOPZDfJyPTmVXA4ZwAt8otbQx+z6tvkqaF9BjQw+/jhMrun9Mh4FGPoqs E98sN8gdlVm1tZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MiBTYWx0ZWRfXw3hCJW2Dfjwt
 lyaBw2AMMTkc8LPKX/c9oqcDgNSxUfNDAQ0MY+pjJfFtbv+zhib/9QFqCZ8S44rnvP861u0us3+
 jddNsV7zsturywy10P0LlObeADXP6Go6JdR6N9SkqRSHiSxuHQuGXmcYcQ7+tkAgM+yKuC/oigX
 PYj1gLnho8uSNmlEVH57YLFwSWZrNustLh1dc0IV+fCf8ZwkB8oOyI+cXKleGyvNK54QBV/OYj/
 4q1l9ZE3I1aASkjY/Z7ukX4iaMy9SHT2n2Go43e52JQ3JGNbvrKHAuJsf5OMr437d9BQis2mw91
 AhG3cIuFDxY6AzXRLdO5VQyHyTrEqiK/q3FMgD7OYZYrdtt8lK95BaqBxrDNAKAXr+qvTTZg36A
 c2i/C/rAsxcnoc8YfMIWLM6ODg6NZ7VSjk48IuZxL2nk7Cjb0K6W35QVBWjrJ0IdW38MJctDTOb
 enaeDhZXxNvlVOmHXIQ==
X-Proofpoint-GUID: r4jU7IcTcr6jScl_gauqHz-yD2GkYogf
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef09a6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xgK18a4npx_stkMsbSEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: r4jU7IcTcr6jScl_gauqHz-yD2GkYogf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270072
X-Rspamd-Queue-Id: D372D46DF95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104622-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/ufs/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
index 964ae70e7390..ff170c0b6da0 100644
--- a/drivers/ufs/host/Kconfig
+++ b/drivers/ufs/host/Kconfig
@@ -55,7 +55,7 @@ config SCSI_UFS_DWC_TC_PLATFORM
 	  If unsure, say N.
 
 config SCSI_UFS_QCOM
-	tristate "QCOM specific hooks to UFS controller platform driver"
+	tristate "Qualcomm specific hooks to UFS controller platform driver"
 	depends on SCSI_UFSHCD_PLATFORM && ARCH_QCOM
 	depends on GENERIC_MSI_IRQ
 	depends on RESET_CONTROLLER
-- 
2.51.0


