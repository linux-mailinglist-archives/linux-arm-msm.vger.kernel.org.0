Return-Path: <linux-arm-msm+bounces-59181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B5AC1EBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D21503C9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B981CDFCE;
	Fri, 23 May 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXzNWuYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF52F41
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989283; cv=none; b=fQWSMdDqyE8DJ/K++IooVVfBROk+0obmIwv9YocrmNoPB6eY7l3BdtaR9ibDFqVjMHYdT4WqDNOhQvjD+/vku96FlaOp8zk08XAMe2PweuF4ijJ1ODQiYOUZnkVEPGRsC2tKAyT76vYGzNvUaFOMNB50MMMmtbkbfn0to5yeNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989283; c=relaxed/simple;
	bh=GkeVqE5xrNQ5PYvPUXgaz9WUDBXI2PXjIG49+cZiB40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjXdwyWs176JhR1mcRdUglkWxB39gq++KJ24v1tAGuhvURthkY5wEnL+VLAffTl52QVogS3epFqzo8MG+FiBrkteb7LUtbBT6tBC7Nk2k92q/pNKkXw5FXjwWo990V3fpFYPuWKCBplsYcxeJxDEC4PGxh1TpI6dbu0P/q3V6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXzNWuYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N6bZF8004048
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q/JqXQ3k+iOoGEfHZZbYkqqZ
	YyL4H7ssJb7anin1ELA=; b=QXzNWuYkmafUhN1ijaI2NJILqglBzcqgVsvu0UB/
	+pRISu0Bq1htJmQTTM/9MGpLvgSQyIz4QnaJrDqqt+1c36EM37L1TGXJjWUYJPsN
	BPYa4/MMwiRZRBkBejVc8Sq+tDA0WiXJhhbD86ucm7NKWeWgIS/pXi6LcU7X2OXe
	vStAFtIULrnVpxJDuTNHzKc6BHOXI0BlQUnv5/zDkErvooh3itimhTi/RAb00uAc
	wbZPzZ3nNPQ8AX2TyCc/uPBfmxoHTRAvAcYSlEEfv9JEtKFf21yySTzL7R129mQM
	IM/s3RT2dpTzyF2I+snfPDYF/OSy2xy3t/9UZ/vi1cfIcg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf5190k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:34:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so118145456d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 01:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989279; x=1748594079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/JqXQ3k+iOoGEfHZZbYkqqZYyL4H7ssJb7anin1ELA=;
        b=c7zWmkfYKqgXDyjA/6tNDgUNyJMgFs9kA2jCteOaVKnnjpzBETp7q+rS0gXahEJ2Pw
         73TDHKMGj1BrP9m5ViV9AWJSdlkD3BhbNHW+pRgUc0CiIpyQs57JtbcwgoFRVUivQOBd
         j61ekPaDCZaBl44vgPvF5yDgHV/YB1WgVXvT2MdoKcHYb6gCeROMoeiouvhjyCbWIn4R
         oxcSstZRezz3F8qbgI83/4dYSi4KJE5etMOzLbChaSzBM2BQsVzFADRgUZJWQ/BQegQi
         0yorOfqj7TJtXFmvZmbANzlZ2c7ViIJ3qB109PsQjG1d4Bx0afUKyrJWAIh8EKN1pMqh
         2FGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJQGZFTzE7IbgnkH6bqu+60BxdBJt+4rkXRqBOOizerV2g4HCOSYrwIHXwq0k3cU+DWYA/3P0VSVu8A+OV@vger.kernel.org
X-Gm-Message-State: AOJu0YykT59PISfpTWF+BqkTsDj5w2zhT+NUVuHW134Rv9pBx6DSpp6k
	vU9biT2x+512es6uOHqMguUpJ9qhe9WyQj5rnxlnTIn5CIU9NtGc3BeD99zlIqJXsnyaQjEfAjR
	pMm9seyojwuyYdD+rojFeyFmr6vMzEN1VRKLpQUIUG3OKhBwGqagrWbPxSScBpJEWIuyW
