Return-Path: <linux-arm-msm+bounces-82837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E1C78F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40E0D4ED28F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A213491D5;
	Fri, 21 Nov 2025 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsvNUnmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeZCPzoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66B134AB1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726976; cv=none; b=ZuM8Miy3ixrlHI6WOzeK0ivJw9XFfdIqC0IhzrNH+QWcotiUyFYvcxGlkQjDQNL72dX1OotvKF/isoMjXRiiDAkYcn3YCBKQTO/BNALLukUmaNXfarmzRK0SF2wPJy4MQXZyl7rfFSAjsjAIFIaSESc5jm/198KWBs3j5Zj0V48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726976; c=relaxed/simple;
	bh=fq9u6rKEzesAri82Zy3u5TfNpEqdatEFeQ1wOKCs0dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLa/6vlXDKNPH/vdjgQPukzt4evcJ1HahDDTA0gqQ3rQiEPZqnlmnQHAp+o7VuTy0kUOP3W959TVxpTHaGMqgvbqg6lgQACUk78Osj9m3Gkc2yun7R6EuHDjpikHuhXttHXtxIs9WkHMJn+QFoY4ASXKu3SO9OTVJj9jR0oc8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsvNUnmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeZCPzoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8YuFg3139652
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zGQlu6jj9oYzi0P7lbjaJIv+/Ang6ohhNMm2Bw9Lsk=; b=bsvNUnmWVGNtk77s
	3Ut5tTAEExobfD6ys17JgFRLs9mNB80V1TUEghvp+/VM59VJ72qutagZWwwL+F35
	poakBd7ug7SY0yKuRzw0qiESDkJwUIw3/7xhIPewfLcIcxFLf7vJ5o+Kd8cU7IiH
	jNxRBJUOg+KLdGfJ0YsouHVBPfPGrIUF4zaW2MZT3Q1OpsU0Ld+UrbzkSTG4uzXO
	OhTaEpx4hviERXu0L6VzLjBzl1xhzWSC3hJy/aqebLTo+SMn/gZgYcMKTh31kLDg
	mTCKs3kn6+xm8Ti9If2FAIdOGTrz0Ku0fpb7jWy7B4M+vON9aC7ip/TnoYMFbDRA
	RvrADA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppgt5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:09:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so569516585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763726972; x=1764331772; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+zGQlu6jj9oYzi0P7lbjaJIv+/Ang6ohhNMm2Bw9Lsk=;
        b=aeZCPzoyJOvzzMlaBkNWj+YcHgAP62bDchsMvgHhqh0XGKxE6vnt/muGg0g65Duouw
         c2dWPVWPlNMBnQLz+QG//Fvai8Wwl+tzPdBBJ6zQWpA+g58W+T6Jwpi8gaaePGrf39gB
         VmJ/0Ewlm7cjtIvm7Dbiz2tonYTTFdix+CEtmtBfAwLYCpWqayhBgPw09BLZ/6fuRGKK
         SOjuLFVsGDxjNe7AooGna6lNl15gPyVE+D32HB+JVIm0wa8gNKlvZJKSf32TPnWnJRY4
         XxT750Y0YEWjxfyD5fBwHFEt4wyjcEXtIfXC8a44QWIXn6OU0WT62xJtwFOIU2zecKkb
         WZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763726972; x=1764331772;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zGQlu6jj9oYzi0P7lbjaJIv+/Ang6ohhNMm2Bw9Lsk=;
        b=G9tNl3TD3/IzaObidmDzrGWEH5qBANpoIF3NiaBQYa3bVz5OVjMibMHoaaNweQQ9mN
         XQQeQrlOkQE6lnbO5ns1yjNsRUS0iNvxrGXfMu3qUFDZI4mCV2abRcdMYn9EWaFCjfCG
         fW4fPO3UiQ9shQoSYMwPkj+00KTXSiD5tq1kQ2ScBMArcEq6DJwXebz0+I6z8a3zUUCX
         2EtG9uJ95P3O7Kz2HXtO17HQ4T+7bFkkGOyc7OObZely/62nMqN4nevgVH+JzZjwTlve
         OgsHqVNy9YtGxAIxq3+g/S/+gXAgKvu2H5Fwbfn/z/ncZ7YJPkzlWl2V8Ylm2P+y9Oq8
         LHmA==
