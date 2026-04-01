Return-Path: <linux-arm-msm+bounces-101243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VeMbORDAzGkWWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:49:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CB37569F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD7A1304AEF6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7BD33C51A;
	Wed,  1 Apr 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2bkts8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qvhfos2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ADF33ADBF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026078; cv=none; b=dLtIsNnPChnNEiQUkWOui17ll1awowNkUunkzj5G8O9CZitArRti8nwvVw2eS1HZuFLmiycmH7UhjFiQV2P00VhT3IKF7SO2YZTIwfTaBa4hExpOmaNF65FdTSeDbxhNtIxlqVdN6NCcC0v+q++BgK2d4IYtkdg2H6MEPygpD2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026078; c=relaxed/simple;
	bh=GKfB4XCvGFyrkr9ngUp+TtAm4vS2L/Ij6fUAC8kLEPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMegXlA7c2VtTsahrr+r3CtCqfh8F3v023WqtM6VxY1P2wRYhgq63e+KHPZXJCmb8ZqB8w4rFSqcRO4Mfq63DQme7TdjJubYs7HVvmO4pglLv1Nq7RTgE3yl1UAZMn5iyU2nsM/xt5qfTHNhDsWVWCd6rbenhM8a8u5eQnOkQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2bkts8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qvhfos2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316CTDD639226
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dObSEmk3PeBkAWkRIgKToOjNv90GPziX5C9GjBTxu+c=; b=Y2bkts8yHyL5qPhF
	kVtroPEFMvfUFifSr/NTMgJyB5MzKTR/kbg2oWYLRiEq9oEqRC0s+6c7RKlxsnt6
	rZPUpznfwufoiKB9oHmGu0O5+PYQhvCdn1wcMAbi+5iRErUpD2ucbdeqeDEvD+6d
	qtRIK2OvLv1f1b0VAL4XG0vPY9sRHOr6iXWK+ubcKpItLtPUFPX9A2cZQpTETxLY
	/qUYI0QspNo8PCar9xW2qIQXV+Evok5H3xIgtLOz5wYX/Us/tfNuReqkgc51msUm
	DB4NnYSdO11+5lkKGN1l80sKC84f4b3XofsZPc26KcnvAhzoT+bTfGrvHNB2n09O
	IKcUug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2ausbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:47:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0b57e192bso52032705ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775026075; x=1775630875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dObSEmk3PeBkAWkRIgKToOjNv90GPziX5C9GjBTxu+c=;
        b=Qvhfos2m1kErE3Mvu9X8NNsXEcLBx5ePBFbfIcK3zp5hXBk4Slq8kEqDFk+WOg1qSk
         rUnC96dvVOiP9zBQ5T56j5Yr9RjSXb9XRssy7Bj7IfVSVb9N8qdYEV8mt6yrj1JJC/J6
         qHaQQMd3EbpjsAtpvuL+YVjwMIyJCYYzHvyIzz1pKAfRkQ3ddAfRtILJZRraJvc5W5WF
         kUA5pUOsV/rJEjJHJy9lktWELCmJWqolG47oKcnebt6wkmKvCzPYKuXpjHQHYAhLfC0/
         0rnLpDHyV3AcklpqMP9OR5Y6hqzus0STVd+OMYbt2hcvO24VEOnl3BNedd5XGzgFcJq1
         d1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775026075; x=1775630875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dObSEmk3PeBkAWkRIgKToOjNv90GPziX5C9GjBTxu+c=;
        b=s9RAXRwBIdJq2ngHcyga18+OWM1Qza0yb46gf0Onf1CTQrJzURIGlkVsVzzpld0JxY
         FIXNhHjQTdTSsi8bBJdOLpupzC11f9sPFqABd842agVAJp2uru9/D7YAuBmkdvTy6d8D
         EpE5ZMiVlDlBaf35vYSx30c5VLblA8MchVkXT8h808Khu396uEH47La71/G77rWQWZ7G
         i6TiZUcUZ6i99saNDAWDQAQ4/ACJkyCpw/ebq++8Kb/mmasepXMSIIdcIXSafmKpOUCW
         f+flM4SZNxxisgmwEteLezxXamRKlITWYODdVPL3yBIqW2ZNmWDEtAIGpqO21czjvcny
         lPFQ==
X-Gm-Message-State: AOJu0YxHd7/tceWLwtZAlTu/zAjwYu6R/LiAddOY+A+ByeGDOtcGJbF+
	m+Wo0AyEQEe0jzlME3yYbcX7jzqlB+ahf1B0R9td0qwcDLbJgZ/9DTMqtQBljeRzfOtV+r8S6eL
	Royj/8U0Dos+HqLg04h3Pzo6t2CKQUqmYmzzcRwnDTEdOkV4OJZMCIMfmbtry0lLxhLrgFdZuIX
	wH
