Return-Path: <linux-arm-msm+bounces-92657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEY6KSSgjWnv5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:40:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B212BF55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65EFF306CEC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CC52DEA67;
	Thu, 12 Feb 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLFKUfgL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg/iScmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376C3EBF1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889249; cv=none; b=MdJ3EGkvSROzSYngpKIo2D5hM/6WvnFK/ktOpaMGbns5FvDWJYk24X7NAiOjxWb3CPyJ9EOWW11n/Qcn9iRUiCpyuB0wRCEvaMlnqtN08e94gWlhsHFbWSc44CJi4iRswTF0ovfXJYOzSsFJM5hA7SPepu1uo/81ztCoStG0xJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889249; c=relaxed/simple;
	bh=DQisYY74wdl4cGO4QoBMLBavLcu17Hj0tKHIb35OESY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fne6roikfv01ZIzAkGpg+zzMRDnOHM3j8vUhbK5bhYSC6sVps4tvIqDUhaz2IxqEQJd8a6N/yidLgtmKilDlzqwVFCiepqd8YkchRFMeFeSi5sWFzDKDcxYF4d4U90B65UMlW4v0eIjyco/I+Zc77MX8hdRYN1FPhIdB8SvFp24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLFKUfgL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg/iScmp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3SGYI357655
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ojlUGTeTMNltryQw4T5zfpIgsLBD4Mti3f6D/F6k/o=; b=BLFKUfgL9opZH62/
	x5Dj80Kvn7gViUArULZxJVvtcQcWVcolgGG79g2L0Qvocnu8M3V/2Yebvt47mk1f
	Wsx51x6Hwz9rwkzsEo3O5wVmowhKJ+Lh3odbzpxAyBNZe9IGxosTPHemQDLOF46J
	F7ruU85P63vqRKT/prkYZQ3zcQfYhthDtE39hasihwj7IXZyG/hwBqGV/hijX+SK
	KLe3NRN2JsEijj2K2vz4W828D7EWf5ynsULc7ayTHnZNFasQ8xlvIiCd42v7oB5V
	R3PRIKnFFNHd77VVIuLZE8Fs2x/YOZhlbiAfO3cbZhLPaf8OWa/Gfyn8cOyOLDMg
	/nTBjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6b7ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:40:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so293472485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770889247; x=1771494047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ojlUGTeTMNltryQw4T5zfpIgsLBD4Mti3f6D/F6k/o=;
        b=fg/iScmpB+HFMN4boRZnT+ks7kDep7VRaOTFguGYeipXsbmYH1k+9I2Nw64Dr0D+lv
         YTZXrWsdb+lTVa/EryulbWpNcSy+QmlZUbe7NCrbRND4Ke2xhF1uaQJ59jhjeX3q9HWk
         /UYX0FngTGCEe18aqBH1dhslcMND25Qsc+1k0D1Bz6kGoK547JMwY4GoqT0MvFp7AA4Q
         51wcsN3ksgw8n6czplbJtgPRjBy2LFzr7B7Xi0vxFlnZqLCA32H8/gI6RltrlPoKiNhZ
         +UkSTobDc3zm6QWKyLliqa2f38azLgggCKICJjby/5CqX9Nd3c6dX7KhDtv7axq3Tn+3
         E+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889247; x=1771494047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ojlUGTeTMNltryQw4T5zfpIgsLBD4Mti3f6D/F6k/o=;
        b=II64p0CW5gXTFS58i6l1S8vnpKJ8SV4H1YT8xcYn0JcFKdBDpF1Wqom7ScfLu+6hyr
         UO3ZE9Gj4+d+NuWSlRsFcKj5wW6R+U6Iq/X1kw8pqoPNn/eDp+kp2BnIO0KWComrnbUi
         +nudQ3rb0GAOXW5+dOAQMOBbl9OJ2fkGVoAoSkJiHG88fXXVY9tbT+PhBZUDcEVzxh4L
         pBhEF2tgcONADsZyraYQUPFd8Xv3YKYuS+sI1hXvrR4lVeWVooXAk5IO1kpFKBFHb48+
         qtIJEC4FPhXX8RODqyUEuLOx9cXhhe5ghu4a+zTLiBsw7hJF7OZTipdQIAFMtuXYcllJ
         p9qg==
X-Gm-Message-State: AOJu0Yy3vRR+Fqui2WRyMNbFYwEbaopZ7JEoYPFR8Vb9I9cbE24DkSj0
	+iLGb/vfAQwz0fTxEUUCK1tl7YdZRRwoa1u4KhUlvXiNOm/ccJm82m2x/T2RyIR8yfnDWK+fF/H
	fapQ29Zq1fcgTyGCOy+cMsjc013PgDPlg9IvediW0FDqU+lRTz1blA66Z8A4nMzD0I/YYPRgJSn
	zU
