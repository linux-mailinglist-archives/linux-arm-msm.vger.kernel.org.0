Return-Path: <linux-arm-msm+bounces-55684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4FA9CF0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5ED03AC9C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A20F1A3152;
	Fri, 25 Apr 2025 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzwTxWVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5509E13633F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600171; cv=none; b=U+uxE9W1O0y+wmUiYNiTRY4GeL2XLeTvrtQcHxORpKdS3A2nJoFN8AyLpxX3K2SJ7kOsag3mwAFuIVZg/oWB4Z6EqRb9f26PI6UTX4+87s2OW5Er4XPlUywraAN+u4601L6zsiqWmP7nfT4wE0/5EIeug0RfaKPdElvZ8ijZMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600171; c=relaxed/simple;
	bh=O2HB9WXj1AoSWhxiYAZ0nXodQII/89yE6laBRLzq100=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBPIY2arDHB4rsQ282EzCrd2zdNHVtGtCAb9zTUX30ZwYZ4JkOp6rcS1/vXyEWoZZGZKPjG22YdQPa0kZeJ7a0IsoPfxfIuINJxAEfhLuEApMds7BGcYkeCdGmGixegS7Cjaf3MZOBiS8lWU9FwLpErWI4I9CLZnKM1lNguv1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzwTxWVQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJsxx011062
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJm7MNzaH/J/vM5UQzpxkTaASRF8p22SemAyXHoKXkE=; b=TzwTxWVQ6bzMBXZc
	OR8Deu1r3Zdq3Bve4iI0fNqpAnAq2qpjvS/B5UFHd8EmMVi+VvEKdgAjV0TFOWyt
	Iibc768E9CUk4iDF3Fg97T/7hYV3i8P7Qm58RXGhLsSe4436blDdWXXnCK+2tI1R
	CJ24UugAOUT82ipQOBqmZDCuysBs8qGs4u7vti/A2iBgjCWzRHiVpSJsQwVwt333
	JSCcZjPRlNpl8/X2AsYdfapp/Yd9s0osOZCw756RHZCFR5oglO3wxXS2V9F5iIeB
	bUdGSGoHpAM0rfFy+utBjhE/J49/jgt9TCpXxhaiWmgKEvE/9H6v0DIEHG+AnfvJ
	f/C1Qg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hw2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:56:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22c31b55ac6so43513215ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600168; x=1746204968;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJm7MNzaH/J/vM5UQzpxkTaASRF8p22SemAyXHoKXkE=;
        b=QWlrOcZaK/TnLzWaJlrcMlfAhesHA7FHTyiuEprH4BvVQXRZPzoAE1vS4uNS30K9+y
         0Sl6fvAh46slpxXqM6Zuk1IiUwN9hQoehnNBTi2nVgS32mhuBxDGgEmFZVvlBbfSY+nN
         +Mjs1eINI7030jogqexJBgIrm79Zg/dBvnm72524XShxUdLr5LYB+uMXUPE6CZVip0xf
         PRVEiAqs2IqvE/tHq+9lUh8u6UBqpiyMJjaqy2T4F3erHt55OwaY3Sn3DKTGl8gwTGqH
         KuQKvCu5Z4R7gPkg54zCB8RjSWKPzIqA3bn1+hHZbwExp6QrZFmwZf/0AbG9SqxuWRTM
         /wdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWif3+V3F+E2jgoyzpYDWeTklDYEs+5qIyrgsioay/LEnRHu0h5AMF4yoXXIg2m1LSvMpWX/J9SWwVoMX02@vger.kernel.org
X-Gm-Message-State: AOJu0YxvB44rI+3fX+cdUXxpEmz8XlaBsGFTYgZrVYyTmkmNH1Il+JtV
	fEmgqf1HQ22rDJpGA3cbHkWwZl/La7ezYmwlyQqk/n+YyCkajewE1MiX+hvTqpsOKnTxPtApx8i
	b8O9wHXBTnv2TGVMC8NLQa+7J8aLhyTEsQyHyntZlcolPimxaeQgOqv0vn7Hz/XaE
