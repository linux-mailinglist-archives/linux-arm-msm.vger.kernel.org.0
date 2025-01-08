Return-Path: <linux-arm-msm+bounces-44458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D320BA0676F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60B73A6ECA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 21:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E331F426E;
	Wed,  8 Jan 2025 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SDuoFvZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9C1A08CA;
	Wed,  8 Jan 2025 21:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736372840; cv=none; b=mSv5JtzB0ewLE8mKKIlhsGDQ16D0DvVLrGoji+51PrCUFJau5Eu/qouAZv1npIfUDU6AfNIi8cHbuTUbrEAK6v5LkpFqAIyiHHXWEp9BYEYLD7OMMiRyFjz1JAcnLsGs2lqZ59+WZhEcv0QZjc7KcgtEmvnO8rR6y6NqOVo5sCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736372840; c=relaxed/simple;
	bh=LV8hwJya1sojsl5TXA/ligv/Nq4PUx7OSws+PNyvpxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KU/wD9tsAtIMNUzL+ov/ub5W/XyNSK9eSXA1OpDnxCh35KAF6Ge/jS/IdKqJRSERC+oVk8T/635+aP9c1zCARw2px7B4Xt47Cak+AckECHah3euXY82s8wGvvmEzJ68VWEwRR+ajAv+Cdlfd0rliDMlLwjAr5jySs4mcNwrDtuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SDuoFvZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ih1k7008541;
	Wed, 8 Jan 2025 21:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfjGdLbQbnpGXnI+p0OFDNuAVAISOAh6o7mQ1iTDrmI=; b=SDuoFvZhlfDrLmlq
	FcgYKwKb+k/P/gdo+1Oc1ZSNcYkovT1r4UgAGvaa5kE+HxiG+XCrxT1mVqTCfahw
	AUuilmujyq1C15DCeHEGl8V9LcSJwUDc9Qr8l6YlUxPtuG5umh6gKTXx2H20C145
	FdCjbQqG+dFJVPU8+gNJ+We63jyVxLKyckfB0xoTDiIGeIXCGYSfBztumX6W6zuc
	pKmF7A8FYT/Bdwz1Etq1pQ7y8yYgj2ng2jSAOByOfVga3yw1lxdJZVhw4PmPu+hm
	QQ4afKSX2tHmQvGaT081q3adAl02uMtSBkTu13I/F4Ja5rlScH10uztbq/FuVHUB
	XRAWZQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrca0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 21:47:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508LlDa2011389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 21:47:14 GMT
Received: from [10.216.24.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 13:47:10 -0800
Message-ID: <ae7f2d05-df0a-42e5-9e2e-586c35e5754d@quicinc.com>
Date: Thu, 9 Jan 2025 03:17:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] nvmem: core: fix bit offsets of more than one byte
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
 <20250104-sar2130p-nvmem-v3-1-a94e0b7de2fa@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20250104-sar2130p-nvmem-v3-1-a94e0b7de2fa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8-3pyHGlTAYODU9JPn4thcPswq5CC96L
X-Proofpoint-ORIG-GUID: 8-3pyHGlTAYODU9JPn4thcPswq5CC96L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080178

On 1/4/2025 11:49 AM, Dmitry Baryshkov wrote:
> If the NVMEM specifies a stride to access data, reading particular cell
> might require bit offset that is bigger than one byte. Rework NVMEM core
> code to support bit offsets of more than 8 bits.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/nvmem/core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index d6494dfc20a7324bde6415776dcabbb0bfdd334b..c0af43a37195c3869507a203b370615309aeee67 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -834,7 +834,9 @@ static int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_nod
>  		if (addr && len == (2 * sizeof(u32))) {
>  			info.bit_offset = be32_to_cpup(addr++);
>  			info.nbits = be32_to_cpup(addr);
> -			if (info.bit_offset >= BITS_PER_BYTE || info.nbits < 1) {
> +			if (info.bit_offset >= BITS_PER_BYTE * info.bytes ||
> +			    info.nbits < 1 ||
> +			    info.bit_offset + info.nbits >= BITS_PER_BYTE * info.bytes) {

Should it be ">" check instead of ">=" check here?
For eg: bit_offset = 7, nbits = 1 and info.bytes = 1 is valid, isn't it?

-Akhil

>  				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
>  				of_node_put(child);
>  				return -EINVAL;
> @@ -1627,21 +1629,29 @@ EXPORT_SYMBOL_GPL(nvmem_cell_put);
>  static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void *buf)
>  {
>  	u8 *p, *b;
> -	int i, extra, bit_offset = cell->bit_offset;
> +	int i, extra, bytes_offset;
> +	int bit_offset = cell->bit_offset;
>  
>  	p = b = buf;
> -	if (bit_offset) {
> +
> +	bytes_offset = bit_offset / BITS_PER_BYTE;
> +	b += bytes_offset;
> +	bit_offset %= BITS_PER_BYTE;
> +
> +	if (bit_offset % BITS_PER_BYTE) {
>  		/* First shift */
> -		*b++ >>= bit_offset;
> +		*p = *b++ >> bit_offset;
>  
>  		/* setup rest of the bytes if any */
>  		for (i = 1; i < cell->bytes; i++) {
>  			/* Get bits from next byte and shift them towards msb */
> -			*p |= *b << (BITS_PER_BYTE - bit_offset);
> +			*p++ |= *b << (BITS_PER_BYTE - bit_offset);
>  
> -			p = b;
> -			*b++ >>= bit_offset;
> +			*p = *b++ >> bit_offset;
>  		}
> +	} else if (p != b) {
> +		memmove(p, b, cell->bytes - bytes_offset);
> +		p += cell->bytes - 1;
>  	} else {
>  		/* point to the msb */
>  		p += cell->bytes - 1;
> 


