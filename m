Return-Path: <linux-arm-msm+bounces-98385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MtJEQt7ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:14:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB342B9B5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49D230A454E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10CA3AA1B8;
	Wed, 18 Mar 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+hnk3mf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YS7THtAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC63B9D9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773828666; cv=none; b=ZivRxqU+QCNxfl2H8eu8qN4iNHhfnZtdemad0qNI4PCv8/WpvKlUWQM/77aAak3YdAjS8t2m42ffL9UpvS2okwf+nFgqTV0kMJXeByno3OTGaHC99zNfZDj8jxEME+IKiChMaX/DRewH3FzvnUgibhA4bF+dWIzxy9loESvUYmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773828666; c=relaxed/simple;
	bh=1YE/OpnL+YYJMOI34XJtZZ+UqZifHDP5gCkFue5ZcqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfwudtRcr2oXgAy0WhQg5u0whZ5ZHtekwkDd170wNe/CGwcpc2o7zy8uxBo4Su9rBdnNkFJykdV6mp38cCuGjDW00cdmH8FesgMRvWLttrcLFd/xxtSv23lLiOGPdfsJX0QUK1+CuZnGB5l1yOFdjGPckUW79wO3008HQgyIifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+hnk3mf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YS7THtAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8lncB084709
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPUWi4lpjkv2z22C9WzaZYDxTHjKKgtgORTt4qzKFTw=; b=R+hnk3mfNszSk4p8
	N5fFH+rCWKMpOOLzLHyYO7TRc7F4n83sw3eQfObUfnibjaaPtQs2g5XDCQ0V9Ifb
	TQ8EFrGV22zwDCE6ATqAd8DnykiJ/YW3nz/u3bCT1QG3VN5Y8OoxI7kO2xStwiDS
	Sbnib/7S5LuXADemhzdKSfAe3vumBepBwmA3PtYnLP5Hnj5YYQOv1CN1WF6VtqFT
	Ju7I77Gd7Q/J5teMapi0B/UPuY3hruhMSEtQYAWfwsZ7kLsCnWy3v4VCwGVBjeyr
	N/yW4OS97xoZYNQvwnxEj2eArl/F7UgcT7dZFi6MCqyJdtgUqVnnvpgij3qmCA+v
	Esj8Mg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqesrmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:11:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c69c8dc7bso7069666d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773828660; x=1774433460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPUWi4lpjkv2z22C9WzaZYDxTHjKKgtgORTt4qzKFTw=;
        b=YS7THtAF0Qo66Iy5DCBt8PMhUCPXtF6AU/YqHF6+32GAmndTTPToaahE7tFUC4NcpL
         82X/sH7WqffpdmVAoVGqzlfXlGpofp2Uyv+1p5meZya1nUA+N6mRFb8DGYIC+n8HTo7N
         NCghfGT+9wNOG/c3wkEe/N8I3T60iRePdP6hhtxxHXhyWxmZSbKVExbRU3Tw5UkoM7ut
         Ad8TaH3ha8wP6DJ3kZThi0yQWWikBoOp9Q5QbF6Ut9XPPeapPFvEVj4a/H2FWoDw0/69
         gtKY62jXXz5wlpqMpxZSNFBf7M5GL4i5rBcue1wRw+iKxNYxjDXuk7zgDQOwshTxvonb
         heGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773828660; x=1774433460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPUWi4lpjkv2z22C9WzaZYDxTHjKKgtgORTt4qzKFTw=;
        b=WgSc4IQDQngP8h8KB4RBGXkFEQKqGie8vYGGz/dI7ihgbfVV3JdsV7yFDglMOcEk8H
         fslubsgUXvN9E3O7BAk2AP/Ubif/X+xVJ+YZMQQR2CM+oXqTUjkttrdu7LW8HCvJyG6H
         zO5WCttkHHWh2MfImqjyCU2JL+g7VNnvkNSWSa8ZN6o+8g+LDMjAb9//Jd5nP/O28/r+
         IY1v0/RhuF/Z9MZ2GY4dD8p1AkirtlZO34witvFOCjNyT8yCbFQVlFY0cxKT3R089RH6
         8WtBWvuuSMgmoDCiiwk9rgONwNFLmZVwkIJUZp3kU57hXU5joQNWX1r5ZEJ/jL5sV377
         WQGA==
X-Forwarded-Encrypted: i=1; AJvYcCXKAwFsYWoSTq+QoNlCKAX7nPmFXlGvBgy1VkXuO8XsP7pf1JO7tuiiybHnSxb3fAYjyZjTuPFNj9d+jSho@vger.kernel.org
X-Gm-Message-State: AOJu0YzOU7UQpw4tXIBzPJYfaAotFQZXxQzgunBbVmw64VXoCD3cHoN2
	6O/m/LKyWSkDqd2UsJVcYjraJ3zdeIQMRA8N9Bv88rAF6jUu6X7xUbU/1ONL8dlpS4bKemzxkjk
	GkFfEsHL1xv+9XHnMF+HS/uaMdAkVKjSrE1HB9d0AVDiox5rD1W+B+5fT89fWZgdgZjg2
