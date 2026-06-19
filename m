Return-Path: <linux-arm-msm+bounces-113816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id frlUM+3MNGpNhQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 07:00:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABF6A3E42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 07:00:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XdZVve4x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YpCpDXrb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113816-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113816-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B64893012CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 05:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BB932B981;
	Fri, 19 Jun 2026 05:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9527D281525
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781845222; cv=none; b=TU0FPAf5bTpR/sPJsZTDVrPtb48NStVGrg7BdhztoYPE5pAWrD7qlguGoGvq/ydtNqflMk29JUAu5ZfdgE7w74605JiHcoqIfy919iTjWH4fbgBFE2GlN8QT4NGkuBwML4Tt1U++eBMlRJt8PpJbKpnnF++U9KLGLhBV9JaukO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781845222; c=relaxed/simple;
	bh=JrEE1G0VUJr48rydrwc5cx26KVF485AtW5fQEIMh6yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvrhcp6o0XSWsvyGr5gta5bZCF1eFWcTHpIXclee8+LQ/OeJxRZ+um+sou49S6bg+x9+1q3xNSEBn9MDj9MZQYPPR3U3/A7eiGy+fM+kIhoIw9kzxmox3x8tfMo20waRcHYqPKqwO7gc8qeEhyIMsGtsw/pclniXPBSy9M7Aql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdZVve4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpCpDXrb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2uoUv3427588
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbWfbP8zOvWzwTkX5u+oI/cT928jr6o9nUUfDkalaCU=; b=XdZVve4x0Txwr9ho
	eo6eABVK0Rvu13cNOZsk5Urgv6GoKsROYpTby+bJsaRhQduM/WJw0+1h1z2FlzQA
	SFy6aDEIxSSDsH7bZOOUCdsAuCS/H4C+U0MvNcAlbZ32eUZYGGkaO5fp/vTHTuJf
	gGgKUSMI1NLcmuyEM4nZHNUU+zui3me0ZIqCCbolZYkTAp0AW/uRtWsOi7yWZj1g
	NwYXXpvanQbTaC58xxnB4d9nP9VRrLoR6QrCWCUvWq09UGAGnQ0r75G5qmZealgn
	CbFswDbFQHzpH/m11jNhFfG0euxCvBmsd0UMNJQoCsL+mLLU1TwQsffkHkqSWKiK
	h8LNFg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyusp3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:00:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891055e060so1231275a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781845219; x=1782450019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pbWfbP8zOvWzwTkX5u+oI/cT928jr6o9nUUfDkalaCU=;
        b=YpCpDXrbTH2t5rYfn+x4nfe8/s6hB+JIRQu80f+jllZ0S87upnCNHJBVyMdRmTUXPP
         gNnPlpxCFvkgkRi6VRtP1Q3EgvqEJ70b0WXlKsTYzfhsDHBkZmneDPzCwcrOAUHH0E6L
         5La9YregxYYLeCZcMJx0aYzghjw5KI+jTWqJTdldBKH+pfG9bLG5E05zvmIjVtnTZ6St
         ptASZ+X451C/mHhDwibfnqMGd5oLi8vQD65y6oJOsBXlpz1mY4Pqarfzpjr7QgUdAxLq
         bJUS/y7tXjwnd6SPJNqoI1G8jwiQcJ3P1r2LXEV+b9b2UnCN7nVzvuLz9B9PtcKbyML/
         HMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781845219; x=1782450019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbWfbP8zOvWzwTkX5u+oI/cT928jr6o9nUUfDkalaCU=;
        b=E691g+DgSXzvWcKBIB33JsnyNBwg8vmx4Nr6kpeanDJH8s7crtmv2GBS8nGKs1fFrT
         xPFerzMCDr7Jv0BkB/H8FJHUNHWoZWkKgEIqKSljvQzbcoooFmH7eYa7qLdlml2hf2XB
         X2SZ29DVL8gxd0wzWAHI1nydzs6Avoykv83ADLlnYNzfZ23NzH4K+jo0DzwIfBbtRy+r
         +CRlWNFhvWICYoI3DKgpmYn6+TbAQ1kvOjyKykgwT5CzTgz13lKfZ1NNk0ePmWS1eZib
         nztREvb8WNpfoLYZN+RD1JJlZX0oZm80vhYAoABA+YCl2S16YZssqcduWNvKe4EdkCey
         Qv4Q==
