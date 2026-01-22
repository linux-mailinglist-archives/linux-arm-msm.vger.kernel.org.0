Return-Path: <linux-arm-msm+bounces-90139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKsSOjvocWkONAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:04:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDCE642FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F04936A046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036063803F1;
	Thu, 22 Jan 2026 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="As8jBQuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SU9TGydc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D4430F806
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072169; cv=none; b=jWN4w0OOcdeF+UcOEdXxCJM/J5IWLpu5uZeszriCDFDm2hrhonCsA8OqjVa/DF6XrsRwiPrjV2cSqoQLqBpPKcE5s6yEihpgUYVEVJb2hlAl1SA4MYe3uMVQa+Kst9E6G60XyG3SFZ+3RsSrbiGWjAHlmokoVS85eogPxx7tgk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072169; c=relaxed/simple;
	bh=sxrjrgW8WH6NV27QNQemzOWuFTjAyb0azFThgsqhkWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCW0sTc9s5J3dfeFkhAbZtsF0mYb6zQVPwJriKn5AJ4zCjL0nwOeM8udzwexB3ANl9aJz0p79behcV7myzew6Jp3AITN26ewCY+GinmN4nrB09avTrdhM8ySkfcIXOxNQjyBxviO1sUWmVgahzafB1aYe2RVjQdWKxMaWiyO86Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=As8jBQuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU9TGydc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M88nNF4057964
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XI2H5e56tHmM8b5yVgBxgJ1Fc1KtkdHABVn4ocaEfcQ=; b=As8jBQuo3bb4Ttla
	XHIc66frrAQOaZwxtx2wRqTuOM8yeKKqO7/2jFx9HOqjiA5a1nXhDkB9PcWz4+Di
	EdyplU+SdRednlWk/CmIiOP1vfK3wJTgNB/Te8ZXXLxYW/+tjo0DI2rPg5/WUgU9
	cxGdgNHCfCJnKptcUeoedNdy9KGgvskTuv84wBo/yCb8ICkKfqoOICaqrECP5nJR
	Mnza+GGcBVUmwnEJCIp4vNZJVPzjUcou88HFKq5wNweka2i6VqmXgbJOgCgbQeC5
	6gnbBkf4pXs+oBc7pUM4tHyK2VRpxo49UWVr/P8dkQNo/Xw+8+V26PlsYMzuGIf+
	mNE07w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbsm0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:56:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f53036ac9so740396b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 00:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769072162; x=1769676962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XI2H5e56tHmM8b5yVgBxgJ1Fc1KtkdHABVn4ocaEfcQ=;
        b=SU9TGydcqvV0mMtgB4SNR3fpaVnJvrriELNPulYeC02ScWnpJvwL+IiW4bnWaxnDuj
         0oZMbB2RnxZWXwU2YqsDEnn/Fb5Cw6qqNXuwLqCSJBPmte9iaKoIF57n2uBnW5vKKElc
         Y6JaDUrf/uy5eZA8UqgFiW9PqbA6BkYy2I9YqF/Dr6A35CNQn5hYrPFndvvfQrr4m9H2
         5TIEtctcJrX8H1dqbaRMZftGpzrBlp2THkpu3wLNmPTPURxV9GypdbQ6n+JiwobUficF
         lWLdtG8MMaEYQS2pPWnR3KukbK0Pd9zMYZSoE+IV2tpPcPI6OO8p/am65Qy5IBCvOV3w
         ct/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072162; x=1769676962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XI2H5e56tHmM8b5yVgBxgJ1Fc1KtkdHABVn4ocaEfcQ=;
        b=MNNQ+6H2La4J7aYX6vWrN2V1bBKMzhtigD0Bd7eegxKf0sun9OYHV8n9VNVhiN423v
         3MzTOQNhlglIlyQInhl6w+7KQb70V/wsYsl4iDGLZOpiSeJg8X5mSU1eQuhU4EcucZPD
         dcrLlOuV+a5dtXHtb/K94pHkztAI2bFz8+sRrPNZ7S+fuaP242ErVhPnOqN9A7pmtobA
         vj+kNuMADSvKXVyqO2Cf5bvap+BooRq4FalmxfwmMf4Ke2jdHv/ypqLT1Yu4PUj9fccQ
         fpaSsh3lp58rrsG+0iP1brYKQTJcatZef7ioZwVbe8VeD8FzMKb2NU8j6bMMTLnZlyjl
         lPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS0Zk/JfGDFFCahH1RxHqwByg6q79SXrTxZmD4TIocK2g6VeD/bIhT3ZcveRB4pwYarAogjNyiYzwznGxq@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHYKWqwzUCDXFUMXF1w9JeIN6jqO9Wq4VPBVoOxg5San2WTTB
	stnKfu82dJB7gZDvw539MdCncJZlfscclb46NpWIv2R55Tjz7kpe3VvflcgZz6Ti5eeMiNlPMcR
	vSOY0EaHkXfyPhQGWmIc18tSv2EnVm3nfJlOKo064i9BaUxjDDX+FODQFLKzkpVfhgnrV
