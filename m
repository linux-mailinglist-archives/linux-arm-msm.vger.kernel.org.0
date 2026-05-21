Return-Path: <linux-arm-msm+bounces-109022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HZuDKnmDmopDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:04:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 722C65A3BBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D49A30F4A70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57C73A59B3;
	Thu, 21 May 2026 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osfx2gUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLBQ1h53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE453806C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360196; cv=none; b=BqCEARy9BR0XhH4Tb7jI4gsgA9h24F7fuB8m8bJxQEmSHWpM1wQFPweB/FYj9Ap4vzDYpArT6XV5ZG4qLS3jSwKDj8hBOWpkIWLpUyl0u7rafxIBafxDgyRI6hoz+wiXX5Ivt3vB6WgpK/6C/Z1/ZzDFZnFGSqLhBY3tRlzv77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360196; c=relaxed/simple;
	bh=hsa4aN1OjCTgcLN89rqmUY9jqVcWI7IPnlOBnalfgsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xn91RfurJoG4Vm6XfUfRZoxr2FDH4if3zR0V1bbI2L6R1LWvEZXMKXID7Vj19QvFqX41AhKj2OiVie8z2Swp5aWfgJOpadK/HKXt3El7yDYjoV99gCvXIVoN0/nSuiqNHI1XwNUjG3rSdy9VInJCB1bpOj6unUnSus88/VYoxKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osfx2gUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLBQ1h53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99pFc3451454
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4heBt5g5AQqQzquwafYFUgSu4+erjypmtL5Y7422RIM=; b=osfx2gUub3iiyDog
	JL7mJmurxRJaWrWs3ehfvIk2gMTjnlPAkKmJbAbhC3e445p5UA5DMN1SjfRmLpPa
	myyqp273iWGYMBKP2NXW6ZGeE/54x9Bn5EhsjUuUIVYPDCyUXz4IsJHGZsWv52lD
	PAvRryt9kvTOYJ4AfBDf1xP4oROPxso9yf/rJSJZgMtPdbjH/d0uwvdKssKkcUNL
	74rFMDjkv9Z+lLmQkgTZgIBV6kdZ/fBF5GaDdXx2lvPywQ2gKSc1F1DonQ+pWXzv
	xX2A6RoLiCIRASu1qylbPrb1qwbvd+huupuG4oebWGXe4IhN0PZLCkAFL++/TSjf
	R5IRRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8e4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:43:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fad7b0ae2so20717821cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779360194; x=1779964994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4heBt5g5AQqQzquwafYFUgSu4+erjypmtL5Y7422RIM=;
        b=SLBQ1h53+P2lKzn0IexB5Xl1NYez92SbDoHudN6EFLwcMsAwDw2k3DZ0kvu1sikUJ/
         QSgR1plzttu1tZ9go9O8mPwV0gx429Yk90ZT3G2ybK7WYj3mp+uFlWtawb6YDSOmisgz
         HPGi7U8QTiXFR3i8NQ0lyeSAfbHO/u8o2/xBy2iaUY3HlM+dlLzVH42B8vewOa0r85u7
         pL9phlHmuSq7Q9l/ZlytzO+4FJvNH4+rU7o9Ul4EONIcHRu8pxlLV05Kg/OSSpnHOnd7
         ffvd2C5yZrnLvDHamsVmXXBp1eWslMjeEfVYqdeREgPIX0SRHq3oiMVxWDaAvPY0asDK
         bJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360194; x=1779964994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4heBt5g5AQqQzquwafYFUgSu4+erjypmtL5Y7422RIM=;
        b=dD3vEH+IL3OSBieAk8MYJj4L2bGY6BWzz9RjsHHxFzqAW++ge+zSK+crdRQQByC1kd
         PR52ay0rrKDdaFVKMkBx5ghY8JTEIn+8As8QULBOwbRDZ3UNXqN5cFGbayQtCi2vbQj8
         eEvlhrT7UF/bSYuvK3KAe7z35xGzHQjqExr7fp67HevSVDn5RT44bIEKsBAAxc6/hKcz
         AJ28B4qRD0sjZ7WdnldW8qzyluA5p+3trbW1ZVlhIX2x+S+fdgAGynOpIH78QPGxxPTo
         MpZk4LeDsgHSMgtW77bfrd0e0AmkhKupijLkyvyQZy3jUehZSO5bjBAyN1pRUeOrT2LX
         1dMA==
