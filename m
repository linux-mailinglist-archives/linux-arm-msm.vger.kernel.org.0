Return-Path: <linux-arm-msm+bounces-97006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCuUOhBxsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:41:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90964264B88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C73230107A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A475316199;
	Wed, 11 Mar 2026 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mON3MA5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gj3rMc4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F231F98C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236494; cv=none; b=adTceccat6TS2IarbDc8znvsywi0t15Pje7nCb3hrkeb8ocTStKbugF+WrIY2IZF5ac4Hshu/lsSYxpYsVn4eAoDK08dRTnV9Y3usky6Dkef0DBzUE5hFZg8mVRTAMWlvfV3o0B7Nnff3O1hj//jJb9G3UhO102titqWp2z8CQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236494; c=relaxed/simple;
	bh=gCKgr/R98EWS+hf1PVWdN+dUizM9N1LctGJSgvlIWi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcj5O/UVizUdk4uQl0PCuf4X2T0y90mIk0tAuk/hagx7PNbWXbFIoCN1psTngTCXnpf2n5+jeVZfJCIpVxLZuUnEBhtODBvnl+nEHzI++ZcdeF24EIf2WUKMSVy8bIgyinLVNHWipmIE8KRq4bnRMEv/q2qN5Bg1Peufv5OywS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mON3MA5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gj3rMc4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD7tgw4032609
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pRkzdRnurp2hrieqB92589I3PLnkd1IA53EACNXOwU=; b=mON3MA5WqLETHF+4
	xFX4Z8CQyEzSK3NRGICVuGwljduUKlxH0ynrFOqPbiPAkkwqqMU6zHSiDRM58mn+
	8zr28yB8huEv34NCrkyPoGt2mqkrnloG6Bw+ybet5qCkEZPF9jF1CoS+EtZoClLF
	hhCw3xU89p4bm6w8JfB1bncIH0HaU//e6MU+QYMP3v37UKv4vKci8N0D/CgvDN5v
	4d7gI3k/vf0WuMe7yOQSV7hPoddvM52tRlZiNBCL3jU9Ik4jRU8QYlNT9NlcrVNg
	hf5FITnj0c94Paz7kgCOpglYxPR7GB0zIVYQrlHvSGNNYg81g1E0HLzMPJdsfqzk
	icOv+A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t83qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:41:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a09f050feso13768516d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236491; x=1773841291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2pRkzdRnurp2hrieqB92589I3PLnkd1IA53EACNXOwU=;
        b=Gj3rMc4gsEcDHvW7q4om1Na+9ycBCDzXp3vwg7tJGf+x+2D7b+o0Yl3hsUDcwgQOCC
         +9elTrcJ8v+21FzVzMmRLooNTUSK8LJjWWNOb2MOx00T6fwblyITCSteSNXI1+/tKpe5
         Be92u+8PoBGOREPi4bR+RT+ImAfBHqbup9lDe7FZj6nxGSmD24sKmeubzxja4SHQTnwD
         zzfsHjckNdXbG7Xl7dNiUFWYsW/EYfa0bWEtJJFqGOTU1+XXH0zzTjCWyKTeKBaOufpL
         lPYcjmF5N/W7mCeVpQpmqqWGci44BPamyhWR5lLlMaMSncgI1bMj6qirVBZ00X2YOFtD
         lfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236491; x=1773841291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pRkzdRnurp2hrieqB92589I3PLnkd1IA53EACNXOwU=;
        b=UQWClnvXSBu8qFm7AX+RPESUs2pXKVtC/CWQcbJHob4Hn7QVzdeit61+F9Riw8iJB1
         o7IdWpVM+02uDWgIHUxNGJRZuygFcxZ6FEWzjaNW6ETT+kY8Q+2HHxxut62dPSPb0PG5
         dbWrZeBK4L5SE3qY708jBKqpef7V+TtTM1yM9cTs2vfyNV2By8mMR4hI1ZK8wdwE+pcR
         /+y0WknaNwHgEGfKfyKcWA8vRw1poG1nobJMHX4VJKE4cZ6SZaqVPJbkol0af0XHcMu8
         FYvXQP/7aEfBBQArFkqRt7Y91/pUfzdG/MSJnrUtmHib9wlF/5DioEMdaE8+KwWrjU9y
         Hx0w==
X-Gm-Message-State: AOJu0YwRGLU85B7hjzEO0Duq+VtvTpN6BBMee/P0iQowMkgoCbXI5Sqv
	yBy4Gw3Nv9cFxU77IiXLKnagaRAJ/Um+k3NzXeXS5qYH3B9W5Re7682aigWINTjJzH5e82OdiND
	KVplI2GzHHH2kwJpA6FCzVDVP0gW+1KMocuerzxTuw7+fsBqKEhq8F9VgD70hDeJnY1qL
