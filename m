Return-Path: <linux-arm-msm+bounces-108355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJSpHlAGDGojTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:42:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4EE578411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 425B83047BEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEED38F638;
	Tue, 19 May 2026 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXtuUQ6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYel2NVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69373393DDA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172545; cv=none; b=TtifRpezJ3MpqMcYxV51IowzXXH7bRi2yHEJmWdXDaM3xLb8mHA3OvHt4kHY7VN28EwADgcvT+3mtBzHK1F9K/3eZcQIAJcOdeRdoRVmAvrevCRID2vniqTmhoRDRDgID5tRh27WOtc+9LRcI+ibYZb8YaP+FREQjIgaeHAIk/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172545; c=relaxed/simple;
	bh=pe7UzcxfU06eezrl9Dda4KYQlU9VUYtnry/wytvwyDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AinTPFuE51tYUfcOm9YkC2VCLc/axxQXJkwG4KtdjG/0W+VPUCD71boczHYuZwU6OwewSBQUfmCB3P57MI78ouoZpEhOGq5DmARNETB+mT1HWZGFvzcq2WMCT81Vc7cTWHprY2WQjXzYdYWYcq5ukLsTTmecGZR9y6dyPXteOl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXtuUQ6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYel2NVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6AL512892118
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=anYxvu5W0r/
	rDvXM24K6u7MxX9zy3DAVGlYV6dijd4Q=; b=YXtuUQ6AISbIFU9CXuPckfR+UVF
	DRvGAbgE710rRCd4WUKVHZ0sMHZd1vn3+Iv0+dMecc5GrA+MHdsOjegUXM+Fd+k3
	gQ+B9fkhfxchzM7WXqUg+/oKypafbEVE+3TkntzG1ADZcliw7BpnuCFKR5JpK+g3
	2HLm+1QWToncjqUIhY0kKs59Y00Hqfrqj62UFioRFEMb1nC4/sMCP4epjIQ7J3zU
	2MhS+KL72gMC3DclNg8karsxlOdefmiHf0y0v42R3Thcr+VBIr+G2EOYKy2LsWgC
	oWYlAnND8FrFwsx4gkIc5A1lpHYmtnqq2o8ULY7tu4bhtSOxKDUR55EyNxQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1ct76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-135de949041so229618c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172543; x=1779777343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anYxvu5W0r/rDvXM24K6u7MxX9zy3DAVGlYV6dijd4Q=;
        b=NYel2NVHL2V19nDGmd0TfU2fIFGptTHWLEK+dJb1IJPuYWrLxsRIqMWXCHeczqH8i1
         J1IF7zeswCgT8/GDuu4F7T33MT8iuFMXEVw0tZwTDDdGNQcgG2FlZ+edGwJv99suD/K1
         JzqcCS0c6OO/LAWsi7/1o9Sbs46wDB5HCN2E5CBeNJDICzYNFY0llLI1Rysm/4P3jS8I
         5AGDNOd/h1C47QXT8ZzqgY5kQxNyLXk5XmUJBblDxwCDdUFDED47P/zDvTrbwMr4/BOt
         DlOJeoEvT9+iOXHKrEgvin79ki2AVWKIW1OWDdsHNr8ZvKkFLKtmdt98pGyRomUNIDL5
         aIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172543; x=1779777343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=anYxvu5W0r/rDvXM24K6u7MxX9zy3DAVGlYV6dijd4Q=;
        b=VqvvDKcJUAXeF4JSDEg2cZrPnlV303KRw2xGDXMcjuFc3pfJ+zxlgO//fdnncvnmn1
         sHPE/w9MpQfoYBnyARBnGudIZu/fwZzQpIxk6JjIac8CkG1qdZTdUHg70r9QWHOkonFP
         IHdoFNOxhjiRoK15O/TbKd2r4+nx7AOx9ufQNdW01YkMma1OboiJEtqu/r6QyBdaRrPL
         hbcJijiY2Kat0R5RPa/2kDUoOda526CycuJ05zW3lxv7O3KnGuiKpIpvmbC5uWAKfw7m
         q75Ofp/5d2XdmQb1Fqr0Qk23spGxM85ATZddE2B/CFNkNiLSljS0IW1CkVRY9ZiAF/Kh
         lrHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dZ+exPiv1jyEHHGAYTCdbI5Hp87RyO4l59g93BNJMPfrPi7HVoeGIfQgjVKIgZXXzPYgzD0P06Z0nhtQ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TUKiPq+M1GStw0olO/U9z98QAAqbYLBzHYFj5rE4/qGrtV6R
	wOAwdFDgJcJEm+PkP9WwAMUfVKTROI66gSnpj/0+76CEK92ejFH1ejjE5ghN3ZOrrU0lAraXLAT
	+ABVcPIhbAwcUxhvzkjBpE+a0pc3hXjte3kQgOG/1RJWuJu8I8z2M9/vLEZREfEmxqeCf
