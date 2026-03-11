Return-Path: <linux-arm-msm+bounces-96868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MrUNbj+sGljpgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:33:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDD325C75B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D79F301875D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E981C1C3BFC;
	Wed, 11 Mar 2026 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MigaVoRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEp4DBRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854A30E0D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773207139; cv=none; b=HQbdLNohBiJYkuSeAoz9yI+Galw1K5ibD2IJaq78VP98zXLjEBm7gkvmHwCpBdx5qf1XrvUQ2UOMBEY7E3xNu/W86U5j/ZE1WbE74VBsICujlx1+tWk5bRuY4w35hydnc4o4cJrRkWg4vWG26zFkNkHpoJuKEwT+QaSeyCoAExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773207139; c=relaxed/simple;
	bh=RXGhIeORuiCyM0y6t78CX51kPoEPHIR+ounDkOA59X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQsW7BeWa7XQqFMMtMmsEwUNHTkPGF99kC/Cdg/yaALj0rxDxvp4bqFDbRJxSVdPYz1ggiu/W67PoHBceoATXGXGQJ62+9hP1CO6zmJHlwAmdVmgwqj114LW1ensXqtZEFokZ7vEPbTOE3LZAAdMYHfvXkJRlY3iP9iB0qo35pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MigaVoRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEp4DBRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2SDn62179907
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olTyyzBo2D5n62FYYMqMF+UNjzmxcvx7lFogltM3uOU=; b=MigaVoRhKZbG/a/B
	PT+USEn2YeGe63cooXTjK9/Cb/n6OQj/BYVLjN5KE9G08W3zX3IQxQkecuNMAXG9
	ug5sPD61R0GuvXwrYsBSD1ApqXDth8sLwDbgw8dznzmx7yVEyloCt6aac69v2XZf
	c+qjW7cXJk0OA57sPOBYIDDWaUvBhmvDkOR0AZt5TmcqeAIviHbW63wKqA7v55X9
	GhXtkD0vh9tyg0Xwu9VdetAOv1wnOQnt8jUq/NeNGHlY0Xd7nu2yIJs60WfxQY4g
	4Wg4zwJc5la35BPiRlt0WvI9JQoUMC/pwtw3Y8oePlzurjonDWW7U+0EzaEY4Bme
	rj5vpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvst18b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:32:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7f6ac239so2114990185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773207137; x=1773811937; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=olTyyzBo2D5n62FYYMqMF+UNjzmxcvx7lFogltM3uOU=;
        b=BEp4DBRQYFt5uI1pOmxpBNSIcDJ9uFr77DDYadCRwQXelHS0idZovPnk2IFRp6Py70
         TVxnGcWK0mDgM/J/iGJZv+hBxux84W2iN3Tb9TuGegczJIRFuCqh40qIjp+8d56p0ak+
         2YCRgsPaINmFss7gGnTlMiRUNgN6su13uL7pZN3/g26lNK383i5UTxBiZkF/iySdAs1h
         CBTuKv2jocq7hPI8tovHypVg6OeprMt6SZFkw18IjJmU+yTkZfo8osoEZXs0ORg1tkiT
         NECik21HHFUg3lLkdKSMRTSd0vKa6IO1abY/9xL5htQScOOmb7FXmJ9y2H/4bG2Fl6+W
         8LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207137; x=1773811937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olTyyzBo2D5n62FYYMqMF+UNjzmxcvx7lFogltM3uOU=;
        b=IeY6XRobKjsGvf/v+S1eZPhvwiqvuOXBuhnyO63huT0J3UzBcw5KMNXw4VyIb1JFlZ
         l92WNsPvSIRS+CVr27Uzd5wPJr0uRO/ce4DvnCvWY2ERP9sAOk8ZQIY5ZNET2IV8j/6P
         X9I/r++/zBvaIEX6iRbnqsIg47G01XX9Aq4YVCgTf3Q3QHY31jbLat4fKlp6qaf/KJP0
         K8QBKgQdYZdeT2vAqkvcLzQRcFAv4ed+E/kOeAe8ynL47x8a61c7SJHy1eszsvt4a4rp
         4FzECNXTMgxw/QUK75/2R7kV3wdNtgbK7uCq7t42A6NUmP/yBRhYKST6E6l9PnyM9qG+
         R97w==
X-Forwarded-Encrypted: i=1; AJvYcCWPHvWLQJAkW27BnpKI4f0IiE4cRPpS8Ot1uuDWd492eUAYzK24VMDfg1hybPKN5Tjzk8YoJn8/oBR61jPd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdv/iUnLbgzmUsRV2AAQBw05xThMGEbhhUyBItbyAdyoV35lbJ
	KMSly9DIek6MIqnsFBPX0sYELb5Q48HGZmmlq/ZVFVdhUG3CwCYkcRlfHKJL06Z+e75HIFRzcj4
	BQMJL7WSJDl8VNVKhQjrNjhak9oxlNxrSuFZFwsQOPNfvd3+ASEhaqDqPhqGEoB3FFATV
