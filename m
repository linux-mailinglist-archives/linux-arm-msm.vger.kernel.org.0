Return-Path: <linux-arm-msm+bounces-110004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPF9NAb9FmoJ0QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 16:17:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DACDC5E5BE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 16:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4164B3113DBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44283242D4;
	Wed, 27 May 2026 14:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUcQ2FsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8lvAuG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAFD18A6D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890964; cv=none; b=KLiRNMMfg/3W6D3FBjaH0JgYjy+9gffXODWORFMEZTY6iC9uvbe+CIegXtypFxyPQpzc3+Wvpay6TakO/z6nphObYodBIfl3LZDlHKHDjIjzyjeoeq578k1Eh3o12LHwgyf1qQ1EkXIK2Kx0xJfK4SwmQTQ9+6b98g74YOfsNbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890964; c=relaxed/simple;
	bh=qxF8y/suOhwQz9Jk3eY6ZF+c4CydHTqv7zgHv66xlJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMXQInsND96oWDVLMecn/4mU5uN1n8uL2N8mRPQrjB3rheKLvKACnPcAZ7Zh76WKc9maCzsrM9kXU2iT98C4AsBWr/iGgSgEXiGWlsmdbFQR+54UBHuIT+l+uqBDR4TaApfHKKA/9xbKhka0MLcr/qZteEZq2Sdzne0AnHfEarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUcQ2FsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8lvAuG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RARe6Z1574215
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 14:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yom6/hlovSThP+6ieHUcTcbi8Vc1PPJ9H/N3E1WloIY=; b=hUcQ2FsT8aEnmGFT
	Ib5VtSROx9S2uK2Huo8XrRgAbKSL+wTT2idMZhYV4TMz7vn/jVNzeOWtsvEP0Eh7
	hyOjnDRkT4QpppR/aDCjqEhljlXp3BftqIvgNifO2pUCfEaOFenYDJVTiCBL7e/g
	wUySfm48jr8N6Wy/vi4ppReUnPknmnVGIdvHduWWW5GsBme0/3SDmIK70gbAcCT5
	6TiBi+VET7aWIel+5Il6Tmm422GM/eBVGk9xTXzAj2xq8HSY7LMKZnyho4ZXK2Ub
	6zOHlLTbKhtMkuZ7Ys+lFix2JTmKCVrFymYZTEJQRK6uBnfyVqOQp6Su+2fxoIPv
	QuKjgw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxvpgrh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 14:09:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso7013252b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779890960; x=1780495760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yom6/hlovSThP+6ieHUcTcbi8Vc1PPJ9H/N3E1WloIY=;
        b=h8lvAuG7vPnUF3hb1p/eFeGDGpwPYAmKqfmCFeiW2Gfynj6uSujVEf/b2fSga2PYBh
         JlN9JwvKobEixoTejr1mkvl7uhMuyRjNGVSu5vplWvjxwf5vIidrKXMQSC1jkUoazNJg
         KUl0webTIzc5I9UNw7OVdlvVlw6+j/LTfjoPbuxtAZvHv+fTrZr0AceenY8sRViX8dQ8
         OJqk5ABT4IKzYkGoWKJUu/zUXvdsiIN7ZF4EyCJWpgYzVNXIRr3DjN3X6EHg1OOyMJ93
         grjAqu9ZH+32d+rkWYCByo5TmQW+LaW+trZPZHUDjz2hJn3qhSgEojUkf5aw3MHALkB8
         vy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890960; x=1780495760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yom6/hlovSThP+6ieHUcTcbi8Vc1PPJ9H/N3E1WloIY=;
        b=eFSYktJ8CS/fTDbkJ4rt15YDTFqZBidYaCAdKcFJHzwWgB+SbWjZ2xQCPt/T4ivI+l
         FDwsWOEtZ49zW6ibMOoU22niWbVhzbXoCOlc0rSeP7yqTpaX08xn4J4scqB10vSu9kRl
         2foQzccvdLKFotRWaj6qFAzQ2pl7aqn6rApFziO/bPHDi3ANelwZ9Qg5Dr4LfJyVpSZc
         /cbBN/Z/t3J2M1VZDYBLsr6tmiUIRZSKZrSslYFbigziDi2G1VuQUYGVLf/cMPR/ZWPG
         iwY3QwjC/4HVy9bP47o44YwTWDtgjbL/lr9WwZhH2NgE3WWE/OmtepoQ1Y+d7MW7qAOv
         Xjtw==
X-Forwarded-Encrypted: i=1; AFNElJ/8XbcJA/BeD7o/mETDRXVc4b0wmVBU/GCuIctdKPFmdIScp0CoVqbZaxDXPpPsN1f9lKz/7Wnorikl0nsw@vger.kernel.org
X-Gm-Message-State: AOJu0YyoRdFs7+9Y/MVtVp6N7xWtcALusNe+ct3FYIxRHm0hvQoBa3z6
	4LK4NyEUx6MDbA5o1YqRMsdC+hnVW5/iRJLYXoMiJzhLbp2vdKWhdGp/dZY4ieUqxhj1Fuk8OjT
	/JhCLfU9Tu0vQgs6aFCsgGfXEIlC2e+PCZ/V/3lgtxliEdRAS4nABxe46bfUW04BHVGpYwbv4OE
	Ew
