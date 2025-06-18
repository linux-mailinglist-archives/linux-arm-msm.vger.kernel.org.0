Return-Path: <linux-arm-msm+bounces-61680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AADCADE43B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C61AD1888E8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B0027E050;
	Wed, 18 Jun 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzuWIL2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A727816E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230446; cv=none; b=mG41pEWa6pOHLDNLDXkZIdG2GhsfCzLP9aEt3/WAgWdPJx6rdj7FB62YMOtm/oaMK1SFICZV+tQJTauzTec9PpmlxoYcqWfavMKJsLQTaU89+vQlSdP5E9gtZ1H50gyuVGzwBik8gzyieq7zPd17uw+U+IlbY8iad/TARq46UT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230446; c=relaxed/simple;
	bh=rlU2zGwFM9YmTQYQGyrp7lMe42gtVScoKfb5K74Me9g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkJDJun1U0SZsUBDXus7R94y1DThNJwfdKEfq/9T5tn3Alrt5HsQnS24NubvQGvAkmoZU0Mua8LBJwMWj+Fw/B5qIOq69TlkVQlLp/7GMfj8HEfIqjxg/0AqftFQoMQBh+6u9Ainc24y8+n/c+MRJh2G0wxCZe0m27vjz56zMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzuWIL2R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1mDEB028015
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aJAn7hBjJyszdrESORg2V/IE
	9MPVgEXDSCugj4BSJ8Q=; b=IzuWIL2RK2F0qCMIDOqO6WaCqAy9z2zh0cGcVXTq
	ah2C4p1mcECmCtbXmuWkomnmMTLrt10DOum80uF+YdHDwMH0b8BHDmUQoNakL4bM
	PaCm6D1C2GANqaHb6ATVVUi8DT5ecdK6/ELxSjIuOWN5/xFK7W5fYOsVJDj+LKPD
	ffItu6oC+ANM4dgWK0AXENhswYbXVZ6Lcpnxg4vMnrYa7wX9L0yWys9CLHBCxurF
	xR8aU70OgaHdEpIOoxIuvMvM3W6nHh7eEhYErkKgTjmVDdgNDfrmng/lkaRIhkd6
	gVCBYx2p42a5uVyCDzIG+R4CEVscpHa9vKZf/87RG5T9gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7b0yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:07:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d099c1779dso1115640185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 00:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230442; x=1750835242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJAn7hBjJyszdrESORg2V/IE9MPVgEXDSCugj4BSJ8Q=;
        b=vYuGBiScv5536ZYWqXn6Pyxl1tGH91BD3qch6vNoE0QRVmhBLBM9FrbOIdM4j9Wvq/
         uHzq0PMxTk8V9tL3XYSjg/lI1pdwRf0h+LCeOCIeqCYNvpf1rqej2i4MmMDvGABWKc68
         cQbivoqPJwAb25CicKn2IOuZoTydihvgU2rCtzYJMz1VWC9g4GDNvQI5evBNYAlopale
         95xiPwYhc4f00hMBlPmB6M0mnx/uIn5ay62kbVAGkxqRk5GguIDXUcnD234ZWpw64cDv
         78kJPWXmlKuxbI5xcq62UdGfk5YZtfbw7Vm3eubGJrdpvvm9yzbce4FMkNPiAsoP0qf7
         iMsA==
X-Forwarded-Encrypted: i=1; AJvYcCXwjQXzbuti841YOUjS+LSH7d664ZxWtIzgdwmtjBSb7Sw2fu+xyB9eHEpVCvwtIgt7tmv/635oTsrYp23L@vger.kernel.org
X-Gm-Message-State: AOJu0YwAqJ/oa1ue9qAFawsljmxb62ugZGdQBFIQdWMIJEkg+rx2FTAL
	vCEKGK5z88Z2/HYLuE+/1M/J58UEAKq+d5Lfz4WAG1x1Dc9rbEGRfBwM+8p4JKqwZdLvdJBuRR9
	qZk3jNLBidq0P2TIclD38z4BjNdLEC6cqwyd51qar6U2Gl/G0oNh80DW++eLKegEZAYMt
