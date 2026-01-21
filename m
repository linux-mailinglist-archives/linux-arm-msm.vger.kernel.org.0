Return-Path: <linux-arm-msm+bounces-89986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKDDByivcGmKZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:49:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEB557F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D82AB627C9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDF73A35AA;
	Wed, 21 Jan 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8Nm6aSW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="He6HDCDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE72317704
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991190; cv=none; b=TVXTBIuNhfawJ1vlJdj3sNW7lphLcboAHOK0krCav95kVd0vT2HgaxGvOfQxRkfnAqzFniSBXCerGuG4hhWhOrRmSJaOdiiS3CPXmgX2XtzAag0hbgqIL7A8Lvw9Q8dnjWFhulB6AnwMC/Erb1OWb3OEoioAf+lUNz0BYPplMVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991190; c=relaxed/simple;
	bh=a7AcRcO6MCvzRtiUF1S7NPqrYOS4DlADlLsVWnFUhrU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jCAdRoCAzYkN+El/ftJt6rlnCLpjtJcHJx5S1akeU0NyzPuxWPA9WsisV89Sk8Wc2GMXsMXqwOjxfWcbEf7BJWqsnyrDzvxiyZD03Q8tEO938SV2I8QGIX6EtBSRYp6aFaN0ovF1xuelx87S9A2MhP0AzEVngX9SDivv7t099lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8Nm6aSW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=He6HDCDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LANQJe1530230
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KR/8x3BuwMX2vVlVzoHY63iPR3N/oPnsiMw
	MXw/XVHo=; b=h8Nm6aSWrZzrsvONZbB0GjE3fwfps/Lrkpv1miN+ZVP5/NZsLcr
	uqm7+wtEZ0hpI1c8ZFooDuHdMGelY3UobfVUZhUyEvp/F0DJSpnzS6eNEAzZ/loi
	GxaN9hkXCqdwYZwsn+GgH8Yy5Y88MBtGmiNklhL9sSwKqJR1SvojpJ4YYc+RKuj7
	ViKwaquu9sQF9itBJCvn5bxOwsOErTiP7+ZT41N0iZP2Bo3raTkCvgMHOQh0oa07
	tE6++1U9gBhej2Dr2QTRkAdPPZNGol4e7PW5T9VsIDAtTt6VY8YPv/LZgVLa6UCL
	rsb+IST8XlT6t1x09vS2e5zRAsDTtJqZ/mg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth83jw17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:26:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso57914055ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768991185; x=1769595985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KR/8x3BuwMX2vVlVzoHY63iPR3N/oPnsiMwMXw/XVHo=;
        b=He6HDCDYYTCK0lJ4s+SpXIqfm7kb7CG4og7KMtaDV5l4ki8Gd1lgerrIqqUIM4lSKK
         ax5MWxku5gZ7hDIYtBeHv7olfGldrJsl4RFnrrlyhezlZOSLT43IVpYoFM1tD/4+QNh1
         J8B2j0R3/Rl/hoGQcP15xxJbeVgsR04n5e6mhU+3+opm0X6IVc8jy1vnl+ntFL1Y1Bn0
         2g7knbgZjKL48wKP0DcGAoKipDhH7c0aNBj/8lEE7FQL+6XRJjqRhmXDJmpZrkW1og/p
         smLRM4Ijyjq1ApB9OzxHVMLpZmqZXE2B9LNxRP+ONDRL0x/NVx0NaOfw1P1IP9ZDLfjV
         mMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991185; x=1769595985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR/8x3BuwMX2vVlVzoHY63iPR3N/oPnsiMwMXw/XVHo=;
        b=oFzbFHy2Vb0VkxZziIHDdxsv2f1E74/ZAN5NEFFKdeWrUDZpJzSduLsOrIgl0+Aweu
         SgJURN1B+mmwtCDJqiiLMxnAK987Kl/koSknWysQqRe9ipEpbfn8VW7HweOmlAP7Clit
         /JQD+2reE9s0duBeDfP14NUUo3bZBKjs13EB2Fc1Xl9tITHdDMglxdXQX/U1RkdzxV47
         HmkDdPSROsMgDi6FFARP9PWZaPj6pZPfsYutRsVHKx+0HjWJivzbuQt+3ApUBs5EYllw
         MphAVkwnqz6BRY3MP5Eg9ccUMMfNSj2wp0w6y6RRFKFESlVB4sJ3I5dw5Mxb9gm3TO7v
         X2iw==
