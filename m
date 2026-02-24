Return-Path: <linux-arm-msm+bounces-93897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OsZJhQ5nWn3NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:37:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB118218A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C003006B6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B41218AB9;
	Tue, 24 Feb 2026 05:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imc3D8Z7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaWR8nWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D71519AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771911241; cv=none; b=iPSJsw+GMbsvey434jrgRkQLp2IF4nQhY27ZB8x4rGZ8YlW9+p4Op84TfCd79zDlxuGljhbLeZ+ELVLIOYk8j4K344Dwzeau2O0+cn8notZegbq78un8OtKHJQFp+ugMcBWXHd0H5GC1F1KjTUjaJ8w1aTtDAzwW6Ga6p4xE9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771911241; c=relaxed/simple;
	bh=XCeJaBe4ABQ+gvdp7O5e9ItRKiaRd8O4UO09HRN55Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFsFyl2iUnQCK0jrL3mK6QstXnr/TEwj4gzdLJRrneu2O2BZNODaAeFTOamHjH0qzcJrgrJLqfdJfh9mooeUgVfNGaCy884WhkWMVf5TnaPPud3tquV/cKhaoFBHBnZ38z2IsHdAxZnl6l+HN45V6oMKBWrEW6v4cpkirkGratk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imc3D8Z7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaWR8nWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LdBq2317644
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vswKj7+4AbGECyBbxdxx7+8FxcUo0j0q6oQwh1bnl9o=; b=imc3D8Z7GrUH41xF
	54PDZR4t/hLxTSb84ItlmMYIj8bm8m/Ulma9kL3NAKMYCISTerwMU3UQmEVtSTA4
	2DsJwhfan6dGj5bOWYeVPpaXnIK5GjV+mB2xf3NolAjuVLgFuQjj+ymiknDfKrVP
	QKGa7z2+JE5utkyEHp4PC8mwbGMujUt/3VY/iNsKA1W0ZbkE88SGf6bacfbkekG8
	eVt+wSVyGWG6exD42dnmC10vJyfLiLS1plEqSg3Yd9UOCI8HEO/+nx4sI/RBTjY6
	LOit4IlYyuNpzc8USwS0+veFJ6qaGSJi7huYDPKWxDIZos1UPzlm36jeU+vMnJHQ
	YyI7vA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj9v0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:33:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35626b11c51so3905464a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 21:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771911239; x=1772516039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vswKj7+4AbGECyBbxdxx7+8FxcUo0j0q6oQwh1bnl9o=;
        b=MaWR8nWBkbpJ6uvSs8frfHkZjWTxjRs0w1dJ2TdbcDQZTkgd4kqF7kViUkLsjW7tDC
         B95DnGZ8LHelT1K2X9qZ0QZzKw5UgHoBpgEWMfrGPN2f+BSKnWG0A2TsRTutEQmb4aHg
         7gO4qBY01PnDjM6j8aWmvXnqJsiJTcNQwSb8wKqJBk/mUvoUZpLm8R/gqJDTcGtIrD4n
         d5Gevvm03L2VA11quUMfUOpmJ/yFb/HXWWjljZIsLRQbfS01gCuWnBEWJaxHNSfrF78W
         AaCXYIltTW0C6CTut9H34nbnZU96nSBM7Gca47fdmFo8kvToWAUrNPkG9T+vBzaFOMYZ
         aRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771911239; x=1772516039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vswKj7+4AbGECyBbxdxx7+8FxcUo0j0q6oQwh1bnl9o=;
        b=KMSK3T7cYBGDrjiON22/07ZXg3ZDIfD2MjhmQqB0caJlM7EjCSI6eC6+UZrQ3YfOqT
         05qUEPDtrlY5+TdYcBIVGjP33uXlGk94cetPef9Smr9LCaFPOPjTwDqBQL4HT3xqcdvu
         WmujrNIHFGftZD1VR7vVCdYLk6uDrHJDRJuJkrh3WMKlMY2PLJtaNOOx6OnmEn7Vst0n
         M1AW0H73PTIV6G2eRAyIJzkrwgtX9cm3hMZbjb22NXmCY6YHKqik+VRLmQeHrNvTg+Lw
         H2dU6+IZNthmDvUQrQuusM2cxO1R6ZuYTPJ2RPQ0hTFZ516f6Eel17yxFqK5GieNs18/
         Skdg==
