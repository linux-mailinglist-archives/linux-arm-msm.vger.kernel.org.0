Return-Path: <linux-arm-msm+bounces-85280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C88CBFB91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAECC301DBBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF6E30DEDE;
	Mon, 15 Dec 2025 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVEnaI/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCOFzo9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235330DD00
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765829933; cv=none; b=rcwQIN3zCAhX9kZiizZYFM4Y9Sxr663zyjlIzuuDNo7mJS/pE52Uh6okWgIChIGsPU7SPPc4MPTJXk0Y9k4HAm7Y3f3NdaDylaAvmM55KgZyZ9FfnvXFH/uSxmNTxLlY6ipYuWGEizn4GeWAp9VAD9Cg1pBqVeHRNiChsPfnGTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765829933; c=relaxed/simple;
	bh=VRymWXvZRbLAFRnIf1e6h7IeU9rx5LyLvyvEE5fE0TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z110/VjhJmGl5PT3Fe77EgAmPATI7KdqyORvRjmULk5nw0d3YK6jE2TEyFTLXCT/V6vo1AxMXNL8MGWmxy3K7L20KWQEsLtFPcQjqDh8lpPhS28i7j5MAikiMUOyg863fvas3auR6+4GJe3c0qQUf3pDCZbYN3CTLDBgp8wck+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVEnaI/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCOFzo9E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFE3rY24174153
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1NJE+daohjnsJHyCrQJwVFy
	emAl89mXJyv0PuDlpHE=; b=JVEnaI/AVSbzsBRUj6sLxr8TTwAWrzou66lJG0m5
	+HLw5vl0XVOTqzjVXW456fOkc5GXhCxEJjrvMUMlClOL46hq7xoB+Bz5yob63qxu
	SZ1Dl9YHia16P4lLuC/QSjQ0ASWEQHIDr1CvVGbgyuwbYUtgarul1R3aks0ti/5F
	4aje+grTSvXKeHd2pIf0iOfiQRFgfc7iYMCgmOCVEot6To37JTKoL99udBqooO27
	6ZJcOPdynOYH/gpn7PcjHbdzB4Y0Ot+BkUkh8D4Sr3m/QT700NFKm3WDWpi6AGRT
	3Nmpk8/V1TJZbuw4aKhUpGvlKhq8TTqSrxbXbqjoemqLsw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks014jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:18:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3356a310so43183616d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765829929; x=1766434729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1NJE+daohjnsJHyCrQJwVFyemAl89mXJyv0PuDlpHE=;
        b=LCOFzo9EH4VHQc3VXI02S6zqw1+DOto/Tw/UtMWNBn3EtT1u0/s2wJJkCTupkcl7Ic
         hsXiPnK566nwHtZe1Rr/w6JgZ0SfBvh4HsRtiE1kZNwTr1/7X/3VdUj3eyUJvycQLqQd
         YfRwah4cvh4wVVOpX2cMgXMsdDVIBYQCs6JNv2MCR4PIY6avuxCcKfxsfpYNqpyFCxe6
         nyNA0rLY8vpgP5CHtud1K3EO331+WCZ6efjPmV6y6WyuNdtg8L59tg2zB3C/sCQtYjXa
         BZ73NrJUWE8LECWsJPZFohdS7ZMlgYibtI8GbcHhKPYYxiOHpv9JtuISJAS/xXlpj+/t
         2J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765829929; x=1766434729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1NJE+daohjnsJHyCrQJwVFyemAl89mXJyv0PuDlpHE=;
        b=g/rel2GBGywPFy1ilyFTo+LErQP9lHFLi1pnr6l43ZV4mBbmBpmEf48uvnMG0+WjWf
         1xIcnu5B6I/vBb8AkYAhSyAo4oPMomOm0jzsgx0Mca8xmXV+wMc+DqXKwfMD7dGypiQf
         CxBaPH8uq0uvh8NY9L9abZckB+ESjOa0OnMaHvjUAI4+XFfJW+n0xuBrqMnlBEBADpgO
         tcK/ghI7/zCPxJ5qbGYgMjf8YyXpQddGEziXH8WTGDoPYtlogXAM6G3HOvl9m6pyA5IP
         89jYcvPzNp0tUNXcCQ0SmE8SEXjDuouDV4nDvlaFWRQT18n+6bF2YwP/xsgrkKThlLZ4
         4QPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtO6NQvlNb1/c3zDI2MqmAKmieN14yYI6m2Lf6vO8eNAqKD7ToXK/pFESnLlYkBs68aF5+FCA3RWF1znFQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aLlB5Dsk+IIgVwvpHrLX72x9OxS9qHFNQer+mb8ymFrAjPCH
	lvz2TePh4cD3G7P3iCa4f2tFGVNwWt4D+27qxiSoWccCOXR8H0RgAFBN5MblxWX5QXg7N5iqS+L
	Nds/VrlOQZmNhxsCfgJNyv4W5fhwdTY7Cj3lRK5hdwP1UH5ShNx8ynNQMJXpnuDJ3eu4p
