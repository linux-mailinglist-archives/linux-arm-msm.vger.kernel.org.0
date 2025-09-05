Return-Path: <linux-arm-msm+bounces-72284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53EB457FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F1FF1C821E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7907B34A318;
	Fri,  5 Sep 2025 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yrk2MU6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C75345745
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076054; cv=none; b=UCpKjR1dRP17UuKfu3hRiAxWgTg3QOwt+/mAvt3qkpKuqz+gB/WP/4rnKdXB6PTlr48T/7PtUF2NJ8fV35y+ruYjHfrq12dF0zBDKBTIEf+9uT36/vAgG5GztEG4hPyCgzY8Uq0EmpFoDXfl0OcXusL5C2W46BVHKMOhOy5p0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076054; c=relaxed/simple;
	bh=RCvW+v+WM4Nm5wMAGPraUo2CrUGI6VSVlbDrWsaLXAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptZzUygdh7ck3h4lp1o5gziEy5bOe5gDGWAEYIeaGGFP49eeQvLU+Uf8OAP3ptWy3CQZN7lG9qGLl9PYyGgY3RhslBzKBd01m1yVqdlEuYklPhW58/9b4DynvY5zxq1oFF0zHGFLy0O/mwVgUGxSNHKVDCfxxtOaQJf+EDWEbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yrk2MU6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856o0Sa032207
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCvW+v+WM4Nm5wMAGPraUo2CrUGI6VSVlbDrWsaLXAY=; b=Yrk2MU6biv7gcNOl
	dkOKktv5V14eoWw9FdK0pOkhfEqLFuX7WIcDIU9fjNeKTcKAHgIb3eGLRYIY+a5x
	foIbnY+zxbT6ldQesjFPyIftRKGfafC9eW+Ym5t1gUJleQNreJ0Q+6862MnJUYdN
	u/V01tJOrqBEFUE4N0SQMRiJawdklu14kIHgPe/Ui5A1BU5l2qo3U7bjp7BzXek/
	u0sPinUXpmUEPW9KvkMJ4w/P8rh3ks3OeARDuDhonAmMKcWGE0MuIv0ith7lXIfl
	E1XKzFJStNLQ8YWDFFmkZmfj5dvy2HbfAdEX0cELQ0/fIwNQ5RGgqJmjGQhj0llQ
	8NdvxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpk9f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:40:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3387c826eso8452911cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076050; x=1757680850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCvW+v+WM4Nm5wMAGPraUo2CrUGI6VSVlbDrWsaLXAY=;
        b=iPb2OoR/yvEpzQplhrpjYqaLEB4GKBYBQvFCbegfjUIFG/bLgJ1hWqK8RA8cbT1+X0
         Ke0n05sBaKLMdoxSHoGLH0lJJiwm1cpEgCfTe6ebglNIu92xMgKW8IEQ/crkAIpMIJNc
         FCHdMvsJzbvdgRXw5mFm3qQeOSmvITZUl3q6I3LdORAUrfD5T8ImG+NudOFwyFTGQQGW
         p4p3yF59vf4SQ94BZwaZ2EKJGC+R7sfCevG66GiYwVK8kVyANhLp+8a7gcyfIPKMSeMo
         KzUSWCmWtJ5X96sD1GHPRr/nRPwJ6pdrD0X/X6zft29QOgx2gBWqU2QEuGeAucZrxpPh
         51RA==
X-Gm-Message-State: AOJu0Yz4DKFAObJzlioIgWCVIW9AunrnDfOa5cr7x/NQtbmVa2Q9qn3s
	2CSSRZLox8L7Cex5zD0KRsgUqKRs+NlVXhlQ0FofbOBsgOaVNrEynz6ETH3b9XCOWIIvuq58/As
	rSoGvZIaeuj06vIbQOnHGRj5mHQpSrc9QwsVWmGBKRbQdh75a0hIbnnAB54DvV4pb+L3UKmnpCa
	cK
X-Gm-Gg: ASbGnctuCI6h0F+HYzh5RYuBJ8pAeAgX+P7gIv3hDf/n4DobzTBpT4B16eg7ZCzhlHD
	yfeAflhoPtsWbAdCYyp/XpJnC5hWOv0RdC5Tr0MOYP3pSNRqkyo4ZdjbNvniNuAhnQutNnrJKDE
	zaDxlGl+hIY8/6lI8WzZxtr1w5s22zLSX7+0dcd76ckE2cVADdO5yJAlNQkXZUCWwy6DEW6uJ5y
	uGsbn94JF/gwG4NUvxJCX9NA+To0ZFT1nCkliaec06cF2KqdUO4bfWMvv3nul59ZjnE1fnofm6r
	XQsA/TsciLbM03X4PiywZ3O6PxXwC+BrJRd899nPj9To72Xmeqg37kGAA3LnNXA+b5VRfNIdQCh
	0urj8PrXo0c1G/LK4IltROA==
X-Received: by 2002:ac8:5a48:0:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5eeb8a299mr9780791cf.5.1757076050535;
        Fri, 05 Sep 2025 05:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhwQd/eQ/Fwu0ttahhKY21yFepGgyDfwsgnKKPIe1LttWQUPiyRGUF7MyOygLic0H9YbExGg==
X-Received: by 2002:ac8:5a48:0:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5eeb8a299mr9780531cf.5.1757076050011;
        Fri, 05 Sep 2025 05:40:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a27sm16591905a12.10.2025.09.05.05.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:40:49 -0700 (PDT)
Message-ID: <daa84fc7-b191-470a-933a-b41b8713d1d6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:40:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm8250: Add egpio support
To: Sean Parker <sean.parker@viasat.com>, andersson@kernel.org,
        linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904170613.68855-1-sean.parker@viasat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904170613.68855-1-sean.parker@viasat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y2bgsMGOa7YOJZXOMr0qXbC4oyXGeU8o
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bada53 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o8bG7SlRqXj42srI09MA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Y2bgsMGOa7YOJZXOMr0qXbC4oyXGeU8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXyltBHphB9f4H
 xz+FplEYzn5yqtzu/Eh0tCjrA3nir+dsG6rYVYwxabpAHDmsHbz3LOb1r6lubnR1BLAXol9mFxr
 gPqJ6fxi2t2+r2Qwcv3jEJUgAyLxC4petnwRkGymokkD/xYy1TFFTLyKugyYDLUyVTOs9MBKIG5
 nyB+0c5dcbc2tbQTdcXQhK4DM6T36a6+DbsfFdxj4U6PfmMgrqORQPnA8E/Zh8on/0vDyuMtY2V
 N4Slt4iKnSh9Y6JlOjzcGtAjFDNIucuyKyt4DXDf41cVMxBCY3pvC3Czj3ct5CtIgFstxRKPxVx
 Hq5RgJtkh/YYvL7jFfDkMGqlW0Nm5bPUIeCrS5Kd4L63Kvr4h8mUhX8c5l4SYgjcCXbDFkYIZR5
 db+vllIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On 9/4/25 7:04 PM, Sean Parker wrote:
> This mirrors the egpio support added to sc7280/sm8450/etc. This change
> is necessary for GPIOs 146 - 180 (34 GPIOs) to be used as normal GPIOs.

* -179 (in line with the code)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

