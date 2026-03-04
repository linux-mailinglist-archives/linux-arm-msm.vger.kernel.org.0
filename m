Return-Path: <linux-arm-msm+bounces-95277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAdxNYD8p2mlnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:33:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD21FDA89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 714F430185B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CC037FF66;
	Wed,  4 Mar 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jG7fGQ4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnD2HPj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3C282F3A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616827; cv=none; b=lMBXEaoptQQnmqhvNuSVV4QaeTcq9r5sTV43oq94EvG4b2Cs9Fb6otIPf5WSzOMvUuMUgeFqILULeMq3aUyCrsso7NyD4iLCRwio43DTjqhZ0iBowXbuA3RcYyCDPI9ql9BdPzybZirI+B678dWxSKQ+32N08T4rXuOklLaZjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616827; c=relaxed/simple;
	bh=UgQTgkB5UzffbHxj48UknwnHweyGmMrlnoYCea5R01M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cam5z6xY7QAp2kb7NmMsU/s0ziPCfO836QF06xIB5bWuqiZwr0Ily9nUQv+B+gfWDA14LZxiOI/Q/nROnrPSXxU26wO3zNy9v4RDfxnbCQF3MWMoRh50F+q7VQqK5rtl0yzEbo1+sUeEz6iz/9Yc4EbEdifrttuxhrjqcmwszyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jG7fGQ4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnD2HPj1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249Kumm1456217
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 09:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=; b=jG7fGQ4v5uKwi+m6
	jYRS3LTZutxZaRvtn8jkQxwWB2a0rTwd5e4FuO+g0wWd5G6gGJcJF4AE1G5i+wFk
	OVKDaM+De548acZWpPzF3QrgKX7M0ybyyo9T9nH5iq1FCKDwI9itphQ7adIazLDh
	RCVUSxnyEZWmuQHAooPZDGtWaMjcWZ8Cwxhrap9wNj/tneGiKaSjMDD1SK277er9
	zx1qlz8KOShYrjRR+IbVJPOroaviNiAlxyRY0ZMUgNqTvVo0VGxfRXNQzqpcimU5
	5LEprhOHTQYA/7ocebT16KTOpnKkzt3JtoAKgir2XJgo30Zc72Ql1lf/KJbK5HwK
	TOtKHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1801mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:33:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae53ec06b0so132979115ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 01:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616824; x=1773221624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=;
        b=AnD2HPj1eZgauJ+a51GpxVR5LOXekFbZkM/CI1vXOYd5EhIQiMgjfvPxOZzHfjqgwP
         2MSH6X2qnxMqo0MhwIvXpHrq9sQUlQg8zEFmZhnBIemjtRD0dhw0Xm+YKs0TW4k0TkLc
         plRWwOkxz1sVw00as9jzQJgwc0LgIJDIYE7hITDl+4htUjO5PiG7SuTuk8YPgrPmy39l
         44omh1OCnCk3bHosJLxqq/d5Ag/OA2siUhUY9l5QSBxzhSAOwhRgNO3dLISB0SHqoGCU
         2srym+0FdLUlRbJbxffo/84LsArWxI+gDv9JKtpBQp26y74bfBVsbNRHDACWl1jVTVVt
         g4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616824; x=1773221624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=;
        b=d4bYOce2ZA4ZwKc+ijktdJ11PUHs0g41gqTIbHrAvjDlwcH081Kx3Ipx2DawqPnqmg
         O68pSRndUev5C1w6XvJX982Ick46C2F1GJ06vwYb3cx8CUWUzLMZajtwCnAU6MaAhpNv
         e/44wiWGbX85ECudRV9Vb6wXdhl8qTYMqkzPsliKtDrwfKo9f9Bi8SjKkNSwTrdE1Y3s
         y9FDrXtbs+57KBWAOOkCLBblr229KyzuSIJYNlI5IjKOktX43Mu9Ofm41xkNqj6RdDXc
         mXPt7jjZHZeCOGONWI7oFR5j5V0SHqQJugmfNzmeT+SMKKNU4Oo1EfM1kDT003ZsvnxR
         L9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCyh1Y+0wNo3ywwZg54MJKucKKWAqwl0e/Epx6yClgYiAreHRKfUBilgAyWG6Xqu9c3RYgdzmQsa+H6Pc3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+Zw81hNm84PmEFhtt2eh3Pi3jyjgqQ7pv8OmEp8P9f692xXN
	qk9knKGHApiqSXeKlqfgMzsvK01pb2mXZ6+DRT0dsMpSKkB3aXmF4UyNQhuL2qP9gy8fZKZFuZm
	nIQq/5AysDv8pe22CUUoFgikhEuQREeOKEmDFh20j+4IlSwOu1KLFx/jgwHfFAmwWiQun
