Return-Path: <linux-arm-msm+bounces-92327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA05Lij9iWluFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:28:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5C111E82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E14F630074AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 15:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2721B37F73F;
	Mon,  9 Feb 2026 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7mjjZtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dv5sv93d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2337F8A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650908; cv=none; b=gWbfF/bX+EvuRCN9HiJFrYonzJ+9wtq3UixGWTdkipED3maDOTGuWsJDXBnCwFdemc/iKELnY//MO5/RoE5wycOtRyWU+9S9wv9btPHlpE5mqpVtWo1XFFX4rTeK82Woinpy9Qct36QpfMpuSbf0udpU3tzxmUjde8t7oZOPesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650908; c=relaxed/simple;
	bh=2J1TwJLAkT0qb7F+VSSHbbeFKKvRSDVNoM+mNHAajKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inHw36wQ05dNS5GdmYKPgWGXkseeHA17Hn5dKkCs7BL8lcWBUz2iH3yJONJzyFlSYb+3BT9pk7ZBSdUcJDgrjdhl/aeFZlus7g4BC6n1UuNxtwCvUDU+LI5yOlJdGMdaUjGS0f/l7xtm12p+ryZzAsiZTlVkbsz9e6US+3aMRKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7mjjZtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dv5sv93d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619AEgmW2381059
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 15:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7pTHu8yVvZklYwlRMbs+abUG
	QD7YxrhrgiP2RRskjIM=; b=b7mjjZtgfbEopFr6d6QFO8Bhe0Zy0J6tCQyOvwdz
	RmPrg/uphJFhYGHSGe6b+u8vdBMzvQGvcXFIiblIDxnICqFYWCApXKedZ+NvFmX0
	KD/MSLlUjZV2W83G/Rl/xM71K7zDuhCQKb0ZC0ly0MwAFLVkttWAHv9U11jYiNLM
	dRt67dIOVyIEAK6Mc4dnpnxC+oCbO01w5SohT34hPB9plq+CMwG0fojX2T3GKmPf
	K6i4lx9rW7mgoB6L022vl1HvlYRZZe4SVhp5Pb7Wad6MWI+PXe+PDG7KA4CdRGCp
	qE5PQmisQwMmkqFoekcLsoBY0dyIDpPdIAcvqyr0Ru5Fag==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78gdt617-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 15:28:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f50f008eso66492336d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770650906; x=1771255706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pTHu8yVvZklYwlRMbs+abUGQD7YxrhrgiP2RRskjIM=;
        b=dv5sv93d/a4PPzP9ADwenORRbQQY5/M+3R/zJdc76GbPeZfy4YJ8+P1GTmBhUwSLKT
         Z9TuppsN1TfQRtwVmzQxNbDON3cZ+/w2g4FzO9qFIAYe8I2ts457oLjEYwjaJStX104n
         Yavuidp3efawOlYmfMxece8my06AkHTSXxw3b/3erfcDap0toeNoLAZsUFv+uOjdkNS6
         /u5mZ9oXVBmwnLb+0mCy7touAtSUATkzn17q68bhDbxabJv0evZprsEvZSIKl6wboJXn
         Hbkx/nk5EEI0bC3DAssOWY7UBg446VeU4JbrkzrR6xD0s3bupLPNep6dbILkvKBOU8KC
         C5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650906; x=1771255706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pTHu8yVvZklYwlRMbs+abUGQD7YxrhrgiP2RRskjIM=;
        b=Ow/AhYI10QkClwZLGda+f14KfrpCqTcFQvAW3qHcPkrFFI57J3onajwBdKD6ubfZrv
         luQUQkUfXPLFVolvtuhaRnlZAkjZV+TtxlT1d/PdwWTANRhfEsTdHNrpM7wxyRzlhFkt
         nWXpohaeZVl6sLKOzr9AFYJ5ilcAlz6qCnZxot1gnDeD31mQmXsnkRAUcE5jztCTyGFY
         3Gcp8F4WqYl/4wf7TZ0mWcYKJhukOIG0FLk6VUg0ZynQAhA4hZAmzvH/9TvJ43VR9tok
         21DFgkTFCsHiRSs/WfCNv0VkAuFTDMbLujMUrEM5UMlF4GpRfo4mRubLWEtPx0EjcUCf
         PE4w==
X-Forwarded-Encrypted: i=1; AJvYcCW/jR7223DLfo19m/yvf28Yv02PT23cSQM4l7iVq5o5EVH3lbvrUatAFD4fvVecqrNkBOAVaoN+ijXaa93Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSgQDjWdGFr5UyxDDOTBJCKz07Ka0OXcMqDgFgP5yP4sscprx
	j6roKptUB7V8VObmjnu6u2pFgh+b3EKpmamMstZQWRm1jfG2AgTGUgJCKqTG2Sq8KA3Zy/GL4gY
	9XhsI6MtgeA1IL0EJ4HGR2XAikYb5VqcboBvAWA3rWpf4s0ZMB29ilYSnSd/WiPyjgjXf
