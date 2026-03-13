Return-Path: <linux-arm-msm+bounces-97423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCqjH7Pps2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B782819E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EFCA3265A0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A71538BF81;
	Fri, 13 Mar 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRIdAM3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsrFNupC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2179938B137
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398155; cv=none; b=NdZD2hqdxQNj3vPYm9I19HQoBhUix/6JUEIdHxPFuy8iV63RmZZKsYoEpueObLPJKedxMwGzVRoATrHjC34UXXXlrO+e8dGbyt70FnhX38rJkVebL36rc+fhXUMi5ElxMeTa3S3yBTqYJKj5PEOdmtiFpbbBJHDZ89unjFRYobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398155; c=relaxed/simple;
	bh=GKiyqNjisb/Y2Jr4SeL3XPeRpx/T6o1b64dhQEYlvzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPx40B9+/kjMhfkevxqnQZHc/PAzFF33nFrMzpBfPar+frdBfzmsp7ml5yYGTweekn/QFjz0Vu3Yvdzf4i6ObQdVKS1Tadex4m9AdM6+usMzL3AApMp2KmcWvj9WfXCCEb9YsK+HctELH96R3jwQl6TvVee6iKgINSH9xY7Ig+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRIdAM3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsrFNupC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9UHx01500297
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+0tEDK+ElUTmYUPlBnlqAGAqNio6mVrev+WXl+AO/k=; b=DRIdAM3YIzIz5Jy2
	qFmHg2AtT/QESWr3iC2GNJ8YA+gaWSdtrOSS3l2gTBKsse2SjedTh1NfC9v7/j3i
	YEqFVqg3ezC4QWqB4ztC6QSmWyEQundM1P2w81NAG41yD7JZnixbpeGgSH8Ju6om
	FemkqmAjOiQbkdRyorubh4CORq6qT3MhAkAEh3kBuuJd89ZhFoxZHlsc22F8ZxMe
	5edR9/Hv37s2k1mzdaYitB5Slb9+7EYc6knHyVj4FLtl+b2JeSpb4e5kl679U9Fh
	YCFWgc84MJO8TPwmqk4jeFoCUVr1tM3YRWiUU/bV7Y7K/2IjLDFRm8jBhL5ctGfZ
	yL+lsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hg790-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:35:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8198fe16so128168785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398148; x=1774002948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+0tEDK+ElUTmYUPlBnlqAGAqNio6mVrev+WXl+AO/k=;
        b=AsrFNupCwsWgmK/cwYN8i/TEp/ze3IT2EcibqwewhdJauguqa4LPhs/XvUMmrLFpMI
         0TxFadIp1pu/UnQnBqGkZgYIZ8okjpbenH7hkgYwxdeueCVAS4+IvdJAaXLQcr1SeRH9
         okOlgTrODex/NQNmpEGo++EkW87gGroe7d6JmGLIIcpV8YlTN5Gqj5+1O4zW7Q5VwnE7
         GFkpsIK5evaBG3HMPUW8MHWbuCERP7qkP5hA1d/ksqXUFEQl4JdkUHl1Pmt6Z9hmutCK
         G1p101uygo/QbILjkKbvJ5tpQq0jAKe8RSLgdX4l6YnD83IRuZundj3pC9bAoQeScoMs
         9b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398148; x=1774002948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+0tEDK+ElUTmYUPlBnlqAGAqNio6mVrev+WXl+AO/k=;
        b=HMekQjSGkr7Fpk88U7hrtQIb3UVfeucd7ltfunevfzpgEE720P2cx7EvZ9QQEbjnCd
         IY9wxwAxovBbdokQAWaRFM3Hf37B5NUiA47/kReFVAP6Ywx5Te+sVlp6hk9ZK58V6DGp
         X62eiQOmOCOeGE5DWBv6flC/SRrdyk4aDFtDvj8s3ybr2QlMrGYpLqftvywroAc/aUpJ
         VBGjIEed/lGxuxwxTpIimCShxA3qOziMTSwR1TtGkdnKEZyHjarAfErBXSYRxuNGSSFj
         aN8xsPnwgkSDuStiPOyqMQop4Qt60Qi7hdqx4rFaIH2z4g2hUlhDKXVCUhzsmLh0d333
         ZSBQ==
X-Gm-Message-State: AOJu0Yyrvo9hVwwcrfyzHl3VpoSEMSRFtVxMfdnoK+EhYXVqaqB+WmFu
	kNKkRO9a9X3SCQ9pkljwpz4tQxtR8wYYA+OOd1g5Qt4Q/8zqgbnIw62SU57fsBfUqs11Gmbzu02
	RmTqaUMXLEXB7D/CzU5MuyPHQcAAOfPdJ8l+HErvQdYB1gy7dQWrPT+EZ67iryTLLvHKtKHWRSg
	9j
