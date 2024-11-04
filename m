Return-Path: <linux-arm-msm+bounces-36897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA39BB04B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64EDD1F20F26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769CB1AD3E5;
	Mon,  4 Nov 2024 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCiSwvcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BFE1ABEDC
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714038; cv=none; b=PJpWtNGsnIN+Mt3HS4MhEUkYTMvlUvedGXQXDKsmG7or8oI3z9VdoyKsMgcBgjYL46PQEIaS2oBrYA6UXc8q1etSeFEGrDuiMr9CmKku62LPWvdXbnzvoUj42FurxOJNMzAfrTk/yooTGVt/UyZTr1MKuMDQ0hOjlUpwLFglji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714038; c=relaxed/simple;
	bh=WkL6kYiCbgctHhWkW9RrQbGup7GAC4xAAedid0rKO70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdY67CQxwq/hs3DkfSmCGl6pED50dvynJ+a3mouGyGv2hWWPBJ82pD5JRqJKalKpyLE4OifUsIZhmhe+pZ9hEzxHRZAhU0PcUEz9eFu0OHd315G9OpdU7UM0mhd0lc8NytkttFriLqVAjvkaSJDeVZHleMGplFjp+oSyr+opr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCiSwvcl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3N02TB003762
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48BbhzMG6nJlrKXOIqS7msafjr/+9ztjQ+P//OS3fys=; b=LCiSwvcltpIsTr4J
	yevfNJVC/ZLqCrYRj0AKP/nrsvkIIrcChljyktNYe+TSomgSkFAXJP6H4PILuhcv
	HFxOtIcXnm08CXdeUD8+vJNNZozBIAY2Y9B+scea5HmYpDfGG9Nk3BkgN6jcghs0
	2wyy/cyl77dYrvYGGrW8ISDs1cXIsBzbv9N0awOBBL2V99Wgm2s7kPPe/fsOPhrC
	nYc0u+cUS8/XwI9LSK1X6E08wyIPjHDdAwwYlWrh/oQXwc+lCzma3cYPNVDBhhIN
	SqlcD9Avl/vqLSdVG0lGvlxpwbXThypxW7Ou2i9U28fGRYXjTKeITvPpoh26Zq65
	pZr4FA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2r3nnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 09:53:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbf4770c18so15526846d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 01:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714035; x=1731318835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48BbhzMG6nJlrKXOIqS7msafjr/+9ztjQ+P//OS3fys=;
        b=wTqie2jTnWR9y62HAAuB2Ypq7zYj5MUsmCXvpltHlosCMnujJcHox7Xbfr4jjp8nP1
         wzLUpHV30G0PSZvneoblP2r7L+tSTMOrfqmSiC5thass/8hEJfTrITAAOevyUJpiU5NN
         tJy2VMkjAl9l0GoLxEZsqt5awG/B3CcCQQauOJoz5NlrfSEMYSbV2suXp5lYPT9ll0/K
         EZFlrMH2LyIQbwruHj9iCDrXhBmT573Rv9IbGryXBLlYReYeT9aD+9fokcmgnsE9ytnl
         h9TnJG2YPPCizZZdbLNqcZhcVPOiIN+CapzP17kumSIqOML3UGOhUZrkWoVJ+vkTJ2/C
         NvKA==
X-Forwarded-Encrypted: i=1; AJvYcCXhJTTwwaT6KLhjA8cO0XrIm7P7JnNU55jZnFpu7eQcbLeK02jmohRQtCKzGXr+psNHDrsNGeUiDrfW1SVI@vger.kernel.org
X-Gm-Message-State: AOJu0YwSR2rPfZUARR0HRG8Cx3fhDX8wgePhjk+VdP5xq5e63vY0u/un
	sROysThm+AJWfcUir+2Gt4dEE2c+KRMJKp2kNIz9EfgbMZF5KYNdwpAiYbxgp0P0QAMVtKXOAES
	C7xzr1qvtTvz/7p4/lkS0hRNdRSBqJlIdl0S1JFcrrdAKqjfp66ytRQ9mqGiyrcTA
X-Received: by 2002:a05:620a:4443:b0:7b1:1313:cf42 with SMTP id af79cd13be357-7b193f73494mr2113115085a.14.1730714034908;
        Mon, 04 Nov 2024 01:53:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtxe5uqc7MvnqsqyGo/b1+j/YoMPpCIwglJ2JELVbc+hCFY6xRwAJFk2Rx8PoXnp6hGWQDww==
X-Received: by 2002:a05:620a:4443:b0:7b1:1313:cf42 with SMTP id af79cd13be357-7b193f73494mr2113113585a.14.1730714034624;
        Mon, 04 Nov 2024 01:53:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564940basm538280066b.17.2024.11.04.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 01:53:54 -0800 (PST)
Message-ID: <07c5dbf2-8ce7-42fa-a511-3dc22f525325@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 10:53:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ngquohLVclTkBSGzA5RZ9-xqP7u8_ayy
X-Proofpoint-GUID: ngquohLVclTkBSGzA5RZ9-xqP7u8_ayy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=928 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040087

On 4.11.2024 10:07 AM, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

