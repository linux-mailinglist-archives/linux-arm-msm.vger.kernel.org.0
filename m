Return-Path: <linux-arm-msm+bounces-101749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP3NIrWK0GnG8gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 05:51:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE17399D65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 05:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B003309DDF2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 03:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8924330315;
	Sat,  4 Apr 2026 03:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0XyHZcp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arwF1Ylh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27791A6802
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 03:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775274382; cv=none; b=TIdT+VScThACuhlDE4CkvEwHzz7irPaTkBGDOUU2XrCaQmICwyGzdJ45MZn6EyY0Y3eHH8/Ob+SDkqpb+4Xqo7+x5VBxFYNA8tinjeGeDI5FLq5dNMZgUqAEFEZ+6r0aZx7ZCoF61AjcFRsy9U/6bmKTfnkziQ4FLwmHneHCbec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775274382; c=relaxed/simple;
	bh=g7BPMnWGYr9XLedyDJj/0ceqM2/mwHQtTeYEh6kl47g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ii03vn3VuhGmdYeOHEmymaEvit0sSmiax4lH/fBWIeeRlcycOO6XX7YPG243lxcUovJrVDZd4/zSgm7PTH+mC91Gj/TF8VDHSdTHdPdJDYTPSuWL+mD+nSjfK5xEKlfistilObadWV6ip237RWiMDWpnfvorzzPzYvU/zGTpJbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0XyHZcp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arwF1Ylh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63429qbF2410375
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 03:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWHLzaZk1ffZwAMB9f1QCz31ZypCQabwOafEwrGdsFU=; b=Y0XyHZcpWbqbH1yF
	cTFYxK7G86xg/EfUZAb8UXd/Ripb7D0yBNYjJRmx15MsU039UTWhM8u8vMJLPzaQ
	6ckan8pcRg8N/7PaZh0tEaqkXED4JrHyp/wIzLYfbcmu7STs5EDtjN+eg/PbHt64
	+x0WT1ydFEn9HNLwp6ZIlu1b+r7TQt7UjQBrZayFBjJdhUJV8gBNwBwjXvcV+eCf
	c+ZXovIn1ZL5fDrtdGN0z0ZV2nK95HfenT8U9n9QZYWOGz0tf6oJ3e8nLH6hixOI
	wotuTd+XObyaBT8yePpw+B6B5CvNZuRhAqkHU2hd45ZunfPx90o2RcQJScJAFR5D
	ucQVlw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrg484-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 03:46:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24a00d12cso26788995ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775274380; x=1775879180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWHLzaZk1ffZwAMB9f1QCz31ZypCQabwOafEwrGdsFU=;
        b=arwF1YlhGfzPpWD+zueKvPK4E8c8V7XgEjVunhnlqu7gMb7BFsbX6+GI3F4jTSh1QK
         4seA8p/tM98oL2VwOoASnXmBGgKXOPOsAUCxcZOv1T4+g0akDXk3H4OSKj4C69DWurUG
         P0O5AOS2zjDywhIkSSukVceZTb+Y1BU05quhTJZesiHmoy7K2gYYw92AVRiGRiHV2l66
         KYtXXIF+3Xmsxh3NJamV/iLy7bTkpqMDNQkEOTETe1w0+4aoh8TItct8mpRrB7ZClrR3
         TD+b+aerc+jYxjSrrlRRNUhkbHxfvOShXRhi313cw3KGJlWBh8DhV3a+3KRv2QLPZFXX
         FTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775274380; x=1775879180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWHLzaZk1ffZwAMB9f1QCz31ZypCQabwOafEwrGdsFU=;
        b=fd5hG4ZPj0ZDiWwabZciI+7X/FcwezM6xHpl9d+Shh9pT90Qjh6Ig3UZIhjvt9JRcw
         bVC3P/MXI+HkSvO4XWgA7AhNzz8w2DFB24dm/dIZH9bvGNb18kqF3v+SGra468Y0yFIC
         wxMfgsU93ww9ewaBFvMujJH4nEGfJpcR3eh0chxiAe8oeNtznCLvPE4s64yv8C++GbIR
         HKGGPTw/hOlOBNrs7kh7+xzfB7Stqm3SnJ8Rd8ikr5jVcrlDJUtrsYtRPhAhFHbD+yKZ
         Q/5aPjnEMVsQ5UYhXg2hNp3/fAMJzkKKgjJrfqtlxbNo6INFEh/YmNV6/Os25RShkz3g
         tnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOTGanEHDktYUHN2HGQF4x/OqPcNiKnRTZ/PdRvjY0lgy4n55EjZ+xJbeOcHlUbEKKp2fRPR88uoMRxCJY@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJjfRgt0yEk6Xkb0iSIXXmaIXyLSUdCLkV5ADCo78xo5Jkp0P
	flrt88LIAl2yib8eg+NHVUwCpoEoeRYBOdjelj6NNd3amB2bHtVu3vMOM+bv0kmpYInyxsblXiP
	USjlSCIWeElMt4dpaYwuJo3W9ZuxgdacaSx+hUGfhOdGNzdXu2W2lLD4OlzLyE3lx5HDH