X-Gm-Gg: AZuq6aJT6E/5UtiVOee0wY2aIzVWckS0lpkgxVDc5+iGdeIrAY3zvZnq7wT1tH1xrx2
	nVI3+284a5kduCZVNeKq10c6gTCPHRGe9a9bxYMwYKrzai5DB16zYnnuvAFx6BDAUI3kVIwInl6
	KLcIYjVutxgwWtqujFKi2vn14qoyd9bPOLuXPW3SeqVa7olMLKADQL8ySk+lXX1es5TOCihERTm
	nZ6hgDl/W1umSUzaQb7i8dyLUXCiY2L751MUduub2OfnGc1WS5T9A1b/BeSTUaKOCxvYonHvTI7
	C1cWB1N+diN9QBcLWu/TxnfK00UAUfsXltCDabkYzm+iq9yvuUMJYQ7ouymFN5c/lwucMZI8UvT
	mj6ViHtGyIPerub9yyN7YoA5fiCRxcAbv6FGrhQdq+g==
X-Received: by 2002:a05:6a00:1804:b0:81f:37b2:5657 with SMTP id d2e1a72fcca58-81f9f6abac6mr16169130b3a.17.1769072162436;
        Thu, 22 Jan 2026 00:56:02 -0800 (PST)
X-Received: by 2002:a05:6a00:1804:b0:81f:37b2:5657 with SMTP id d2e1a72fcca58-81f9f6abac6mr16169123b3a.17.1769072161927;
        Thu, 22 Jan 2026 00:56:01 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b51fcsm17343898b3a.68.2026.01.22.00.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:56:01 -0800 (PST)
Message-ID: <acbbd966-2406-4b25-baf1-7fd9b5720bc1@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 14:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] PCI: dwc: Add support for retaining link during host
 init
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260109155350.GA546142@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260109155350.GA546142@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0wwLaBRbweyJx8B37nG68QYmHdnb0Drj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2MCBTYWx0ZWRfXwx4ZKL/StZaf
 LDKjbl47ipnqRCZ5tJuw5D+ZGsItF/31/Bjl34j5LCXkqmYwkW1f8mywg9NE3nkZB/2aYccJ4VO
 tMwkHLEa3BM2jLRDC3ITH4qY5+A/QJz4muhFDPqQuj/NMPf4VOf2ajSFD9dkj4/45EryGf6Ft1g
 s4+GNb+95q2LDoZr+93ZOPEr3oMOm09p6rV7Da8jqGhW1ORwnBM9h6h0HKVX0AsSWG75vpnznuc
 WLVvGWsCMl79Vi7479PQ7N4OIFS8Zvs8DlihQ2ChQ7nbaPtxro+jUqmpyydMJnDvHqhM63c7RRX
 xMqDHv+FFncaHIOiOwgX1PvCtkB96riWnQxdGEiYp34p9r5tEZ4oBlIkaR2Xdap6rmyfkrfLo+Q
 wsuutyCu3mr3xuSJ8wQrZk1Lpshs7oEo7tLqyMjYARdMpq5qFITyEuR29E27T52iPTTpizXfzW2
 KEwgObCLUvw/QqHJdJQ==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=6971e623 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OE-RsO10cNmVjs9PPLIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 0wwLaBRbweyJx8B37nG68QYmHdnb0Drj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90139-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EDCE642FB
