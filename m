Return-Path: <linux-arm-msm+bounces-91974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IytJmGPhWkODgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 07:51:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E0BFAC44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 07:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D63E3006210
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 06:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8B12F6184;
	Fri,  6 Feb 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAE8C58/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LT1ZjCb9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F12EBBB2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770360669; cv=none; b=WmEowXxpLHzQtNRqUBEyPyh3oCHvbQn5HfhZt/zPpjCM4rqeMU4wJO8UBAlgxQhLba4AqICw7gJcXAkmTe1lGqbTT0+3uG2MRpV0hnNvlRrYqZjnsjoAfWFmD3YX6jxlNgGFxI1BDnKhSdqgFNfyyz1o6+Pgt42+r/1FaSNm0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770360669; c=relaxed/simple;
	bh=An1jEqhUNq7UtPsjSBrS1+X8tvsSplYpE10CbDQj7Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qyof2gH9ZGSLiFl5vhycaJgRpemKJX6qeO7Ae/1NYNVdsUzNJ657GVxmobrBK2cfQ7a3yjb3AwjmdGRQ1xKlY8fsIHlEIuVR3v7dTRmupBO/5F5sC0kA4D9PYnDlhEV6okSBN/cbavoyleRA3C3nNBOpOuCOK5HiQRLlCfKcaDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAE8C58/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LT1ZjCb9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xcl71419628
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 06:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuJHHqERZSbJYVx8ti8SKK1ive7KABqaDZ8PshwswtE=; b=mAE8C58/aaQtajbi
	WTsxzL5k3Kt3sFw8uvfv7YnB+IDh0TCsyM1W0u9d33tkFALSpmY4ni6qHnqTnvk+
	MKkHNWP90v/PLDmKnnh/yhPLFGfw+9P503TL86UnA8TL5Bp73Pia8qgbrAhS89dy
	z8ZR01ipR8N33aD3dHYHvaFJZh8q58SBj5LLUtueJbY47oh4x5H3bXjlmeIw22ge
	LHeslvkgYAHspUCyVR3rMsjoAAaFVctgIJultxtIrw+lYC8goiFmf3UlqpyUGRaV
	mYpHcaRKyxWnLk21hlRyIg6M0MMuiITFBiTAol/UMllXmDPfXq8vE7d4UcqM9spL
	lo+73A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a9a5bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 06:51:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so450504385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 22:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770360664; x=1770965464; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HuJHHqERZSbJYVx8ti8SKK1ive7KABqaDZ8PshwswtE=;
        b=LT1ZjCb9d3xyPmSU6MFDSRG4/g+67c8QGybymChMe957vscMipP1IN1ZIfrDttmRe8
         8S67gpLJ4Mg4oAXFnXwPTuWYb1S0/WKANsAIMCsImZtrYvHLYaYRIegOsaeq4MOWIj5Q
         8pbZ4NEpu/kZR7WIjCb+9XEUnD+sEmLl+/AtWRoALtab53Pzj1BQfpPOR3YzC5oyPmN6
         z+JYNC76I7XYrRFeBqpszy52WHyh3PqB08NdyGqFpfCTDnk79rh4HuH2KWikQ9smaAOO
         r8iSVsspvEg6Ou+tIQJQsURWmMTY+4znxj9cvPui/xeicCk9KVHNvq9+ktMxCEUf3cuR
         jDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770360664; x=1770965464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuJHHqERZSbJYVx8ti8SKK1ive7KABqaDZ8PshwswtE=;
        b=gMdip6Wjuj68DxbERqowNhBYpL09Uq4bSdaa8HKRVSEGIr8jR0r09pCaqaznAvSKe9
         Q0wyWCFsyE08EbfJ0m9zjZkfJhlJRqH8AmSK6cuBHxwKskJFpy1YKGIO+LIzA2c21Ti3
         zMxKq43of5I7kyNsD5dr/UzwRsbWeZWRd9XBo+lLrJ+TV3Xq0ikrxFIz6b9ADVNB0NLN
         KBmrf+eI+W1mC8gtNnCjsWIpX16Byk2GQdZPsNkyV99Ewf2HWm45Cm4HiABRb0A6rmmz
         w+KzNzxDHSA3coRkctrAd2ADCM+8ig7TjRCaidCvOJxHLlM1xt8TQzeUjMeLo5HOKH8u
         Wpgg==