X-Gm-Gg: ATEYQzyN0KOcPqHRydnHm9JO3Fhw/jkibgU0VDicbCvJ9fx1W7ZiDOVj9CN3bbwR3+u
	PELkABRlQQ/+TBisG55jxbdJcWCecjjtOIFRSMk3lwtuIpSpSHBM3ZgkFfeHii8liqcNgQZAU6l
	s0p1dirajouF7vI98vrEpQXmul+p7lYOFB1kp3omf8BOb43hOaioUamR6K2v0cBSamjh3kpISTw
	m1mnJd+lMZSFlcdMAHlRE9EDhpQChV52dSpbb+FxAqJrtONtrptIeUhvsgay8ko2KDVLI4QtEJS
	QaD7LhxU3hQT5WMn+pZncmFWDHPgm+cMxXFYxss9D4K8MNXwqybZdHbnCMsZzqnsawn+DTolUZ2
	mccgFecw2lmgv6GjU7ufhZQbwJtUtJDSWoU7Y4gLrxwvJasDEnG9rgu+BG5D9NR37LoaFTEEmRa
	3PCDE=
X-Received: by 2002:a05:620a:45a2:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cda194a812mr279201785a.3.1773236491418;
        Wed, 11 Mar 2026 06:41:31 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cda194a812mr279198885a.3.1773236490910;
        Wed, 11 Mar 2026 06:41:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e185269sm53994166b.50.2026.03.11.06.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:41:30 -0700 (PDT)
Message-ID: <e80ad550-71a0-498e-9ab8-6c0859883f7b@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:41:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
 <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ht-wuqiyZgXgeLbKsmdaYT9uS-VHlTdK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNSBTYWx0ZWRfX9AUfDePTJSwG
 LtQMHn+cyU5/7n/H/7mrJS8B55ysUTWOB49JWPG4Q1eMutRu7nYBHTxJzNpY0uMyib8pJHNgDyt
 KgpQVNKNUArqL0KrTR1RDxZMqKF8T65G6mjOPyiure+cfdHK8ZmwcbplKWdvzOzYVJQJy6hPwqf
 wUYHx2eQQ2AWCWjpFd1yaR13TX782W3PUpCyr03nKiTO3c08JmXBF4CGFgmt6P93GVJlHIFQMt7
 02hcHUXFMmIQClc5Iyfg4L87Z/oRXOcBfpXKWtjChEKzYlmLGTpeBaYlT9QoDPnUkwceEj1l9d5
 rx/VH7we7IMgao+cCliCqHDxGlkBo3Q29LcOLZ34uoPpO4rcsZZZjqVtgaND+zt4aaeRXRgCGsN
 LvXxxjyDIypL4OJlqPxDpxcD6zufD1dUFPpap0NgC2MRyBDeaT7c//7Vaw7GS8mUJQHzKa5lKuf
 cbmjTiBP94O89Xt+FaA==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b1710c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=TRUxsesqeu6M_UsrYMsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ht-wuqiyZgXgeLbKsmdaYT9uS-VHlTdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110115
X-Rspamd-Queue-Id: 90964264B88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97006-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 5:28 AM, Deepti Jaggi wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> Introduce base device tree support for sa8255p Qualcomm's automotive
> infotainment SoC. The base dt file describes core SoC components- CPUs,
> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
> nodes and enable booting to shell with ramdisk.
> 
> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
> platform resources such as clocks, interconnects, and TLMM. Device drivers
> request these resources through the SCMI power,reset and performance
> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
> doorbells to support parallel resource requests and aggregation in the
> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
> using the Qualcomm SMC/HVC transport driver for communication.
> 
> Group resource operations to improve abstraction and reduce the number of
> SCMI requests. Follow the SCMI-based resource management approach
> demonstrated by Qualcomm at LinaroConnect 2024.[1]
> 
> Limit initial support to basic platform resources, serial console, ufs
> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
> 
> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> ---

[...]

> +		tsens2: thermal-sensor@c251000 {
> +			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c251000 0x0 0x1ff>,
> +			      <0x0 0x0c224000 0x0 0x8>;

All TSENS regions are 0x1000-long

[...]

> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,sa8255p-tlmm", "qcom,sa8775p-tlmm";
> +			reg = <0x0 0x0f000000 0x0 0x1000000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 149>;
> +			wakeup-parent = <&pdc>;
> +		};

Praveen suggested GPIOs are not controlled by Linux:

https://lore.kernel.org/linux-arm-msm/12063990-70fe-4faf-89fa-c74c7bd97f42@oss.qualcomm.com/

Could you comment on this?

[...]

> +		aoss-0-thermal {
> +			thermal-sensors = <&tsens0 0>;

Is Linux going to act on any of these thermal trips?

Konrad


