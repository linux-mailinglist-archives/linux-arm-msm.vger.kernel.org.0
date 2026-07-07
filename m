Return-Path: <linux-arm-msm+bounces-117202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tp07GOK8TGraowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:46:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B12457194DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:46:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Oyhw1lSD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WCJ255l/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 026A8308AC59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60F13368B6;
	Tue,  7 Jul 2026 08:42:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB59532AABC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:42:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413751; cv=none; b=Smmzs/+F77WjI6hkYeqtE6wmB7HVXP/eFBmPjY2/tcSjHXwB+B1wqgm4CQfrtv9DRlkmUsFvmTe36vlAe17R6sIScDSklKA9CVl+FZOin2b+Jh3gJblUgHT3CPpmTPv5nOnt/EN1npP9V4wOVyiu22s238ElvTGAZKfCpcW9jFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413751; c=relaxed/simple;
	bh=9Clv4kycUDaVV0xTGMoMqexHiVMn6qAEnqOcFikoJyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6VLd8acohK7oCfeRebAXxGRBp+EHjPZC0mZCJN2N9pA265H8K0OQhGjV/kwxNNNRFZNCjcIqT7wwHNdqjp8GgmNr72HJnfsBTAUZmhSCqpk5unwzSvrTjSCY1RirnktDQrwOvaD3KU8gVbhvOrLZLMN1gxg8vWMTqralJhsICM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oyhw1lSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCJ255l/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678ECD13231442
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//BZ0OZ5vthdBF1GQhim3cJNFqRRuj4TjBRqHGYgs+Y=; b=Oyhw1lSDhmlgyDSk
	KVcm3kp6wbxuzri7HGsGYiEGj7oKRoRGMAnCzmAMhkW+0RdJDUojxlcamKYoYbqK
	xnJiC22Fa2bwSNTCX1M4I7oH23qyTkCn9wFgDFm0dRQSG6zKVl73GMHV5qgbNIcy
	CRt5uRhBqtkBxPLGU+xUcVyZCCLh05VNIzDu3L+Dl4wAXRMzQuNKwfmqYHpsFWqN
	VSx9XK81pSz2H3jyNt0Tu5ezuypn+ftLbuHrEvJzHBRZi/81JYIEJFnY2zSonnzj
	XX53QeqLKpwZ9AIDk7tgXxUTEQU+8QrZX9AgITBOoaXlrbscCSClA3l88reLicIL
	+G0McQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79h6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:42:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c298a1b20so8078951cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413747; x=1784018547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//BZ0OZ5vthdBF1GQhim3cJNFqRRuj4TjBRqHGYgs+Y=;
        b=WCJ255l/qUFUbYbvSC9oIXKqu+Su8QxzZmSYHSfeHn2gXHJCQ/iX2BWLGEgB2EHcX5
         WiH7IJ0V26mzNFXE4JzXSvjQHXlWtTio0iRvT1XZJ2uu31pqDYa2my6x+Ibtqc3ssqH1
         z2t+C7PSUTlilCg8GnmLC13Z0NxvkrcIxoOEjFv0p4WyPLhW5MgK8ER168slC/pZ0jKE
         KrFlCPYe3GWRkV4sff6cYC/2dMlR4qszzp/4rbR//ITxRxif2G1FrTA1volhrUcrVrtF
         s1lYTdRDpFrAeG+DcT21zpLwT3saH5QMqjYnGe3wQRrpOBPGW6GPvA+rAnkW/aQFGZAi
         yMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413747; x=1784018547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//BZ0OZ5vthdBF1GQhim3cJNFqRRuj4TjBRqHGYgs+Y=;
        b=Rg/1/a8krh90Y0jeEOpImHBoP5xGcSKHCjgua8f7zhWOjp2LnR0ocABEH9aNqcETxg
         Zo6zQ3t7YZaXzDD0rBZRKEAvj3C1y+6yeF0sRbhaqa7KMKae1/GYlP1BkW/aBjh1hWv7
         LzCHynXiBmqE+8LMvJ3LaSSq3kpoxiUarOGVVpOqBMoPExjk7nnpyOuHdGGdGl7n3OZC
         bOO/Tcs0xUewH83zNRO6RXM/iyWbYAQH+bRV60x6Xne9IpfBBX+bHC8sSJeUPLc6xLiF
         eaRUTfGyBsj6aqgEFXNbJwF9bsE3BQ8I+lINQhxRAdRhrXHQ65U0oNE8Z78dVN7v0G6y
         YHqA==