X-Gm-Gg: ATEYQzy6TlB7Jl10lCYgfmrjP9xsAegP1d3T9IOm4+/uGwA6/xIJKNgeH6tCVCptfOa
	wBdH+BxMKzrPmGn7ENc+Pmhek89Gvq00BvQ9I9qh3sgrrJ3+P7GS6NW7OjRQcYgc+Ee6ujoSoJF
	TVJTOOxUR170lUJZ783TqwmFX+4mkoVjtcdVr+adg91wlgeS92Dquu6R5CQkoZatf5bsKFkiVmS
	GVxHhSVYWtx2DEGf0e2DjBHAK/3qqDfKjDklyo/A38pOmPmB8ie3zk7fNzSSvBxSyC4siRVwQ6T
	N7gttU9gmF8FPBqd9TJelQ8lRuHAxXjC3no/wHim20Hae22z/jh3hBcpKOzOp+BcJPZx4yAfOR3
	gmwVLYz6KmANMTvF70AH4Tz2B5/sEM6HcR6+wSYV1YloaUpOzK2HEkDmNmSadPgvree2eb9OVRM
	X9psMKpDPZ5NpYMLVE6gj5d7Aflt92qN2W
X-Received: by 2002:a17:902:f611:b0:2b2:4a9a:b149 with SMTP id d9443c01a7336-2b269a805bfmr24184395ad.9.1775026075308;
        Tue, 31 Mar 2026 23:47:55 -0700 (PDT)
X-Received: by 2002:a17:902:f611:b0:2b2:4a9a:b149 with SMTP id d9443c01a7336-2b269a805bfmr24183855ad.9.1775026074687;
        Tue, 31 Mar 2026 23:47:54 -0700 (PDT)
Received: from [10.79.197.42] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b0csm172865905ad.50.2026.03.31.23.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 23:47:54 -0700 (PDT)
Message-ID: <078095b1-02f4-4ffd-827a-341a282dfbdd@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:17:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <20260327-add-driver-for-ec-v7-2-7684c915e42c@oss.qualcomm.com>
 <0b7b8415-7039-4bad-8079-ea3280891f68@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <0b7b8415-7039-4bad-8079-ea3280891f68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1OCBTYWx0ZWRfX+SsQC+mwZkHw
 FzsxoRIRHcmUdkVf7k8oJXrpaA5y36h1f6erZW6nJtMx2Y98DI0g5HjuwcOGlMey5jFNnECTdBd
 EVN4l4BpyC4MfbXVqe/GldmFa07fMIPmBaLmXSCFGvX3sFetbcT86JHRDo+fW/hxmQFmyPvQ3UT
 KZV9nL4u+9SC3ptuMCafAcunYV6mJoaU7GDGOtQmUVsEeGxrpCb669Uuq5Xn4SoBFw8eWB2gmMN
 DBCt4xVlaS+K6XIoz8nAij3OUagAm6vG0bE9zGjs/vMk3jzPpsBxotUmsSTBSGSQfIl2KmYrvJS
 d61fMlQ33az9QhLyKoFKbs+E/YAKoczyyA3q2X6LVBUovrUBWEfCXrgyej3B8iq/4W8wgJXyJZB
 tQe9ZCtDqy9+nS7kj175+11Umg3+Kq7iiaVecpTqhJHTldRTcxreCuGS1TSAq/425bBpm3Rc4fx
 2lc5WsaC4+AiNrPmGMA==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccbf9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=IocnhmzPMY9-xWXTdeIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: hqAinXHb93NMqNqKnHAlCJESVOlLt9ak
X-Proofpoint-ORIG-GUID: hqAinXHb93NMqNqKnHAlCJESVOlLt9ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010058
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-101243-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 163CB37569F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 9:07 PM, Akhil P Oommen wrote:
> On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                            |   8 +
>>  drivers/platform/arm64/Kconfig         |  12 +
>>  drivers/platform/arm64/Makefile        |   1 +
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 451 +++++++++++++++++++++++++++++++++
>>  4 files changed, 472 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 30ca84404976..536dfd9adff4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21804,6 +21804,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>  F:	drivers/misc/fastrpc.c
>>  F:	include/uapi/misc/fastrpc.h
>>  
>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>> +
>>  QUALCOMM HEXAGON ARCHITECTURE
>>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>>  L:	linux-hexagon@vger.kernel.org
>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>> index 10f905d7d6bf..025cdf091f9e 100644
>> --- a/drivers/platform/arm64/Kconfig
>> +++ b/drivers/platform/arm64/Kconfig
>> @@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
>>  
>>  	  Say M or Y here to include this support.
>>  
>> +config EC_QCOM_HAMOA
> 
> Enable this in arm64 defconfig?
> 
> Anyway, for the whole series:
> 
> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Nice work. I have been looking for a way to force fan always ON since
> Hamoa. :)
> 
> -Akhil.
> 
>