X-Gm-Gg: ATEYQzxdJQ/fm3yMl61SRWCY91x5WzQI1+PK48r0IJF6zZz6PdfN8S1XTeGceuIlwKc
	n15sm6GV+v4RMAQPxldYHtjdQkFl1dZfDlKlLSUrfU0QrDtu+A1AQwDAnvaFYzcL1Tl2Vc42hDX
	O93hFIIdyisTA/lJUt5A1IK+uC4kuo13iIgwu78vlBZiEYgwCt8wGEctjzELXadvRV5HrFeNczB
	1jD7qbD2hbQYAO9+k9gW2nKtCBk5DdB4OaN9osawU75oyas/ZMlRNxcxli4PfX0a4QOruRIj/Yg
	yWAHaaNnEgnvKqx2rlBicG/ppGfan351PRUV5wUxHy0AMDId9YRBV2uYhOsQI6I+qD+u2MtZts/
	ms56mKnMsC44Y6+XPj9ivo1ohzddDordcaZZD2qZx3p+dMJklR6TwT3aNBEkmADQchdLXbAxoUa
	lx8Cw=
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr161825685a.6.1773398148262;
        Fri, 13 Mar 2026 03:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr161823185a.6.1773398147839;
        Fri, 13 Mar 2026 03:35:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb480asm36588866b.42.2026.03.13.03.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:35:46 -0700 (PDT)
Message-ID: <225c1632-599e-418d-a93a-5c17512aa5a1@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:35:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add USB-OTG pin
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260312-z00t-otg-pin-v1-1-ce86137ab989@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-z00t-otg-pin-v1-1-ce86137ab989@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b3e884 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=RLSkRAEihx7W8zUaP-MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gHDTt8huw0QmM_br6gnLKl9xrupvoj4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX/ggFm2yFxJ7m
 bEuS52PZnQe1AvtJ0PbushQkE26tVBGo/9W1NL/iKUlV7RcnbTODvG+JVDBsw8pBV1ZSA0ZvBnq
 3Tmowo4b2Wffj9xCtrvkAlUjbkKuhN0LXDEsPQ7pku6R89PKGLLeRp7OqfY6QE1AMlsJ+/Q649J
 aAzzuj8ecMu5V6UWXCgHlFPirV5ST/LmBOkC5izlDMop9T6Z6+B15mRFlN5pv7I59dLBmAIOVSK
 nTGbdiPvE6x645MXsyvnhDExLtvmCJ8P8oaeMRXG1OlSj09nfKI+nTJ60O+5PkcUF0ttYLJ/tyD
 7wVsajABse7j+IWEs+d0c94mOeDx1cGSW2spkZE+LZ8TPkxJN2LCf+F8ekGlNGhDkxtc58f3+rb
 dHimsib8/Az9u2Kao/qkcPo26KrPSUgeAHCggD7YHOPFlR8u1dvfRGqypxtiVEXe7Jo6ehjpRxF
 DZvzEIgwdcUkqRhkAIw==
X-Proofpoint-GUID: gHDTt8huw0QmM_br6gnLKl9xrupvoj4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-97423-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 27B782819E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:12 PM, Erikas Bitovtas wrote:
> This device uses an ID pin set to active high to detect USB-OTG devices.
> Add support for it on extcon-usb-gpio.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> This device uses an ID pin to identify USB-OTG devices. In this commit
> we add support for USB-OTG gpio over pinctrl in extcon-usb-gpio.
> 
> For USB to work in host mode, a vbus-supply is also needed. On this
> device, vbus is supplied by Summit Microelectronics SMB358 charging IC,
> for which there is a driver in mainline. Unfortunately, it cannot be
> added to this device tree at the moment, because charging detection does
> not work correctly - device begins to charge only upon probing the
> charger driver module. For now, we add just the pin - USB-OTG will
> require an adapter with an external power supply.
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index ea90b00a2c8a..6c19044c24bc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -127,7 +127,7 @@ reg_sd_vmmc: regulator-sdcard-vmmc {
>  	usb_id: usb-id {
>  		compatible = "linux,extcon-usb-gpio";
>  		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> -		pinctrl-0 = <&usb_id_default>;
> +		pinctrl-0 = <&usb_id_default>, <&usb_id_switch_default>;

If GPIO_121 is the ID (OTG) pin, then what is the other "ID" pin?

It's further confusing that you configure it as output. Could you
please try and rephrase its description?

FWIW it may be beneficial to turn to the "gpio-usb-b-connector" binding

Konrad

