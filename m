Return-Path: <linux-arm-msm+bounces-115621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0OtiMR/gRGrp2QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:38:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7DF6EBA8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KErIeuBd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YsMVqnfY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115621-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115621-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91727300EF53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 09:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0053F2118;
	Wed,  1 Jul 2026 09:37:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605913B47F9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 09:37:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898678; cv=none; b=bPacddNyARvt1yfCcov3TzSlz6wr6hmlWjN1sSeLM5OV+6aF8YdbVtPcDfJPKedH+qUcczrImqZ3KjDWGBXFriRvk2AkjFiGDPYFab6YbSA0bWRlVEgik/ScreQvkbLY067MSmuOp/DGK1w4mBxjtMKdBwR8EB5nbuyunx9Mxsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898678; c=relaxed/simple;
	bh=IhViHuiHD+4a/eVxtydhx8UFtN9IIBo2uUmeHl4uCmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPQReCeJObgKaMPLm0fyChx70fxb80UVJSJ2/xS4VpKTf7k63S670H7b8vylo2x3o4upWeRQv3zhVolzcYH+Ybi23Wiwp2viTDidNRK9fyvDwqJD22Br4GlHtOohE/dU7mR7AG2Nktebhq9myGCe18/i+6MU+k+artDNRTW4gBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KErIeuBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsMVqnfY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GEPL497047
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 09:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=; b=KErIeuBd/daoSoDo
	ZrtlSGcQRj5csk6Thc1M//qNfOV0CqfHXWZPoig8YuaDn161ujoI11E+U3Y6jaTb
	rHI8gqwQpcSvVgX7YaYG3PbGom0IDhAqtWFpja379j9Gs6e4SC9mw4aZZw4RUnMJ
	GzxoAIqBD8jv+7BeZx4MGzX/W2hAbe5XkW7xaqzAigRFnlHRv9pup/MHaUlUXoBh
	Iz0BWg4M35Esuv9ZMofta2QkNfVFJ4xp52xYiw0DKHObcFAofH27NdwvWFtMt7oM
	9pT82fRWFXLq6G5fRILy8cBbM1D4/RYGsvE/10dZlEQ+iVwsfg5IwBd59xqNBi7R
	mjT0BA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbe3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:37:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847bdf7a7afso106540b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782898675; x=1783503475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=;
        b=YsMVqnfYSdis5EkD3HYJI36qswg1ArR+fBi5DjbdIerqES2QCRU6gAA5W87OEBnelI
         Val/zuDGYAGOOs82jsXMXGXsgE7sRrKD/akZdFkiWdkv1WhkB2R1P+9vauaDGCOgCDVb
         qovnw8KTyTH6zVuXEFYiVQdh8Xn37vQ5+zZSxzr9dR677iGz0vug/nt2U6Q79dxt2Omk
         lw1lCw0q0oga4iBUbPDkuAwMsuvErVH/WhVbW9g56H87qsLbvDWGcs+BPK52iVL5ClAr
         QZVCSHL2lw1amB87eikn9aBOeDhF6A3FV+6VW34tJGfFzvdmh90E25hVn5XRxTtOoibr
         iaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782898675; x=1783503475;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=;
        b=cFDYf7UNwI5dCOpfr6lxj3VlNpRmoCGNjWvoENGnkRchiKETNPAMD/OgZgMhHstYlm
         5/JfQ2S+DQdEaubylFwpVhvD/IF8dId3dUkR7N3sSMV37CNhmxJ8A8oOFDCK23j7ISmG
         9S5/2mx6dvhzPOZ6m3EvJa+HWUqQmm+mHbNL4cZo1KpE90b/h6qNbjYWUfrYqhHWFNuy
         ZrP6XlrDXdfH3cZlJnJhhp8SQhvbMrmai2UJboCgDd0jBs16I5zN5FEXYa2KeJECffow
         3J0QUMwWAn+OA84b6Kwd9ISSADd1iu2Jz4oB/h+aEDN1ySbUzCF9tJlf9HAOz74G20y/
         LWdA==
X-Forwarded-Encrypted: i=1; AHgh+RosLlfV4j2exv16YN5uEXjsticvsYj+0nmTH0866ZCQj0pMHuyoONhP45QqWT2UbzEWcLgaFYUR3LYZsoH3@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSSgDVnAYCehJ0WULzCynAuVgXg/jWgWC9ZDnTZGecH337euN
	lL+Yc62WEAdxT3lDd1eOike9tevuo/CIb9M9XStaZuZpx6cEZ3QDlU443rQ1o3Oc2o+yskYdrSN
	mbQ9ZeohZU9YNVHprVz+h2nG6/PX5WHGptKYLA9OF1J6yjbUxtgxr9mj9bwUl7tD/9ur2
