Return-Path: <linux-arm-msm+bounces-82838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2EC78F75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16F184E95CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AECF301719;
	Fri, 21 Nov 2025 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otQGRpya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyejyWQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9CA34A3D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727109; cv=none; b=GV1mNcerQgJsuK63OXc13p2+W1e0aTFlMgdyfj8zsgl8Ep7EB0L4H4y3co7f5EdVJFiZw3n/BlW7o9/T8UklrsjZzgkr0RmZlaJ8wmQt7pEx3P25QEe3jw8BO3c1M2CEbwURWrYgi70wh7kqM8IlAAhCbQck9mKsjJPD1QL3bBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727109; c=relaxed/simple;
	bh=h0hOsXzGQyWiEkOQSTCkLPnJQIrNZ9ZnvQjk4rL7Px0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyAdjDiXwvwjed/ypoWNEPY56FRBA/oyCuQq6wZ2sZRbr1tLYNHIagH6u6DRm+MJgRDm5cPb7RFYsE6f+iUSWFLHSnVSJyfwjMCWCPB3h59dQiuM/XKL8Fg7b64qkmtE16tq8eS1g1m2I0SwkGZGa4DfDX1ETWV7UkQjJlStHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otQGRpya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyejyWQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALACfZQ2746339
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlJiv5hR0NU9R1Wmyp1GYwZIfwFVKIIw0Ea7AoGCnVc=; b=otQGRpyaDiCxyhuG
	Z3Kfj6hEqWvq7OhlsD3+CRp8Stfef/ITWBsxrtri1m+24JpMYqYPjdtBgbaQtJZq
	sRitK8iCbeg0iaOE3wwJ+Q94VyosWKYOkvwLXebf/N+cYMtFAoOL8BK1GMkLB+iD
	Wo4z/2mh92IhHu6qHjrwqcoSGDVeizCyCnjtwX7GTu4/FjUd9r9g8PCF0/SF3Sz2
	4+mNZN/+kWFpCHRNyH5v/hWtYTPbNtzuRcDOzoWG6d/pBdVnt1aeGnRDsdQKT5s1
	n/xTitqH6k56ffDjrs5n087gGmtVEJsV22RMSGLLfIaKMzQ5TTZ0hrju9T+o9ueZ
	m4O6QQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh1k4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:11:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b26bc4984bso822697885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763727106; x=1764331906; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zlJiv5hR0NU9R1Wmyp1GYwZIfwFVKIIw0Ea7AoGCnVc=;
        b=JyejyWQsGyn9N5juQJ4Na8PD4FJM3G+1K9fGCDx4P51uKFGunp9GZ/KagGOe5R+icZ
         5Ngf44dF7oIVtgxI8g95LW/xXVoplb3YKonXAG7Q5GIDbU28RYp/45+U8sI+Mk3w+OAz
         mzFJIl+VGouUqXSUDdax3yXYU9PbxJRIm7O3nVHLFFyZcAAn14fdIay31Glcgj62/vZa
         Qd4r2f5pFE1PyYooKKnbgEC3g8Tq4P0Q9GtthWJX1k0HzBYbkliSmJ0kfkwL+otPttsL
         tAPGhF58RI4K8Zlk0Kv1In1EbUaCu1I/VAj9JLwFO93k6FP3+s8iXMKRmZNFEYA5v0kr
         4c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763727106; x=1764331906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlJiv5hR0NU9R1Wmyp1GYwZIfwFVKIIw0Ea7AoGCnVc=;
        b=MU+QtPbWeldltirzOJFH1RBGN3+qifNPCLzoE/KoY6nASyBOT1ciHb5PpUj94gRvir
         7CBM2ovRwYd7DmMr4w+01TfVxgxlr/yMCc5pRp914YTeKzufv/hHUF9wgwOUujDUYp13
         1H9gjhy4NxdUAZllIS3katY0rDIoYxyNyCUF02M6pEMRwHNv1N21IMiL2LiMHiHgOONQ
         q5DHjvIYL3IHST8I+x4wSC92Zr+78kr4FpOmcD/+lTwiZ8ZoclgEkyQ0EWeVjJVnvo7f
         twusKIVFOyLo3A62DTQa4yXU0ytZFoOCWy7LOeevQh7VC6sUYlZxJJLpTHX0xMcEcYMr
         SPTA==
X-Forwarded-Encrypted: i=1; AJvYcCXPmoCRiuT8WpddDHyaZGlWaVMpvbUJvrR7xD0yzvJWmTkGIE4hkgAhS50D8MyLsWpcbuSnGU914HsywmGo@vger.kernel.org
X-Gm-Message-State: AOJu0YzTm+EoemNauBIuWyZkX3ZYDBHEynOf4CcAiqFjM5JKCQ+GVxng
	7oci5Y9+R3u7eMa1NLMlMvl8yLNDRcsDvvkOKu6znHBTXXipfaj7t0Sco985Ak2BUW7Wv2xHhUP
	AnPiBSdZsmFvf+SJKSfVCTMNsgiN+g24ZncADrSHEuiIuJ5JND+FOwlTubuAg0O8ngZyQ
