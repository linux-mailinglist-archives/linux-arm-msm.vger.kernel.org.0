Return-Path: <linux-arm-msm+bounces-100235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UClrKvpQxmn8IgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:42:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA3341ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33EA7308C0DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7841A3CEB80;
	Fri, 27 Mar 2026 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfqtedcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhDIfWBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9333EB1A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604121; cv=none; b=brBgUHz9CVguJoLUKTktTb7JRTGjiuYcFIKBr6/OzdPS4o9j87KKsA0ksvqkdo7T7zpzALfInw33miVBXZhdUiFtfUeA4gtZDWGk7QoRXV6p2pcUxMjKbZUzpt/uF4RFxZQAyJd9gtLP3mMGAsRghAd3WYwwslPp4QMxAK5/Zf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604121; c=relaxed/simple;
	bh=iJOHN8dmGPbQD80ivaf5mntVO+SR076qCtKMvmHaQFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYr7mdHPSpkSWu8l9KVsdEWH1WDPJDmjFN8BciQ2Nu61B/dT6aDhz9/NKu5ysBS9nNrcrmcFB/kxhqNS8Xq9kx0FMDQJSoMi0jvwFCRpZdliaf8lvoMqmi7s2Qanor/+vE8agGiqV36MM68QHIMh4WEutXMaKX/D6v/bDBO3/aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfqtedcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhDIfWBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3dd1860225
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=; b=dfqtedcKdd+VWg1M
	7rr8jESz/4pyob5K2fouLMEhfpda0yOt9fk6Il6m7RWjeliiACai4e+ZB2hlrx1I
	9MgYxRv0KQ/ku0BWB2gtqXXvKiBRNyf12jRfiUQuuolYntBskTlFgAufv+olHd4U
	9+pYzSrzGS/nBGGzKPqngAx3//YA4A3M7kaA4l965KaJ1iChtAww5Rf4BioiNEed
	zzoIYSIj9ktfWv7IMm3l/NGkcKvqOL4pYOu59I2WfsLqBIG6r82rTb5Ka8Nq3b8H
	ykkyk8hGHoSagfqLpuEBqOyCW+kifxN5Cw9NttYhmJ8EX02pYG8IZakCzrf4EwZ0
	7Q/RGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2dry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:35:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so6207845ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604119; x=1775208919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=;
        b=NhDIfWBqzUrCww5WIo2cyAnSL4SWqKA6N5CPZOG5KYeb6xM8jh9t2pP4ZQbmFouj08
         pfTOdX5stEWoAUlmdUq2zTD3XBcer3r4RgIZ6VGX3VSROQTxfNvsFtH12ospxs5ouuKl
         A2efCeHRmUv+zO0v6AdUThWFaHj6TrfekhE3OgX0Qb8B+YhFTu81jb6Vp0SZung72P65
         vFS2TYnPWYvlER8lo2MwbwGViTF3RCnleS5ZQH+taG9oxGjHE9uOUWmqvwGjcLMzlKaK
         owMIoVdD+ryk895hsaY4ArKEDpE18C8EtNOgs0KnnYcNpn49T9qHV2Ac4J7FyfBgiIL8
         XB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604119; x=1775208919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=;
        b=XLsPdYvIllb5DUeOfiejZZ7vbTue0Y1pNIW52ycGQkmeAQZyiKxNt5OH+jO3XO3BAm
         B2llnkUDqQsH675vXRky0WHZpxduR6Bkk7+x4l958kxX43TNiIjKkP5kajlSWPUm0zJw
         gaRVz8DBqNhW193vUqOm1gPaKMKfnor+QTtpEnVDz5LPJDmotuRVj/SoWvIMKtUOjvJp
         d70fYX2Gqmw7hBo8HtxLZw5vMvp8kslQmTgCNiVc3GNczCMu5mk/0b6k1dRpT0tlPFoC
         wlCCQ3gf0leBeIr6R/fslOG2Erx4BkRgOfZ5DWNTGxEBLOlhKkbDUEqjc1l/1w44izDO
         NEwA==
