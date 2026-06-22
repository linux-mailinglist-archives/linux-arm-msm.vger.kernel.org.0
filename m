Return-Path: <linux-arm-msm+bounces-113985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 47xRAHYoOWp4ngcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:20:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A26AF640
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:20:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dITy+Jnf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="YE8g6K/H";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4463E3008A4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C822FA0DF;
	Mon, 22 Jun 2026 12:19:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1BC2F8EAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:19:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130747; cv=none; b=X0gqZNmMoaz2Vj4BpNdhKGTFtTw2Ca2mmMGj7+mSeplWPDHHsNLulw4YVurZd76aOvPqpulKbnMXHG43rDYsfLz1V8jNu6+SvHBaxAN7SIJYdhbLTT5s2oUBwoC2nZWSAhNxZdPll7AshodptakgQW7pCj/GC5rEtenedTk9cnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130747; c=relaxed/simple;
	bh=IDAQwkwElewdfh6Wf9mYqA+Yy4/BfY0aRhjuZlMQGxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdaxxkQ5qlpn8qJRvW+bwvbz4XF7Qcttlxag0vILIUfZdglXE09/421lBwXwOOzo7hv5Re9LKlpguzHpVpAawH//CbzyfHfHEJSYc0K+sdlyVuVYnkMHN6sZj+GWDxYRuesFDmg5vA0j1BDc4qznMKUDGXsbd1ti8J2qidIt9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dITy+Jnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE8g6K/H; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoeEs740790
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HeV8efjPqPS9nnwVB+vE4XQRlHFFHwy9Uis9TmOzdyI=; b=dITy+Jnfc9wiJxZU
	fDA8G1vgHoDCdn36+p9d1IX1URvQqd7CvhF6iy51qfjka7zwyKhY0OswHFYui9x8
	vDVCD3aIF7fkqZVNqpP8cNj6IUL4mLH6JdWHwF68lgyrb8j23wB2Io60Pf1FcaVS
	dVJvvSYJTbTKDS4xc0Ec2mRuNg2PanCb3TIfk7LZeha7bJ7AG55vqRvYNzYspOj8
	3HwvxOOCur3uvkw9EdtnSqbOFvzljTNKywMtix3LjFNWxKGk4cLMEF3poUJ+FSUd
	KNBZuRGqaYlcBN3ndovnvZSv/cJFMpuMJiG4EV3UMZJHQtfny/YsWzA5scA3q0Ff
	UNo5RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sefx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:18:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920eff1439cso30529085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130738; x=1782735538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeV8efjPqPS9nnwVB+vE4XQRlHFFHwy9Uis9TmOzdyI=;
        b=YE8g6K/HvmNAC6AllJMRJEGZ/jw0ql8+cv5CvP3L41bdtd+TLMx4ZqnYBxOHbgZfdT
         jxbCe3d+gATT3p6Q9OJipZQlfsT5XZ3D00fCdPXBlQ8NZOlcUewU7RRYX+le458mwn1n
         crgq79PtT6aholf5t99Kv4TQt5W83t7RvCi+6xp4VY5emXqpq003C+/rbE3XaSmQXXtR
         1Qfzxt4EquzVnA33piLJK3lvfoJDsDcfSENTnOF2899KNFkiDTKFXZi/x6LowRrdhxTV
         Ss0+b0JWU48iLCaVvE9GvP2bpaJ2lB5aVJJH8P4VDn+3wcv6JEmEVHYinJaG3R1HHjY+
         /Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130738; x=1782735538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeV8efjPqPS9nnwVB+vE4XQRlHFFHwy9Uis9TmOzdyI=;
        b=UfcTP2qRfnQpf//1KaX0GrV1F+K2o6635LuKzXEEevvBkKLwncDdT919PwatO6/X7p
         bk6T8z+XhshW3nqrSshnQ/jeAC41/1pgYAcs4Lv9BDQVqVr6GvNeGe4k11WqO0VqfJ4f
         Od/AKOHzw0it5YxFRO1VNR5gt/PSFO1SBBpjiFYo3KpjreiwAmy3A6pUoc+71HCLS6NZ
         BAlQXVbCyDThl3O9J1KTTx5k7cCDb09uIR2RWhMP3hgdEim+UEyxTE8kqJ14m66+IToF
         qTTx/FV8I8GRHV54TVTGZYtnfd71O5s7gykzomK84dyl3wxxyb8gwM2icm6xln3n2S/T
         Qe3g==
