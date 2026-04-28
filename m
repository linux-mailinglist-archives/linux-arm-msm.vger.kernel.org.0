Return-Path: <linux-arm-msm+bounces-104885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCQDBWpc8GlJSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:06:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B547E757
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69EAC3031B32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FAE37B03F;
	Tue, 28 Apr 2026 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4wi3LxL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mu3Bw79B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F53793CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359866; cv=none; b=Ew6JFY+grCvPOKz/XOTy2DM2UJA+6p5TKNyQt32zqxRKF5XbsisffxJQg2XIercxZYarlhm0o37EtiurhjoUbx+5GSl6iumj5HNCxFfaI3R43gAtGUfAfsF0jjMPGaoEzHEu78AngNnsHrnSFU8RwtFjRumdK6qfZdKLdw9KFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359866; c=relaxed/simple;
	bh=8PVc0vfI3vCpQF7fkCpJp1KC/P10AJqeqm+DyCguC+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRJPFFThk9NLS8Nrg6cEkKEWa5XQwke6jwn1m7lwTUUmjRoPpidNRoxg0CqqRTeHm1Ig3SOjT3kZmVB/LQ9ax13Ise7jHGWomGSr6OyxFDX2S+RVdu0H4uhvS38aHri4RJGaPHv+PPRWxSEMzDlLX2UAFt0lz8CE4a8BCTd9Je0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4wi3LxL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mu3Bw79B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S03Q85440983
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8nDXMwCmY/sDn34euJ++LuckS+2KEQeDpNkaBWWS2hQ=; b=a4wi3LxLMkfD5bYw
	YDTfKUEmqWqbWe1CkPMyQczr0EDcpkY0LDOj0BPDkvOrOPfCcpdbDVZCSt0jUxYR
	0YeruyIsks5eel5B1BUgacxDIrK1dBxO5E/zA3zY1weBP1zRcjS6EwvUw4OYiY7w
	RvYkohJIVf0VXDUZyq1a9eSj784eaLR5nc9G1dFzvCFsTa8dDEhWT4LyJ7wOApu3
	xJSJ4xO7QezcIYfLCOzF07X9JepmJFAcTQPvr8RqRE7JeGs/4NacztxwECGlS21m
	+lRjwIbzWlLr3DlPZF4ZlE3TTZ0Y36g5DmHRQvV+BvkLfGHmGsWVO0yTLQaoJM0s
	Yermvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac434a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:04:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9278587bso13262487a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777359864; x=1777964664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nDXMwCmY/sDn34euJ++LuckS+2KEQeDpNkaBWWS2hQ=;
        b=Mu3Bw79BEGvUgTh0GGl/SsVjO3PUKZmxVvds2ZysWSXkdYkQKWcQFxkcc+9HHfLn3Q
         dVPMQN8Qk3KhCeuZTMty6hDRdtXBmKnf/zdcJKL0yy09F+fziesP7UuyHBlU/JpsS/KO
         EHck3a11qpL5fQDgRJuEZsAdVJAzcv8iLhjZ84/a+HQWMHERVK90MNDiO/bNBHmQ7PTi
         9FmTl3w277+mTiG1/ZTQF4bCSuiYr8EQvQE+fmN//2rYPuRxsLqPjtZlcki+sO6g3II5
         4/yzrzNSwmlz6vlCaE12mDxfkWnliJKV3x4MV+6nZ+cmHtDZJkbVybtV0VpEtfItq70y
         6olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359864; x=1777964664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nDXMwCmY/sDn34euJ++LuckS+2KEQeDpNkaBWWS2hQ=;
        b=TFZk4spa7u4ytQm6iqYlKYi1OxjDYJQB8l3TWMSbwl8Li+MwyQxuu0vETfT6lN/iue
         nwlgYJKQfzLlNUgNarT7L4WHqd1QjDy7C4L40J7tSHY4zuNfmwNd1J/At/en3xf/RGFv
         t5pDoj7Z26gTJTMcseBsrVxU4wUX/vphIaA/6vxVgOnq8e5H+5snoWbyQ5aaBtvBhxJh
         NcV8R676FPiAjbTIJy0IPGJHkZTaL8C1ur3vO5iqPs6emAr++jgUhajrUCrax/7aUqzt
         ZTxVKjXxlDqtWIMaOBrLjWwyMwem7xTaJmQCIa8sxt6cn3SYKE3uXkkIFa/BTFfBQ7Wc
         6a5g==
X-Forwarded-Encrypted: i=1; AFNElJ9HdfbkXpE1lsoBVMgDUX7BNMplafk8V3qZWJ8XnNhgye9QYKby+h23X5CivfNcfPsYey/LrURXgYKB8Vbd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6fdDL1RXLk0X673+XW5jZ1UJk+bGs6ylZxq3hIZnJSSD0HzzK
	Mj5ggzCjnZ2y32t2KbFkP9Kn4+Sf+1GW+AlxVcdOJ2mIhgEVffCQvG5srb3quUjdMaChUVYHhcr
	hM2V+8T6DV97HnKrETleQp1qtTA6SFT8KJAP74JCLz+8c/OBDZ7JPNTE0/XTfTFxlsYq5OAqeAO
	eB
