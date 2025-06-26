Return-Path: <linux-arm-msm+bounces-62703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF5AAEAAD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 877AB7B0FF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 23:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57ABD22259E;
	Thu, 26 Jun 2025 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSSzIlaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17033221FC3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981690; cv=none; b=vBW6uv2Tf2pi9gCVNUzsHjtf+oMQZCVxyrfYdvZGvAJYv7iBitZzViob1VavzZ1fGRjlOuLpN5kRlA07EI62l6DNdBCAqIx9tOPBoBMbW+Uz8/EbNbODT6y9ZmvIKSikiBEwbKQ7mQ45s2Tz0wOLxe0nSkK+Kzr6MKrQnI3+m5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981690; c=relaxed/simple;
	bh=GJeEEk2k+9QDO4GRwoK8rdidT7Hui7V7SG1hw9vaPec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXNABNoGqGg1KM6emz+LwRKwjeTWyQMPSImRY3exVweRuLfglxmH+INSNPXrSgoVUTKgxllDUz3jJqUqom22OrR7yd0KYTHQW5ib2gp/AuIBbwCm4dOW/hsLT1czRobKwQlWlujsbPM0xzCG/or7RkZrSL7FjlU5c+Qs4fgp5fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSSzIlaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKDZjO009483
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jcqp3+hst16YWzvGdkkJ7rEp
	8MCwqlwyZH1HL9EQbcw=; b=ZSSzIlazO7dpLTO4uSjFpg7YD4GcFkAhKwAyuZIH
	8WrWmXgW1TLFGI4nEwZUHc54LLaU6TRdXObY+7C3k7VpXGVcsDjm4TfpKOGzjI5n
	YZyccFObOU3rlxP5ibsv71XourvsqCTEB5WYPJuxk0Zk67F8Yge2LmfqBjdbMHE3
	gC76Jz66379TiHtY7jhr/95qXos7HvU24jw6ofabRfQ1iSL+EKcPm9G6V7MiVmZZ
	v1xFih6iEd0KTnl3ri4VumAXXRi7AKinj5MFt5s+2fyW9stn1YEwZ6+MF7VFJKiG
	/CbuT0b1ZVil5KY4ggIWZsIOgiHM7HPKmFKi68rI/eIvKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdeugn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:48:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so250165885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 16:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750981686; x=1751586486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jcqp3+hst16YWzvGdkkJ7rEp8MCwqlwyZH1HL9EQbcw=;
        b=ZJvyt4SeGdV+3aw9PgXW0mDNriHFp3hLXm3jALH1e/6shWHa3nEkUx50PZtqHqrzE8
         e5/DCZPhOaF/B1vRQ2oB+JCtRqARBcF7SZFdmn8CbanHikS6a/KGc/DljUt7GZJE4n8p
         KOAYC2A+eTNknpO7gh6aFi+o3z7jW0Z4NLZrvJxfPbOVC94qywXm3jcAoEIISbNrZQ3P
         6ATYU71Rv4nvuZk2H2Ej26IdBjF1G8IBIEqBUgR5ZCSXIw/rYXJ8Z86aeVeBTVK+EyPE
         ZqTaEXE5v+lijoi5LnGZmxCnsvo7Xb/fkz6jkC+VMTsZGhW09oKzWPEcvGYsoJT7L7P6
         YzsQ==
X-Forwarded-Encrypted: i=1; AJvYcCULKq9w2SZd/6mnPRasPKfbzD0uk6fpbr7PcvMWO+ZALY4MT0U8uCSUGsnQ3TOdOdb+a04NHRQpzPk+EbET@vger.kernel.org
X-Gm-Message-State: AOJu0YwNrVWsmKiYRbiASLFCjhSiqlNkFvWGzurO+7ohd7BWrU5PHhY3
	sAq2+vKeatweb3S/zUihhvM4EMOf3vJTUGUcO8D5Py26s6PDMQxzFInUUl13hhXAUZ9FfQ6k2px
	zOyABdeHHmODp90qZZqfY/Z9QMjFhJvV6Acf99PIEGkXhSFx0EBJCqtCc8xxDKs0tH3vL
