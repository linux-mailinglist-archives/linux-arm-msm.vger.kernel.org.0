Return-Path: <linux-arm-msm+bounces-77318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F20CDBDD30A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C5764E202E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6592C0296;
	Wed, 15 Oct 2025 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTGvq6sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA079478
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514456; cv=none; b=cC/zIOvu2o4YNKqDpuAt551wK37lsn+StcphzXB30peV4WjURFGkcubTKetMekGQ1jBGj6ZioFdMQUSAR4jXOOueBbDVKoVVCKicmNlLqVFf5Lzyx1ZkLlLwFUgfOKGQ8/PltOfLn6PIJxMvJyrl2U9nOxTP9Dp0shIq9ixsU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514456; c=relaxed/simple;
	bh=JBySYm7jCnLNR7S47OJWMx5tSg66aDYRas2A7H3BfRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2F/Pfu4Nm0aUBxc9G1AY1b4m8b3SDBopjFEVgwEo+6bOUiBCF3iZQi6TsMy5JSNQqiJVxuSv4SN/J3bUrY7F2ICHsDpQdbDtyFP2Vg0tL6aNOyPNQyk9rGU+lfmaBNm5x6fohfSuusOASgu1ZEUmQaLqJhCmCfgY32tmjCSKUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTGvq6sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sE87016732
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wzEuS4KgwUf/si4HCRP4Xjfg9FTP53VK8rld0Pt2hw=; b=GTGvq6sc6JxH0BRj
	ATrPrb5KfpdAAosrchw3H6kaMELoxGWp3yqbmmH/y8D0AjUvLOxzprSudsU1bZ+Q
	TxBCCCTKBjaI+EbGlJyNHNMwPGIDwH5Yq/0K58KY45PtKXZtRE0EtZUy/BiR9bdB
	7RfKDLwEGUEoLtyTJztloXRJp5obqdVQWiYMSUyr4qsnc+iyh27XpAyRk+n6bbBf
	i99KG671HDGIGK8V9oiQ+AFQo2ieOzwDQVXf+HCFcS/uAtIJR/bLuJCyUVulwGCF
	iWatMZCyif/690rRFP6oj6A8romXj3CPAjlRaWDSVFR1BzUDFyvbObTo1uhbBSub
	m8pakw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt8g9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:47:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27ee41e062cso141978865ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514453; x=1761119253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wzEuS4KgwUf/si4HCRP4Xjfg9FTP53VK8rld0Pt2hw=;
        b=e0RumI9jqJA9bcS4Z1cbj/dzmxOkHS0tnz6V5eT8kdmazBbZHBM7MtE/Y5lQPHr36I
         lyOxchrw3i+qbGPplG+lTkatL/FSPtkAySpXVtCpZVLb5sBFuoQGOpLxlzAl7xtBLGQr
         0SRqLYyNNA3bG6BWmraOoK0BqoUSrMAtslkej8xsyKsCAFNOLkBcMU5TTW/mkYPSzPuk
         xI0MGhR1W28tQb8ZdgmCTfOjQkuv9uRh6OIf8d+30towzdXJvic73BYQ0OyO2SPTRjdH
         El9NNshhh5OpIQtGo1RX36SSLngouCppdpq/UJ5F/USAqOD1PPOgH6M0Eao+v2N6/U50
         PBLg==
X-Forwarded-Encrypted: i=1; AJvYcCUVNiEwJigdWaGNT6P1Jh2olm5YR3mcQNpTUZcu6bKycBewvHXpLzZq3/QiptOEQl69YDPI0kvn2A2fe3vc@vger.kernel.org
X-Gm-Message-State: AOJu0YyKqlGt3LPDWwnmN8LdYM1CLKSuPy3Pwb6UOYjg3lZuqe3qRjOi
	5RnuetWQF0EHRj8HKiiMzcKrVWbjJVERaGH7NoXew03t3JB3697jmPrXApEysU4ycu3HrKSvR0B
	+LF+1JUaEgDhdScjx2qwwv6f7lrVDSQjvWmKxGofddcM5WjckgowsBHuufXTCsx4bmmhV
