Return-Path: <linux-arm-msm+bounces-98400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ChQNn5/umldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:33:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C72B9F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72DFB300AC0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4B6332615;
	Wed, 18 Mar 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RL9l5bPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAeq5G5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E64363092
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829996; cv=none; b=Klg0xRgl5Y4yzEBG/aR3v7rFvpNvpi48Zf79eDJMKic/QMl71vv6mciUB4Nz9mxF71JRGoXOMN6xxWGTGmfJkWl1z4VqI7ra5Vlstxvb6RJeFNJXfmasXLKVA9Y3r4AdiyypqfGQSodMZ3YOsMn/5sD6nPo+VJTNA1b7lDOqbSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829996; c=relaxed/simple;
	bh=fHT07WGvsF5oyKJPCxxx+aAXOYyKPsTUTXwpeKqag3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMXDBMfOBu/WjrVFMmBmj8xxAqkWVMD5WYxTEPD2/gw2mPptJDRL7CTm1MA2v+lI+fkw4+90ZgqSyINbAx0Pi3sJMIOm5sWfu1Q7w1XtumTVwNpXEC7IcKmMNS6MV8bOZFilpEralq7m0RDKzzIjw7Yn8sZtNgi5FMgbKrRMs6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RL9l5bPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAeq5G5a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I93Kur1144949
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K+3Nv2mtVzd2XCCEAvRvSqh92obrJDkBtTqu9w2Q7Q=; b=RL9l5bPAcn2R0LtZ
	IKpeE74hQoYbrp9z+/HcGBTKg7GICKcpjQBlHntYm96WdkeFOWY5r6IX/g7glbGh
	4O83s+dYGBu2RczoFdwT/0U8Qd0MF5Nj2A8so03iu4MNxc8bTUiNd+PRgfgsYALf
	/HLQw8ZZyriU5Oq9xn7U8XE2xV0usgRQUD1L/XrXmIBprRJwzXhpRRsL9pRiDio8
	1uP4FXEUukxpGl8hZl+47Y0nMOnhjS6aaaLrDGMa8qWOJMmPjI8y4CeHlTq63xGz
	D1lVF2xQ1JyRd9ufONyLGuK74Eeqn3qkfpsCRKRHd3bHev39gYnAj1X2L/J88Pai
	rHVZQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3utdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so325292225ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829993; x=1774434793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6K+3Nv2mtVzd2XCCEAvRvSqh92obrJDkBtTqu9w2Q7Q=;
        b=VAeq5G5auBlht4Yo+vI1jvzBskIhaJxmsG2M+4BDX4oeIFshjAgAaAjz/8xcTpRrEh
         YzaGhT+BAdT4j2Y+KvvuUlZo5rHb9Gx/hRNFnV8hWwPOt4B1j5Yqj0D11rdffinuK+mC
         NdnWLNfUf9rl+sk+6pDU6jfrUyfk1jN1JgmB06mNL1JRmTOX3W6B8KkQ9JJDbPjxaolS
         7MH4RtnOaWOjRaKjN6jHRfsSOe05hxt38efFLdHVGk+N0sU7u5sLI2OvJDNUEPbPrRgw
         kNs3nZxbDluRd5ohXWRZRgIR5SAztZeS1tvpGnA4EF3gJIQrCrtEtwpss1eHqLTj3BHX
         izLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829993; x=1774434793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K+3Nv2mtVzd2XCCEAvRvSqh92obrJDkBtTqu9w2Q7Q=;
        b=lbqP9S2soPqNS8cXszGGavOvD4iFShD4lAKavpFYzkei1awFGTHOCj1TPDKDlFqpAt
         OsxtZ2+lOU52hhJgXXr53oqxG34eg3X75y9Bb7HywcZ/aUdT8q5JtekoKU45R5ASEi8k
         rDKHtMw+tt23TM8DcoZk5E90zfPMzinTu7bp3wwn5f/XlBBFqoeiCdhdVXPmTmkDdcox
         stKjK+tXjPwB0+DAl+1EmNJy/bYjU5rNLd+m/+OgNmVwA9hI+ngOJwPIg6rdBB3od/TJ
         Rb9ISKpW3/gsw2lTrXmLfuJMlNxzmiHH32eh0mZs5Fhl05T6acj5yZWB6+mQQc2hCe/O
         m1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUERPzdRBH05rxCLFy9X0NAvsSTYqy96WByFS8uForoTX7uIV7m/Jg+oJzsjORRpfyIOfkTcomtTQeSRsCP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2PsGI04ptSvYE6ip3O4WUVV48PYlm7lQIXLiLB69PCC70UcHB
	krMoFuOEyDImlWOZC5klpB9RyMgyquJEujtWheQuwDyuBEqN2PEAbuLmXG2oNXbnJTsMZDFlnc4
	WfgQeS007Tq3aZGA5sfKV18n9PG7POq6AINFsmQ9ymwij8UdR3J9462+moHfiFHlJkMFn
