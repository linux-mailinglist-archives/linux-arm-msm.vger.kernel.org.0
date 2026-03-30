Return-Path: <linux-arm-msm+bounces-100791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIHADqBlymll8gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:59:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 871DF35AB58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D6BC3008239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267613C9444;
	Mon, 30 Mar 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLfWmOUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGk6ECOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5886C3C9453
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871611; cv=none; b=IyUZgVHU8czNnC2SIKjxXAFi8CQ1VljFMosYQdW2xpwIaynX7OAMSotbiKmYkYVeY5Z7foiTjgjKN6KoS7YfXenWtj88w/ZzAYnwCLNvfgB/xG0sk0ef1BdgKbBZ10c2sJj1o3wXEr3IWEgllN/ynjqqpnqgIJQUubfAm6ghA2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871611; c=relaxed/simple;
	bh=zsVMO35J47yKLnPTtouSttTrHxQk+BAvB3fwxL/4eJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQiuODGS9B3pNYqSBEgSDShTTII/So0wW8iQqQ5j7Ak74TEaHrCdwWo0n8D+9AUGpMiXJnGqijVNc6qUHRtDMv3TNlRnGd8OPgPr+f36+3M+6HtsSf91W9TfR+nQFMa81il43GepJMfusL7sjHT8ThyLZEmyKwmB3apfqFIVVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLfWmOUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGk6ECOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7ipV53305051
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VtOtPmVBiuNeTzXGXFpTSipX
	dzWD9aMEGabvmiVCa6E=; b=hLfWmOUffkRa3sHUFbBbS9Zo5o4e+v1KxsjjkwGt
	Fy6CgTou9tyQIfSlZ2x7Q+wrNFlOmafbW4lzlxYNRZYykNjinNLSqCXAsO7tuDcT
	E9/gqEzzOJHt63Bmlw3/4wYT4r1eIl/F1/Xo5/F1Wk2g77Yf05rPoVfaEgjyyilQ
	6qRlbXMrtI2aXmMCHaKrb8gbyH8Stp/Cw7oAR/BKEEdkXZWFCLBjqguSAcnzefzl
	6kdYz5PF5FvPywCmmmR+Pg8j5lQQEbhnF+2d9jx0Y++BKT+MCnxZtGwmvGKzxzyR
	8R4REUjg4XyDOHitQms+MJ3/Gxheqj3x2YeAc2lRd0zcJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmm3ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:53:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso84787371cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774871607; x=1775476407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VtOtPmVBiuNeTzXGXFpTSipXdzWD9aMEGabvmiVCa6E=;
        b=BGk6ECODei6T+lNrMCGYMKqfjVMkIW9+Wd1ij1n/dgnoxm688pFk9fjEkGMa3EfOFf
         aMt51RWOXIzRA4zifFDq6n044N1eNcAEn3s/smq6Ja+cZ1SyJq+J29BBOoW7JjT9A1A7
         vzKvrr61WiJqCaMlUnaVBvAZkArQKiZ6K+XGOuZ/9t5nLk7tCQys5QuLIFFywD275Vdw
         M0ELnKXtwg3uH+dZT0NXB5tlK1S1+tRcIa+THorRvz/NG+io8WTk3GofHr3gH4rHLlLE
         4mROf2UbMHImDstZsbNwLZaX3xW7V/2c5kxt1FdO0Yjq8xvhssDux+aaAO/+8TTIkfvf
         C8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871607; x=1775476407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtOtPmVBiuNeTzXGXFpTSipXdzWD9aMEGabvmiVCa6E=;
        b=cskx5L7jh/EU65Fu/2my/6rRfZmeBEjxPZU+scfG59i990lYARzglbYorTnIakoXBQ
         l8gMQ7UU0uSPJ1+JeSCjFAvpU9B+S7wWIp2AU+9F5xDHEZtULPzxXNmfewS8KJIhzNNo
         YT6f1S5Im5QL3Yv5M+WQK6R6u1WmDczcD6Ig8Jq9II7+jXSCKTyvjekvIvyZ+1Bwvv7f
         uhE8UlcVt2WJNVc2f3fxxfmPHCCOuZJMXUSnlG0yvF32BghqCAhoviiF1YQ6O8rJY2B1
         GxH2XFMIjPkCOvi9ErVOVbIoM52q0wcCcToncXAMmzI/6GX6r+ZWy8GrjA5F2/N3QUbA
         k+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvFPy2Uy+GuQBMajYeGUfFOi9faqycoH20cAOxa+0DGx71M/JLhTB46XDnhIKVQK1KYDV1Ext08jXDiHtm@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDbNIXJZLWo18zqxTDTbl4hlWgRaNKYLMQydNOYMk+KU6w1TP
	areGgskBvrdCqmdcw/Ft71+rE0R1JLBrtvfco7v7SY3tL/4lEwVrIF+qiAnxKBhIaeWsnXyjkOQ
	FjaiYBlsdgMSQxfGi0xfHvV+kt9g4MbUHRCLdZT0L+ClqchF6yDRcFANxSoxDZqaMASDo