X-Gm-Message-State: AOJu0YyZp22GaQZheWE2RyfmpXh6hocj3Y3Nncj2UBSg0H6SUJbMG4de
	AD70IWoyJE7MpwPZ3EW/kWB5hTFvWlHlqXPp4rxwnOiWdk+5hWyiMRWZl4clUO6l/wq8Anmzkra
	CQTK+TJPdkx1ev9B/Pmlg7IsQEjIiCk3tESupvWpDBNw5O4j4BGBKaf8/qgsWnghow7sD
X-Gm-Gg: AZuq6aKRlVkZd03J46S4aeZ+gbPyihFphlX1mPtLc8m7p4K656m9WdpC7PhNaVfvJsf
	r40AsL1KQLDkLt7vhR9Z56msuBkiwA9wauPTqQeS9Tc27eWkJY04iSlk1QYAxA9nbm3Yqw7ohr9
	TxSnRi8WicH6ptnr32xbpu0kaVeJbFdppzKe2FhCESp93MOhLkiL4FQShUOZz8+e9PtXflREYTK
	EYnrZZdsnF4Ct8+QEkumnMw7t4ZFJr6hrqcg11cGiI0YPYKlBjlmjmPxGSfa9aSFUaVq05y2+dr
	7gOLEBRlcuJ+W1HexFn2Y93dwPLBT6wdoSUf8YFc6RIfN9S/bbrVW9dmcnhFU+gJjqHK8e4DVFG
	EIWGW5KD667X6o1JnEG68Yqj6EhW4R+HrU41BJQ==
X-Received: by 2002:a17:903:1a6f:b0:2a7:63e4:b1ac with SMTP id d9443c01a7336-2a763e4bc2dmr45011825ad.38.1768991184699;
        Wed, 21 Jan 2026 02:26:24 -0800 (PST)
X-Received: by 2002:a17:903:1a6f:b0:2a7:63e4:b1ac with SMTP id d9443c01a7336-2a763e4bc2dmr45011655ad.38.1768991184130;
        Wed, 21 Jan 2026 02:26:24 -0800 (PST)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce9a7sm152741405ad.37.2026.01.21.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:26:23 -0800 (PST)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: defconfig: Enable Qualcomm WCD937x headphone codec as module
Date: Wed, 21 Jan 2026 15:56:06 +0530
Message-Id: <20260121102606.1753970-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qaOtiSpM92QW92E72UKB5EGlX33FAawk
X-Authority-Analysis: v=2.4 cv=TeSbdBQh c=1 sm=1 tr=0 ts=6970a9d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VNhcq1mhK6L1cbYsuu4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NyBTYWx0ZWRfXw5hmOwnLpb82
 lBrV1+9tewj0OIZmAswIZqzOdD/tAgYHT2x8kI+XhRUGzvUWQyjWwU8FfsKDjpBAXXWszVs/P+v
 iXQZLqfduQvIS7ckojvr3YCHkrvSymU+T8In/bhv8SXBUUN4onMPO3PkFZaLBJeUP1oIsZ6agmF
 ZRYIKxBU0QdVv7sdK5uSFopf8pEmb9FK3FWP3+8VkzK448SWppCd3itkP/FJJ4BO0ZbBngEPhla
 ZauwtoMMUAA4Qii36XlgOQsUkD3f8Qq8fyeXE/qWkGarQrtpB8ZQNzH/Y02Eg/aENyCIAkYSByJ
 LCi+VKZxRD2AhFsYZDfomBl/29SRu/XTc8oMzTNanAkx8mgsbW8Sv1lSU7srud5WwMO5sN5Z1/i
 GqbMBYS72ayriNodo6pCaojxFxkIG2QrCfBY0q/3RyEnnc6YHfSwxAhjJkvh9JAdmp7wXH6d+X0
 XiPAx8QsoDKlROjiniA==
X-Proofpoint-ORIG-GUID: qaOtiSpM92QW92E72UKB5EGlX33FAawk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210087
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89986-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5BEB557F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the Qualcomm WCD937x headphone audio codec as a loadable module,
as it is now required on the QCM6490 IDP platform.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3cc05d4b4df9..cc9b6bb955a7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1141,6 +1141,7 @@ CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
+CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
-- 
2.34.1


