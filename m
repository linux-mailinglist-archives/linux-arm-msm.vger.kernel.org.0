Return-Path: <linux-arm-msm+bounces-113654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G0oVF4OsMmr/3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:17:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F9E69A796
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:17:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M5tDP2jW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113654-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113654-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB6653079EE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2017D42EECE;
	Wed, 17 Jun 2026 14:17:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBFD23D283;
	Wed, 17 Jun 2026 14:17:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705855; cv=none; b=txviPu4887287h3hLUBM4BvEyOQvh0cPLQQ4sXMrvjqmsQIqLoHPuUAdLzek8pASIY4qf+WLNf9TAIF5EpvP2D1uxEBj9U2zLoR1g4OumfzJpxuZHfEuiZd7lI4Qfh/M1SeqrW2Obp9JiaMBnWdNz/3L0apmVJW/gu71l9u9I3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705855; c=relaxed/simple;
	bh=Lo3YLzg0jpPDcAHugFii0uClzrKNt0yMU7Yx6hqYItg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9MdzV/rMd8UN5BjscgYBCSk2wV9tIpZG8lNqt1ffirm1EoU3SWwN8EEU4aigFwmG/Q6E9sNXLWkGq0JxcOmG+zNr2x6cyePHV5nqxZn3Xb8SIjPZnkpS+oGbnPK1cxDIqSfK0jv/JMQRK9ZoxnNshMGxunr5AV8rIC+uxJc3nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5tDP2jW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEGpUE3070446;
	Wed, 17 Jun 2026 14:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h856mrHA1V1jxOJ5ukNgnZN7
	uJoBFxbPt2dBpTBNGEc=; b=M5tDP2jWS0/QyzstiAGFVjciddrNkmG3WjKr9jIx
	PjNldjesyDqf7jv9rmhH5QLlCSk7dzyblZi4TVZkktVxJ6SxiixobpL+N1//FACh
	atEmpUP8Avt+t/ZORX9IA/iUtSCkbFZ/TNgenxdXBFFEwn+NZ0yIu3sc/UzU3Syk
	cMUvEk9Onc7VWBC6Yn6sw0fuqnP7n0/2nCv+bR+INcA3MEb2GqWak570sZXfgJ6o
	T65pMZcriLdsic7xIYqVnH+ZkScUwAdm6xZQiG8N4DEIWUVoTDCmV5q5cC8HxdKO
	Gvb81gL55H92O+OfiX9bQvFZKeb+THmJK9vpHRoaxaxspw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevkk9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:17:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HEHRc2002836;
	Wed, 17 Jun 2026 14:17:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09ka91p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:17:27 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65HEHR9V002830;
	Wed, 17 Jun 2026 14:17:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65HEHRZx002828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:17:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 5F6F6B0C; Wed, 17 Jun 2026 19:47:26 +0530 (+0530)
Date: Wed, 17 Jun 2026 19:47:26 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Message-ID: <20260617141726.f3vxydnq2fxjbuva@hu-kotarake-hyd.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-1-57d5e6c7f47d@oss.qualcomm.com>
 <y3b3i4p6nr3tj5ds3a5zispbrxt7pzucoswh5grtthmj2m5en2@ucniw6w45572>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y3b3i4p6nr3tj5ds3a5zispbrxt7pzucoswh5grtthmj2m5en2@ucniw6w45572>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzNiBTYWx0ZWRfX6J7P5ljgAlsd
 IHIqvAtLGrIRgZq5rYbxhXxTyt6PneqEKpDY0ZshyyNHJ/dbGsSos60fP9HRmwNQmSQ0bqCTf7O
 Vdx1FP6IVkQQKi89ap6GqFc4E1QpVRSD4uMjhoai2gJQy8Wv0SNNAl1k66ac6WSRnxPqVoDqGRU
 PD0lpYbW5hPwBTRSSJ95Le2V5Os2/b4IjprcIzqjPMFAwqpO3cVI44uUcdYvjXOZbat9UiCG0BF
 NwnLnKV9NKPEk+fiNwxet/txo3cSlvOWjCjHgAkypwiNpNp6B67qyRmL3aeuwB4bjuD2QAHXv0o
 MKquxXDO6Au7iKQLkG9HojAnQigpZx83ey1VOYZi69Xdxtqeze7rYquQFG316cfYTVD6oNcOo4d
 NBORB16n6V0x4QXxQfQxw4TbpxHZ/pr0H2erD0idZPNZ7vdD8kKN9LqIPwuHJ0S4kffs6ixD1Nd
 BZVBuySvt7BVhY2CHfA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32ac7b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VkZi-NNd8zy03Ek1114A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: qbr6X3zZwlOFqjBODZcnFTrirxGZjdd-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzNiBTYWx0ZWRfX+GMpcoYM6Ihj
 sGn60Bt5JYtPe3FIRYSC/oAWUuPN5Mpkf8iihhMwnlKxls7+wqvctPcaXs+i+Tie1yWdnpM5sfx
 cjZpPLSFucOP81c8wgSNQ/aUTQtQtMk=