X-Gm-Gg: ATEYQzyufKFzwxBuFQzusQfoMYAI2Zg1BQUzELrT0MVLBBLzqHmvsjHBRySVdUXVkpz
	/zwYpff738YWjK5AIBGSe/XWTR1dEN2WDlSEQrtJ4teamgf/zulQIAJrDfu8WI72EoV6paZZVbM
	jGifDzyekrp8H5PebuqZ6AJfvGQrYm41D45lasaMKGmYQk+BuVgNjuFyo6K2Nh7yPS5Vz42uBnF
	GxKbd16IgOuuWG6agFfZBQx+0f/Bb0EKMILM9wSRdkArloIEiDI3sI0S2Qm3pbnl9NxZpsEIe4N
	s3iZG2+vnOHsC2T8P5GpNrfG96Psgq4huTkKQav+LiPx7zvv0d2xig9GDZe+IT8XJmb1u8dLaxB
	XnawbiUANefUp+3OE+afPkiKmpru6AJm/Mx+SX5sLkGajkPkDuaPitfUm0794h5vI/QA1Md9FJM
	PzgSQ=
X-Received: by 2002:ad4:5ae3:0:b0:89c:5135:e369 with SMTP id 6a1803df08f44-89c6b592055mr32045436d6.3.1773828659483;
        Wed, 18 Mar 2026 03:10:59 -0700 (PDT)
X-Received: by 2002:ad4:5ae3:0:b0:89c:5135:e369 with SMTP id 6a1803df08f44-89c6b592055mr32045126d6.3.1773828659065;
        Wed, 18 Mar 2026 03:10:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17410aesm174296466b.62.2026.03.18.03.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:10:58 -0700 (PDT)
Message-ID: <6e32e5ac-bdc4-4745-b819-0f409a6f6891@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:10:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add qcs9075-radxa-airbox-q900
To: Mecid Urganci <mecid@mecomediagroup.de>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260318083621.470826-1-mecid@mecomediagroup.de>
 <20260318083621.470826-3-mecid@mecomediagroup.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318083621.470826-3-mecid@mecomediagroup.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NiBTYWx0ZWRfXzENHuxUZYT04
 Iz//bk5sepToWVIwiKho7JlHpjM3AB53EXslKsS2w/A3X4fc1w//TNVBurpDvNekA7YYU6r+vq9
 0sMjW5jFdNB0k6/gyJAP+xwaaWDYmDoR7B8So1Wc1f7k6MhiD5Bgcg0fbxBd+DTEKCC61HgQEPB
 I4qcIWmKD1uv1ewLTLvqeMEdpHHw2Eyw/LNHdqvKQIFgYn+Q3GPXaqJ1ErrpBwFF5qDpP3rFagE
 Mmk+xkEVBTkG7Cje6USsvbubWvxQCdDz2ANa1UaEOBpZH6Xd8k51cz8oJxMttGuW4o0FHWO5rRH
 ayIXsibJ2+8PKxWGMxYkxXEUxTMyj99dsJQhk3ESYLPY2be3vIyOvHXra9FTIvXrxDlrNqXliN3
 0wPyQ3LW2zeB9o4IRokOFMqb7CCkiOJSXD5MfnZwhuTEPKXzfA6UgWbKnjPgedd11ux2EF7thhd
 sL1OHiquYj/2T6CBOww==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba7a34 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ksxQWNrZAAAA:8 a=saThlYE7jayycMPKYI0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: TIxJ9kMVRFkOV8sgMaDC4elxugnc8nUY
X-Proofpoint-GUID: TIxJ9kMVRFkOV8sgMaDC4elxugnc8nUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98385-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mecomediagroup.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,radxa.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9EB342B9B5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 9:36 AM, Mecid Urganci wrote:
> Add device tree support for the Radxa AirBox Q900 board based on the
> Qualcomm QCS9075 SoC (Lemans Family).
> 
> This board features HDMI 2.0 via dp0, 2x USB 3.1 Gen 2 ports,
> 2x 2.5GbE Ethernet ports and onboard UFS storage.
> 
> Further information: https://radxa.com/products/fogwise/airbox-q900/
> 
> Functionality has been tested and confirmed working via an Armbian
> Debian Trixie build.
> 
> Signed-off-by: Mecid Urganci <mecid@mecomediagroup.de>
> Made-with: Cursor
> ---

[...]

> +	gpio_leds: gpio-leds {

Please strip unused labels

> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&status_led_state>, <&power_led_state>;

property-n
property-names

in this order, file-wide, please

[...]


> +		vreg_l4c: ldo4 {
> +			regulator-name = "vreg_l4c";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			/*
> +			 * FIXME: This should have regulator-allow-set-load but
> +			 * we're getting an over-current fault from the PMIC
> +			 * when switching to LPM.
> +			 */

Are you actually experiencing that, or is that a copy-pasta?

[...]

> +&i2c15 {
> +	clock-frequency = <400000>;
> +	status = "okay";

Please uniformly keep a \n before 'status'

[...]


> +&gpu_zap_shader {
> +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> +};
> +
> +&iris {
> +	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> +	status = "okay";
> +};

Those are only Qualcomm-signed (i.e. not vendor-signed) - are you
using the ones from linux-firmware?

[...]

> +&remoteproc_adsp {
> +	firmware-name = "qcom/sa8775p/adsp.mbn";

Notably the ADSP firmware normally contains board-specific modifications..

[...]

> +	power_led_state: power-led-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		output-high;

You're already manipulating this pin from the gpio-leds node, no need

> +		bias-pull-up;

pull-up of an active-high pin sounds odd

Konrad

