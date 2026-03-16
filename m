Return-Path: <linux-arm-msm+bounces-97837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOfcDcKPt2neSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:06:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 836C4294B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB5E83014BEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504C21D514E;
	Mon, 16 Mar 2026 05:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8vFrBIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCSJUOW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E8423EA89
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773637564; cv=none; b=WQmpdBorf96mvciE2swlDieDtokIiJ3VpGQNQ2SV1C0S3NYiiW0NbLe74JlfjFiEkIdrMZdP1NQDNx/poW51k+0sCnrb04w34DBi96vi8q6u2V3J5sS93M0+8iHDLI3EOfE0NGjQcENYAJimuyFvGAx1WMZyqQRFD0YqN/Nqrw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773637564; c=relaxed/simple;
	bh=cmPtJVArbnalVMHL9P77T8r3tp7yP6uMQmEhvHzCmKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rwcat99AgKokEkiJNWYeaDX1iTVKezYJSbqyycZTn/92cNPIyL38O+pw3j5TZHX38nfDtkTZS3Ed4e4V2+ThSuj5kDrLyTiN3Mo+IIas04C2Nm97eRoTd4DFd0viJGGbTJQ4SKqXV8nSdFHlmrvPnfoqGHd7l/aKVAQB8yGm/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8vFrBIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCSJUOW8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FCAFL4457949
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckoWtcCrYvxRiEc6lrlI179D5ZlLt7lkcd6EynuVsNU=; b=L8vFrBIZAu/HqOET
	zGLEIgBeyHgC4UnFqtlqasJdkHE1xX6WRgjUJY2HfhqFml6JfutvqxlApQQZJpmf
	UhHAOxFcz7oad62vWRTBMQ3tYjruNLDIq0iOk9K5BWEwVXPpZ70x/Q2YG4/xV9wh
	qMROHofDmlN7tIeOGW2OMayHQYqKdp/1p5zBFPY4x8W/bQUKnJTLhpCb+4pnmNEa
	W88gJxzi8I5CzLbHBKFO/DgizL75rHPCt1sK1tS3sctjQtxXmOvM2mH7wEkaPu7A
	+NfjLbq3DUL+T7n85O8i9yZLERGavsEGzICpM3eRmuouO/cr2cDTnRrth8+2T6ql
	C+enZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xm83f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:06:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b05a3c2421so4834605ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 22:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773637560; x=1774242360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckoWtcCrYvxRiEc6lrlI179D5ZlLt7lkcd6EynuVsNU=;
        b=SCSJUOW85e1Mf3DHnETc5aB0ZEflOS6T1s6CLk2bc8eLNl3KWqSM4z2wm8s74t//sY
         NOO5n9Q8Hfs2Asq8g5n4+MEdLzLxcbNeKn80oh7FH2oVB6HdeLd7ufOyxSJm+l1mNMBz
         M+0EFGnW+XEdQHntiGi33RXFBYgfSr7cNT1uxOPwr2cOpXJBn4HvuwQPiGbod/rV1SU7
         0R4n4iXTsguHTxSvOyxbo+9iAyJMlnr98dCUddh7gcGWXxOoVobLlbf2+L6KTHeKSqq8
         5M/nVWreKW61BZ6O4uu55J0J8K7KJgD9RD+IMUtozt/b5BNvvwYzxx/msbsvtzwQvLZ3
         Qkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773637560; x=1774242360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckoWtcCrYvxRiEc6lrlI179D5ZlLt7lkcd6EynuVsNU=;
        b=L5OPcWo8jTSC4NwfgJZrEbFPrv8uiNH2rWqmZcpzI6zOXfaSY5F7yXGgZROyo8Asfm
         UxQ+Ykp4MQ7a5A8IFtpbeA44LLtrEjduItEiyvy8xahkNUgcw35bop9bs91htTM/CCiN
         AYGHQGZu7OGHjEfUrm23QHnBoe/xsl1z66HTQQyVD8F1lejx48HtAWSC4B2arqcU7pSe
         sysVK2dKbSUx8C2t7FJyhKPB0kjTvuWW6n8AfcsONv3XfFhbWL9Dajom2R667HPAzwII
         ISzImNDdc0gnxWGDX1sgg2yjLc9qFXiM7PgLFmU/yyrXrvuDXEOdBDW3Rl6SgTNXKhDd
         ybfA==
X-Forwarded-Encrypted: i=1; AJvYcCXdbmZX4KyQJC+rlkfvGJnRFeXzztKhxD83u2ODCcorkJZO9nq0kLFo1hBlvxlKAHU+OTB5CZC7+r+Ia4xZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyU68dyinhEjGGsM69Vdu2CO1lO8l6UobXVplx91cCQt+n/uU+x
	aOK1TepECYw47bDUaw7YcWg2n4ETDj8XoBWW9r7GXBBYgecmGPCAz1VhuEP/kMFSmTswQxVijvw
	f/BJZ9DHcBsjhNpFZOWrVOSkwQENet31gFIjeZFeBejZKWlQy7VLcURR/1JloZb9uHaWZ
