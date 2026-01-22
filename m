Return-Path: <linux-arm-msm+bounces-90211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGSKGb84cmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:48:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA623681B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 83B45963456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BF633A03A;
	Thu, 22 Jan 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldJnZral";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jk+Sc138"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A1257452
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090431; cv=none; b=Wu2Ib+R0bZNYkryV3L5CKaRCSQTNN1YZgFhminMXMnerhP9WzvqOv+bH12NeJ7UhZhw8EsAp9IgyMa7eHj5O61yhc9IhznalRFre52kSGc7Mz99iMeSjGYcKVE6MwUi/ouOPfeCeSvlYQfVCi1JS+kVx2kiBsztT+SC6y+EDzf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090431; c=relaxed/simple;
	bh=8TJKSHUj3kenAiwXWPmPxtoqycWg9NUKkJGDdUa9hV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZSFMr5c/aEM9H9iPwU1IlDSB7uctzlXrlqYrBEnTAkcvNcfQQCVYxVcrihB6itdXneNJ8zF5dEAgFt0pNMN7GompKyliCjotCsHN83kiBluMxM4cfGPYoOZ3B3HxXcJpVnuuM6dbV1m+8ZtNqPupJpwFSwMERrkKL8ix5ZyJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldJnZral; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jk+Sc138; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6opsd484050
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YEc9GU3L05svxilgKGtwX6lohsUU6+tXBYCQfjLvprc=; b=ldJnZralXNyd+ICz
	OipaArRwpZHqpcbME7/v4EcjjWC84hZRM5Hfks9ReszeSiGAlgIqI60plzcICExU
	zA6hF4NN4hh5+O1Zf52DRegfZxcvn+hx0GFm6pW0/CBFCWu8hN1OEjzI5rfFiVJl
	jx7KVXkQzdSYOd4xVElP4+Of9+2S6QNfUu78kUdgd/WPnl+UTMOyQ1Grmd/SoZD1
	3aWDplgJ82oqz3gX/THv4lIr4m1IQNtDZiBxMyLgIXmlSZbiEkYC/W821ZuRfduo
	FYjQ1h1xi4xp0YaiMiZnSoZwRAkzfOCBO95gdlTSdW4oQjBtDzVAEn/D0R4SDXZL
	rDYhhQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj2p8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:00:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c56848e6f45so540256a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769090428; x=1769695228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEc9GU3L05svxilgKGtwX6lohsUU6+tXBYCQfjLvprc=;
        b=Jk+Sc138lKiG9Ngrep557wMDQvALVMWhC9UHIv23WzGn25Y9yNYBodnm1LkWI49uWF
         Vp44nBEgptWISLTHjzA04jtl+uyAX5Hn/hym42uT5bkT00KWIb5VE3GuYd38MfuaPYRU
         DUUCo6VL6LtKJgUvczxwxX4EKTjRSsjLceeI2YfQkyNFzg76vRe0RRGBaFPAqqikKwpY
         LZpOsshxe1dnkHrA4fYzqg1ElWjlySkmsV+yd3ZNFrIFNzNXFdV+XdL9iBZUGS8ktWvD
         eq1R3eMuMZ7I/er70VdH3BVFkd15QGkepjuf3U7/FXmuDN9N6dkqnPqe4ZI9Ki+9RWcn
         XRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769090428; x=1769695228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEc9GU3L05svxilgKGtwX6lohsUU6+tXBYCQfjLvprc=;
        b=UZXlPL2sE7dJUee2J8gvBg7zrVaUN+JGQdJCxr04uyMNLrmDCprSO3850uacf6oXSF
         eaJQaqUNH3tDkPLyCjRvDgf7xDWDCuhkzmy/a4NZiEU4r+yXvcWngJQ8fM6HInctX0SA
         /ZSPyOyaKh9CyzPkk2N+CqTk3gutlbDMNbrwB8nsx/W6Aqp19gYn2SeauqBUDTaiURx3
         MbcFdGf6LiJLCOygv2E1U18oMZMaKoFhIvW9aP+KcyjcTDZ5b0QOdkqmR3IDaQlFfq3l
         03MNTnYcqssP57b5BZJEDvFttFbueD+k0lMUjFbvjJapXUzhq3QVmG4Pj0rzMWGsNCX9
         dAeA==