X-Gm-Gg: AeBDievYWnZwk9Kt2pys2xrWck5A4oNb+jmjwYn5Znhiaxoeam/j3/TiZYXSnmtb14e
	+kVFrax+AMv7HORIOTVte4A41l/MzGrT8Z7DQ+XwRbgb6ilZUImGrGyW2An+GS/F0B7WL+K9GRu
	pFvOHQ7hwpvqpWVp8beUpjDg4kpkdFmQ7g4MLMQNrl55wII7AtIwPs3Dw6P2F/xrkQnf2MAAxeQ
	aW/dYXIAqU1uZvAuos1QNcqrXQesXYIBeNwxVqhT/M7oWgIKyT7mIkrs+pxFsxoLHZyJLA2CvqI
	r7R+6CEtWYmT+GFXeKh9yGvSHwj6wcAFnBvDzQJxuoBjsUU5OnAPP6Uviabc/iKJOKZUzyxcCR3
	SC7IPmgA3LCy3xDSxCjfBikzco2f8Vz3HKSCkypYFXONsO3tUhSdxFGLM6O3o2GR20Q==
X-Received: by 2002:a17:90b:1dd1:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-36491f8a604mr2022975a91.6.1777359864082;
        Tue, 28 Apr 2026 00:04:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd1:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-36491f8a604mr2022941a91.6.1777359863611;
        Tue, 28 Apr 2026 00:04:23 -0700 (PDT)
Received: from [10.92.193.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490fd57dasm1670321a91.17.2026.04.28.00.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 00:04:23 -0700 (PDT)
Message-ID: <5233eb62-7b6c-45c6-b24c-af4db5248352@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 12:34:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] PCI: qcom: Program T_POWER_ON
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
References: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
 <20260404-t_power_on_fux-v4-3-2891391177f4@oss.qualcomm.com>
 <hd3zmtaaetewdlki77jtqqfz2dzv2mad2dcqmssvqbagm3p62h@qihlc6xw4vqn>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <hd3zmtaaetewdlki77jtqqfz2dzv2mad2dcqmssvqbagm3p62h@qihlc6xw4vqn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -GI3Jd-cfKsRjfVQ8QxL3I0hgTZVjJNN
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f05bf9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TGbq2H1_L8zW2zdi06cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -GI3Jd-cfKsRjfVQ8QxL3I0hgTZVjJNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA2MyBTYWx0ZWRfX7NAPJh7CCikU
 gaNYv/5pSHXYHvudclNN2WS+4294hy+6QzdWby7/oTvmgskiJWUxUg+zt9sK9kjmFUrzTYgbqFH
 QH5OTTsdWmvsYWvpvsuH1kdwnfil/zk0EwD14AKlnjTKQzkfxG7oZjop31Kxs7+W/2CdpIVY1NC
 sUfJkdank4MqJJHyaV22EkX2yz3wIXTWHRsre5kXl2mkWblqE3zhflpnYxvDYro0KpPPDSpOks1
 Lu2m7IUdZTmV8THmi2sX6VqgTx9waaCevl1pSHOQ8SWIWqCnaGMAnlhL7l5S8DwS25Vf9hp9RDr
 tDtRESFBMf1pDje8iRHHJEcXvVQnfFJT5/EEunAumEwUdzj9YfDsKasL8nMrWWbWs/AviV3IpnV
 MEHMbbC3ZUqBwIK+aBR+eY5nyo+gs8/4XfbYhohKHhkDlTZ2mJmPtjpLgSaVNHT1zQGkiVLe+8D
 jYjc25TXe9QKLKcNlPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280063
X-Rspamd-Queue-Id: C86B547E757
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104885-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/10/2026 10:25 PM, Manivannan Sadhasivam wrote:
> On Sat, Apr 04, 2026 at 01:47:20PM +0530, Krishna Chaitanya Chundru wrote:
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
>>  drivers/pci/controller/dwc/pcie-qcom.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 67a16af69ddc75fca1b123e70715e692a91a9135..a8f82f860c08fe2eabad2c0eed541b8dd121215e 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>>  struct qcom_pcie_port {
>>  	struct list_head list;
>>  	struct phy *phy;
>> +	u32 l1ss_t_power_on;
>>  	struct list_head perst;
>>  };
>>  
>> @@ -1283,6 +1284,14 @@ static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
>>  	return 0;
>>  }
>>  
>> +static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
>> +{
>> +	struct qcom_pcie_port *port;
>> +
>> +	list_for_each_entry(port, &pcie->ports, list)
>> +		dw_pcie_program_t_power_on(pcie->pci, port->l1ss_t_power_on);
> Since this writes to the same register, there is no point in iterating over all
> ports. Add a TODO here also and write it only once.
we will iterate only once in case of single root port. so we are good here.

- Krishna Chaitanya.
>> +}
>> +
>>  static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>  {
>>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> @@ -1317,6 +1326,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>  	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>>  	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>>  
>> +	qcom_pcie_configure_ports(pcie);
>> +
>>  	qcom_pcie_perst_deassert(pcie);
>>  
>>  	if (pcie->cfg->ops->config_sid) {
>> @@ -1759,6 +1770,9 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>>  	if (ret)
>>  		return ret;
>>  
>> +	/* TODO: Need to move to dwc once multi root port support is added.  */
> s/dwc/DWC core
>
> s/root port/Root Port
>
> - Mani
>