X-Forwarded-Encrypted: i=1; AJvYcCXi+7UtjP5O43WI8EYEK3gYwU1nwXqiMgFLCqe831bid0kTCV3/WTFbIg1joEQAgXueOGg3XPs0YMiHcAic@vger.kernel.org
X-Gm-Message-State: AOJu0YxgY57BoUu53ZSiFn3CarYsg8zNZQjV962bXZ+Vc+Q6itMRJatT
	/TITTzKi30qFs1KWIOinZeXBnwe7b+kjcC5yupN9NbkE3f6NFbomO0GxVlgY+diABn8Nzllaiw/
	azHpyiqoVLmX/uM6D7w6FGQTsbigWcIThlVhPBQ5EN4raxjvasOF/P6mgbxeOQR+HRYFC
X-Gm-Gg: AZuq6aLSk3jw5TxqBVzUeHi/vt/lo8S9eOilCBUaixx0SydDkLkx+Xxr1gbLJ5G6Poh
	nd9TeDnrsdQHYSjeEsvs+TCJy7mzyodBvuc9Z0E74CRQx8DwM6ThS5xAQk+s71crRg4oB7tS4cB
	4kcc0SYypDIRhnAmtbcYVYA/x8hPGwESaN2jB82Zx1G9VptDOOoICW4P0m0Pnoq8lk0xWg+3AAl
	9RA3hLo8yDyab31VeEQB6h8lJfVYJe1/V8YyypXjf30ERsOWQfMjrrCtoD1sy/hQr0T4UCTaYje
	IX1rN1x/U26VlED8SPaxX5+NZOcwquz1zotxBYlIrP/VSjVvsHFf3mBpSlAJ+sZ2ZSzKYVuH2Rv
	UGmEDYhq8SJj8wZdF51EGasGsrg/K5PqnNZlXbqH3rv48FUYE9GvCk8cDuwgtBxvsL3iSSHYUf7
	oEW22ofq3CvOqrpYjnAmzQYo0=
X-Received: by 2002:a05:620a:1990:b0:8c6:a82e:16ba with SMTP id af79cd13be357-8caf2691e8emr243004985a.84.1770360664077;
        Thu, 05 Feb 2026 22:51:04 -0800 (PST)
X-Received: by 2002:a05:620a:1990:b0:8c6:a82e:16ba with SMTP id af79cd13be357-8caf2691e8emr243001785a.84.1770360663465;
        Thu, 05 Feb 2026 22:51:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f1csm349731e87.19.2026.02.05.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 22:51:02 -0800 (PST)
Date: Fri, 6 Feb 2026 08:51:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,qcs615-rpmh: add
 clocks property to enable QoS
Message-ID: <trcbrxphzbgldya5cau42irrsnu7wn5swffjyvm74z7emfcevg@muojwgpa6ln4>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
 <20260202070534.1281652-2-odelu.kukatla@oss.qualcomm.com>
 <b37e6569-61e9-4998-8fc0-603b83edfa2a@oss.qualcomm.com>
 <95d42fb7-2365-46a0-a995-c9cc51b17424@oss.qualcomm.com>
 <ac26d960-5c05-4681-aefe-4827b74ef29e@oss.qualcomm.com>
 <a9c2f6e2-0185-4a1e-bed6-fd1f542b2367@oss.qualcomm.com>
 <luahjv66e2h6gvxygmy2syzvt4rmdzqlfig6um74ysfhidyztc@eu4whsehmm5q>
 <f694b267-ec02-4867-86a3-b63ff2d908ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f694b267-ec02-4867-86a3-b63ff2d908ec@oss.qualcomm.com>
