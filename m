Return-Path: <linux-arm-msm+bounces-99594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFP0IIJdwml5cAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:46:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEAB305D85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2852B3212CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD36737DEB6;
	Tue, 24 Mar 2026 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyaXeBaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7ZsUmIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0A73DDDD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345243; cv=none; b=oFJk8mF3vLhDhlaRwzZR7OHM52iWkIPC5xohSnyleHVgq8Ev2r+/7wwloiSSRieQn9q8Yw4FUo538SDxfVK7HPzNHdg/y+xJrrZLlrmGAY1RvhyZLOd9TjxZqe4ymVOnA3oC666Z/3KZ5GKW17MNwlzSQ8/yF64JujcBJ+3xkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345243; c=relaxed/simple;
	bh=Q7kecj+H8UdwEC1erd4Fc8Hi+m8S6ZJDQiN1zTPLdI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBigqmuK0eNFXS90RQQhNHaub/qvk/A7JO74j/nhqv0zBhaepef+gT6OdAhcOFBMUynNPSBr5tRb2AK545ImqaAev7BkkpS/pmwmT4RL0kDkbJp/Z2ZJBcOy5s+iNPCgNIZOqvQp5O/zTuIqpVHrJKQUAaakOYGdOE49Mtnj5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyaXeBaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7ZsUmIs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3f71k3170725
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4a38voHcmzVZ1xVQXEH00EB+JiuYUKbxJzeI96p6O8=; b=oyaXeBaJFoIvFF06
	2b9aW9ZdLtIgog+hB4H3WPpW9nzqd+LkEzcwL5j2xTPMtZftloXTshzPMaGe39uo
	G18aySG5kKf2floPgOHUsrmRlS9TYfz8l1F4P5jtMeVIESV6FiCOOdZp5Of72trp
	P971Gr9x9Wqf6kvdu38/SbRirDhPs/xaFzDhQjY9xhyYTdgMl3ppMiye+9BlK82Q
	k4HfpEdiUoGdiWHHnxmvw2CfX4nnK6eWjhgdzxJdCLhmoHxib9GfrDcEKF2K4hIS
	5zDMKQgI6PbedLvKKDlHFNjYrfg1bIdYfSW3WjXxeQa8lOdYPCszgQLzeaG3TjH7
	zucq8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2423r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so49624881cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345238; x=1774950038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4a38voHcmzVZ1xVQXEH00EB+JiuYUKbxJzeI96p6O8=;
        b=V7ZsUmIsF5+JWVOkxZysz7nFovd8/+JvU0s6YcRcsMAVcHd7i4m8/XJgCzbLbT0InC
         D8u+o+1LfEptd+bPQPkWHfp1vddykplnO+qzRVRfybNoHZVgPkR4BDHfvQzpC8nL2lv6
         XILNhlR2H8rupiltb6UGqIjACVxB7gUTvT+JiyzstdvOlx4F57iJlV0Ul6Cxpi5ZM3gU
         zkTswtmmm1jXFSn2UA4Vhp9EUiygDboi7YSG78KH48CDbdJ9VwbKAr0ZwnP84XC+sYrP
         sONKXL+0AkVKADs2Met/Xq+dUHDP5zr9atFWjFufCZ89UYqtII4PpPL/39kumZf47lV1
         aGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345238; x=1774950038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4a38voHcmzVZ1xVQXEH00EB+JiuYUKbxJzeI96p6O8=;
        b=k7TNNmcV8nHOfJ6XdZJSdJhAQn0q8x7OBEOF7UgIReBs6gxuQpk/AAnU9nHf503r2x
         +L0WTi31NL5dSiZV7K6fE47q2OTeN38PHYsLmvhIP0ZDmLqPTwDObv2HaRzrtvyaRStv
         i80kOXZdCADjPRYiJxBBnLO2Jmr0SFNwnMncZyFcBxluT44bPFyrsdao1iCkchNF2ZOj
         /NKay5FJi6qbjplJxVuOykxp6xyToA2JHsUdS9ZIuJ55vQHAOWFLk73WNaftQ4UKhadC
         FFuQtu8d99kisNsjJbxV7NBtvLvEY0YykwzMvtlrw0zpqe9NJ+3yqVuRta2/rad36ViC
         JFQQ==
