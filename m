Return-Path: <linux-arm-msm+bounces-93266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDhHENSglWlcSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:21:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3B155DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A00B300A8DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E597030AACF;
	Wed, 18 Feb 2026 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzT2nn+k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbPTQPjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A83081B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413698; cv=none; b=j0HCYb5MwCuMt+lNh7vxDb/bCB3TOErXbOktHOdLl4bACg8Nf/9BbOuBnfAwRCMYWJZKuxB2HyM26TeGmkfTASshxHDzB7hddSdH6kCHu9GVvyG2u9kwURIMu7QIrXK1iKS4k+CSAVhafiwyKkYuDh2eeqqYlFUTQdURC6ihkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413698; c=relaxed/simple;
	bh=VkGl5N6Ms1y9C+oUT5Engr5WmryKoI3TONJmWbbRXyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7Z6QLOn55004acGc/bt6dsrIWLqwM93ilkhMz6BEH5KrA/LZV6WOG6r1bEAUpw9LhYpqZTc0SCwlkV3JQzY+y2rJYcwqtSFJXMhJuI7Uuow5rZXyKHJKhFafiIvCbZ87iLZAdrlSu5kJ/om5NWiHBFRKNaQrWBuj73KQh8dFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzT2nn+k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fbPTQPjg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5OdvG4025110
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAQFJVCiVyV/I/cFm2kTpG+fP1ktABWgnDDVKfpvzTY=; b=WzT2nn+kqBIXatBJ
	IMCp+uSXEhiP5bznuCLEsFAmySxvbifIPmrx4yDQPkP/wYkTe3MdrM76QPOV9zhU
	vSIxlA6sPl1uuXdcrPO+pOegKZkXB1DFxD2ix5Vbsj8t8DZzVoWrmWgjMnc8T1Do
	atdW2p0QigIMQLkCS8vfra0p6RvB50zZSoNCZB2pdiyQQjC+cZlC9ps/Lr7LT85g
	BVRPe92cazLlZh7iIjdOZg8BwXiuve4xq1zKEDut7M+BGPcVB82Bz9ybhmKB2+2k
	RgZK6R9jXYYqNrpR1Sja9fdlB+RQSLEdVk96mRtL7fzULQqV95iq7v/bI0L/JmKI
	2SMQFg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c0v6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:21:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954ab64c65so53708676d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771413696; x=1772018496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAQFJVCiVyV/I/cFm2kTpG+fP1ktABWgnDDVKfpvzTY=;
        b=fbPTQPjgJT8Er2B+WRbzu4cB8Z8t1UPXrJgptx6oPzqY6Fde5Zjjh3yM5kmqDvu3HI
         gmE+x3a3cYgYp0/nyo59bSW4w02YMtHNNF4rV7a1gOL/mrKqq9bDoabNfW8H2imBlZZF
         oWSSUEmTW/PXJG+EoWZ7MUbVEIWPgpr1d572sWwcXgNzJ2bI0OphPJ1V5bdYCTYYnAmQ
         bx+8Jd8hZjy2gdRR074rOcB8vp/89FTpymIKIBggWXmysAjqbBjkqCPwyzyKsU6KejLb
         LoBpKCECnuHR5ZTTisC1NtTG8p5CFCAS7GZUe1So84JyFBUUAoh2kbDhc/tLfgfO+uIz
         +KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771413696; x=1772018496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAQFJVCiVyV/I/cFm2kTpG+fP1ktABWgnDDVKfpvzTY=;
        b=ajpwBDnZ4Pck79/Y0ynx4Io/9RH/LI+UK2RxR/pczlBMPgwsAbhNx5LtPD4PEKC40k
         2Fs+TGiOHHLthklG/XugNN1DQSXBZeVtJifQVL+st9MRLoiJhWEtXzERovgDxrPoXZyM
         T2Ho/4wJhdbZK2Xj8HFI4PkkvO2RVwhaRwg04Cn6RW51LE4A+s6te5BxHoazNRQb1Bdv
         gW2uSuCBs/v9K4E8K0v3m/Lzp6FyMouK6TiGUikjyV+N0IAgw48im41Yk0BN2uwFCp0e
         0gQcNAHQdKx1gxeQu4yEn+cwg19IX9yMorDPGkytXkz1bZh53uzWqyCpJrztAfK2lmjG
         +XNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmkYLoGF6d+XuCDOS3bPpZ0/XRej9TR/hCjpEEujGBf9k5AjqCj0kNZEOuXCc5nytbHvfQN0LN+wHTk6i8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywemfm3Y8oI4tMsBS2aQoQYscBa8Epz3r4IVKTaEliglBSKoypJ
	csen6/e0veuG6JfSxcnW2jrYKsN5R31Askh4rqZoQZF5UMOD+lrhE+XaN3z2ge+DH3sNMf8eziz
	Alz2Gxe5suz0u2NMxAdnn1Xt8QAPBN4MoSDN56PlasUCuz05XQbF42osZ1ZKaJg7AGEIX