X-Gm-Gg: AZuq6aJvIo2pLcDevGzjnmMBH6FYg3wfOvTM+Iv+h4YnHqMrCyjovTOMFiYMuQTcYSj
	IwW0aLJAyAHFaD2QhvpN26k8ZgE5ud0Qhk8FgCVdaDfs1v2iaAccpQmPYq0N0wkRSN7P79wWxie
	MHttKEukNNiiSJvhz/wvDVRV6Bl5LRI+YPcbPjC4j9iLQmlgfKIBPKHpJ6I300qWQhHHaYxFYnY
	sGs7bSKLXkjNXSfDGUaGiEsImN5Y6DS1zQBccWMyBB9crGhR8zxk6CXBpv4t7r1rZlI8exFSPXS
	HUz2QV+aXFUokbxRctDdjpDCC5tD1yYEfV5F2zusOz6qJwvXB4ZWH9F9kvzgZ0p8DZhGlJGTape
	KuVIDbLmNrcCC2gnjX8YL9bNm36s52oJ8KIZipD8lp3J+npoXUbc+NyBlvaG0zQB0F8tuFzmBZF
	ghVF4=
X-Received: by 2002:a05:620a:31a4:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb33093755mr203913085a.3.1770889246783;
        Thu, 12 Feb 2026 01:40:46 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb33093755mr203911285a.3.1770889246270;
        Thu, 12 Feb 2026 01:40:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f93c86e14sm42073066b.52.2026.02.12.01.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:40:43 -0800 (PST)
Message-ID: <3bdf5c83-bdc8-403b-957a-052afe27b99b@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:40:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-arduino-imola: describe DSI /
 DP bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>,
        Martino Facchin <m.facchin@arduino.cc>
References: <20260211-uno-q-anx7625-v1-1-677bbcf63668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-uno-q-anx7625-v1-1-677bbcf63668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3MCBTYWx0ZWRfX3BgYLaSqzNvV
 NkY7rNzCRIFGVAw9d+ie1hmPvi7aavvSkindikaun36vG5ys+1HQuMNsvo6jXeIzYlsdxW1slrE
 EPq1QxnO66BcHztLYbEudPrEi5Qq1HVbbX8NAKMxV/Z4ZbX3jPk8n2gdXgYAkjdPxyvMT+nLP3Q
 j2PSxWlrkFwV1/plxxX/Y8pCzpXu1LDpzl037ikCrwpzUUtIP8zV/1FY/2NYCQSetPFSJriqJSj
 UulqaNrHJsiZvglA1DbVdQ+YY5zqWUbVeZAs0DBvloAnq4wimhV1lfmqoDwFA+SytJ7nVynrHsu
 m3de+Y6N4LvG+H3XYrA8x+bZIvrNskMcjLA1MgwIuMG6GrybMCLkef3wm6WDLbwiZyOck8Pb0IV
 3udT9G+6tHlJd7amjBYo7eoke+8lP9gxWy+Sa5lqfKLEr7/sBgsdkdwuOb5p1L0qYjgDNmQnODC
 TL8G9oTj+OP7DxLIOHw==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698da020 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=blDNVBN9pVeKv7Pv1pMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3an5NmxRLsxGH9yoY1EO_pxkMOjmAA5u
X-Proofpoint-ORIG-GUID: 3an5NmxRLsxGH9yoY1EO_pxkMOjmAA5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92657-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,arduino.cc:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.58:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD4B212BF55
X-Rspamd-Action: no action

On 2/11/26 10:28 AM, Dmitry Baryshkov wrote:
> Aruino Uno-Q uses Analogix ANX7625 DSI-to-DP bridge to convert DSI
> signals to the connected USB-C DisplayPort dongles. Decribe the chip,
> USB-C connector and routing of USB and display signals.
> 
> Co-developed-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "agatti.dtsi"
>  #include "pm4125.dtsi"
>  
> @@ -109,6 +110,16 @@ multi-led {
>  		leds = <&ledr>, <&ledg>, <&ledb>;
>  	};
>  
> +	vreg_anx_30: regulator-anx-30 {
> +		/* ANX7625 VDD3 */

This comment is only mildly useful given the anx7625 node consumes it
via a reference in "vdd33-supply"

[...]

> +	anx7625: encoder@58 {
> +		compatible = "analogix,anx7625";
> +		reg = <0x58>;
> +		interrupts-extended = <&tlmm 81 IRQ_TYPE_EDGE_FALLING>;
> +		vdd10-supply = <&pm4125_l11>;
> +		vdd18-supply = <&pm4125_l15>;
> +		vdd33-supply = <&vreg_anx_30>;
> +		analogix,audio-enable;
> +		analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> +		analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> +
> +		pinctrl-0 = <&anx7625_int_pin>, <&anx7625_cable_det_pin>;

no mode-orientation/switch?


> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			power-role = "sink";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +
> +			pd-revision = /bits/ 8 <0x03 0x00 0x00 0x00>;
> +			op-sink-microwatt = <15000000>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;

nice!

> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;

Please add a \n between the last prop and the following subnodes

lg otherwise

Konrad

