Return-Path: <linux-arm-msm+bounces-112473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d3WfFDdoKWpoWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:35:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D3669CC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:35:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="aJ37jiM/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DynouxFD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112473-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112473-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34C563093976
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FD1409108;
	Wed, 10 Jun 2026 13:29:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DBE3DB31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:29:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098154; cv=none; b=AwpDj3rOYCb6eIcjgU5JUhRix40/S2V4fBd8c/Q4QOFDx7X82X/O4w7BklPyLE8sxLDk87v1czW07rwJDxVxhLY2E3xrYtyZjBdcfufUDUbz2s4mMoOuGbBeBw/HJSowyf6/j00ZYk4j7k4FiQGaZPhzp0QdxiiCsRykOpskcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098154; c=relaxed/simple;
	bh=XlUfeydIkfGOxP+AXkc7DyRx4OXIbShc1WzhxwU3BzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9CcthLWO1qY8SjR00UeOXndL4zi3D8Aw0//1WldqY5emqnPAEC9zsmCqhCgVfHoHFh1wcFpbdlg3BFlvY6YvSbqriqC7sg5+E4lWQQ2+UYEvdaj+qr3Hu/EEhDpEOJUJrehoY9/p7BM7MF/p5sRw4/Cls1cBvx5FEmK+m8Mbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJ37jiM/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DynouxFD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCG7h1472569
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=; b=aJ37jiM/IY80OeCg
	Hnhd5j5glOLnWr+Mep0CMHhkt3XDyue6UNjvUXC7xmLnhidk6Go3htheIyIL9G+l
	WqemQ4PphBO6vCSo9Zs3PLnAjzWU29BUCHs1pnrtrePguM0uMGB05UGYbHSJr1Tf
	1B7Zf/4pqYG4gjFut4scG1POUaqEuXHHRSIJjsIJBmBnZp3My7ci14jne3Xuk6fF
	v5wLxt1cBJYzjdFTNfwwcd8ruMvEayoEkTDJ9hPJDYMsZVhLAFWjdg3tSXiIW4NW
	KA8ffAsa3B5add3L1f1bl+j1yTjHsN0PcDmNZY2kw2IEPvsQ+U0fHSGJnQdGVVHR
	d1pc3A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda1mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:29:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccdd99d20dso19115876d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098151; x=1781702951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=;
        b=DynouxFDpZS3mSyO7X5olJ+7DKHfROJqwTDZbStu0EWlpTJQP07TputzaV70Bt9lWC
         Dwje3JO1Ltxu5yzkAIAtOBppjKtIJ6aE0mWvVBydEn3zBfCdm5pXqIxsEAkqBM53k3/9
         Vt71kg3QBnots4b0HxjrlcpU5M0pkmP5BvKYgK55j2IcMU9h6rELjAW/HON5K/OIAZhk
         FJ9lp/eMRwyC1eCe8qJviGxF+/Q4SnYBtAsf8P65fpA9w7PIXXw3B0j5eB+YrBBstTC8
         KnOIfbhPhipY6j7yrt2SAoHQ55Eh4cVNZUOjYM5oNH+TRWNzZHCFrGFwaBGDDdq9rCEG
         GLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098151; x=1781702951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=;
        b=qiwgwY0aClOINthQaDb3dKp6s/gXhLbkaxV9zBf5QTD2qYFl8FD7bnP/nJYa+YAPNI
         EG/ruimXZWQZjbXiv0SiIQSRy6rfDicVAQ/Z0+kFlX+wf6XYQBui96Szham24BM3vnp/
         X+vNEBuSCDV2wZ7WZEPSxKD9YpTbg6qr/ysp3f4/mum+UL5p3tSCcTx2UXL6otHqrJ2p
         eMhb251rODWPVcTQxhoUzIyvPwZyZzwyRdVh8h4linyLLgS/o/qzTn8HKLuGAgJBJN5Q
         qtnGb8NsOmmNRhxxQLpsoYaMJ6VIj4vGRj73l1dXogUU31rY/J4MgvQRBj9fuOn7HOsj
         g+Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8PfP9IY6WwYF88SckEs90Efw4naaHWobmPH1C+aCHXC65JV+NL+T67ajK3JnfeJ+pjzzvkHPY+gXPBKSPP@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0nvXuTg8S4qCLzBmJvXmft4FQtuXkJamk1LxxlXd9wS3SN6l
	iESyLSH5XuwxqOeF9lbILCFELtX/PZxaZDoJqpPlyXmliP+d6q8pGSE5iSAofAcKwOMiYT1ejqB
	DOKZ0CCGKO2gqOXiv3bjBpiW1liaz2e1amKI4INf2obslY2L6hn1VAS9x0BtUkHz6MY56
