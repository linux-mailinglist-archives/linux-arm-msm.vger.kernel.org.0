Return-Path: <linux-arm-msm+bounces-66262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD8B0F0BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 858F61C837AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF3E2DA746;
	Wed, 23 Jul 2025 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrlxioRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC5C29B8C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268910; cv=none; b=MeNothLmJbAJhQByA9VYtK/UxocmxGg2TyfYy941NOOdyu/eMR0Tj7Pna8/pk2h0nTGq0xN+5uGUiAkTdlk9Gpnd85IXUv123bXcs7dzT/tvBEmZW5hwcoWUcooOVvh1ZS0noY6AyO01uRaY95pNmnkG847DX4A3nIF9LkpzlNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268910; c=relaxed/simple;
	bh=afusP6XF3NlqcMK6WC1ygO/UhXjItlHBhT8/8pOnPy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHNSy/V9c+SVbGo7E8MyBXfkbx+lBZVyw8CIk+oJMPEO6YjTi6ypXp+ZPzdzQNHNP5pfN+OxoL6C7gttyZM5rHkUbBT318duiwgIVOW7NaUjSkGzu1eoWc50EaYXN6N7IXkrV1rilq/Vai6cR5YcUCzQAhV8WBtRrL02OOAwV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrlxioRj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9jbHP007921
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hv4tjDdkBfCtIHakQybad2DkErSzaDqc83VYETJQBNA=; b=UrlxioRjE/s6dc72
	Tavgb/7Ta5dEHIc4LWao9G9NtLRE+KHxnwE77SCEfOMklWVwqwHGMy5ecrifbkrA
	LfTAd9Y3owrJIGyYkCc/PXdV8+IOSOxwAcU0ueom/Ydsyft2n+Cj9ciwiZ9dPe6c
	mNjZs6ixQLNH6x7Fb7S0s6kYDscqbWxpTxVIXFWxrBgUffHh9rdRL7PA6R2tom21
	eOvB/7bK/r+F63W+qjxdz3cOHpoRxEHFem/idtdBOV7Jk85HAYZ6Aenyb255hZGj
	5EcIoenfn3P9uVRazVEIJAsciDEpiJmjEdOXhPtpYdS1fDrrXCkS9oYOB4z95FzK
	Y3DmKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htxa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:08:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so2060432085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268906; x=1753873706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hv4tjDdkBfCtIHakQybad2DkErSzaDqc83VYETJQBNA=;
        b=K2SRS5WMzKSk3cDQ8O9nSbuxpBwbkoGIvh2Y0tKcqc/lJk9W2R7Ha+KOL+jm7Ynb77
         ke/SGpl6WDQ6MMVKnZMn2K3xA5kReyG+FFrymwqIXGgBR9Fss7BDdhvgcy9mFESUKL05
         eGYIsNA74QO88OkiRV4caas4txvcAyoZL22IRjpFWXa5olUqbtOWsHooB2GsRVONbE5z
         s5cyjMB59sRlfACz8NiKBYlAOHzTXUy1Ywp5czxKMlbpXDB0a28WaMkqe50rDNRtwogh
         zg16zony7KB2qi9HfPN93IzrrTuk4kSFmxDF6d1YufP6yJ9h9WEFXX+A9JnaAkl8+7i2
         YWww==
X-Forwarded-Encrypted: i=1; AJvYcCXJt9SlSZ60wMUSCgFw+pIk907Y9EbDQphFZ+0RUgJbmtQ8SiTNHjuJqIubyPEFDCiif0tplbIn9E0lhZBn@vger.kernel.org
X-Gm-Message-State: AOJu0YyDPbVziF9zw/WT79sxpXHxY6evqTxyKByU53pnsMuETA81W5hC
	HEHu7LuI55KihbmsuCb+rzkmKW917g6PNHmOXpEZgjaSyfWeI5cHGDdQF1YH+7QuS/1fEzvqfeo
	olgj2hB93NWOBrC8xhsjv9ynGbkF33ZvfXddhhWGX1UyJDLEXvZIMUiqi+zIFhWUr+fxg