X-Gm-Gg: AZuq6aLJYtI+F8g/ErOiJSv3DFf/sM9icwXeWQoL7z1ZuLrtTOK43ftLmKTj0T/GwHP
	vmFfb+IsVjDQzJZfWeGS7kdjnvVAvHDGNdB8aLybbSnklExedoulucoA2wm1XfujtMInmNeIfoD
	+qHN7KhCSNK8p+ZAnKs5AmoQf+v6ePrDmLfE9DaERjHrxjY1ftW51bAIMaraJxR084MQJ8dzJGm
	MOCcJQpE47Ud24qd3k7UPLsoSBPB2VGIUG1O0vfEA9kDP/AA+YXvisc8wZR6CcBbSUKqn4ZLPC2
	uYrKWkvwewHd+wpfjv7a/njOnz2C6JqSM3phQ+wft85tORjUGQnmFWeHNSnx2P2HBC0ktAyPyuZ
	jXU3e7v6U40HD9gb27VHbFuMRpb9NWvj033o4qsfMkmurbWkoXxVWmysYDscXB+x1nhp/dxJU0T
	8I4rY=
X-Received: by 2002:a05:6214:6105:b0:896:f523:155a with SMTP id 6a1803df08f44-897347f9d2bmr170496566d6.6.1771413696061;
        Wed, 18 Feb 2026 03:21:36 -0800 (PST)
X-Received: by 2002:a05:6214:6105:b0:896:f523:155a with SMTP id 6a1803df08f44-897347f9d2bmr170496376d6.6.1771413695680;
        Wed, 18 Feb 2026 03:21:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76b2580sm437029366b.64.2026.02.18.03.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:21:35 -0800 (PST)
Message-ID: <36f2fe1d-27df-4ca6-9554-72edc9108127@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 12:21:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v3,3/3] net: ipa: Grab IMEM slice base/size from DTS
To: Simon Horman <horms@kernel.org>, konradybcio@kernel.org
Cc: pabeni@redhat.com, marijn.suijten@somainline.org, edumazet@google.com,
        elder@riscstar.com, andrew+netdev@lunn.ch,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        elder@kernel.org, devicetree@vger.kernel.org, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        conor+dt@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
References: <20260217-topic-ipa_imem-v3-3-d6d8ed1dfb67@oss.qualcomm.com>
 <20260218103917.132153-3-horms@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260218103917.132153-3-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rSaRyZFqTr4xPzPUcEgEmxICpSIkdJjS
X-Proofpoint-ORIG-GUID: rSaRyZFqTr4xPzPUcEgEmxICpSIkdJjS
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6995a0c0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=9R54UkLUAAAA:8 a=PR7fkkLM5UUJJyjF1Z0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwMSBTYWx0ZWRfXy5N27g16OvOb
 BxXQeAFNeF2yyBz/s9uil/ChnwqKnBM0npzrBcCfGuHuAelWoV8Z7minTR4SpwTA3KSC6WOIFHT
 yrLBp3pjGCGWM6vUW94l5kBZOy9NWOm9d2nYHO6a9XOMTy8Vc/Quk4n4tfyMNdvaYS8BwMCAndh
 q8okkaJv64oYpIm9rldNbo5O7na22X/nI8WiBK49j97o/i8dWKhgDbGviVibvqYJFvy2U7W5moO
 E1n3H0BrIzlCB8UvtuiYh+P/Dan88Aod327WtUm9De8WeNWuSwMC5PMti90mJfzEnhypao4O7mL
 +0YIVKxqLLmOlc2WRK1RB3PnSIDJOiQJpagegbckq52P+7l7aTXAl7t+/YKnjf0JpwcQlBCrcif
 AWUbIPtkas6XjsqTRtZxz6PsyHJr67gMcngIQufhmqZZ9CEIYegw2VUUsacofjMvoUJoFlplLK/
 NuRVhO8epSuW1VTQOzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93266-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96A3B155DA9
X-Rspamd-Action: no action

On 2/18/26 11:39 AM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---

[...]

>> +		of_node_put(ipa_slice_np);
>> +		if (ret)
>> +			return ret;
>                         ^^^^^^^^^^
> 
> At this point ipa->mem_virt holds a valid memremap() pointer.  Does
> this direct return leak the mapping?  Every other error path after the
> memremap() in this function uses goto err_unmap, which calls
> memunmap(ipa->mem_virt).  Should this be goto err_unmap instead?
> 
> Simon says: This seems to me to be an actual problem.

Yes, the robot proved useful

Konrad

