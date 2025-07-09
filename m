Return-Path: <linux-arm-msm+bounces-64234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F182EAFE907
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56C115A552C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497812D8372;
	Wed,  9 Jul 2025 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G2dZ9O7b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674DE293C62;
	Wed,  9 Jul 2025 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064522; cv=none; b=CDHKoL4LUZKYhc24vfUFfTtJxpYNKaa/v5QwPhuJDGxTCLX/ITGKBBOALTQwPHvGnpggOHn22Sr5xyv7iJgL4yW5Ja39DQ/jjoVFU5kwrMKUHW23IIs/5UJzmvdaOqISnb+G7J0WawKYbIN1mlSoUm1dyrAOSphZM1cJ+/+Bf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064522; c=relaxed/simple;
	bh=u0LMkO09GDLRShACu4EPl0TmGt8DY2l9QcuQHQRYajM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YmMmR51hAqc38W/DwRrXV3cEoExWahaparIHrVTTLRl6xpqLOuiSce8u7yyVz4RZ6KGQ/EGNz25pmYCGZrEmBb5C1FTsKG2s0Kedvy80AheIQ2PiGQ0e476e0wCYRSHZwmjjerziZU2/AOtHLmo3pN9kxqA2+JCKYo9i3ZOll+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G2dZ9O7b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697lEUW028820;
	Wed, 9 Jul 2025 12:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6J1zpM42GtV/tRsVKzkFRkPmPM8TlVu6S5NAyafniQ=; b=G2dZ9O7bomlphBYf
	ncveFrW1zOkbz2h2fU63Wfb879ezqVfMAbwzOxGteJGCxxpUW9u8PmtCB/Rweg99
	xEhXcCOh79W2Wx2/gthS/wTJjNxjIzEGnMOVXQFgmlKj+uEZVOLB8yMSyQVyOJmc
	HLkSljsrivHXsSJkV/oMx87I+8B+P/2YawCwZ8Esh2CUCy6oYtbslNYX1cdkrQ7u
	smcFa7uDWVSKVyjLn44LNKNl4cgcl+fLVYnkDHXOxxPdw4iFN38ylP2jSpMWPfEl
	xMc54jEmG9QvfBxMi7C3/UVJ7YmwLYHnnpqbGp1OifInv7Zval+oYkjkJxlUMDpS
	bdsECg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbegy0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 12:35:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 569CZGW3003208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 12:35:16 GMT
Received: from [10.218.37.122] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 05:35:14 -0700
Message-ID: <11e90987-3e78-4c06-ad76-ad9df80357d7@quicinc.com>
Date: Wed, 9 Jul 2025 18:05:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
To: <Vivek.Pernamitta@quicinc.com>, Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDExMyBTYWx0ZWRfX2BDy+vd+gSuz
 ffKJ4K1JBA1k2qLZY/TPwCV2P31PQwhUCIBUqb2iSjlkbYqxOgvlGWFrkMT+hUPpm5sWhzORs1E
 VIWJ44O6wg1WlLyfsC8YsWKBYqtqP2NUFa+bSyYcd029Tsj2dG7CtxyFodcidUc5Nc73Xl/3vch
 nUU98/79ZJQTIYFsxt3P2i6xEYmq96x6FOMSIKQDBAAE29ic2MoHJRWxObmMPGJhnBUYXCsG91i
 g8HuQFqHipp9ZHPOW9fPgvHywu1Vj+f1skQhnGOGXazTD7VyhwldDnIwlnO2ug2/pInZA+mztl1
 OYuYMY0eEYZ43SJAsit6ILBkhlGzM2UqOZ3T+BI2D4BZE4IRsEwAJCcJMororFA1aZm33VhC6+Z
 Pxge8pIWj0+sP8sJrx6yiaKSegwAl0iP+pebg1LTBpNGyarmIj6ZkmpMqYrRKEMh8i3UxtpH
X-Proofpoint-GUID: 3_SinWWuXDE4YEYf4yyBW6Aadu2fwi34
X-Proofpoint-ORIG-GUID: 3_SinWWuXDE4YEYf4yyBW6Aadu2fwi34
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=686e6204 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=zv_5qE797hUBxoToDSIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1011 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090113



On 7/3/2025 8:39 PM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Add SRIOV support for PCIe devices.
> 
May be better to explain about why adding sriov_configure
helps to enable SRIOV in the commit text.

With that fixed,

Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 5c01c23d0bcfedd23f975e99845d5fa88940ccde..3e6e2d38935927cf3352c039266cae7cadb4c118 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1607,7 +1607,8 @@ static struct pci_driver mhi_pci_driver = {
>   	.remove		= mhi_pci_remove,
>   	.shutdown	= mhi_pci_shutdown,
>   	.err_handler	= &mhi_pci_err_handler,
> -	.driver.pm	= &mhi_pci_pm_ops
> +	.driver.pm	= &mhi_pci_pm_ops,
> +	.sriov_configure = pci_sriov_configure_simple
>   };
>   module_pci_driver(mhi_pci_driver);
>   
> 