X-Gm-Gg: ASbGncuSDCsEtqlmmceK2zrD6QJlpJVbDSygyOAGCVLkZZIvlZE/sYsyNpgWRfj8Be+
	AW4Wu/7LkLi6T+X4dhCmPbpjlDX6DqMPwHlahSqZmeenebN+qs5gQ31xN9AQUOKWfPKdQvDV0QL
	XAn3GjDPYdjPQ+iP6RflfUgtl73GjK+Gb64mWdSlKebXnZIq5MpHRClhTaRrQcIskKaJWqGCF7f
	EVZ1mloF9bc0qyfcdp0lnB/NBha3QRsBcLLXBYek2eBX3uhEjbmgsEvsKpWRHVST/QAbBEcUBmV
	+Z0AN164dbfpYezwA6CkCQMnJoa+NlW6GlqYmrhyw+vyGHO/1BDWCd/rQ5LruE99YF6e8wMb0+a
	Ar/Vh8hi0SffkKrQONHJl2WwbyAHtZPpZ8teduaD990ax4Gq5W+8W7f4CjBkohe2F09Gc49JJg7
	8mSFCvyFtipcW5hllcwRL9f7Q=
X-Received: by 2002:a05:620a:4489:b0:8b2:9a48:219e with SMTP id af79cd13be357-8b33d22b02emr183505985a.33.1763727105889;
        Fri, 21 Nov 2025 04:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+T+vAjVXWzf1s+dQFgZ14zRcUu84hU/ARn5Fe5IkBF7Yf+d7ZyXrJ3RPwSkLdHFCjjQUthA==
X-Received: by 2002:a05:620a:4489:b0:8b2:9a48:219e with SMTP id af79cd13be357-8b33d22b02emr183501085a.33.1763727105304;
        Fri, 21 Nov 2025 04:11:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b4b47fsm11772031fa.2.2025.11.21.04.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:11:44 -0800 (PST)
Date: Fri, 21 Nov 2025 14:11:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Message-ID: <iwtasncd3wu73xv4ot5sl5zjukhqzxo2m4s4aeetj2ylrke7b3@47trnxo2lcci>
References: <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
 <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
 <975b468f-e5fc-40df-a9b6-2630f6ed99cc@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <975b468f-e5fc-40df-a9b6-2630f6ed99cc@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MiBTYWx0ZWRfXxYk7j0pT0t8J
 S+jq9lRhG8qRQcCYoJK4fJSGm733Mwi9dQt1LrQzX1njgaV/Bwy4MZePv/7WsPMXGdfbFICdk/q
 TiTJuIF+R6+IUw//BCQQvQXlXPQGi6WLMbDCw3XcnnmGdk6xMr71y79nG+coVZssKFIVxCaWNKr
 04K+rKxY09i+zeELwGnuFQPLsm7qVQ9ULH2OeClgSmAi7x3JrVgcBnHUvBsBYlexPokytLiIjbg
 FRuJXgNf38XCEiQy1Hb2KFQ7T+Myea2TssGSMNRBfPuQzNvBpMBJw9Z3H4fT2qpqjzRUQpnDpWw
 QBhO/lqkEQhTQnJxOT+sb4pcFBJvW/ZkMZbajYVeNyCOqq8ZM34QE0A55eHbaRmjhyNdkhli/5R
 AgkaHNRxkFu4CmWGSzAFo0pLeZ8dVg==
X-Proofpoint-GUID: oLPuMxO2ZwEXEds84VzjclX3oLmnTaua
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=69205702 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=D19gQVrFAAAA:8 a=OuZLqq7tAAAA:8 a=A_v3rIXoYnqTE8QlmXsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=W4TVW4IDbPiebHqcZpNg:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: oLPuMxO2ZwEXEds84VzjclX3oLmnTaua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210092

