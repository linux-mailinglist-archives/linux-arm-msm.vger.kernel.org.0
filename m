Return-Path: <linux-arm-msm+bounces-62864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9C4AEBEA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B138189895E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22892EACEE;
	Fri, 27 Jun 2025 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bktBNDHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14AF2EA742
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046935; cv=none; b=CfQHhhqxCV0R/PVZfeqICFMUbfL5A/o7gqSV+QWH/TFKCxpUFXkif4o5TQMr3F6oQSgCXrDuNnMqVncDkhRqRPOsp4pw9W+DevixayM37VMj9TGceotQLQH/pLqOMSWNYFfnqINgbUnM9AhlVHNAdeDeK7fHsw1/NcHiAUQ3yaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046935; c=relaxed/simple;
	bh=sP55RcNGRtVXAqUW36R17TRg0JabtTdiLcEfMjXZ0rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3MMuIkytknQimdqwNbIAowBVD1N4+7kO0S+To/XmFAQCKnoB4bgpCTj9ONEJhlG6UYoI0Knc3QCjp1oDj4IPLxu9CJNbFraIbnZp3PHc3YcUWXmn/IcsGBq8q/C82jMjPX0o74iixPvNJg0ihnkQ8v/cYuqTYZtwMIHz87dLRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bktBNDHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCAp1A028793
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=; b=bktBNDHk6uXDTEkc
	P3hPdPknqjLUHgdbQBnOxh0EkFLa3qjGh0hsd72BMxnmtzFKmSqT3MZn6H5wQFZn
	esyndwzb/ajSbcEuCUFWD6HeppBAWxX45VTf5anMua3JjOjDl+mRUxlIT2fh8DNb
	LFX7XX7JeuSDBYFs12oq1x0qRnbASgbjTqZmYwvKsNNPX9rzMduNHgdttdd4TY79
	htJBfVjiXzKr++u0m8uUbvkV8dJgth9Zp6qf3fbyWl1ej16lGxZrKGOczkqGWWEO
	qMsuPvV296TfDskYUzZ1Cu4EyhSKTYnjECJUlJ25z1D0BUiR4jJOgy6b2GMsZpN+
	HWYIcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbjayu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:55:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a804126ed6so1552661cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 10:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751046932; x=1751651732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=;
        b=Er5Ix/cxqedllxhkdm7uYP7UuZ0Pv6N3dXAcNu2ENOKC2qMvXhp99ImdkcIniMEnSA
         x7A+mQb5AP9n9q9cohyLR9zpdeoXC0Sby/gSqWN6rpGqZobz3IUjn1i2QXoI8YNEZOrg
         /pGS8tYi4BpsNcbbv3cTjNKIf1Jo5FmqGJC37IzXgbiLAx68NhpSO8rtvd15uVe/J7xF
         rYaRuDepbaqpcRpyBbx7OOML3ZBQNtGfIxZvW3TkJTi/6r18LKqxe68ACnphpiWlyOay
         oypbGvUiHfolow6oGUNz3ujA8RYrAF5iPzvAm2uhfSfo3Jo4bKca/lRaSDfMEs0s01Z4
         B6TA==
X-Forwarded-Encrypted: i=1; AJvYcCVgwOCiC+dl278RbXgZN/uh71Wh/3lYhHoOFpcWrGsFKVdJMWrsCEg7nwB2AhMOB1QZtVv7QFyQpCttlAGI@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxdymCCqjiLE5U+rf6UopcKiEToyQjio6qkyI/00BxkwewBQh
	RQNDemYCChsZvcshFsu93c3nLX9C37V87CyPSoguU855KMeOsfjGwRCqUwTRZMDCfh/wGj12Udd
	Ba0hR653GDgyUz/1k9bhN1SlwDo8lw+cr+MWOGimfq/sFB/5tDAcvKmGQa/s29DodSzdV
X-Gm-Gg: ASbGncv8F/ZNJJC5DgW5m/V252PTyPn0+nz8Nt8/4eNmjbzsdolGvWAS+FxCFZW3yKU
	b4fV2OnoYLVTefLqfGDaKNS120h5fdoqlozJIhKDKwAy3/1tGK/5DMUcH7E5wuYilTLDxWg6OrG
	tV9VpEMcoyz/GAtPvt4gDRbz97UbQ8oW2lCR8sSLd+CsYGe9PsDBtgA9TTBAzP+q61fONXEycw/
	aNDR8Ws9h4PHrQmkszkEUBm6ojBdUmFongnFJqy+4NjKU5dHtNlTuF1Ym9ifnNslBkubR0nokOg
	iMiW4tNDxvPuEyvMTG+5aqeZbKukQrD4xLMAAfYKvJZdXlXZaJ0/4BOkcPvjYu92tNCWj33tSPM
	BFN8=
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a807390ff1mr1923031cf.4.1751046931757;
        Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjS6V7nSMnoKIToCQDAP4GKzUa5d91t9ousBqXncQjQ5eyhDeXwLOlzvN8i3GRTqy4F6YNGw==
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a807390ff1mr1922741cf.4.1751046931099;
        Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm1778182a12.19.2025.06.27.10.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:55:30 -0700 (PDT)
Message-ID: <80912fb3-2af3-48b1-b81c-89bfcdb54841@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 19:55:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0NSBTYWx0ZWRfX6k0s5lbZjB5R
 Exb8z6Ul0WJiHq3bZThUNSl/fRYe51SiUXQMbPCTIOxv4r4byMs2sqsn9amVSJBDea5xCfXcBZf
 VxR6vA8qWLWLJ6fMlZWvWtjt6L7SBs6nRM6GerG+k/i+49EVz6wHB4z7TlHRM8x2gLTNr0rKJ+O
 OeVuvnWuNq0XVd3nE2kZr4qVLC5h0WInC6ZapCdzTLmkaGfm3rnb22JAdfknoGcg96NMXY06i5Q
 rG8kDPm7zK9Yg+wckzeZ41+WMz+2/wOSFDn5ScyW18ka6KjzHpzZXziJPUZU/2+TFyecZPS8R7F
 PR3qWHdJcHhuxlptAWvJ9ZWC/XQTL/54KnyRuOZ5tj+OiMDzd8YO3NdVCKKl6VieNi5o2UD2oC1
 USXPL7W4Vk0zKnWML6IrhPqFuDgZEDXrm+VCCB+ZJEGngr9pC17JAxK5Nvdw53mWgaDqY+6a
X-Proofpoint-GUID: VkI_6AnnbDsMSp0NFm41XfWrSOA8w5db
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685edb14 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5MiDvfStR0l9wvLywkEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VkI_6AnnbDsMSp0NFm41XfWrSOA8w5db
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=807 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270145

On 6/27/25 7:18 PM, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Nice, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


