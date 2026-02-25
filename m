Return-Path: <linux-arm-msm+bounces-94046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCzJCc+knmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:29:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD219370C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75209304D4BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296AD3EBF3A;
	Wed, 25 Feb 2026 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+ckSWzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AM72hXJH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023722D876A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004083; cv=none; b=ZG3Ut2a8vS0eaArNIMUlZ1ZPDMar4W8RsQgFfxL72D3PXcYq+etZVZs1uKca9G1auJwxr4YDo9PioqK12dkIWYyRgbRBTY1jA1/LQEOY5qKE6pKM+Qnm1HbFQZHdJsB9xuVop7bVkEv5pDWMp/CU00LrDrEES46kMzt4cE9Qv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004083; c=relaxed/simple;
	bh=SXGrHfYGpnKlnB5cx1WRRimppH2xErUvy8ZajFe5uX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sae9ME+WY25VLDvgXig/O1aJN6Yw3PXU9dP1moveucjJCdL47tLJRzbaJN3SjZ90HVUqtbD+ubpo9I5JAKGn6Y49xejMiRDmVSi6jT2yf2S7w16NhDAhsJqcEA9jItYETljtulJQ+50+ZstS8iNjbONnHLU5ZFpTr8I0KpSVUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+ckSWzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AM72hXJH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2nKsW3660089
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyqBXnvRENyJjfa/hP0ua/tVCf9aQxn3tn6/9tsNVKs=; b=k+ckSWzNiDBGpJdz
	TjcqYDz6mdxeW3144wHmT25KmFC6TEak3O1DiwY17BzkNh1WBBg+YZlM9uofuG9n
	1nGvBoc1ywzujMzN6uYU7O5OO0hD7fPPT5VDd/Szr2XAHqcreKcnvEJtXjyfcaf4
	1q00uBB1QLkML4xfN3NbEv5Y21i9eD8TGfB7qMm46EWFMWSoWlyJ/T7NDMjyD3yO
	qoL5AkHgLlFaaKji6+5tl2IzgRqKwyFsA5awyDPOBKOPIUjDCcDESnBhhsefy9WB
	bt1NXVcLmWYOkkU1xDlpJCAtvWTWKPAu9Cxx1ngfeHf63VQXxva/hMGa5Tvq9Y85
	faEGCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1saank-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:21:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e5e33ddcso1399645a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004080; x=1772608880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyqBXnvRENyJjfa/hP0ua/tVCf9aQxn3tn6/9tsNVKs=;
        b=AM72hXJHzkSJlYwyQ4JWpYgYRuMi7wc3QE13BHyB9dtTsWZFkNZpZF6pnTUu1dw7Zn
         SFrAbNxk+CzYYe5kg4xVuex/ENfOlJLhy0hYBWrlvxmVMgSWlgRHKP1BvVDXGQVER8gP
         i87hCNT3iqszKWoyxJrKoogrOfVFEaIr55foKWpssrtWcQIqs7ZWkTtGld5gy8QvQIoA
         +5vztJ8HWLVaiZQfpMAg462lMWoIqJLYZkj6NsFHV8vL2xwssP3JfJekO63Ibqt0xBEs
         KfevOQ2wiolx/V32FopszHh6hdEe7Jc3rv0I09Pw6cTCshfDIqDZW+dpnyBJY1oicsbd
         MBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004080; x=1772608880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyqBXnvRENyJjfa/hP0ua/tVCf9aQxn3tn6/9tsNVKs=;
        b=ADqiMT0rjGBd2f++k5XGSeYUtJ8lRWpA24PUsBraYLY8qihBjHfcL7JHuXpnoJsrHZ
         OEYjsf5CAd2zpTyrt/H29oKM4ncWdAU7KncEICnW42uNs2KqApy9+205qsFkc+bMIu1Q
         HEfJo35w4pMKc8el6hVkSPT8eDtsFNkgo2Fn25QfY6jmEUx1K/P30JqirpAfbJ/mcUVi
         YTFfugpsz/8zS5kMAJAIvc73ggau6FuMunff7oH7tX18NdJrttZdzxoi7W0IND8KmL06
         HoZwo36wUR62wtJxM4TiKM3SmAdOg3T35i3ke2mO6su9ys7QprkkLPYUH/yklgSX0mZO
         RmZA==
X-Gm-Message-State: AOJu0Yyu4vo+hmqnqN6K1VwVLznoA3Iw16mk93hDHZKXRplg6K966e1O
	XDZ77ZZmPk7V31YpwJOggiLmdUnllDLcEDI//R8j87ZH//NRiWIRrNiqLgiQC9x+tuTDPYv8Sxq
	5rKn6UDyhyHWY5fmz0+ueR+3nLzl57TgUQbcLAetcJdait+YJcczq5BJV6798GtG2GFuU
