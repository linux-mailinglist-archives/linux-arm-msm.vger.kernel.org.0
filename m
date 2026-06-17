Return-Path: <linux-arm-msm+bounces-113652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Kr+Is+rMmri3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:14:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F169A745
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:14:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d9uoQXBE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113652-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113652-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94618301ECCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50443839A3;
	Wed, 17 Jun 2026 14:14:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BBA23ED5B;
	Wed, 17 Jun 2026 14:14:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705675; cv=none; b=fYRAAxmD8B085M33q0AwBgIGDZO9LGy+1b9vmdrswLQB3+RQ5IEWOp4yt7TWk8lJKFq77Qv2I31KV8xk4USP1hU7LNFKqT5XgAtZydE/OMoYSb+jOJL1fqIVv0tAqlzXHJh3dfMutYWsB/6WdpAnXsxRZYP83hKhXKmMtCSm7ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705675; c=relaxed/simple;
	bh=+Gpx3cDKa410T7602cMsgbLkdyS266bz2nM8+G1T+O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+HYoQpholnz2NLQ83BUPEg6KgUtXiWaN16dJOEusBQPB+SkDCueeMtDyvmt1+s0EdJLfqlj0H2rUIhWGS/41IHsQ996/Xv/WlPsQVAypz3hD9LtnMBn/Erwj+zBBz7Y7waRj0vW6wNESKg3Pelki6rIMMEec4mxrPbjkLvmrq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9uoQXBE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEESso2379563;
	Wed, 17 Jun 2026 14:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGawyGR0zrpT0aDDsp/RfEnbzGvvZlN763d96mJvTCs=; b=d9uoQXBEr1Nbdiz6
	1k/d6LHkXjIggVxIhM3EY5y4/28Ae68rkmPH89Rf1XwU4u2OLpbIemDOvyGdNQts
	f5RqolpI+rj8ozs8MCUjsc/PTQn28S+GyXKssA2JnwvCGh/CfOhwtAfLdESXbA/4
	aKNuBjudJ7fONt1hV39aIappYcriRASWVDVGu8cyijDOfg+8MoFVAFuhHiTLY9fG
	Fap6Colffg6ZcElA1ksCHyljlXQsvnVwgWgSgr/h8HiQiKhjhLqjDzeyTp1y9c1W
	zzNcIXzmgf8MkJRPQKn+8NF63BOe4u1OHxgNRd4BRFczaiDTniQhtcxL9UdN7XsE
	GwEo8A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef23fvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:14:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HECbBD029688;
	Wed, 17 Jun 2026 14:14:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09ka89s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:14:27 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65HEERQa031534;
	Wed, 17 Jun 2026 14:14:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65HEERco031533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:14:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 7CFADB0C; Wed, 17 Jun 2026 19:44:26 +0530 (+0530)
Date: Wed, 17 Jun 2026 19:44:26 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Message-ID: <20260617141426.cly44avu37k6kkc2@hu-kotarake-hyd.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-3-57d5e6c7f47d@oss.qualcomm.com>
 <ry5y452gxtnjdzux32saufyvolrkvudlaldmwxdvkcqgrkmaxn@53ikkvwsazkw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ry5y452gxtnjdzux32saufyvolrkvudlaldmwxdvkcqgrkmaxn@53ikkvwsazkw>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzNiBTYWx0ZWRfXzTBMsyaf4t2U
 A2zxu9o7K5ru5xhx97utxKQC7P0k3lz4chMCe7x9DJTLXrgL8vI63Ddbi5Kk2sxIHgfk6OFE3rc
 Cpw12xZzv7UhoSJ/rIYD4vH6cZWeEaQ=
X-Proofpoint-ORIG-GUID: t3bGN6xEmfUNWvuUm4-gkXGNi0AQrRxe
X-Proofpoint-GUID: t3bGN6xEmfUNWvuUm4-gkXGNi0AQrRxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzNiBTYWx0ZWRfX8IXFjHm9wORV
 TmhDuPQyeQ9hU5w142HQzGX5n5ZUEwXy5fLKgnJkO5ig30hOrU2AhRgTS1BDQxPx6QaPGWm/Ju2
 7gkN1VCeuiRYnj2JTDwwHIzCITuTB0rEu5UxFCkWYBY3ZMASgV6Zqg+/2fhxkGsAubulYKlMRSF
 pGZiPS05zSQc446TfMNE9Qo59kru9cU/Wm+ikZO5gLZp48tOOoI4/sj0FpnGHMRz4xAdEFrg6Ku
 64G5affUnVovBCeOfhPcu8AwyM4FMnBLTtm3PZ3U4uKW6yFA71is8cnOGjuOnedbWO2WYNS2GCi
 jk6s/yhZjxpynkrvE8tgA1kvB1sAf36u7dmShsgcF41osBuI7XhDxA0D5DsYzBJJr9b3iB4CTrm
 wjhxsdXrRNQhirSlTOWr9f8a3Z3DdIf25TREjjoCqt0HE7o16vBIGOBUeTyi9GJpKKEP+YDlgMO
 mI+OY8my1U3yrp0hrXQ==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a32abc7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Y50uYxliuIgewFk-01sA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113652-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 257F169A745

