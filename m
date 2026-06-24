Return-Path: <linux-arm-msm+bounces-114307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8jFBNeTO2rWZwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:22:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B46BC8B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:22:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XZ8omU2F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JJoMOwdL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114307-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114307-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C39F303F27B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970CD3AFAE7;
	Wed, 24 Jun 2026 08:21:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B63AE1B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:20:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782289269; cv=none; b=ces4ASDLdtDKHziRPXY/YUPYnPgfCd1L8DMUnRg9EBbZrJFCcG/DXcqd7NuQyt6WlMW1aBHz76kGI17Mm2wkM+ShBPkByBuRNPopMG6VceeWVv1JgCsB45wQdxGqK7yf8vweHVWd4keQmXFi1wXv+byGWJtlGz9yEdTsU9zRF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782289269; c=relaxed/simple;
	bh=eqxV8ikdAhRlOKnQYkoOSbqnMWTaUUEpj4RuibxQVBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swn+2LgMrJ9Jy21hXGB7/Rycn5i2tJJuntD0bNI4AtJc+5Ve8CVM/ykdGuiQYW5GWJa2E+2ZoFqpw5h7wPCm/gnPJ3j0ihAq1weywdancnx9JJ+d/AWqbPxiM048F45TMz7Li4CVaFbyDDq1Lk/TMqnhqYuorvmWX6SJPGBPhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ8omU2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJoMOwdL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uIuH1890132
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=; b=XZ8omU2F1nlSabnj
	bCAxzmGa2Kve3Fm467JkVrfNp/88MxcSoX0rWSj7BSsY/syyC1Vc9dS3d+yE449+
	ptwUxqu2BeHaCA/lTxpZTT029SLLWvSGh+eEgfNa0abJZ/HMeQeFW1w679RIW7W1
	LPTjcbYH7KHnqAp1baiL/nQkOJnBBKrcSAJmuDVCfkUFUlqiSB6WuPw/6VlhNFv7
	S45rbxmxXOnI0IR9DC85IqtSHmHROm0bYOxoHe/fgTARg3sZNdAr61w0eWvPpS5S
	4Pe1dlKss+O84benyHEFoonmefcVM44Aqoqm1GjzaGzzKGS4j344kPp+cb6SA3cy
	dnzQsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3m3gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:20:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so1555801cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782289256; x=1782894056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=;
        b=JJoMOwdLqc486JxoNXb0n95Sl1esMrtot2GJ8poLSWGmrWq5raJQ1DncABM59SXYBX
         GQFqqvoXFawm3wwAl40svu3TYPnDkkzX18wk4mF1raU7uMkJR5vvw4lhhHbhT+8+b2gf
         oect5mMh20p6Pmg+9kYL5hjoyFLloyVGwtMocWhr509a85Gwcee4zDa05WXVAuUlDVT+
         7B7fcTf5BUKO6+uvZpLZl2Nn5XnF7y1Wm+vUcR505UpQ5Y0riEXb+aXlvgVlcZuoS7ta
         7Dt52Vjk97lpuThCRt1c/KWksMQJISutMgs04dTzSTqkWql7wLRb7tfygZh7sbWSMLx5
         E4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782289256; x=1782894056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=;
        b=n6AycbXmNhq7ReJMr+OsbYPIJCYIxLbw4W4QKViWMhw+xBBfRhK6B7sA9VKSlHq/3o
         CB1THVHojj9kT2tUueCuDnMWmJ8q9QGBDDGIlANJqOzdSbRwJGk6G+Zyb90FDB5Rq6b4
         NO4X+9k7zhagi8eJcMKaoIf1BjmXajHUmC0vepcOPXR+GckxX09dNO+A18mcMzJLJ8g1
         YWLVCiX77hj+7MkiJvtYq4x9ch166RRcjfjigZxmWj1Kp0jyt2zDmftyWTqbFak3U//D
         j++jD4iCud0bUy8jC3SeeS+p0gjq22Oncq31kyuObZWI8k7z1ACMpHBeBve4wLdA0qCk
         MV+g==
