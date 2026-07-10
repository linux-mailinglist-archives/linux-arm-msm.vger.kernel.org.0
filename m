Return-Path: <linux-arm-msm+bounces-118324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pk/vNUcMUWp6+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:14:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8B73C211
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:14:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mic7hgd7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IXpsmtP1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118324-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118324-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2EF93001FD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066F62FD1DA;
	Fri, 10 Jul 2026 15:14:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98682223DE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:14:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696453; cv=none; b=lTrazeDUcXIjSztI6dHxyBn9PDJU/EAEeVl9Dh73uIRdP2r+uDRUZsyZ5A2ZVSQ3qEAVCEHaiGtDPg1HyldBGTrZPreJcc0t45mvFj41HAksDwGa3Wf2pHsbnO/3J6e5L4pKzbNZ66e/NWqY8lfkEBV1/oCBmNlDPimDJUybWvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696453; c=relaxed/simple;
	bh=S+o07CGsB2yXVWZKEPHm972ZzUJuCHHo/Rajn4YiYaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTE9zYjvQaok+oOFLTQftLeWWa9Gf/q8dzQXdngSFsjAabsEuw1j0ILN7KvCjGqa/Oo9ZnoRlxuKou2XGZzKM6wFy03+6w/CK1D18YCfNonlVcKJ/SsNAd4OWIrzWUrsXPwfWNOYsTmEONahQ3x27No5uYHY7Ig/ZnGklg7xGnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mic7hgd7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXpsmtP1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcpSA1128369
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8xr+988QWqirlSbwRDuuvdc9FU1IuRlxyIRd32MgSo=; b=mic7hgd7riKWXIAc
	wMuL6FGfh3OXLD6c/GqL7XqyF1RwctfV8f+m0AipsFiqQT4+VhqpwcCinuswIkrW
	LSDd9WPEwPqRH7jB1eoxGRCMktB7ChUKQw2g2rV+OE5j+R3JBM3XnD7mK4+A3fZg
	8g0iTK7x6jIyhd3CfV1/ad+nZ8f6ShFC0aROp7oTBvQk62TnSPSsAScVvPzocsJX
	P64FEqhxPdBNP6pEdVmQeSUfQrGXEJ1FwzcibVm4MqsOUQfZiQjob4P/58fzhJsQ
	637dZyBgcoC2tIJI6KgvSDw/LbK9e/td6T9628/epwN3HhnOfMcQrUlhmgU4m2nw
	rxPBYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e118s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:14:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so5260641cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783696451; x=1784301251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8xr+988QWqirlSbwRDuuvdc9FU1IuRlxyIRd32MgSo=;
        b=IXpsmtP16AFnDPs+kGGnaR8xRwSkeZUiRjc1L/04+5shdyWt1pxZZFg0/ZytS3Sikg
         GRJjcB3OBzQqNuresVcNeBlmpnDoEP0HbEgo6q611mClAOJOeDDecyVnF8iszUwcuJHi
         FG/nDRPWPH7QN1PXvdq1K1Kvvzx3CsJb4teAzwOExEOi2iVamSsFLsr+7VwKmNcAkgqd
         PNB9f2oam+OjfGAbWrPO0+zf0K1ksQx7+7HaW8R7VIhNDOibOdJXsR87fiqDvjD/ePwc
         0Z7mcpNLe3v/it/MyAdlVdOgVys6d4oODoi1bpTFwuieH8EBGvtreU8q8QQjX3h8n+Jx
         iINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783696451; x=1784301251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8xr+988QWqirlSbwRDuuvdc9FU1IuRlxyIRd32MgSo=;
        b=ZFafM/o7WsBHm1jl4YrLwU7LS5oGu9vT9MQlTPfuvZaTeZvCXSV+5JD2FlTeBj9IwG
         ztLGrNNJByHXXXYrKhTcbrawxysMjMMOmseTvsGKhSKMQqr0GXzbqY1BUdPrGdSj6ako
         CG+p6tTrFa6kCv0nEW9FNVFNEZUY+F7//6ICx3ru5/CZ2k8745/praejgbcXBNReH+SS
         eRqNZ+evP+9iYyvn7/2ZhF97rypgt72V02kJFoF4dNqQDFYSvjEuWUWWheKmz6QTC2/P
         xQY43zsLyI80STo2hOyUTe4MPACzEMVmfeInhwLSMTRwUcJ//tCsSZmfgFwaTQNrgMKW
         SBzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWXupdOVAkXmqXWxCzqRgf1AGEHFCVGvqKLKZJBFSs4P2x8q+rM23IlcFAw676+bsfs+wt4Ag4B8wrpWnP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyh6TWrHj3x/rB/8Lu9LteCx0Z6VUW83sr3S+KXtEvvI3xCqB1
	AVi9K/eX0IKYQVUihJqF84/BQZCUP37MwhOaf4Wd0cUy2+UrppUu38olGM85a0SHrwEQdsMx5o+
	DwIbJ1CIXac/azikYIA0eWIZocjxpra226x9oEtx7ARb/nLRl5E+I2lOEYWc4FVr7cLM9
