Return-Path: <linux-arm-msm+bounces-117865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uNiEA49DT2p8dAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:45:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C4B72D500
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:45:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=guFIbZ9o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SLh6ffx5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117865-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117865-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03ABA30BD8ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06173C8C74;
	Thu,  9 Jul 2026 06:39:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295093D668C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:39:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783579173; cv=none; b=srmsx1K7AyxzJffJp91jHp9zl+d/yE+ohHGQWOCv1q76kslPlGHS1KcIQm0ZHx14m/m00GDyjv+S4jJLz2BbKdeOZ4iKFv+fFJ4pTlqVFC3DeC8P9jQ7H1F+wtsXvfQ9UbDwvZeoPFmOMaunHOs9ReZwVx926aUJvx3ujIzJ7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783579173; c=relaxed/simple;
	bh=zMcrxCtoqCN6v7GMmrzMgRaRS/Yg5RMN1qKr6ncoVvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arEB2UZJdI4Ov5Q7D94HNly2V5qO58nWLYXiGgPXP8ZMQXF5tB+QVoptGmPUPR1glWwuPvKf+0dFIie5OiEZcAlIXSGH8Mml/zfbO26b5XtsVTl063UfGFxwOZ+YrNPibxuWZFHy+iMP2jkAF0+hr8nn9SKJLKXKFrQRBWOFDaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guFIbZ9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLh6ffx5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HCq972672
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Y5D1mUbwvJ4UlYktwnKee3CyKSTLraYPvFKzyS9cMs=; b=guFIbZ9o6HKLykFn
	C3BfPQCE3uQCJihYV+6Ym6Xmw6QGwCvbgpfVtW1Dof9pbvY5ytM0241vOCFjxGXF
	K/CpOZyk84+EYR65DzhRfv7KVedoOxcZhm83jcfkycewZtD3Vlvf2YND/2MgsJV1
	h+Exq6N1NtS6U/izPibt1g5rW1RAKGxOty15PRvf/tDe2Hgy/BLlx3GWjSNHCL1s
	YbfhmWp4kyaYrRgqHRzIk584wmxSBHsV9U9l6BEwajIyF031EdJhz/7eFombztYC
	1L0Ync/2XtxO8RWSeUPmKhHTxDW3Rh8/Zz0Qo7OKFd/aCcFMJTzfm2Y3p+EzKY2H
	HSh9CQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vt7bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:39:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so33868885ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783579170; x=1784183970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Y5D1mUbwvJ4UlYktwnKee3CyKSTLraYPvFKzyS9cMs=;
        b=SLh6ffx5tiMpw4mrRQqOz8iWdzqWgHbycgnscVPeHv4oSWVR/TGKdrUaaejDLh3TfO
         J2EJz4+PNO9hhU02hg6AhzxfDbksXupsCle2/nZfnOTou1KitvD4sPV3OXRnHO+k6tZ+
         DykBpiZPCzPA0bmzK6KbAXY3AzIlEM05z9hgo8X61dARjxn4dB8EXOBVWxpVzWQ+D82W
         pXRtOZjdB1CA5LBAAqPWzDncko8S2fXSTLzMslX35n/Ghv2uGwkF/aLCNOo8LE+y3XMY
         xumcjluqcfwUbq74TmjSQ3pYVTbwa8kvgqTBA9P/+YHM5RG8rAt6kdfV3rJ5Jl4q/Syt
         Z4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783579170; x=1784183970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Y5D1mUbwvJ4UlYktwnKee3CyKSTLraYPvFKzyS9cMs=;
        b=tN6SOdidrLx9mEnJ87fyryb0RfiHXAEFmLjG2zNWmdn647+rjFq1xMhdOAR4Aw04oc
         AYIUZlwWM2AOeIdx3WE63GEzG4HpikzqPlaBUd5/TsDounfgdrA5xrMoz6oMrDyWw8zp
         tcMPkwtWeQU4mOZCeF0qY5kw31UjYIpqVALQlrivFprvM0YIX9etk7JtcDTVCN2/wrWN
         201yi6EITdjw9l1XGaW0SQW/IoiGxagaEzwbqyxbV+7WD8nFqjO9ggBqSmQea4/vKnqQ
         H36bQR9Bv2CUIsU3XW99XWoa95LosUc6lTGLi5eWKsUPbcKyWNqPH6CCQ+5/uHAxfLRE
         D0ow==
