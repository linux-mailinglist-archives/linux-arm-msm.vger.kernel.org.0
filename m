Return-Path: <linux-arm-msm+bounces-77946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E34A1BEF820
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 08:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72A18188C46B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 06:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABAC2D9782;
	Mon, 20 Oct 2025 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWI7b02W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD052D94A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760942719; cv=none; b=cDm7jaQaCwoACrBAXrDyssy65aicYZ6chDLM1Qx+YoVK5EpbHrOvQHK4Kecm9f+bq4HhTrJm70qU28Yu+aT063XVWCPz6JROww69nYjFnbWXynEkL5Se6GDcsp50lz6kfGBmAyYHDzkbLDM8ARr1sIG1PO2C8wxPig/1q621150=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760942719; c=relaxed/simple;
	bh=rtC3C9uGt4UHU2rn8ibGjqy0rKI3FHFok7NncAPdX+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFLcHgj2bC9JurXJEfaZJ2QzbtkdEPGhaf33Loi0ZYs9cKDwQI5/MysKnBK9ntP9FVzxT8EcQsdhfBoWE3Au1LrUsvk7TjcHdY4Pz9Ulfz/SrPtNWeqs1OYbyiCZx5zA4cl/UK9BoiopW7gX8ijSJVEv+BKJBHYlF0VCuIoxRng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWI7b02W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JJeXar009814
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qj1hX2tzkLQMkkvq7DvgBbML5xuWRY1vxvwpXBVNfo=; b=DWI7b02Wt6xk/JR0
	JiZBjmIgHysOpmUo0s5EwtmCpscN2yWiLBDfqf+N/vQoo2HpsnpLxwVq0DF/mXy7
	SRDa4UhCdqUWSRZcVkFqtQloG9NwldcNbclPT8XqnHkOdkM92b4wSh5Jkk7z5J+x
	VVNkRcHtFVA2qr83Wou6OC3a4ZeyxlsF1MNP77jA0tWH3nnjZKnOcFWOxcAFHCrl
	ca5By6oyUEm3tQDlZ1vwkPfc04cR10AotH3GU42M0fff5sIBLzZRkFib0MBfLSJj
	Ph3MGFiDxpc/Nv4yuU5APrZ3raxKjL8V/LJmWDTHBPl3ehqfcXLVlWK94fpsW+Yq
	OsBfmg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv3tjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:45:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7810af03a63so9009252b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 23:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760942714; x=1761547514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qj1hX2tzkLQMkkvq7DvgBbML5xuWRY1vxvwpXBVNfo=;
        b=t7sPb7epk7dJLvgu9q214CVdaITr8LIXqks2NvL28+vU93PX/0wt92anb4+lbRgGqU
         jMhKoBSzqVGKBCjR6blRCYvEc616T7JDvuRly1wy9Yk5B5DlUiO9USrJZ6dVYnXdv2vp
         l9JSSQ0FxWKrNWb6594uDsioN9C0ebSrs4p0rHdeoxOVM1Urb7LR0GrghAhKnKUbJEeF
         rnaKRIomxVAu6/JhKV91jgJ8bIGm3Xcegks0JBrELB06CHS8J14dtEMHgkbv5Bs+D9VK
         OXP0d6GsTHChwp8amfArHdv7JkmDNHUtIzuy+naqP3v1WbF/l9Nv+7R4qdwTOU90unEs
         3McA==
X-Forwarded-Encrypted: i=1; AJvYcCWyRveuhBAr6V5P2f2Ll1EwXEMUPUbtprhzT+gNlfc/EimG8K1a8Oc0eliykDqi+sgtf4ChW0QsabVgClkp@vger.kernel.org
X-Gm-Message-State: AOJu0YxUO5kmL+0zbCaaZzyUh7HKGA3rkJYMU6kRRM7p3aJcBn1PJstp
	I8ghOqmXQc1VyzICwi7fn8/Sw0JSQSHCUMBinnRU6OaHcxW1Bh4Bhq1mfqwWlmWPNmxWD2JdyQV
	IOCt7MPksfTAHuoe8bBuRQKwfNvICe4YAkN3ThxTD2GYR4HnfKk6l4Ki/4nvHP3nm38om
