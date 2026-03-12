Return-Path: <linux-arm-msm+bounces-97214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLkJEf27smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:13:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BD627254F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D81832301E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833E73C5551;
	Thu, 12 Mar 2026 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4xWqZef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+ngo2Tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C843C5521
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320867; cv=none; b=d/7k+3JCpqxxlkk82a7xH3lhqbaSgu2kX7QxjEG1L9Vnc7t4YEMAo/3ME3MnQYTS9YSkcSnxoRujD1Ycr+CX8mLFxChMbC1JBeFUZslgEy45W+dONB6J/zMFNHRb2bY4DuGO3tkOSPTzWuvMMe2PycEDonQnRqm6f4odWH+S4eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320867; c=relaxed/simple;
	bh=elyxdZ26Ie3QG+vvuY8Lixp3JeiukSxqoH3TtyEJ8/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSOGLbrdbxXfgiFN17ZCnZigXMxlJO4C095IV6ccfHbOp35qX4NNicinu8ABBbjtCnxqqrq69AxFH1qNo/94nSmKwowigU+80aQnfB12c0w+vYeFgwbg+qnEE2f0tVWfAYD0z2pjVGGkzp4ZCa7C1VL6xWlTjfGtW3M8+wfchJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4xWqZef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+ngo2Tu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9J0kf3137406
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z29ZXVvXWjVy6lySmAsC3Ftw
	rE6enMyGbdJ+YB+Ns1o=; b=E4xWqZefbWwmko5msq1ApTz+ryduTfTZwgheLvw/
	/xpHaILI9qivTQQ3V2forgnkLOvguib+nGiFT06PMa8r0ZfU23JkfrJSFJ8U2+Z3
	hq5w3l3sbbIiYT8uOE2nutCu/1vzQHOUBB1tK2Frf4j13bIX+c54V3IuySECACx2
	UWsiBMaTSTMqzoZ9E38t+mZkEoOP23To9J78W7B9joOWIasXaIxVsTd4wm6Tk4tT
	+WBj0VPrr9Cr+eM2RIcG3LOEWXyAMalsb/oR+tE9J2YCcX7mn9Wcgas4UtpIuhC/
	08NAJpRrXbdVpXAmaGpWINd/1hapd2USKLBMqoJOFwQlhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wa5yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:07:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509181cc6ebso13323881cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773320863; x=1773925663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z29ZXVvXWjVy6lySmAsC3FtwrE6enMyGbdJ+YB+Ns1o=;
        b=a+ngo2TuYv5Cw2y3RaUoI9OGB0wKJWWtZMBWqvNfKblnysNGnG17/YTp1PCg7cO7+K
         qaZSa3nYwoIaop7r4ge1NCGKrJxjwCZrUwLPMy6WIawgAdceOONsFzg5VVWjK9M5v5ug
         zhlt6AFYZj1FMxg4Lvi9GEbeoVyEz6ZzcfbwroQa6VkVDFOn+i2hnplX2GqrfWHclA6S
         oqFUjJJCqFRISxPwSFgbF0HfwEu15lcugo4rhYKnwT0bqQIZrfsWTIBYZ4gfemzaH3tE
         wJbh14a3oB8fTAYNNluW0GP3nt4+l2J/Q8uWfvCc7wqp521cEfFHb0Y8TiRMCnlZGJaU
         XJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320863; x=1773925663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z29ZXVvXWjVy6lySmAsC3FtwrE6enMyGbdJ+YB+Ns1o=;
        b=AnlWZkkYKkU/HstZakRt0VsyG6gRg7GW2IAd4DQ086BZ8fGOnOxUYZrjP6eXeFaKny
         wsj4z7rJkyN3cDT2gMXUlmfKcM5J8zfpjRglAHPegPxOZrxm9+Dtkh/4URlr+wES35gW
         87kG0f03GHZJQcTIcGOxHcuIJv5+M2Jyw7nnWPOMOJg7rS75E1C7FDk/lm1ieFYT/8pA
         IFgA7M0VA6JGd3+DXEj0fmjuNklProD/tqdyQI7GN0ZMxhs+BpjVdcIZxmUD+MXrEjHw
         rQ2eR+kqQkE9tY+gRxxa0yNKIOXGe3eX4CObligckxbEMBtceWZfnzSqIELzViyLSnlK
         s+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjYoDCjhYGgjrs4e7Dla5VC/K7WT3M003BjK0baFMMXG286lXGZdAzvJp5r1QXZ2pfCFKC55E5zy+5NIBT@vger.kernel.org
