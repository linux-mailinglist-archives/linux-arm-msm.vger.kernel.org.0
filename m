Return-Path: <linux-arm-msm+bounces-107020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EiOJpmGAmo6uAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:47:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF065186A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16DD03021B9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 01:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CE4287263;
	Tue, 12 May 2026 01:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbZH52Ol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHUa9HgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1822727E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550356; cv=none; b=uO/57BhfyNv6ZbOq9dzoHSlEutxBeR3s4MIZPD7WRHTDr8Tnzd7CDsVBglt4qPc+3+pkvk9zXfW7W2uhb9AmNyjjiZaxIj+tW8xwhEJmq+Qu6DtvI8aWiWNnsb9qKzBmEh+HcfZnHsUp478+XZQSCSObfHXiaAaNosrlNZ0s72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550356; c=relaxed/simple;
	bh=EGwYs3uxWmiuX2P9hc3JzoakE+4VNaxiFov98bezDWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNgdxt37xuuhTc+ZishPi82X8lahQGeYZqNUMwwDV8eY1oM59mnFUlPTpJ9ImbkYc3rmhanuO+HptS8LKMxsaf+tMZ0WmEAbF59D7njEWF3Dn8/880UeMZuIs9WF3IzAMh8pgvHVmsafQnLVHt0K5nYEk0i7XF6wzuVLyiu+G9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbZH52Ol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHUa9HgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6g3n2573888
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=86CLsY4gsC4LyAhbA+uNVsUq
	sZIwxx30YjSMLBlvqCs=; b=hbZH52Ol8D1g5FUsxLbw+rXfPV8p9gFHn4/8W1iL
	IjSJKWtNw2Z7FMc2UJgIgCz8e3RSbl4FvlIbZOP6sADL/u7gUp4DuckgOuos5jL9
	PbgHhGfxY24Wg0EmpDVd4O85Mf1Vd9vmcpWco7mr/HeJtntSUnhGhDfSsVDNzScS
	kP5+qzpFJekTcVb3O8ZbrMbfcxEOQjiSr8SyFuOURab6LNy/kwHNsNsOpvE89owN
	D+PRGKR/afaOTzDunUZzGo22BqFYzUzP+L1hhAtbIUahxCpu1QPAHxhZexwYBNoN
	qt40RmhUvmYNYHkfYwMgk5d8teV79+4Dz9GKDzqtvW5I/A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28xw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:45:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so8024645eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 18:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778550352; x=1779155152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86CLsY4gsC4LyAhbA+uNVsUqsZIwxx30YjSMLBlvqCs=;
        b=ZHUa9HgZLgvicMGYjlCY6cRC3XtIIAFZAEpc1e6LXpFgJJZ6wf9de3bH25+VK6rcgp
         7r68/xOHEGDYtWo05ldwkUbRIvjbz8XetB92ROe/oWPmmv5CFwxGbaw+6uozkeKAayeB
         nb8+nUkADJYYbKLOAmaN+qWzkCoHVRH7Q9e/tQirCGLvjbM1ymUF07wRyBBpGNm0fBd3
         OrEGlSuYXFTcGoOI7Xd9EFV/syZ9RlMhscFC8HnsZVNb9H8iwQCX0egPpao2bt9yKgpg
         3jnyy04Y0VrLJ17B3Pr/5lX6/WOXBWPdgEH8odVsRoEKPkKjfgv/aJkPFcqgRwsMDVAk
         v54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550352; x=1779155152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86CLsY4gsC4LyAhbA+uNVsUqsZIwxx30YjSMLBlvqCs=;
        b=IXk88wWKS0yEP/+K5BJNPS3AZ8rV9/xkakMgYJOwjF+rXlSP7KAHJ7ti3LeqjsIFqd
         NemMK7WbHje11U8O92wwrBq+hHZtnMdvz97vBWM0THQgE7q4eJ9/XokIWTVlyNBJ3ww8
         uXTmN7b3z037I9vlcku4INE5VVxCAdCHG8mqtkCrhqB+8Bup2ZZAkFmcIBPIUDWKIoUn
         kRoJ42jBncT71korIqp8eAKQr19Ja34G/9m+ToJfqLrKjADOtxsGe+i/JyF8wnourMrO
         RwV1FhcBSorWqw2NWDay+ePk4Uav7UaO4IjbbiHm22e97iAt+4oo7SWnusQ9oQc1YFP3
         Lapg==
X-Forwarded-Encrypted: i=1; AFNElJ86b5vHhSsO8LrqGnmsGw8yV8txXry8Io/3W4x7yYh5MNpj24cCTQIfXmirSrGiJsQax1jTOkFiNFsqLsQr@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVzlPO8CIVpHFumtdWfClbfGNE0B1G98cDhAHmPGdLgZEpkkx
	8rGAEyaoPFNNR9TTuVM1zH5ovPUBwcRmO70AfjR/KXf6wWckHwEQtobVxj2a23UbIBwJkXEVlhO
	sqmSFXDX20eKTM7+Fh8cFLdfC7jMATAN3m8gfuxo7aKrmDzBr8eCbjNPDMoIs4+52Ft/V