X-Gm-Gg: ASbGnctMec9xHr5GVNgBU+l0eRwKOG/KCCK2dzcMPEhcQ/fxbVcC+7KERPgXqeaR5nV
	ykxViCgjldEOOFNfMm0B9Ue8E83SRx/6664pOLHYRmbbi3+J+4c3hp/MZ5Kwkf91p+C3WnClcCC
	IKGIBl3V0gXG2aW6F1B5CQmyd5lYOxURCNCy8SzlGOZL2uA9RrOd4CD4pj3Z8QacxJKb1R307eQ
	6riwKkUR1Ofl40e3pVcC5Zzo5JUcfJbzbZPQJlWQWdJNmo73sLjgXG5+uWoNofbRp7crIR+twBq
	VLYwuD3XT+TjeqeafEdteaSTbJbn7KqFa72LLPrjHKiLUUAdfynqbixWQ1PGz2fHyKxBObT1kEM
	/rZKHmXrBUQVt62PLpwwoPhfsxE3Xx82jdHPN0cbG3K12NRCGf6omSAXmnnweveGGPyxPfA==
X-Received: by 2002:a05:6a20:7489:b0:32b:810c:2ba5 with SMTP id adf61e73a8af0-334a8652285mr16399822637.59.1760942713708;
        Sun, 19 Oct 2025 23:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHad5TbzH1sKjCzYpmQGbmCOR4jWr/A8NyZHnhGcDceZbOeyhSYzqUYFrWu/OhNtgqfN1z6lA==
X-Received: by 2002:a05:6a20:7489:b0:32b:810c:2ba5 with SMTP id adf61e73a8af0-334a8652285mr16399786637.59.1760942713297;
        Sun, 19 Oct 2025 23:45:13 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76676a2esm6818005a12.15.2025.10.19.23.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 23:45:12 -0700 (PDT)
Message-ID: <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:45:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
 <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J-_B0A3Pgzdu8oMh7WlSr9bwW9rdpAL6
X-Proofpoint-GUID: J-_B0A3Pgzdu8oMh7WlSr9bwW9rdpAL6
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f5da7b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zPKo-_adG0ZnOV3uB6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX9acKMFnhTrms
 wgQ95A6yDIJ3+DaPB4iwaEQoWkHT8fJkZgjKAntRKK+1dzsskMKvofmCZxbLBMsn/19CYsGbAsl
 UR3k8gWdXpLot+nzgJ13ISSDB6wEoWFGROrDDeuqHrKiV5QR4Bk576ltkx09zj40HhS63BYdyF8
 d8HA9kILYNFpAMMEy12TTxJPSBbb91D1hpxeP0jz+LlLIy/27E2JLkp1UC3Len5pIHhGp1uEDiy
 mOX755whCVzokA+l2YWgjOfQsMj0EN3TWwzT9IxJlw3s30y2nQ5mMXgkfG53JGUb/Abyfx9ZNem
 nfxdJp/hqFGroEfExG8XrUrzVnoVP/Th8SnVVvQS25PFMYE8M0eL8nk6GhOmeAoVEp0zIQqCR4b
 cfX5zDpfXGGMTgN98usYwMM50v5Afw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023

On 10/16/2025 4:55 PM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> +static const struct resources_icc icc_res_kaanapali[] = {
>> +    /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>> +    {
>> +        .name = "ahb",
>> +        .icc_bw_tbl.avg = 925857,
>> +        .icc_bw_tbl.peak = 925857,
>> +    },
> 
> Looking at other implementations I realise we've been adding avg and 
> peak without too much review however, wouldn't 925857 / 2 => 462928 be a 
> better value for the average ?
> 
> ---
> bod

Ack. Thanks.

---
Hangxiang