On Fri, Nov 21, 2025 at 11:18:31AM +0300, Nickolay Goppen wrote:
> 
> 21.11.2025 11:11, Ekansh Gupta пишет:
> > 
> > On 11/20/2025 5:17 PM, Konrad Dybcio wrote:
> > > On 11/20/25 11:54 AM, Ekansh Gupta wrote:
> > > > On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
> > > > > 20.11.2025 07:55, Ekansh Gupta пишет:
> > > > > > On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
> > > > > > > On 11/12/25 1:52 PM, Konrad Dybcio wrote:
> > > > > > > > On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
> > > > > > > > > On 11/3/25 12:52 PM, Konrad Dybcio wrote:
> > > > > > > > > > On 10/31/25 12:30 PM, Nickolay Goppen wrote:
> > > > > > > > > > > 24.10.2025 16:58, Nickolay Goppen пишет:
> > > > > > > > > > > > 24.10.2025 11:28, Konrad Dybcio пишет:
> > > > > > > > > > > > > On 10/23/25 9:51 PM, Nickolay Goppen wrote:
> > > > > > > > > > > > > > In order to enable CDSP support for SDM660 SoC:
> > > > > > > > > > > > > >     * add shared memory p2p nodes for CDSP
> > > > > > > > > > > > > >     * add CDSP-specific smmu node
> > > > > > > > > > > > > >     * add CDSP peripheral image loader node
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Memory region for CDSP in SDM660 occupies the same spot as
> > > > > > > > > > > > > > TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> > > > > > > > > > > > > > In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> > > > > > > > > > > > > > cdsp_region, which is also larger in size.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> > > > > > > > > > > > > > related nodes and add buffer_mem back.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > [...]
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > +            label = "turing";
> > > > > > > > > > > > > "cdsp"
> > > > > > > > > > > > Ok, I'll change this in the next revision.
> > > > > > > > > > > > > > +            mboxes = <&apcs_glb 29>;
> > > > > > > > > > > > > > +            qcom,remote-pid = <5>;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +            fastrpc {
> > > > > > > > > > > > > > +                compatible = "qcom,fastrpc";
> > > > > > > > > > > > > > +                qcom,glink-channels = "fastrpcglink-apps-dsp";
> > > > > > > > > > > > > > +                label = "cdsp";
> > > > > > > > > > > > > > +                qcom,non-secure-domain;
> > > > > > > > > > > > > This shouldn't matter, both a secure and a non-secure device is
> > > > > > > > > > > > > created for CDSP
> > > > > > > > > > > > I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
> > > > > > > > > > > Is this property not neccessary anymore?
> > > > > > > > > > +Srini?
> > > > > > > > > That is true, we do not require this for CDSP, as CDSP allows both
> > > > > > > > > unsigned and signed loading, we create both secured and non-secure node
> > > > > > > > > by default. May be we can provide that clarity in yaml bindings so that
> > > > > > > > > it gets caught during dtb checks.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > However in ADSP case, we only support singed modules, due to historical
> > > > > > > > > reasons how this driver evolved over years, we have this flag to allow
> > > > > > > > > compatiblity for such users.
> > > > > > > > Does that mean that we can only load signed modules on the ADSP, but
> > > > > > > > the driver behavior was previously such that unsigned modules were
> > > > > > > > allowed (which was presumably fine on devboards, but not on fused
> > > > > > > > devices)?
> > > > > > > Yes, its true that we allowed full access to adsp device nodes when we
> > > > > > > first started upstreaming fastrpc driver.
> > > > > > > 
> > > > > > > irrespective of the board only signed modules are supported on the ADSP.
> > > > > > > I think there was one version of SoC i think 8016 or some older one
> > > > > > > which had adsp with hvx which can load unsigned modules for compute
> > > > > > > usecase only.
> > > > > > > 
> > > > > > > I have added @Ekansh for more clarity.
> > > > > > > 
> > > > > > > --srini
> > > > > > For all the available platforms, ADSP supports only signed modules. Unsigned
> > > > > > modules(as well as signed) are supported by CDSP and GDSP subsystems.
> > > > > > 
> > > > > > qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
> > > > > > The implications of adding this property would be the following:
> > > > > > on ADSP, SDSP, MDSP:
> > > > > > - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
> > > > > > - Non-secure device node can be used for signed DSP PD offload.
> > > > > > 
> > > > > > on CDSP, GDSP:
> > > > > > - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
> > > > > >     are created, regardless of this property.
> > > > > > - Both the nodes can be used for signed and unsigned DSP PD offload.
> > > > > > 
> > > > > > Note: If the property is not added for CDSP/GDSP, only secure device node can
> > > > > > be used for signed PD offload, if non-secure device is used, the request gets
> > > > > > rejected[1].
> > > > > > 
> > > > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
> > > > > > 
> > > > > > //Ekansh
> > > > > Does this mean that the qcom,non-secure-domain property should be dropped from both nodes?
> > > > I checked again and found that unsigned module support for CDSP is
> > > > not available on this platform. Given this, the safest approach would
> > > > be to add the property for both ADSP and CDSP, ensuring that all
> > > > created device nodes can be used for signed PD offload. I can provide
> > > The property allows *unsigned* PD offload though
> > I don't think I can directly relate this property to unsigned PD offload. This is just
> > defining what type of device node will be created and whether the channel is secure
> > or not. There is a possibility of making unsigned PD request(on CDSP/GDSP) irrespective
> > of whether this property is added or not. If DSP does not support unsigned offload, it
> > should return failures for such requests.
> > > > a more definitive recommendation once I know the specific use cases
> > > > you plan to run.
> > > Why would the usecase affect this?
> > I'm saying this as per past discussions where some application was relying on non-secure
> > device node on some old platform(on postmarketOS)[1] and having this property in place.
> > So if similar usecase is being enabled here, the property might be required[1].
> 
> I'm testing these changes on postmarketOS. However, sensors aren't working
> through FastRPC on sdm660.

How? Could you mention, what exactly doesn't work?

> 
> Is it better to leave this property for both nodes?
> 
> > [1] https://lkml.org/lkml/2024/8/15/117
> > > Konrad
> 
> -- 
> Best regards,
> Nickolay
> 

-- 
With best wishes
Dmitry

