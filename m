Return-Path: <linux-arm-msm+bounces-112912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oZBMMPDRK2rBFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:31:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF46784F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:31:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N0lp+KTQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="LSvceLR/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112912-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112912-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB0234D0EE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07493812F2;
	Fri, 12 Jun 2026 09:26:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B311530F94D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256366; cv=none; b=j805+wPNLeAegwx7piZoPLOCH4Sknpck0mwC1xPnbr4XhlLabKnHyzWsLHuUucEexDmVANloUBjaSXo5+3cZcX7Jb46+5IY/6jvfloaavE390E9S0mYNaH6iL40KMV5Rh1xFoimxIrWloTKQHEsNLUh86tzWRWybiR/3BMh49Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256366; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw3S6HFhQV8uk+XOFyNzHoWCHeHsntCb9NQqophv2FwPWMK3RugaoiGU4LbjtAlV2oKOm8wrqOGeLmz52aLVIjXkEYntPODnpsoJiD9N725K15UFkFicQ9aD2ht2lMC8oDRO9smdjQk3rxp5YU2TeJvUMX0CyryjI9aYnawXPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0lp+KTQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSvceLR/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39X782516152
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=N0lp+KTQW6pkD7Si
	l7qUOvhY/D8RR1ZiLGw4IX7+TazNgOwuKHn0jntZPT9V5oMA3HzQx+yBRynFF0GK
	zGwHsD2PZA8wDctJYwKDGX2aWrWkbjvUfvDk6S2XL+i57sLid6FBrB0r1ekmCJJS
	kbDl9CpvcrJjQLLJisnitGecw3grRpqNQaWxgPF9YNO9TQpKhf8oKpRWIgfkznqP
	UchUbygKKKGyfX8hsVaMLnFu62eN1hK/UnZ8P1MaNwdM7jIQ1Kbfn4fO1aliki53
	LfURV0sbueZsrZOSr4ToGTrq6lw245YyWtYtFThh0Aq/8rD/PwyAdHFtKKXzMY1c
	VnVL9g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72cg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfb3463931so710575137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256361; x=1781861161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=LSvceLR/FLQ6T/Z/VF5JsSErqtktlkKTrG2l65ynn5sP4rxkffDTqVj4Mwz59/xJVt
         DGMXMBNIbgavitrhj2XmoWqJH5RCW4418JtwJ6nh27iFDDModundtB+3dawSc33VcrVB
         7qOu73IP4mD/CwSPuPqXlQxQpRycdxXp96syXz0AmGt/c4ERljxK0M1knCBHVLNzPSQc
         eszcpiq5IWVLqY4vP0037JIgjSmRPwWAAeNyAyCxjDWkPSHORPac36NiE/PY+eG2skvS
         o2TPEifZ5zXd79xUW0p+1nmzNpyxUOCsaG1GcY4IZBzZCorJpYsgXT/3VQbOohaAJd+/
         5e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256361; x=1781861161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=c9+s9voGrbJeIlmy4EghLnZdnE1jbJf+wBar3k6oAlRgLSTvCsdLSUIB3LcuDz60s1
         BtejnZEWlDJ9G0k3S8xi9fWQrCANr5b7XWfyAE85P7NwynK14WoykaWBsncGRUPwVe1e
         Y7N8jzWKkRoQKYxT3QEVNkpQPszc6ki8M9jjhFgTs4C4VuFZWXAdiiwZzLjTKMNN8DOa
         or1hdNXFrZLRBOUu+J1xSNr3rIxILqGTnjhzfwsp8b9qGBxOKirHOfI13FyHWWfdzgve
         wHCcBON2tOlkrs3ebxVW+zyIMCIr/ssEe7X1O8BJcgROIL88r02joebn2BZKQ32gA6+g
         +ERA==
X-Forwarded-Encrypted: i=1; AFNElJ8tXUQkmSYZ37YIvD2S7YIw++p7EODtDn7Cho+38mjW9jEjqjp25JU1zTX3Qxe6WVhkZn9Rbb+yp8iwx7bG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Y5Sod8FEOQonbuzAIiTjjMW9VT9SxaJ7GZ0i+qTFyicdvWn5
	RLq+DjmZy3w2KOq4BXaPGnsywek8BkBg9AXcDKFxxSK9kj/dP9bylNW7g2R50nvumyAdL0Y7oHb
	Jd3GmLr+6Pq2NxI/vw92ZBeZ71iLcicgltnRisyb3v6o2ZoDEc6NuZM67glxDgIRVKsPF
