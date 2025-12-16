Return-Path: <linux-arm-msm+bounces-85299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 555CBCC1135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 07:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CF063071AAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 06:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7EC3358BE;
	Tue, 16 Dec 2025 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AErAzs5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVlD5oCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8373B335541
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765865516; cv=none; b=Vobsw/7qbOUhPhuUy9GKhVbYwett9KZ276LJNJA79SMZ/z+kr9Z9ADERJVXimTVKmf32fgsLKmS2gqRP7vs6K5NXNYc6qxtCjRscrQTHg1ZKEvXS/lcX+6T1AwpvzdJBLH1pIllyZtZJFqfFA6yVpV5sxnwOqCcbOH2wcySJ4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765865516; c=relaxed/simple;
	bh=i1Nwt0cCOQGDA21YL0EvQLhtpOTFKxdTlaMYLCDWRDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQ2+wtc6TE1a8uwVa6s8rNGRrCIZT2ksEOZSE9D7+ljEom2P2j4P1P02rKKPqyvmXpUArQdgNxJ7HW7kb06frDz4MNkiC1/E2z7urRlHil1nnpILMVwBzywvVRm+V/IAkYQZ+wrTeqv+4uCDk8uUIHMOLih4sG0LG4iZ9+YwXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AErAzs5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVlD5oCB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG539FJ366847
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GYtIKEJE2D2FmKqEGGzDBua0
	0Jcsf/HU9nFna+Bnk/k=; b=AErAzs5D+qQHkkY0UCul7jV9PfK3iI56TNk9mb+o
	2DWIbIWXO6hDBEelq1xI9JL40uiSdEMTYL2zdzXngQcMYN9ZdQWp/0ySAgZHaqgr
	FZXbvIq3UbhFMNyEc2KXYxj7xPO2JcDx6/Kujxq7CTHTLOp4NSnKh09dlGfe1wj0
	5JEeXOoX5WNeRwDWiDE6SRxjaBfO3zgqpOiQA8f25SBXLGLCyF8nP2QBBoqF7cjy
	hgJQrUmYrvmRE7l0cTtGk/6nlhgordUQq67NNe8EyXre2NRQKDlDH4WaxxlObUzl
	MUxzTiQ3lo2W7PVZJxXnTyvo2nD+9/9ukBehF/oIZmsrYw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2j1c3bm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:11:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9d73d57328so4160262a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765865503; x=1766470303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYtIKEJE2D2FmKqEGGzDBua00Jcsf/HU9nFna+Bnk/k=;
        b=XVlD5oCBNxHFtTJ8kuIV9nCc5MNU5Ia6HuLuxVJYPxrSpL8Lnu63Zmmy7smMQJ5n1/
         1l1TIJ45bffHaka1SN/CsdIY4slAfKfSk9JLjqnzi9wu75Ufd3eqqs9ru5eU28QRFHdC
         183Hcm57VU7cKlt1NV2O47oh1omPR5vaRR/76d2GcxfwzMxCbc+PcuaFIxDAoxrv/kI4
         dph4xgTLQHWl7CsKjz7GyGOk1Padih030lVhwipP3LGCkQ9zmGpCHADogPaUOg43ftSo
         SqpDHWmdrjmupWdTA9Llxcfz3DY/gOKnbExyD2M136UhI2o7SEBJj30nlr4uY93lmNXI
         9g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865503; x=1766470303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYtIKEJE2D2FmKqEGGzDBua00Jcsf/HU9nFna+Bnk/k=;
        b=dpYkvKfGFbiUmhi9ZYA6QRcTv03hkAFE0iQT0pNI+3mHi5PCJVyAq8b8TeWUcWvxUL
         80lzodaVyUN7AZadzEYH+Mo01aVhnxWA18OCvyHIL2KIjUwDp7srqc/onSSYrsAGO4sj
         UTpSZxb/lp/yD8SyeV7UxHJ36a0FPvxyY6zlEMfVcJMvOPae1IoYD2u1rFoLoQdcQRJF
         jH1xxAtfsJRUcVdqsq94Xod9dei5bZuw1ofGcBHZq8I1KndwfqGfcni/dNzjXYt64L9E
         6JOBk+kPJtSADyONyzSa9Kzug1vFkUT3d6UD1bFn52GMg3EvjTqsTdS9C8yZTLYlBNYB
         5lyA==
X-Forwarded-Encrypted: i=1; AJvYcCWqhsRWQUk4+in0YPfBq7UV3xfgOtgYSieUba0/IHXO8248L8ZFaVtQID3upDAqGRoNi8pAZV037Oyw3hS7@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXLAeU9jhnJi6/PiJRhpAZ1tpzmhPqe8sJDcKZHyyq3sSxdm5
	O9F3lC/JO7+cVOMtb4y9uV3n15X7YHTqIkldk4Un6MeeI3ML5T+sUpQbLPNkBnK0AsDdar+dWwu
	0qIIUUQbySNlnrlO5U5Gf4X9jMLRBVWbZ4fovxH1RBZ9fuRqt5FTrPV3KNqpW4EqxECf5