X-Proofpoint-GUID: spqUvFmHVRcuTUl3NUX0O9Bdhuv9kgf4
X-Proofpoint-ORIG-GUID: spqUvFmHVRcuTUl3NUX0O9Bdhuv9kgf4
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=69858f58 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=tCHVXK5BGllWWY9b5fgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAzNyBTYWx0ZWRfX+v8+3dNhqmvP
 m0/unU/OUBVDFyHufoOxGoD6Wz+YDC+nBBnQCXrVXltCGBK49sJX19A1BtIZuwW5aeLhZ/BmTld
 b1BnyE+VZ8isdwt/9+NbKLOsXGuFh1NenSoKmGqXpFWXpVgTO+097pFgRKmNqA4Vo9ID4iHAmXG
 yCsP6dCkhc10xMtKDS05DeBWYb+4VWD8paQVDXaDidA5uqjOPkGZOB41OHJHyW0P9UZy7uhfNxS
 2BMOdIp7KxPHBVz7LQO3yPxaCyXPVkeZB3uvwnAxWL2OZwoa4xjfNQyd2nlijqgMk1p0EID5q36
 ifDzAWSADSaONPjW4vDg94HTl+B+wEwBpvttyhe4KX6BFQZsGnOoF8gpvc4KuCxICKYcnBY5XCI
 XnC7AFgPHp/JQB+sLbdnZ5HlZ2K1L2tuSHeg1ENw5cwsxzSnJ6THax/oHzvvOgn2CRmQzO4VEb6
 Z2fgnSayft7+bd0X8MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060037
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91974-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2E0BFAC44
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 10:28:15AM +0530, Odelu Kukatla wrote:
> 
> 
> On 2/5/2026 3:59 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 05, 2026 at 03:10:31PM +0530, Odelu Kukatla wrote:
> >>
> >>
> >> On 2/5/2026 2:31 PM, Konrad Dybcio wrote:
> >>> On 2/5/26 7:06 AM, Odelu Kukatla wrote:
> >>>>
> >>>>
> >>>> On 2/2/2026 4:33 PM, Konrad Dybcio wrote:
> >>>>> On 2/2/26 8:05 AM, Odelu Kukatla wrote:
> >>>>>> Aggre1-noc interconnect node on QCS615 has QoS registers located
> >>>>>> inside a block whose interface is clock-gated. For that node,
> >>>>>> driver must enable the corresponding clock(s) before accessing
> >>>>>> the registers. Add the 'clocks' property so the driver can obtain
> >>>>>> and enable the required clock(s).
> >>>>>>
> >>>>>> Only interconnects that have clock‑gated QoS register interface
> >>>>>> use this property; it is not applicable to all interconnect nodes.
> >>>>>>
> >>>>>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> >>>>>> ---
> >>>
> >>> [...]
> >>>
> >>>>>> +  - if:
> >>>>>> +      properties:
> >>>>>> +        compatible:
> >>>>>> +          contains:
> >>>>>> +            enum:
> >>>>>> +              - qcom,qcs615-aggre1-noc
> >>>>>> +    then:
> >>>>>> +      properties:
> >>>>>> +        clocks:
> >>>>>> +          items:
> >>>>>> +            - description: aggre UFS PHY AXI clock
> >>>>>> +            - description: aggre USB2 SEC AXI clock
> >>>>>> +            - description: aggre USB3 PRIM AXI clock
> >>>>>
> >>>>> Should we also include the IPA clock here?
> >>>>>
> >>>>
> >>>> Thanks for the review!
> >>>>
> >>>> For QCS615, the IPA clock is already enabled by the bootloader (xBL) and
> >>>> kept on during the boot‑up stage. Because of this, we do not need to
> >>>> explicitly enable the IPA clock in the interconnect driver when
> >>>> accessing the QoS registers.
> >>>
> >>> Would we need to re-enable it to re-program the hardware if say the
> >>> icc module is loaded after unused clk cleanup or after a cx collapse?
> >>>
> >>
> >> IPA clock is not managed by GCC clock controller driver, so
> >> clk_disable_unused does not disable it.
> > 
> > The clk_disable_unused is not limited to the GCC. The clock is managed
> > by the clk-rpmh, so clk_disable_unused applies to it too. 
> > 
> 
> clk_disable_unused()/clk_disable_unused_subtree() does not disable RPMh
> managed clocks, so it does not apply to IPA clock.

You are describing the current behaviour of one OS. The DTS should be
describing the hardware. Other platforms describe IPA clock used by the
aggre NoC nodes.

> 
> >> As a result, the icc provider
> >> does not need to re enable an IPA clock for QoS access after unused clk
> >> cleanup. And QCS615 does *not* support Cx collapse.
> > 
> > Does lack of CX collapse apply to SM6150?
> > 
> 
> SM6150, QCS615, and Talos are all names referring to the same underlying
> SoC family.

Ack, I was making sure that lack of CX collapse isn't related to IoT vs
mobile case.

-- 
With best wishes
Dmitry