X-Forwarded-Encrypted: i=1; AJvYcCUOX4MA5TXpzhhSxW0lGmerP+4RIWZZiFK2qp2SR2C7iujbNWnF688h5KtlchVh58TR17SGt0T+JCZ7jmL/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6CLUM87gx07bpWrsRhHxZUSaJWmewxg8vvZBVPlBL52G4d5R
	Z/oosOCtT/g7ib72FPpvPosiIWGdwQFYmValArGWIp3OK37eAU1lb+g1RvyZ09dJ8rkseUoDoZy
	AyaQUcOMW83AbmfWC+qA5IOcXJFqWlkyVDw7UwnyagZTOzNLZ57eA6PWLjw8nvbcWG7pS
X-Gm-Gg: ATEYQzwxMcmVPqe22mJjfY4PaSKWJBEnbTd092r+PEmxMIRR/CKcZSXui5k5KIbfAyF
	8Me+oeEzUxJq04GPWQyOKGL2teuwBACx4QMgwkhvaFba1img7AgsY8VW/tOsGsavOv83hVl4F1L
	a3uaFGsZ6SGWdxWUp3QQGN/GMtb6dI1tOgDjJOEBdXsbworjnMInG9SLXjYbED57SspphNyoYGK
	8lLoUEPZLGU3TiZsx2sF6ezYsK8uDVDCZSsaJa+cjPsRUb6BjiRK4heFtTgSzd5krMCs6n2eed1
	HcgDxjzACn66Fj+m5LmZFHZr+z/bNQgjSeI63tRLf8W1lHkkVAEMXzBJo3xRZbZhck6Rf6CR/IY
	zKVzD0JhQ8Hws0Qs3wdg80xcgjj/F9W10WYnSlNhOEx1ppOeweU9Xfw==
X-Received: by 2002:a17:90b:3d47:b0:354:a5eb:a642 with SMTP id 98e67ed59e1d1-358ae8209aamr8535546a91.15.1771911238634;
        Mon, 23 Feb 2026 21:33:58 -0800 (PST)
X-Received: by 2002:a17:90b:3d47:b0:354:a5eb:a642 with SMTP id 98e67ed59e1d1-358ae8209aamr8535523a91.15.1771911238100;
        Mon, 23 Feb 2026 21:33:58 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358af701af7sm10494073a91.4.2026.02.23.21.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:33:57 -0800 (PST)
Message-ID: <f9b510e8-b5fb-49f6-a70b-96322002ad4a@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:03:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] PCI: qcom: Program T_POWER_ON
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
References: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
 <20260223-t_power_on_fux-v2-3-20c921262709@oss.qualcomm.com>
 <85631e65-6328-3154-67a9-cc1b5ae8183e@rock-chips.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <85631e65-6328-3154-67a9-cc1b5ae8183e@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d3847 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ym3PPFOpFhoklKWBbF8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 7-hi4_S5Tr3ePd4uBDVmHtFBVY_bOvXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA0NCBTYWx0ZWRfX9kMJGsIsLfdH
 7YFYpjTpK5nXBzHZ6NpdyBJw4zM+Y52dZBNiP+8BJIzA5SXA8nmiJ6nKVw48MxLmvyr2an1iShD
 SZinQVQBFkDitsc2u5uOFSChsLoHhwT4Tof7mxPGZZQGFsFJDWq/aCNqwLL0YY6gxZLNKhz/BHO
 QNh7SCAr6JgLBKJQRc6CJwPeVUmkm0hodO5RurNBGsyNQaP3AZ5s0QpTgxkR0HB0wJkgh8tM341
 MLxTENPqiNOGoO92bsQOs41wjOQez2VMIf/tyZFXbZKsuqQAxC6AS7Cfo3gnvp4OxHh1PoroJLB
 nSyNrgZiU3XQeAC5Vs4XI7ndjlwRUxXrVNDqB8vlzprYNgtVlTAvxSWEsK6NpICv1fBKw4p0nDW
 nnqUzR9rr94JanDcpolGEHR7Ykd7Y4mV7b+6RoQMgZHB9GvuzdNPaViKYaz1a+ViPUGcf0Fb87j
 AwT8gfEU7zKvEGoti+Q==
