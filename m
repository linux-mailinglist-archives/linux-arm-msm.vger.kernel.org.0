Return-Path: <linux-arm-msm+bounces-113228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bbu1EDIuMGpAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:54:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9879B688919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:54:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dL70VqwJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cjTJsPVN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113228-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113228-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07B02304A8FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A01240FD80;
	Mon, 15 Jun 2026 16:48:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82140F8F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:48:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542131; cv=none; b=NodqI5lACvPGCJrtMcsXY3oNARlwD8iKUWHgLbsgtc7yXcd5ro7+RlxiS1rgzaAHiYOaVDVi6KWSpJAmoLWfczZtK37IMXOlECVISoS+hGMrkfIRLtxuYi5Kvhvy1LaWJFCCABLensVTs4/hD3YZ6nmA9e1MO96cddRfX34UXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542131; c=relaxed/simple;
	bh=+H7/xJ0u8V7rPds7nxD25fdyLiLvfaBeodi7R2CCUic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0t865zqWCl7rAzrFzKXsHk6naogOzwlHOaKEJPRsGE1c1IM8+4dmXUe/nEjFAnj/eySu5WwqKKlGzPEcy/65UHrAXUabxEqVjXFPeUEXHC4qRu6MWTqsc/m/KjCcxD3X1Q0Vq072qCgaoMdcoZ+aHSuqiMRErQxJw4z62Ajgdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dL70VqwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjTJsPVN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhLbi414027
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIMuXijjjJTR3EDSM7uSnEsn4hZwcVL3x3B6MRh+Xg0=; b=dL70VqwJXdUke43b
	ydmmbkPkFqYanETuthFSOiaCR+Q1ddqw2hmqomhOpdadgiZd3bPcMFJz7R1xUqoG
	XUesiJ22mdc49yfrOJCYXF8RmehMcMzOQy0OOwae+didMfTWfXht/zc6zixmQB8J
	CeyEEOgyrZfScyt4skBDnoxWXujKBa7B2il5LXppIM7PyUQQwQx1aeK5uA7Q3Ca5
	gxh1I2EaTo7IMPSDN+aSmUPh6KO9gwYBWg4WjKCegPSS0D2WwlZbYEQTNiD1ZhUW
	o/SCteqc+99i2Qhorf3rYplnRUXpNMrWmqMDibCaGczjAfYXePQ+IEYDInRDfwS7
	Fc97XA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter01uej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:48:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccee12a34dso8193056d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781542127; x=1782146927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIMuXijjjJTR3EDSM7uSnEsn4hZwcVL3x3B6MRh+Xg0=;
        b=cjTJsPVNsY7QSp7bnL39pgREtMSwvhyEh1+TiaoYGiI87R3d97IFF7oXqIFegB6Wec
         D6NuzJOLCXdCUPB5kMQg1hA8VOhiXVjCOnhkGySWZj5AOcDEUUi+HZD0NfIS6dz3EeEa
         ZV16LkoVhvsvjmHzueC6i5hf1DvQCC2p+AfElR8hJJ80X5KfSQC3CE+0y6ZObMSUJJhZ
         ARYw+kLtqRiX3dYy80bz8lyouzkLnUZtL8QmeQu0ftU+CTErcIfrkf9b727WqevNe65A
         rwmbua5S2VWkl4InjmmgeR5ZIVsRHzTfWPRTxYDcUji0YNc3BBI/DLGhGmGB5ESHuZtY
         W7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542127; x=1782146927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIMuXijjjJTR3EDSM7uSnEsn4hZwcVL3x3B6MRh+Xg0=;
        b=N731TwCVpk+bLLRRbx8glZzwiql6ubk1fKWSKGAOLzBFMgeIDFm3HDE8ng03WE2oZm
         O+T/QeIo9MOypfRylF2IaB/xOrLc8/YmEQ8Fglf0LqiPxl5Cp+aG+JesV28BqmwDwRiA
         +ec4Bi8Nt/nVJonfKGXs9BkGajiZ5HJFOJFHtNHvtd7ERlR6snlT2fmmUbEnFsJTjfl0
         d8PGiYBSxrpAMl4KxTKAFyaMH2FGDhqEezAx1SLqUZJulpUAttwJFWWs82GkQqTOaFQU
         85GcF5xhJTi+tewOfGlZ3PErtN08RgNxBLEPXw8b2k5ENgPuQT6aNUzRQ57A4h0NCw4X
         OMlg==
