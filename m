Return-Path: <linux-arm-msm+bounces-117583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2F8NI4cyTmrLGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 22837724D61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:20:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="U2/TaqbC";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DOey296V;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117583-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117583-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA387300D1D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CF743C076;
	Wed,  8 Jul 2026 11:16:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255643C045
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:16:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509397; cv=none; b=kbyCwKK1icP+uI0RrRsnOyzhw2vN6h48dTjRjzOtTk8d47aTQoDnX+gtaGI5BJUabW5YQxQMshyHFqXbXT1BTrv/G7oQlEvBeT66AMdvhO3fMdMQBykBM0qQqx+Yyvb+yL6qaeicuObcLCtxGvRquk/Dv2Zg1wILWdVfIVi4hhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509397; c=relaxed/simple;
	bh=T30Tq3ggKDbteLsy1U84/TctejsfGDMd3r7y4dsbJKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsHhiO/7smtM6F7/LOMXi21J3Hgi2TI1KkHfxm5fm6PZjOd0b8wzuJR4m0TT8XDataQgOwGiGcjVBvbwKyXqUuTMsWOjPkpDcr8MtqfvWc7kX6r68j/DD05Too23ZFauGg+ETKMph+/gLuKkLZ+CpMh6s3ed0AjJ68qdBVBESW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2/TaqbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOey296V; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Brx2219742
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RRFbIA+uhZJ1/kqwFGK6iYRh+oIYC00DEy4Rs+x4Vlo=; b=U2/TaqbCIsltRNoG
	6R2vFWQmOOo4nxA9fs0usJFZvVlZKO4NMm6JGrw3EEKYgtCP8XG3EX95u2gSbG9n
	WrGURB0UyME5Y94Xw/x2Iy/f/AbcsekeeHocqX3jaKHxR0NA6x0xVZVzppI8MI+2
	ZYcAbfMPoTm0IplYmOUw1+I/IrHXE4+yEmEy29KnoqBc0fi8M1z+tL4iGalk1THv
	t3GvIhZqrzYAJCIhGKvyTc8bkmGALsjHLHxy4Esrb2MnbMH+evGXHI3rMXEaVD/v
	VHROZSjLlAq20VBV6hFUbrGgtwROuA9qM9uWcTISkYCxFoAdMPfKLGYR1zydD22Q
	uOJFAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhced-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:16:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso12981995ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509392; x=1784114192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRFbIA+uhZJ1/kqwFGK6iYRh+oIYC00DEy4Rs+x4Vlo=;
        b=DOey296V/ke9qu0N091Op5Y3+jnk01kgxFsOvQzmJFRAtn07qmm2zlO4Vx3hskiWbB
         VUgAF4KUEosCO1glrF7Xh8Yw3qSKq5BslBW+Hxd4Ws4jfW3FHgSjn77SJJlBbY2Hxio3
         ATfv9vM6awUVQ4it7pKj2uA1FDf9GaHBZqHScuxB9lSz56XgwR9bj+H84hMr0bqKLdqA
         EevNjDm3uQoSMZjaHOHwDPcI0bVDs9aMij92Lh5zT4YIb3sZdiuh/nk3LmVfKMG/MZn/
         2xZ+QXhV4KM+A7P5EHTfV9vkxs4bKesFbLUWLpYZXwDD7SCkafZ0RuYWJG5UpHyuYxtv
         fq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509392; x=1784114192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRFbIA+uhZJ1/kqwFGK6iYRh+oIYC00DEy4Rs+x4Vlo=;
        b=nqRkPMxtGuc6b1JKy1jJ257xooLkbX+Ax5SMANYhRzZkcsJ+m13OCQoPW9G1pDr+8C
         2m5oaQQjV/E6jgAQ9IZoIJepZqMwUAIBHvbewmWz5o2BKKzHZCmPpeiZ91HIAgzujTyv
         20J9IUO0LMKlpBp7bNdQBqY6OJxe3dXwLxA8cOrGzZCJO6qm7L59e7UMzs5xIkzNLEa6
         eR/rKNJDMm41sYY1fZkpvzjsjx0vl9Nw9HKTdLFCBW7+O9lX4v2HSinhcbXcU6Doe2+d
         O58E9V3igA9DCBIJ37mkTQHBALN9zwAZdyWX6jYyEcwMED1pzaviH5meLw0/lP9CKefE
         Irmw==
X-Forwarded-Encrypted: i=1; AHgh+RrMcQLd69YxLPGNWB/4TCsVHgSA7cCf+dIzY9F12QBWi7xbB/vlMLm7wu3cwB78dK9aL6OW2aerSpXZK/0B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3BVL0DZtRFLrRJrlI0ZxVCrictYjdIxCqxj13eHDJuMYBprF
	pRG+OIFxhNglhnkbdZy1lDou/qFbdOLoB995ETCXFfV+zfqP+TGhNzSqeaqZTy+Ge++i8/v5OlY
	yEHbXmx43ckMGaCnH1xP+VdsQEPiSy87e16HbYRtO0ij5PYdELr3RjFT3KWOypJSrTGnE
