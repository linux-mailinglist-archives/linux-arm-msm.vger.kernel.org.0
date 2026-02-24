Return-Path: <linux-arm-msm+bounces-93975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEp8EIeQnWlKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:50:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2B186988
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A693011868
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEC93803E9;
	Tue, 24 Feb 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbHMgZ5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8EWh4N+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318BB3803E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933610; cv=none; b=DNwjjRmSRAraE4itz2mwVcD9OkhyYRnpLpQ5asCLBbJUWVf2R6+3PTcUQznMHYC7gtlWmkw+rivUWchlzbnbLz4YJC4wRWCw0EftLrJch4ejHTEZQoaV34GfCp8hckwXYiuCwQ4pt4wP3lPNx6Fi1N34qzGnxS+bwWTmGYyjrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933610; c=relaxed/simple;
	bh=bhvy8oe9cmU1vca4QHKXTqvHAeM6pxHdfMVdkDWGRtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvTQ+CmpD1Uwr2koBTgUJffZz7kcQj5XKU9S57XAE7ZGNK8Tr3TbDxK6uhQATBF6lz2rbl0WvCkG5ySOYx8zKxsvvE6MDwLETVa17vUp1m4DqUoYVOUQWZPdUj2t/tNYpufkwOzmGqbYIzNpJv9UOp3mnmT5K+ftSNsnlsLWhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbHMgZ5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8EWh4N+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFZ8N2284694
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tymcocPzSV9cCZXdLKcJBNN35FTMQW/hRXDDLBuZkN4=; b=VbHMgZ5leSwmsptb
	ext4POx96LsS/q/rbrX6zjNh72QVJPFT2n8TKEMZ0skVFF13Yroo1Rij8U+lX/Dy
	LVRDJWmGVEaO5yfYx9GbnXjqtbInqXsR2agAofx+a+Ux97343MkSFlfMe70YQIED
	MFdLKhpHFUGS9N30lfQiGqCnPHrUe97qq6lwDeaeCRip3qmkYYUh+42sSL0rbnlt
	D2qm79DJycCWOlW0tYejnPEDz6JACma7aSg5Jjxj3QwehtH2BSxUGIek+CYZr0yv
	GYiCnFNAyl6MQTSI6mNVgzVY4a2zweTsfHTteIsySObwRFEwaELPcpR9l6wRBSYF
	SXzkRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx0ax9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:46:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38346fdbso543598085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771933607; x=1772538407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tymcocPzSV9cCZXdLKcJBNN35FTMQW/hRXDDLBuZkN4=;
        b=a8EWh4N+E3QFufdDQHokd/UQfYqGu2nihPtSf7AsRcu2SWllrp2vu71CllrOHl64xC
         PmADMayukDFaiOOaOXmhpg7s2JM1qCwL/IMZkb9+FBpA3mOT/JNV5HqDi5+rK2EnNhsw
         JP0TCdkJztahdNK0G2vCct6cBD2WLyWG4ewrMCkiuzh91pWleI//+hRiMjtJa6nMj5Hf
         mCgvnvp2jDJXVAQslSCRRU5AV+tzr5969iqazAEvETWO1afO3L7H8LFanmHUIqgAQoL1
         Lmbxsden7OUX1KY5ksMQN5CxD5zsvOvKVQrq1WIAYoIr/WbsNsSfU1I02byQ3Ks5ynao
         MW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933607; x=1772538407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tymcocPzSV9cCZXdLKcJBNN35FTMQW/hRXDDLBuZkN4=;
        b=IQ2wVycsePLVP8zoJ9WwEtSjEFm+oKIpd0Q2Yw9gUxrL6bdwIc9QtpnhUgh4WdY2AG
         VY5mfE6nKSi7QtMscs73B0kCf1dCtx6ns6uFFrYijZqJXT27g9jYh9vg4H2bVn1XeeW1
         ZnlPQl/yBxxiZ6ihkY85TRq1FIfIhYYbRwMBuaRU32BNVCnXxi0dhW0JvFm3fSfmuluO
         NX1MH134Dq/wHBcum+FR5xXMGcSeVwGbRaMW7nc0F2/mXPs+Ndelavvs8OOHatPyw7F8
         XI421o9McVj2A2v14pKMVePIT3Fokto93kOkIeyLzU2pGaiLhKmbEn79NMPf/zQmL77W
         6sTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+6q1dbVYbDSsQh5T3QUltAsumbK7nv55xoTqx9/Z6xZa86NEng97tPFUTWISgsAB9xxi+8xkZV3EQiZ03@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1R3lEc/DwRivTMeQGbIotfL7DkeEtm6U37jbAB27iAAo3vSyE
	bVam/rHdW8o5BoYGUnbnIqQd+eIYmaL8LGT9bwzZtqdI4nBn4MaP28COgNxwrS/OcuS70ybX5M7
	+brcTUzZ9CVCm9sh1AVhVYH9tu54CgyqYHLP57qL5VZNfg+GJMiX0El0imIz3i0jhqez6