X-Gm-Gg: ASbGncv/RlUGudtRmK7hyfZLvLTnDfAIwWEqz9bwwd4FfnCeJemuu8/uUFdpu6dxsZJ
	G01Mfsc0ulDPAXHvKooms1a0h9POtJf1vR2Yn092XJElnwQ2MV67PPlfi7LrwtNZp/wO7xqlr+e
	sAkYrWyWJN0kZNHoYku+PNJBguoMmlycnu8Z2MHnvhpobFAOpapa3xew6YXaJ7jHKkNeRzVwwrI
	JbhOo6uaDBmmX8hwjkuZm4PnMeRhHDjVyPp77Gh6ie2CBixvjalhR+/SlTaISawNSoSBwqGvJ8T
	p+ddKm7WGaUJyvm3OhyfSF+YA4vllvbxMp2eJthyQy3erqFjmTomm2n5xhtAX22RzoWFePHDIO/
	phRsUFbwH00iUsjg8CumEbTFDGCe9GUK73+c=
X-Received: by 2002:a05:620a:708a:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d443950f18mr219893885a.34.1750981685897;
        Thu, 26 Jun 2025 16:48:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8LImz54AwYU8qJ3uD+qw0ctbfw33heYi7sSbh/STbsvQec9M5PenlZbd9yKarCy9GjAAvFQ==
X-Received: by 2002:a05:620a:708a:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d443950f18mr219891785a.34.1750981685435;
        Thu, 26 Jun 2025 16:48:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550be2a0bfsm126329e87.153.2025.06.26.16.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:48:04 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:48:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
Message-ID: <wqmnh7x7pi3tg5ascnfmy7lzjbe4wbmcf4ycjndtovbxkxajsf@ghayhqaixhnj>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
 <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ddc37 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Xm4G249AS8QJ8kFCN1QA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwNCBTYWx0ZWRfX7hREzm5MnBHk
 8BfcHyb+Hun9ioUgIk1wGHBKFe18SAHS5ar6yLxGkOnMsMDFJgNYJZcaf5gFpd+KXIwbfP8ylns
 gLnO2aVIJWRfXxVyedw+hWaCsIMh9Hv7x/JZLtS4i9dH19A2Xmcz2E91iOBvMjwgn4nq+a6GhY6
 exukGlMKGeeNhB5nd1Z3lijLi32KHj8+JN0up/utWtkooEgnJspOttFdPrQtq8j35/NycI8rwwd
 vdw8kaa874KQbBOk4UJbo5VftpCAOoc27HErjr4AyI8t8M7zAX/HxLsBMgHNsxRwbiOxqWTtIXe
 eqx1rC8JPy5dv31S8zv3IJrdYpQXUtwtdM8A9us5IBzh/OiISzl61azE5XgXhGVS/RS9/o5cuPy
 vA7sGAYBkm67E0TdAD83YUXOVLEd99/Oi89XaLw/b3ANh9XNnzvc18zUGRLdXFDptGyaXLTi
X-Proofpoint-GUID: 8IX1vQt_0BPBad4pSdB8thSmYM9F_5dz
X-Proofpoint-ORIG-GUID: 8IX1vQt_0BPBad4pSdB8thSmYM9F_5dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260204

On Fri, Jun 27, 2025 at 01:34:56AM +0200, Konrad Dybcio wrote:
> On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
> > As reported by Johan, this platform also doesn't currently support
> > updating of the UEFI variables. In preparation to reworking match list
> > for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
> > variables.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
> >  	{ .compatible = "microsoft,romulus13", },
> >  	{ .compatible = "microsoft,romulus15", },
> >  	{ .compatible = "qcom,sc8180x-primus" },
> > +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
> 
> R/W works for me (tm).. the META version may be (inconclusive) 2605

I'd let you sort this out with Johan. He wrote that variables didn't
persist across reboots.

> 
> Konrad

-- 
With best wishes
Dmitry