X-Gm-Message-State: AOJu0Yx1NGYcIg8lrEqwyefjNvvyRlFbSn29k5wA/ytj7degdbfgHO2Z
	LDPQgUvWLZLPDkcwHjVPrxe5viwq3JrnQ5AVezDFvlmUhoVFPmcvIzKnu/nlyLK8dboSuMAMj03
	YkK5KPhYmjtVK/HguRTodZBOdnjO7vVq7V2dSYgvgHdd9ATla24bqrbdLpZM4mnHuz/wx
X-Gm-Gg: AfdE7cm0pfxeF1WrHRFtG2mEa/oxkr+I68waulqGMTY9kQEUeFAI+MU+He4oEIP4dS0
	VvEoGiM0qSeTIi1wNi/rNLvOFfHk2nBy/fINGjzHVP1ylJnrcsu0x4WjHbnF0hLkmvxBU4Sg3/L
	zFFJOrqkpIv3cnmklHuvVPObXEgc7XQcww8qOoQMnyacgxpEaWjtHMTi4Yp5bauGUMN690quvnZ
	GMh0GiVhUDlp0a+RUgdbvAvm5zOMUyvAmXG8G2g9Cfh2NoG6a7uf5idrPNwZBD52ZPeAMezaXCI
	0tIHRvheTSxhGIgjj/Oyztyeqt83ouuSRzFMtANFXC2FxZk1yWA1NkVGqyr/kNXUCDtkcraBu1l
	8+GzxRZrIEh3EsUEwQcMDsINDT9ZUqsCiV4E=
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr6047685a.8.1782130738221;
        Mon, 22 Jun 2026 05:18:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr6043785a.8.1782130737667;
        Mon, 22 Jun 2026 05:18:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac9406sm349372966b.38.2026.06.22.05.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:18:56 -0700 (PDT)
Message-ID: <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:18:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A10dBf5BIz6HVM3mJZ5CA-oTJXtrKb4a
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a392832 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0OB78NtceWqr1_yVbOgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMiBTYWx0ZWRfXy6JhMsrir3eC
 IasFj5eOeKJQ1+Xcu99CksFFHhadDpfTeoO6KU4OjmRshes2y8uLkCOQBGqRNp2T4KbbCMp5hnz
 rrInL4uLmVOtKpg/3qSe7+Zs7PyH7q4=
X-Proofpoint-ORIG-GUID: A10dBf5BIz6HVM3mJZ5CA-oTJXtrKb4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMiBTYWx0ZWRfXy8I6Pge+28yu
 1Kb0jdn52isuiV+41LDUupz7EXOhAptRbAyZtRlPjy6eug/5GTqH03T+adUQ/eI78W48Y0w4leF
 x8nh35X4PbP0VLF8iwizoj5qnXdkEu5woTpQ1GAvOQ2gSV7vkn0cuRh00d7tLKD6+Rw4vwIKWrs
 ++dPH5icbqrlqh5qLt3VP6iPoA2SgBJ8yUz161YCOePKmE4DvIpWV5DVvxIc2hYSNeGlNR8a/Mz
 bREHWJPkSb+jkljCobNx688IFZmFv21D6A/t3ALbHwEmCwYcmWU+gkYif0LdmpZ7ITGbRfJDYTN
 lnb1q6w2i3aIt4SP/1EfJ98QLmC6gglTQHrKKtxyE6F+0BcpGDovMPoDnY8vP7vQyRTcJsiEn6+
 1KW4QMSJph9TH7+m+HpetJN5mhPgW6cdCaeAOqyz9nTFQS1DBVx40BM1HkHnsA8kH8GpbyXJ9XV
 NZriswIwsOlFveI3SKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220122
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
	TAGGED_FROM(0.00)[bounces-113985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 434A26AF640

On 6/22/26 7:11 AM, Qiang Yu wrote:
> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> LDO supplies for the PCIe clkref paths on the CRD board.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> index 9c8244e892dd..8b42f5174b31 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> @@ -19,3 +19,18 @@ / {
>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
>  	compatible = "qcom,mahua-crd", "qcom,mahua";
>  };
> +
> +&tcsr {
> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;

The supplies are correct, but QREF uses refgen4 on Mahua

There's also rx0 with a 0p9 supply on l2f_e1

Konrad