X-Gm-Gg: ASbGncsbiTH6ZyqG1atbL6e7lnzmdDwtTmR6PWTxym3MnM/caHulKlG5yInhLB1EUJO
	6WRST4z7g6n8HHofcAUZlSnAs0Nrp8urQjMZCkbTkd1u1PE1OjMwH44sGjkGGCqhPvaGoS2AtGw
	t/v8nBe/70FRK+1/AK5tJawuqzHr3g/unw7geMEnq8PHfQkRWW2DWQ7PCgnwoEUL6OrYFjG7/wz
	KAAJrPxAoVB8Tdi9Os7nUlyV7GX6feQhkxRYpQ8+rOhmn5BQehDvlSK/JAtp/gFJQJkHTW02kch
	ZdJwi5CvR9v0m/YW61GyvvDkwJeFaHBJ3MXFFfXYnk0x/1UzXOHaPv6dIMAgRdM8mRWtN3f6yq/
	QiADp5ELnBcWH6I52QKpALJlt9L01JhnQvZWS+f6BZECs6BeOiHPD
X-Received: by 2002:a05:6214:21aa:b0:6fb:35fa:7802 with SMTP id 6a1803df08f44-7070077a62amr36099476d6.36.1753268905626;
        Wed, 23 Jul 2025 04:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwSQWjtXBuA6eHishG2gIiJ2cGaipMd1mJDi68fioFVtFVf/GzaJVerynAxuQtAMxj9KL8+w==
X-Received: by 2002:a05:6214:21aa:b0:6fb:35fa:7802 with SMTP id 6a1803df08f44-7070077a62amr36098166d6.36.1753268904649;
        Wed, 23 Jul 2025 04:08:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9e89sm18897221fa.88.2025.07.23.04.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:08:22 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:08:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <3fogucs66bpupdwbzlhevpglxg423ub2vkn6zouakjtswa4tu3@drhgtfvr6tz7>
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880c2ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=tE-qeLKrG5p5ljmTaQoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfX8eEah9FkAatC
 R03taUI3Aw+evsh3/i/gwdhG7WL8WzdmHjPeOZTqRJ3jO0WvMJMIJ+47456r04pzqYXi27ozEop
 1zz1PVmUAzDi/KXs3aJ+Ay4EhGS+01pFtsbpVcnXDkoQryQHArQVn0M72beoJAQs31JJHGNpV6f
 OMqTvxk8l4cuMPNz2cpxKLXLxiRQcnngYmi6FIh7ecZCOdS0AlPue4aftAvOQmNzrxBVMk8LZyG
 yr/M4XDC69KYpU/BGRm5bakG6FTJYWaRfe7H9fV82j7M3byP49t5UeZZzf8/lhCuUXyC/SK2Xfe
 OJMzawGMwBLu4yB2wl+1n8FZ4ensSrrGWryKhmWPunk2YtKWn+2UGv532UF4s4hR0dHZeJicT5y
 ZTjzOUYsTa3J/HDtVDkINadThEE2/yOwk2B9Kg7uOHPRdK2w5tEf5zHyv8jMlArj9JGEWQHv
X-Proofpoint-GUID: q3KJbQJ2oQCLiRnvOzhzCGsdSyb_homI
X-Proofpoint-ORIG-GUID: q3KJbQJ2oQCLiRnvOzhzCGsdSyb_homI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230094

On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for operating system running at EL1, enforcing access
> restrictions that prohibit direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v7:
> - Updated the commit message as per Greg's comment
> - Link to v6: https://lore.kernel.org/r/20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com
> 
> Changes in v6:
> - Propagating the error code from disable_eud(), per Dmitry's suggestion
> - Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com
> 
> usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
> 
> Changes in v5:
> * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
> * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v4:
> * Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
> * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud()
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> ---
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
>  2 files changed, 25 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

