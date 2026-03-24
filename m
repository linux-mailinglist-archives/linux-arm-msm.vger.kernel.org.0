Return-Path: <linux-arm-msm+bounces-99557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /ohBAvIdwmmbZgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:15:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2543022CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C5E73020212
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 05:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4E4285CBA;
	Tue, 24 Mar 2026 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKWhIp53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U007OXlP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2D239E7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774329327; cv=none; b=CXNGWp+YBqZfJkNB3I1E052KloKBbSXA5qJqLX3/1SWhSxbV8bJ2NPAXQwXVgil+m9ZGckLwN9SItTcXjksgEwRGo5+sYIaafucByxzSxAVaGre85va7FHFKrErPjhPqwedaioiwQW92izYdMR1PxNGNXhUDTwhF3wOMPa8Lmuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774329327; c=relaxed/simple;
	bh=mFSN/Scch+iSBbvGZ6JEeuNoSUnRF4fKrQBINnoNrnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZErtY13pVlBv25kfrz+PbAt3xZMRCUdAdvk3HSAEaMFOaoaUEayIHqIr+PTB7NRDdxcnEgJS3JnIohWMkEWvHHsACHJnKyiAhp9UHle/giwwmz4jy91MWogOcF/bV6ePLEZndZzPhtLWtkfwfxnJdXH2ibU4Fa7MtHlCxctn1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKWhIp53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U007OXlP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3UXB43934910
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=; b=LKWhIp53IeBe/dwx
	4urY0ObI825FLxF3O8dMSncDZ8V/u23uu/QS9JN2JF5rU4YqGKbMGkKzttcR62r3
	br9Jt0Fi/OZpglK5hXZr4uWxhfG8l2OQz35eu4nxVoWpviLjURzHjFYI8W+Bccd3
	mz8mQLFaam8XxQ2FCVfTzykwH0DVQWEt8doRtHz9RFgnC1b8fq2COu4leHEThhLa
	j7n9X/vQ0cTRSeF/DM0EUsY/0DV0jNEVnYsbcbyAl88EHA6y9bS/hD7qcj7K8Nxx
	2ofjNGepfdwaRNWxsNZg/CM/C1MmgxXjKb1owNKz/A50DhIBDYYaz340FYBMDDM8
	kza3ww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0jstq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b064f043adso70817205ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774329325; x=1774934125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=;
        b=U007OXlPdedH4Z54a3RyFfMYQb6jLJc14cdfklwHgIZUwohSs0YH6o5l9/9mSs3vG7
         uFLPSb14DYrw7VlmcSOPT9bcPm9J+9nHVjCfSibU5HSHOCC6cwWipRc5pEP7LsuMonUu
         MgUN/NrdS1/ZDmJogenGjMP+/gzuzavDv0hYdxyiZL1UojIhoBo9yiY4yee+nKov4y+F
         cHcZsHYk42CPB5abSBjLMB4Aa1qyMIjODxyWcuNGUAnAyTJ/cEEYaDBWwPDPKItmVhFd
         Qrw52Ri4jk9o4JSxyowdZBN98Bq5cd1wVhvsfPCleo+rgf0rF103x/UBGx2YePqpdZa6
         814g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329325; x=1774934125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=;
        b=bPHlbIZkb+n7Qgg+dwpWQA/OVx0aMuIZ1jJeFcyF3PVkNg4cMLl0PpL9v0Lb7wT4GP
         IIXt8wIUcPRfTqe8SRg1g1HhWK2+rruzWwQ+GxUfe2CxiUgbmLU1VqGpbovY+nPuEtjF
         tdXd4hdVR9YlvKSoXDKHgfOJ1iDW7W0Sb23EDKgfVChd+U6TbsMKw0czIe8diRdHY2Fb
         emQ2UrOgCU3Gz96CEvhOs3orSdKbaualHQhwbpCk3InKgsYHumKRtryid54W4niXAf4M
         D1wFiHelGHVDPLKQVLjq64FH8gemLYPQvWKD97S7A9Zu5IQwhfeh9NQgea9Ti7aDJ/xl
         gt5g==
