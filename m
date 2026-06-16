Return-Path: <linux-arm-msm+bounces-113283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id phENFliTMGp5UgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:05:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05CE68AC72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:05:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CjdZlHKz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qnr+xUG+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113283-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113283-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DBE6301E9AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6DE14F70;
	Tue, 16 Jun 2026 00:05:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2DB1DFFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568314; cv=none; b=Pxo9Z9oUiVzZ9288QG/AKdfXcAm85K5N4CC1HM1jJhVaqmEWZSwLxJcRcp9qE4Y7OWMrBgXvIokqzNtCrGI+cT/mXE2xbLTsmeRESEuDlg2ggJ3UL0+naTn4lJVZnCyPWi33kHoLvmIuS7qcdd08Sxc/CqO5IRizXYNCN7/gT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568314; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOELEfP9OOXdfxyXql7wo5IIbR+pL0mcxubPY6hUyQ3zNR2ZZLZEVxxPaNjjMTNhAeLQ0+qieYZW1nMhDBImfKJJPHfvRPyabJQrx6IpR+8m0HpEmBWSX3w+tCj3JGgoUXhKvHk+8IUgh36KclPB940kH63w1LoqpYckTK2/fQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjdZlHKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qnr+xUG+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx6023578156
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=CjdZlHKzuveyjQw7
	YwsNi27RzrJQA4UsbEj8mVq3pVbDXcfgSPCw9J3QrP5wDjPEHSsXAeUZBFCBKRlW
	uFmAaN7tDru6HwT1uEW1CDfWtvbeOutLlPanmBuuzzIkuVVOQeqpot4aTxKH+fpe
	YERg3RrnlnT0dfSHIkSgyD840WnmqRhGmTqw2dF6awOuT476SyZ4Lt+juHsPiUip
	X0v46uda2dZ+oB+jKDmazCcjrvNvT6zVJyEd0JbSavV5P+ZJYDddiuqzc2InmyXJ
	wqdHMn8ylN3iHFhFIGUsVwqyMK5OeYq/ivYklFJxnQHecGEkNpdJ7RAwjo1VSbDV
	Ebz9Xw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983tk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9159c4b210aso640365985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568312; x=1782173112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=Qnr+xUG++kmSAYXelfilaC/iUXWZp3UgPvORvAVKBxRgJV3ZXAl1lorxkD9LxyLfdT
         7W60TycvDLb5hcm+gGIDdUb/5VfnMgi0upv0M2dKHNFB9DUpAebpsWsuICGzdTa+4JGJ
         RosphjAepouLXOEcZuVrqqU/LjjEq7Q1ioIL8pvkslBKK7i7He5osc0DL+7NT4TyVOGy
         cGA2Gnmxt8Oa3y8i1MOcylzprJ/21ulj/IfCAVOyg4a/w/SuNwvry2B47rHhopsa5p7B
         MabMc+rxS/E1urgeFQmSr+7DOU8Nbh3WYZF4ydbW0cAJgogVT3rkeEEaXrDC6BE1o+Zw
         JDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568312; x=1782173112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=Akeo0bUfOoS+OA0Z0B5vnJhLJLPSzpJgBXX9IWeEXsm25ZmeDbHXPZ8GtAk93rBuH2
         yO8JME91qmfnq56316lRbQrM7bksyZDYnltfpNfjyuNane0tbx1ZOhdmYjHA07Aq4RxT
         EOzxooJYH9R8E5JFxokzgepyKM0LiHYW05YdnfpmpRTTDZJleup/zQ317uEJLG9APuLL
         +iDLxXpvy8EuwQpQu6Fw+d7Ifg9VsC14+CBz0lXVyLLN/jf8ceRcJn3RzHLwy1FDk+Sx
         Nq97295ygcUcM4wteXNU1lOaavgcdnTP+4vz9HIEttJEdC/a3A52S+2lyuJoIQmX8Yz4
         ADpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KNl9xXnA2/D0g64JOTK2ayzYfj60+IkpQZvLwerZosSMRYgiiJOUKdjgrJUuIEKVJ2lVAfhwhiEDVlHXL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sW9LE+h6wzyM2lm9LFI7qzFGKHETbcvjgzdfr9H4dewAbKkN
	+uu2rv410dyIGsQ8+Nc5nawZPKHfelY/Qo5n4R9kgrdoph7ARxTKSCGq/58N/HnhcdKq97KSGRk
	pNGVoSrRQVPZbZCaVmViIw7p6CM6Q7/3rAISGWgU13ldwcKooQrVr+HQuJNzmhWopQy60