X-Gm-Message-State: AOJu0YydwKtMBKfwvDdOO5GVRC8wvTru4kxOFNhwAiNDHYSwe0huJpKZ
	cSucYSfPOQ2V1HgoVpufcC/VKx1RZ2W7ysVjZQgOV0l7YT9wzHtopbpwt7zfqjhx44pCglGBq5g
	CEcmvMxHzl1MPFdSmboE7q/Y79wpg68TTztDCS1N+jop2t274VenuZo58AWRaWmRtHVhw
X-Gm-Gg: AfdE7clUWCDgM+eDlO9/4gJEtERgvM3RZ75/mKnFiqM5V4Eprrtg6f2i2wKN/+QYX+C
	dJ99edSutpUielGy8UuGEp1lSbSjcq+mP2PsBvITXc9ayq3qUlmyF4r+SwVeub29U7gDjAeNiuv
	M5U8LzomnsL0L5h8rnbn84BIBEYzHSIJR+2rK9QsNDhgzgskhRlNVKl8etSLDDAmqaQZbG7Mhlr
	zo0N1MRxW8/5xrNocniSP74HEmGKad3uzN7PF4zjHOLBlvkC4UROBESRzhMifAW+GnX9RRG+5w4
	iAebfU6dvleTV572jH1p1p4uYhfZ/LobOY1hScLSpPmwOrNcVD2AbcWr5SIulPegzOt915m3uIR
	Uca1sYzsVm7W0yUj6JJYneRPxUdPuaGy210vT9KXOeFE4
X-Received: by 2002:a05:6a00:b42:b0:845:313c:d6c2 with SMTP id d2e1a72fcca58-8455089ecc1mr2002778b3a.31.1781845218761;
        Thu, 18 Jun 2026 22:00:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:b42:b0:845:313c:d6c2 with SMTP id d2e1a72fcca58-8455089ecc1mr2002673b3a.31.1781845218036;
        Thu, 18 Jun 2026 22:00:18 -0700 (PDT)
Received: from [10.92.198.124] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845537ff8fasm872324b3a.31.2026.06.18.22.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 22:00:17 -0700 (PDT)
Message-ID: <6fc15f93-9ad1-4009-954b-37a96c021536@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 10:30:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] PCI: qcom: Add link retention support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com>
 <20260521-link_retain-v2-3-08ed448b081c@oss.qualcomm.com>
 <8bb365dc-25b4-4fe3-8ad9-1f110bad2417@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <8bb365dc-25b4-4fe3-8ad9-1f110bad2417@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA0MiBTYWx0ZWRfX8wooofcc2O3t
 bACw58t1kHM//kzPs8UUdpDssHbq1BsvKSnZiUhyIU+A34WL2krVNEcdsvwJBh6j0tsSRmpr6YW
 TmAH9t+cD/TDBonm8Bm+gNz+Typ/izY=
X-Proofpoint-GUID: r5yGCvg7T3sBnjpqfBMvhvc-64a2Vp2f
X-Proofpoint-ORIG-GUID: r5yGCvg7T3sBnjpqfBMvhvc-64a2Vp2f
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a34cce4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Zlw8WEmqWycuYniGgb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA0MiBTYWx0ZWRfX3gVUbwGF7bb7
 qqbOzwJwbDWZJ5TeyqaS9WrlBCPj6ZbyzWcNPR6T6QWvw3tgSuQ4SqrQvUI67Y4uv5K9eCogZmc
 DaoVP5gPi8R1mxM0dwUuUli/KAxVOeiNGHfo8QJ0m2aicxaOn9tX71QlzOq7eHv2fM3G8OuKjqq
 5LF95uBouaCX0RFTfL8a015I0teWIVLIFMTg10HlnW05ZwlkefexYkRzhnQFSoc864xlCBaFinD
 gaD4B8hD8apWQf8WgBUE7Prm5uUf85u0R1ZzDTV2/BpxND5ab6opDXAx32lUPbJpiEfj1CFeDDI
 EuMszPA0tTOeiAV9FRgUmzvOn5AqGitsnlOz1u209cYYV+W8kc+uPfyieku7msDaE1NMpi+FSNw
 e1mrE7Tso5D4/oBSu1ztvkGfszshBTNPhc9vijIw5GlI6YinBP70eus6y34nXyRNFgwLYKNKMd/
 4xtsMi4OgioHnky2jnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113816-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88ABF6A3E42