Thanks for Testing this! Will add it in v8.

Regarding enabling in arm64 defconfig — that's a good point. I'll add a
patch to the series enabling EC_QCOM_HAMOA in the arm64 defconfig in
next respin once consensus is achieved.

Glad the fan control is useful!

-- 
Anvesh

>> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on I2C
>> +	help
>> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
>> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
>> +	  control, temperature sensors, access to EC state changes and supports
>> +	  reporting suspend entry/exit to the EC.
>> +
>> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>> +
>>  endif # ARM64_PLATFORM_DEVICES
>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>> index 60c131cff6a1..7681be4a46e9 100644
>> --- a/drivers/platform/arm64/Makefile
>> +++ b/drivers/platform/arm64/Makefile
>> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> new file mode 100644
>> index 000000000000..0f883130ac9a
>> --- /dev/null
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -0,0 +1,451 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/slab.h>
>> +#include <linux/thermal.h>
>> +
>> +#define EC_SCI_EVT_READ_CMD	0x05
>> +#define EC_FW_VERSION_CMD	0x0e
>> +#define EC_MODERN_STANDBY_CMD	0x23
>> +#define EC_FAN_DBG_CONTROL_CMD	0x30
>> +#define EC_SCI_EVT_CONTROL_CMD	0x35
>> +#define EC_THERMAL_CAP_CMD	0x42
>> +
>> +#define EC_FW_VERSION_RESP_LEN	4
>> +#define EC_THERMAL_CAP_RESP_LEN	3
>> +#define EC_FAN_DEBUG_CMD_LEN	6
>> +#define EC_FAN_SPEED_DATA_SIZE	4
>> +
>> +#define EC_MODERN_STANDBY_ENTER	0x01
>> +#define EC_MODERN_STANDBY_EXIT	0x00
>> +
>> +#define EC_FAN_DEBUG_MODE_OFF   0
>> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
>> +#define EC_FAN_ON               BIT(1)
>> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
>> +#define EC_MAX_FAN_CNT		2
>> +#define EC_FAN_NAME_SIZE	20
>> +#define EC_FAN_MAX_PWM		255
>> +
>> +enum qcom_ec_sci_events {
>> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>> +	EC_FAN2_STATUS_CHANGE_EVT,
>> +	EC_FAN1_SPEED_CHANGE_EVT,
>> +	EC_FAN2_SPEED_CHANGE_EVT,
>> +	EC_NEW_LUT_SET_EVT,
>> +	EC_FAN_PROFILE_SWITCH_EVT,
>> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
>> +	/* Reserved: 0x39 - 0x3c/0x3f */
>> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
>> +};
>> +
>> +struct qcom_ec_version {
>> +	u8 main_version;
>> +	u8 sub_version;
>> +	u8 test_version;
>> +};
>> +
>> +struct qcom_ec_thermal_cap {
>> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>> +	u8 fan_cnt;
>> +	u8 fan_type;
>> +	u8 thermistor_mask;
>> +};
>> +
>> +struct qcom_ec_cooling_dev {
>> +	struct thermal_cooling_device *cdev;
>> +	struct device *parent_dev;
>> +	u8 fan_id;
>> +	u8 state;
>> +};
>> +
>> +struct qcom_ec {
>> +	struct qcom_ec_cooling_dev *ec_cdev;
>> +	struct qcom_ec_thermal_cap thermal_cap;
>> +	struct qcom_ec_version version;
>> +	struct i2c_client *client;
>> +};
>> +
>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> +{
>> +	int ret;
>> +
>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +	else if (ret == 0 || ret == 0xff)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (resp[0] >= resp_len)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Firmware Version:
>> + *
>> + * Read Response:
>> + * ----------------------------------------------------------------------
>> + * | Offset	| Name		| Description				|
>> + * ----------------------------------------------------------------------
>> + * | 0x00	| Byte count	| Number of bytes in response		|
>> + * |		|		| (excluding byte count)		|
>> + * ----------------------------------------------------------------------
>> + * | 0x01	| Test-version	| Test-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x03	| Main-version	| Main-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_read_fw_version(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_version *version = &ec->version;
>> +	u8 resp[EC_FW_VERSION_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	version->main_version = resp[3];
>> +	version->sub_version = resp[2];
>> +	version->test_version = resp[1];
>> +
>> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
>> +		version->main_version, version->sub_version, version->test_version);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Thermal Capabilities:
>> + *
>> + * Read Response:
>> + * ------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (excluding byte count)		|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
>> + * |			|		| Bit 5-6: Reserved			|
>> + * |			|		| Bit 7: Data Valid/Invalid		|
>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>> + * |			|		|	    (1 present, 0 absent)	|
>> + * ------------------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_thermal_capabilities(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
>> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
>> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
>> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
>> +
>> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
>> +		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t qcom_ec_irq(int irq, void *data)
>> +{
>> +	struct qcom_ec *ec = data;
>> +	struct device *dev = &ec->client->dev;
>> +	int val;
>> +
>> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>> +	if (val < 0) {
>> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	switch (val) {
>> +	case EC_FAN1_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
>> +		break;
>> +	case EC_FAN2_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
>> +		break;
>> +	case EC_FAN1_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_FAN2_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_NEW_LUT_SET_EVT:
>> +		dev_dbg_ratelimited(dev, "New LUT set\n");
>> +		break;
>> +	case EC_FAN_PROFILE_SWITCH_EVT:
>> +		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
>> +		break;
>> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
>> +		break;
>> +	case EC_RECOVERED_FROM_RESET_EVT:
>> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
>> +		break;
>> +	default:
>> +		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
>> +		break;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
>> +}
>> +
>> +static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	*state = EC_FAN_MAX_PWM;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +
>> +	*state = ec_cdev->state;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Fan Debug control command:
>> + *
>> + * Command Payload:
>> + * --------------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x00		| Command	| Fan control command				|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x01		| Fan ID	| 0x1 : Fan 1					|
>> + * |			|		| 0x2 : Fan 2					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x02		| Byte count = 4| Size of data to set fan speed			|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
>> + * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
>> + * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
>> + * | 0x05		|		|						|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
>> + * ______________________________________________________________________________________
>> + *
>> + */
>> +static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
>> +{
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
>> +			ec_cdev->fan_id, ret);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>> +			  0, 0, state };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ec_cdev->state = state;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>> +	.get_max_state = qcom_ec_fan_get_max_state,
>> +	.get_cur_state = qcom_ec_fan_get_cur_state,
>> +	.set_cur_state = qcom_ec_fan_set_cur_state,
>> +};
>> +
>> +static int qcom_ec_resume(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_ENTER);
>> +}
>> +
>> +static int qcom_ec_suspend(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static int qcom_ec_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct qcom_ec *ec;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>> +	if (!ec)
>> +		return -ENOMEM;
>> +
>> +	ec->client = client;
>> +
>> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
>> +					IRQF_ONESHOT, "qcom_ec", ec);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	i2c_set_clientdata(client, ec);
>> +
>> +	ret = qcom_ec_read_fw_version(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, true);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>> +
>> +	ret = qcom_ec_thermal_capabilities(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>> +
>> +	if (ec->thermal_cap.fan_cnt == 0) {
>> +		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>> +		return 0;
>> +	}
>> +
>> +	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
>> +	if (!ec->ec_cdev)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +		char name[EC_FAN_NAME_SIZE];
>> +
>> +		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
>> +		ec_cdev->fan_id = i + 1;
>> +		ec_cdev->parent_dev = dev;
>> +
>> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, ec_cdev,
>> +									&qcom_ec_thermal_ops);
>> +		if (IS_ERR(ec_cdev->cdev)) {
>> +			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
>> +					     "Failed to register fan%d cooling device\n", i);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcom_ec_remove(struct i2c_client *client)
>> +{
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct device *dev = &client->dev;
>> +	int ret;
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, false);
>> +	if (ret < 0)
>> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>> +
>> +	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +
>> +		qcom_ec_fan_debug_mode_off(ec_cdev);
>> +	}
>> +}
>> +
>> +static const struct of_device_id qcom_ec_of_match[] = {
>> +	{ .compatible = "qcom,hamoa-crd-ec" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
>> +
>> +static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
>> +	{ "qcom-hamoa-ec", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
>> +		qcom_ec_suspend,
>> +		qcom_ec_resume);
>> +
>> +static struct i2c_driver qcom_ec_i2c_driver = {
>> +	.driver = {
>> +		.name = "qcom-hamoa-ec",
>> +		.of_match_table = qcom_ec_of_match,
>> +		.pm = &qcom_ec_pm_ops
>> +	},
>> +	.probe = qcom_ec_probe,
>> +	.remove = qcom_ec_remove,
>> +	.id_table = qcom_ec_i2c_id_table,
>> +};
>> +module_i2c_driver(qcom_ec_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
>> +MODULE_LICENSE("GPL");
>>
> 