X-Gm-Gg: Acq92OHeUd2j8bR3BH48NbZm0en8HoxnEW/HrdHSHTWIPcAFTKB3glZ3ECFSLex/KDw
	UjWLK16UJVool1pgkwen6HlIz4o6rsJPowgjA0XsNtC5nOx3UoESymJl9XsWSmwpVudkAWFVxud
	HqLwizqXeDcbJvhq0PByTrmAMw9L/pav1yNI6TWTMcgJ/K0cplDdAn8GxhqpbDkm1dRLTeY8LR9
	ljXwZnm1umJ2GtmCEv3+vIaqjGIWnzHSpxqybG0k2RvEIgNP1+hK+JhF362vYQ1SWPp96Nqv97L
	PupNoi61FclDHrKWWoBGQ0H6CvE9LxAcKIHbWqRquakWHTbEdzh8QhAhrGGZNtyo67yP5W3Hdmv
	hj8piGB28jjz5bMF6UhYiQnPGGocm8snoukAo94xJa2Hy5aa7lJN+AQl9jPjNsQsc
X-Received: by 2002:a05:7301:3f16:b0:2d9:a799:3c4f with SMTP id 5a478bee46e88-2f54de847bdmr11298699eec.24.1778550352431;
        Mon, 11 May 2026 18:45:52 -0700 (PDT)
X-Received: by 2002:a05:7301:3f16:b0:2d9:a799:3c4f with SMTP id 5a478bee46e88-2f54de847bdmr11298673eec.24.1778550351792;
        Mon, 11 May 2026 18:45:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15818678eec.28.2026.05.11.18.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:51 -0700 (PDT)
Date: Tue, 12 May 2026 09:45:45 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <agKGSaODUsI2Vj0A@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
 <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
 <agJ-Qc71PloUM1pI@baldur>
 <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a028651 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_hPhRlXgVbPNB2WBm9QA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: B5XBeR83hX1Hgc2wzYZkAbCmsJ8JJZO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxNSBTYWx0ZWRfX8/C9hyF0KNn0
 g2qyFs8y2BDhVOsWVfqUZfq3pbRJBc6/2sOHO1rNTsc2ApaqKDnPHAcyWJm8+D7Y7mkMLlymmJW
 1oEAwnBh+uxNwRDv8iNTZINlc9E+jrQDxjbIm3RFLW96tPrCy84QY18Bc/81Zdl6y+Grhcu21zF
 Fsd34NENN/wTfVOt8Lz3fGfEs6fSVgNT6qvc47IBTjIpc5N7JbQlBq89PAEamCMbwEQY0Wfj9nQ
 KftMucH/fyNK9QmXpcrPD+FZx1DZ7Y5GX3ALe6rqTUlcBmkLVa6PJL/BItmNNrVntWh+IRMduur
 XkEJe9rDQcob89is5TJZ3AojA4f7xX2VFikdM43cGpEKefdYy3Nvw5sV8pi0rqX/nlXTPcicanC
 vOAOzMOHAc1yC25N7ZOEbjuyhwe+u4exR0cKbc++hzPBzMkvB1j7e7R/T2IxZG4msSM4F09lndC
 6WT0lyUIHUAZEQUp+kA==
X-Proofpoint-ORIG-GUID: B5XBeR83hX1Hgc2wzYZkAbCmsJ8JJZO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120015
X-Rspamd-Queue-Id: 3DF065186A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107020-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 09:24:19AM +0800, Shawn Guo wrote:
> On Mon, May 11, 2026 at 08:12:01PM -0500, Bjorn Andersson wrote:
> > On Tue, Apr 28, 2026 at 09:09:25PM +0800, Shawn Guo wrote:
> > > On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> > > > On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > > > > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> > > ...
> > > > >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > [..]
> > > > >> +			compatible = "qcom,oryon-1-5";
> > > > > 
> > > > > I asked you to send this binding WITH the user, because they go via
> > > > > the same tree. I see the user, but no binding for it in the patchset.
> > > > 
> > > > And few others like SCM are also missing. I am talking about this many
> > > > times already, to multiple vendors, and I am still surprised why people
> > > > on purpose give more work to the maintainer. Well, not my tree, so not
> > > > my work, but if you ever wonder why your patches are not applied for
> > > > longer time, that could be one of the reasons.
> > > 
> > > Yes, I should have sent all those bindings targeting Bjorn as part of
> > > this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
> > > change is one of them, as I'm sending it to Rob.
> > > 
> > 
> > Not sure if you have settled this by now, but I can merge such binding
> > change together with the dts change.
> 
> Thank you for the offering, Bjorn!
> 
> I will include it into dts series if Rob hasn't picked it up when v2
> of dts is ready for posting.

I'm currently targeting PDC binding to Rob. Is that something you can
merge together with dts as well?

Shawn

[1] https://lore.kernel.org/all/20260504080703.825328-1-shengchao.guo@oss.qualcomm.com/

