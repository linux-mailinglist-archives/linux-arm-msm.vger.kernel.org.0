Return-Path: <linux-arm-msm+bounces-111135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /j+FDAEYIWpw/AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:15:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C61BC63D317
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:15:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YOj0p0pZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hx/Rtj/9";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111135-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111135-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80922303D11D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403573D6664;
	Thu,  4 Jun 2026 06:15:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6313D6CCD
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:15:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553720; cv=none; b=JLHBTnR+RnBYeehli1sBhy98tkwsn1cH2kdZxvkNJjneNMfjwE0R9NGYbcFJy0/WMP0XSojT0tp4gj5YePXI5X5KU3IzBmXWKJP8DEaBORqvNxurSwJZsmM4FlL6GtX9TvOhEKrs7CzJFTvkzvKiRqb9b/4Ip29XzyoXSc7CD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553720; c=relaxed/simple;
	bh=l/ipR7J4Gn1OuOoiyhxZtBOgRqVxGgZsG44uG/aCGdU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F9HTkUeF7E0hpWhMSwK3uElMoM271IvnroF6avebJcVfXVuTPYyoD73+8TNLbLRxuSgCJwBHwxc6ulw+Y6Zr1sU9GfdfEb8rxcnQrvAXn7TzKV85Gf906YdNL7sTCS29yu/0blxUV1pNWLxXCTrbV3+5uf2bf+zTEPC0pUo7/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOj0p0pZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx/Rtj/9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540um2F600152
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=; b=YOj0p0pZTfOeNsdf
	tpHy7bUuSPB3al2zgsjQSY1R0yPszYZdgsfEYzSkX7xO4EIvyaBFfzAad4R6MHkY
	8i+E+Nl2CN5a0DDyPYORL2slZdaJOVQosrSaus35IZG2AzWKvwAhFm4WHK6TlCRS
	EjfEraBiNF4m1OAVJUh1392KVPgv9bUyJhOPzMHciEbiLWN08Jf+LOvWF+maDVfF
	BFiUTPV95mGbCwdQ9VwgzxInPEIUPhZvL9r3zDKU6+iEc2vtSsXSbHPX1+az6Ak9
	lNXxcivpK3dAVqLUpEsJBS62dMNnAl0MjI/eFAy+DEnxYol5qNi6SMrH0b6GDESb
	9mY6DA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m0wk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:15:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so383996a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780553718; x=1781158518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=;
        b=hx/Rtj/9GfPFi52h9oHs2/GcWaIKvDcsEeJqQs3J5gSTx2a+aQr/TjvrRDVlfvfdb2
         NnoMyD3TsDVYwYkQDePzPUW8WRQg9Cb1XGZvTmbjeiwcW5DEiMq40efDAG7Wsjt2QT5a
         zg60Gl7UQn9P+bohUTFeU14TOfHE53v/zPrQKmB2/DOxo3qBVMEW1XhDfvniQoIQTrRP
         jewbOxVRidW5IgiJUhzBwdtvjDahoRkXquR20xwgFrZW+qEUc1/bsckRwGt/8vXkvqXE
         PgMkEKGvYAXic/oXFxXuGOosTOfdFxggLHRw6OKfKaMHbt2Hw6Sy8NENpQW2UdXjA83x
         x0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780553718; x=1781158518;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=;
        b=X5FeYyYtf/otJvcCNS7djHazbXK/6vuBDEkv9b1SjawMn1xFzMr0znf5pWISPNE2UG
         LkRNZAKAJUB6YR8Hhk+sGISV/0fZBcRp+8wOw1pazQk9MHoPS/9kUPITtXsbaK3vcX83
         i/aTtElibA57fw50EzgqSQeoKxCAOlShrIY1MzQAfKqpPJnds0+kRRu5tUk3sbfhJ3su
         1nlsuKtH6YZBelnqkwLnUhbXpl25vSa7FEs+QWouyJo72tQPaZOZkHVMlLkpjjFotywL
         xHj/ehTnx1rYfexXIEpUYYU7inz0Cwu17AAutRIcGVn54LTaWF1SXGeChjY42o1ThUHx
         voXw==