X-Gm-Gg: AeBDiesjBvv4kdIjrGMP0lw9kqKC4u15gdaaXqmOYEXNm12NkWZKh4Yxj9HBR3mvwKE
	M/fuUQUoPRCIHBUzR3mms37CRy59zJhjl7w1LPAdBSJU3pvAmhUHBH25sMameiMT2Wgz8RTikg3
	kYVtqHN1MFSFxJ0OeoNzMrGqnKqG3anxRaRGrizLg4a55w1NK6Gy7cFi2mTHUvuiZS4V+M1LWt3
	NTVoHrwyAZGc8hW+9S+d0KtqLClgWzztthxVh4OPqRpSAcDgIZ+DiR3dOa3eIHgtPnLPcVnvsJP
	6QtYzRgMekREidWKGNC427U9/XcpQnY1KG8aGUWAGtMKf7ynww78zLMzqmVAJsLbdO0F83uXVxu
	meuRRkA5q2Rwy+U+feiE7F29TavJrgkv/rFAJQnu6zZX24sk3vRg43sl3bFB2rUPLz/WTQSHWIg
	8omGQlbmj1mPFKdw==
X-Received: by 2002:a17:903:90b:b0:2b2:6df1:111c with SMTP id d9443c01a7336-2b2816c33a4mr56769935ad.19.1775274380271;
        Fri, 03 Apr 2026 20:46:20 -0700 (PDT)
X-Received: by 2002:a17:903:90b:b0:2b2:6df1:111c with SMTP id d9443c01a7336-2b2816c33a4mr56769695ad.19.1775274379806;
        Fri, 03 Apr 2026 20:46:19 -0700 (PDT)
Received: from ?IPV6:2401:4900:889d:bb8d:7946:a891:556a:a3e3? ([2401:4900:889d:bb8d:7946:a891:556a:a3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979530sm70196985ad.46.2026.04.03.20.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 20:46:19 -0700 (PDT)
Message-ID: <75c2c49a-7c80-43fb-8c6f-67771bd2c786@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 09:16:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable cpufreq cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        aastha.pandey@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
 <ybptzcfs45xn2tkjm4vzxm4y56bh5m6yuzvzhagoifdycrqgdh@hzvad3pg3dcm>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ybptzcfs45xn2tkjm4vzxm4y56bh5m6yuzvzhagoifdycrqgdh@hzvad3pg3dcm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d0898d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=t6jTbvqzZ6_00VdWSxMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JMJiL20t7ocmIxY-eU81nXZvr9xYXZrf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDAyOSBTYWx0ZWRfXwnV6jq7szYLU
 kmPPPQRrcqsTalvTdlEOm1DIpfPVLbolEFfkcm/ckOiZ8IKmKP8O292wreqL2aKWZcjNCYQwtep
 7BxTeAqJth8hwvycPshzToqHJjPHaq77x6/AfUMHLglzBEacc4M0VnAnTdcruzJj5u6lpK9XrCM
 iqLGwRDIuVbtNSar2lpr/6gKFoRY4UbV7H0LJD4R30kErvqEkrr/TUE+2iK40ttWQn2YUD4wGl1
 e/YM5gRargntWo9++WO4/5oZFR//0gJS8lkDjU2PdH8VKqAzQWU+anImADVI9gMg2XTv6SLZgBp
 6o6shYpYx/H9So0xUJ2AD61iH+mew+s/jBo20Y+q7/4jeAB52CunfhkVCGfxTh8eyUhF15oGVYI
 UIYfmcWcgRHIAUk+D8CdibUK5H3js1cYSFnxaiUyklJtE0Uho94W+OQhBvi/jGpcVoLE6fNnFEy
 qVK9CrAJEuxc2IpELVQ==
X-Proofpoint-GUID: JMJiL20t7ocmIxY-eU81nXZvr9xYXZrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040029
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101749-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDE17399D65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/4/2026 1:34 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 05:26:33PM +0530, Aastha Pandey via B4 Relay wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Add cooling-cells property to the CPU nodes to support cpufreq
>> cooling devices.
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

thanks for raising this patch, looks good:
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