X-Gm-Gg: Acq92OE06dd+R039HRpC9ItqKjjGuCIXHnJml6mKp2koU1lIXGvDwQegqFQFGnv5GlT
	FepHGKwvNGJnh/WhtaSC2g5Q2ZUpQ0DmJpIEk6CjF2fCFr47AfNDRsjZ2/pXhcK2VToXfYtxaZz
	WMCVgTjWqDOJcYL+/IZd9dqhBvmlG9TUYVgw4Xt3FpR3qU7KpAAf7YrSHyl0Hvgr6WqRGlT6xpa
	iR5Iw6eoIOqweE3TgtAq5h/DqLs3SkIVJ0uLODsPvgOtz6OCXLWpYPOSluMWCL+gQ1I5a20J+Yo
	No5DWthd3oxAKNFazuSeakh3avVT8o1/hsWlDuEZB7e58ITHqqn9lDDzrlHRqvQHg8MAm8vSI/N
	WSEMpZjFL1liXFdDBBA8Y46kdJ1mYNYe/3NHldgXJoha3ZlZd7yYZ1duz2uQ3tL0Z96vaEjccus
	Gh/oB1ew==
X-Received: by 2002:a05:7022:402:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-1350553acb8mr7625089c88.30.1779172543013;
        Mon, 18 May 2026 23:35:43 -0700 (PDT)
X-Received: by 2002:a05:7022:402:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-1350553acb8mr7625072c88.30.1779172542467;
        Mon, 18 May 2026 23:35:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:41 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/8] soc: qcom: socinfo: Add PMIC PMAU0102
Date: Tue, 19 May 2026 14:35:00 +0800
Message-ID: <20260519063505.883379-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ph3CnztpA4sVFSdLBkkvBBUgM6rC0xcA
X-Proofpoint-ORIG-GUID: Ph3CnztpA4sVFSdLBkkvBBUgM6rC0xcA
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0c04bf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=V5oRiDBFaZMDcuiOaXsA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX/oMCNTwsw3hK
 nUraaqSRhPJxSxsA/LzF0ZVO6Nqz9ZNx2dGraVfeptjH5tn8VigJL76gg2oH7n+QFlKYnB3d0GR
 TNeBXfOFVMIVgIT/tTKVsDtFwNMBVoFRmaIEwg6wmB271hn2NK9AbVeF2NIh16uz039LnSP7GV7
 O7Bj/aXNJWjNQBhkxXVUXrim2x90F9N/u2Gtkr47O2kXt3sWD6ONWAJAMj7qMr/Orh1LW2qZ00K
 Uhyz/BWJv20DELXzJ+b/y51JYiNbaI7XUdZrG3HDa2u6TmDkxyqcfGpOq+DSOABLkv6tYiB8BRC
 2Y+QqayqNKkCn9/uJd8/iWPLrbGJRo9AizseEj9g9XlLWRl4irnAed78bBL29kYG3MxP+5DD5ml
 r6X/B0aNgTWjNrB3UO78TzzWcHJeuT+Y4qkhQWG96Z8FA2MryjfiYMdR+w43edpShZbdc+liWFB
 bobYzrnronVK/USiuKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-108355-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF4EE578411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PMAU0102 found on Nord boards to pmic_models array.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 5c8bd29dfac4..ef29d4ad3c7d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -194,6 +194,7 @@ static const char *const pmic_models[] = {
 	[91] = "PMIV0108",
 	[92] = "PMK8850",
 	[93] = "PMH0101",
+	[94] = "PMAU0102",
 	[95] = "SMB2370",
 	[96] = "PMH0104",
 	[97] = "PMH0110",
-- 
2.43.0


