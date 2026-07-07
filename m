Return-Path: <linux-arm-msm+bounces-117421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vZErKpN+TWpz1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE5D7201A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P6rKEFNq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JFf9lVaF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117421-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117421-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DD9B301AC8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F4D4A341C;
	Tue,  7 Jul 2026 22:29:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C615D4ADD8E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463399; cv=none; b=j/NBy0l2s5/J1x6nC8NgNIhjbTVGo7ZSvxGyG9lmQ0zEAmdTQv1FWLwUrLYkuG33SnpBVc4nY8SLTDrHrGk6Im29b24/LN0GlB7RTCVzoBk9A1lzqSyzfUqtP5tZugn0S6nk54YR6d1tg3AdiJ8N1pAZ2doWX4tZCzHWb/sbrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463399; c=relaxed/simple;
	bh=AcarJ8y6fItqDYFBNoulW/dCUfTPyc5q6YcY/mcFEuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Abb4PSWX6Yoszr84W2eT9Vl/pBVGwrkF3aya3sAIOHSj+haZACoBuXqLQnENyzz/sscGEiToHRI2oauzeYy65rmxWUJDi1/Xok5zXGimZHZoJsyiyFPnnfUlrzCt01FDplzWvzKcdo+z3ubvjcLnM7+75syPLvGkxuuTVPt1fM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6rKEFNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFf9lVaF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5qPg496534
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=; b=P6rKEFNqetDS0cdO
	o/UWaNRnFT7DWB5WgMfxhVZC423EU8Nv52hHwMOuxcLiT7N7Y6XhmI7vFEiTS/QY
	e5S65NyrWSO7Pdi/Pb6J8UTufOwaxGuA+3gnlFCpLCoJkb3bA9HcWo3zjAsNT6v8
	GmXYbd2C+1/tHT2QtrNjnuiMppUkIDij0VM+us/j+dDlr8yeuvLi+FmMknRwhgO8
	1TXR9QIMqx80vE2RLlDD/WFC+2ZV/JSktHgtQULoE7EyYT8ocSc6CS8EmUewY1KZ
	HvEdYdBqUOTxqufB0CcUWxz0L18s5XnOqkylTOnm8ujSDZZSb6PGqrqlwwhN86WF
	8F/hDA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0k2ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-969275401c6so104758241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463396; x=1784068196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=;
        b=JFf9lVaFptqALPSLboNgT96MssB9/VOXhz2JfRt6bECEytj+ijcy4UyyQl5NaWcHgR
         VK1J/zrX6B2KobHPzKzQVP/H3JXUl6eaygO/7BkEIsQfQzjWTNdMDOcNZRuF29+k06Ka
         PG4LFEm5CTW7OPy/OEjDU5jqdGnBRC1jskX8u2db0b4jbXlmav6XZMRUWVPVSt7ZCwY/
         Kn7ECI8b7DGna+YDHtf/dtS7P1Af4UnAaew2qum/RCVLbzZlzMU484+Wx4RU9LpmdPRm
         9NN4VyHXNfHzcO0HPrAEnrcDRPDh7dxCxqkcINsc43KAN+DL/r2k8KofH49xAzJjgkrW
         1kWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463396; x=1784068196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=;
        b=RQ4VwG86a/eTCD/+mXHJIUMcnBZuvfIws2CLrPH6kg9iK0dnlP76Ls5fDF0hsjjtZF
         o7SUNhr+KhspNkS6x/h0UCWzHEb1YyWxmGelgtX8LumfJkJUrvRIywks+Kswni/P7K0T
         NULeUC85Sb5mT8dokNJQRhrXh8GJ6LhvhEOvkvz8kgvC15a+OS3a6rGJ2cw5i/mTaWTq
         HqGfL9w+9l8U8vcfsoFU6TlrJuQ1NrdZuO/vMITuw6VurT4N+xtJTjqwJTkQK1vmtYjY
         RQcQl8k4Qk3k81xOLBWXLH0tTvcNJA9CP8+XpYNDxi446plulCpRKNgq6dA18U0LlaHi
         aWPg==
X-Forwarded-Encrypted: i=1; AHgh+RpfGTcDK3PWG1opc671xXn4uUlXIH3eP6Kc6q7erX/vcnlH3dNJxtc0FVvFM1avuxz5TnDg6BvUo5m5BV5u@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ4UGtSicwUEss4gGN5dQSiOZwi9hqnjIIXiXlwXRqlkReA5rg
	nDFRkNP+EbDFzNnVtOCh6TYOlvdkVEdi/4GquVoPUhQmZfRkYmNr800LdGk1aB0cHRJgkoRhhG0
	E4hCnZx+Pr5bgiOSiiFcM7ho4jBw7PcFVlZ8thZGLY/xA4Xizp2fVmxuPjfZsRPMOnFGJbwE6A1
	iK