X-Gm-Gg: AfdE7cneA5wuXKOQvsP0cVmm8nhFJop7PjWrG0FvWa0ikqsntUTot9K+dgskTjEXyMY
	SWVwnx+zl+78B33opRPxxFhAV/SbFFnnnGQBUF1lNNxG4sZY9zISbiwyeBLet7Zn5pfhB3DIvOg
	PhZSxZXxd3xk0yk9we8mzc0sv755Q7xNNMolokGPrcv7fbZHuO2jbfcecFZThnkcloVuT5avMbI
	LzGCQJP/htaWooRHsZfkKL7hzPgy3hSPWteKf63F4wWtLIGZHMAp+oWLveVnhwb5J/deH7OcgpU
	vSeZj+6o7XsP0uT1tqtPo6Mz6dOd1hFVIaJdtHjLwBfpTuOxjbQcqZ3ddm1AJOLfYdco8hcbERu
	yJbZEXniYfTrgW7wTQv/RgtkwyFRpefG33EY=
X-Received: by 2002:a05:622a:101:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c8b512840mr100771121cf.8.1783696450995;
        Fri, 10 Jul 2026 08:14:10 -0700 (PDT)
X-Received: by 2002:a05:622a:101:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c8b512840mr100770831cf.8.1783696450567;
        Fri, 10 Jul 2026 08:14:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d78a08sm12347815a12.18.2026.07.10.08.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:14:09 -0700 (PDT)
Message-ID: <865cd059-49ed-4922-806c-4c59eb37f5db@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Clear Attention Button Present in Slot
 Capabilities
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710-clear_abp_0710-v1-1-efd63ebdaa09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-clear_abp_0710-v1-1-efd63ebdaa09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1MiBTYWx0ZWRfX6sydbOtd3uSY
 Df/6EBvlMASqs9e4+UjLX/mniCfmSdZ9p24/lhcrhoyWPXfjHMKDwBe4ULaqoKVFfsZXYe8BK1L
 fDgLitSxURmxHGLmeuPB2ogBL3TsZcg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1MiBTYWx0ZWRfX/efFsjYikjZH
 PV9WAp0K7rzYN0gJeHE8+EjUIyxj+Yxe+RejOz2VYdqSmqjLqcN42kmsc9+7IiM3/2tanVGVFYj
 gxjRAG+WuQm/L4qaB73z3t3/p9r4UYd3nsFIjASayzq8NdtGwQMWhzK380v3LJ6AkU4hNLDSA0E
 zhYaX9sPEvLhKipzbTxw2yd2EDqMcmMzIlt1T8Ovznkxpt7TU2BGBKLmp3AGahmZKdJCCx4eKct
 2aSfD3JwZYxs1DOZXN0gd/mqB6rrVXrHNB2yfQdLmOEyTvJIHzyvPXTbnUvNN+OBMtEMV00OCjd
 RTHJVcodznaHwiai+dbICcFaRX20egMTD06JM2K94Kzwws9DHEWKK8vJquRlPOz0/Q02XaDKHOx
 /4jS+dTdXCs2zm+rmP+mMUtzVIxFRReigoRueXFjeMyVNbq9gzNZfojfiBRIkItv9VVbOvpPT7A
 M1R9pbnCFxbFKQm5gcw==
X-Proofpoint-GUID: F_x4CpfpUjgNAVejVnOsS1Ak3uapKbj6
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a510c43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Exl5BUTtluaCrdyZuN8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: F_x4CpfpUjgNAVejVnOsS1Ak3uapKbj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118324-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64C8B73C211

On 7/10/26 3:20 PM, Qiang Yu wrote:
> Qcom PCIe Root Ports advertise the Attention Button Present (ABP) bit in
> the Slot Capabilities register, but the slots have no attention button.
> 
> When ABP is set, pcie_enable_notification() in the pciehp driver enables
> the Attention Button Pressed interrupt (ABPE) and leaves the Presence
> Detect Changed interrupt (PDCE) disabled. As a result, presence detect
> changes are never reported and surprise hot-plug detection that relies on
> Presence Detect Changed events does not work.
> 
> While at it, rename qcom_pcie_set_slot_nccs() to qcom_pcie_set_slot_cap()
> since it now programs more than just the NCCS field.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X1E80100 CRD

Konrad

