Return-Path: <linux-arm-msm+bounces-101795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAxSLulo0Wk+JAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:39:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E10539C444
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 857F030041C9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2A721638D;
	Sat,  4 Apr 2026 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pypFs1hd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIT7Hjp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFDF336EE9
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331558; cv=none; b=hMebeSJ+BvwyeNrOGt4g1PNyx0iiGss++SRVHEd0FOW9K/H3xGM7Fn8tLc/5JVX/Pl/gzG/Umm9Sl9/gpH/O95aMnHoz+VGteZpOGkjNuAIeNtS6r1TgVgpLxvfWqIdvxnMlUhcA2+L8QblfpA8AsIHpo36WphUA5pjbWGZ0dDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331558; c=relaxed/simple;
	bh=bhSWQ3ZfgXTqMl5jnr9Ey35ceFVnpsBFkYha4L/zkDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQYaC0SQxad886jEoeAY5EUV7n58gFZpGj01MpUEffqcXJUpgIIZ1UzH9v1kcQGeWzzjv9glPYarrNzHNXHdyqvwp9FxuM1rxFpUsgPOEByg4hLzyQIdiIJLLr3tkLaH/JYubgxmC6+/2CjV7sihXunB2aUdH8UHmfp9pA7dxX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pypFs1hd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIT7Hjp/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634DpcJQ4084637
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYxNlfn0z68Q5H689uRsG1iSbQh/q+inGQdA92eyZtk=; b=pypFs1hd1fmpkiOS
	SoCmFB6a7C6JeW8cJ8l0YpQJNXwy5mzkR/AkyOBkjlmVTlzo5rYuBnta32t1pgXn
	bOWXpET9Oh2Mzwu7zR7wxWNLFIosDW4K02DRC2NJ88dFPIjGLHkhH5cPXcwvxoct
	QOauj1XnasTKf5CydOqgnYBSTgc1bqZf2ECuNWUlAyuUscHYyATM/G1GKQ/iasGj
	YQVHsrm3z29jJ5fOjwfIDbwJJKeYx/KiJGlL24o+l4QSrDQ36hh9eIx5MXrzQ+Y6
	z2TsodR+rLOH+T1FcnNTxA1D/wp8eTy1pMLCYuC4aAtdsKLaQp0KUtqtjGeBdIgz
	EpLOMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauth99j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:39:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so73225741cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331556; x=1775936356; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYxNlfn0z68Q5H689uRsG1iSbQh/q+inGQdA92eyZtk=;
        b=fIT7Hjp/fEBC75nIYiq700pxRpUdkMCsRwDZw3nDCCnmefGV2SUnKyMfVLAcjpkth9
         JehijduPT4WgPJaIHz4cpLP+wiHj1i0YxFo00byvPXU4ruGcA8OVHZM6QD9sgpp4PdL+
         0p0ZSMMIukv+yi8Def5Gze4ybqv4UCzxpWUp9wVLbBl/AWNDCuqGFBe6N1zB2rC43Ndv
         uiiGKETFDmiG6V1Qoy5/g1Dty89lLGgom5rY2zSWnALOeojEubJx8XjFrLRWS812US/D
         KDth1bo7IsnvT3rNRnZ4n+21GcXi62oI21aUxxr69Ur18yb+lADU+HALuVBbIE0iOHl6
         OZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331556; x=1775936356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MYxNlfn0z68Q5H689uRsG1iSbQh/q+inGQdA92eyZtk=;
        b=WPVJFGpRoZ6eS6UYLlevdZyRIDxz+PPziHhWTpap+t+U50z8JtW9PnpKJhNSN1MJU2
         Ygl+vs28Ril8lFJuaIjhmeEH4tpXKAfK3qG5L+9phwvIbsz+1WotYhi+SQGfgwDDsflV
         wNkZHrzr8kPb+mYdPYt60sYZGc5icB+0IxhvY4y3Fp2ZzuHHJMwLz2Plg9i3ephJgabZ
         G/rFYXsuh7tTIuUNwRkEo0vL+3S1RW3sRNpFQQet0EC5PwUUfJ+DXtlXN6sPkyYUdLOU
         VkqDFwd3d5Xu7lleGk6vML2OOwrb2nCFeyn/p3YUPvKZzEo7AVDCL1ev7tKlawU844UE
         VH7g==
X-Forwarded-Encrypted: i=1; AJvYcCVQi5pkzsfPD+xDyEIMr1u2HJqC6i+aYSP2XyoUi2Ed9ieZTvWLegl3wwt3XBlzuVZMGMYEvyiTMrUo1g5u@vger.kernel.org
X-Gm-Message-State: AOJu0YwLWqsPr1cwbaatq9JeXQ1EzMnRs6s1PE4LFr8vEbGUb4sb0abd
	iIWLFf7Fv5wo3m4Nql19icfCr5k/jM/0KnTXIlMpKjkRiAJohZy3/GBICuzz2axG6AhE4MvM234
	xiO4pVHCPzldRTqUMmkeiPtWAjBV5V9EuQekyPWid1D+sOPPaAnQHuSxYy0+OBTEDJz/N
