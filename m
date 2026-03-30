Return-Path: <linux-arm-msm+bounces-100735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF95FlZKymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:03:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD91358CAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60F7930166C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97603ACA66;
	Mon, 30 Mar 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9I+oJKs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fj1kw1BY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F9238838D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864723; cv=none; b=f0TMSwS+5clzuvJbBDqNQ73bZ1JYkV1RcJEwq/IaAa/EH+eYB+P5eKFEk9NVB1tya8K9Of8CmuL6GuJtQH3XvrCgLn8eLXD5H8wj2qn/5trNjAIctMcsiWXrumRqoS+HDb+I5lriYct4RSzbcdbNS1aIi+8xD38YnjX/8vOfFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864723; c=relaxed/simple;
	bh=AQ5zZCBFctMuFdmo63TC1vo1jqmtIWJOidKPPNByFIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVOV1rPycnl6pNVhRu7P+Jm79REtg6ahg0BB1ekYkNMTs1sm+CDRwn9+vvqTQF4nEsE6ntc3LQ3KT/YvBlisPazLiudcNtPHwBZdroWJNhaT4b6VsNULh6VSay6dG9oon7Kmt8h9+wF62i1XVcjNGe/Z+vB9Use46gokz+BL7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9I+oJKs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fj1kw1BY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7GwjN117364
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7B1HmnBgha59iV1OqCrllK9SWDLV5c1QoI/0DwOFlg=; b=K9I+oJKsxOTFHoQ1
	DhbZZSH7hIajFbxM+6Sd6f09FnSGL0wdXzdpwobzR2/EP9oH5l50lgYOw1WSHLSA
	7g6ar3dm+8gOWtLZS+nOoW0187vUtqXT83Dk9Er0VLkbVCrUQVLKjFzEkg3GpzOU
	ZK869L9/IEbjMWnV+umsf7TKOSbh1YeFyLM6oV+e+sb+iI+vFKlhRChkVJrg1S28
	dqpBFJXe/BUJ/WGCZ1me+zuJJUA/sWgkN7KmUPFT+FKPKfoZr4lKkTBkuZSTDMPl
	Le6See10BXzBPJMLmrzR5ZtmXu6FF5jT0oo81EGycTtk/nvssGt/3Q0/zpU9GIK5
	oDrykg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqekeys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:58:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so16136441cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864721; x=1775469521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7B1HmnBgha59iV1OqCrllK9SWDLV5c1QoI/0DwOFlg=;
        b=fj1kw1BYssjl476amgXqz7K0A2CzVubibjk+BTTgYaEpj98E6ZBi/Gigqkf9xAR5az
         VSlEZviQjgJ1IC0OFTS5u5fkGNSJ16oLdprDp3XXYjG4lsSCl1DEbXSs0vbF5SJY79L4
         ninpCMopf0qTq/QZEg+fWpviDX2PMNZ03sOA/5ILioFp0dfUlwTsa74CMOcM1EurLYOt
         pZmhsi5W7jsvn76VO86wDwVmr7ZgoHk8HauorVey1io/wCnkzaHZ0VymMQXDIurHNsrD
         PQD/+eaSfCCXMJ6ov7nMyII5ZG3JXqygOcrHfl0wlm4ciUcyCfxU2UZeGZv30AIgHXDi
         WKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864721; x=1775469521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7B1HmnBgha59iV1OqCrllK9SWDLV5c1QoI/0DwOFlg=;
        b=jnF7jdAlIAmt8yJI+dykIEoDPL7uapryT5uDKxEVahmgbOnQxWQ0TGCIXf/5ufLUDr
         h6NBonuYkS6VMAR4l6p2zD6FjU18QEzrFygI3lDgyZND2okp8P7VOUEVa2FgwzxFnicF
         d2x6ml6pUITbkrBMGzAJ548GmBgiyrnIG0jfXNUilTJSzddmKRCq2I6mzlO2b0TD3ORg
         pWhI75n3DltV8mxVmJgQUnniiVoe9VyORu98QHJCMx8UwUWfenpS0VfT04RpFgu+pF+V
         DxwALDDLZVQVtuTVLktGtMcL1QJNidnHar5UhIZ+gTmUl7RVQd5u3RrhJQaD59g2fRAU
         KtPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe9eGQHSilHYJ3MSmOA7q9O2q2DXGxhxA4Buk27WpkH5qGzVo9dtiYAYQ0bXqDvYw71+psX5J+MJzEFa/3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pujfpxwDRanf6DCWiXGHCzjLO/cge1gnxyqyguECB5WsEOd1
	0DuNKZZco9cqz7PUpBhjmK2YTOv59OhHkBEScUBrUwebS0AsMqtBRcrC2WmpyspBasCs+k+JlZO
	OpuW39bI6FM+RCaRde6186rO+Ce3J1vV202ZQXZPYo1HTZ8CXRfwS3L5lX1WYDuCyhcTl
