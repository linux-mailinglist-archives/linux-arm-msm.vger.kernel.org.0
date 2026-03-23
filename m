Return-Path: <linux-arm-msm+bounces-99210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FniKVcewWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:04:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A72F0CB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC7D430A0C68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0582391E7F;
	Mon, 23 Mar 2026 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrwhkHJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuxQV7FC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D07391E57
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263476; cv=none; b=kUvpa6Wj1e8qXMr0nZhY3/FGLx+9UMQqylk/bn4z8G0fsoeSTj0z4Hxw/5vu8ePqFlj9HuGEx7G9Nt0FKcdWze7Q2G7AYzZuN8jr3nTwAyZuZgmXDVdjbyo3C9uNvJm1BWICI7a/Z1WKMg8CkKOd1x7tsFSLIU7ZfJqcUUrXH/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263476; c=relaxed/simple;
	bh=/mZGsh1xkiPR3p8xvGVSUGgB/QMPQ1B8WN0TVuTZnRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBsr5Az2fo7iqzQ1ESLW1BtF0ViA2uBnISkvWYRAISFQNzR409+CKMqUNVmTAFa+YHefb/aGodfE9FI5+fz+YDdc1IdFOSTtUWSkiHAaBYeJnCts8euMm4eV6daMwBZVYlXhy961Pc4IEepKxrLVqysMqmVAMHfbiGmdjxzPCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrwhkHJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuxQV7FC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72gAj4138099
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMUrSOVeDAhPlf3XvTZybFu18sRSydomNUdVxKEA3CY=; b=jrwhkHJTcSOoCWC/
	v1WHDI50yFx6fUpR1R8ARd5bXDUlOI6w8CCpXxTfn8UOmZR4oD4QY0FaWSOfR+6O
	lEzofxDJYuE4QqbXOiufolOUhx76Ri6zqDYvwVVEn3Ht1apjzj2xeNazKERUcqRg
	5wtUirZsTA80ydu6dtHuK2ygekUv6FIbm84+L1M7UWpYgyfHWSug9l2RPF80sgV1
	0dJC6mxbbAb32zuTVneyJOeMJMCVvWAbGkUr9Yua/FUo4L383VBZ1PJgv7cfx3ux
	zpS8SOaPwj7qWGl/SoIyTpenvZMyCqMNC6C5VqeNIDrc8/+G15eewCsNIFT35ItP
	sCy9tQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e569n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:57:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c5014e220so31696766d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263471; x=1774868271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMUrSOVeDAhPlf3XvTZybFu18sRSydomNUdVxKEA3CY=;
        b=LuxQV7FC0+Wlx3nHrKIG74VwkXemqGfgEOau9SQLJGrdCBO4KJQC4RbMpsdu4e5s3M
         bNBOjoBPfvGdhajy1W+/r5VF1d4ueG0PMTdvaNLiTR7ccAx+WqDTnfl9KV3JrjPLBmzi
         eJG2Qg3XhG2FUA7Y3D/9RcPvbrvvjSwsvuXG2xUTPYUuLdmkteAOr4gVfayQrA9n7GdU
         Oyg4cLBuNTkgMFW7g3X7Zg18eX/SwgUUGhM2ItodJRisvXRQXy3lYOgM6L6vLf1K9Vmg
         W/yOxVDCv3cBsIZ/9Xw5HOGmend/wFHywmD5Tc3/eqiHqOXP2nQJoj5RilEQuJVO8xP6
         z4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263471; x=1774868271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMUrSOVeDAhPlf3XvTZybFu18sRSydomNUdVxKEA3CY=;
        b=mznhmZUCZ/7JxctXnJoDoVKKZhMrX6bgolIW1A6tvBeCdwk1qO2LJXZwoVioFDwx+3
         lGbld33BmbprkNBzL8RvRem8aKOisC5VMuW4rQq8LVJ80m+MYKjeQyDa1XNBKn8M/Q5j
         8QJs2XEYFUkA4YNMQ/DeOl+YiV0k/YReUSn64R/pI8dXsF8mL8r7iUfi0n6NjhPu/WL3
         XH8OsVIvgep3I1BZ75ZQfB43g5CSrDGMhbHpck+MzcufgWypICyx4BR3tgv2ot19USPi
         U0osLpTde2UBW/g5Aio69+abiKDz+r2csVMhfURnAfUv40K7jASuJylTtBXixXWNUYm8
         r6lg==
