Return-Path: <linux-arm-msm+bounces-66827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7EB1381E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF3DC7A3DBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FF1255F5C;
	Mon, 28 Jul 2025 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FY7JmOAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9101F1518
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696056; cv=none; b=GUIhRnuK9i/g6wZagpGeqAZQBVxOaHgoVZ39s/5bCh80wkaoK0+dRLOF/1mAYCYJ8XMSgoYbxXXGx9Uh/ufBepcTFKiDuNeFAEEhfM8mVibJP4bEZH9RNy1B7cJ3LTzXrvyd7ShmTINACe/ryQf8Ju6Arcp9e7gE6MDev3k2QlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696056; c=relaxed/simple;
	bh=V5v51/y/EDwGpe5nPnEeveCat4hEczx7n5xKlzu2KBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/nEsYyhvRwYNhsmQI5pcbqubW9nsUiui9xXQFEl6WfJflMS6lpyIklh5Dt8RrmpPrjHxu8emqYgHW8+cpLFPVZliwa8OUFr5WUtFNRTHeGzhVZTkIuJFWatN5csb9pTcaaUlaJ9K5xLz3YR6OV8xBxbmXHGneEM4yk/BSmmOVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY7JmOAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rMsJ014352
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b9Lab31gEFp/hDP2GVsnvv+B
	yECgPDDTBcTF566eV/0=; b=FY7JmOAK8K89eLGi/UkgJAJ0dqy8rM35QIEd7sDL
	tyJ0KWGVmtBi2QyffYEmDu7egvhYhTM1YHGUzxNbSaxclh0FH9/StjIB/6zwpn7z
	KfH+RhU8ZBmUccKkVRr7jlo5Z3xPKE64aU3OsGbtHsQ/fmLjbNcU42qjX3Z+sp6p
	K5ggEY5E80WyNceoxcMeCQTKu/MVamoh2u1YcLodlcpJGHgG0Y/Eaae4oglsfzZX
	OAvUS/2PoYz5GDu7KDOTg9fjpNe0IskQ1D6lGkHmOJdm7kZCvD/C2WILdcN21KXb
	fHRUq6kZSJSM8G+XRMDmpHcWYAHS0+09/sqHcKGIlVoUKA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ac35g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:47:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso56041096d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753696053; x=1754300853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9Lab31gEFp/hDP2GVsnvv+ByECgPDDTBcTF566eV/0=;
        b=GZtuPaGdMfHTBOWaES6aXNubOyf3lKg+xvwCAAWuGXjNaq4+atV7pdsREBSTRp8NFS
         OEqQQcDoJqwxw+V/nZ5u3itxpxvZvjaSEAq8EXPLLkKbt9OoIdS+vHlQAmrZTsHq7Ocm
         lMuzfDTjcsEx7J1GK4dmiypSn9Fxel0kQcnaGLtHclJ4fPDX+SZFd7MK0+O5cO8ZM3MW
         FgwOLt5WWpE1sZSvfOurt5yq/NKNbKQuXDUfvt8ZLmQXNbbrE2quDWhsaFiFAEVHonUd
         T+VYv0eD4KdTAU0dw0dWIe/H5+5Q38hqYXv35pufSKPUMrTjsUooDTRmRrFT/MnHB1Oy
         XqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY4Wxc5kdlbRjJqkpYwg2IofIxmBqmBwXIOReOVonyAVcjAlKa0uMkhNo4M1Gthrnb815FBou3YiQquB+Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu8sxRv41KYoJgRkuwJBwDtaLbA6l5Bkbh8MuxdosDepcfjKO8
	iXxxNlza7VlGNjK4X28BAfPJWyvFgT+3X13D/mM9GBhdb4r85lK9U5Ra6e1F5fXawiXIzBHR+n+
	c1f8SQREdKr/OAbw1ZUWHbFZThaIKUHgoeK5c56atWUw97rdea9nm7fxYn1DaZLECiTlQ