X-Gm-Gg: ASbGncs4Y86qUmvba8h2aMf3lpEHURrHnNFYZjHAN4aa+iuv6OuDgEWuxT4JM9f6Raf
	0Y8ObDXE+DIaoh/hpV25PLIksvEkN9BqoEcjdurw+3wQQhMIm+NfxJ31ZnwTzUTdAlXbvhHfYXI
	qy9NNm2TYbGCojI7f10v2O8bVg5AK+3/TMGBxCJKScaRsPG9Pb6/obXsXQ0P89Oha/kdYA8JnWF
	a8+vLXcvIMunoDmXml4NM50jrN1xlxwJSZWGzmCZcElDrDdoD1+9peuxRv66bnu90leEZ1BJmKN
	nlseNOF3jSFUqZp4EFR3do5G5vdrfYn9lqwRdxThYhCDoUTBNqAJ7pdt7dKfOWGFXUelEb5Ccqp
	FSOZk
X-Received: by 2002:a17:902:d4d1:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22dbf6218b7mr48496545ad.40.1745600168448;
        Fri, 25 Apr 2025 09:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvNlnEPnYxMjrWt5k9hsuYhZYiXLEAh9EPbD1EAbWDevHLteIuL9RYWdrJGfS2IaYCzi4izQ==
X-Received: by 2002:a17:902:d4d1:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22dbf6218b7mr48495765ad.40.1745600167474;
        Fri, 25 Apr 2025 09:56:07 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm34776685ad.104.2025.04.25.09.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:56:07 -0700 (PDT)
Message-ID: <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 09:56:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        quic_bqiang@quicinc.com
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: axCwg_aH3bHXfcWehTbW6dVn6gAq29O0
X-Proofpoint-ORIG-GUID: axCwg_aH3bHXfcWehTbW6dVn6gAq29O0
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bbea9 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=TSKuTjsm8c1mV-x-eAYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMCBTYWx0ZWRfXxIb6u3sz1/xK jnF3b4eT8Mmm8wyXL65wYRGKD70OAqBx1B1is/4rEiwb9TEvIZiOyRpiIcZHh4ovkxWqpRyzMw2 etDSpC8yiO7HG6uX1ktVIIO/b0kzaDoWVeH0ROuVxvj5aRnX9GRkT6stUv0B6fXUoC2h+Tni+qb
 sjX+svFTS4Ocvj5+tOYmseWki4SZl+axt2k8LRZPisLkVMG2OgwcGH8b9O2i53SK+TfAkJ29Xxv Jy/cPU/A8L4gb90T6OMo3A0/knlPfZ+XWJvjtmJj3geymWTx0JCCOMq2V6CcwOR8xzwpY/wR4M9 hsaa25Iyu1tSPcUeiNr1iYf4sv3LcGif3k1BybAbGVJ+TqX1eG6q22Ff+q/IelOFYk034o4ibD8
 CnHUuDbIfUYr5U24gRK9V2BTR15Pdp+gadgXyQDk6Kh++ZGvkal4ZUt19JjAmUKaNGemmy9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=986 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250120

On 4/24/2025 10:37 PM, Manivannan Sadhasivam wrote:
> I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> reserved region for the iova_start:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331

This predates my role as maintainer.
I was an internal reviewer, but in internal review (as well as the public v1)
the code was using dedicated 'qcom' DT entries and did not have an offset.

So I looked at the entire patch history:
https://lore.kernel.org/linux-wireless/?q=s%3A%22ath11k%3A+Use+reserved+host+DDR+addresses+from+DT+for+PCI+devices%22

The offset was added in v2.

There is nothing that describes why the offset was added, and nobody
questioned it.


> 
> So this means the firmware will only map the memory from reserved + 0x1000000
> for MHI data structures. But even with current implementation, the MHI stack
> doesn't know anything about the offset, because it just relies on
> dma_alloc_coherent() API which will only honor the reserved region pointed by
> 'memory' property in the node (without the offset).
> 
> So I'm not sure how the firmware makes sure that the data structures lives
> within the offset region. This is more of a question to ath11k folks.
> 
> But your series is not going to make it any worse. Sorry about the confusion.
> 
> - Mani
> 