X-Gm-Gg: AZuq6aInMJVURgVK3ep9gKz2SLR/9pielSvB4SBptc0dOLT5xsm2nWmiTt/T6U05rhR
	QkVeqpNv3hn5VR+WLIq+J+lSUJcJQJvKqXOcvVJS8qDxJdn/enX0rCtG++uCS5qx/yZH6ynryHD
	sZhdb9a2n+BcBR6zu+FnSZEvBymCi2Lh0lwkiGAQ4A5/iF8DZ1wc6QmJydTf+oeDsNTfPWsTTzF
	GXhn408n2MMgtaRLJPtaytulJl+mnjFwHzvPgreyv3lFEREgsP0WPot/6XX98j6kE6UN/HUbsMz
	PnBnMkVMlZRDffbLuuhZA96ip7oJjGpBEx5d8S+1ainTwUvhw8ek8lCqGNydhz9ftXubPWBz8Gh
	9/NwTE8dzUHy6QLu31KulC8Qgew3myxYzKIhEyv94PBx1hs/owFMm2TIaPbPqZX0VZOlZQkF2IX
	m9qGI=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1110164485a.7.1771933607497;
        Tue, 24 Feb 2026 03:46:47 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1110162485a.7.1771933607079;
        Tue, 24 Feb 2026 03:46:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f03911sm411180566b.65.2026.02.24.03.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 03:46:46 -0800 (PST)
Message-ID: <8a2db0f2-c9f5-474f-afcc-53248da19297@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 12:46:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
 <20260223-dts-qcom-glymur-add-usb-support-v2-1-f4e0f38db21d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223-dts-qcom-glymur-add-usb-support-v2-1-f4e0f38db21d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tqmY4gzMKLtx1dV7NzwYVgpULjLlAxGs
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699d8fa8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iuyhanrI9R5_42HSFcsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tqmY4gzMKLtx1dV7NzwYVgpULjLlAxGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5MyBTYWx0ZWRfXw2/xLzNgqA2A
 7EkamPEes2jukGL6pjWLjXkrtf137s+mseeg2HXDHQX5M0gdkLnR5q1HOUEUuxB4EjteoVg6d/r
 v/GWxAhVYUp+IeIFkoLnAG4FyViYhOXQN/cDdltQcfyAg8unbDLXlPeheE2itSU/KGabyFrDydC
 SIvZaD5veFNKRRNXp7Uf656AFD6mSXc/lsTYU8NQ8rPzluqHKk/ivpJ5SQsCPOVjuEy99bojMfr
 1rfxyKp6knxGgCRsdJdhVCqt7YuaKuFa8JxkyiJ/EV7hHpw48TDM+K3arHeizOKv7HowR5SkA1g
 q6v89HK5oTdeYLl47uVygrHLIp8YYuo42taMnFeY4lMoD3jBSLJavjW1z9Rdgxm+KLqTrUXDxdb
 oCyXtTrPwUiktwDkIdLne7TB43VJ3hj4Q0czThiEZgGqa+MpwayQ80oaJ9+JNCtlfOhtN2kucN+
 K2fSGWUGRNBnS1CTLUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240093
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-93975-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98E2B186988
X-Rspamd-Action: no action

On 2/23/26 4:37 PM, Abel Vesa wrote:
> Some of the controllers found of these platforms can be tied up to a
> single high-speed PHY, basically rendering them as USB 2.0 controllers.
> So in this case, the interrupt to the Synopsys DesignWare Core is coming
> from the high-speed PHY, so allow the interrupt to reflect that.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 7d784a648b7d..f879e2e104c4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -500,7 +500,7 @@ allOf:
>              - const: pwr_event
>              - const: dp_hs_phy_irq
>              - const: dm_hs_phy_irq
> -            - const: ss_phy_irq
> +            - enum: [hs_phy_irq, ss_phy_irq]

Since you're tracking this change, after it lands, could you please fix up hamoa
(SPI 243) and milos (AFAICT SPI 349) too?

Konrad

