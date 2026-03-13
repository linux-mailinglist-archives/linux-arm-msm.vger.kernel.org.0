Return-Path: <linux-arm-msm+bounces-97391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cORFFf3es2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:55:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBA280ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F811302A57F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F8538838E;
	Fri, 13 Mar 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhbjcMKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isfkRUtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0542A38947F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395654; cv=none; b=hQDCbSiKxJOcttCf/+6K5VuF7lKAttnmVk9EaQVaJQ4HjfP9QPr4x7eT2idHo+yejyGBZ0Sg6qqxulJtexNqA7xPgdSopUSsavQ0Ep1SNsTj5/nH6EWfQiJWMQW83jfggJtHko2PS796YH8sE7pobU1n9SqPnijK/DMT0EL2Kw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395654; c=relaxed/simple;
	bh=jF+RGW1oq+A2HAK5SMqoEpl7vhxLMd3h55OdaY/EqoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFHwAegXvzP7PNUWyyHNirPHGWVGV3jWjqZeNNIJ3Ns2WFe7fXdM99bpl9zvpG/O54ovLi1ZlDBeHMydtW/3G2lodba00yjMnslKpUW9B+P5UZXErMy/KwdnCIRBu2I+L+Vn0AxnO1ZsRhFJvD8V3xWRxYqIJCWLnDdh85O8lIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhbjcMKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isfkRUtt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thVH3342929
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMs7baKzQP96vz7tn8LFJ/luoeqtWF5RUkw5fVAin8U=; b=DhbjcMKNsVvJF9GM
	vz8KZkmTiptrfvp/Yr0Z+E29KWdeEdwTmrpGuq/egQhqW95QgTM12N47JGeJxxg0
	JGEBA2l9tRow0UCgsmxEwuhPLDpF/j0OTbglLEXXvc50M8tbpDiq80iSbcYLqwq/
	7J5KWZxNP43gpSd75yz97uPUheTY3VTsLUpSYkdClFapx9AzFePNDxqS6ywQBYvK
	klH5B1rTbiEc/erg1OsbweQ5lAwWpCE0f8gkia/tBKb5siwXn8YZRjIrPYY2cNSQ
	+O0EqrTFiEbXrSI4hjy9PKg+3G7cErqisjm94i64s/YtMmFWKNlppAULwLYXMktL
	cHqQVA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w48ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso128243651cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773395651; x=1774000451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMs7baKzQP96vz7tn8LFJ/luoeqtWF5RUkw5fVAin8U=;
        b=isfkRUttxuyvpm6LHjq36eIMdbGLTzeiHovzqcgE1RjlCrTGg1o+BqxTHvGCEnwOkL
         fwelSsn2OnrjP/YalfhuePsLqQMr0glnKS7Puu7ShF77jmN1odfJvFxg+aW8nXOFfogY
         /nb/GvoyDrXdrEz486VaQbyzyiRxGWfogSWwJfvdu/iC9/FJijQMm6uCyYhqUy44ZUJ0
         HXjcoubXNy+MTjmAfADYUYZZzKlXG44DXV9m3XJREsBXPBixXl9DMZA0/3KYX2nnPw3W
         tEcQYVyIJxCjxbtFU8Dtuishq6X2hYdgUVooWW13ue0Mc5Afa2227GHFAt18q2waeC1/
         EKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395651; x=1774000451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMs7baKzQP96vz7tn8LFJ/luoeqtWF5RUkw5fVAin8U=;
        b=HaKebr36hosSGNcSGB4RhsVUeWMKLjMHUfpDbohx28EiZnWh8LINszbKXd6P7XeNdx
         SVMUVkR/0LvDs0aq23V2LZch6FF8ZWA3Ea2KTa3Wle712ZBfT9b8PGUbAIffi6qyWZKL
         P66QNe4dtJz0zdCVqpHFGtfS5zOcBcR8iwgWR99VsgE6f++3NYK8g9Nnp8gqOXavCFdp
         glAbzPtSl4jxwLTxDdJn/FH7pQKAE62/6g1OEOO92oZJI/26Gzurrj2Q65xPjW8MTJaK
         wN4WFWCi9H0mDrxk1+rq2AcnjWSogufiSrgn1SuxKw39uN8nGEH5vdnA9xLJGv71s3be
         qNDg==
X-Forwarded-Encrypted: i=1; AJvYcCU+rS7vAqPBOprdVkwM10MoviJ065CY3BDgC0wlPI/Hk9kwKQsvtRbYhF4FVJ8LFbW5pSqhTKPZpELfg7CX@vger.kernel.org
X-Gm-Message-State: AOJu0YzAENU/A5zTdL2iHUoSAM+9FjP2FugTjzChZr1itpAMgISCaJkw
	NbQO4OwgJLg4pMRdtvEP6t2EtePSQPZjs8yRHNRB5pDMeX4xe2dW2vFfyzQVNdZabY/znInfh0a
	Oq3Yt3ynZ4R9ZBQTmWpSnVgob9QfBuSWVIk1AsqmY2YIIoHs8xnoiIK0Gpv6zcW1nr85e