X-Gm-Message-State: AOJu0YyK/NvWkG7KBwn78VbfoFvcxOl7Nns6U1XB2E4/zm7C6UGOkWDg
	6yUoSKHJ7FnHgC0sMveRf5WbehLDTqYX1iMHr4pqBbJ0yfyhQv9nKTax0vaLbkosVBLDZxv+PR+
	UCpGnbdewBVXLX74QGVtJpRUxCimpjWfvnHLUiO6Z33KyRxkNI+NDPmxdAqrj4vNw47pg
X-Gm-Gg: ATEYQzxvqQeUJL+ftT3ke7OJZUpBGgWL55AbmnQ5OBpSgUxfE2kn/GaAZ7bR+b0d2QA
	gmXy0qeiZLFdDf+zv4D/H+Ro13nI6arudUz0uMVAHhFYD2UctXkLjMfwh5j49RIcAZNUNEq1HV3
	KgSbjbDnEvGhzJNH/DJb3UU0llW0s8Cid7PimxYSzPN8DK3LKrfn+vUDzv9gHeukf7N4EOernPP
	h723cgxvZhX+kroPgFBGWYRPsE+TuGG5CpsMWtdq95CFPoezBWDTwg3RekDyL/2LqveCFQfZW42
	31P06glU6kUb3Xskp2KvfUWaJ15BUUlQ3kAqzakYTer9EgHQV+TqpQJ1pHK+vhWwY0ktOLGxXme
	c8cfNwOcSwJMHbKqqQPWNg7Ia0ytxbW9I+q9W/7cR7l6VY9nYCVGRDLjj6TgDdV1N1ZCefWfEaO
	+PHPs=
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr71180771cf.9.1774345238153;
        Tue, 24 Mar 2026 02:40:38 -0700 (PDT)
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr71180551cf.9.1774345237637;
        Tue, 24 Mar 2026 02:40:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c16csm615966566b.16.2026.03.24.02.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:40:36 -0700 (PDT)
Message-ID: <fcafa48d-3813-48d1-b8b0-11415e93aaf8@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:40:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] interconnect: qcom: drop unused is_on flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-3-527280043ad8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-3-527280043ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c25c16 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=k-kk7C7g4wtHnpuv8VcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: DsDbT1qWSi7VlblubocAJd2CBAD0111m
X-Proofpoint-ORIG-GUID: DsDbT1qWSi7VlblubocAJd2CBAD0111m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX+salTHTDtwAM
 dCRqZUxX2JlK4gA7wdg4to3/TOkW+qgwUwMBUBm/ms1tyWaWdIEl7yxd7oL5eJxZhWvyd/HVcrP
 auPzfD2fRosB8QjtVYX0IoJa9j/FPJDI2nOz7Waf2QvHqQKQw30qoQYwlQ+Q0SNPKV680nZh9Ra
 4Uhyc/PVl4E6Yu4IMmqLwjjqPKR/ZChMVAi+/biq6GifPukM7IG/kVM2/oTBAxEeqEiG3GqkoBi
 Fhwws729zn5UNrQRa7aDsKnEV5Zq/1fh5dChfqeJ/8GTl9murHMSNCUuiZPEFvX3I5oSHPaoo7B
 SPMY3so5NHtNVpuWsUxVqwtoM+68YXxoB1mSy0CSQAyy7krERNHLtOFJHsnWLt/BcNTNuUKAYyb
 Xcdh7iC1W5hsszbwAIgJy54DD0IP4gVGFzF/5aDfWN1jtg0rRMoEAoBentjKebyN+MnKX1B/HEC
 PX93h+XOiCZhOxcTJCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99594-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DEAB305D85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 1:10 AM, Dmitry Baryshkov wrote:
> The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
> clocks") has added the is_on flag to the qcom_icc_provider, but failed
> to actually utilize it. Drop the flag.
> 
> Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