X-Gm-Gg: ASbGnct9nnI5DB/ilheVlUZ1Z5VAcMiatRu/JzWPVNE2IRyuoAX6/wkVX2dssK1zk0P
	oiGrg24qsXlCLNWyZZE3YGvT0ZT8cVJuOqzwUzHelsCfFjwrIW6q9klCXNeS7P2xs2vnusbojW1
	m+EmEB2mWXpI9EzMbjbLaADF8+1xjsh7a86msEHpyk0gWadxZ11f3kSfDiQlPyhLV/ZtsyIPMVJ
	3HptKH32B4N0hLEKZq9NQCNHT+rEuiTtZEPwGqytdmoDfcDnU95cpQCmkfwNJBcaaL0FT9ksrWY
	sBXIjJwVP4Lw7oihWawi8aEpeu547DyisTH0yNJ3Ak5s8Uqa8cpS5cKFCQ==
X-Received: by 2002:a05:620a:4611:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d3c6cfb967mr2504558285a.46.1750230442564;
        Wed, 18 Jun 2025 00:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY6o0WAdvfBZgPNZCEmNmaQwkZdoQZkElGREQd18gcW9CllYz/e7O1a74nEW6hnb6uLLeBIw==
X-Received: by 2002:a05:620a:4611:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d3c6cfb967mr2504555185a.46.1750230442127;
        Wed, 18 Jun 2025 00:07:22 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm16165076f8f.94.2025.06.18.00.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:07:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 18 Jun 2025 09:07:20 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, hans.verkuil@cisco.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFJlqGFPrO9Hw4f1@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
 <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
 <aFA5FpJPRmJ/ltI9@trex>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFA5FpJPRmJ/ltI9@trex>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MCBTYWx0ZWRfX+LmzQpMFcckm
 3VCERawW84JDVq20zHi9XdRI6DIK3GPtQF6WsIwiMvKPv2uJ4s3KU3UNSozHAFu1sHWnq9n6v7L
 K/hrq22EC7Dz9D4HsbIiTzhnUm2esWuhf6wZISfzSPtCBHA6Rt3J2ZEuGQZ+I2t6JlHQ7ZexltM
 py5YKqxMdFHdx4Zuc+FOQdfU2ODgSx0sN01jbtdQSVRORQLOZa3BKCZ8+5wHLUdve22kQU/OzN8
 xc9dYH6LnRt4feclkhPKtG6NlZ+dwimgmhAwIbkp1oQcGT9HV6rYCZytzo6Gbl0iLdaZt+e55VZ
 u/HZa2/NlEIhqDwUF1hlmkoqCQPvzOvuC0orOPXKb4gt690pSPlsGnX7rJMqRbMQSckyQoJCwCi
 tY+dkO7ZYc7n4YRMHCRmmmYSYFFpIrMnBvqyIT/oJlmkUZlK1YM+6P80hHuXbuNWBBZ7FhK+
X-Proofpoint-GUID: 4FkUDTRP-Z-4NA1qI-lvm-RhdYMtP1yd
X-Proofpoint-ORIG-GUID: 4FkUDTRP-Z-4NA1qI-lvm-RhdYMtP1yd
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=685265ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=X3RmICvlrzrKrH2AD7gA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=988 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180060

On 16/06/25 17:32:38, Jorge Ramirez wrote:
> On 16/06/25 20:14:36, Vikash Garodia wrote:
> > Hi Jorge,
> > 
> > On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
> > > On 16/06/25 17:26:24, Vikash Garodia wrote:
> > >>
> > >> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > >>> Ensure the IRQ is released before dismantling the ISR handler and
> > >>> clearing related pointers.
> > >>>
> > >>> This prevents any possibility of the interrupt triggering after the
> > >>> handler context has been invalidated.
> > >>>
> > >>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > >>> ---
> > >>>  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> index b5f2ea879950..d9d62d965bcf 100644
> > >>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> > >>>  	venus_interface_queues_release(hdev);
> > >>>  	mutex_destroy(&hdev->lock);
> > >>>  	kfree(hdev);
> > >>> +	devm_free_irq(core->dev, core->irq, core);
> > >> Could you please check and add the handling here [1] as well ?
> > >>
> > >> [1]
> > >> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
> > > 
> > > hi Vikash, sorry I dont get your point - what do you mean?
> > IRQ need to be freed even for error cases during venus_probe().
> >
> 
> but  this is what the current patch does (venus_hfi_destroy is called at
> the end of probe error handling as well).
>

for background, this fixes a null derreference in the Venus driver -
reproduceable in RB3Gen2 on a particular error condition during probe.

> > Regards,
> > Vikash
> > > 
> > >>
> > >> Regards,
> > >> Vikash
> > >>>  	core->ops = NULL;
> > >>>  }
> > >>>  