X-Gm-Message-State: AOJu0YycdkFhFBgDL6eIspU9/5PjitN7jXf1gfTf6Tog/4RDC4fuMjPh
	fh34M6fKc1NvkaXYnwPUGwmEtYHVjH43B+lpi6Baiyvsw5db9VNdNdBbl+Dlv+5HQtmzvEVhShx
	VpJduhMiNaZIrti2uGcIXjGU+jXozzdDH0ltha1AioJ5yY8fbLm5SKwqVPZAG3PHj9UIv
X-Gm-Gg: AfdE7cmhIF+P2a9uD8FvSl9zX7fhqADfcwGbMknImZFYW1OIBQoREgotSp63b7NIFwn
	UbMDJTfH+1GlTa3I/faoZR8GaaBrC9d18r8YmVswORYrnu/oJ0gmtHQrd3k5/GhLLjUQQKnFoNI
	rC6wNee7u1Ud2QzYAjUyZfH9MDMRyfxgMQTVfVIgEjOL/TMliBY22T+oasMZTkaXhvwKaf+2FAF
	rDhG7IzwyK01NDsJxaBiszAMQepRRiUXh+QAuzMkgvDgtUyv/E79FGLvVb2jlPVgXepXgeInNDL
	Oc9hvVacwMusikOiyXERBV3CqtWyuPK7vEFulzFW/J750PIotuQJSRFtRiQ+2pClsyu4RJzOxkv
	1q+EDp3yoG4itgZzYl+SWg0YGNf/pPyMWbGqeWKzYzvA=
X-Received: by 2002:a17:902:fdab:b0:2ca:d666:df72 with SMTP id d9443c01a7336-2ccea39be30mr62231295ad.21.1783579170035;
        Wed, 08 Jul 2026 23:39:30 -0700 (PDT)
X-Received: by 2002:a17:902:fdab:b0:2ca:d666:df72 with SMTP id d9443c01a7336-2ccea39be30mr62230895ad.21.1783579169587;
        Wed, 08 Jul 2026 23:39:29 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm38167755ad.77.2026.07.08.23.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 23:39:29 -0700 (PDT)
Message-ID: <851ffc42-657d-4b26-a47a-7cc713bbe64c@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:09:23 +0530
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
X-Proofpoint-GUID: bQw3sefYCcoKRkmrlEU78hdgWV7in-KQ
X-Proofpoint-ORIG-GUID: bQw3sefYCcoKRkmrlEU78hdgWV7in-KQ
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f4222 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Zlw8WEmqWycuYniGgb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2MSBTYWx0ZWRfX2RCE4vMjftu4
 NU0wb2NxTTZQaJq0Gec8oiyQRYfAZ1/cB9k5nPksV+YOYln3DuzZgXF6oBilie31GC9sBq5Ofvz
 utJkpmWm7GfZOPrXPrg9g3rK+ggAeEIphLB5vkR7p30wXCRaTsn5UkycFouKzVHRVkPtn3YerjU
 iDEmWqeCi3fIoAIkQCj18+2R7y4T0syZTxP/BDza+gNGAsB94THL1KY0IDa2hv0IjvuvSfV5vU9
 AflqGQX3bU7CDQiK2nCucB1T5YVre2RGrZrj4BPQlBzA2RZumbh/bgO0QLsgmgFl3hpNEnKS4D1
 g/5+mxMF9gK4WVmRZH7W+OEw7i2UcF7Pn8FezRqfEdek1+iCwOiIxQbk1cezA+BMKophvvmb7ST
 FkJ5BUGZ8BORPHFemaBPQZZgZLrTkwzrNuryPmoE2zucPsEqMC2od5+yw0MgqVyCymO4M1qYn3x
 FIQ8xTsA5UZsWwh541Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2MSBTYWx0ZWRfX5/s2rNeLpY8/
 DKG8Sn0WFiWvCkOhJ8TIqxDUqD0cqYQqrl2FPysqe9yMvr5FIxtetv+Ep1N8my+YUX3Pl8q6hrF
 tPmMbDKeOplrUB9rcsLzyDILuhLHX3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117865-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 64C4B72D500



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
I had updated the logic in v3 now, 
"The max-link-speed and num-lanes properties in Device Tree cap the link's
    maximum capability. Retrain the link if the controller's max link speed or
    width exceeds the Device Tree cap, unless the currently negotiated speed
    or width is already within that cap, in which case the existing link can
    still be retained"

- Krishna Chaitanya.
>> +			return false;
>> +
>> +		if (pci->num_lanes > 0 && width > pci->num_lanes)
>> +			return false;
> Similarly, this should be ==
>
> Konrad


