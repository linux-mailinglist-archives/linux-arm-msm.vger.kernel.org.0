Return-Path: <linux-arm-msm+bounces-113052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bWMzFjUdL2rd7wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:29:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092F6824AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:29:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X7xhvreo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="jV13P/CP";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113052-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113052-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C934300AC08
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2A433D51A;
	Sun, 14 Jun 2026 21:29:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331E324705
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:29:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472551; cv=none; b=TLmzQj5CMp+S+Hr/8cjhNZN4FPq3xybtyUib8tYRHK7ZGIdrb2NuYFmliDLIdXPVGRjZyxhCDiYpR/IHZNnDfzWLGAa/zyiUCbhnPXDtHBP9iSXnNxIbT+ZF4yqpPc35qqlsfLhqCrT/wZ9nsvB1cJOmTt4U9nNkIHG53gtMUZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472551; c=relaxed/simple;
	bh=rkwnz+igJhLSHd1/g1zNsfmNlAjsiP1DTMIeA2PxKKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2MSwQdEF6KQcyogpePuYnekq6XpKrqzkc1ufn9rwytWtLvUdAzYpq1uC+dsLtEJZTw4UwBJT0mxPtdgRzPkyowsi3S7FbSHqPrMk3+5NVUKP70k2aWwkyWF0yoHLXUdhXRL4cNL1UR91dBMbwXiXAjLTjZYE5wNOJ63H1D05ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7xhvreo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV13P/CP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELF9Pu2185388
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+UIZX+yrm8NpkbBZgExiV/8q
	eCkMTLOf0NOLfbd2dfw=; b=X7xhvreooleITjkkm9bYeNm+7FTuGg1nMlulEQDb
	u3sU1IQcssaqwvDdRO11Jpr/+QsbMvXwUeeNvtabtk19sxVwxxj6lVHZV0EskUIk
	tVnWGzKQroM65MZi2RgVy0gQhlGbdiK3cxJ8y177lADm1YlBQV/hsiiLt/SzewbH
	klWziuyh9Qj6fYTnhxPQ9xKefZL0w2oPl9CK5+BjA7J0fGP4d4m0sidaqbbqxGEb
	BUGwP+lF4upVIeoRsIKkyTjhfZpJkgJDkOEFTp9ZmQGtX4fvtKwLb8sm4EXTuCjI
	5JSAjzB/Kp0G5xxWKK7J4Mo1fWZKS6HRgxn8Qpe9BgJ80A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgmdt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:29:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915f6ff639aso807111985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472547; x=1782077347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+UIZX+yrm8NpkbBZgExiV/8qeCkMTLOf0NOLfbd2dfw=;
        b=jV13P/CPn/ri2FIwsB3vWi3GGvWDnB9KdGRCrL0V3B1RYJClWAENqyjNd/UQp3IwAk
         zEZdbCk5+a6bqmN3P9wEqaVy6ylit0zWRhx6lfiC3jSGBYG+OBK81z8WiIofv7KYG4F2
         3hpP+2C2fHMcyyS8aLt5RF0AsrQwYYV4U6ibDVoBt61xQnyRcgByYltOzp45ztZZJ6S6
         eZ7MWij6ArfstJFsYAV8lxqxgsdGeF6Iw14E0VcKvc1q5aHjEAnqdWikO1Jzq/UAssH/
         x3wpI0cXRCen8cheqr2Q1OFGZNeywxHGjDl+dHxDGN4CL/dUrhHY9xktjkvk2gJ5I2Cz
         BmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472547; x=1782077347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UIZX+yrm8NpkbBZgExiV/8qeCkMTLOf0NOLfbd2dfw=;
        b=dh3BmhguItDnJpjTsBf0ImQupXaJOmCN+/bHTXqg9uxwKXpemmWpNhekwSgLJTFho/
         Bkuzkn7MwEPxY8tZlIERciqgHljL4c3teCY2oMdjbGHF/2S6llSbnRrITBq/v8GBF7dL
         KzUF7lZfqHgILX9ubwKTuoPDXKE1ZvS3H1nCLg85sZ+TRVD9492ALZKYRBWwt2UPPrjE
         3B/1yTZM4SJ7JwkjOy+3uTa1Gd/ZDbcaVyKRxIkx1H9/gyjzhoYDf0uTHspRKADru6JR
         CsQ+2ZVvVVZb9cW35t1pCf8x99QuWigxaLSm6hMIwTjdNMiaVpkzcXRPD0pD5Tfj5X8g
         A6YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Trvnf/+YJOhldxbGVRe2oMXI8xrbEeOJio4T3bAQQGU0sz3qJ1TgJL3CeQ8MgfI7ZlkmeJEfTF/F4f03B@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNKTF3ucn5oH22lhbmQfQLxpr4uoKTtXaRVsSk4cRLPpuKsy8
	dOAFbChWQnuJNq8W7yyQ1HfESyJ1kuQhL72ua9I0X2suGQeCY5cGpOjGrE43XrK0UfFuZxsJt76
	ekV4ysZ37nqHclMqQI6HSIBw/rojrfascZMkHODUeemduM5ew9dd++8Ndpf3azZGPyYpVtt5vMH
	ns