X-Gm-Message-State: AOJu0YwoBgH40YCvg9Ax24oZONZHM+amKjb4TqCKZFRGBzGYfjBX+756
	eQKESMw0P25LqGHb6RUBhGAeKu2/rPatBj5cZygVCXpn7PTz0cOpfon8o0Wn6100qKXgrKCEhko
	ql16Gnk5NP3coyzjG4CmbrJhGCy0jkv2uQgm1w1vi6PIKbba4QpSkVu2qi7pERHVSHWlxiXBbmD
	gy
X-Gm-Gg: ATEYQzz63wvBGnid2e02Xgjl2WPdOqNr9WJLqgUDXHMcGWIjLn/FZX1EKPyF97f2R4d
	ylqAXo4+2EjUc5ZGARUWsRmK8oXOgvIfNslixaOd0gI2z6lvWm30h5gRRSDmVPKlJnSte8kpO9W
	nYhmO31lA42rBssJd+elF0JYWL9Snt/j+NHoJl1EQghjftxUYNuSH+n+yuj8yG7T5QpfGtkIzJt
	Lj4VxMakT9p5Rx8VJV7zdDUbyr+NK2gYOlisB5qHe1P6s/bfFPuRLBs/78Ymonko5WNbBUhX38s
	N0Tq1s/ci5bluZ5E1b161IFGqPs5CazCSeqznj1dojOXTArS3YG3sx/xG5x0rkVLtDA0gBjx7Oe
	mERUCbx8nDtWHZavTcNsdjL0f1KQ0VB5wFQKerKmWW24oxORzbUnCzjIa1rRoCqyUedcufbVBYS
	2MyYc=
X-Received: by 2002:a05:6214:2b0a:b0:89a:564f:bbab with SMTP id 6a1803df08f44-89c85a44319mr154147276d6.3.1774263470816;
        Mon, 23 Mar 2026 03:57:50 -0700 (PDT)
X-Received: by 2002:a05:6214:2b0a:b0:89a:564f:bbab with SMTP id 6a1803df08f44-89c85a44319mr154146986d6.3.1774263470416;
        Mon, 23 Mar 2026 03:57:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a14csm466546566b.43.2026.03.23.03.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:57:49 -0700 (PDT)
Message-ID: <e0235341-8a81-44c2-b3ac-d9417c2f5705@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:57:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM6375
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-3-3bcd37c0a5b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-3-3bcd37c0a5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9EYzTvlR7vuC2Zix_TWrAdzP1-ZSnb9M
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c11caf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=eptGKOKebL7jaDLwLzIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NSBTYWx0ZWRfX0q93CQ9GKQsY
 VN0c/MLD8vrHHm1doaqA6Z+o5R+OIuqCxrKIbYYGDhSSqvz5as0Z44lhti+Xp0v1DKqbzHWSNf1
 99wQBxMDpSQwU1RP/zpWXc6sDj8YMEJydO3Pmxatczj1zvvc1D6LK+CjFFuqBs2pOEFevFxAo3s
 2H7+T5KszfOKbzkS74MRyHTHYzFfXrHA7KGUVkmI/BG7V4mRrC18JMDhjiFZCYIhlP+yDtoMfJW
 n1nOgjRlvs8jH8lnFcr2CCXqjmXG0w7h4AjtZaD6XRIJtXFFnQ2sfCF3vo2nVTNWogAbn2I6f9l
 9VNjLfG8sgo4i6rfR/XzRm5CwWZaRsVSvMPesJf9/kCnNNNDnt3HSNHiZKPx//lRK9BEm9HnNf3
 wc8j129tJxU+73R3T2013G9xYuY12NT+v2WASN0cg+sVIZt7H6C+oz0mmBunNjwfrUToceeCZM4
 1xst5J52l1Im/Md6l+w==
X-Proofpoint-GUID: 9EYzTvlR7vuC2Zix_TWrAdzP1-ZSnb9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sashiko.dev:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99210-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F4A72F0CB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:54 AM, Krzysztof Kozlowski wrote:
> The qcom,sm6375-dwc3 is already documented in top level part, but it
> misses specific constraints for clocks and interrupts.
> 
> Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

