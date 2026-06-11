Return-Path: <linux-arm-msm+bounces-112629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6M0eJtldKmrroAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:03:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD166F3AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:03:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e1MvATV8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T4+ef6BD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112629-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112629-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C888D3057E2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3000B30E82D;
	Thu, 11 Jun 2026 07:02:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E4A3B42ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:02:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161354; cv=none; b=CHKOZa36/NRjlndXIw8rB/KTbs27RYqrNixQ3V9IyGuuNGAISDzljoN4YX/xwmCOUc142aFX4yWOFCj7Er3Mwr2Wv+HcVlwpm3zUbG8EWCeAzOcPPNIRjcKzLlYkyBOk5DwP+R1S0ZwhKHykDEbgz6DEcuImNu8Z2O1yY6Ww2Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161354; c=relaxed/simple;
	bh=i/5spa55ORVAwgtSe288M+yFMDXtzBVF28YGRiXAwio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qctw2+bzx3nAq+FPS3RX9y7izdlSZ13vXq2RhnarJs5EKHjT1ZfPrwvLtm8p1Q8yesnkpMMJx/15werkf68CppLRaK3g3AypyvtKaAcDl3e8MqbDS2KfAOoG8OGeS/ZjklR09j2TktiX85zLkNcafLn/MZb3rozQks24RmmaURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1MvATV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4+ef6BD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GUWF3846385
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aiijRgxO6dAKY7p4gLcwYQ2IXl1oTX6rdD6MVw4E7I=; b=e1MvATV8zHNXGErE
	gzPBo7PB1/HBmFjt3j2eJgLGGPQXj9dIG/saFyf6STh+kGAxdMPbMjvx8BBKcTbS
	emr5bEj5KCi4lcw60FcavIRSUVfZc2wM+OJ9zpiObOIEZLw7h4tTpNWcDsXVBoPc
	cada2O8ZFqhWLMusXZwsY4qU8Vcyn5s+K44BnwB8yAq53dWzoerK7rgQMeAMe7PS
	LrJ2JKt8zY3m6rdKoHbo3VF3UC9Cm7rPj1FsrxwlrCn+6ABqZUEt23vnQLBmWEu0
	GA8quvbOUMvL8b2Txz2G6hTshhkiOZmFI3FLR9hlJXoVjPVM5IOsibpBaUCy+Vwc
	x9Grcw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u23pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:02:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2a4babe45so15941845ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781161348; x=1781766148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aiijRgxO6dAKY7p4gLcwYQ2IXl1oTX6rdD6MVw4E7I=;
        b=T4+ef6BDsBsPu1Xm+LwHQEx9xZKCj0ddGbi86qLH6xtOemcYgIDRs4c9Z8rTmYEN4+
         8Fd0jOa3gqTLh/TzrKEgyBQV7VYaoniSqY2oPNvum7AsI8Y5j8QYbStTpTeZ4SVdPzTa
         zpODJkRBnLSuQOHCLYP/COQsNEVABG7VoFaj85LGewvFAfPY+6IW85PPiG8/uellXVoA
         8X3f3FYRHkAYcko8X2CRJUUlncdzwG1GrQL2yYmC/bRFy0Z64IGfeRx7Rq1z65XMv3oe
         I+75KP6o9vic/qYLzkWMwixjqT3Id3kPZHfWZTsOSqV2uCyGnC0+6BBTiI+7hxpLv/nX
         3K/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161348; x=1781766148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aiijRgxO6dAKY7p4gLcwYQ2IXl1oTX6rdD6MVw4E7I=;
        b=MStJcBQp+UyRrcpSzKTF2eRQVF6AxU4eUX+0khOCjNax+SpuzcCXH5tZ4nINChKrJB
         Jlfy7zdNiTBXgORx4ag8SwMw9sLYWWib0NS6/ddM6ng3XyaEEaIkFTZGqp7LFpmpCYje
         Ew3/8HMP9x51/yZEEnT1huAqYnpzJSjNFss0TES/KNo2u56s3HCKRwJ77hr2j+TdHZQr
         QA6R0RdaESF+6bbAY/VeFZvFIh/ex+9JHtIF1pGgRvk4Ir0WCgAwbnULeyVZNtG9xy3I
         w5oFbKCiA7KzBf2i/uQl9DI7WJdgH8daJDTaf6m9L9G/iXjqLyxnZtHv30OIPujhPUau
         VLjQ==
X-Gm-Message-State: AOJu0YxZc6KIC0hSynvYSyYkLOaoHKAVNLMgP/p15Ky2lOwjRwCqEiKN
	whmJYezvpPNqhQGQuRvKqphX+BMqqWP3P20EfrXvA5gYz9QIyyoU9ps/T/b22HDgSn1b72ZoYUy
	JJqcdK1C48uyuHETUVGZ8vm7oqPZlQRqhVI/gAcGIxSloH5C5af2vbTKA0rdCtce/MMGyBSOIfZ
	/m