X-Proofpoint-GUID: 7-hi4_S5Tr3ePd4uBDVmHtFBVY_bOvXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,quicinc.com,kernel.org,google.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBBB118218A
X-Rspamd-Action: no action



On 2/23/2026 7:27 PM, Shawn Lin wrote:
> Hi Krishna,
>
> 在 2026/02/23 星期一 19:13, Krishna Chaitanya Chundru 写道:
>> Some platforms have incorrect T_POWER_ON value programmed in hardware.
>> Generally these will be corrected by bootloaders, but not all targets
>> support bootloaders to program correct values due to that
>> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
>> can result in improper L1.2 exit behavior and can trigger AER's.
>>
>> Parse "t-power-on-us" property from each root port node and program them
>> as part of host initialization using dw_pcie_program_t_power_on() before
>> link training.
>>
>> This property in added to the dtschema here[1].
>>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> Link[1]: 
>> https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c 
>> b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 
>> 67a16af69ddc75fca1b123e70715e692a91a9135..489ed64c1df0fa3ed9f6b0d4c3e0bb65cfc3308e 
>> 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>>   struct qcom_pcie_port {
>>       struct list_head list;
>>       struct phy *phy;
>> +    u32 t_power_on;
>>       struct list_head perst;
>>   };
>>   @@ -1283,6 +1284,16 @@ static int qcom_pcie_phy_power_on(struct 
>> qcom_pcie *pcie)
>>       return 0;
>>   }
>>   +static int qcom_pcie_configure_ports(struct qcom_pcie *pcie)
>> +{
>> +    struct qcom_pcie_port *port;
>> +
>> +    list_for_each_entry(port, &pcie->ports, list)
>> +        dw_pcie_program_t_power_on(pcie->pci, port->t_power_on);
>> +
>> +    return 0;
>> +}
>> +
>>   static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>   {
>>       struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> @@ -1317,6 +1328,8 @@ static int qcom_pcie_host_init(struct 
>> dw_pcie_rp *pp)
>>       dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>>       dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>>   +    qcom_pcie_configure_ports(pcie);
>> +
>>       qcom_pcie_perst_deassert(pcie);
>>         if (pcie->cfg->ops->config_sid) {
>> @@ -1759,6 +1772,8 @@ static int qcom_pcie_parse_port(struct 
>> qcom_pcie *pcie, struct device_node *node
>>       if (ret)
>>           return ret;
>>   +    of_property_read_u32(node, "t-power-on-us", &port->t_power_on);
>
> Your patch 2 adds a common helper in pcie-designware, but why not add
> this parse as well as what the qcom_pcie_configure_ports() does, into to
> the pcie-designware core, etc dw_pcie_host_init()/dw_pcie_ep_init()?
> Because I don't see anything qcom specific here.
>
Currently dwc doesn't support to read multiple root ports, but these 
properties
needs to be read from root ports. For that reason I kept it in qcom driver
until dwc supports multi root ports parsing which is currently in process.

- Krishna Chaitanya.
>
>> +
>>       port->phy = phy;
>>       INIT_LIST_HEAD(&port->list);
>>       list_add_tail(&port->list, &pcie->ports);
>>