X-Gm-Message-State: AOJu0YyceDaqW5DSMZ0kEyvDy52aycLkT4o/yO8LggtYXgsYNJtf2neB
	nxi/gqngjC81sA/WZBmSaf8YvM7Lt0TMCh/IMRrm2oZ43JYs//vO8nkIRdS5BB5h6KAoe24o4bE
	6OYf3T/2q5ope16XyqJfxtfYBlMJ1GFIz4JXBNmLD2jU7zVNnU/iS2iUKqn16ZiTOgCpc
X-Gm-Gg: ATEYQzzShUdxYkGJa94OiMoagI28zLzCm+Gu+JkrnscdCyZCTPfO+XWKfhdJn//Tc7V
	XkHlX5dD3V+a+EuGH0++MEwb8Zprt1mQjBzxoLP9cmTrsVPiJupR9poq9MGeb4EPhTE3nwub/Ik
	2wI8nTlNotocW2tk4n4BTk+y/3USDqvR09ak8RmkR6xFu65Xcy4g5zZSus3TgO7AI1bkNb+IHsB
	omjy++X2i93YvjIaoAKFW3tVlpO1BvDdL+N4j/i01wU2giWHQfVYFTkp3PXDSFQUnAM3ZS5Bjyt
	2iChUEWvOjuSl8PWeRoG75+WjSDKd82uaL1Dj2V4g/VBOrZmjMnRrjlpfY0A375Llhg8oKnyKH9
	CK2HQgJe86KxYqRUKOrGNjoVfMOI0CS3uSQ==
X-Received: by 2002:a05:622a:1827:b0:501:51fb:622c with SMTP id d75a77b69052e-5093a1b3a76mr77940051cf.37.1773320863057;
        Thu, 12 Mar 2026 06:07:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1827:b0:501:51fb:622c with SMTP id d75a77b69052e-5093a1b3a76mr77939021cf.37.1773320862128;
        Thu, 12 Mar 2026 06:07:42 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm9454837f8f.26.2026.03.12.06.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:07:41 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:07:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
Message-ID: <dabwepjvnw5uv7newvdzokkoo7her6m6xrlkli2mc4k6oqxqah@decbrmlb4b4o>
References: <20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com>
 <126b0f41-90e0-4284-ad79-082a61c99f4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <126b0f41-90e0-4284-ad79-082a61c99f4e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EBjBqRUDXBmu6AUAlblVVY2fu3rHwM_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNCBTYWx0ZWRfX1BOO2OKRa2r+
 0QctOpGVGGADTGv34AZ89aTlsx4EO0A4dyKqGi6my5wpJwcSwr4bez00V+zS0pUR00ZXZvofjJB
 p3TKvWSANWN+cr/PS4c9HzrIt61cF7BAzfOdeo9ThjhxqYYMcqJCx4oKWxYn70blBRn3fxUppL0
 JPXVAA8eTQTCRp3XoKsIwhrY4VnFags/+EqNWVmq/b8gWLi7ShfIjAa93ywtpFpjENy7r9uD93Z
 bwh5M+McsngjzZbp9DEHZuRBmsuN544Cmp6GQehlKHWBWk5PhmcG3b/NF/nTqDWAX9zToItEMRS
 Q6VgLMH/kbdKJjjttgT+TXs+2FTkRN26m9nMlcyhLH+vQSpqRLB8pcWqN655o4D/58s6opMjdBD
 oH7C6eNSk/iMmXJazgKmHkFV1ik65E+nOyF07o1Qsb+KRrPY6oCGbIeMV9IQIc07XGuoOC6BpIL
 XVfWWe0rbK0mSDTkecg==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b2baa0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JJmx-g0SUAWKQMqOxHAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EBjBqRUDXBmu6AUAlblVVY2fu3rHwM_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120104
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97214-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84BD627254F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-10 15:27:25, Zijun Hu wrote:
> On 3/10/2026 1:33 AM, Abel Vesa wrote:
> > The Glymur CRD features a WCN7850 WLAN and Bluetooth combo chip.
> 
> a WCN7850 M.2 WiFi bluetooth combo card.

Will fix.

> 
> > 
> > So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> > the PCIe WLAN and the UART Bluetooth nodes.
> > 
> > This enables WLAN and Bluetooth functionality on the CRD.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 119 ++++++++++++++++++++++++++++++--
> >  1 file changed, 113 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 0de7d35e1148..bcee513e477b 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -190,17 +190,27 @@ vreg_nvmesec: regulator-nvmesec {
> >  		regulator-boot-on;
> >  	};
> >  

[...]

> > +
> > +	wcn7850-pmu {
> > +		compatible = "qcom,wcn7850-pmu";
> > +
> > +		vdd-supply = <&vreg_wcn_0p95>;
> > +		vddio-supply = <&vreg_l15b_e0_1p8>;
> > +		vddio1p2-supply = <&vreg_l18b_e0_1p2>;
> 
> may remove vddio1p2-supply since it does NOT use 1.2v IO power supply

Will drop.

Thanks for reviewing.