X-Gm-Message-State: AOJu0YwKiLe/WHJhyrVRj7yre8kVbSdXWk/8WOcfIJTtW3LNmY2rGQTx
	FnNYE2cFoH8fANrKCg9wa755FR0mqv+1fy8qjaAD8RZnejI1VcWAVq8BR1mRwUo9EJMim4UgxjQ
	nQlEg+sVJ6fkICwrFAA5Sd1umZ/iluRPEC+sAgHeFKhDn1Ay1i7wFVyTA0/3EVqe6M4kP
X-Gm-Gg: AfdE7ckwqQwfHj3vjWFudnLq2Dymp48BKh5XdAuB7zWNA5KhULumqGDCK+ibQhNLuo0
	FOHPM4KuNnfoMQPZDY7jiLt5JPR4h/mdWLdqBgsbKTHlyxF6wPsct4rURK8cGWPY3INXJwo3oan
	9CIEBBLWIrXBKznDLUh2pH86oN8Z+w4j3GW+vUzz+6wT9wWn+ZLzIorYwiouBb5r1kRErV2Wvvm
	AIAnoOJFZPT3rONjYGuSNEyYdAYp8LrKc/96Us+bP7AxikekXJksQZcMvCxpqEnsjsrmc3h6dnJ
	fiCULvB+hRRHMsQcGhHw4ciZR4QlPqgzGMBxP4itqLi5R6PGfns7uY1oGIuqcnsePOaV7XY7xN7
	v9pFvi9INXosr29wqIdJFYf9UpwHebmAY/5o=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr122631851cf.8.1783413747094;
        Tue, 07 Jul 2026 01:42:27 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr122631641cf.8.1783413746639;
        Tue, 07 Jul 2026 01:42:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada0352csm83528366b.46.2026.07.07.01.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:42:25 -0700 (PDT)
Message-ID: <399abb64-be63-4944-a8a6-3290cdb167ea@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:42:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-2-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703083421.2736184-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hh-nCUBHjm-4jOc65eqJY74pAD7XaFp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX91G8oQ2jWDj1
 avzcK1MASAHGqAVaOP1tBgVmGgaFonca9f7zNCFNdFxA3A4NSAZNL+wl173V9Zs5Am1yfmSTyNd
 Fvnm5uHHyzXr8LSKBfwZh/Mr6i1mrsQ3/zDMK9fc4jt5oEtbQHCdhfH3JhtP6TsYzKsUoQO4APH
 awtxogfK5utlebAbZNCIcav+tY6UAN3f7GDpTBKqEeqpwdvEWE/t05SH8xGTf0C+mUdWSpuJBnZ
 TI8/ThWZoh2oJjbQS3olezRALqbvDjkH4eYSe0iDSczHEHLwl76LLR6/TqxYcNhC6RzudtbhiMa
 zSsitHdAupSpu+/rUbEalkyOJTT7WjD84zAYeD9wX2CVqh5zKXcYxqh3n7fbSFoigF2Mh1ACx5a
 0P3lXtUbquwaI5ogsYwoJW7klL+lAIpy9zUabNR80JH0/0C196WuDZrGgX/3p3G225R5ANX1jwG
 DRPgvE47DeGFmM0gOeQ==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cbbf3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JKLJYZvhQjBioqf0m8wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX9lK6P0PtcRkn
 +1lZMiqLJDIeEpOZunFZ3UAyKZ2M3wuIyyIoIwXA2wr11s9J1rtWFvacliCciIQGA+ooz+Ap1TY
 F/cBktfGUFT0v64RQDN9PYlmXFQPMeE=
X-Proofpoint-GUID: hh-nCUBHjm-4jOc65eqJY74pAD7XaFp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B12457194DB

On 7/3/26 10:34 AM, Ravi Hothi wrote:
> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
> defined inside the LPASS LPI pin controller node. The hardware is similar
> to the SM8750 platform.
> 
> The WSA macro, VA macro and SoundWire controller are kept disabled so
> board DTS files can selectively enable and configure them.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 193 ++++++++++++++++++++++++++++
>  1 file changed, 193 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 8dbfd0504598..142f43a1e6a3 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -19,6 +19,7 @@
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -2072,6 +2073,198 @@ lpass_lpicx_noc: interconnect@7420000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		lpass_wsamacro: codec@6b00000 {
> +			compatible = "qcom,eliza-lpass-wsa-macro",
> +				     "qcom,sm8550-lpass-wsa-macro";
> +			reg = <0x0 0x06b00000 0x0 0x1000>;

Nodes with a unit address must be ordered by it - the diff hunk
above shows you that this one is out-of-order

Konrad