X-Gm-Message-State: AOJu0YzCx5E4wbg+ErYmQZby6F21kMK7e8ZbF2WIk+17VmfRlfhHVZxI
	XaACVv+OeEnGTvakSAXX5hynOnl2Zn4yQrAPgu3MNJ3BZ2L6gb1//Bk26COfKH8tF2HOBIgb85z
	8/k/+ZRvA8DbGYxn18tRPFrfolDmLTLXNIu08xIfvlLItK20D28hyRVPa4H4It/i6VSBT
X-Gm-Gg: Acq92OGi/vQWzGDYYKYOHsHDlCCB40+5lLssq7kZu1Yhfyiyuns25ADhYiwc7LTOo1O
	yowicb4KeQUCjqISfd2Ghqem3q5hJKIHIEVCZJznXb/ieatUxQhQIto72C5exxRLJ22SLwU3dzy
	wUquXc+fV0zs1ZHJxHUf0/0JBW3VJu0T9ZPMX/WgeYM72dSQ6QHTrzn83LbxOrXxMhEXTetn1Tm
	NJxaDoNWrQ8o8C3BVXivNfVE2B3K6+TdGoKaNU9j9/a5WyhzGVtTdXYiajjye0QWjjt9BmpZ86g
	LIjch8ai1NkMcCptBAFG0froaSEwL6SMYV4cPJsBCrg+p9KWkY0MK4jZ8/HxlPJ70pbAy605FIA
	OoNozXzYcg3/TbPqgydm0Is9LCMi0iGAwxn9dTuwunKVJjw==
X-Received: by 2002:ad4:5ba9:0:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8d32869209fmr152792466d6.0.1781542127369;
        Mon, 15 Jun 2026 09:48:47 -0700 (PDT)
X-Received: by 2002:ad4:5ba9:0:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8d32869209fmr152791996d6.0.1781542126730;
        Mon, 15 Jun 2026 09:48:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c066007sm783581fa.18.2026.06.15.09.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 09:48:45 -0700 (PDT)
Message-ID: <bae5b5be-16a9-4581-9863-4ca4eca88754@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:48:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
 <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
 <831ed020-4a1f-46af-95c6-38ef1f875fd1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <831ed020-4a1f-46af-95c6-38ef1f875fd1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _br1GuvCnA_ZmXgKSXHPYa8wF6ezOm4t
X-Proofpoint-GUID: _br1GuvCnA_ZmXgKSXHPYa8wF6ezOm4t
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a302cf0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9RCi9ZdM10RZw5nSpo0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE3NyBTYWx0ZWRfX3mz5fCU5MTkB
 9lpnWcATmoJE+/d9qL89fp05uZpmAIm4k7UprmULQBTPE+09j4m/qRYUCV93n5QIrGBbz7AhccZ
 DJOe8RPQli46FGG6PNNDClFXWqprllEn1mhaiUFGHuq7IpqIRl/4BEaueqMty1mCOlCreugd190
 voLcyq33gqDVcZniCR+w1kfiO67FIjSCzNiAouy/R8SZCFhfc6mtnrDmAYnAIFgDh9YCYa4P4Ik
 6MONvKiYInxKlWlEPwvk62dXbuJ3ym43FQrGD8K5Ykp/BC2gU8wcSAuEvPlFmDKz3hnkVlSmMfG
 fipd1nN5rMkTM/xcpJC9s9t5xhmhNl9f137m6hosGorOyVuQx/MWDIVpC8jkPH1C+8T0jNvVlQr
 h9YZlEZJ98+l7mrMY2OAoTao/N0szZWQxbqtk9EA0rR687nNzohsnGCem+MYwV7fwySeANtSstV
 qA/IVTXoBD35/AQ/WNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE3NyBTYWx0ZWRfX3Yi/7liYrv/l
 0uSoSsu7UEEM1uscddvccrlp6hY4zQThJ+KsY+kXPaHfaW6ZO32mY0e9KHZK6Q/v+x6ea7wFBhD
 ymmJCVcpU1WVlkxE6ubQFnfYlPHiZ2M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9879B688919

On 6/15/26 6:39 PM, Neil Armstrong wrote:
> Hi,
> 
> On 6/15/26 17:55, Konrad Dybcio wrote:
>> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>>> Add macro definitions for virtual channels (combination of ADC channel
>>> number and PMIC SID number), to be used in devicetree by clients of ADC5
>>> GEN3 device and in the "reg" property of ADC channels.
>>>
>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> And what happens with my patch [1] ?
> 
> I had zero feedback so far
> 
> [1] https://lore.kernel.org/all/20260504-topic-sm8x50-adc5-gen3-v2-1-5cc04d6ecda0@linaro.org/

I think this approach (single generic header) is better. The existing
ADC7 bindings which your series draws inspiration from come with a ton
of boilerplate.

There are some non-trivial mappings in there though, e.g.:

+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)

but these would presumably be deducible from downstream

Konrad