X-Gm-Message-State: AOJu0Yz/MgutDHT/q/+UKVgjRLpV0mHvYBucd7+CcTT0cowyETck2zel
	PCfAayr/zbJyZeOr7HMkF7vz0g49I1NCZn8qwU9vJsgjlx80AwSV2KbFR8n/uzk2caw3V2vhvQA
	2o1TNd8vAC+8xLJgMATBgZv7Y3Fy80r3n9A3mh4IQnC/qgnCipsfHWKilQRSVEygR293k
X-Gm-Gg: Acq92OG/QEuuJu2zO57BhSwTbfbgYgc0i7ByG2aB1a8lQ3X/lLQ9kCdzfXBTNKEdcPK
	YotZnp9NVMpn8XnAuuXoXClhQkcN2g8ppi+5BW5WYpTqwIMGTyfnXFo2mkRHtm6ngrS/xhZGogL
	UF8biigZ010tDBgdlQBcdWkAPUJmVorIuKVqpGpHAzyOTm+1vDIHfMYdvzezEhZId0jjy2g7CN+
	QIOPA+YXZY3L9BOnwUJtM61YxJuPa0ZrpYh8XCeD7iBTC7zV2M8aiBzp7ywnHRRZzQ8a2LduWnN
	C4o7ScmZUQibnrp1id1ivSrLsg2UaqBbZ9mFZWoW4YlVcCujxeQeIAqpREHBuwrH01Nq1hayhF4
	50i3Dms8SAbWF33gVTSosBvQuF0G5P8pCYolpclmIpSC9y4HZ5tzOqDfD0ZR3vCBg
X-Received: by 2002:a17:90b:55c5:b0:36d:bc21:4ae1 with SMTP id 98e67ed59e1d1-36e33ba4a37mr6551036a91.27.1780553717668;
        Wed, 03 Jun 2026 23:15:17 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:36d:bc21:4ae1 with SMTP id 98e67ed59e1d1-36e33ba4a37mr6551011a91.27.1780553717214;
        Wed, 03 Jun 2026 23:15:17 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6b904cadsm4235759a91.0.2026.06.03.23.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:15:16 -0700 (PDT)
Message-ID: <4d5eb9d3-9437-c5ae-d28f-93d7604f8cb0@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:45:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a2117f6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1OCBTYWx0ZWRfXw7OVnBK81hZg
 cGp1kl5nU6CdKSL+ayciDvOuevZ/jdoq3qFwn3qtfZYt/thd73GIZmLBY6FSeiOEJG4Wj3VMa+k
 +qKzQH2TpXeMg6UlzoOxfDBO+Lh9a1eNZ52OfGJZZoi3/WNtbj3HzJuswq/xpvcRbvibjJg83KP
 t9ZwIxUDnHN264+vM595HFQmTejE6YUpChMVPR9dyQHtOhqoXpHHpnChbPtwlSWiiNf+pceEhZL
 Hxyamr7i2Lj0O0bSD7r2RvDcgXgAorVzVtVqi+89pKlbnPBhHZ7JuspcoJEu/241rIR4RYiS9dh
 NMlXb8pk9Kn+338+qJvMmExcBZh9VnB1xH5P8MNw6Vv7+3GwbIr+4Ncvbd3bvc/UEiGb2NHaHEm
 Yxwnp0+cYUW8snCRuREjOMuGaFqmHUwp9qjFeni5J1mckh+aGVIOz8virpSMxT1lXR5M9HUnKu3
 CYY9vqjJ8pHTEFOJ+YQ==
X-Proofpoint-GUID: d50wJohkgB-jrLbng6sITla7SwFZprMr
X-Proofpoint-ORIG-GUID: d50wJohkgB-jrLbng6sITla7SwFZprMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111135-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C61BC63D317


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 1203172729fa..a6236b09cdbd 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -739,6 +739,12 @@ &usb_qmpphy_out {
>  	remote-endpoint = <&pmi632_ss_in>;
>  };
>  
> +&venus {
> +	firmware-name = "qcom/venus-6.0/venus.mbn";
> +
> +	status = "okay";
> +};
> +
>  &wifi {
>  	/* SoC */
>  	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