X-Gm-Gg: AfdE7cl4/1hjZfhxAXJm2xDBvvpKAnzL3LcwwpKO7dl5cmKO6lU+AjR9n8w78mFw/4K
	Xe+Xi5pesryHBBL83+IP+qq2idfXp+ZlbHJEcleXJTMfV3av2MWV3S28w33BY/9rnY20JjBlkYi
	rY8vjvU4EQl2KUmJaBDa/iabw/MqxgbKiPkOrDR4bvwLoylrIixBvDb/PpZR2qtZ4FnzQw5Q2tW
	9tfgQkA1hDBZpa2lUSbrR/aURpgH/+7UT00NK3jLy9YGj7LCzC+5+dDJDI9r42Nbf156418YeIB
	TwUEIuo9lNkKMQEf4Sbgy6Xb4cbMZ3W0NM+6WeoN+lhvqc2K7R2IJ1ruRsbgVVD9BJNbYmSfTp0
	3B76keB2GUwjXgjtfhT2cs34/o6mgYlUgfd8eax8i1H3FmiaipB3wAsTHq4llMAvP1d4gCvj+qo
	sk
X-Received: by 2002:a05:6a00:2d9b:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-847c082be1cmr558463b3a.4.1782898675309;
        Wed, 01 Jul 2026 02:37:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9b:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-847c082be1cmr558440b3a.4.1782898674611;
        Wed, 01 Jul 2026 02:37:54 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3710945b3a.19.2026.07.01.02.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:37:54 -0700 (PDT)
Message-ID: <83ff7ae0-1804-4528-8897-bc5fc93373f9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 17:37:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
 <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfX9z43m7lfAOFM
 8PwQ5+2zYzQFWHpAXwNooEIkYlNPUTHQMnDt9ge9/zc+WUBlrMEi/XungQKzfETOIv84qO9nihj
 6ZsKuzhR3ci9f9LnfxoCw1HevE2D7X0=