X-Gm-Gg: ATEYQzzzZyTA1MM5audxdKkzq08Cea71BzqcQF5O95EJSDnblI+59dAr12Yl5iJbecF
	ZnmIk7k9a3b4P4fXyjiUjjNllFQfmW1dT4NCE9pS82rlzGAC9BGoIIUx2ENnUA1FLQE+HjPrsFj
	cs8v8tj5le6574hYEyVss1TrCFwoCztCwSwFCA0gayb9rISowXWS7BwTBail7pxFnTuvs55sF5N
	3HFyRGaa+fWYYTUt9qylNHSQ65x4Z61rx0k76UG9GxaOV5I73+yZIlHyyAY2MNVijwd5Sce2mnb
	gyQ3yBNXY9n1iF+dxW2isGNXCnWXdBx2R73fAtmto9e+65RIaDiEO1a+C5zHSCqUWUvAvinbd8O
	p6WhOxxW5wl7UQEJ69v/W1GM3kHK9KyypMztjYJT2NZS+chsVkcRN8qYpxo+RFIpa2kxqZXApgc
	PB2Wo=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr124545191cf.1.1774864720953;
        Mon, 30 Mar 2026 02:58:40 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr124545041cf.1.1774864720545;
        Mon, 30 Mar 2026 02:58:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fa8sm270436666b.33.2026.03.30.02.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:58:39 -0700 (PDT)
Message-ID: <652b6ab5-42b7-4a3e-bf42-1e3e4f79fbaf@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:58:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca4951 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KTGCzzMXVDWUBno74jkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cLxZQLlcYsLdE9XJBR_MY8R_Njn2aMX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX6JLb52G25DGZ
 XDHBi3NuwrbVklAg6WjWgL6vFhtk3fctY64A+KH0bycBXMrGnmwLgOaxuADDaan988MvmuG0Suc
 HS+/4wX+itQmSflJj7PUvpx8vZLBGN4fhS8fImXOVI/Jf8UhGaE7cU0NlhcpjfCzElypZon4IHJ
 VZ2dk2LJY/FHfJbRAlz9jMfxTDOQDcjh47PLOuvEYjl/En+az31KPwJi8W63ICIObK3B5nR+qS6
 VIzxmWcdw9bjXhpR23Yk3/PzGZNCIUY12e49wFgWSBZ2RLWY9QdcxRmU5vcyNaZ9Ao8EIeaxx9B
 Ymtb8gZ1NWOudwSaAOy5dlv2150VyK3P2RDZckIcr0siADdfbDZT4K/Z5so6lCngSjmtvgYl9B5
 RboFAJDJn0d+vch8ayz63/gDwQc1rxyDxe7WtAlf0+Gd+KTrByAxyKKjbHgvYTSfuSS8Mwo00kG
 1FcwkPLDjGA0ikzy0LQ==
X-Proofpoint-ORIG-GUID: cLxZQLlcYsLdE9XJBR_MY8R_Njn2aMX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100735-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDD91358CAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 11:39 AM, Jingyi Wang wrote:
> Exactly one space is expected before '{' characters, clean
> up duplicate whitespaces.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

