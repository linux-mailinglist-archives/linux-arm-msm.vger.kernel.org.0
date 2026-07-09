Return-Path: <linux-arm-msm+bounces-118019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vEqXH82oT2qllwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:57:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF341731D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:57:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HZLYIpnf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YriYE0SI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118019-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118019-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF6C9311C806
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171F5343882;
	Thu,  9 Jul 2026 13:42:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD8934389A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604549; cv=none; b=RFPXX1QYYc357UneBTf8JPr4yToWJYcu7RqlcKUvUNa+X1yvWGKCQLQr3eVLw6VuvA88WelNdFkb++8AbE0YbKC0dGL84ofrkDjEFiTVBtB0ofThtQe1/gawuP7JszE92do95Smgf9+Iht4vFo7ORTfwikwyadO+9n5Y5U08nPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604549; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xuf/t0m57s2ndH0zzJsZMXvan2xrnjMcHBftIwOFcRMS+i8I4KYMKXPsIhHgIwvDEYN1BSrCXZgbrqo2VfpL211Ic/E2Hvxm3HI4G5og3N5oDXF0/K2YXGGZEmt2otY3HVWMEajFmySSOKz3dF+bcIpkc+fyY1n2fyLXCZNCzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZLYIpnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YriYE0SI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNVBu1667893
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=HZLYIpnfESnQK3N/
	LgXYva4tv2++5bjrwdATe00vOwsQXT/98ekjMNWaLlHbfZSisGSAZg/o42ZkKy7S
	0JT5LVp2Bbzt+Xu5hgqrPAAgQxBeSORwcf2Oll5OYLIjogczIVkRJC64g2ypqp6b
	BnPo9y6bOt2D+FHX9Vn6yxPs0FF9STUox4dCUBjkPOijuiHnJ/rMyyojBi30TAkG
	dpO+12MCkLjHMFSyqH+/6QMcpA8HGMkRIyjogBou0feoD39vCwx3nLmdRoOBqzfP
	pq+ewYx4tL9I7HgsekBS8LVUmZ7zv826uP82v6dk6xO6zlopfmd2GS6WHzKGuSsI
	ariCuQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6m1gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73883529f72so1929486137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604546; x=1784209346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=YriYE0SIC1q+75c8JNB9AaVb05xmC3kb1MW4pZbj/aJ+nyFfc1N3Ur2jPL6IsIf9FD
         RgRWPx0QwQ32uh75cl4JEb4glmAa0flcEtbvseidZMvHjtiSW8imqlhjnBDw4EfvXfNg
         /VINJceIYZKeZkTcD7ZyXhWhY/6JnDzNUKzS2Us5h0hQALpvOeqnjtnTFS3hXPJBIryF
         Ge15RUG9f5xzj98+o3HdOkyWqpRuwAg3JiKuqdHqeMkpV7BfXHKtBj1oPRv2j2abLq2F
         etrk/N2/Wrwm719jlI5a18tIrWm+x/SosHl3BHAW8lEvLXK6yT+68EsgUQX7sZ2g/UKI
         FT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604546; x=1784209346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=Umn7CMUAnhcm38wsZhbT5paiv3hSOkNslkFb1PqUBA7D6Y06s/XSejzSvFyYTyBy7v
         2VGtsAx5iqtBBlhQemY5a4vqoQe7aUbjBuT05bUkfZGA8N3kKKkh4tlo7xw2aGAgi1RF
         j1g8i9MezkSaBXRc5aycyn9U0WCKV3fxJ150wODl5mmzrd5hkmXKvoflyqfk6lrUAJps
         dm2GTXAU5eqBzJBgn/zsVqtS3vHbJ+YvLRUTjB22Zr92NXaJYp2YIRWDpI2nxhFnH29A
         WaN+HPzixdKP56M1hMaLqncgx3ne9/5SGnU+ihQpMUcUo8rnklUdr8w8HE8q0VikS2h+
         JR5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9dM51IX9ozcXHROF/YLLR8Zs6yC6NeOla8cCkvej9k+S29RAd+Wv1+AyDzZxXFQ1HJ6akxOIMAYS2qVIO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdv6nP94tQKuFLRFCBVT4L4qZ7w+U42H3srHtg8OizK51NIqol
	kEW4eVjl94DZgGOVwoLTsguHeOUzt68ug3QGvF+931KFt7Z9I8c2nRP8D9+fcRzbnvHfpKCuili
	nqG66Sm6Al4MyV27deGtRwdnaID8rWO/Sn9+vbhFEZCloB+JcaVElZ9tb+Czs6lPJyyiU