X-Gm-Gg: AfdE7clc3z7GSE3DdEsTNCIfPgsSyxs+zLiGACGPxmrL6XcaDMRnVfKL4h7NFHP/O4r
	rg5XRLCV9HMyMmqXdqAzrR48WaiPeG2S3+EPUvgSnvXLpXkKqNcFuljcUQM0Y3SGWUGY/qZrePt
	cT2A4aMbIbRpyB7mRPkcUsJa3EC6uGllJLN14RQq82nlh/8g9aMf7HF3d6ijaVGZ9RrioX+u8aU
	YX/78Jwq564FhDhBWiylXdfZyzTBRJ6YwTb6xUoUWqHdpxdfm8TehHyZCcoIEE2P6TwlcUoiXF8
	Y2CdhMe5yNvdwghGNyGk7Rx1v4A3BoZpPHpEmMj0rgrE9LsrB6zgbWrvBt27qihMIZr11U9UVD5
	9KbT60WaT5dumEqhWQHspoAlLPfUtekRBTozqAhMt
X-Received: by 2002:a17:903:1b4e:b0:2ca:d151:382d with SMTP id d9443c01a7336-2ccea3a3cc7mr21992355ad.14.1783509392012;
        Wed, 08 Jul 2026 04:16:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b4e:b0:2ca:d151:382d with SMTP id d9443c01a7336-2ccea3a3cc7mr21991985ad.14.1783509391556;
        Wed, 08 Jul 2026 04:16:31 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm26753585ad.0.2026.07.08.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:16:30 -0700 (PDT)
Message-ID: <d0993d41-a770-4104-afc5-5a6ec02f742d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:46:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <31d10d03-8730-4735-a83b-957b750b736c@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <31d10d03-8730-4735-a83b-957b750b736c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwOSBTYWx0ZWRfX/8u/OsJgXPpA
 2YGtNiY69JC41aSKugdk0gJUjUPVLxa8EPb9qEPctqdU//mDbOH+M/7I0NHdjAOb2p7mdDblrB4
 6vx/Hf5dZLWpRSS3f+bj395vweIdztB3wrQ4QSm5SqJF6n35H6B+6gqDiBUimmbdbfXVbMqpFRw
 ORafKcJi29XdkBCWwN7eHnsbS6H2r5QV3i1yP9zLz1npbG+u8sKxv3IcUqxQ9yzxuZ7RiVJTHLQ
 4pPBuV9q/4szA3cCEFOhyKQlL9XCTg+s7Qg1B0WO+SHqxCL5CpWNhBRw3H18USxJXmn880iD5gp
 fz7h6R0LYNMYu6flo4s6jqfnyqhiuNddgFdxfv39Pt6dBvI1vtuJsIjAA/w3Q0N1ctNgDf7lina
 QXdSmxHQwSM/Wo5iJX3xMu5if6G3zB12MCLEC+ZrLfKkJ88yaDFwzXLu5IcuL3KXxAC/EH0Hzfr
 9156x7L1iVSKTv+eajA==
X-Proofpoint-GUID: foihQIiYip9j5xnoPLoHz3rs3HQD8_hJ
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e3190 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=I6ZbpqCI0Cxx4O-sBFcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwOSBTYWx0ZWRfX9IFNSlv6ZsvX
 dg5h4O3wmvIn3aSxZAfH/kJuUoxm30EkoNSRVvH+pJlS3mT8UPynVP+gLJJPTt/Q3sXD3ywiRPY
 K/UZv7eSyDuYSIo9YPdIDoM8U61pooY=
X-Proofpoint-ORIG-GUID: foihQIiYip9j5xnoPLoHz3rs3HQD8_hJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117583-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22837724D61



On 7/7/2026 12:51 AM, Krzysztof Kozlowski wrote:
> On 06/07/2026 20:11, Daniel Lezcano wrote:
>>>>
>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>> need to add them ? Can we do that incrementally ?
>>>
>>> That's what I am trying to understand: why the implementation uses only
>>> the selected two devices, if the modem on Kodiak supports others. How
>>> can we find out, which TMDs to use on other devices.
>>
>> My understanding is that is an initial thermal setup. Gaurav will add
>> them step by step while setting up all the thermal zones instead of
>> sending a big patchset. And TBH, that will be much easier to review.
> 
> Not sure if I understand correctly, but bindings must be posted complete
> now, not later.

Only TMD endpoints connected with a thermal zone in the DT are 
described, these cover all required kernel-managed TMDs. Others, such as 
battery current limiting (BCL) and cold temperature protection, are not 
controlled from the kernel thermal framework. Will update the cover 
letter with these details.

> 
> Best regards,
> Krzysztof


