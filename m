Return-Path: <linux-arm-msm+bounces-82836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BE1C78F0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E74B04E51C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469A734887C;
	Fri, 21 Nov 2025 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQ4u2LmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMcDRhOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3BD34B678
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726877; cv=none; b=Th98DRTYQh7KvoTD1mprXLatbYG3mTCBf2Vnz+JiAYiB7PtANW3aOGRKjYaSsPcOH9EUyU9j9YnMxzzwBdIcqpMy3AC8vV7A2j6MXuiF8dMQXg3CKGga2+ShsEnH2+L918uwPFPWiBqm3GoyUdIfhUo0jCmTD9xGlPZT4vf534w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726877; c=relaxed/simple;
	bh=Zk+UQ/5PCEuUUQnVLE0gjME8oyXPyG73KxBRCwkzDpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbzWtMFIFGb4CKTgyqX0zeni4Qy7sUYld1dKvWQUiRP3cLL18hEhrZYAiFjA/RBwoRItA6VpYkG6g3LMRj2F0qxVZzWLjLMA0NGk4K9N1kmX0d8zevNiwEWIYMzXLTbpzF3jfwva4LQjtB02ibxmlija1IHYFHZ+Qq0jM3HUBmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQ4u2LmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMcDRhOx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB4KiO3911792
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cxwo9u7SZvIzclV1DXtkTk6z9YQ4KIFD0rJ5xdRrWc=; b=MQ4u2LmB6xP3gBDt
	fTbLgnAJyvS0TxbbA3pF027CJdwb7NaaHxoittK40eaJrP6TWEko0hxoH4+BfDBN
	qdFHkSYbWxAamuD3qAkkKOJrc8AthvXgmvaau7ww7wWvz5+xlUH0TwV87gPgerDf
	OTzt7am4/nHe55MDDE+Gwjn5UW2zhXJT9fAp+RMo1TMBaqPNzPnpts6DBOk15VCq
	1F/vetgKh3tDO9EipeBmLH2viUuTAA/r3/xSDRP2ZLGXjsuywRRIqWXmXTsUE0sk
	wjZlPSoTcYl3N/FhxvHuJxTbz53GY6DXfgEgIj3oUaPaf3p66l02nenmOCX9VCHx
	/taQiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsg5tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:07:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e41884a0so589281185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763726873; x=1764331673; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cxwo9u7SZvIzclV1DXtkTk6z9YQ4KIFD0rJ5xdRrWc=;
        b=EMcDRhOxEy5j9S7elT/VOtiQQfhuZhXdNqRMq3iJtIQEQlgWOC5iUXi1+aw9FHp2g/
         1SlygCyuIxzVa5LgYCfNredb7ktYrA34Im25phRBUHOzZsj6NXIxsiYs2kQvos0Dhb5r
         CxHV5ZaDJTQ4HE88kCAVLwpJLr4Uvsz1gQ2GX+BUXsn2bByFKiPOVvKylVq72xTEcW/T
         MwKGBpnZ+bQsrdzSAOMqkzBswzoDcbhPXxhx+T/hEWNiVgZ0KWJHIX73++cDsAdBZ+5B
         cZcRKhy5yJ4VFmjZfbO+wOchU4Bz8f2zezgZrtJyiCgpo7Q3b39hs8/SKCRuGQBVyWiF
         DJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763726873; x=1764331673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cxwo9u7SZvIzclV1DXtkTk6z9YQ4KIFD0rJ5xdRrWc=;
        b=K2JRPJq0pNyYjESWfjE6xuRDtwa6vDDYFJ0BbzBOTF3JaWFy+dwSUTjT1e/5Wz4cmh
         qoaI7uD2x/CjmIXDL/SyGE1OhArNJWZAWUwkRGpGp4u06xeq2J05YnimMBqXLbxMUG5I
         02Uw/FZcimRBL7KhrB8klzjMIUiiH6FqAQLhHCVPU8Pgzhe1SBS1fQdCEhSJQXU3ItO9
         1kGVwU6hVGLaaJO+RNjBlczwSsTp1BNPrrb+h5lSZ4JvJ3iaRsTH88TiyJNZfqpP3yGr
         7errSXJ7GK5CWrYasoj614v0gZ6VirielPs2SwzIbnSZt18kJAHJGr+xUCEskXE0hzr6
         OBwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5Q37IphRFouxyE9qlKHYv8RCrPQPt0XWiX50jes1eJtl2l0NIPBBiOfBCU0kJajVkL78ICSgIIFkWRzb@vger.kernel.org
