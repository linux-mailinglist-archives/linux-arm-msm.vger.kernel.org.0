Return-Path: <linux-arm-msm+bounces-91082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BD4CA6LemkE7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:17:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76097A97D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907EF301BCE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 22:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC5622D7B0;
	Wed, 28 Jan 2026 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNd6cFec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYVrfl1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB52BE7BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638619; cv=none; b=slCLSbjgAJLgtOevfsoQe5Nk7Z+FXKyRicIB2y6aGZe0qyuUyjX+eoYTqPHLeYDGX7DxX2dkAoKVIvfGQe7f+qXEDkXcoWrgGWxHlVMd7RUwc7TO0Ci+G7xhNT8Ndam2W3h+GOm7pq0Xs5dGOr5A4m29jDIKS8EeGmBE4+srRwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638619; c=relaxed/simple;
	bh=YaESPBqOnkUcIkx/6aDkUMz4rynF7sBFcZ5NMbkuJjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyRrpynVI++bgyjU56Bzt/5eTkrv5qDNxPU9s8UI1iFciaahe6MAZbghVJW/5mvfhnZG/JWvRvZ4HjTO3hpqoaC/JJbjJPcozLh4xV+aN5wXbV4MBAn0E1yYqj3CM/4dYqoOJAJ0VAP4jLCQteGR3vHHhuraFl2iEvG7UJMFUkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNd6cFec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYVrfl1s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SGvNhC1315696
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78YU5e+9hc8xzn+2Vdz7AwKA
	cJfxmpv8KIN8i1ABzLY=; b=GNd6cFecJEr7OEvGkj5qttsZELuy5Dp2BH9wLqiz
	qLhK/zbHKatwGp9krlH4ERdHfHxOUtc63NcnPhtd5Gioh541NTTHpqFhggr8Hwzy
	BY9A48MGjriELAKkGS0w032VkrUPVdJ/qrI2TMz2ZVIK0UPqGHXxi69Fai9A5hHT
	zz7trSoJYvXw7HgDjP+ZvaqoYNd63Djp5rU4Yw89vTNs8cUFFshtrM77I1en0NDe
	9VO4ckfkcuXkMADh8vyGxn3PVCXWE+Ojl7m7DG7v82gy3i7Pm6SVgum76BNoeaRv
	v6lOjzii0EbVIkToRUu3eH5KY2ToNdaMdirCHaXl9uHLCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bype8s0ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:16:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70a62ca32so102193885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769638615; x=1770243415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78YU5e+9hc8xzn+2Vdz7AwKAcJfxmpv8KIN8i1ABzLY=;
        b=MYVrfl1sXtKlx90yVjrkx5OyqupKNw1sC1CyK+lG0eBNbL8keMp0F3FlKNQMWmGRiY
         3oAXcMTtZFfYArnGQgSlJY8vnCGh5atuXQ3ffFkDMLiJ6ALcFS7iqMm6N9GS30O1dHDq
         l9iY24hFD5EpKWbW9vkyhOlnWatbobR0TmGB0MSV2K+XY+FtmfyWrkx2qUhk12ARWL6/
         5aRBHExtMhqAwSwah9yLSx71KEfJGA/ZAL8280TOySzJ1aAc6t+M0T87tMp2acpM5UMa
         opWUAOj2qnWkPVDxI7XRtUpmBR/UwIbReXJvwR/1Dc9h2EgnZZYO6p4RkN3KrgL4/OqB
         AQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769638615; x=1770243415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78YU5e+9hc8xzn+2Vdz7AwKAcJfxmpv8KIN8i1ABzLY=;
        b=hI6G/3mBNGRtetge2+M2Hh2rW+oPq3hXOhGDOB2Rgg6scUs1JLu8w8YJODYHkQ9x/8
         XuToc3usG33R8csRbeS0tqvYbeln9uC3tbEflA/TWvjsRDJG5V96nZFIv4Z0gRalXeHH
         F0op8leAF558CEFrjkdfYxsBQYXDJiLlQZbQP8V1ww8knVI1Pjg+0iBAK5LTIslUblxV
         oyJtNtR062kEj+u4Elx3g9hpjCzT4NnUTSwcm97xyGncXJ9T91tI1aRxLmLh+qGR0/3d
         aH2tZkJ8/d2wLCS2dOunQFiVk+l6/2YTY62K/ZtsvxPzrjEg+P4/aiVS5GGjGJxaf4xm
         /VfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjXa5E0DN42wXNHAR8cEo95VtRBnH+D4L2D7DJ0fgilctqXbbtgKddDpiwpS3KG2YpPq9cQOjByj1XbUt0@vger.kernel.org
X-Gm-Message-State: AOJu0YzqtcEoJ2eh2sdd4Fg0BE//G81TqIx1XpxlyrjbXThHN1LtFcFZ
	s3+rXjEMXCmfC03rssJMclQHqRV9Nr14yFtbBYCP/iklOsDL27kVTO/Dq+21ONwXsFQyXGR0TCc
	VFdxShYDVvMf4e2im54vW+jArAzIUt2z1f8PzSJL4oZAKbOy20J7m14/SfYPWZil4UxtlphRGIo
	Zb