X-Gm-Gg: AY/fxX5cxvdNM9ZN0VM1lUZOzows8MGZ3Pk8fTuiEkQP9ZNVTHvZ60xHpJYGPFVtxo9
	ipP3CLqw52eET9DYRf0hQBUYA++teVLmdqpjWrqPPPtsgxQLLt3tPVUd/D8I3wkbkSm73SFXAB4
	ABz5BUaj1ylLLog5C1XO50mhtvjbDois1km4oW1dWeeejspgF7qg3+YooHpX+g/2C0M3ZdrwJ8H
	MbhvZbgqxIKoBx48N4qJTPZP0zeCx06IphxzwkLkju0s2NdB3RUj1mc8m8tLfwbnjpyFrM7sOEq
	E6J6ugQ3MhF05Y1K+Q3DkYFJUAe2pvHFBMLuRcwYxhNR38HJR39tDZlfpbsNEYxZplI2G0e1K5/
	e89lErV735D2Yrk1klWYhwvS5M33dQDaIB+9CTKXe8nDdCX5DjyZ4RJLuOWOAS7srzZFjQBqRxO
	528vDRq5elApE5LZZfMnNW0kg=
X-Received: by 2002:a05:622a:2448:b0:4f1:ca7d:b4eb with SMTP id d75a77b69052e-4f1d05af39cmr177543131cf.49.1765829929256;
        Mon, 15 Dec 2025 12:18:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtvBFUtibud6Vkuq8F+dO8djn01FEXq925b/1RQekeNv5RiHFnQ0GxdLIm/gLqvuaYoPnsfw==
X-Received: by 2002:a05:622a:2448:b0:4f1:ca7d:b4eb with SMTP id d75a77b69052e-4f1d05af39cmr177542601cf.49.1765829928658;
        Mon, 15 Dec 2025 12:18:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da11ba1sm113774e87.17.2025.12.15.12.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:18:47 -0800 (PST)
Date: Mon, 15 Dec 2025 22:18:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: cmd-db: Fix memory leak in cmd_db_dev_probe
 error path
Message-ID: <eupntl6hwzg453di3xamztlk5uq32esctulmit56wrbamakcgr@jjyr2rz2x2rp>
References: <20251215074125.2089-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215074125.2089-1-vulab@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: MtbLplDCI8RTBKW8NBErzc0thKmpeO2s
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=69406d2a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=T4VdUnSCGy9vPS1L9QUA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: MtbLplDCI8RTBKW8NBErzc0thKmpeO2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3NSBTYWx0ZWRfXzGpfZGUPJAnv
 1Pa+QuDux3wxkPfmJ7FS8LTPtNuazCeRh3ZrxLrcr9ZS9Bdwa7Fp9oepjoSOSUvUpV+Q9WJZua7
 Y/d9zPQXuCRKEafZbK7QK6DXoSd5yZtm+rMhsLJ4gr6ZOFOJTaVJqd3T+aBGbcTL5k4TocECSCv
 m9sdlnIFgnDtHo8czX/pABd6XeAbjVSOB0zQ3/jFCH0upfYBTBFrTHOSg69RZckkowUGoJ7u1yf
 qEVpPpC/q3smMFJgPI7G3LmVcIv50BSSL7/5lMrJmykkwe2Pr4kdDJRMoRmb4LLgy393B3i9UgM
 IJxxHj3zbskuRY2YVDeZGOhdEYLcZnGyBvpUnEtP5xtuLJqlEpa/TYrBQt76Qzji4LU3Puk+/99
 K4TlXuK87PtlMQX13bPGEiUF41oEOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150175

On Mon, Dec 15, 2025 at 03:41:25PM +0800, Haotian Zhang wrote:
> If cmd_db_magic_matches() fails after memremap() succeeds, the function
> returns -EINVAL without unmapping the memory region, causing a
> potential resource leak.
> 
> Add memunmap() call and set cmd_db_header to NULL before returning error
> to properly clean up the mapped memory region.
> 
> Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/qcom/cmd-db.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Also there is no _remove() function, so the mapped memory will never be
cleaned up. Please consider using devm_memremap() instead.

-- 
With best wishes
Dmitry