X-Gm-Gg: AeBDietGobtgbRi/TZZuYNvG7/i6yWvVQ+8eYSUwzZjuxzUoz/FID4M+XI9usSi/Yhu
	zFA0WAhArUPaJJtAMJoVA78u/QNV0T/PhlNH46fnsSxpE5wSB2aqBTsJI1R89UtXx8aByh9Z5XR
	VmOuOOS0auHw3Erywu9JC5h2hOlB0fIes0WWkJZ3QOx7pyUkGRBnZT9RrDQemddKr2ycG7Z4bIE
	/1P2I/tcBFnSywhON/ve+8rgMMJD5b37v9p3BXymx5FhYk5H6zkAJ7hpDANzcIOPyOwkXn8VUph
	YZy4SS/SYZqm4UeDNLK+5076ZdrrENqeymvvPU0nHC2PhJ63TCxIdRFa5QRhwdQ210Ol8ou97+2
	hqv4zV+32t/gKG/fTOUawWZoj/0iSEeHK7UaxL4EWAl35kxG+aYOD+ImipWygdXaC4Q1xW4EvWU
	H4cY6jCCoSLJMM5r4mxT6DC9vFc3tGgbeUeEo=
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr124524251cf.5.1775331555566;
        Sat, 04 Apr 2026 12:39:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr124523981cf.5.1775331555115;
        Sat, 04 Apr 2026 12:39:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdd208sm22313111fa.12.2026.04.04.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:39:13 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:39:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Message-ID: <7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
 <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
 <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfX3Eageo7qDpT8
 XgqNdBvKWEZkcgVyxcUR5TB4YWqytW3xLGaYQ1PnGI3prlS36JirVOeEEGUnhA7nCjaK8IEnuz5
 ArMTYVcsRs+5g2PcjZ2N2J93b86xDxRBuYh1+19k9srSy7FiTdX/0H3V+MFwMj4OxJdbeSzUPHe
 K8kkiOm4bk9BPJuEn59IRw+SkAGaoQLiY4060N/XqCwCc4z7p64+byyNAY6pSfjzYyJsMv4s9nH
 CcGVNzL6siA9VOekUlx4W+af6dPzX2/s85/TyUt0hrzC2KTfx0j4h2ns99fbWsl9QGkwcvRt4zL
 OmShLYs2hTnT6eWknTHwNwUhgY1G2qxCq9xB0R8ot3ps+i20o1UVKMVNRMW+HoZ2bO9SKJGK625
 AOQWACSU0DTwSp0RsMyhSSpoV8G7bGm94+ZPSfjvCoUOLIXNQnk4Key/qY71Vfu8hYKLADBCD8A
 ZyCMl07rPhLRyClKbfg==
X-Proofpoint-GUID: laBehFKAQ3eQAVErVCic1ekB28pb9E4q
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d168e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=EsJBPIv444T2Bi-tIFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: laBehFKAQ3eQAVErVCic1ekB28pb9E4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040187
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101795-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E10539C444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 04:15:54PM +0530, Umang Chheda wrote:
> 
> 
> On 4/4/2026 1:58 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
> >> Hello Dmitry,
> >>
> >> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
> >>>> Introduce bindings for the monaco-evk-ac IoT board, which is
> >>>> based on the monaco-ac (QCS8300-AC) SoC variant.
> >>>
> >>> If it is a different SoC SKU, should it be reflected in the SoC compat
> >>> strings?
> >>
> >> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
> >> -- All IP blocks and bindings remain identical from S/W PoV, Hence
> >> haven't included the SoC SKU in the SoC compat strings.
> >>
> >> Hope this is okay ? Your view on this ?
> > 
> > You are descibing -AC as the main difference between the kits, but then
> > you say that -AC doesn't bring new software interfaces. What is the
> > difference then between monako-evk and the -ac variant?
> > 
> 
> The major difference between monaco-evk and monaco-ac-evk boards is that
> of power grid. monaco-evk requires 4 PMICs (2x PM8650AU + Maxim MAX20018
> + TI TPS6594) to support higher power requirements of monaco-AA variant
> of SoC which supports upto 40 TOPS of NPU - whereas this board
> "monaco-ac-evk" supports 20 TOPS of NPU and has lesser power
> requirements hence 2 PMICs suffice the power requirements (2x PM8650AU).

Is that the only difference? Is the PCB the same? Should we have a
single common file for those two variants?

> 
> 
> > Also, from the naming point of view, it is monako-ac-evk, not the other
> > way.
> 
> Ack, will change this to "monaco-ac-evk" in the next version.
> 
> Also, should I change DT name "monaco-ac-sku.dts" instead of current
> "monaco-evk-ac-sku" ?

monako-ac-evk.dtsi.

> 
> > 
> >>
> >>>
> >>>>
> >>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> index ca880c105f3b..c76365a89687 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -918,6 +918,7 @@ properties:
> >>>>            - enum:
> >>>>                - arduino,monza
> >>>>                - qcom,monaco-evk
> >>>> +              - qcom,monaco-evk-ac
> >>>>                - qcom,qcs8300-ride
> >>>>            - const: qcom,qcs8300
> >>>>  
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >> Thanks,
> >> Umang
> > 
> 
> Thanks,
> Umang
> 
> 

-- 
With best wishes
Dmitry