X-Gm-Gg: ASbGncvFA1Cvy5m5QicQPr7Ih0bLz3dHS+z7zwfs9J9qR145wekmPmJHZXKW8MDoPvv
	642eR0OSiPEXOCeMYoSsjIpG2vTBmTVi6f5vJbktZ9pMQ0W1FW6LM9efE1jiQtBSjAsblUGplns
	6hC+PKpfns1+MDhReFd/wC4UGlQH61RnWBxAmaLq6ihkkYEWQnLEEo0n+9x3jjN+f2bYLSt2NS1
	SS7SrpmB9jeYQqZU5UermXUPoV5g5uRGvzPdtep86FF6VU8Qfzibq7nakBwKHxt44G9Px/0gRKc
	sGpFD2FtV8/GaOrFpQ+IPzhqH0GYqS10S7A3QZJrK0iSYMDpxQKRj5UXsHTkDBsNFGkDsjlGhG8
	gp0te4fK03j/ygimJ5nqHgJlBc67Esbs9gN3TO0Pq9cN6wPzu69o8
X-Received: by 2002:a05:6214:29e7:b0:707:1ab5:3787 with SMTP id 6a1803df08f44-707205a898dmr117877866d6.30.1753696053026;
        Mon, 28 Jul 2025 02:47:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG86xL83cEvXn5rUOfw1+S9RzGG5TSNJ9B4gIrX/EQyKkUkuVDASfMailmNVSy39NbPS3hl1g==
X-Received: by 2002:a05:6214:29e7:b0:707:1ab5:3787 with SMTP id 6a1803df08f44-707205a898dmr117877706d6.30.1753696052457;
        Mon, 28 Jul 2025 02:47:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f4297067sm11596761fa.88.2025.07.28.02.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:47:31 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:47:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Flatten usb controller nodes
Message-ID: <eqj52yo6ke6pfwgbldztmxhm33ut5qs35z6fs77uyvyknngrod@2qs5e6san5tm>
References: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xHkE1AKUbiKwFWVhvFyYnkaYzsGIMIr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3MSBTYWx0ZWRfX2Ki8SGBQlWI+
 dM1BmtrZeXP9VZ3AiZQUZap833df33FGEoTxSthS4DZ1w89dv/7rc+rF8qTcmx999rWVdMrNFTR
 h0aMuGwreiO6SqpJgSp/95g+ev6cHcWMgxelv9AN9sIhxNrnasS8DqQ2p93OxDfvqUGvwsYETOK
 S9rJU8O7v6/mwLPTy/XanAK/JcL0hYiF1CaFddr+0sTFrPc3xAZmLdjSHVH4+W2MCQPgHQoRlT6
 ABecUaPMSB7aZBO3paRYRGr189efi1teT28Kt00QX6rePOoeLgsFKqpQjqTKQmANkx4nfNRprM6
 zkHLyEIqo1I2YZfJRStA3of1vxarIbq8MSAnComY9T6sHpImQOv2+hZSMiqAVqX8gyEunGAOwQc
 vNGDoSaSnyfPrrCS0k9Z2ka1XIDBHg/Y46b9vk0R5gqHIAIsPExbM+rM3ERHZlPSxLm61Uad
X-Proofpoint-GUID: xHkE1AKUbiKwFWVhvFyYnkaYzsGIMIr-
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=68874735 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OKk1g8ew7IGzsuuaGm4A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=437 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280071

On Mon, Jul 28, 2025 at 09:28:12AM +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> This patch has only been compile tested.
> 
> Changes in v3:
> Fixed dt labels as pointed by Dmitry.
> Fixed DTBS warning pointed by Rob's bot in v2.
> Flattened second controller as well.
> 
> Link to v2:
> https://lore.kernel.org/all/20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com/
> 
> Changes in v2:
> Fixed reg base address
> 
> Link to RFC:
> https://lore.kernel.org/all/20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com/
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