X-Proofpoint-ORIG-GUID: qbr6X3zZwlOFqjBODZcnFTrirxGZjdd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113654-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:from_mime,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3F9E69A796

On Mon, Jun 15, 2026 at 12:41:53AM +0300, Dmitry Baryshkov wrote:
> On Sat, Jun 13, 2026 at 01:39:21PM +0530, Jishnu Prakash wrote:
> > Add VADC node with some channels under it, for voltage and
> > temperature readings. Add temperature alarm node, used for
> > PMIC thermal mitigation.
> > 
> > Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/pm4125.dtsi | 77 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > index 542e8fe030da..7113504d5941 100644
> > --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > @@ -65,6 +65,83 @@ pm4125_typec: typec@1500 {
> >  			status = "disabled";
> >  		};
> >  
> > +		pm4125_tz: temp-alarm@2400 {
> > +			compatible = "qcom,spmi-temp-alarm";
> > +			reg = <0x2400>;
> > +			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> > +			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
> > +			io-channel-names = "thermal";
> > +			#thermal-sensor-cells = <0>;
> > +			status = "disabled";
> 
> Why would it be disabled by default?
>
Ok, we will update in upcoming patch.
> > +		};
> > +
> > +		pm4125_adc: adc@3100 {
> > +			compatible = "qcom,spmi-adc5";
> > +			reg = <0x3100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			#io-channel-cells = <1>;
> > +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> > +			status = "disabled";
> 
> Again, why?
> 
Ok, we will update in upcoming patch.

regards
Rakesh kota
> > +
> > +			/* Channel nodes */
> > +			channel@0 {
> > +				reg = <ADC5_REF_GND>;
> > +				label = "ref_gnd";
> > +				qcom,pre-scaling = <1 1>;
> > +			};
> > +
> > +			channel@1 {
> > +				reg = <ADC5_1P25VREF>;
> > +				label = "vref_1p25";
> > +				qcom,pre-scaling = <1 1>;
> > +			};
> > +
> > +			channel@6 {
> > +				reg = <ADC5_DIE_TEMP>;
> > +				label = "die_temp";
> > +				qcom,pre-scaling = <1 1>;
> > +			};
> > +
> > +			channel@7 {
> > +				reg = <ADC5_USB_IN_I>;
> > +				label = "usb_in_i_uv";
> > +				qcom,pre-scaling = <1 1>;
> > +			};
> > +
> > +			channel@8 {
> > +				reg = <ADC5_USB_IN_V_16>;
> > +				label = "usb_in_v_div_16";
> > +				qcom,pre-scaling = <1 16>;
> > +			};
> > +
> > +			channel@9 {
> > +				reg = <ADC5_CHG_TEMP>;
> > +				label = "chg_temp";
> > +				qcom,pre-scaling = <1 1>;
> > +			};
> > +
> > +			channel@4b {
> > +				reg = <ADC5_BAT_ID_100K_PU>;
> > +				label = "bat_id";
> > +				qcom,ratiometric;
> > +				qcom,hw-settle-time = <200>;
> > +				qcom,pre-scaling = <1 1>;
> > +			};
> > +
> > +			channel@83 {
> > +				reg = <ADC5_VPH_PWR>;
> > +				label = "vph_pwr";
> > +				qcom,pre-scaling = <1 3>;
> > +			};
> > +
> > +			channel@84 {
> > +				reg = <ADC5_VBAT_SNS>;
> > +				label = "vbat_sns";
> > +				qcom,pre-scaling = <1 3>;
> > +			};
> > +		};
> > +
> >  		rtc@6000 {
> >  			compatible = "qcom,pm8941-rtc";
> >  			reg = <0x6000>, <0x6100>;
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