X-Gm-Gg: Acq92OEaY4dWt38Bp0KiIHE8uyRzI7CqbRaWmi+CtErbbZAWcCJ3zFKcMKEHcs41z39
	B28dVqyX+Jn+dmJ7NVMtBPJVy3ltr3aWwyCea48iiXrjQ2EEvxX5kS4QlGjiEsIKz6Mvc4QyTFx
	KAP3txlHAdq12T8WioqpsX6UOTeqvpT6jpyd99zHHTC4Mx3PzvkxG5qkCh1mIeCS0nFVgjVVeI4
	afw1vFwhqK9JFDYUSKGqsdXL8ClYuwOu824BU5PtkMiaEKxEO0Eq0lkkLUQO7FGJU4bdh00FTCl
	8ZOKTHAqFIvwLyEBf9kR5OX/lER2YFb5+hsDphyH+BJUm6D0k39ddPpYsawXFtHeTnAE1XJeA73
	FDThuXP6lqXIl44+S1o8UGZ8dG/wUmcokKUO4RsAGMolHMp9LmibggGMA
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr2313109185a.6.1781098151433;
        Wed, 10 Jun 2026 06:29:11 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr2313104985a.6.1781098150880;
        Wed, 10 Jun 2026 06:29:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm1196208866b.38.2026.06.10.06.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:29:09 -0700 (PDT)
Message-ID: <5759d855-e365-4aca-96d8-cea2c4ff630c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a2966a8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HDjIzE35AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s5tj8q4C22HW4gDRz6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: Hb_X0Ebx-y5JpApY5W6a4sHC65GrP-zB
X-Proofpoint-ORIG-GUID: Hb_X0Ebx-y5JpApY5W6a4sHC65GrP-zB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX6mgzFTWqebcv
 +HcfiBtRSko/pUL+MfZscrDix9yASi+POw+OYbJYarwAuF3pW8lc9C978KfZjbmMgPnGCVoWYl3
 vHfhsnrZCl+ANqKA7CULvzu5Dc0x7kJGZb+idhPKQJb3i864UIUNz7i5CKVr1NeRVn9fVaCHhhX
 rWB4Tuj4M/s9Wo9NykQotdLzOMXmimKGuWrBpsvHSrGprsVMVzX8byBS9E9Q4pqv9Xmz5o9LaIT
 5t/VhzyD8+OcZrpJD2cysJxvoMOyoxu25/ghEwRYVQ+nTGjbMW2d7xhP+ARkSw7px5XIQqzY92k
 pSqIgD7PK/nC0Q962Xyoalefg0f5Hh0CodBxq+lBbWfa842m6E6ofnCx9gjsRjHRZuYSCo3HbvA
 WzKVHyMy381zSeTsNa1ZYrkTqH2Va0+jKcaeUfl+HkIhtsGZGpPaLsPdYtX7Np4Ta48GjzU80iK
 Y+tHTxCEzkZ2sTp/95Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112473-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C7D3669CC5

On 5/26/26 3:24 PM, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add DT entries for the msm8939 venus encoder/decoder.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index d4d7b0c9206c..71e22584a46b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -1627,6 +1627,29 @@ opp-19200000 {
>  			};
>  		};
>  
> +		venus: video-codec@1d00000 {
> +			compatible = "qcom,msm8939-venus";
> +			reg = <0x01d00000 0xff000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +				 <&gcc GCC_VENUS0_AHB_CLK>,
> +				 <&gcc GCC_VENUS0_AXI_CLK>,
> +				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> +				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "vcodec0_core",
> +				      "vcodec1_core";
> +			power-domains = <&gcc VENUS_GDSC>,
> +					<&gcc VENUS_CORE0_GDSC>,
> +					<&gcc VENUS_CORE1_GDSC>;
> +			power-domain-names = "venus", "vcodec0", "vcodec1";
> +			iommus = <&apps_iommu 5>;
> +			memory-region = <&venus_mem>;
> +			status = "disabled";
> +		};

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

in case you're going to resend, please add a \n before 'status'
and make power-domain-names a vertical list (like clock-names)

Konrad