X-Forwarded-Encrypted: i=1; AJvYcCU1zMEUACKs5Papv0+s+scio0mINiSjEZp6oBYj+BibxKO3wgS2QOGHGsuflkuDS4snlEF7pC4Nybbs72hF@vger.kernel.org
X-Gm-Message-State: AOJu0YyGiEhpvAxPeH2htcuG2FwDLlBTjYcFmxowEbKGy9LJJc9USA3Q
	A2eqOdM4HBblUmGG2YLfkwPowXDHcVQxZqeWLS9zDoZBjkD08RbMVDFafqNYrh1zGZMdxaLC5qr
	RLEKAxyJ2xemk/vIVLDonkMkT9V4jD3mj5CaU+mqi6w+jYdk+nqXeIzJYRbaXXwJjvtee
X-Gm-Gg: AZuq6aJdb0xjSchUwdQSy0pCiJMlHa5Kz10IvCai0nxFhzm5UoqbPQXl6bsbxU90vbr
	Xzz36Ai8gWF0397o2cWexg+qpZk0gMQkTzTtplH0YVImp36Cd+zsAwbWvR6jwH4nrVhnSG1315R
	gCUpRDCUF9hK+m/fv2b4tBidBvubtxqaR/4QidDSl7b5ijaZZSMO5iPLMwmfqhiCiMHAdDKbgmL
	0Lp8kp5//FU3OuGL2Bcp2cMEivmsmHRWRq5D1kX+Q8bnWyhFdIBkze7cthfRXqTj+3PUH8WWeRm
	TSgyQSld4Wyw3o9ZcxUKWeYJ6HanlBG0/NrxbILkPv0L52SZdfFXRh4NZULaPXo2i9/jnqukZbk
	Fsj2irF8un43QMiVlnfcTfCbnp8TsBRhnbsiFy7/xa4ZlFKw7piKMxh5t16Z5m+uylt0wJENipT
	1NHJZTvX8ErRxkbkln1F/H8w0yJcxt
X-Received: by 2002:a05:6a21:338e:b0:38d:f084:e33d with SMTP id adf61e73a8af0-38e45e2182fmr8292146637.41.1769090427663;
        Thu, 22 Jan 2026 06:00:27 -0800 (PST)
X-Received: by 2002:a05:6a21:338e:b0:38d:f084:e33d with SMTP id adf61e73a8af0-38e45e2182fmr8292076637.41.1769090426846;
        Thu, 22 Jan 2026 06:00:26 -0800 (PST)