X-Gm-Message-State: AOJu0YzzhT0IeYLoPYxvau5VFAbfVvcxlBVQc1eha7kqGhjo6tjHyxxm
	pB9sQPdAQQgCKX9ZbGOx908L5N075j+HxQGa6bJt3/MGZUjU9Ab6nQG03QLw/QwLoEE+G5my2iP
	dzxXucH0A69DFR6Lqhifd2NgRR8m8Eo2FzAwnR/z4Uiq7HJT5FY0AltpDgaJqe8quZ3+O
X-Gm-Gg: ATEYQzySTPmVitoJjU3EKeiLQiXEOONcz7GoQPNm1fOoCrunNc32LK51+KAjXq9qYjs
	wWk8wirt2qmOXVMMjd3X57c+n+sltFH5LClVcITFVXrguGpR6lN6JqjzT3rfCu07G5ONl99rlv1
	8vZD1AE2tnfM5PhxpRyjUCu9a22RU2MmQLSoTR4JekLj3ZHbdfboMfXembHU9g4tuoL7/r39Deo
	JQLzfOKn+pwASFz29wxTRi7+POd1fTsdvcl1nYqNPEwanhttRXDU883egNESHOjdYbpNWZOqGzv
	L0zXF6MLiiJlt0V6fiE5/yvk/OMkjVS0R/QBCCtLwV1N+HrKmL/JeQIPY8oEd3/8MJquB1AgF9K
	kcOdyxNt40Q4dvwg3qeYt4x+R5d7k30mha9+X7yyjDCqmGN3v+gencA==
X-Received: by 2002:a17:902:d48a:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b08277cae4mr133308465ad.26.1774329324520;
        Mon, 23 Mar 2026 22:15:24 -0700 (PDT)
X-Received: by 2002:a17:902:d48a:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b08277cae4mr133308175ad.26.1774329323989;
        Mon, 23 Mar 2026 22:15:23 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c74dsm174187005ad.62.2026.03.23.22.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:15:23 -0700 (PDT)
Message-ID: <9fa40f68-54f4-d684-9e80-511c1ab230f2@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:45:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c21ded cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dE1MpONsbtOZy1RxgbwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0MiBTYWx0ZWRfX56isnQJCQq9a
 hhCBLai7e005zTElUdl7evAHkoXr53ew6FaPixZF5lKgZYEb2hfBJTz0KYvXfRqlOUdug8hS4dU
 RVz42eEf0fJwQr6YlNYMYbW9azKS9DXUeJwEbZoK5Rq50g8SVJSiuMsJh4bjU7R4Fa6mf/UQ8gd
 q2GbiqUXqtWial6OG26mR+hDO3tQAm1LfzQmh4MqEulDrXaty280MpmLqemfHPg7e6U8XVJaXII
 KZuKRdwXEKOi/KWn4NeoUWjs/nMRkH/CFA+xZMELxKbIYxe7hcTCsJUiihlEx6EdFRe8I32AbT+
 1XJEJ4Ds/368pYDWcGrvMJT4VrTKQIHSaoWG7udK+oI9nEsKE6w1W8qZccCS7MGaea0FqsHllBl
 0r9B6CSL1nCFqmhfNoA7gAXSdjyND6lrV5g3iLNU5w6rNK6+89xKdAnrSvTlwvkKi5XPtuZ8gE6
 c5sdfyi9xw613CGSUiQ==
X-Proofpoint-GUID: EJBpSxGhd0VrWat9rXma6Pg3v6T-i7h2
X-Proofpoint-ORIG-GUID: EJBpSxGhd0VrWat9rXma6Pg3v6T-i7h2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240042
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99557-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E2543022CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 6:49 PM, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>  7 files changed, 38 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

