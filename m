Return-Path: <linux-arm-msm+bounces-90508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CuQDGM+d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:13:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9923886822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4851301300E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EA232E733;
	Mon, 26 Jan 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMOcTvId";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1BtNAxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B83E32ED3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422412; cv=none; b=QIw24e6fDhOgqUKodQ8tJW2MIc1EJtMXjDIp/CUY0i+ajWZKa4OwGhIvYz2zgf7okJWjKTzAAqas338FkxmOZNHTN/c6mlRgOVDVForPhC4HlM+HbGyJJyLnmf0c03iMLhNQgE5ijZIaF65veJ65L9KiQHbSGQmQOLara/GX5So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422412; c=relaxed/simple;
	bh=4dLxl9ZxgBxb1yPpyOrIQvEZzSXaOt2jwpQa1i7zFf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZiDSmIk2ApQHza9qltHUg2hi+8zb4d6Rx/nWHFfn0m2wFmChKPkyLH6NCjTmIbVdgo/H/yJLXO/RVF765ZbDdh2iH/b4rwMWvYKyE07s3P/PTv9TjPvP4qKUI/vsjfNPOGocCZDg+OrhSG4ahp3kXKc6KkBvlfPHYRxUSLijMso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMOcTvId; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1BtNAxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40mdi1361530
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=; b=fMOcTvIdQPDgjFDs
	jIZ/0VcEtKXXBFy5xxrmD5Nq40m/Pw/IjAbClC1TmASJKArPtajLCpXMOBLZsHVV
	AtZlppsW6LVHVa2OmThj7ZY3LOAtnG/Q5ilSoB4J5AyCsAGKJTyNL44C2tHilIJu
	8jgkcmoWWy7ixir7WVNLFCXLkJDXF5Jk0J9NBSxUEm+YdsutMGZQZFWWU0ntPEPg
	MudHEfoc1YGNi/vPbV23OJGivXO8K1fDJqRMx87iUlWwnxhrvRcTsg0qQAhjvYxo
	diK75qgPtyAAZM+Dyz+YgL5/R65hXNw5+NIkWskIX4pvDWeXslOqjsySoc2DayIz
	RlKuUw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v30u96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:13:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f53b7f1341so4141448137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422409; x=1770027209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=;
        b=h1BtNAxPdXObVnwzvXiXPUM/ej/4mZvYV0xUaM4y90TKo7b/4+iL6jWtb7VOUYE5sC
         kv+J1amBHJsZzYfOUhQfOg+I6NSNDToVBkzVdtRu56SlVzNRLg8QJsY3QRddvoyF3UXx
         oM28OtYWiFI+bOZmGhHLGmUHymUBAIpaccthkfK9IwklhoJP+6tyc86V7tm5CgM+OT9U
         CEv6aXZ5gIu2sYUZwQUizPLvPzheg2ad2nNBKkIk/A41t41NBJhcdfzNkIfadMVhp9TI
         U+EiidjJ6A2LUxny8ScPa/Rw+IGo4PdM4fwp+1Qfd1hXjtKKn2v/dsh9t/ae5F97khBv
         QsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422409; x=1770027209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=;
        b=XrI7RyWuNEe21oA8MPorsDXn3GG1jHLoF05N8MH2fzDhHSphpj80Uj5G0ofZ+Cc5D8
         SwG/ZFi+aYhpg8AnuKNInVCBdcQFXu05BXsDIla5DPyZgfx4JbOCwtunF4CTJVzX3kqz
         bPB/q2v5mpdGU1FVDUKRMhOItUpqttGh7hICyN/vavXoGhPDEggBgc3e001R/iZYelUM
         D0D4jIrAWNj7300IwDUjcBwCUSqyMM7nSejLQF5ZyHL6lyM/7cXR8xzCtMHe2LcDAdl7
         8iwW76Jr3G6FxdUp/KVLnoxKYoz3AgvjRwivCcWAr2IkXfVJtLnzm9u+9lQspniXbwTD
         RhLw==
X-Forwarded-Encrypted: i=1; AJvYcCXixR2XjuKBLVX3m79inbg0NFtYV/8lyuCBVu2qy/J8Ao4Hb2VPtVfT6ZNxoo/aScR6zizwssUxOUCZNGe5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy91LrF+LHLPoQ32dIZbimjGUIT3Nzx9fZGO4Wxf2+Pm+VHrhdf
	Uu7Q+VF9iyE0H1fMdEkOLRClM/sxPPtlWp/eS9gm0FoDlxtDu+WfaGhFaeWugHA9FN82WE+BEzn
	rljB3kHcSPZQxdOgf07ptI2dOJD+W4Oo+rf0XaZl1efKxASiPWZOuNvnJjBSs4X6hiPN9