X-Gm-Gg: ATEYQzzK1A0MdcGEy1Y8c+O70x2eN2usnETYg/dUzlFmJ/ZYhzKBYVWvpv9XghPOIeQ
	W8ZJtM6Xj/cZ+iAZ6RT4ZuwrUy4vUE2bvSi6U1mw5hzNyrPMIJFvYAwU7Q2P3nHtT7s7GwE9g26
	uErhq0Y5IUink5hGQjkTg+TaMu+rKhTJ8RyX4Ke54Je+A19Wy5zPv5nOpgt0gyUQT+MlndYllZj
	0mFXYUT/uaQYlil60kVBBjZlycIdtEYYi8FEvYpdlkfG/GX7kl12UC1TswPQMfPN9VEM0kKqfSo
	pTPF0XH98yzwiJr2Ouyfihjke61aYfdHGZBFBBcFGTL/QoRd9eKevOviTuv3Yzz0N8Jf/TY+SRd
	9qB8P+8GAJYXP65VKdD945//8Kcxsu1N67UGlVu8vnYQOEXTKXgyMwGwxycun342psz+JEdwgSv
	5eue732jg=
X-Received: by 2002:ac8:5ad6:0:b0:509:2448:41a with SMTP id d75a77b69052e-50957e6d955mr32552261cf.42.1773395651230;
        Fri, 13 Mar 2026 02:54:11 -0700 (PDT)
X-Received: by 2002:ac8:5ad6:0:b0:509:2448:41a with SMTP id d75a77b69052e-50957e6d955mr32552001cf.42.1773395650735;
        Fri, 13 Mar 2026 02:54:10 -0700 (PDT)
Received: from [10.111.173.3] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea844sm63722031cf.17.2026.03.13.02.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:54:10 -0700 (PDT)
Message-ID: <9f5839d8-ccc7-4e7a-856b-46b947993df1@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:53:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: Fix csid clock configuration and
 IRQ offset for 8775p
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
 <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
 <3499e8ad-ee87-410b-9db1-215d6c20e195@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3499e8ad-ee87-410b-9db1-215d6c20e195@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GF9Qk1EICS_-dKElN44ProgiyDVEaV_E
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3dec3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fbPyYwy2ZK-1YPEEdNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX9ir520upDVOY
 D39pJfCgM1rdJ4fPuGqJIjkR3gnSHVeWNM+Q54TUeSDM5epAVnIPTmf3JSUi4M3cenFHs6043iW
 Gm2lNW6DxccqV2LGRlZjN5xp91at068ZSFTPm1XUs4l4Mbcu8Atqhay5YEd1myMlAvFtbPtJFjB
 YCev/VXRtX4Q05HsKG++DhatM9LL+GHUpMNLNR4OY82iF1eeOX7RTwc/oeH6ubK5Vtm2zLIPjqn
 gSpstusjfMnXzvrfOBR+RTExDwkSXLf2s0jesetCitjo0J798Di8mCd9UtXyJtZxggPuc21v4wM
 cbB3qEgnUkwRxEjc8csYTQpT+a/jpwi4s/rbSPD6K/hrlauNo8xvKtv9Wf5sYlDGI0VI/5l+sts
 9nfFSHEfkuno0sI5pvgABo1K0MJ/H+qNu7CNb2N4WowHN6KdTmspv1E11q6dMErgGAA/siOby+8
 Xi1Q2W2y5grIfbK9aUg==
X-Proofpoint-ORIG-GUID: GF9Qk1EICS_-dKElN44ProgiyDVEaV_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97391-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECBBA280ED3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On 3/13/2026 5:46 PM, Bryan O'Donoghue wrote:
> On 13/03/2026 09:42, Wenmeng Liu wrote:
>> Fix two issues in csid driver for 8775p platform:
>>
>> 1. Simplify clock configuration for csid lite by removing unused clocks
>>     and correcting clock rates. Only vfe_lite_csid and vfe_lite_cphy_rx
>>     clocks are actually needed.
> 
> This should be its own patch and should that patch have a Fixes: ?
> 
> Simplification != fixing a bug.

Sure, There is also an issue with the clock here, I will also modify the 
description.

> 
>> 2. Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
>>     sa8775p platform. The offset should be 0 for csid lite on sa8775p,
>>
>> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> Yeah this should be standalone then.
> 
> My general rule here is if your patch requires line items to explain 
> various things being done, then those line-items deserve their own patch.
ACK.
> 
> ---
> bod

Thanks,
Wenmeng