On Mon, Jun 15, 2026 at 12:45:03AM +0300, Dmitry Baryshkov wrote:
> On Sat, Jun 13, 2026 at 01:39:23PM +0530, Jishnu Prakash wrote:
> > Add ADC channels for system thermistors, used for thermal mitigation.
> > Add ADC thermal bridge nodes for pa/quiet/msm thermistors. Enable temperature
> > alarm nodes for PM4125 and PM8005. Add thermal zones for temp-alarm devices
> > and system thermistors exposed as thermal bridge nodes.
> > 
> > Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 184 +++++++++++++++++++++++++++
> >  1 file changed, 184 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > index dc3861489f64..c6c09d773abe 100644
> > --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  
> >  #include "shikra.dtsi"
> > @@ -27,9 +28,184 @@ key-volume-up {
> >  			linux,can-disable;
> >  		};
> >  	};
> > +
> > +	pm4125_msm_therm_bridge: pm4125-msm-therm-bridge {
> 
> Generic node names, please. See, how other platforms name them.
we will update in upcoming patch.

> 
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	pm4125_pa_therm_bridge: pm4125-pa-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	pm4125_quiet_therm_bridge: pm4125-quiet-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	thermal-zones {
> > +		pm4125-thermal {
> > +			polling-delay-passive = <100>;
> > +			polling-delay = <0>;
> > +			thermal-sensors = <&pm4125_tz>;
> 
> This should be a part of the pm4125.dtsi
> 
ok, we will move it to pm4125.dtsi.

> > +
> > +			trips {
> > +				pm4125_trip0: trip0 {
> > +					temperature = <105000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				pm4125_trip1: trip1 {
> > +					temperature = <125000>;
> > +					hysteresis = <0>;
> > +					type = "hot";
> > +				};
> > +
> > +				pm4125_trip2: trip2 {
> > +					temperature = <155000>;
> > +					hysteresis = <0>;
> > +					type = "critical";
> > +				};
> > +			};
> > +		};
> > +
> > +		pm8005-thermal {
> > +			polling-delay-passive = <0>;
> > +			polling-delay = <0>;
> > +			thermal-sensors = <&pm8005_tz>;
> 
> pm8005.dtsi
> 
ok, we will move it to pm8005.dtsi.

> > +
> > +			trips {
> > +				pm8005_trip0: trip0 {
> > +					temperature = <105000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				pm8005_trip1: trip1 {
> > +					temperature = <125000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				pm8005_trip2: trip2 {
> > +					temperature = <145000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +			};
> > +		};
> > +
> > +		sys-1-thermal {
> > +			polling-delay-passive = <2000>;
> > +			polling-delay = <0>;
> > +			thermal-sensors = <&pm4125_pa_therm_bridge>;
> > +
> > +			trips {
> > +				active-config0 {
> > +					temperature = <125000>;
> > +					hysteresis = <1000>;
> > +					type = "passive";
> 
> Passive cooling at 125°C sounds very strange. Especially without any
> cooling device attached.
> 
Yes, that's correct. Since no cooling device is present, I'll update
active-config0 to a 'hot' trip type at 80°C with 2°C hysteresis for
thermal monitoring. This will be included in the upcoming patch.

active-config0 {
        temperature = <80000>;
        hysteresis = <2000>;
        type = "hot";
};
> > +				};
> > +			};
> > +		};
> > +
> > +		sys-2-thermal {
> > +			polling-delay-passive = <2000>;
> > +			polling-delay = <0>;
> > +			thermal-sensors = <&pm4125_quiet_therm_bridge>;
> > +
> > +			trips {
> > +				active-config0 {
> > +					temperature = <125000>;
> > +					hysteresis = <1000>;
> > +					type = "passive";
> > +				};
> > +			};
> > +		};
> > +
> > +		sys-3-thermal {
> > +			polling-delay-passive = <2000>;
> > +			polling-delay = <0>;
> > +			thermal-sensors = <&pm4125_msm_therm_bridge>;
> > +
> > +			trips {
> > +				active-config0 {
> > +					temperature = <125000>;
> > +					hysteresis = <1000>;
> > +					type = "passive";
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&pm4125_adc {
> > +	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> 
> Empty line before status.
> 
We will update the upcoming patch.

regards
Rakesh Kota
> > +
> > +	channel@4d {
> > +		reg = <ADC5_AMUX_THM1_100K_PU>;
> > +		label = "pa_therm";
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> > +
> > +	channel@4e {
> > +		reg = <ADC5_AMUX_THM2_100K_PU>;
> > +		label = "quiet_therm";
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> > +
> > +	channel@4f {
> > +		reg = <ADC5_AMUX_THM3_100K_PU>;
> > +		label = "msm_therm";
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> > +
> > +	channel@54 {
> > +		reg = <ADC5_GPIO3_100K_PU>;
> > +		label = "chgr_skin";
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> > +
> > +	channel@55 {
> > +		reg = <ADC5_GPIO4_100K_PU>;
> > +		label = "gnss_therm";
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> >  };
> >  
> >  &pm4125_gpios {
> > +	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
> > +		pins = "gpio5";
> > +		function = PMIC_GPIO_FUNC_NORMAL;
> > +		bias-high-impedance;
> > +	};
> > +
> > +	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
> > +		pins = "gpio6";
> > +		function = PMIC_GPIO_FUNC_NORMAL;
> > +		bias-high-impedance;
> > +	};
> > +
> >  	vol_up_n: vol-up-n-state {
> >  		pins = "gpio9";
> >  		function = PMIC_GPIO_FUNC_NORMAL;
> > @@ -45,10 +221,18 @@ &pm4125_resin {
> >  	status = "okay";
> >  };
> >  
> > +&pm4125_tz {
> > +	status = "okay";
> > +};
> > +
> >  &pm8005_regulators {
> >  	status = "disabled";
> >  };
> >  
> > +&pm8005_tz {
> > +	status = "okay";
> > +};
> > +
> >  &rpm_requests {
> >  	regulators {
> >  		compatible = "qcom,rpm-pm2250-regulators";
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