X-Gm-Gg: AZuq6aJeSUPNKHjNQjKnRRFnkFtGweVC1ckBnV9ajHH7uMgDKLGOTC/md8e22/fH3XX
	eWnPlW89hrqqyahpQlfKjgCSxs9SxQCoxxoMCTZyoqVN8X/h+FKEpWF03savQoZ4SqRACnQgfOJ
	JzDBKtWLp+cyn5RC2oLbwIdGxPHexUI0Q9PLybr6u+l9EX0FOPH4UOrE5vlnvIKXocs+f13mSpO
	oAdsIXe4p3L8frpJhhnHzy8WbbN3IDKTnM716jDo9c9JjhBwCeF3mlXI4K5NoA6Xz6FH0+/a5/C
	qb2YRsjQ0qPLYnSdyJaty2WEH4aj2lim/Vw2ZJqzltgdC1vaaCCRR3M2pQG4jGeU27W6FANLnbF
	tLjP6NDdOdwacf4aSWR8k6u8Io70AIIQHxbnU+TRWtvi74exnPqHGIcLSGPuubY/Z4VDATBFds3
	Y03uNFOoYFiCXq16BopP9Opss=
X-Received: by 2002:a05:620a:25c7:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8caeed3b00bmr1556926985a.39.1770650906220;
        Mon, 09 Feb 2026 07:28:26 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8caeed3b00bmr1556919885a.39.1770650905569;
        Mon, 09 Feb 2026 07:28:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e46c5d5d4sm2528406e87.50.2026.02.09.07.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:28:24 -0800 (PST)
Date: Mon, 9 Feb 2026 17:28:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
Subject: Re: [PATCH 2/4] arm64: dts: qcom: agatti: add LPASS devices
Message-ID: <pybu54sir7vxjlrgfqlplulxgnafyemnpebrf6jl2qeldax6jk@icoefmculftb>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEzMCBTYWx0ZWRfX1tAs/+DDpc5l
 efbhx+iz+/t4D7IK8l1QE9F5yQmpp/qf4GkI8LkkUCVOTaDt6UCowDQStANnvrst5ffZVEp96rM
 SNl13UEpfYuJO8IZbp0DogTgk1ls686lfJDRpd0kBVKbGEjDhdBBWbuVVE0hgj9Jr5IgSp589bc
 Mr8zbw13Zobn0GAN3fwrgOfT/YAKTctwasXm0xmxMQdBQI22y4/HWAbw4NwMuHAsrgOYDeEthm8
 j0GBgjQbBnYTKqrRMc7hyEDgiMheQPy7AI0GkzdpEh8ozOF8cHfXj2VE/v5s+vDtIcsXVAgpW55
 OW1kE1JeHsULuW97q9xJSgrmlMLH6dMnQ/KCSgy2ae0Woxm/pWN5+ElItKld37UUmzDQuTipKuy
 xyLabsgX7NoRAkbMWcNAkeG5LBFdOl0iPPBbCG8dBqW7mawaJ8JLqrQRM3IzW1CeH78e9jQnuWB
 8yn2Mqp4tqiIWSWNtvA==
X-Authority-Analysis: v=2.4 cv=Fv0IPmrq c=1 sm=1 tr=0 ts=6989fd1b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=wwjenF7iYuOk8anNssEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4WC9dmqJqwvJbVPv9TLV7_zB8vhus4UA
X-Proofpoint-GUID: 4WC9dmqJqwvJbVPv9TLV7_zB8vhus4UA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92327-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,a600000:email,0.21.92.192:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59B5C111E82
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 02:24:26PM +0000, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 189 +++++++++++++++++++++++++++
>  1 file changed, 189 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 76b93b7bd50f..79cd8bb8e02c 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -758,6 +758,42 @@ data-pins {
>  					drive-strength = <8>;
>  				};
>  			};
> +
> +			lpass_tx_swr_active: lpass-tx-swr-active-state {
> +				clk-pins {
> +					pins = "gpio0";
> +					function = "swr_tx_clk";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-disable;
> +				};
> +
> +				data-pins {
> +					pins = "gpio1", "gpio2";
> +					function = "swr_tx_data";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-bus-hold;
> +				};
> +			};
> +
> +			lpass_rx_swr_active: lpass-rx-swr-active-state {
> +				clk-pins {
> +					pins = "gpio3";
> +					function = "swr_rx_clk";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-disable;
> +				};
> +
> +				data-pins {
> +					pins = "gpio4", "gpio5";
> +					function = "swr_rx_data";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-bus-hold;
> +				};
> +			};
>  		};
>  
>  		gcc: clock-controller@1400000 {
> @@ -2188,6 +2224,159 @@ glink-edge {
>  			};
>  		};
>  
> +		rxmacro: codec@a600000 {
> +			compatible = "qcom,sm6115-lpass-rx-macro";
> +			reg = <0x0 0xa600000 0x0 0x1000>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
> +				LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

Plesae correct the indentation (or just use single line for each entry).

> +				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&vamacro>;

The rest LGTM.

-- 
With best wishes
Dmitry