X-Gm-Gg: ATEYQzxp+vPnaR4RraXTyAtdp0MUK4AwgVMu1mmYyTzIzTZebJKwHKQVhEJNdyaObQN
	P4BCAwEneVNOfi7gpAyXOGLhFSC2GMNWCSE2LFoUGE/4LilCiD845ysFlB3X3aBo2WlffPhwTqn
	9TYOyDCk89eHULA5WSNZbEdqe+drkcPGaPSpSjoybtJVg/xyQSv5KdJ4qVZOhAZohkNuC0BlEzj
	lvEYeYv8PnnnKv3QEvo/3QNGfs2o0x4q+ocDpBAqly8GZUccRWwoI4pUcMvpcyQFkuZrkeexo7v
	WMT9CqO1bXZoD03Je6J0syNVHoMyjiTR/2ASlQMHbeN+h7E/YhnYKLtfOnKs2UNawWLOYRAS05t
	6vyG4CDwTCg1l7T9UTCv/3ZFGkZVMGYehu/2xNhdQtB2oPdc/l0HTrQ==
X-Received: by 2002:a17:903:3905:b0:2ae:3d7d:d905 with SMTP id d9443c01a7336-2aecaa18fb8mr132302175ad.23.1773637559923;
        Sun, 15 Mar 2026 22:05:59 -0700 (PDT)
X-Received: by 2002:a17:903:3905:b0:2ae:3d7d:d905 with SMTP id d9443c01a7336-2aecaa18fb8mr132301955ad.23.1773637559455;
        Sun, 15 Mar 2026 22:05:59 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece83ded9sm92962095ad.81.2026.03.15.22.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 22:05:59 -0700 (PDT)
Message-ID: <7ac68128-a3d2-4244-9435-a39f6eec1d1a@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:35:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] PCI: qcom: Program T_POWER_ON
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
 <20260311-t_power_on_fux-v3-3-9b1f1d09c6f3@oss.qualcomm.com>
 <wofjlohumsdyyfhndrdwf4ujxiwlrajm2rpobd6gofpqyasttb@ze54bm6pwbgq>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <wofjlohumsdyyfhndrdwf4ujxiwlrajm2rpobd6gofpqyasttb@ze54bm6pwbgq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAzNiBTYWx0ZWRfX6/jdGCmmhtxn
 QCEqCzrgwkxSFpIXZLKMw7Sbx7FFnjw/PkD/mgQL4AJoPZWmF8UQnnleUwSuzFg+8ZvJ2qy+Ep0
 TVi4x3lEmORJizckPoxXSwayBaw/XddWtjY44CnD/sZlGo98E5wVDLP+UdqgMdPxJJIMogLwtb2
 kVK1UfOnH21Wf1vJT4b7F7zqEtqb2pYTgU8qMkuXxNioVE7TLRG0lWZex3iUTnGwziLxdhNXJ7N
 Yl+ghhufV/8mytw1KeKdgDg3xtsqTb25HjwQ7FB2QtGUpICluOb+1yXESglEvkumqnaA/HA3cPU
 oXgIEeolAeULQtQlZNpJtt/dfPtFmyoHlJQUY86YyMCq+8J1X6T3sr0ch0DOH5IbRdu1oTTVXEY
 VpV3rxnfTX9sKK5HOtv+xHYafuxtoleeNPWBcwhgEq7eykBvCT0vQZCvN8hqdrHmNOmDDl7mQOr
 eLFYkN3zg53gmJeGptQ==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b78fb9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TGbq2H1_L8zW2zdi06cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: s6Lp3gsmaHE_Xt32yVMkFimvKB2k8Vpz
X-Proofpoint-GUID: s6Lp3gsmaHE_Xt32yVMkFimvKB2k8Vpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160036
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97837-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 836C4294B2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 10:23 AM, Manivannan Sadhasivam wrote:
> On Wed, Mar 11, 2026 at 06:10:40PM +0530, Krishna Chaitanya Chundru wrote:
>> Some platforms have incorrect T_POWER_ON value programmed in hardware.
>> Generally these will be corrected by bootloaders, but not all targets
>> support bootloaders to program correct values due to that
>> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
>> can result in improper L1.2 exit behavior and if AER happens to be
>> supported and enabled, the error may be *reported* via AER.
>>
>> Parse "t-power-on-us" property from each root port node and program them
>> as part of host initialization using dw_pcie_program_t_power_on() before
>> link training.
>>
>> This property in added to the dtschema here[1].
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Link[1]: https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 67a16af69ddc75fca1b123e70715e692a91a9135..63d5628e988d3c07f42099c0d86e6b80fd54ce32 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>>   struct qcom_pcie_port {
>>   	struct list_head list;
>>   	struct phy *phy;
>> +	u32 l1ss_t_power_on;
>>   	struct list_head perst;
>>   };
>>   
>> @@ -1283,6 +1284,14 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
>>   	return 0;
>>   }
>>   
>> +static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
>> +{
>> +	struct qcom_pcie_port *port;
>> +
>> +	list_for_each_entry(port, &pcie->ports, list)
>> +		dw_pcie_program_t_power_on(pcie->pci, port->l1ss_t_power_on);
>> +}
>> +
>>   static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>   {
>>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> @@ -1317,6 +1326,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>   	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>>   	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>>   
>> +	qcom_pcie_configure_ports(pcie);
>> +
>>   	qcom_pcie_perst_deassert(pcie);
>>   
>>   	if (pcie->cfg->ops->config_sid) {
>> @@ -1759,6 +1770,8 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>>   	if (ret)
>>   		return ret;
>>   
>> +	of_property_read_u32(node, "t-power-on-us", &port->l1ss_t_power_on);
>> +
> Since this is going to be common for all controller drivers, it'd be good to
> move this inside the dwc API.
As this per root port, we can summit changes to merge first so that we 
can move this to
dwc.

- Krishna Chaitanya.
>
> - Mani
>