X-Gm-Gg: ATEYQzxyJEkxG+KTS02FzVC7gIYlfqgCGlqCEulWDWDrSIccT83HnmGeeRnDxS6YC7O
	9uBDbJSrKdt5pkaZIHxHUk3M8n0FR8RzjoODfA4Aihiu57z25K3KlXGMf/rHLWXnlYGJ2ghgAED
	UKrULZW2rvv2PsqnsqODFb9tZFKdTTxeZvdLR3GbUFyFgscQdONy4uidOU52Q12GbHM4ajmPOzM
	yPp5MLD194VWJgViTfQK8iShqLQLQsr4z1LVJJ0Pj5Est3nh3EHuxm7oQL5oaFnVYIAJ/aGh01L
	g4a0jO1lABk+TLXX3/7KSZwwn6ep1lOxXJfmzlaYQa5N1hPSSzF+j3b94htY87hfD26EhQIBWE+
	z2mcN3bbKAES90Rj+ZHXerr55J4jlbc7YcX4h2VMeK1UUaJWQLxkIcQPihjAMfrPTXkiQelsyr8
	t6IExD
X-Received: by 2002:a17:90b:2812:b0:354:a9f3:68bc with SMTP id 98e67ed59e1d1-358ae8e8390mr11691750a91.30.1772004080543;
        Tue, 24 Feb 2026 23:21:20 -0800 (PST)
X-Received: by 2002:a17:90b:2812:b0:354:a9f3:68bc with SMTP id 98e67ed59e1d1-358ae8e8390mr11691731a91.30.1772004080064;
        Tue, 24 Feb 2026 23:21:20 -0800 (PST)
Received: from [10.133.33.74] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912e19c4csm739217a91.0.2026.02.24.23.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 23:21:19 -0800 (PST)
Message-ID: <d9790125-d39d-4fcb-89d8-705ad964ebde@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:21:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
 <200b055b-7221-45b5-aea1-2462e07a3c1c@oss.qualcomm.com>
 <8dbc18a0-6a64-491b-84b0-ba220c9050ac@oss.qualcomm.com>
 <ece590b8-9a29-49f2-934b-6082f093290d@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ece590b8-9a29-49f2-934b-6082f093290d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ea2f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ywmpiw0kLQgVKrmd7HMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5Jp20jf4q5QchH9ppz54o_SIvHuIFSPX
X-Proofpoint-ORIG-GUID: 5Jp20jf4q5QchH9ppz54o_SIvHuIFSPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX7jGpPp5jLwqj
 x2YT0hrElvtf+ODrLtJeiCRP4DdSzRx+wImEnbHvtS/OKwDSOw1BgC9IFHhejA3WTTPw2UmXOqB
 9UWF1zOtMoYDo0XGe2Qy88iqtRoXQMWxB8sbCO8YwwIdKxpQYOybYwqroFvKZHJ6RFa4u+iDfd/
 2acHIiV6ma/I9kb+JBNLNyVvJlqnRdWkd/VWqqp1EIpQzgDtlP9pURYJp97AenGsAC71GFKskmd
 0w/M011MY8f9UEqLvmVyvzJu6piQv85obJz13utXDQexKD/JHdwvPvplPevRYbJAQRgV2/IJHZJ
 novcuTTnDqJZsMtYnC6mpfN2cVHzHWYE74tB3bL9R3W7WTZix3EGfhXH++t0cxehGqpn/u73s1x
 xwMb6VN6EyPOpgwFWebDQRg+G8Ejt2sRCVee8fbHC4vXE5fkrdDGBxuyvpkw7pSGY7QnQTFj0Wr
 KngvYPXQRFly9rqY6xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94046-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46AD219370C
X-Rspamd-Action: no action



On 2/13/2026 7:14 PM, Konrad Dybcio wrote:
> On 2/12/26 10:04 AM, Yongxing Mou wrote:
>>
>>
>> On 2/6/2026 6:52 PM, Konrad Dybcio wrote:
>>> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>>>> Introduce the com_ldo_config callback to support per‑PHY LDO
>>>> configuration.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
>>>> +{
>>>> +    const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
>>>> +    u32 ldo_config;
>>>> +
>>>> +    if (!edp->is_edp)
>>>> +        ldo_config = 0x0;
>>>> +    else if (dp_opts->link_rate <= 2700)
>>>> +        ldo_config = 0xC1;
>>>
>>> lowercase hex, please
>>>
>>>> +    else
>>>> +        ldo_config = 0x81;
>>>> +
>>>> +    writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>>>> +    writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
>>>
>>> tx1 should be dp_ops->lanes ? 2 : ldo_config : 0x00, in all cases,
>>> I believe
>>>
>>> Konrad
>> Hi, here i want to confirm again.. In the HPG main link brinup sequence, it not say write TX0/TX1 ldo_config based on the lane count. Only when we switch the lane mode,  the LDO config will be updated according to the lane count. so here do we really need this condition?
> 
> I don't believe these two cases are differentiated in your patch, unless
> you're trying to say that the hardware is smart enough to turn off the LDO
> for TX23 on its own as we switch modes, which I wouldn't bet it is and can't
> find confirmation for
> 
> Konrad
Got it. will update next patch.