X-Proofpoint-GUID: pTI4Yxhwb7OH4VR1-Ec0zNiw7Yejokn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfX3Ys/jMjcF14N
 tLNWgEN0ER0vfKCQJ5AGknkS6Y1jGIZT0lATl5pq92GPTOQ7/E4MgBn2ho/u8cTfGW8vYPtZ+Ei
 bwMWvwIDhhD/pdS4bjilBgpGzqBQKqveEC3hi5PoPQUguXX6gSshFrqYV0/KyRFi2vweKz7HIyy
 Pt2PMmPTd/cWbFl69C6JDG5/HL5ur+GaOnvDo0eRxm1h1jQeYMz/S7YTFRU2A2m6POkR4uO9Px4
 V9Z+BSkOGv6h/dWJG+kpnIMnEIWLcG5EWZ7Ocvdec9pB/KnoAvbgSZn3rORLYmTgMCCqVuss9Vp
 NQoWyEXn71c/7LnCat/DQ1w9Ft7yh15ov+fxhGjapOqt7H1dpZ2RFU8ZHwLo6UWZoJRs5pp0/Ez
 BfSOsrefwq8FuT3p7yqdZQgYVFQbicwdcQHiLd58hsF60K+b0ze9cBCSjORdI32A5gTZgaORp+a
 kZk115DX5r39+0sVYhQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44dff4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=j2ZC3VUGMi8-CnbsNg0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pTI4Yxhwb7OH4VR1-Ec0zNiw7Yejokn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115621-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[aiqun.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aiqun.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C7DF6EBA8D

On 6/24/2026 4:08 PM, Mukesh Ojha wrote:
> On Tue, Jun 23, 2026 at 03:05:21AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits.
>>
>> A new qcom_pas_attach() function is introduced. if crash state is detected
>> for the subsystem, rproc_report_crash() is called. If the ready state is
>> detected meanwhile stop state is not detected, it will be marked as
>> "attached", otherwise it could be the early boot feature is not supported
>> by other entities or it has already been stopped. In above cases, the
>> state will be marked as RPROC_OFFLINE so that the PAS driver can load the
>> firmware and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_common.h   |  6 ++++
>>  drivers/remoteproc/qcom_q6v5.c     |  3 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c | 68 ++++++++++++++++++++++++++++++++++++++
>>  drivers/remoteproc/qcom_sysmon.c   | 19 +++++++++++
>>  4 files changed, 95 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
>> index b07fbaa091a0..b0e7e336d363 100644
>> --- a/drivers/remoteproc/qcom_common.h
>> +++ b/drivers/remoteproc/qcom_common.h
>> @@ -68,6 +68,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>>  					   int ssctl_instance);
>>  void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
>>  bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
>> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon);
>>  #else
>>  static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>>  							 const char *name,
>> @@ -84,6 +85,11 @@ static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>>  {
>>  	return false;
>>  }
>> +
>> +static inline bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
>> +{
>> +	return false;
>> +}
>>  #endif
>>  
>>  #endif
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..a11d8ace554b 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -202,7 +202,8 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
>>  	q6v5->running = false;
>>  
>>  	/* Don't perform SMP2P dance if remote isn't running */
>> -	if (q6v5->rproc->state != RPROC_RUNNING || qcom_sysmon_shutdown_acked(sysmon))
>> +	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
>> +	    qcom_sysmon_shutdown_acked(sysmon))
>>  		return 0;
>>  
>>  	qcom_smem_state_update_bits(q6v5->state,
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 808e9609988d..8a0bb4b2e71c 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>  	int region_assign_count;
>>  	bool region_assign_shared;
>>  	int region_assign_vmid;
>> +	bool early_boot;
>>  };
>>  
>>  struct qcom_pas {
>> @@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>  	return qcom_q6v5_panic(&pas->q6v5);
>>  }
>>  
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +	bool stop_state;
>> +	int ret;
>> +
>> +	pas->q6v5.handover_issued = true;
>> +	enable_irq(pas->q6v5.handover_irq);
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
>> +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
>> +		goto unroll_attach;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (unlikely(!ready_state)) {
>> +		/*
>> +		 * The bootloader may not support early boot, mark the state as
>> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
>> +		 * start the remoteproc.
>> +		 */
>> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
>> +		goto unroll_attach;
>> +	}
>> +
>> +	return 0;
>> +
>> +unroll_attach:
>> +	pas->rproc->state = RPROC_OFFLINE;
>> +	ret = -EINVAL;
>> +disable_running:
>> +	disable_irq(pas->q6v5.handover_irq);
>> +	pas->q6v5.running = false;
>> +
>> +	return ret;
>> +}
>> +
>>  static const struct rproc_ops qcom_pas_ops = {
>>  	.unprepare = qcom_pas_unprepare,
>>  	.start = qcom_pas_start,
>> @@ -515,6 +577,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>  	.parse_fw = qcom_pas_parse_firmware,
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -526,6 +589,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>>  	.coredump = qcom_pas_minidump,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static int qcom_pas_init_clock(struct qcom_pas *pas)
>> @@ -852,6 +916,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  
>>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +	if (desc->early_boot)
>> +		pas->rproc->state = RPROC_DETACHED;
>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto remove_ssr_sysmon;
>> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
>> index 913e3b750a86..a0830a48b1f4 100644
>> --- a/drivers/remoteproc/qcom_sysmon.c
>> +++ b/drivers/remoteproc/qcom_sysmon.c
>> @@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
>>  
>> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
>> +{
>> +	bool shutdown_state;
>> +	int ret;
>> +
>> +	if (!sysmon)
>> +		return false;
>> +
>> +	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);
>> +	if (ret) {
>> +		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
>> +		return false;
>> +	}
>> +
>> +	return shutdown_state;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_irq_state);
>> +
>>  /**
>>   * sysmon_probe() - probe sys_mon channel
>>   * @rpdev:	rpmsg device handle
>>
>> -- 
>> 2.34.1
>>
> 
> I tested the series on Hawi., it works but unsure about newly introduced
> stop and shutdown status checking why is it required ? I think, you are
> checking this for sanity if it is left some random state by the boot
> loader..

The stop and shutdown status checking is to address a valid scenario
which Stephan brought out in previous comments [1]. The more improved
robustness for rproc_attach fail cases including Ping-pong is at [2].

[1] https://lore.kernel.org/all/ahBG6jKYdSAboWjs@linaro.org/
[2]
https://lore.kernel.org/all/20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com/

> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 


-- 
Thx and BRs,
Aiqun(Maria) Yu