X-Gm-Message-State: AOJu0YwWJ0TxtF+ZE9Oy3Um5rUCsBu/REBY3JjtKgcjmtA2Mp0oBBDTu
	1LLB8BzX9BK9pSBVB4Jg+1a7IiZ/gxe5CUx3dKOEf0R61i2LFYaVzhH4KbbGypjTOgRJ0j+8KjQ
	Exq+QufCN+x4SuGs9LaGlfuHnWGYrfDzbXlpf1yE1eWEv8wGxodgOVc/9tycOIx5v3g5R
X-Gm-Gg: Acq92OFRfXJHYl2y6m40XlQA/Lf7eG349hZ6c80PsES4bvDu2qE80uTF5a7gFE67ccH
	zldCibuZT/jVwL+6jv0dcYM4koXGpk41Z3sd3bX1lj6gREaqDsMFjJ44INGntPRh30VYH4NDx4T
	oZFv9b4vw1Hh2zWtw5r1WVYbRIyJzlsIMFTQsNhsdZw1dZWLiqBUmgMCr8ri0huFvRfIXSN9VGb
	mooEC5ZLo4uAVewyfVkq5HxIJ1357XeNFIve//cQ2w/O7l3IUEDv6GVUvu9a31HMlxgWqpqpY/k
	JmuQLfFaB9/xRTXfAT9MBr9lppIfw1GBYl5O3hvQtHCjHE4whUEgmXGxxGpyoBEDVxMPmuIjgZg
	4mXxRxDkGBtTrpT9dbDjy2hIAWduVHbrREmaN1DoCEpVTp6MF0GPZoCwP4p7BmASXKJnSBtFD7K
	xCfmw=
X-Received: by 2002:ac8:7f0b:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-516c54cc4cfmr20463081cf.2.1779360193722;
        Thu, 21 May 2026 03:43:13 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-516c54cc4cfmr20462861cf.2.1779360193339;
        Thu, 21 May 2026 03:43:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a40e10dsm28729366b.39.2026.05.21.03.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:43:12 -0700 (PDT)
Message-ID: <07d43281-a14f-4cb6-a0fc-8f32423cd78f@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:43:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
 <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cGTyaU-xEq4FwDPZpWdp58EVmW29u178
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwNSBTYWx0ZWRfX6baIIOvRgRen
 ITnaW204SdvvQfRtIobql9916wx0hjSvhcyM96OgBxzNFnQibK6ufgiQezdBTLiLPeDwF1aEs7e
 HYKOGo5YPJc7BbeGucggQ9/SKQEQE/hDDAliPn6ulc/956l7IB7SveBHnZhA+3l3h8jlfoHynnk
 dtVOnvea2psPEloxRN4Z3PWY2v4FqpiRVlxvw2/ge79mBmeYs7+xpbjr9BIKhvJisWGR6yzviCn
 91qgM3yHMkVu2vXiyvi2RMhD9LgoLoEoAoadDqQEauiJcus49Yus0uwP1KpXgxoJN7v6Rj6F9p5
 xwMSuY8lrzcURGYS/vEqBNCZQa9LD4CX8lOWWQoX+dWcQGqnoii5R/XQQHnPILL5aXL9LRABnO9
 lLOsjW6Ygl7iPFVNxqIG/U3Sbah09rPpxTWo3QgMJP6lRl0CVBiboNAJ65Sl8BRo4HV0LJaPjnd
 UH9TiCUhCkLKB8lznVA==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0ee1c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RSJGUZsyvqJUkUdntuoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: cGTyaU-xEq4FwDPZpWdp58EVmW29u178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109022-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 722C65A3BBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 9:17 AM, Hangxiang Ma wrote:
> Define pinctrl definitions to enable camera master clocks on SM8750.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