X-Gm-Gg: Acq92OHdkzk7cpuBHaaERqNVuIWjAlKx1g9uajpn384Lin2XcRUb3MKoqN2ULREAmC7
	X2x8ghhgfN6662daig3AHPqY2hrOr/+X6z2oPKAdltkVYu0kcHhCUwnHLRs9r1Q8mmLT38gjE8U
	CPe/KsfrMqtm/RluL1zRS6ZKrD5UE5BQim4S0SSTKer0sa49/tM1JB5eF8Ibn2cKBDfe8D5hjiM
	kSjr20g0AS2B5OMsWYVYZ28iz80PcD7f3/1L1B7qb3C/g30LVoDlau8XBZQhibBSxwRzieKgC48
	9LF3T+Cgot+7HQzEoFWtiYsU/GTsB/5MU125oLnRaur7h92BxEHqgZv97pmBhF2FiBwcg2SOxA6
	WHxNLWPjnaOGXnvS0t9deZHARETHU1TOv10DtWUM9+n/o9Mzcdtqm0N4IDNEdWgCVB17aVf9SAK
	CYjJDsdrpLvWtmZ9k6d6zbFZe2Eq97JPXH/Po=
X-Received: by 2002:a05:620a:25c7:b0:915:9fba:878b with SMTP id af79cd13be357-917eefc30ebmr1399469285a.9.1781472547482;
        Sun, 14 Jun 2026 14:29:07 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:915:9fba:878b with SMTP id af79cd13be357-917eefc30ebmr1399466385a.9.1781472547075;
        Sun, 14 Jun 2026 14:29:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a0fasm2219335e87.20.2026.06.14.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:29:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:28:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
Message-ID: <t73gjl3mqcp64rddf7yaosmscdpaj5opiiatztd42fmjrxdpta@2fp5mpgn4icb>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WUixQoPsRNxkjOK4XWtJApV9VMOyA7H9
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2f1d24 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=57GF0HRpIeqOalGSDUwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WUixQoPsRNxkjOK4XWtJApV9VMOyA7H9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfX1MT0TG6WAGi2
 Eb9ukI2p0dDzt8HIwLVX5MWOTvjF3qIS93a48RvbWbOcknSU5CtcbzADSTO6fpnknP+mC2cNHzJ
 ioAaNPWgE9NgV0MJGC/6ww5ZEJaHYVg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfXwDMFzO5boUL9
 OnmBKwcBNRVVA8AkaK0fMe7ay5pAuMGP3rXfCNry4J6YWXlcWoQ/ZwqfkMh7T6aHH5lH5muEPQP
 dsv7HsSf06IFH4aJ9qCx610Pd67i+hTdtFaTzCPBPAF4y3yGtzJnksxN/XJ1uhZTc09tLpHTaw+
 dcy+OxE2BFiZk8mfpAzizEw+4c7mIo7XcknlqWYBZnO9O6vBNfwNCIbRy+lEJ9ofdUoAMbkRgoL
 LH0g2HhqAkr2vMnuTEUGHvPxlyY0rX+eZ68F9yKhX82uH6zFuW/3nkJIU0f5+8MtDm/H4CM6+R8
 0NPdKlAByEWFGPS4cRK5sHpECsnbRwhzEQU4v1RS1eUw8jGV+chftj6jgb4NcoHuszqybBwG4FN
 MnXJx8XlvD73NGoHXRs124mVKqssigech5VAE8ZwmgSG0n8VnET/7yefosW/JQtCdhyErM5Xbbn
 BhIGWx1mIPQFMWfIJVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113052-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1092F6824AC

On Fri, Jun 12, 2026 at 10:44:15PM +0300, Atanas Filipov wrote:
> Add the missing JPEG encoder hardware node in SM8550 DTS so the
> new qcom-jpeg V4L2 encoder driver can bind and operate on this
> platform.
> 
> The node wires the resources expected by the binding and driver,
> including clocks, power domain, IOMMUs and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6..8090b8b1d7bd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3677,6 +3677,48 @@ port@7 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: jpeg-encoder@ac4e000 {

To reiterate and reinforce what others wrote: this should be a subdevice
under the isp@ or camss@ node.

Then, drop the label, please.


> +			cell-index = <0>;

No cell-index.

> +			compatible = "qcom,sm8550-jenc";
> +
> +			reg = <0 0xac4e000 0 0x4000>;

0x0 instead of 0, pad address to 8 digits (0x0ac4e000).

> +			reg-names = "jpeg";

No need to name the only region.

> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>;
> +
> +			clock-names = "gcc_hf_axi",
> +				      "gcc_sf_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "camnoc_axi",
> +				      "jpeg";
> +
> +			iommus = <&apps_smmu 0x20C0 0x20>,
> +				 <&apps_smmu 0x20E0 0x20>;

lowercase the hex.

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_CAMERA_CFG 0>,

Use tags instead of 0.

> +					<&mmss_noc MASTER_CAMNOC_HF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0
> +					 &mc_virt SLAVE_EBI1 0>;
> +
> +			interconnect-names = "cam_ahb",
> +					     "cam_hf_0_mnoc",
> +					     "cam_sf_0_mnoc",
> +					     "cam_sf_icp_mnoc";

I know that camera settled on these names. Please use a better approach:
describe the source and the destination of the interconnect (see how
other devices name them).

> +		};
> +
>  		camcc: clock-controller@ade0000 {
>  			compatible = "qcom,sm8550-camcc";
>  			reg = <0 0x0ade0000 0 0x20000>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