X-Gm-Gg: ATEYQzweXOky+FvhcoYBV87lrYfFIgvNy84zTwFmUXQIj6yDrNzA+peSGOXGbqXWG0D
	OPJ6i0udRckop2Nc5FMQ9XY97NylGwUwPw3aOsa/JZJ8WvnL7NG+h/QTbTlpArEGZfLYuzjF/VX
	yBsen3AtEGVp/V4M8jS4bWdEtn07zU2OeoXsbSRTdEGt66L5qUredG/fLLvvIDyD6A299zBj7FU
	GeUXjR6bGgFaxQ3+4+hfyvtyGcK2In/fdTYdOK/HrJPz9m8vlMWSNfMHLNcW5reBIBjWzxFTvIX
	YLpAyT3muBHRBjGVPBp6E/oiDa9rd1KBbfeIZYeicbgdwYETF69/Euxm48zCP2LsKLvxFeD3zaF
	Lcc7iD1gAQvqOzmcnGeRWnKUOYPUzeKuPvQdFBgvItyxfpft3nhWTgu44WkG7fqZ1CcRMTRFkM/
	VpfifZS/F+emVDF9ZAGwdIyL89uLEMRtAFHSs=
X-Received: by 2002:a05:622a:1887:b0:50b:6a48:78aa with SMTP id d75a77b69052e-50ba38090edmr165519671cf.8.1774871607421;
        Mon, 30 Mar 2026 04:53:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1887:b0:50b:6a48:78aa with SMTP id d75a77b69052e-50ba38090edmr165519211cf.8.1774871606967;
        Mon, 30 Mar 2026 04:53:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4312sm1588471e87.16.2026.03.30.04.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:53:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:53:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MyBTYWx0ZWRfX15H4g6vcYMRQ
 h7/xwrJ+0x8MsaCDxeVb+UK5xPuAwPfwvGQJPtu/EG1ABV0k5rorgC1YRSgvI7gqtpdjQeeYCWD
 GQdsBKc7AWW8itn7XjdqlqJeWQbdAgyNS15BO4GPcoPo5qej18qNVw7mITH2e/2BU2RhDJoXC2b
 FJsQaxsDdXvCHz4YlaWyyxYqp52HtZvcgCMlZmxwwM4zzNSKSS9HxUZygIdUcobtXWL4EZRUaQS
 XpfGedZY7/BRh0yxHOUfbWXurft8AB9fJrsTfgRceEFGmamw4tGe0sGykEyHf1YxfBmsJo/3q0I
 1kJXUnC1KsJg08KLudWShqx2a9Dn3iW0d0yLZmdqOMNqATxr6qpn039kn3Mo7jNmotsK2ks/pBw
 +vvEd74QOhUnXLba8bISxQ6Ixq1w334Ibf2kST5v4dvNA2n1B8yb1fFx21iDWl/vJihnsKjuk3G
 p7tMx+OuS8qQC8z1mKg==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca6438 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=aFXXS-vr02nWGIN-Nt8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Z_m1JccapAkBGefB6JD48rhg86CVUvs3
X-Proofpoint-GUID: Z_m1JccapAkBGefB6JD48rhg86CVUvs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300093
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100791-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 871DF35AB58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 01:15:44PM +0800, Zijun Hu wrote:
> On 3/26/2026 12:10 PM, Dmitry Baryshkov wrote:
> >> 3/25/2026 7:40 PM, Dmitry Baryshkov wrote:
> >>>> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
> >>>>>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
> >>>>>>>> +
> >>>>>>>> +	wcn7850-pmu {
> >>>>>>>> +		compatible = "qcom,wcn7850-pmu";
> >>>>>>>> +
> >>>>>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> >>>>>>>> +		pinctrl-names = "default";
> >>>>>>>> +
> >>>>>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> >>>>>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> >>>>>>> swctrl-gpios?
> >>>>>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
> >>>>>> the input pin is not used by power sequencing driver.
> >>>>>> just give it some default configurations here.
> >>>>> Please don't mix hardware description and the driver. If the pin is
> >>>>> wired, let's describe it in DT.
> >>>>>
> >>>> give comments about that pin in this dts file ?
> >>>> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?
> >>> It is there, as far as I remember.
> >>>
> >>> $ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> >>>   swctrl-gpios:
> >> swctrl-gpios may be not applicable for 'qcom,wcn7850-pmu' since there is no 'qcom,wcn7850-pmu' node
> >> which configures 'swctrl-gpios' within upstream DT tree.
> > It's a wrong way to check it.
> > Instead follow these steps:
> > - Is the pin defined in the datasheet?
> datasheet define this pin SW_CTRL with description 
> "Switch request to the external PMU between active and sleep mode"
> 
> > - Is the pin defined in the schema?
> 
> schema define property 'swctrl-gpios' with description
> "GPIO line indicating the state of the clock supply to the BT module"
> 
> > - Is the pin wired in the hardware?
> pin SW_CTRL is wired in hardware.

Granted your three answers, it can and should be described in the DT.

> 
> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
> which WCN7850 pin is 'swctrl-gpios' mean for ?
> Why to introduce 'swctrl-gpios' ?
> what problem does it solve ?
> how to solve the problem ?

Please descibe the hardware in the DT. Problem solving belongs to the
driver.

-- 
With best wishes
Dmitry