X-Gm-Gg: AZuq6aL79l+ll48VdLnahWUw+C4J4JCxqGnegF9nVcutkN3gs20f4Y8OUKyTgbsanbV
	SFEQAgihYtA7Vd695UnQIVh0hOlTEXq5TahqK8Fjh+06CVnCvKrxu/m5VA/grQ6iB+2NfHFSpUL
	d+5wPN0RZ4f+zOIzBKmsqfY9/FYKUx8Ao+SY6R8EHWy51FfvI6KU3h1VmFl6Px7YUeAj5HKLpq0
	iZGG9cweaVci77CuqCuu4YUQwyehpbuJFKauAUVPI5+KUU2+p+6epqtl1GD9OfaY5cqmaLvV8GT
	lWJXnFJMzknrv1xHmmNoLvGYnKK0mqbH3za+/Tp2SSoQzkholQtuNT4uciHJrOJAKtkOhoVpipG
	oDeTcp04mGqp8ntDhP4Y/Q7Bdnw3Q6ejd0MeGkZGpnPFmDYDpgQK6naF/OHxKif8ofkpok1NjGi
	oNsQ6UTzyl+rigJ9HkGVslpZ0=
X-Received: by 2002:a05:620a:2805:b0:8c7:8cf:537c with SMTP id af79cd13be357-8c70b871e01mr814909285a.37.1769638614862;
        Wed, 28 Jan 2026 14:16:54 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:8c7:8cf:537c with SMTP id af79cd13be357-8c70b871e01mr814905785a.37.1769638614395;
        Wed, 28 Jan 2026 14:16:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f9873csm6621871fa.35.2026.01.28.14.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:16:52 -0800 (PST)
Date: Thu, 29 Jan 2026 00:16:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
Message-ID: <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
X-Proofpoint-ORIG-GUID: SOQCMOTCeN_2ujtcHdGD8ZCJMyXrtb70
X-Authority-Analysis: v=2.4 cv=C5fkCAP+ c=1 sm=1 tr=0 ts=697a8ad8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=0AnWZtR2Y3YE4tC-k7cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MyBTYWx0ZWRfX77JgUgH+RgNG
 DISj29IukMepc5/zQRsa7Uy3ftBSHhxQuC2Njo20U0BugrgAA5r1JkiLZChdR6DZIC2wf+miyWI
 fp2/adaMxDJEiiIgGtl2rzZKoZ2Y1rZ3eDhwIstXHIDOSqw9A87HkFPJfz1ntoGsDRd/XplWgaE
 biaCLK6g/7FN3PfjGD+ujDBmYe1+Z+rxxpBONV2u6N89ZHNLdDRjuf9c5PuwqrGX8uRrg8tgOyE
 xP46ktARwJ7G/ESiN4zOBT7lf0vLR1FER8gv69PULgcflzrkqfmvK+0Q0qABx3n4COsODZ9P22R
 7nx8LuN1Xl0u8uyM8JJaPDdKR8BIQAHBpx+St20H00fNC3o7pjWv4z53WBdGZDTUBvNWL1rPWis
 7oMosCPEFzy+R7M01ZMb3nn74rzJyW+BHnJ8leVpUkwadUqIjsp0CS296O+AvYCVrORdRKwL8DS
 MIgSpVTJowbsa1UYAdA==
X-Proofpoint-GUID: SOQCMOTCeN_2ujtcHdGD8ZCJMyXrtb70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91082-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,0.0.0.5:email,fairphone.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,33c0000:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76097A97D4
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 9f9b9f9af0da..b1fb6c812da7 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>  			};
>  		};
>  
> +		lpass_tlmm: pinctrl@33c0000 {
> +			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
> +			reg = <0x0 0x033c0000 0x0 0x20000>,
> +			      <0x0 0x03550000 0x0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
> +
> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "core",
> +				      "audio";
> +
> +			i2s1_active: i2s1-active-state {
> +				clk-pins {
> +					pins = "gpio6";
> +					function = "i2s1_clk";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

This looks suspicious for the clock pin.

> +				};
> +
> +				ws-pins {
> +					pins = "gpio7";
> +					function = "i2s1_ws";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

The same

> +				};
> +
> +				data-pins {
> +					pins = "gpio8", "gpio9";
> +					function = "i2s1_data";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

And here.

> +				};
> +			};
> +
> +			i2s1_sleep: i2s1-sleep-state {
> +				clk-pins {
> +					pins = "gpio6";
> +					function = "i2s1_clk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio7";
> +					function = "i2s1_ws";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +
> +				data-pins {
> +					pins = "gpio8", "gpio9";
> +					function = "i2s1_data";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +			};
> +		};
> +
>  		gpu: gpu@3d00000 {
>  			compatible = "qcom,adreno-619.0", "qcom,adreno";
>  			reg = <0x0 0x03d00000 0x0 0x40000>,
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