X-Gm-Message-State: AOJu0YyZcnHl/gdWI3tUUfwyQi7hxnFUx6uUxTAxX9pR+EA6lKPCaGJ9
	DVmQrKidaEJXCWQixduGXD/+VGUrWBXL1xcwvjCu9eRcALn6/wTP+kJHRZbRdnYwXLaPo74COgB
	Q8ZRTnc0d+yQU5LL53jl1+wqUhKdTrpiRs1JJFGFOwbH0/SgLpNICMIbSWUgda42PmP5d
X-Gm-Gg: ASbGnctlpBML1kKpPm1KIswngycNw2uchEWGcPqNMnylDFtqVhVWdBU9nir/YSypOfp
	wL+89iok5NxOiagx4GkUgB7j+wuVKAztSckOzfxrkucPfWJnRttmhv8IN5Da4yeTzziTpq7HeB0
	VwEyx7+P7zNS9LzMLgR0ST1WpTYoprzYWCUNX9v153CrBemicb3VlPnKYNTlu1AgwjtF3L25Tf0
	L/o70K5Dt7kphVpVg9MlYQvA+JI7r6n+03lYkwdaY3zlY+2Kd6TGEkNSOmYgJpWXTJiAgZIcaEi
	B1uAlazsRmv/Qq8zz7ZUOLIlSkSIy7COaw/ifZeYAsE/LVD0en+KAFHhSnkJja24XDEAIKMjU+d
	3IC2O6L/DZaNBLNxAPNIdNuKJ1nuE/9Z4kJkcUkTxpDSnXnk5YBxaRDxrOAjISxHsP3EOERfXYn
	hmgUOyWhP50S+Ffjd9F7C8eR4=
X-Received: by 2002:a05:620a:31a6:b0:8b2:ed02:21ea with SMTP id af79cd13be357-8b33d49b0f2mr181737585a.67.1763726873385;
        Fri, 21 Nov 2025 04:07:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq33mfpTvDkDC0Z2+HA9aYgYxtYtg0++EOVQ8w4Ow7n0NZ5IRZKhEu9TB7pUpDUMjYzr6cvA==
X-Received: by 2002:a05:620a:31a6:b0:8b2:ed02:21ea with SMTP id af79cd13be357-8b33d49b0f2mr181732885a.67.1763726872903;
        Fri, 21 Nov 2025 04:07:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b48f61sm10385201fa.6.2025.11.21.04.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:07:52 -0800 (PST)
Date: Fri, 21 Nov 2025 14:07:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
Message-ID: <axciimb7k4xktkliwrutn6ltcownbzz677bq7xbpybijfgrvrs@poy47oerxzop>
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
X-Proofpoint-GUID: ok__5XA1mBMc7EQRSgRixKRrdYAhLlGE
X-Proofpoint-ORIG-GUID: ok__5XA1mBMc7EQRSgRixKRrdYAhLlGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MSBTYWx0ZWRfX5tKWsdNIVgpP
 Hk51uUBre2eIKtsJyGkY6N5EYGu0D5BrLIfpHv6u3M3yAlBqVM5+ojpiBGHKD3kkp5dFDfjq7yf
 CrUGUQNcc3lkS0+2Td+vwaG7hC+zq/TlSQCb51xy7Y+bUDh4DflUoMThxTTonxxOd/aPDYy9gkW
 dsg60fcCoUc3tLstucc7u7oWFCNW682/ZTkj4cm0flG9z3C9FJFV1KICAWG7+fiU9kkE+pv9hSc
 W5M4rUk1sQG1MD7vBfrhJkMMnE3KWjLwlUck0PHBcvePxxaAz/+qpg9EuMZWAsWJzL0Lskx0zpI
 vTKfYIzBCdOPq6hnziFgkqb9yOmRd4HpWlFhwT6VfzaeQTpNIzVfakk4YloiwBjOhlhIDW0UmV3
 Nj0DycPybjkxm9pUg8hJuQru9Rexeg==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=69205619 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=9or2P8fZMCEsIJC6QVEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210091

