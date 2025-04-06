Return-Path: <linux-arm-msm+bounces-53321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB91A7D045
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3102A7A2A12
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41F01A5BAF;
	Sun,  6 Apr 2025 20:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfLOy48u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F117158874
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971318; cv=none; b=LlTiTPTuAKW9dtizw7kUAsvtAc+91r1Ypa+kvZCK7/O2Cb7kaidR5Z0sG5ilZ4uhoGAy7tvUsYQoD5oxDzC0N3dLdC5tzAEBfD/gjAdXzO1+EMjkoU3IawTMxPa4Of+0+qGIphCqDX4ba65MU9wHS9s+82jWhNJHw4eKxNKjTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971318; c=relaxed/simple;
	bh=T/XIC2WFkjEfSRo9EZwjR1f7QsFVGUQ2rb5zT2kkCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPAymDxrqb0tUbipMcqYWXIi28eySgG15+sJCwBA34pJW4pV4jH2QBzAxJC0pmvRl7mfijmnoXU6vIbcEk0os3d7NhBwPEFPMfadw9TnE8fLdNJSBGQahfurerT8ysQJb7CZ4jTPYVyz6Unsr1FVgLX3vYED2V4xYERiOz1mXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfLOy48u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536JQuqd027476
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Apr 2025 20:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bsSqtxqI0AJDBH3mPOzo2NZx
	f3VK5S/PNaqBt3C9Mus=; b=HfLOy48uGQgcmXPZYtTP8EgpYk68DnU7pkozMLBL
	VaaXC23YV9OANeJU31lrRmPAKuqw80lFx01PGkbc/BZVznvj7Nmitu8Cy2hclqkA
	gDov4mUfgOUWUNF5adPa1jgdJNxAOf3iJ98Q3GRmmQh2ixwRV+/zWqIij81m/QAa
	Ko25Ajlj/x/z8SkBJDQR/wWpmehKEMsjLc8TUf/JRoDMytjPyMirzXr831EcADIw
	S87iYimwEVuK5ogNTFq/9aaJylhBiPhILNu5b7AN8jhWfcPdaFOoTPWASXVp+Xu5
	pPDGn6gdu7yu12jT19dvKHFykEkgHrsSKsi6jsejYpO0yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3a9fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 20:28:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c579d37eeeso594826285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971315; x=1744576115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsSqtxqI0AJDBH3mPOzo2NZxf3VK5S/PNaqBt3C9Mus=;
        b=gFywE7jS8gPEIG/aAZ+0DNe0Qz1P7QwWe781aGFWw1ttzEJTY/Yky8ORXtJ2RxWx2E
         C6Lxk7IsX5ncDcUP5tZQoqpwYSaokCu5eX+IAtqxzu/Ci2rakO306/Mn0L1PZHJnOufR
         Z2FgwUyQTBCNXptdwPWi0ZGI0GGJfbmjm2m+P66qbGdyaBFYGLo5eO7Vi4KXCRkvRCec
         y7Ilui8kWraLzF3qlsa0r2waEaUma8tpfJQ6cN3h4jQ2P/CGFWe8HwFMBcxeoVsfp4pm
         13D4sId14EjkKkv9oRzJax77+INfNuqfi18mrkKmGG6djf/LMXkfoB2VA5j8fd0f8bZz
         68hw==
X-Forwarded-Encrypted: i=1; AJvYcCWLOpbnFCaZc+0EJwiJJoXOm7q3leCiZjtFr1DLSIx+jTzzpjidk50qikFJbScwmv3RLcEjfmzYfnnBev7z@vger.kernel.org
X-Gm-Message-State: AOJu0YyerTjkqXIwq1O9sZk5a53KS6DIbTrMrn0pMC8fffbBhAWRyt5E
	kw9t9WAUmxRmu1VVntmgmjZqZ8rupMpZ1HbHMcApXJ6XRWEtenqTQ4EtgS76A0n8Bwt3Ad0/hhx
	427OYjzDo81XTeTsEIjlZCZ4i/HW+LfouRLVrKtkyHBjn8KtaE1kmTZz+Vrkv/2o6
X-Gm-Gg: ASbGncsImb103c8WAoORCJXguWezA2xtPIbrd6yGe1bTnQcF8Sv0QFThQyEoe+echpB
	UMFvqSdVqniW6NCUvmnQIZvw/b3ZbW9AKtLiSQKvHGYVDIX7oyGRRLL9+vDVlRmhdt+yGgJFtt1
	gQEjQt+x7aAz7ngpRWaGmWNRfWf/LpISgnxjvTnp1RCh8mAs0E2c2X5LtnVzpC+VlKvCtbYO/dJ
	9SkjA5XtI3kKP9U1cyV6nqgyTo8x+imv3QXKwuRBk+m/uutqXimmvXOCHQjFpYX4n3Uev/POfll
	ML6AXCDIKQwvp9DuVhQN/3iTUWLuR2O7AyN14bDsQ1ogS9ZsBiXJQg5A4klldZiGO6a6uHD4Z9y
	EQOA=
X-Received: by 2002:a05:620a:17ab:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c774d32d2amr1368562685a.23.1743971315061;
        Sun, 06 Apr 2025 13:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH5hWPFCmxUw6pP9wS8Gag8pjJ3msg4LETjQccNi6CcqRGLBFxR0pcjx8MhIooTzZNcO6ZqA==
X-Received: by 2002:a05:620a:17ab:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c774d32d2amr1368560485a.23.1743971314790;
        Sun, 06 Apr 2025 13:28:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce8dfsm13394391fa.100.2025.04.06.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:28:33 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:28:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] extcon: axp288: Fix wakeup source leaks on device
 unbind
Message-ID: <z7dybxtykwcig7ztnfndlss5atoa7k3e4ba3g3bwgujagxvz2f@3qt25zl56c6a>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-2-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-2-8873eca57465@linaro.org>
X-Proofpoint-GUID: 4Q1BiqjHsZE3aJPWOo7S-hxVrTClNZgj
X-Proofpoint-ORIG-GUID: 4Q1BiqjHsZE3aJPWOo7S-hxVrTClNZgj
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f2e3f3 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=161-1wwXmLm0-wC2vyoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=693 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149

On Sun, Apr 06, 2025 at 10:16:40PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/extcon/extcon-axp288.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