X-Forwarded-Encrypted: i=1; AJvYcCVXEkWhlHSX5++xSBiO+CJ+IL2FgdQV/d7tQqOF1jbVoG/IuUmK5CM4SnsfCw4i16+wuXYA/aMz7TSpkU75@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YHN1Wl1QmDRcfHalkvJJhVupFFzyEttAmg1egCj/kEH88mPl
	PTX+R8wA2z31fvoLgGCxz5ZOpdfpettlGHEHi3GjLMgcwKFBXfSl1/n3Oy66svjhi/QxEY5Uttv
	x1s9Hg+gZtjZL7bKjmJMzLO7jTTE79mWo8gRICe8LccODmuwD80iPzKH4VlTAsAqcz19Qmu5cvZ
	By
X-Gm-Gg: ASbGnctgiVeDHbtuOFI15U54rNESGc10J2mjdFp5IPw9AOa6HgI5UpB6HAg/T1G30Bo
	Q+hh5Q9mJRlaFCOcOFqP2dg49hiR2ZTPq2uVG48vPXa3GZytKxuBHGO9vgvvVblORXC4iGIoKPf
	s3Z+LFRtc8T/V9UDrZ+devlnCNw4M54Q51IOkg4fCVPRpbXejn0TIToRDpBZiCfJuSvVvgwQZmw
	+YVc4k40m7wYzgPo6BFF18VQ9D5f4KScO88Rda2XLcrBbQ6kkLyWNUBWcZ73XYqWVdQrTQxwzKG
	ZtihfUKzaBaOeI1TxnhvOE6rVWIzfLWwsJaqttevTdzXmEP3MFfu4TH+1mMV7L6ZgDvhK8Hturc
	BahnvBpGaYiPHvWr0TVOqbpd9wmmWuAUuRiRC3/0hCa6PeqXbmJX+uDHWe9NnmM5Tw/F3YzAtpf
	ETvPNRyFdwAFyB/iE/7f0Gzzg=
X-Received: by 2002:a05:620a:4509:b0:8b2:e70c:4263 with SMTP id af79cd13be357-8b33d4c8483mr201394085a.88.1763726972400;
        Fri, 21 Nov 2025 04:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkupH0XCrzqRaeeHWgkk4fAVZZv7qGzg3hFYJ6fAbyAAeI48Ugr95eaDQjnccQHyGqxvffPw==
X-Received: by 2002:a05:620a:4509:b0:8b2:e70c:4263 with SMTP id af79cd13be357-8b33d4c8483mr201389685a.88.1763726971890;
        Fri, 21 Nov 2025 04:09:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bcbde6sm10859521fa.49.2025.11.21.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:09:31 -0800 (PST)
Date: Fri, 21 Nov 2025 14:09:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
Message-ID: <2h222ejvc37cldeno7e4qom5tnvdblqn2zypuquvadbcu7d3pr@765qomrwfvwl>
References: <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
 <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RI4y9dNNAdn0ywWpUBA-zHZLOHB0Eyuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MSBTYWx0ZWRfXzPuOz47mOAFe
 YRnkcBgZZEHn5Pmw6nv361sWTAm3VFhJ6olVKYN/DF1Q0H67LEvqLXR1sIAJFqV/2VN0MiDIZXF
 VAiCC4QN6vRHgaHtTs0pUcZfk3DPgGvq95rI+1+iM07HWc2r1LxcajnjbA3d6crIMEExFklTg7c
 uvDKH/x1K6aW7qK2l0hDZD1Mwqu/PMGX6nGVJ7//tTS+loTqWaRre6Te50gf5S0w56B7cvQBmTS
 EkDMAJXvmjj842kfpFtEjDAq8N1XJlpxJd8Vi79c7UwuYMCULzBq3SSUG6v3iFD7heDHzYvLKwk
 Xmh6pZeQ6LuZNcIb+mnWe3RZwWADQA7mpmPhfQezOXO9jDiU9rHWme9CfOVtWgfGtYAnf0o2TaU
 qJmLp0YVASw2Dz/ZBniSHpd91ZIiow==
X-Proofpoint-GUID: RI4y9dNNAdn0ywWpUBA-zHZLOHB0Eyuf
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6920567d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=D19gQVrFAAAA:8 a=OuZLqq7tAAAA:8 a=HCHdmRvMB3AQNsFCoscA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=W4TVW4IDbPiebHqcZpNg:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210091