X-Gm-Gg: Acq92OHPO8dJt90YG2w8euCuc5AnJ1A4b0b7ZG3iMjl+LdaWzKxID+S9PmF+4AwJNd6
	09aJAmwKwFQ5bq2+vFiXWtzvjD3xECJyUdDbOcoLagn/CMmNJlTh0Vv+iGxp4aO5D5tSOASjr7b
	mRQzDklEa407yFGnswwi8UIsRA6Z1TVZG+IUED7xT/48x6wlugbC4b9j2lu51dSDlhaQAKyvZIl
	QxFfVOKe+BWogLoF+QETPtSHmoG2Y/kYJjFx6Xi2L+Q/BxUGfnkZDQ+lzP8JZhRQvYU20N3ls3e
	b+ovEOBql3yCwRGAhClyGL1HMBRLwzu6ehdqvHBmh7mzDvOUoDrQ/6RjdeWsA4Y1n6v/ZJp9zcC
	gdG0hE4+aJDLfzSHb5HVASOZLPCoD6OVZbRBnj2v61V/2Yt0d
X-Received: by 2002:a05:6a00:10c9:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-8415f3640d3mr21841856b3a.35.1779890960403;
        Wed, 27 May 2026 07:09:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c9:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-8415f3640d3mr21841821b3a.35.1779890959919;
        Wed, 27 May 2026 07:09:19 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6eb0587sm2484301b3a.21.2026.05.27.07.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 07:09:19 -0700 (PDT)
Message-ID: <28b62311-d3ce-422a-a3b6-79d098731ddd@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:39:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
 <20260526-quantum-funny-gorilla-cfc983@quoll>
 <951c9b8f-4513-47ca-afb6-481dedd3eff9@oss.qualcomm.com>
 <20260527-pastel-fuzzy-mastodon-a4d9cd@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260527-pastel-fuzzy-mastodon-a4d9cd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzNyBTYWx0ZWRfXxoXGSplGm83P
 az04Wbx1Goa+EOFrAz31qzcTfindz+os0XOOIOY7peC/tfag5QqFr/6bIJfa98Jzl0/xwXuAfnx
 ZvijbpsDiNmHTKyyrJK+rgs2KP6EJ0yXk/7Fj06rjwLIQja8B+M3/n2RqksMGoAkcer9eU/Tszu
 KDI2Oy5WWH4I/hqksPt5HB8aVwwkPmfPXHU4gohgH9Yu6MHnJnTeo/YRYou261iisNO1InapPi5
 zQi8QGEr19NiBBSu+KI/ZTsK/G5W7sSxPJ8qV5lBYgBSTB+L96Q/A3rSJx3eh/+EFj6YH+G4Cr/
 NnBuPwRSIOJSETPPZyX4hA8WVLjFunx8ofJVDw8mA/1mgLknxbWHTEWp54l7r/v88dbhH9Dv0V3
 GRnJVZbIopLvOAyLgboZDgTisx193UI0cRKgBLMQelMxWjkW0wDFWwmwdwWKWe1XSNf3ubLK0Np
 +xjdVqbi5k+xDTpZ17w==
X-Proofpoint-GUID: dO4Kfs1d1P7lT4kG7NNsxZfeIJDP4S9n
X-Proofpoint-ORIG-GUID: dO4Kfs1d1P7lT4kG7NNsxZfeIJDP4S9n
X-Authority-Analysis: v=2.4 cv=VqoTxe2n c=1 sm=1 tr=0 ts=6a16fb11 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=bBPcOljkSGlYhA-67uEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110004-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,bootlin.com:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DACDC5E5BE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/27/2026 2:25 PM, Krzysztof Kozlowski wrote:
> On Wed, May 27, 2026 at 12:42:20PM +0530, Komal Bajaj wrote:
>> On 5/26/2026 9:15 PM, Krzysztof Kozlowski wrote:
>>> On Fri, May 22, 2026 at 11:32:24PM +0530, Komal Bajaj wrote:
>>>> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
>>>> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
>>>> passives, and is designed to be mounted on carrier boards.
>>>>
>>>> Three eSoM variant are introduced:
>>>>     - CQM: retail variant with integrated modem
>>>>     - CQS: retail variant without modem
>>>>     - IQS: industrial-grade variant without modem
>>> Industrial/consumer variants differ often only with thermal, so how is
>>> it here? Thermal difference does not make them incompatible. Honestly,
>>> usually industrial one does not even receive dedicated compatibles.
>> The IQS variant uses a PM8150 PMIC, while CQS/CQM use PM4125 + PM8005. These
>
> This should be part of commit msg. You explained WHAT you did, not WHY.
> We see the diff and we see you added cqm, cqs and iqs...

Sure, I will add PMIC details in commit message.

>
> Also:
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Will take care in next revision.

Thanks
Komal

>
> Best regards,
> Krzysztof
>