X-Gm-Gg: ASbGncvVE+yxohACnF3KPy5P6Ot4/YrjawblAWA4lU8A5BAitJDgVicMXnJN6XExwn/
	F3shBonwRH2HC5NzIFj5tuG2kN+0wYsD96r+Cg9dQJ63/pt6zjA9bgHKhcDhgOzW1NUv1eGsJFC
	youO5+wgxMIlg1fPLTK5O7rC+LRTHECcZTdXu1SC+R2L5oj+fGQFZ/rXAkEOwKXs9H3pSQmIQcM
	ZoQW1ZckLDamxQTpg0Ydq8v1piYTNjuDFsxWCz674I5fwn+zni5b/rpTjP/IhBNm9llBDeIyOCH
	37hj3DMiMmmQg1+YibSgBqFivGLZZDf7NdPTn01KkhBHX9wWGVMBzrTX0gwHxcoJFg+sK5EhecQ
	=
X-Received: by 2002:a05:6214:2608:b0:6e8:f672:ace9 with SMTP id 6a1803df08f44-6f8b2d82abfmr463556236d6.29.1747989279153;
        Fri, 23 May 2025 01:34:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl+nirAQyfXpUmmHc6gc71gYjJiIDPdeKPVcxpTFySxgOFcYO8ObkMAa7+zHI/t6WGMQAbyQ==
X-Received: by 2002:a05:6214:2608:b0:6e8:f672:ace9 with SMTP id 6a1803df08f44-6f8b2d82abfmr463556096d6.29.1747989278821;
        Fri, 23 May 2025 01:34:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c91sm36375031fa.25.2025.05.23.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:34:38 -0700 (PDT)
Date: Fri, 23 May 2025 11:34:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: qcom: QMI encoding/decoding for big endian
Message-ID: <pwckzifghmpxgu7qto7jryjlovznpnkfysbq3aidxnl3wp2vve@q4zr3m2svsv6>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-2-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143530.3623809-2-alexander.wilhelm@westermo.com>
X-Proofpoint-GUID: UUXNcnrnW0ZW4bEyYBCze3f30lHVKySS
X-Proofpoint-ORIG-GUID: UUXNcnrnW0ZW4bEyYBCze3f30lHVKySS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX0MHQbiXoFvla
 He8Zp14TJZlzN4SW8GaEgSdxuQWSNR3EJUe5KhprRQ+vroBMvA5JL3ds2lwHcD8bq5CgHx31WhU
 UFV+zf2y1EDqA/hkTbILxHX2Z6wnKbjophUXMT7cX/MILnXRsN68L9yDUwKoQlSyRoRYRfV0yTM
 dIQeVdIIejpt5e9fkIG5z2nGp3a0KksViwUpiWIxn3l7d3AIPr5znHsVsl+q0Unjd96QKH7R1I6
 UMFUizocM18lTM9903dvzAqC2EL1pJ9dZV3uLUF4DJ41IABIJe/iL+FIpWoMJVDQYV7fi6OCbzi
 fqwvF/yxm7u8im29mQm9UjYOCITHZqAX/WG/oSNq9/EZI5q28wDUjCTKmMfQM+rH8T8LQWZ9shz
 q7v/v1TTPfvZCf8dUrXW+JlCFdqRwGZUw49fCXAbocSZCGu2v0o+ZtbOypfK1hfglfyR9n/B
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830331f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230077

On Thu, May 22, 2025 at 04:35:29PM +0200, Alexander Wilhelm wrote:
> The QMI_DATA_LEN type may have different sizes. Taking the element's
> address of that type and interpret it as a smaller sized ones works fine
> for little endian platforms but not for big endian ones. Instead use
> temporary variables of smaller sized types and cast them correctly to
> support big endian platforms.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c | 46 +++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 8 deletions(-)


Fixes: 9b8a11e82615 ("soc: qcom: Introduce QMI encoder/decoder")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