X-Gm-Gg: ASbGncsVkrn4RKDM4O8Rv3zb0M+mxIIHpbRjKbxPfyIC0DDmJY1Vp8D6SzlcbafEJXr
	UzbKiK3xNLLaw7qeSFIystZui5YKK+fUMaSzqSs2DWmJf31zLq3m4Rxq1iIYVs6Ap71J05lE4Iv
	rKpj0QJmFI3lnT9BLrDT1bH/A3F+xGG+aTcg8rzbYIlCEPHJnCPcscQIHosqPz/N020hDUN6rBr
	v8L0/KxicF51TGJdpkXG02H+29k+IeFBD2EgFIPWkCARJ8tekDiTrH75gJ3FdjvzwJ3tOYVRiTs
	UFSedZvquNolt39VsXhq37XlKIv5u7VYUXHm3zXlU10V2pDs1pxno/FW7E1Hrnp3wrnj01+3eQ=
	=
X-Received: by 2002:a17:903:2343:b0:248:fc2d:3a21 with SMTP id d9443c01a7336-29027290194mr277067095ad.4.1760514452588;
        Wed, 15 Oct 2025 00:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhzyOtK2t73BdHuEH9yQdQ6LRCYOnKx0D9BJpdqWj+pdvXaadxnVohWazYDT43ZnK/Q6nPCw==
X-Received: by 2002:a17:903:2343:b0:248:fc2d:3a21 with SMTP id d9443c01a7336-29027290194mr277066685ad.4.1760514451980;
        Wed, 15 Oct 2025 00:47:31 -0700 (PDT)
Received: from [10.216.0.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm187706535ad.22.2025.10.15.00.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:47:31 -0700 (PDT)
Message-ID: <1bf62073-fae9-dd49-c908-193c06cdda84@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 13:17:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 07/14] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-7-b98aedaa23ee@oss.qualcomm.com>
 <3978e740-0589-4872-8f2f-1162084d3818@quicinc.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <3978e740-0589-4872-8f2f-1162084d3818@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sr3WAHnFp95kSjPXw7f9tgscXgx5h1r4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/hW5/xf71Euz
 Dx1dEiaMGGmF3sTLTSLQY06wFgNhWscDonWMzk9Vk7hRFpSUVHaOX7hJ0A1Ru79x8Go/mvHCvOS
 /pesD3UJTKFQBAeRqJtL7Lq2Mie44BfU84esJU+3SDkB922CN+16+UK3gK1w+MNKkC6kVRCqS/V
 GfWO94VDMPOVMlo82ZOPkREO6sct6Qyk9uACvdpiUTpYAX5bURijaeXC8yl0JEI1YsZabUSWq3+
 F9Rc7wolV1StAWZkXz9+xAgHPc72TURwKj/dGAYZvDepDFYkrk8vJu/xvldUkpqT30WdycIVR3I
 Px5gdoQa+kr4bT9wtETB8n2/01SMkljCLuXbA3jwuQvNfIeKhQLoqVF13WeW9GmxXGERnRjtvam
 J4MqnkCNRwkqmg93wwYP+Taj0MbrUQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ef5196 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=R8NOTgI61i89tWg-cvsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: sr3WAHnFp95kSjPXw7f9tgscXgx5h1r4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022



On 10/15/2025 12:25 PM, Pavan Kondeti wrote:
> On Wed, Oct 15, 2025 at 10:08:22AM +0530, Shivendra Pratap wrote:
>> +static int __init psci_init_vendor_reset(void)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	struct device_node *psci_np;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	if (!psci_system_reset2_supported)
>> +		return -EINVAL;
>> +
>> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> +	if (!psci_np)
>> +		return -ENODEV;
>> +
>> +	np = of_find_node_by_name(psci_np, "reboot-mode");
>> +	if (!np) {
>> +		of_node_put(psci_np);
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
>> +	if (ret)
>> +		goto err_notifier;
>> +
>> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot) {
>> +		ret = -ENOMEM;
>> +		goto err_kzalloc;
>> +	}
>> +
>> +	reboot->write = psci_set_vendor_sys_reset2;
>> +	reboot->driver_name = "psci";
>> +
>> +	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
>> +	if (ret)
>> +		goto err_register;
>> +
> 
> minor nit: np and psci_np reference must be dropped since we are done
> using it.

Ack. Sure. thanks. Will update this.

thanks,
Shivendra