X-Gm-Gg: Acq92OH2uaR9xhkVMGQnTOzxnj2olYfpbO32AQ5nQI7380JxJm471x4nxTfo13xD/pr
	jdBDvKPK7nC0zXeNVBbVsjHYRML26pfP4756R8RSrIt9t3oO2AkVkUdj4/cs84k5K0l/x+LSCRs
	0G47rC85+tdxHfie1GA/vxYHMo3jnGIV9mg98/9Vu89a0zI9SOhYVa6q2r6OlEtCjMVpIVFAL6F
	nlg9kFfyoEBTMJbAN1RNPVt10JOpq5XGEVnjpfyBSwO6JSdCNDD9lG6Xlkc5uEqbUgFlioEooP2
	ymwcNwiBbdJbRNQ9GAzi6FgMMB1eQVzbTxm07tOzFXFCAq5q/r1HIgxr4rTGn/LwpU8w6K2pDe2
	jdtEWTeAJY7LnWD7C+CI2pAVWRCv2k0NPb25SWnhNaenil9GobcpaAZjooEzbWJHGrN7If2IAOs
	smrOFWgI5dRyapv2A+gga/n5V2HYl6wXJPHsU=
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr803595137.2.1781256361117;
        Fri, 12 Jun 2026 02:26:01 -0700 (PDT)
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr803574137.2.1781256360680;
        Fri, 12 Jun 2026 02:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:40 +0300
Subject: [PATCH v4 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-8-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQzimk7CfvnnnQnvM5Hl1meJWWFSD8oLzR2
 KXbIgmwWBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1WA9CACAN+xCfByVuOkvI4/VINKTW32xKp94696jqfK+4hKhstfWSAhkJgNPk5QORhUUlu4qbhT
 5trWiTjxwSN4H4/ccLmpmFOj9IWy8I5v2tnXCyzbnz+NPt9qFT50crT/JuFMpC7KBbh0bTVpJGO
 DY27k49aYB9nS7pnUCstiT5jERdV3j95swRHSIRgBiEv9SAGI32TL7xwREenVCRtZuVMhGOyPiE
 SX9MokSEXM/8ID5dPhhpmtKFJuKCQ6MAhOR3/sQfmDzqMEMC9aSngPemX+U/6fBbz4W02w3rtIa
 eJ3hxiMTHPtZvObl/TzHCGoiWYiPm+Y9jKjGfH+rUFHa6DZ4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QtViaZvzfcvuvCa5_6dwsZQm2itN8C-f
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bd0aa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: QtViaZvzfcvuvCa5_6dwsZQm2itN8C-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXySWa0Pb+Q82x
 C3XpFesihwAydwrvDxw90ul7FQAM+3sEMUWwwyvIuPGQsoxJmRYVDhkax8Z5c50EzoA6QRRdk7A
 eIvl6RJBtgnXiDQCkuJI/aw6pPBnnv99aipalQbPRNAa/Nm+7o4siVrJF3av1Lheu3R8vLxbHZq
 ZIu0etE5SloZGjWSazLokkdt0fmruZNCqqdDUawSXbeXmwzwqsFwVGTEbqUOB/x8GyWbpRQtdyr
 WEsLuKAnPLspGrs9nrkw/9t7c8tpWB4STYSbhCRBYcKvqA3ZjTHrdTnnJCh1WcGZ0bS8yXmmFDn
 TNP7DTuQTlmDcUuQT27wiYRpNXdX7djelCQYgm/j3hMB/UnpqORsH6oTn6JKxDPMh1wZabuWAIX
 6Qq3LLd5j0a2Ej6MVs/16M5AqQQjAa0NRf+s971Z+yvMvZYSqMhsMBBi7osNn0fKZZh4p/TGuzC
 +dySsBygmnk43PXfNpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+qLW/wBOFMnJ
 AH5XRJXQ4yQQp4xD/nlccxGww6b7IXRreIgfI50q/ZoWUDSLUsM7juc7iVPMNKZZU8np3OzBmgU
 2wSei7ZF2EmSKP2Ud/rPrWwPirgkmQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112912-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15AF46784F1

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


