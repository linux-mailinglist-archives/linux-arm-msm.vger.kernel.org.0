Return-Path: <linux-arm-msm+bounces-100015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZJP3FNGxxGmA2gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:10:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8C32EF34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 335693023311
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AAB398900;
	Thu, 26 Mar 2026 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbgJ7OGe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZZXLgk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5CE18872A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774498254; cv=none; b=PI/SxSaT1LsOsZvmWdA3OlyvkcrR4MvSLhuMBk6iCDp59y0Fnd82fc3Bc0WriB/JUHITZfnYgx3LCK2dBEIKjm0XMFE8AmrCM82vc5+QR5QAb+2A0gNwfPo50Xr+4VJjBIIX9i9pm0ReDQVL5wSrWUHA7hcVgI7IUkEzoksGmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774498254; c=relaxed/simple;
	bh=U9HG+qygQlUmjhnMkYLMbrqHC+nVEvjbSTq126C/374=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQQ9VDI4dibnUYTxv7LM+TmP9OwI/uSzniO7V1ABQPvydEmINRemtacSQY+Q/LVoJljfD+ZqY8gGCjmcGsWPE/lYYTKY6eOV5tHs/uhJYLxJJf8yAES6esE1qpPRnXZg0OY0+vD8RL1dP7mFn1NpA73+VumOjjfLWlf3pVXHGbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbgJ7OGe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZZXLgk/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKhIbL141353
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LKvZWzg13OVm7jBWYKq+tMw9
	JDAZFDry30/VTTyWODk=; b=WbgJ7OGeMVmcbstFPBDXB/JJHg54LVmI2/Ej8Yu5
	/Qb+8TXTVqBsSCTWVbP4q54bsaGiZy0TnYE9foHZ/8vxFjwv+2ldZKGfImF7FRaC
	U6vq/NSwqgFUEzEiEIg58tNP1Zw2XE5T+5lIaUv9O1PS2INg5rxN2NW3hVGWtXXc
	6+eeugD1+3zk/uH+AJ8egPuZb8RBlL6KhhnpLAaSp2/ZNeDZTTM7RjqRQz9DseMi
	p5kHVFuIDfDVxs0iYuOpLgaZvAF35RLR8syYI0rknLrdwxc2dCAjg7r10VrvhNxA
	ZimowGfzztgFHLcKXmm6IPxdxz1yZcfWMCzHNBeSy1U6Mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q0915m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:10:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so24514891cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774498251; x=1775103051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKvZWzg13OVm7jBWYKq+tMw9JDAZFDry30/VTTyWODk=;
        b=UZZXLgk/HvAFjj5TwYJ+6mlgjfqNwtMy+HK3fs0hNmKdBY/GGOWewhGVQXAoLfQoHl
         MwSfSDxzBrJzYUiK5ilnITxQ2bABx7twO2Irk5h47MQGmB73s+SMscbOUnsISPHXwhD1
         m62hHAk+OwGo8/ar3LD9O40Z4OoXdtA5wplMcci/KVpWTaAaI6xoRTTTy7zrJcNnPGik
         03ETVKdxXLfV7cUk5pL/io/QDKN/b0A7kSL186GaOV4Mcsh0NFCiS3pvfuPwlvzPaq19
         e0o5L2xSP/kGc6W6SPrr87L/58JK8GyITRlEPrBfG5FBGNrpzQ8BOfexSM/hktsnHkRB
         i2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498251; x=1775103051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKvZWzg13OVm7jBWYKq+tMw9JDAZFDry30/VTTyWODk=;
        b=nvE/Tix0O9Ec2c/A0vbVIzBqitXnBGLYMYDcmwmrAlM8K62EAjVO7VGz+rWyhejg5/
         +0BrX5HspS1BD06RLd7nLLoro7wgJnigMGxNnuAyRi2E3ktFaSG0m8LpogXi2nVSxiGG
         j2FloKzoK82fdeh8hgIPf1Ulrd76u7TMnxzN0xIzpBdYIuEWo1BH7Kbkav/pw+gLfDhX
         qvLY43mQC9U9wkZWsqnz/EY6697EYbd89/lrX5Cy/+j1TEcoQT9zp4hYEj0TanfXnEIo
         PlQ3jeCq5zjRe67EiOXWLJVR3RrbdunJISS4gy52+a8ok3ioBCeDbHKTTWrEj09i8aKK
         jTqg==
X-Forwarded-Encrypted: i=1; AJvYcCWPYc/+6fIbVAH7f/T9rKFmlJHOkzsQKs/pOvxyb7BfQLNon0kzC9a5mV09G0y7BkBVsbmS5UF1T3nPbpXO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxww5KWbs+CD/nzu4/GxXNZp581dNcWhN/yzAc6rCuAPEmRT46U
	+BpzHfGzJ4WAiLGD/AFjnap1TS+Ycw+ZgoTXLyZthWCuBY0zsyNnuURSFPGyLJ+bqn2lCf/IsmV
	7LcSmWdsmgNQEiDA5elTwho2FqVlzTiKxC5x9FjLCFmHwZnROlrjFpUoKcuNhj7xixGaR
