Return-Path: <linux-arm-msm+bounces-110311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLpIDK7JGWpzzAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:15:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE376063F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D4B531EC2F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE65136C5BF;
	Fri, 29 May 2026 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPtjMgIk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j1AsHFsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D66430F815
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780071155; cv=none; b=anVwNvM+2SANQns2DdfQaOA+xj79O4EpZr6yaDIfDOczi7j6gJDHgUEYVnVQvhO/Dam2NhnGLeKIDZ6yg+U2MLSspHoqMrY/qR1fA9k5ev0ArR8vJDfLp/BiUI0qoTUem7Ff78wXh5P6OYRlQu7nCONGV0YtFxyKZRDBq6Gy7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780071155; c=relaxed/simple;
	bh=przyp5bNGse5tpmBoS6kVRjn0WsVKg8vjerffbq8d38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IO8VNZ7fTihFE6syKCds660kJI5DTxWPcglENITPiggGdsZeDqCy1dIcAFmSKn1gwCkBeYhoIyrteRanG2ORsa2woGaVy28jlB4Y6udMHgGAJbv2eYiBMhQDszvfUAFpYPQ1rF1L7SOcZ929/5r10o2eLUQHlOae5I53rKgc7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPtjMgIk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1AsHFsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL0B13568553
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06DgXkn3vnm0O67cuWd7+N21NOACsuVZyxVwUzts++c=; b=KPtjMgIkkqOdpb2H
	ehkY78DZ9PkFMi7AmUljXM14iuKn/xv1AKShU8nDyhBtpqRtjJEs3l95nGzFwytt
	tw0C8pW29kQOOtvDcASZdEAa09pwb3Fm4kwMXYen/b0r4xpH+EHHJQBHKkqKbLXa
	LFinTTTAU287PiY5E2ZopKJSEfuEVYYzjzIYXmIlnwVAeCJGMHf9H5el0/jgS5Lp
	AewCR/1IkAiXociDUX39J2pyZncsQyoTK6YW87WVw5H0j9scnSJ/v51/XHNdEKmt
	vnl2mfKzhfEySzZ0i53FK9tl5M4syBHp9Inu7SgM9vUPQx3H4Z4oSjNlMWxtTGKE
	RjpOag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumvfjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 16:12:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso161553415ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780071152; x=1780675952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06DgXkn3vnm0O67cuWd7+N21NOACsuVZyxVwUzts++c=;
        b=j1AsHFsVnfn1hfmIpjLjPEj/Wdt5vj2FCRLG/TzK9vDY5Q+S5L3SjDT+ZS8ctVktmy
         wJjEyQlcHGdpacpUTpFDrcGo05Q/c/ZoLHFWcAeHrAr1Y3KIXI7cgFdpWvblNP+5JM6q
         fiDz6ixVxBIsSKW//wgsCAAIPEXMVk8B56ImkHuqlwW25LH5cK53CRyYoDVGI5cyxKIC
         Uu2z1VACgoHbtKFEHE8iLYnXUtXCWKZjftvrYJDS9T3GQ3Ph6J+5/6XLf1CI3La7tPoT
         kavywwT67nyuSkvw3Lf/uBHBFj+OKhMaEUUD899DBbOzcEUSNXPUQ6rchAku9mOrFGTj
         IA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780071152; x=1780675952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06DgXkn3vnm0O67cuWd7+N21NOACsuVZyxVwUzts++c=;
        b=pwx9tOtNs3cBd7NLM9ON4n07Es62v26sAWrxcsptjxZ1Aevs5GAcLL1N9Nxb9jtuTr
         FMEP2uaos71wXY1ahjeWRkFBfdR7yCMMe+oBkRht+WNoVWgcbnTrGESquelqFNhGD418
         r5b6Ag0+ymcx19/rKfceNBdHpDZWCZkI+kcNNaA3F1QVf8NI3tVdZVj/jMsePQSV+Vwy
         Znsf4614EnkGoKOr3ibUOGyg1p08rHSV1H38MwUjXFZSTZOw5c6D65MtuE5qq7IHfmfZ
         LpCh9rM5Zv1YhrFGr2fMU0yU1uf6suxQnxJoFWCBN2VFYSLqnAmT/TYZGxiaLtvF8Q6G
         5T1A==