X-Gm-Gg: Acq92OEjZrEt+931YZPysYc10PcrAxgOzXUq8zrpeVzuGlzNU3+DFkrQoHxu9v5iY0h
	6WvhATFEIIz/uyij4yHyDvCBMxGa+/7jMQpYalunsDvvu4YwewiavhSSFM7r1HbXwYOEK+ZtH1N
	/4ZYjypvMBIE9ujvWp9vouMoJljSQpVROqvYl5UDYfxcQWkrmbwSqJKOVhCqV74sBdyBh3VXNAx
	k8N5XGF24CsMQGFVnbyJaOs9x5mWw1rS2fHnmlGwynrtOCrZEwsXsVk1lus6V3ROZu6wzQaJ5+u
	7MMmZCzkcWz93MyZ4EXJYRspBI0OGsTDuKs3rAcp7r5FAUqfM3+kb11/7PsQThBH5F33wpyhmjw
	3zVZn8/aRiXqy4j/ClmCW9pAg+eZs6sdlMN0v4Romcc6SONGSEDnweqL3shX5q0EfcdOcQNWJiZ
	+Tz+IcVp1o2L5LyTsap5k+80UEzdOO24BmUmU=
X-Received: by 2002:a05:620a:4542:b0:915:ab5d:6763 with SMTP id af79cd13be357-91c2fe7f3f0mr239109085a.43.1781568311682;
        Mon, 15 Jun 2026 17:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:915:ab5d:6763 with SMTP id af79cd13be357-91c2fe7f3f0mr239104985a.43.1781568311253;
        Mon, 15 Jun 2026 17:05:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:35 +0300
Subject: [PATCH v5 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-8-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMPIuHDGDZAVSivYyEtXG2etJ47LOrQXsXzx
 AZctKuIPbCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDwAKCRCLPIo+Aiko
 1YQkB/0VGV4PJPIn/d60fP9t7WHD5ubQ7btS3FVmtwmzuj7EJumcknjG1dBkfSGvazVI0iK3Ix5
 rPINo5Ugw14owrtvPsFmX5eyepWLwCMvu2Rrh/3d3W2UjFYTflSXHRqlvscAgVrGwu9VgazquGk
 V/lNmn6KigDeIYrOICLL63KYK53rEQbow48A8p6GVBwGL6jCkDXLVkY+0jrSQT7rJ0uG4/qniPT
 XfFaVhkL/1zuGdW6uc+OphKbBLRNVTTlra8oUFcg+gURp10804kJZnoTEMWDsYtT2O30mHVpmuw
 bnU/dW18pZIULbaW/J5hTrWfMFxs0ulbeydiFgDc5YHyeFYM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a309338 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ZIcvz7GeGaKMMIKVhOb_NFDwTO_rThMX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX35U25Th7E2VK
 49q+EgZZvHE6X4VCIeYAYOgJAn6diQSryEXlLRsfl5fFjZxwujt9zPf3Mv1sH48lf25YyZRFSai
 tg1umIrjDZ60YpF+9PGZlt1BtMDVi3E=
X-Proofpoint-ORIG-GUID: ZIcvz7GeGaKMMIKVhOb_NFDwTO_rThMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXxVBADpkizl4a
 eoFFdm/YfR6ll56Dv6dpjXxOBw2iZx62eVw2HeBLsxieABLC2Y41tR0PaVAoOujGxhzJNOaw1Eb
 uHWUZIh3eVPTIuiqvc41BLraUmMvCNx4cV47y7kMT3QmgdB6bVPeGehE5Uw37jg74wg/miushLZ
 tNH91PQIy3ZSQF5qygqfAn6WAdy2yrBB+sIp1CieCFYMEXJGzReE6MucbObHooEhJ+k9d+IhLdd
 NUL/3XsrZjSl3cxvqMq2nWhfwT1QNMBj9JZ8/G75DPQ/A9co9etug3+PuZnL+xko+iu8fD4jN6l
 WpvE5dF86W6JVe4zFOdqgE1f0eUyhEimNC7683jHvoyN0e04jeupAl4aP8LqNyoohnftEAhhc+c
 HzKtowJHLMcKaxhrsk3CBUH4D/zZ5FUis5JF95UED/ZkLyZQIrPOCfGS7ZV+qm+jPlftVsOi9+T
 LF3checdtrsaJhMcZFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113283-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F05CE68AC72

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