X-Gm-Gg: ATEYQzxyV8fWeoESIIxYadmHSdlSCxZbVZk9PDFuDMxwz2MBzkz5xpzj1GG1YywJdJa
	NzJEVJtrAOTXFEehTx2v60zg8u/vmo7rMYcRnrlXLsPnsot8O7r9HKOWNOogswNVvXl/RR/n7/b
	m+eK0vxLGaraVEPeax5ZxhrCshwHRqaiK6Takt92VYGwBmOUrkR17RGH3uGMclcbEUpT8solyUw
	1xdi5MX59Lu08IUoyW4LxFqNEwR0x42XkakQPg7kbmMO9kifA47fTNzx/MwvsUTECU7g0hfVuR4
	5QFAC79zcAuP+ATgMiqegNxNx+MZTSr4wmeZZ3R9iKn95vz4LeM1UVeKBn4F2d68Pq+C7TSzLr5
	6YvAhmemfMJDo03jyGAThe3JhX/CXTPqWnE6wa1Ci0aPCSFyOA5D2h5ElFrOShWODGwhSFB/r7s
	06f6HWWCZbo/PAveRXuL8bcgIw42lAAxWDp6E=
X-Received: by 2002:a05:622a:4c06:b0:509:2d05:6977 with SMTP id d75a77b69052e-50b80cdad4emr95170461cf.16.1774498251458;
        Wed, 25 Mar 2026 21:10:51 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:509:2d05:6977 with SMTP id d75a77b69052e-50b80cdad4emr95170071cf.16.1774498250942;
        Wed, 25 Mar 2026 21:10:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064c5b5sm294143e87.31.2026.03.25.21.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:10:48 -0700 (PDT)
Date: Thu, 26 Mar 2026 06:10:46 +0200
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
Message-ID: <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4b1cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=b9-dwmyMgMOzjsiLbg4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 618gJX_YAYU96yoOKTqjmjgjGg6uGwm9
X-Proofpoint-ORIG-GUID: 618gJX_YAYU96yoOKTqjmjgjGg6uGwm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMCBTYWx0ZWRfX62iS7+NHivCs
 zGDfxNnX3Ocm0BQ0sVqeEnq/Yo9FBzx6JX4cH9Vy+166t9r4iqMGBubN+1I+L2rNQ93qNShp5NM
 U0vzxl/X2Lsp1qcS5X3DutXHn6ecrR+kGEvEGcIZACtRHxRXQ7f5mE69dPy1ZMh1CitfXuM24ak
 WVJyBUuGxBy3b8db1SLg5DfIa4UCP7EiwF3BCxUArE3ujc8IOyzejZthi2f07cUYTRR7KczahZn
 Ycabe3KN3DHFhvo0pKjHWJQgdR3JL11cvDM/oem+CS7czAKTt1StLDWNLtN5bU2H+4+LyJ+VP+s
 VQK5JLDpZIriTILwpBGr59DL4cZLf05KStHKAOCRTIU8BoqDkCN5E3KxX3g+L38eBV+y8EkLfdA
 8KuSXXnTLgkcA/4VcTNhPgFxZfisirZTFjowHW1cCebDT8sZYv+LNyAupf/efAkEAiijNd89873
 klFaQb9ieIJOCfSSC7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260030
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100015-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: A4F8C32EF34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 11:19:27AM +0800, Zijun Hu wrote:
> On 3/25/2026 7:40 PM, Dmitry Baryshkov wrote:
> >> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
> >>>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
> >>>>>> +
> >>>>>> +	wcn7850-pmu {
> >>>>>> +		compatible = "qcom,wcn7850-pmu";
> >>>>>> +
> >>>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> >>>>>> +		pinctrl-names = "default";
> >>>>>> +
> >>>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> >>>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> >>>>> swctrl-gpios?
> >>>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
> >>>> the input pin is not used by power sequencing driver.
> >>>> just give it some default configurations here.
> >>> Please don't mix hardware description and the driver. If the pin is
> >>> wired, let's describe it in DT.
> >>>
> >> give comments about that pin in this dts file ?
> >> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?
> > It is there, as far as I remember.
> > 
> > $ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> >   swctrl-gpios:
> 
> swctrl-gpios may be not applicable for 'qcom,wcn7850-pmu' since there is no 'qcom,wcn7850-pmu' node
> which configures 'swctrl-gpios' within upstream DT tree.

It's a wrong way to check it.
Instead follow these steps:
- Is the pin defined in the datasheet?
- Is the pin defined in the schema?
- Is the pin wired in the hardware?

-- 
With best wishes
Dmitry