X-Gm-Gg: ATEYQzwRQYsR7pwSXmy5DH0UFEdfbqhO7SCZFo2GAyrLPB4XG/iExK79spcWeYr1cP2
	asutcxpuSRHBUEd64udWn+c/2qQBTMoJDpzgGMQFN5Wz69WN7EBMf4H5raRn6wXurxOzfF23YzM
	Yi39lpH2lgK2YcDows5z4lp5tDHBr16vH4d54sdZSMfHJ5TRXS4TiP/3hRjgwy+evBC2K91CnsW
	2L5wJ7UBRyOvl67A15N9Vv/fwpZdCQ8dYwKiEYz3TohqCwH3QHpAeuKbndJmR0100L+wf9SKuzC
	OmYJHlhuGZxE2gqLYuzJKdWE8seMyV1rvQlboS3GRx4Gf6D6/gWVweqao2JXNNDv7IrorHo2k49
	la/I2jb4D6b/uPdD4ZMEuSXpAPr602f/Jf+CgxoMU1KBQGq+KF2yQ7PKJxhwZaJRNyO7p2yVpf7
	yqSMWZQa49FX4ne529QnQz1kVNo0gc/k1GLOs=
X-Received: by 2002:a05:620a:6cc5:b0:8cd:93b7:ebc7 with SMTP id af79cd13be357-8cda1a7cf07mr167060685a.74.1773207136756;
        Tue, 10 Mar 2026 22:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:8cd:93b7:ebc7 with SMTP id af79cd13be357-8cda1a7cf07mr167057685a.74.1773207136134;
        Tue, 10 Mar 2026 22:32:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2ecsm213902e87.25.2026.03.10.22.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:32:14 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:32:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <a5hlaakujhy2ternljhbgydtj74aendziboqmcty3ksj4c5skj@p6bmw7graltz>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
 <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
 <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
 <23d6a9d2-7102-78d2-053d-037227edcd69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23d6a9d2-7102-78d2-053d-037227edcd69@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0NCBTYWx0ZWRfX4MDrvbN9q3Jt
 TaTiNOYQseKbobccB2uXFxw1CJnK6k9skE+ezCPJlTBWFeDvBPTO7iBkF+ukc8oXtwJxy41/Cmz
 OnJBf+IAMRqHvySsk7t/x7c7aUIkVsMET5mS0itzS88QKQUsjZrPtYgXTG2H/JLLDraP0yI+P6Z
 EyI5YDi5Zoq1rOnkpzJS/8Vo51M0TlvYZJcnMJlf/QltdkZGKtvj3psRRrnwZ2nGdGNlOWmD/kZ
 smAG/45Oll/xN76rt7U7OXnMdsGp7tKyKb1KYYPkW1CJkuj7ppTOvCjN5Pd8f2Pi5Bw5Y6XjzI3
 zgO3esHCQbT1vqxZIGmXOKRhuMPaPjaTscxSDYJJifzWVRYOn0BGz8ln8mtcVXZey08umz+m5qz
 cNtVVCeRKD0Ferb7ClPhMumChMzdxi5v4FOhDF/bt4UWFYjQZOCWSPNvDAjGhKzVyU6MCK+0j4i
 E0fpuLIIMC9LlQSVD2g==
X-Proofpoint-ORIG-GUID: 7RV3NuowgHX01v1S98TEN-EB4HHfeHQ5
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0fe61 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NO05UAudYb0SBG__3SQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7RV3NuowgHX01v1S98TEN-EB4HHfeHQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110044
X-Rspamd-Queue-Id: 3EDD325C75B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96868-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 10:39:54AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/11/2026 5:53 AM, Dmitry Baryshkov wrote:
> > On Fri, Mar 06, 2026 at 04:28:48PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> >>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>> index a936ab2aedaf..be3449861993 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>> @@ -201,9 +201,32 @@ enum platform_pm_domain_type {
> >>>  	IRIS_APV_HW_POWER_DOMAIN,
> >>>  };
> >>>  
> >>> -struct iris_platform_data {
> >>> +struct iris_firmware_data {
> >>>  	void (*init_hfi_ops)(struct iris_core *core);
> >>> +
> >>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >>
> >> Makes sense to split firmware-related data out of iris_platform_data into a
> >> dedicated iris_firmware_data, one comment though, get_vpu_buffer_size
> >> should be in iris_platform_data since it describes the VPU’s buffer
> >> requirements independent of whether the SoC runs gen1/gen2 HFI firmware.
> > 
> > Not really... Your patchset to bringup Gen2 on Kodiak points out that
> > this callback depends on the firmware: we currently use
> > iris_vpu_buf_size() for Gen1, your patch have used iris_vpu33_buf_size()
> > with an explicit comment that it requires a bigger buffer.
> 
> Agreed. However, that case is somewhat unique because the firmware code
> changed significantly between the Gen1 and Gen2 releases. In general, the
> buffer size is determined primarily by the VPU architecture, as well as by
> the features being supported—especially when specific features require
> updated buffer allocations.

I'd still disagree. In my opinion in your patchset we should have a
single sc7280 platform data (because in the end it's a single platform)
and two firmware interfaces associated with it (one for Gen1, one for
Gen2). So, get_vpu_buffer_size() callback will have to go to the
firmware interface.

> 
> Thanks,
> Dikshita
> 
> > 
> > 

-- 
With best wishes
Dmitry