Received: from [10.190.200.191] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf251a6csm17465094a12.13.2026.01.22.06.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:00:26 -0800 (PST)
Message-ID: <cbb0f941-57f9-4ff6-a2bd-4ef8cbdb1ade@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 19:30:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v5-3-8ba76c354e9a@oss.qualcomm.com>
 <pmkxaslxodh2cnxbxy6wnyalb4zl64xek5l4cfhtw3k3ywatfk@hyzhbh7wzzji>
 <d3ec2d98-eb43-4de8-a356-006f0df43c54@oss.qualcomm.com>
 <nzqipun5kaibld2aolihfc475ceip4s5cpnzhhs2fcvmydsaih@6snt7gtjtetl>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <nzqipun5kaibld2aolihfc475ceip4s5cpnzhhs2fcvmydsaih@6snt7gtjtetl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=69722d7c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XrNrwu1fJH_fsFYXVS4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwNSBTYWx0ZWRfX43ZCKuODpiHJ
 doAvKW/9NU4Uu52mLHNu/ctLOfkzdTvzZDN4K+/+MQwPRbIMKJtNLVSZFp5UzJVBaFiNjHHsBZl
 IPPP0vPKe8R5olf1YmYUsbneMcby8EhN9EEJ+t8EMgW50tGoT90Qv0qOsx4b5MZHEnsDnH47EVH
 d3xghIQPd4fQLPfFQKmIrmsFK+JrUBqib9+RFG0YO+XX8keNKv5rJP35hvdKYyqvhDYYeMtXjbi
 +s9NB9TaFagBVDiwb0oSzGe5jN/tx5WOITpSXP2hv5xXWOajf+BbYkhQkwEhgnaqCBQBnyooV7y
 uv3SYTNKnOUdgCFbI2E+SzBnxu8AZ2RZVfgVUzgfulbaRKwRUOdVCNmg8gchhsvyoTLdxzGvfzX
 rYddJFDNWHzI/f9fj5bVUkkX60LMlJj/v++RO3zdmQVU4iTaSrj7c5zDWPisl/N6Cwftp5xghH6
 ciZNpuGaUu5ZoLHPGTQ==
X-Proofpoint-ORIG-GUID: uCOeJu6OMueUGgwb9qCV0qSVR5wSO5kk
X-Proofpoint-GUID: uCOeJu6OMueUGgwb9qCV0qSVR5wSO5kk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90211-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA623681B3
X-Rspamd-Action: no action

On 1/22/2026 4:11 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 22, 2026 at 12:15:17PM +0530, Pankaj Patil wrote:
>> On 1/22/2026 6:52 AM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 22, 2026 at 12:05:13AM +0530, Pankaj Patil wrote:
>>>> Introduce the base device tree support for Glymur – Qualcomm's
>>>> next-generation compute SoC. The new glymur.dtsi describes the core SoC
>>>> components, including:
>>>>
>>>> - CPUs and CPU topology
>>>> - Interrupt controller and TLMM
>>>> - GCC,DISPCC and RPMHCC clock controllers
>>>> - Reserved memory and interconnects
>>>> - APPS and PCIe SMMU and firmware SCM
>>>> - Watchdog, RPMHPD, APPS RSC and SRAM
>>>> - PSCI and PMU nodes
>>>> - QUPv3 serial engines
>>>> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
>>>> - PDP0 mailbox, IPCC and AOSS
>>>> - Display clock controller
>>>> - SPMI PMIC arbiter with SPMI0/1/2 buses
>>>> - SMP2P nodes
>>>> - TSENS and thermal zones (8 instances, 92 sensors)
>>>>
>>>> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
>>>> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
>>>>
>>>> Enabled PCIe controllers and associated PHY to support boot to
>>>> shell with nvme storage,
>>>> List of PCIe instances enabled:
>>>>
>>>> - PCIe3b
>>>> - PCIe4
>>>> - PCIe5
>>>> - PCIe6
>>>>
>>>> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 6122 ++++++++++++++++++++++++++
>>>>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  107 +
>>>>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   45 +
>>>>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   83 +
>>>>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |   83 +
>>>>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
>>>>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
>>>>  7 files changed, 6555 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> new file mode 100644
>>>> index 000000000000..c0ecc64202c7
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +
>>>> +		pmh0101-thermal {
>>>
>>> Why do we have PMIC thermal zones as a part of SoC DTSI?
>>
>> There were comments on v3 about moving them to out of board dts,
>> https://lore.kernel.org/all/aUko20ORsgrlZrIn@linaro.org/
>> glymur-pmics.dtsi was dropped in v4, the changes were moved to glymur.dtsi
> 
> Anyway, the PMICS (nor their thermal zones) are not a part of the SoC.
> As such, they don't belong to glymur.dtsi.
> 

Moving pmic thermal zones to their respective pmic dtsi files in next revision

