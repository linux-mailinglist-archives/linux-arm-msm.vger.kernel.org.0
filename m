Return-Path: <linux-arm-msm+bounces-91674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CWXC7vqgWkFMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:31:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89025D90CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6211930A6581
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CA834104E;
	Tue,  3 Feb 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGj0sV16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q00qQlC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43457340286
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121538; cv=none; b=cDsyJBTQPao6MB5cZ089u5c8hvZovubX4+Gx3UnOk32SMuj7RTRnK2uyX9Xxda3yt9LS/OmyVrnvIsi8Axr8Q1xjo6mnX0p9yjclO3GkFbRxpzT/g3GdNFCRWM36Ut1VmUYXKsA/F4xnaVhRnwftfzQ5eFulyb0vOYgOcTMSpgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121538; c=relaxed/simple;
	bh=q0BC+UNwqgkm+AoQaAiSVdLDeuvHClDj7duIXglk7RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWrivuMb8/ACWREN/zsgUjNw72k9+0g41Mz2a+YD3EpoEzJOfvDo5VhA810oPC/WJ7QEAk2ylOU/PyaXEEcnliI/UFh1+HYoOD5EaIR93+rDQdAJ9LVIa8yF7dNUXXNPs8FrflE8QUXRoGnyW7phc2HLqAWfz849BnzlmvEUHi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGj0sV16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q00qQlC/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138o1d2849049
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kr9VkLymfmxS+ULRZoGX6sAx4XQrg7pGqU67+DmAAfI=; b=VGj0sV16COHQZLLJ
	bTb4nKpwOXw3jgTPBBQws41x/U6s3Y4GHDkTWd4XCppUqUa7kEzcLhPlFUxIC3tG
	0ja51DKluhhIqSGzXkEVPX5huOXPMKcIMFtosy62cKcN5RFX7HWYJzNfd8iZn60t
	+wXJg5qTXs6Tnrr9ef0R1u+BXA+ZYWwuvLLDtYiQbwfbb8ZCEkrc1wh9lrSHXVo7
	/YBj8OJmGetGdV2Bv/rT4uPuf2uSIUD+bgp5Bag05yntFq2Ry7nzDYZuIr9WuNeJ
	yGU4FRLlh1eBqYyDtTvU9rIL0OyymN2VGXkmiRurFaxpvXEwJMvgdXWUz616/occ
	Y75BoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutgne0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:25:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so162702685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770121533; x=1770726333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kr9VkLymfmxS+ULRZoGX6sAx4XQrg7pGqU67+DmAAfI=;
        b=Q00qQlC/6pzHN2a6IuqWeRInUzVhEz6/PE71B6LD1ndLLglFaTeA1RMiairbeWCsJs
         5CEYZm4WWLye1BTR7L1Zubo44zPB40Q26/Q3Gh6KLYex7U7tdODkncgjmndn01kEQCdL
         XBKDwA26zjZOi2xPmXXlSM03kWIGHGzYOSbA8U2natxY/mmkGBA1yNWaTYfOrpJ5al2i
         PyCXx/Na70S3RDuG1in3Vp83cMOKOoeZ8F8xm1WJmKardkSJx8w963ciFm0O7qU+h3X7
         gjSYQ82bz41ypvNrYiGha9pc74V4XBzB8pTdOc81ad4Ob55hi8EHCYoR5JZVPzodPq7w
         fpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770121533; x=1770726333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr9VkLymfmxS+ULRZoGX6sAx4XQrg7pGqU67+DmAAfI=;
        b=susabQu4VbmyWP53Aw3cJZsaju+ZnRqFC6+WIyUWlCxTVlcIJS5krpY75D62ovnlGM
         YF8GwgY52q3ax06Xhk8En4U3RxaTj2XetOF1VIZ34lAaF+J/YNskreoPRRqexgOeFubG
         NoAZh4D99SF7M2mJGNdfUT3RvrW7wEshTDc0Kw9TCRM4o68Rc3y8WWE7Xp19U67UfE75
         EqY2jAb87RZCqvSo5u3qUlja80iW9x+BhtY+JbTq+GTgPQ93oV9Kitbhu6anXtjVKvKL
         YmoBQR0X51Ae0kHC0Km7EoKJt3eDySADWNcxaV++eAHAhsTr5TpwrHUHY4GHf/uxmf/L
         jCRw==