X-Gm-Message-State: AOJu0Yxi13HGaJ9I3BLS61LjK9z7ycYO27qOj3XFFEQh964RdFmWO656
	fDcYBTczDsf6EBaEJE93jSHteVQ9TRXygMU7W94xxl0R4PtkBREzWqLAHshSuQ1tlQhZBbHafef
	HkO1ZwK3ugecrtvlbg/9Ot1Bge+80o/FdjwBX2xkmeQWWWIAU2Neldv2vw3z0Y4emlMlA
X-Gm-Gg: Acq92OGGrjUaW3UDZ1fqAO8GzT1VN2KFbEMzNKH0Pc0wj49V7DKsdIOhLki8d7Z+ZxT
	qVzfxjaqcckUFEg5K4hwTxL06aoqsf4C/WS7p0ohe7NHO/9MCmZTzFE3DXrihjBhhyVkUsPr3wv
	PqYsQjDMnhRiafLyKCBEkcN3g+VOtLhXhl8NHzEgkRT+Q95g6Ks5oQ5iAVQi/XVmUG0fBpvJ0Lr
	FaUJLTGyz8nf6X3Jhxrd25HIXj0W4jGoojnDfds3W0xP4kTH9q2Te419AoC9223RRccCn7aPeQ/
	JBy5zxSyEEapN/a/m4BR3FhNIE8C1fB74m4vccFFnMkR6z2RFI6dvydWHewNG/Qhjb40hGthIBQ
	xg9ItM+OlI0p+dM5h+Sp3KWeJ9uUhE1tIguEs6CEqZawKy5LAeJh1Q1P2YVa+Tw==
X-Received: by 2002:a17:902:d589:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bf3684acb2mr6154305ad.19.1780071152165;
        Fri, 29 May 2026 09:12:32 -0700 (PDT)
X-Received: by 2002:a17:902:d589:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bf3684acb2mr6153675ad.19.1780071151582;
        Fri, 29 May 2026 09:12:31 -0700 (PDT)
Received: from [192.168.0.114] ([49.205.87.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm35557685ad.7.2026.05.29.09.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 09:12:30 -0700 (PDT)
Message-ID: <df7e4e0a-a31b-41aa-88b5-d50c8a6e18d1@oss.qualcomm.com>
Date: Fri, 29 May 2026 21:42:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
 <20260526112409.66325-2-daniel@quora.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260526112409.66325-2-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9u371F-2JtNUM9yixmfOBR7OdG93C7wf
X-Proofpoint-ORIG-GUID: 9u371F-2JtNUM9yixmfOBR7OdG93C7wf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE2MiBTYWx0ZWRfXyXA+YdLbZMrN
 skRlywODSFxlN1QUYLm9e62pIM1erJbh1vF/5IPjJkHMZBldwApbGhEd+oV5KXjovog5aMsGBMK
 bEBejjmIKsKi1dY0K8J9N8nfnXI5x06vKDyt8sZcOlNthedLMN6YS+QoEh3eIvCa7XaYfWnuWCi
 l5QT90wythXXOvydOIoVflI4n51TDkhxSUyZvc+YJ4pKb2iEk7W0kxLncDPOqrsoZj0YG2dk5XA
 J+Pbryas3e08pTXC3Kh2KtobgiYf/vuT2eOOVhCf43ALQRvCHeYaKPk0FRqRMHCEYTocgh1GHU1
 RiZ8Ht+LLck/4QlXbmcYZBsLmyloeXB40LxVX5kp2s5UL5hvmmNPGTJVQEHkATnS7mU00trodlD
 14DUzYMgxu2hCIHFHzQgjkEnYlMPc7cySljaFP3k+hYBmUYrqM9Q4GnREOEXd5OIH5Ldv9fVvVz
 tmgZ9otr4+qAT8HLk4A==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a19baf1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=QeBY61bkPGI4yPcTgj5/Kg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=J7uTrBVL25gZzBqQJcQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,infradead.org,linaro.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110311-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,quora.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EE376063F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/26/2026 4:54 PM, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend
> behaviour.
>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v3:
> - use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
> - v2 link: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
> Changes in v2:
> - corrected DT compatible node
> - v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/


Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

>
>   .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index beb1475d7fa0..1ee2a2296129 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
>   	};
>   };
>   
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@76 {
> +		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
>   &i2c7 {
>   	clock-frequency = <400000>;
>   
> @@ -1352,6 +1368,12 @@ &tlmm {
>   			       <44 4>, /* SPI (TPM) */
>   			       <238 1>; /* UFS Reset */
>   
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	edp_reg_en: edp-reg-en-state {
>   		pins = "gpio70";
>   		function = "gpio";