On Fri, Nov 21, 2025 at 01:41:21PM +0530, Ekansh Gupta wrote:
> 
> 
> On 11/20/2025 5:17 PM, Konrad Dybcio wrote:
> > On 11/20/25 11:54 AM, Ekansh Gupta wrote:
> >>
> >> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
> >>> 20.11.2025 07:55, Ekansh Gupta пишет:
> >>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
> >>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
> >>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
> >>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
> >>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
> >>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
> >>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
> >>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
> >>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
> >>>>>>>>>>>>    * add shared memory p2p nodes for CDSP
> >>>>>>>>>>>>    * add CDSP-specific smmu node
> >>>>>>>>>>>>    * add CDSP peripheral image loader node
> >>>>>>>>>>>>
> >>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
> >>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> >>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> >>>>>>>>>>>> cdsp_region, which is also larger in size.
> >>>>>>>>>>>>
> >>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> >>>>>>>>>>>> related nodes and add buffer_mem back.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> >>>>>>>>>>>> ---
> >>>>>>>>>>> [...]
> >>>>>>>>>>>
> >>>>>>>>>>>> +            label = "turing";
> >>>>>>>>>>> "cdsp"
> >>>>>>>>>> Ok, I'll change this in the next revision.
> >>>>>>>>>>>> +            mboxes = <&apcs_glb 29>;
> >>>>>>>>>>>> +            qcom,remote-pid = <5>;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +            fastrpc {
> >>>>>>>>>>>> +                compatible = "qcom,fastrpc";
> >>>>>>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>>>>>>>>>>> +                label = "cdsp";
> >>>>>>>>>>>> +                qcom,non-secure-domain;
> >>>>>>>>>>> This shouldn't matter, both a secure and a non-secure device is
> >>>>>>>>>>> created for CDSP
> >>>>>>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
> >>>>>>>>> Is this property not neccessary anymore?
> >>>>>>>> +Srini?
> >>>>>>> That is true, we do not require this for CDSP, as CDSP allows both
> >>>>>>> unsigned and signed loading, we create both secured and non-secure node
> >>>>>>> by default. May be we can provide that clarity in yaml bindings so that
> >>>>>>> it gets caught during dtb checks.
> >>>>>>>
> >>>>>>>
> >>>>>>> However in ADSP case, we only support singed modules, due to historical
> >>>>>>> reasons how this driver evolved over years, we have this flag to allow
> >>>>>>> compatiblity for such users.
> >>>>>> Does that mean that we can only load signed modules on the ADSP, but
> >>>>>> the driver behavior was previously such that unsigned modules were
> >>>>>> allowed (which was presumably fine on devboards, but not on fused
> >>>>>> devices)?
> >>>>> Yes, its true that we allowed full access to adsp device nodes when we
> >>>>> first started upstreaming fastrpc driver.
> >>>>>
> >>>>> irrespective of the board only signed modules are supported on the ADSP.
> >>>>> I think there was one version of SoC i think 8016 or some older one
> >>>>> which had adsp with hvx which can load unsigned modules for compute
> >>>>> usecase only.
> >>>>>
> >>>>> I have added @Ekansh for more clarity.
> >>>>>
> >>>>> --srini
> >>>> For all the available platforms, ADSP supports only signed modules. Unsigned
> >>>> modules(as well as signed) are supported by CDSP and GDSP subsystems.
> >>>>
> >>>> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
> >>>> The implications of adding this property would be the following:
> >>>> on ADSP, SDSP, MDSP:
> >>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
> >>>> - Non-secure device node can be used for signed DSP PD offload.
> >>>>
> >>>> on CDSP, GDSP:
> >>>> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
> >>>>    are created, regardless of this property.
> >>>> - Both the nodes can be used for signed and unsigned DSP PD offload.
> >>>>
> >>>> Note: If the property is not added for CDSP/GDSP, only secure device node can
> >>>> be used for signed PD offload, if non-secure device is used, the request gets
> >>>> rejected[1].
> >>>>
> >>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
> >>>>
> >>>> //Ekansh
> >>> Does this mean that the qcom,non-secure-domain property should be dropped from both nodes? 
> >> I checked again and found that unsigned module support for CDSP is
> >> not available on this platform. Given this, the safest approach would
> >> be to add the property for both ADSP and CDSP, ensuring that all
> >> created device nodes can be used for signed PD offload. I can provide
> > The property allows *unsigned* PD offload though
> I don't think I can directly relate this property to unsigned PD offload. This is just
> defining what type of device node will be created and whether the channel is secure
> or not. There is a possibility of making unsigned PD request(on CDSP/GDSP) irrespective
> of whether this property is added or not. If DSP does not support unsigned offload, it
> should return failures for such requests.

Which part of the hardware and/or firmware interface does it define? If
it simply declared Linux behaviour, it is incorrect and probably should
be dropped.

> >
> >> a more definitive recommendation once I know the specific use cases
> >> you plan to run.
> > Why would the usecase affect this?
> I'm saying this as per past discussions where some application was relying on non-secure
> device node on some old platform(on postmarketOS)[1] and having this property in place.
> So if similar usecase is being enabled here, the property might be required[1].

DT files are not usecase-based.

> 
> [1] https://lkml.org/lkml/2024/8/15/117

-- 
With best wishes
Dmitry