X-Gm-Gg: ATEYQzzpDA8KS4941TKx8zgIEKyKTze2yWfX0utm02EGPnrWgw+sgkeaaqmwavZK4/v
	Xn3vLW4yZ7nrWd7pvV2q5N3nMVrfUiq/VVSkulavqQNIZS64UcedN3S2yn4m7RYebSRf9AS456z
	uzHT1RU/IaM/kepXC9nK7rHReD38VRKbKSsn5pI6ou1CtOjpoJuUzjnFd3V1iJxZYXU4MeSkgts
	G0dT5Ll3pL4uTOZ+D2xNCBUlgDCQa8DZANr4wLmcPwy+OsM0L60wAblqFxaDwLA984gnQK1pASt
	ftEbdIytCsMZBy7IXBaJWE0rh5pV1Tzj6HrFa+v+oS3VkEPu+ijO2q+YaOrx5PIvm0w4mIVpxeT
	BaujBfoocBblZ38sJT7oR22LFSAOgGJnJQypXsqCMetFWvA/tXSqRAA==
X-Received: by 2002:a17:903:1986:b0:2b0:6140:aa65 with SMTP id d9443c01a7336-2b06e3ca13amr28724945ad.30.1773829992782;
        Wed, 18 Mar 2026 03:33:12 -0700 (PDT)
X-Received: by 2002:a17:903:1986:b0:2b0:6140:aa65 with SMTP id d9443c01a7336-2b06e3ca13amr28724725ad.30.1773829992350;
        Wed, 18 Mar 2026 03:33:12 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e605108sm30601495ad.60.2026.03.18.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:33:11 -0700 (PDT)
Message-ID: <eff4fb4b-d857-5c0b-2285-946806e8e4cf@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:03:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
 <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
 <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba7f69 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DwhbU6C3bo7Dc5u7oEUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NBCKSlW-c-VGRvFIAJMUlKWR4XcMpl8i
X-Proofpoint-ORIG-GUID: NBCKSlW-c-VGRvFIAJMUlKWR4XcMpl8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX0KcIsTQlNLWF
 4dZDXruBiNNDQfeXg/P/12tp08KkeD4L8MHHx/0h9zkpf9UM1Z5X57hGDRLjg2W1D8qqW5StZwE
 0icrV8Ke2sq8D2YET3SkuY0II669TnlQs94bFj2cNf6TTtsxq6j6WlDuiuuLFv37j3vJK8IIMRB
 qBUM3uIRH9sJ7thoc3dzTP/zEfW3GhRIgpZJRfMfQ8U1tY6FGMbDXrwRQEGgijh9ta8U3wS7I8p
 xohOsn9k52vzJiP/44HrY3Is2nLz/KKIUSaoCzxxrs9i83SrEadlsaJ9eqA4Tj3XoS8ogdAisW4
 HDjLsMdROuYQsuv864fd9lcB/wwson4pWYG2FLeAInqT+FYRPBTDnO3PiKyf1egrEJEdXX9ssR5
 Fq0j8M+Mtldo6ox1n+znGD4mrdcuVIuBSnhieLaIN4jncBjuYTCzLhpqmj16DVslvdhV5eQRhmh
 jY/MkSQezwMTAbhqvdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98400-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F0C72B9F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 3:59 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 02:35:30PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
>>> Having firmware-related fields in platform data results in the tying
>>> platform data to the HFI firmware data rather than the actual hardware.
>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
>>> should be placed next to the other gen2 platforms, although it has the
>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
>>> hardware-specific platform data is also close to those devices.
>>>
>>> Split firmware data to a separate struct, separating hardware-related
>>> data from the firmware interfaces.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
>>>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
>>>  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>>>  10 files changed, 205 insertions(+), 369 deletions(-)
>>>
>>
>> <snip>
>>
>>> -struct iris_platform_data {
>>> +struct iris_firmware_data {
>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>> -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>> -	const struct vpu_ops *vpu_ops;
>>> -	const struct icc_info *icc_tbl;
>>> -	unsigned int icc_tbl_size;
>>> -	const struct bw_info *bw_tbl_dec;
>>> -	unsigned int bw_tbl_dec_size;
>>> -	const char * const *pmdomain_tbl;
>>> -	unsigned int pmdomain_tbl_size;
>>> -	const char * const *opp_pd_tbl;
>>> -	unsigned int opp_pd_tbl_size;
>>> -	const struct platform_clk_data *clk_tbl;
>>> -	const char * const *opp_clk_tbl;
>>> -	unsigned int clk_tbl_size;
>>> -	const char * const *clk_rst_tbl;
>>> -	unsigned int clk_rst_tbl_size;
>>> -	const char * const *controller_rst_tbl;
>>> -	unsigned int controller_rst_tbl_size;
>>> -	u64 dma_mask;
>>> -	const char *fwname;
>>> -	struct iris_fmt *inst_iris_fmts;
>>> -	u32 inst_iris_fmts_size;
>>> -	struct platform_inst_caps *inst_caps;
>>> +
>>>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>>>  	u32 inst_fw_caps_dec_size;
>>>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>>>  	u32 inst_fw_caps_enc_size;
>>> -	const struct tz_cp_config *tz_cp_config_data;
>>> -	u32 tz_cp_config_data_size;
>>> -	u32 core_arch;
>>
>> This can also be tied to firmware data as this is required to be set for
>> Gen2 only and is 0 for Gen1.
> 
> Will it differ between platforms?

Nope, same for all platforms with HFI Gen2.

Thanks,
Dikshita
> 