X-Forwarded-Encrypted: i=1; AJvYcCX6fizKbD2BSlPWR4T0YHsbR4bfL0iRqyLfT0dZyKmu41pN/jiO5dFsIebhIj35unWbH4pks5MbTlMMXTbD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcuq06wnZK/gNRxEGYyRrw52DCp+V1lBdmYJTxWNjNE0SBDLqM
	TApQ2/dgGoey0CXbXbp7WOpY0GDhEHRMC8U1tCkEFFvwnWMuSXdb+MWPJZjqDjb6HT4Hw3DgY+X
	9fPn0FhbU6m+5ntXktF0RnvAH+hSO+I78fZ1SJEzNhgA0HBX6zuU89bSw6zRB6FvtwE+A
X-Gm-Gg: ATEYQzwrSn8/7AzMKcQR9PWV80dxPCeHbIIJ/PqPzy6H7fDcviyulSMGMKq4fCOYOAF
	5FweEDlTfnBOTT2+e+UonPSmZqZ24YmIrgBSrFWyOapSuPu+Q4ZCxYSpADirVqagQPgnweongd8
	ApGDWX6rvAYuFteTwWFmyVdxjft5CnCMDxDvCJlk+4zZtoo+eHr3ZUPpdtKtrrvMoLamavM/wCU
	aG31hpJ/QN3DhnjZl7NKj7oScT0xmD09sDkbjqE8u7tArGfU7DcEcGNLZ07qGoA+9BSRhGk7IWB
	K17csNMJfTbSTKecGps0neu+9My+kB13Q8tfhDj+BH93cJ1rYaH5YUwwanpSuS8vpB2X1N4M3cA
	BhkY11p19qkRDVTOXJ/msSoqpmyCaCYpBjWxPc4vF/D/hSEqYX5HBeDNB
X-Received: by 2002:a17:902:d502:b0:2b0:6d8b:6a07 with SMTP id d9443c01a7336-2b0cdcaa738mr20284225ad.25.1774604118607;
        Fri, 27 Mar 2026 02:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:d502:b0:2b0:6d8b:6a07 with SMTP id d9443c01a7336-2b0cdcaa738mr20283585ad.25.1774604117910;
        Fri, 27 Mar 2026 02:35:17 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a7e3bsm72543195ad.27.2026.03.27.02.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:35:17 -0700 (PDT)
Message-ID: <2c21c307-99bd-4051-8c09-06d370ad9b24@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:05:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] of: Factor arguments passed to of_map_id() into a
 struct
To: Bjorn Helgaas <helgaas@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
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
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260326161957.GA1324845@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260326161957.GA1324845@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c64f57 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vU6kfqNVzfA0ps7fDeEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: A44_xmJboxeaO_Ns4tZyt4J3bM9QynXy
X-Proofpoint-GUID: A44_xmJboxeaO_Ns4tZyt4J3bM9QynXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfXzjSGtxjA1MG9
 ip55rp1i0QOV/nq1j6wKVpbNbl4WaS1b7+F7Pafaf/ZxfXcybLIRt0U2KNIWdJmlMBPuI4CMTVt
 dedc0zvfBdJ3hSkmwL+FkkGGQBYUcxhtFdaMOxzH51rRt6LA5Wo886izMwJtlcWqn5S1sANZDHE
 aP6sUT18EAPo14Jh+FoAIW6hmGPoPt2vCbdha7Wr5UfjharHDuA57SKyFw6tk6fi3HeUl27GFmR
 3N0DC+yO5v3X6tWAP0JCVzyrrAVUcBfuJk0URZpnyfMBY8+a7FNXSSYM4BRFvhygKGzzcsN97oG
 MKkvP4WQbAcrdJl3QK/igIKcL/FMEgMxTHPJvJKmbRdU9ooD8+tnjC7rdZorJgVyCo83QTE/rhh
 UL4T5orbDJjA/ctRx/Yig/L8TCZPjAA8/PU2SOkLLRNBY3w9y7Neu9XTWZOonSiAGA0VaVQDGwO
 BtbbRGpC1ISxR3vgT8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,google.com,nxp.com,pengutronix.de,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-100235-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iommu_spec.np:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54EA3341ED3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 9:49 PM, Bjorn Helgaas wrote:
> [cc->to: Richard, Lucas for pci-imx6.c question]
> 
> On Wed, Mar 25, 2026 at 04:38:23PM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
>> to separate the filter input from the output. Previously, the target
>> parameter served dual purpose: as an input filter (if non-NULL, only
>> match entries targeting that node) and as an output (receiving the
>> matched node with a reference held). Now filter_np is the explicit
>> input filter and arg->np is the pure output.
>>
>> Previously, of_map_id() would call of_node_put() on the matched node
>> when a filter was provided, making reference ownership inconsistent.
>> Remove this internal of_node_put() call so that of_map_id() now always
>> transfers ownership of the matched node reference to the caller via
>> arg->np. Callers are now consistently responsible for releasing this
>> reference with of_node_put(arg->np) when done.
>> ...
> 
> Not actually part of *this* patch, and AFAICS this patch is correct
> as-is, but is it necessary to have different logic around
> of_node_put() for imx_pcie_add_lut_by_rid() and
> apple_pcie_enable_device()?
> 

Thanks for the review comments. Right, there is no need to have different
logic, I will update imx_pcie_add_lut_by_rid() in v12 so that of_node_put()
would be called unconditionally.

>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1137,6 +1137,8 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
>>  
>>  static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  {
>> +	struct of_phandle_args iommu_spec = {};
>> +	struct of_phandle_args msi_spec = {};
>>  	struct device *dev = imx_pcie->pci->dev;
>>  	struct device_node *target;
>>  	u32 sid_i, sid_m;
>> @@ -1144,7 +1146,12 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	u32 sid = 0;
>>  
>>  	target = NULL;
>> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
>> +	if (!err_i) {
>> +		target = iommu_spec.np;
>> +		sid_i = iommu_spec.args[0];
>> +	}
>> +
>>  	if (target) {
>>  		of_node_put(target);
> 
> Here it's conditional on "target" even though of_node_put() checks
> internally for non-NULL, so it would be safe without the conditional
> here.
> 

Agreed, here of_node_put can be called unconditionally , will fix it in v12. 

>>  	} else {
>> @@ -1156,8 +1163,11 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  		err_i = -EINVAL;
>>  	}
>>  
>> -	target = NULL;
>> -	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>> +	err_m = of_map_msi_id(dev->of_node, rid, NULL, &msi_spec);
>> +	if (!err_m) {
>> +		target = msi_spec.np;
>> +		sid_m = msi_spec.args[0];
>> +	}
>>  
>>  	/*
>>  	 *   err_m      target
> 
> And here (outside the diff context) we also call of_node_put()
> conditionally:
> 
>   ...
>   else if (target)
>     of_node_put(target);
> 

Agreed, same as above.

>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..c2cffc0659f4 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = {};
>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
>> @@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>>  	if (err)
>>  		return err;
>>  
>> +	of_node_put(iommu_spec.np);
> 
> Here we call of_node_put() unconditionally.
> 
> I think it would be much nicer if imx_pcie_add_lut_by_rid() used the
> same style as apple_pcie_enable_device() and did the of_node_put()
> unconditionally.  That would untangle the function a bit and make it
> easier to analyze.
> 

Sure, as mentioned above will align imx_pcie_add_lut_by_rid() and
apple_pcie_enable_device().

Thanks,
Vijay
>> +	sid = iommu_spec.args[0];
>>  	mutex_lock(&port->pcie->lock);
>>  
>>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);