X-Gm-Gg: ATEYQzycLf7iNEa3YoGPNXyokjKpLptaE3w53/h/crRquSInlQb7V60ZxgX4sfyLwXY
	jwSasOdf/ypmmuZxStd6Tc4yUpXK2nByw6W7Ygl+BRMKzpaCtZS+fXc3Xh8FIFs2OpFz/fRhLNY
	3dQTeUUWKZk3y6PUXYeGLMMCv9rcLRHwjwBeFgbHr9q6qfwmL7BNoUJf+D7O7K+qXo4snz9ZB+Y
	lasCI+LcHUGu8Z43Dlh7C2NwGwEFkos1NLe5GWn7Gng6TPFvntLEJv0Unp7tjk3McQ7U8upRloB
	8X7WSjyUvoFszfNhqLk2NY/nQ6FcnjdhyflxYYpwRGucbhYPn2lC0FPs+rw0pFHc1yO9ywRn9jN
	KuwnZFpwbC7x9B0H9DMwHvtHd8DkaFBgpB6XYDOE6IMtUYxnkxXwRm8EF
X-Received: by 2002:a17:903:3586:b0:2ae:483f:b23b with SMTP id d9443c01a7336-2ae6aaae620mr19109895ad.32.1772616824005;
        Wed, 04 Mar 2026 01:33:44 -0800 (PST)
X-Received: by 2002:a17:903:3586:b0:2ae:483f:b23b with SMTP id d9443c01a7336-2ae6aaae620mr19109655ad.32.1772616823507;
        Wed, 04 Mar 2026 01:33:43 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae541358d4sm76250575ad.75.2026.03.04.01.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:33:42 -0800 (PST)
Message-ID: <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:02:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
To: Marc Zyngier <maz@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
 <86342janlx.wl-maz@kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <86342janlx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9CUE4MFYMmv37HwQoxPZaFE81hQhdxhu
X-Proofpoint-ORIG-GUID: 9CUE4MFYMmv37HwQoxPZaFE81hQhdxhu
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a7fc79 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=xEgsDuFUHT4EKXnybycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX7Bo0S7iwW83N
 NmbsJ2RY18wJtVEj1Y6Ix3F4pq6JEoTGSBNqZcpo5kiWXKeOw9Qs7TwlE2f9keyJ/KoEaSL3KQL
 rwZcOrwu5PZVdN74wDToFpHPSWLP0D47MTP1JP71iYjCOqYfgjNGnw+x7Yi8leXx9BWpzMW6QCK
 CmihYxjfRBNlW5sL6xqgG9L0OqqgRe1N2gqUiUHR4oFYfeEbjEKTVDKICXQNciCu6ycyiTyWFIN
 9cgfA2cmycBJzri8XNSZA7knSda8t/w1kTgWSEdTwy8VqML/X9s6WnCpST+Jcul+o1LShaBLuSX
 tecScVqbwF1KEMdc/OoucG9XyPzWgc5+DTc290zS9dX8mLapDW99JUJH9gxT5aCDOg151m50d3T
 yXAoto98lqIB6+UTjA0S3yBElAJXDSHhRJWMlAo9BbWmXCGShb4/OukM8KAzqXc26dclrgK9LlD
 MuE5XWyvdd9cOzEh/mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-Rspamd-Queue-Id: 69AD21FDA89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-95277-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,arm.com:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/1/2026 3:16 PM, Marc Zyngier wrote:
> On Sun, 01 Mar 2026 08:34:19 +0000,
> Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
>>
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Since we now have quite a few users parsing "iommu-map" and "msi-map"
>> properties, give them some wrappers to conveniently encapsulate the
>> appropriate sets of property names. This will also make it easier to
>> then change of_map_id() to correctly account for specifier cells.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/cdx/cdx_msi.c                    |  3 +--
>>  drivers/iommu/of_iommu.c                 |  4 +---
>>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>>  drivers/of/irq.c                         |  3 +--
>>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>>  drivers/pci/controller/pcie-apple.c      |  3 +--
>>  drivers/xen/grant-dma-ops.c              |  3 +--
>>  include/linux/of.h                       | 14 ++++++++++++++
>>  8 files changed, 22 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
>> index 91b95422b263..63b3544ec997 100644
>> --- a/drivers/cdx/cdx_msi.c
>> +++ b/drivers/cdx/cdx_msi.c
>> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>>  	int ret;
>>  
>>  	/* Retrieve device ID from requestor ID using parent device */
>> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
>> -			NULL, &dev_id);
>> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
>>  	if (ret) {
>>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
>>  		return ret;
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 6b989a62def2..a511ecf21fcd 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	int err;
>>  
>> -	err = of_map_id(master_np, *id, "iommu-map",
>> -			 "iommu-map-mask", &iommu_spec.np,
>> -			 iommu_spec.args);
>> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
>> index d36b278ae66c..b63343a227a9 100644
>> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
>> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
>> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
>>  
>>  	struct device_node *msi_ctrl __free(device_node) = NULL;
>>  
>> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
>> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
>>  }
>>  
>>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 6367c67732d2..e37c1b3f8736 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>>  	 * "msi-map" or an "msi-parent" property.
>>  	 */
>>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
>> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
>> -				"msi-map-mask", msi_np, &id_out))
>> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
>>  			break;
>>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
>>  			break;
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index a5b8d0b71677..bff8289f804a 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	u32 sid = 0;
>>  
>>  	target = NULL;
>> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
>> -			  &target, &sid_i);
>> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>>  	if (target) {
>>  		of_node_put(target);
>>  	} else {
>> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	}
>>  
>>  	target = NULL;
>> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
>> -			  &target, &sid_m);
>> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>>  
>>  	/*
>>  	 *   err_m      target
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index 2d92fc79f6dd..a0937b7b3c4d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
>> -			"iommu-map-mask", NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index c2603e700178..1b7696b2d762 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>>  		struct pci_dev *pdev = to_pci_dev(dev);
>>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>>  
>> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
>> -				iommu_spec.args)) {
>> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>>  			dev_dbg(dev, "Cannot translate ID\n");
>>  			return -ESRCH;
>>  		}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index be6ec4916adf..824649867810 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
>>  	return of_property_read_u32(np, propname, (u32*) out_value);
>>  }
>>  
>> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
>> +				  struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
>> +			 target, id_out);
>> +}
>> +
>> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
>> +				struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
>> +			 target, id_out);
>> +}
>> +
> 
> Any particular reason why this is made inline instead of out of line
> in of/base.c? Also, some documentation would be helpful for the
> aspiring hackers dipping into this.
> 
> Other than that,
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> 
> 	M.
> 

Thanks Marc.

I made them static inline mainly because they’re just trivial wrappers
around of_map_id(), so keeping them in include/linux/of.h avoids adding
new global symbols/exports and keeps the callsites simple (similar to
the existing of_property_read_*() inline wrappers).

That said, I don’t have a strong preference—if you’d rather have
out-of-line helpers in drivers/of/base.c, I’m happy to respin accordingly.

Re Documentation, Sure I'll add comments for of_map_iommu_id() and
of_map_msi_id() in follow up patch.

Thanks,
Vijay