X-Gm-Gg: Acq92OGVmF3qjBrz/w+nrUJCWBoXqdUS400biHd5f1bjtF5keCJF5yECLJZqmOHTtMG
	NImpW0YpC99ayqcrcP8JbdjFfYhCHkr7GrV+tKzIMd5NfuUBERCLCf7i5PJtgX6WuTV4Vlnvxc/
	tR3IUVe8vkVWzxYCDB3VVedKzHQ0AAJnxVD8VmW1R/TIET7/4zewzmDgQkoFkBndNreuRsQOWaV
	fLsU4nV15ZrXF1GUuJYbPCysCfot/47RFRCCtUWCfvYFofDdO6mh7H7mOK2n9Csu5zrmmljp7qR
	m/kPqvaI5iFkBzpuBhU6JNVj34paHEfsitAop+tVenxiAUJHVdNZx5hhmKpFzRnA60EtfsZJ88t
	ZuncZ4OETF8q622sxC+/+hcBbhswRQlIOvgMesU3TvCLccuzfSfpagnRbDDs=
X-Received: by 2002:a17:903:1b30:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c2f0440700mr18724705ad.1.1781161348515;
        Thu, 11 Jun 2026 00:02:28 -0700 (PDT)
X-Received: by 2002:a17:903:1b30:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c2f0440700mr18724355ad.1.1781161348084;
        Thu, 11 Jun 2026 00:02:28 -0700 (PDT)
Received: from [192.168.1.102] ([49.205.251.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm273232885ad.24.2026.06.11.00.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:02:27 -0700 (PDT)
Message-ID: <f83498e5-3cf2-413f-9ae1-f8136e79422e@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:32:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay for
 gpu-thermal zone
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Language: en-US
From: Haritha S K <haritha.k@oss.qualcomm.com>
In-Reply-To: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a5d85 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=l8H87Aj2eOB6ivgXlsfF7w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=rTJxATxfhN_NfVffrPwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: lZdpzwKV7Lqz88nEE77YM_IMdOc63UZj
X-Proofpoint-GUID: lZdpzwKV7Lqz88nEE77YM_IMdOc63UZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2NyBTYWx0ZWRfXzS/O0IK3Dikr
 8FDEVSN++bLY1rJQvERS1swdfr43Sjq1a9ylUqGy1+1Wsl3shfp/g/SnhzKSFQTIrd/T7mStLAB
 JYFNtM0zG889eBcP8Xbl+Te3Ho1FOdgDGLP6Y7aQ11YY8o4+/SMVo1SuD51i5SG2gDOhCYAS3C5
 uZqDhHK0yzOh9vYNDvou6SZHSFkbwogMA3py7QMaKHfGlRWPKPP8bo9Hf5PsefjTnLoBVxU/rRj
 0B62c5g2zkn6c6y1QSzYpEgrFNl97r6Di2S9MIb+jH++V+RHlj3Q5dHg5fsY6AU5i52X6LXUie0
 YyEUz+fK4rEY7CRGzZ5e0iC4/UQZhivgTnd/0Bb2MO1jOvfMC8bhOXK50FR6HP12cXBH3AjgsP7
 xeQF0Dt5MrQZ09lIykLlr4t66+m7lQj807OfttgaplIYUjYoQiCwufemhcum367hSwRkMnQ2RjN
 kfe4ThAev/dmLJVXjBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2NyBTYWx0ZWRfX3bvR6NP9XA7o
 neYaBE2K6d/BGJr3mjN94nl1B68aOf5Jye/NyPBuZFja835Ex7YqnGslbXK8i8cq6mF/grdr1zF
 xU1SwpHVt9toScqSbxLa119eRtvNxc0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112629-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[haritha.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haritha.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1BD166F3AE



On 05-05-2026 16:56, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Introduce a passive polling delay to ensure more than one
> "passive" thermal point is considered when throttling the GPU
> thermal zone.
> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated commit message.
> - Link to v1: https://patch.msgid.link/20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ff5afbfce2a4..8a3669b2d062 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -5267,6 +5267,7 @@ cpu-critical {
>   
>   		gpu-thermal {
>   			thermal-sensors = <&tsens0 9>;
> +			polling-delay-passive = <200>;
>   
>   			trips {
>   				gpu_alert0: trip-point0 {
> 
> ---
> base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
> change-id: 20260422-qcs615_gpu_cooling-39650b7ff41d
> 
> Best regards,
> --
> Haritha S K <haritha.k@oss.qualcomm.com>
> 
> 

Gentle reminder to review this change.

-- 
Thanks & Regards
Haritha S K