X-Gm-Gg: AY/fxX7a5Mco3bcqb+garFjWPJDph8LKnDIwhyf9zmMKA8p42dLDjdGLYKb/HOt6Eoi
	b9scy0Sihv6EnH7bITRxrwROags8bFwlAw1bQ7Q+wyqr+zTDJgsbNaGOps8sWHRVbPgliMe3mYo
	8pAKiFO+adhIz2PmcDa/Ye3iFLj2Z6GMgpKGNxbEjvJVzI0J4SpwCJlGccYesc62tw8LsKFcSKS
	Rbik5kBrggwGBoKVnHS6GUxD/LC3Na+JapdjFUtNAA5Bc+SLmZW422NTj8Hez0pduX/htR/PQIM
	mluTv5qS5mebeTA23FtWkF8qpNU9SQY1v1bXDPCunVXjguh0EZV2bZL74S4i1BwAVVDgobt5EsT
	LZPUVkBtMvtZryuEuFvRw+ejRQw0au5pZZbGTBBPt2Bb+ltlIx8naRitz
X-Received: by 2002:a05:7022:2485:b0:11c:b3ae:c9e9 with SMTP id a92af1059eb24-11f34c2da09mr10389184c88.43.1765865502724;
        Mon, 15 Dec 2025 22:11:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQUrjrXhziyFtXJsM6JkEaIAFtfz31jh8L3KbQdzLZxoqrvqw0zeZlF6U5tIO/dtPAtWXSZg==
X-Received: by 2002:a05:7022:2485:b0:11c:b3ae:c9e9 with SMTP id a92af1059eb24-11f34c2da09mr10389165c88.43.1765865502211;
        Mon, 15 Dec 2025 22:11:42 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43ced319sm18229042c88.9.2025.12.15.22.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:11:41 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:40 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUD4HLP8wZr4Iztn@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <6b115125-17f9-4eec-b10c-0722eabe517e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b115125-17f9-4eec-b10c-0722eabe517e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA0OSBTYWx0ZWRfX3S3XTdGwhgHR
 IgI8nxJtZ2GdmGZfW7ex1UfOQGowVHOVWEjWsEUOe9z8HlK3di6/C955bK+TCMyKqK2JqPjXBO7
 k3HUqq0OCnBv7OKPLU1uC2Z+2BzjigntDLFktf7RFUOzc9V0V6FOtuDBU0Yeze/mVszC+wEMZHe
 7i2NWaot4M/AX2HFIOKgdYvgfphQU2K7ob0wn+dpID+n3GFGjV0b4ynl8XKa/jsGz95BMLfk41f
 BidCrm50y+c8zShH2Wi1FXPkKK0fxOwVVxqOkn8H6HNglgJoX8KogXlhA4zjXuTCbe6ZLSG3hHE
 xvD0Vnmwpxv881NxeBcYw2FsuZBPGsRPc2ImHme0BnQgLKwj5FTd1S5rzXuLLAtJtQ5Pm6HpOio
 tx3oZUgP3juUi5eEhp6VIabQ+/8HqA==
X-Proofpoint-GUID: PVUPYExd6Y-s6ZxWutg9uhWtI3qRThLC
X-Authority-Analysis: v=2.4 cv=ceLfb3DM c=1 sm=1 tr=0 ts=6940f81f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RwQgUtxsi0qMzmDKmZsA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: PVUPYExd6Y-s6ZxWutg9uhWtI3qRThLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160049

n Mon, Dec 15, 2025 at 10:21:58AM -0800, Jeff Johnson wrote:
> On 12/7/2025 10:35 PM, Qiang Yu wrote:
> > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> >>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> ...
> >>> @@ -445,6 +448,7 @@ struct mhi_controller {
> >>>  	bool bounce_buf;
> >>>  	bool fbc_download;
> >>>  	bool wake_set;
> >>> +	bool standard_elf_image;
> >>
> >> This flag is never set, making it a dead API. If there are other patches
> >> setting up the flag, please include them into them in the same series.
> > 
> > Let me discuss with Baochen about whether he can include the patch in his
> > series that actually sets this flag for QCC2072 device.
> 
> The QCC2072 patchset under internal review is already 19 patches, all of which
> are specific to the ath12k driver and hence would go through ath.git.
> 
> I'd prefer to not bury this patch in that series.
> 
> Would you be happy with a commit text note that indicates this functionality
> will be used in an upcoming series that adds support for QCC2072 to the ath12k
> driver?
>
It's fine to me.

- Qiang Yu