X-Forwarded-Encrypted: i=1; AFNElJ+0OFK/qBrIRpcMhAbsp5pFIpjgXmL/IRw4IAEXMg3UI7WP9d+L38ZQ/UuC94mtRgAx6VjKQTu4JPiUv45i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ejQvB5oWIF059kccE6PnnECwRToeUahqVU0smAy9lN40sAHi
	J9jr+OdfQ9KpJrhkUE93awhnvtQk/IAIkUyPj7BWSivm/h6LqoX7KUN90XAaMgHwr37S42tqXDf
	8XmcTUKVShsnD7oa0fPlg4koRXVBPZ2JOWEErxMdJ9AOeBj9/8hnLw0aGlDmzwS5n2I0L
X-Gm-Gg: AfdE7cmnYrzcpiUdpFV29sTrs2e05zmH0gsU0YIbGTNi8nMIti2wg0tqa2OEPYS8DIt
	SLr9XXqnLPg+GF7yfSQklMj0hjWndr30F15otLNLCflbLXlbfPTWqGGdxOn2/96QBGs3/xVGcIK
	mb37K8NuDk6kAxESRXX8goPFvt89xXZVKyBWr3/Pn5FbxZeqk6ZKMwgMhr3w6W8LPr6My9DGKn0
	kzxSry/MBNRuV36jxXtbfE8qvVjlKr3qQIIhnnGI1cdIfmXhjJSLopC3qKF7LdRfkhFWKSIz5p0
	JoB02ZQBKB4n3ctOtOsNvkFgIjBXr37UDhYZ4FCqvVj61AQB1ar7zFsllPNc6M8DlJJn70mHlTD
	PD/57IY1ZNvxl+QZeohAPEtpK8iL8IxDQjZw=
X-Received: by 2002:a05:622a:85:b0:50d:ec32:b84f with SMTP id d75a77b69052e-519fede4b59mr184248061cf.3.1782289256604;
        Wed, 24 Jun 2026 01:20:56 -0700 (PDT)
X-Received: by 2002:a05:622a:85:b0:50d:ec32:b84f with SMTP id d75a77b69052e-519fede4b59mr184247811cf.3.1782289255987;
        Wed, 24 Jun 2026 01:20:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0ff4c9610bsm279261466b.42.2026.06.24.01.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:20:55 -0700 (PDT)
Message-ID: <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 10:20:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2OCBTYWx0ZWRfX01CPSoDuScHp
 sKf33/JRIlTBTikka5VEwiZA7b+Lyft7X19R1ZvcgXmdgNamDMRRSr2NbCxavheimlWXWcl2LN4
 xMPoJTrXMoBoyMddgWvHXohrd4D61ag=
X-Proofpoint-GUID: n_isJiu__r_4LunyzYPKv7DREoiRNNKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2OCBTYWx0ZWRfX7M0p3fImB7J3
 zdOmZ8m965MAOHT3isJMSFKV8gWmuA32O+vu1Xn2Hlfu68CsEg7jgg/sa2vf64QQQEpVPKWQ0vc
 753I64QWWugn553iWFqd029YxlU9o0ouM3l+V3//+E2LhzcM4vzc4mKu5bbBdDP20FaVki8dgZE
 GcGFgXpNHEsiXQHN/aqnBTYhxoNxwC8NciPCbztyCYHIQHDO1B3yxmWbWl4ItLKhVtVyx9T2zBH
 BVMTfOUQUYnhYwQDYkDqdQlkHYcHyqnLAVlG1RXfeSZybyoSnAm9iOURponeYsn+u8Kir3fxDTd
 kc6EV+O6bGloz1r601+DLQAKzKLHbStC59ubEdeaeAKXtZ/+Z3QOIS8nhC9lu7cXmNizV73K3T1
 N7f/qHNM8vrGCelDJzSYRrUXXJIyXw==
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3b9369 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-pUKfWG1Qq1qEUPvZNAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: n_isJiu__r_4LunyzYPKv7DREoiRNNKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114307-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:harendra.gautam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 937B46BC8B6

On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.
> 
> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index bc4ad2bcbbec..e58c87fc8cb0 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		qaif_cpu: audio@a000000 {
> +			compatible = "qcom,shikra-qaif-cpu";
> +			reg = <0x0 0x0a000000 0x0 0x20000>;
> +
> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
> +				<&gcc GCC_LPASS_CORE_AXIM_CLK>,

Please align the <s and "s

Konrad