X-Gm-Gg: AZuq6aL8SwjfFNsIz8U8erGdy6TNO+43XHXeFLYjXAx0y0evEhbDJrLW0X6M8m6mxaH
	DEL4gdjXR+ZUO7sIZgeIecAwfFV494CFp+UnnBejud6Bi2tuY/ZODft7ekT3V6+nU1VoFPh0I2H
	T++6WJ82kpA0PZXs8+Gh+z4mN/zD2y3/GQzDHP79HXY6ampMVq2aWbBa/gXQiudwlS+P4ZsCVKL
	1wvAtEw4xPKG6MkmUwK8UbL+Zo2NKEPnifGYuipVV0u6oLDUmzvckDXgwgosMPhsT3Tld6verLc
	NMICSgF97bFLNx9xs3vlaTevTNgx9E3tZZkySlnYhsctpV8lUT+fEOW5Cn09I2LdImA3b6Sld83
	5xNP9MPoSnX2n7T9x7pSGWuclopYoBsUKySZ2RD5zVZw6ArTUzgiqLDFKD4dTi4j8
X-Received: by 2002:a05:6102:3ec6:b0:5f5:37f6:2b4e with SMTP id ada2fe7eead31-5f57654956amr978554137.40.1769422409620;
        Mon, 26 Jan 2026 02:13:29 -0800 (PST)
X-Received: by 2002:a05:6102:3ec6:b0:5f5:37f6:2b4e with SMTP id ada2fe7eead31-5f57654956amr978543137.40.1769422409217;
        Mon, 26 Jan 2026 02:13:29 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi. [84.253.213.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48e5d0asm2542556e87.22.2026.01.26.02.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:13:28 -0800 (PST)
Message-ID: <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 12:13:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfX09Ma9nNg8To2
 QvwXxM61YBL8Y6PZHcEQQBdHvnRR5fodr07GyKrWy0knTSOged122fpgvbafHnp19G89HTLDDy4
 tadZLCUh2sl1xArGquD3vjeBxeD2jcMRE/DRHUMaQlRcreUaXPk2nNWoDR3kbjAeBoBEdV2xQSo
 mxzSoodwDQaDMD/IcRsU5gXiHLss4PFcOClzZmQhYDirvBwgKygvH6AcK1I11IwYopYXWaaV2Yq
 iYuW78W/I+ZopYK4haD1CC5fZR4ECIXd+zWfJXMSHzGakeSeCJqffIC8QEF3BMgX/oFcz+FbXrB
 RFWjSXbWNhPoOkr5MoyA+xs32NaAXQ8C2jn5G4u5+faz9nigmyFFUQjTW92sjisYcwTRb6O+eaD
 xZ8VLAU3UsdaLnekFhI9RHd9CKa6DgU8UZSpgPo6OVRcxAu3p4zQSGvXt2HacU/CSMO8FduTsU/
 jL1t5j/dHqa7LkCX7cg==
X-Proofpoint-GUID: 1lCHHsOr5xLfPkkAcZ-TuQ7mNRfWDzGq
X-Proofpoint-ORIG-GUID: 1lCHHsOr5xLfPkkAcZ-TuQ7mNRfWDzGq
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69773e4a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JU2WE-GTjbXmrkkuVJ4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90508-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9923886822
X-Rspamd-Action: no action

On 26/01/2026 12:06, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
>>
>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
>>>>
>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
>>>>> Currently, plane splitting and SSPP allocation occur during the plane
>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
>>>>> is called from the CRTC side to ensure the topology information from
>>>>> the CRTC check is available.
>>>>
>>>> Why is it important? What is broken otherwise?
>>>
>>> I see. Thanks! Will add below lines in next version.
>>>
>>> By default, the plane check occurs before the CRTC check.
>>> Without topology information from the CRTC, plane splitting
>>> cannot be properly executed. Consequently, the SSPP
>>> engine starts without a valid memory address, which triggers
>>> an IOMMU warning.
>>
>> What is plane splitting? Write commit message for somebody who doesn't
>> exactly know what is going on.
> 
> Thanks for the suggestion! Any more revise is needed?

Sadly enough the text below is not a significant improvement.

> 
> Currently, splitting plane into SSPP rectangles the allocation occur
> during the plane check phase, so that a plane can be supported by
> multiple hardware pipe.

What does this mean? Without virtual planes in place, there are no 
multiple hardware pipes.

> While pipe topology is decided in CRTC check.

?? What does it mean here?

> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane splitting
> cannot be properly executed.

What does 'properly' mean here? How is it executed? What happens?

> Consequently, the SSPP engine starts
> without a valid memory address, which triggers IOMMU warning.

IOMMU faults. There are no "warnings".

> 
> Defer above plane operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.



-- 
With best wishes
Dmitry