On 6/16/2026 5:38 PM, Konrad Dybcio wrote:
> On 5/21/26 2:56 PM, Krishna Chaitanya Chundru wrote:
>> Some platforms keep the PCIe link active across bootloader and kernel
>> handoff. Reinitializing the controller and toggling PERST# in such cases is
>> unnecessary when the driver does not need to retrain the link.
>>
>> Introduce link_retain in both qcom_pcie_cfg and qcom_pcie to indicate when
>> link retention is supported. During initialization, check the LTSSM state;
>> if the link is already in L0 or L1 idle and LTSSM is enabled, set
>> link_retain and skip controller reset, PERST# toggling, and other post-
>> init steps.
>>
>> If the current link speed or lane width does not satisfy the constraints
>> specified by max-link-speed or num-lanes in the device tree, fall back to
>> normal initialization and retrain the link instead of retaining it.
>>
>> Configure the DBI and ATU base addresses in the retention path, since the
>> bootloader may use different base addresses than those provided by the
>> device tree.
>>
>> Also fix the -EPROBE_DEFER error handling path to return 0 instead of
>> propagating the error, avoiding unnecessary cleanup when probe deferral is
>> requested.
>>
>> Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>>  drivers/pci/controller/dwc/pcie-qcom.c       | 62 +++++++++++++++++++++++++---
>>  2 files changed, 58 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index 3e69ef60165b..be6c4abf31e8 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>> @@ -450,6 +450,7 @@ struct dw_pcie_rp {
>>  	bool			ecam_enabled;
>>  	bool			native_ecam;
>>  	bool                    skip_l23_ready;
>> +	bool			link_retain;
>>  };
>>  
>>  struct dw_pcie_ep_ops {
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index bfe873cbf44f..b061eaa227b3 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -253,12 +253,14 @@ struct qcom_pcie_ops {
>>    * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
>>    * snooping
>>    * @firmware_managed: Set if the Root Complex is firmware managed
>> +  * @link_retain: Set if controller supports retaining link from bootloader
>>    */
>>  struct qcom_pcie_cfg {
>>  	const struct qcom_pcie_ops *ops;
>>  	bool override_no_snoop;
>>  	bool firmware_managed;
>>  	bool no_l0s;
>> +	bool link_retain;
>>  };
>>  
>>  struct qcom_pcie_perst {
>> @@ -960,6 +962,42 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * Determine whether the link established by the bootloader can be reused.
>> + *
>> + * Reuse the existing link only if its current speed and lane count match
>> + * the max-link-speed and num-lanes specified in Device Tree; otherwise,
>> + * retrain the link.
>> + */
>> +static bool qcom_pcie_check_link_retain(struct qcom_pcie *pcie)
>> +{
>> +	u32 cap, speed, val, ltssm, width;
>> +	struct dw_pcie *pci = pcie->pci;
>> +	u8 offset;
>> +
>> +	val = readl(pcie->parf + PARF_LTSSM);
>> +	ltssm = val & 0x1f;
>> +	if ((val & LTSSM_EN) &&
>> +	    (ltssm == DW_PCIE_LTSSM_L0 || ltssm == DW_PCIE_LTSSM_L1_IDLE)) {
>> +		qcom_pcie_configure_dbi_atu_base(pcie);
>> +
>> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +		cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>> +		speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
>> +		width = dw_pcie_link_get_max_link_width(pci);
>> +
>> +		if (pci->max_link_speed > 0 && speed > pci->max_link_speed)
> I think I raised this concern already, but this goes against what
> max-link-speed is supposed to do, i.e. this will not retrain the link if
> the bootloader had initialized the link to a speed faster than what the
> DT requested
sorry for the miss, it should be speed < pci->max_link_speed same for width
check also it should be width < pci->num_lanes I will correct it next version.
- Krishna Chaitanya.
>> +			return false;
>> +
>> +		if (pci->num_lanes > 0 && width > pci->num_lanes)
>> +			return false;
> Similarly, this should be ==
>
> Konrad