X-Forwarded-Encrypted: i=1; AJvYcCXUL+yD9IkN9PPb8EZHflLZRY+Q2wPZxX9ajQX3+ODA1G2MY3gT+MGRlybjFQn7PzUfEY8LL2HnHcPWOliM@vger.kernel.org
X-Gm-Message-State: AOJu0YxkAaHbBfoU2BhkUGWcxftZeje8q/6GSdHVlgq/qUwgd/iQMj1X
	tcpXoy8RVAubWgciEnqBjmEBe1sFOqFL8uev9gteJcqmsnT0EoPRVi//eikeJYqNObe5RWNhM8Z
	Esbe1lPJDknW4H6ERWqLbSwQCBk26/e6xDlhfzxofMuZKkwipU5D5m3PaMzz2r/7bY7nm
X-Gm-Gg: AZuq6aI5t4/gZ9nNUEiPVHCiS43q1cEall9O52E37O7C5cOLC4NnW78fdeRfIMxYd0a
	RXNYBxTCJzgMBulu6YkySG5FQFjAMp6imudk7g3SgeXR61BCrlpAI7MQr4HzforXeQtkdB04i9+
	PDV4I7oHODYFlwRnnqodd+i3eS6e9Y2tVs8qqSw5bRJNOiHKRmI9s9OgQI7+BWaKKyaB34xHu5c
	nGmTQ+R08g6jO7RexowzbKTsgarWPUxTe49JVvIqqcpHjLERUIOyqLzQYzhu0h/zTdWjuiS9lcH
	d9ws7EZra8BAKQhbrnd0UIWj298d0quBJDS7TFQ+hFIn4rC15+FAfCYtXZtrnL7yyZLjAQ326je
	KiAe/rCHdL+3S2AoPlbSTt9IamKpfsXI2oduP60mseFYlHDYEaz7ks3l/leb7JOO90Eg=
X-Received: by 2002:a05:620a:454b:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8c9eb285634mr1499524585a.3.1770121533605;
        Tue, 03 Feb 2026 04:25:33 -0800 (PST)
X-Received: by 2002:a05:620a:454b:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8c9eb285634mr1499520585a.3.1770121533149;
        Tue, 03 Feb 2026 04:25:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffedd3sm1003274366b.29.2026.02.03.04.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:25:32 -0800 (PST)
Message-ID: <df7cbe46-153e-4959-911a-14600b3bea21@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:25:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-13-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202180922.1692428-13-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5OCBTYWx0ZWRfX7cFK/Y3wE9KF
 F04qzHl9rkwbcpl4Rcu16SaULR64VuSGAXja6von6CwtGbwS5arwMAsVNhhrPpNf0zQLB6MZCVT
 Z0lr65z73RbapazUZW5jNHbDd9Uh6Qi1YOPpj4mLDhnUHpF3vHDo70Warxfaj9VzKjh5tI/wRuk
 3nVSmQoyeLX9xCh80H2T4tFWeRRt/j8EXB27eWwije5zIufKIjrOTpL9RkTDZWEu6NenXWgg4c0
 yLcbNgXo3I/bz4HvLqeW8BYAgjTdBLUXXcTu/s/tg1HgNQv6Dfd7Edw1Qddch+h2FX0EPdJSwUT
 2HzkL/EYFHoPAGv4KWya5sJrGLl8RZH5vNggB576cqgfB7vM3tPULKp2o6kR9XVTNszTG8aenUI
 OF9QaUIgx9OXIKN7mk9KsWZ+lA1nOdRAExb/CWJJbD8b3BLJ3s2KjLUfUCX6XYO1Vvqoa3WLXzT
 jReTGB1svlZzGXHTAdg==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981e93e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LkbPghAf8A_mGgTKem4A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: hsFJBlQc8IzK5kQjdBSF30AtKKLCgZWw
X-Proofpoint-GUID: hsFJBlQc8IzK5kQjdBSF30AtKKLCgZWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91674-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89025D90CF
X-Rspamd-Action: no action

On 2/2/26 7:09 PM, Praveen Talari wrote:
> To avoid repeatedly fetching and checking platform data across various
> functions, store the struct of_device_id data directly in the i2c
> private structure. This change enhances code maintainability and reduces
> redundancy.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

>  
> -	desc = device_get_match_data(&pdev->dev);
> +	gi2c->dev_data = device_get_match_data(&pdev->dev);

Because you dereference it unconditionally later, this should be
null-checked

Konrad