On Thu, Nov 20, 2025 at 10:25:13AM +0530, Ekansh Gupta wrote:
> 
> 
> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
> > On 11/12/25 1:52 PM, Konrad Dybcio wrote:
> >> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
> >>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
> >>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
> >>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
> >>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
> >>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
> >>>>>>>> In order to enable CDSP support for SDM660 SoC:
> >>>>>>>>   * add shared memory p2p nodes for CDSP
> >>>>>>>>   * add CDSP-specific smmu node
> >>>>>>>>   * add CDSP peripheral image loader node
> >>>>>>>>
> >>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
> >>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> >>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> >>>>>>>> cdsp_region, which is also larger in size.
> >>>>>>>>
> >>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> >>>>>>>> related nodes and add buffer_mem back.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> >>>>>>>> ---
> >>>>>>> [...]
> >>>>>>>
> >>>>>>>> +            label = "turing";
> >>>>>>> "cdsp"
> >>>>>> Ok, I'll change this in the next revision.
> >>>>>>>> +            mboxes = <&apcs_glb 29>;
> >>>>>>>> +            qcom,remote-pid = <5>;
> >>>>>>>> +
> >>>>>>>> +            fastrpc {
> >>>>>>>> +                compatible = "qcom,fastrpc";
> >>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>>>>>>> +                label = "cdsp";
> >>>>>>>> +                qcom,non-secure-domain;
> >>>>>>> This shouldn't matter, both a secure and a non-secure device is
> >>>>>>> created for CDSP
> >>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
> >>>>> Is this property not neccessary anymore?
> >>>> +Srini?
> >>> That is true, we do not require this for CDSP, as CDSP allows both
> >>> unsigned and signed loading, we create both secured and non-secure node
> >>> by default. May be we can provide that clarity in yaml bindings so that
> >>> it gets caught during dtb checks.
> >>>
> >>>
> >>> However in ADSP case, we only support singed modules, due to historical
> >>> reasons how this driver evolved over years, we have this flag to allow
> >>> compatiblity for such users.
> >> Does that mean that we can only load signed modules on the ADSP, but
> >> the driver behavior was previously such that unsigned modules were
> >> allowed (which was presumably fine on devboards, but not on fused
> >> devices)?
> > Yes, its true that we allowed full access to adsp device nodes when we
> > first started upstreaming fastrpc driver.
> >
> > irrespective of the board only signed modules are supported on the ADSP.
> > I think there was one version of SoC i think 8016 or some older one
> > which had adsp with hvx which can load unsigned modules for compute
> > usecase only.
> >
> > I have added @Ekansh for more clarity.
> >
> > --srini
> 
> For all the available platforms, ADSP supports only signed modules. Unsigned

Is it true for msm8916?

> modules(as well as signed) are supported by CDSP and GDSP subsystems.
> 
> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
> The implications of adding this property would be the following:
> on ADSP, SDSP, MDSP:
> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
> - Non-secure device node can be used for signed DSP PD offload.
> 
> on CDSP, GDSP:
> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
>   are created, regardless of this property.
> - Both the nodes can be used for signed and unsigned DSP PD offload.
> 
> Note: If the property is not added for CDSP/GDSP, only secure device node can
> be used for signed PD offload, if non-secure device is used, the request gets
> rejected[1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245

-- 
With best wishes
Dmitry