X-Gm-Gg: AfdE7ck7kGNx5SF9loj74xiELJsA7wUZHjgT4PKiRXOQCEcVtaBS5/unDslUnukOOXc
	o9mCRV2/ZQXRylsqpx7IRo4u4McrbFLyn/jhsZrji1oEHZYw8pJR/Fw3Vu/DufS06vwObpQszZK
	aCQHFN+KK8fLTr1BzCZEEu34gpzHrDEMF0c7WuvqqdgenGOS/hdjGgUrgzpQ1TBM8gcfxLGc34U
	NPH6aPZyiOTGKX1rcLE1LWbv8GwYY3LfeGlRkoidHKQJ7qmxHm63Rsa2nc3qKOr2ek/cmjFB3hE
	3pFY/tGE1KmU6eD5XCtsFQEMAE4O4R+M2aJB6DfVPrEMOR4Zp92ixm7fl/m/XtSq5l2RprFcIHZ
	9ozynF5UGYRGahjfiWH3tt0KJTi+P1D/YCiYpMGPdvWwqCM+QayZI36Se2WaJ8Bqa6RHaiZQZ9T
	JI25zqNMWcT8wSMk24lRQHJqXq
X-Received: by 2002:a05:6102:6d6:b0:73d:cca0:a220 with SMTP id ada2fe7eead31-744e0091664mr4685332137.12.1783604546000;
        Thu, 09 Jul 2026 06:42:26 -0700 (PDT)
X-Received: by 2002:a05:6102:6d6:b0:73d:cca0:a220 with SMTP id ada2fe7eead31-744e0091664mr4685309137.12.1783604545522;
        Thu, 09 Jul 2026 06:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:01 +0300
Subject: [PATCH v7 10/18] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-10-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlX/9RVSn3JDVBEyI8Qd/76045hV44oJk/7
 xJ4zKI3WYSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1QtuCACSDz73theotU0s5d442S4yoLd4Qdst5ADMzPhvxkuJNshOgDJte4nD0bpQ73/VAGHFj00
 sanez87mSGnqz8AFTWd9jJvcr+xnCRejVXoN2Kn9MRUWFcGQpjh7dpfPS/tr6aC1/esbDEEwXXG
 nvOaMP4fgEMfZjQvwPaldcxjzD2n+vFQoINbgj6QoUoJlA12N5Zo7Ns7iR25wTpdyEusp0klsWw
 BH82tuBy+/hccgAq/Udg0gY/9OOO7nRlZypgbixB26FLgFrAAgHj2qfSbZ+G+l/LoRh4UKDBLVh
 GPjit74mpEMG+r3ajEOEzvpwFOa0YeSLHFIKAibgiBJZj7iX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXyZoVCM3itg1X
 Xg4v8K7KSWfG74edeExhnEi+9BbRywkaPR8oaowPUFmc33OSyHh0E1JZ+JZcVxADMlFKCJKm5LM
 bC+9m+3B9R+f2MPN16SaE+IMNsTs6UA=
X-Proofpoint-GUID: LPAf_qnx1xkR-jY-RLWUKASBWT01xM9R
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fa542 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: LPAf_qnx1xkR-jY-RLWUKASBWT01xM9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX1k1ZRwRdMlBn
 8znAtr33dDEiSeS4Tqdw0gLjLDH2daWniR6jPAmOm6NM6UCsrk4pCiQRNqXVYrK3TZayb1rR44W
 MdDf7O5sS+g0Y7XzdH1u+hdaDQ3s+jg6lTaEwebZLMNsoaDito9MQ3QgHKYOyzZd6oMJB2Df1+B
 f47jbKyG7MfEf+9Fb07WTu/Hj5Bnnd9KWKJb8m1A2Iekzu8fGNY43hdDLHWqMx28/yG6SFpsWRV
 2p+wLqoqEHSzBzFKUBgzidaLxigqHxXzGW0tui0jPVBSIaszPlpHhPf24mESFHkDyO9sOMk/rXK
 9NEUHta0++xWUOTiYu5G0u+TUoY3Uk45Qxf/T0db4WxkUkSG2Q5WJZCC/YePC6RbCNdIf8QXfSe
 mGv87znRB0ZgIoBgDMR//Jun7yetZi0C2Bkiuw0SisCOR/DTfy2WHNeNV4v34MUg/Y2nVO8XNL1
 edCemosag0DM/HNlXeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118019-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF341731D8F

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