X-Gm-Gg: AfdE7clbfUdMPpzhwsp2L/QaIvinesx9TPY9xISc4jhq73XqQbbUc21amrOt70wP5/I
	f5S2C+02df1l1v9sYfuWrT0ObncTYwDJaT+3lelHH+81UxLb1MtzxMOR4PE6SI05PwRxVeY1Zgb
	frykP7H6LyWCrU4nnxn6pYmseRc+lAm9Wy8xrOOkFc258hX/bwu3KGHIeLX7QiK4UMZx5e5GJvF
	q5tjiyHeIbeBbx33Hrv+oBFRh4g3NNIpbukVT4HEh9EkbnBpIOEeaGc97y7HgA/rKrHxpQumSDU
	SuZTuMd27ZJWvlcvinhCDeDDhz5NGxRvgeoM3tNMXdtHg4O0Gtd0xJo9KRZqZIBXUWLTy4eHMfM
	oLZInkR2oMpzo3+vYAJJRXD0P3f/RUYxNg0g5tgJUi7dExtPRUmmJ7++jGtZNs1kQCEPmi0LZBM
	PJh3nBzTJvaFs9SutOrIc5kuov
X-Received: by 2002:a05:6102:c51:b0:733:844f:3582 with SMTP id ada2fe7eead31-744b7fbcbd3mr4593183137.27.1783463396065;
        Tue, 07 Jul 2026 15:29:56 -0700 (PDT)
X-Received: by 2002:a05:6102:c51:b0:733:844f:3582 with SMTP id ada2fe7eead31-744b7fbcbd3mr4593175137.27.1783463395616;
        Tue, 07 Jul 2026 15:29:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:55 +0300
Subject: [PATCH v6 12/18] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-12-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5856;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AcarJ8y6fItqDYFBNoulW/dCUfTPyc5q6YcY/mcFEuE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2qO51n5wN8mZflSLuma2DIh/Cs7KDCs8kB2
 6vbaeV8MRqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qgAKCRCLPIo+Aiko
 1YQNB/9J/hQHiNtqdYU0u9C76VjoF1/OLwjI1NthgFule/KWIz6dnDHXJGt9VhmgiErrlXZCm4P
 KQIBEmi4OCYA2emKadWwjo9OmGX7ICxYGgZo8c4zQwl8Y79OHFQs/h0k8AXSYKh0XZ1n5D5DV7p
 jM045kBZ/B77I7y/yqiN73IDLdPgfjOvN5+2m+Ig4ngErsOtrwOotumR5tkTPDgm+0mOAyUroj7
 uG0m8DHCGfRf/hoPGvZKFEe7x59PBYzCLLbUtuO8j+WBMbX3OR2E4Q7P+XPaXxF1cwavH/toQx0
 0knSm1MQ3TPJriju9p/QZsYbWlMH8BHpQy+znUlET3Xcco6G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: g1-fGNrsdNw204Dv1oumDgVBsE9-HGKq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX1E5NBfG5VjUV
 WPK0aw1csbs3apd8wOVGN4aWxMufsn7pMMaA9rSmRt+IiPU7bVfsXCcTYEXrTM8WCPI9rT7dCHm
 Q/7ruExGC3XbmL8utBMN/jlwoO/GDgo=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d7de5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=O8_DsgnrxEnowPJBzLQA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: g1-fGNrsdNw204Dv1oumDgVBsE9-HGKq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX5E5DTvdFnHBr
 4+x952K6dqSHGBifty3XbDLa3uYbDdUT5yOw5V+GT+HDSF/MCuCKtlFz5rdGVk+ngRet+h2Hdqu
 z6DQNcvI/y6/rTiTSjCGowYmMvPDZCxtoLD8q5xWM9ZzGM14b8kjZ0494mla32qdG6S9VM8Kbwv
 nIkfLRNebzj+35ddkivCUGFnEOEC3rz67Vf8VuM+6whw/LjjUEdqNlZ5hlpIsSQ25A+txnTQWV3
 v7seSaD5e+HVNuGWbm6AwZH5YDN1KUdZ7bPhLct4W17vaObxvTWOf+JyGbnzmObPrMtxIYP6akl
 mNkKjZ2xYHo/m2WJXgwSN0YQyR6bJXHfCpE0bLn5Q4fhV1kDQBYFfg48/Jef0Ds6Ts8Ev1JDT9F
 p4ValuwRypM6KdtwvzT1Ec/xiCzk0evjHClxaDMKfvMKRN2GrQXrK3x8OiLFPY/pLIxtafqmuVU
 8vN/i/BX5Fb9WPEilyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117421-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pkt.data:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBE5D7201A1

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware. It is used by one of the following patches, adding support for
Agatti.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c4..99e82e5510ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee192384..bb495a1d2623 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -205,6 +207,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -574,6 +582,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