X-Rspamd-Action: no action



On 1/9/2026 9:23 PM, Bjorn Helgaas wrote:
> On Fri, Jan 09, 2026 at 12:51:07PM +0530, Krishna Chaitanya Chundru wrote:
>> Some platforms keep the PCIe link up across bootloader and kernel
>> handoff. In such cases, reinitializing the root complex is unnecessary
>> if the DWC glue drivers wants to retain the PCIe link.
>>
>> Introduce a link_retain flag in struct dw_pcie_rp to indicate that
>> the link should be preserved. When this flag is set by DWC glue drivers,
>> skip dw_pcie_setup_rc() and only initialize MSI, avoiding redundant
>> configuration steps.
> It sounds like this adds an assumption that the bootloader
> initialization is the same as what dw_pcie_setup_rc() would do.  This
> assumption also applies to future changes in dw_pcie_setup_rc().
Yes the bootloader is expected to do everything what dw_pcie_setup_r() 
does.
> It looks like you mention an issue like this in [PATCH 4/5]; DBI & ATU
> base being different than "HLOS" (whatever that is).  This sounds like
> a maintenance issue keeping bootloader and kernel driver assumptions
> synchronized.
As the devicetree changes already pointing to different address from the 
boatloader,
I was trying use this method. As changing device tree properties now 
might not
be good, but no harm in doing so. I can skip this and make device tree 
changes.
> Is there something in dw_pcie_setup_rc() that takes a lot of time or
> forces a link retrain?
I don't think it might not take much time as it is few register writes, 
Just doesn't
want to do redundant register writes which are costly in general.
> You mentioned some clock and GENPD issues in
> the cover letter, but I don't see the connection between those and
> dw_pcie_setup_rc().  If there is a connection, please include it in
> this commit log and include a code comment about why
> dw_pcie_setup_rc() is being skipped.
The clock and GENPD issues have no direct relation ship with 
dw_pcie_setup_r(). we are skipping them as they are redundant. I will 
add a comment in next series on this. - Krishna Chaitanya.
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-designware-host.c | 11 ++++++++---
>>   drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index 372207c33a857b4c98572bb1e9b61fa0080bc871..d050df3f22e9507749a8f2fedd4c24fca43fb410 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -655,9 +655,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>>   	if (ret)
>>   		goto err_free_msi;
>>   
>> -	ret = dw_pcie_setup_rc(pp);
>> -	if (ret)
>> -		goto err_remove_edma;
>> +	if (!pp->link_retain) {
> Use positive logic if possible (test "pp->link_retain" instead of
> "!pp->link_retain").
>
> I suspect this would be more maintainable if you identified specific
> things *inside* dw_pcie_setup_rc() that need to be skipped, and you
> added tests there.
>
>> +		ret = dw_pcie_setup_rc(pp);
>> +		if (ret)
>> +			goto err_remove_edma;
>> +	} else {
>> +		dw_pcie_msi_init(pp);
>> +	}
>> +
>>   
>>   	if (!dw_pcie_link_up(pci)) {
>>   		ret = dw_pcie_start_link(pci);
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index 31685951a080456b8834aab2bf79a36c78f46639..8acab751b66a06e8322e027ab55dc0ecfdcf634c 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>> @@ -439,6 +439,7 @@ struct dw_pcie_rp {
>>   	struct pci_config_window *cfg;
>>   	bool			ecam_enabled;
>>   	bool			native_ecam;
>> +	bool			link_retain;
>>   };
>>   
>>   struct dw_pcie_ep_ops {
>>
>> -- 
>> 2.34.1
>>


