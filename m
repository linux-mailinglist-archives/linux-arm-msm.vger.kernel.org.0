Return-Path: <linux-arm-msm+bounces-75482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E0BA8399
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 09:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8AC16CB2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC35224E4A8;
	Mon, 29 Sep 2025 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ky+uyrbM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CEC1F473A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759130368; cv=none; b=a/yASjSLIKdoGwASRUJt8Z9GIHXWRViLcAaxyiI5vJrZAtnIocuuMcNv1Fv4HdHfWViKP6zCsisJQqPIpWHFDD5J1Uochm0wIOBOgEM5oNUmnzivvA+qoUFRRmJ4YWPhmbAB19WhNxloCZLI3kgqDh3NJ1TwtlBgUmea/TadfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759130368; c=relaxed/simple;
	bh=hWIiOcH3VdD7qroNQXh/OJhR4oNG9TxogCH27d2aBqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tx7c4FGvtd165UhVWjQrdgdF508LsfJADiOGVosHpBYN7vL8ZJOlhGrj761N3HGMDP5/YsxQQl5Nw4Lc/bJtFHwXmiZL5qhFvbF77U1XpjaLn7+pja/0W4lWkorW1BICxIelNp5nrIJk8EQyCpqThvSLlZ/h/io9UCoVWcG95DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ky+uyrbM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMJr6L007833
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k75GtpNwD97Ivistr6WXWkVRDkxGpMIpzSWhHUoptlY=; b=ky+uyrbM7lBee+nl
	r2+cXQl/Gurj9wuNNs+9j9saqvHC5OCmVYmy6EH+sFwclEHtLjrjEbTQ8n/Ib33n
	F1j2axh2QMvqEg0qgJ5m66UA3tkryNVIxEdjl99kxMU4LY6en07svwj0a5y4vUvb
	DYC4Tsgizk1cK/NEr4RX3RBHGhMXWJmjfvT/YBMGDFZr1esk1Tj5s301u7+RAsJI
	rSzDygJt4HAcfwAc9zCrpdt9qeXT0EMcGXrSxgNs6Jy6aa9ZIgBYDeuIJ0ZXQLwR
	s5wESCF9+rRus8A0jctYrongf+P5SpLNwjaatvTluiuwAhe3zq//H14tvRagZeR3
	hXFiUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdc205-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:19:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e1f265b8b5so4888811cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 00:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759130364; x=1759735164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k75GtpNwD97Ivistr6WXWkVRDkxGpMIpzSWhHUoptlY=;
        b=LWzsOnqHrVU2NsPMeGB3iDnHJ/tZwk1u2t0RDrAPGtR5BxEjJpWdYNgt2GkvsVzakg
         /kcurNV+sAMASwTQeE/a/jmQHuYUWjLkIaJ6KchVJMx8xypnxyIWm0wbJgiTnXNArEEj
         b44guVP8jNmtu6Yv6XVjZ2mMIgA8aVW090u5juxd3b/RQE5fSks6PZyjeKwdpXZ22WxF
         /6/dLSzn+9PCzLIq2dTiSnXI08Ua15Z9SnD2630oOLQ+EkobhZ+6npHOAjWFPX0Tncpx
         vSTPFlYoREPE/AqHDrr5srlwfRJnnAFck1n61pVHXtSueH2UHSL+lhu4Fc2UD/y9aOt5
         kWzg==
X-Forwarded-Encrypted: i=1; AJvYcCXbNjkcSfcrOfavvJSmDWf7erN00kvQFgsxOeSVn74tKjn16jw+jW+aFqHPuAPhFS0LAmHCA9ZOeSP9T9jU@vger.kernel.org
X-Gm-Message-State: AOJu0YyFf4DPzPeS6e2vKjYSPXbBcgiLTk1rBCyx3v6Ibq3IBaR4g7Cl
	qaGtFl5AbXw19i9zap87g4THZOnkI3I03mTPasPZt1K80uGossgDV6Lkkq+9B5BGcBS4V78bo+v
	MssJLSPK+zUz4bphqoMRz2B7RI7Q7p42oAk9syU3/pf4gWzVF/akKivwj9ZG3G+7wESdW
X-Gm-Gg: ASbGncu/FXmcG/qeBtxJ4stRuPdguHuTG0UPHzGelkVHl2AHVohbAd9EMBgLi59HNWD
	axYrDGwKdcMAocG1/SejG/L4KlKtRk4JaU3Pcs04K7CILO9TQRCAm+pfvDVpSObrm23ZJj0e4Is
	e/n9ip9F7UkB23dxTVabpgXsMrVDrcPWpV9vgU9m8r+Eu4ZNwI0Ttmod5NSZY/2HYoQp4oPJI85
	PyX/n6wN3ml8apf/hrYbqsLaUJXGp/NRdi2mSuZTQHNgTVmvKtm75wP5KsApqy5ORXF/5Zpolyb
	LfS6S2vINzcXVk4W4T24jcKEV/hjYoyZXEZi0FM2VyRh68pWGb905bmgH433dwPU1dUiMBKqEpF
	Gb2aSulq+P3XDz/IgfbILTn/vNy+K4VDQ0yF/gk73/CxIMCF4slRU
X-Received: by 2002:a05:622a:507:b0:4c9:8146:a90b with SMTP id d75a77b69052e-4da4b428c5cmr198656131cf.41.1759130364251;
        Mon, 29 Sep 2025 00:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIzeHSxtnK8qC9VJKye35wHGoHLT9vzKkem4tJ8rZa+jNlF6dO+3ePtHV/9kz2PB0lv3zMGA==
X-Received: by 2002:a05:622a:507:b0:4c9:8146:a90b with SMTP id d75a77b69052e-4da4b428c5cmr198655861cf.41.1759130363641;
        Mon, 29 Sep 2025 00:19:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58671254012sm1439429e87.62.2025.09.29.00.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 00:19:22 -0700 (PDT)
Date: Mon, 29 Sep 2025 10:19:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
Message-ID: <q2rfyb2zrx55w632xjudhxs5w7bp3d4gmioav3iy4v32a3m6mj@fct2jalftvmb>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
 <20250925213151.GA2455023-robh@kernel.org>
 <c13b94ed-a240-4a32-9f11-f0e323197500@oss.qualcomm.com>
 <CAL_JsqLCLy0JxPtbg5sbXux-o8aQi3a8EOs0c=VEJCePew72nw@mail.gmail.com>
 <ad56ec86-0374-46d0-9962-90519fe878fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad56ec86-0374-46d0-9962-90519fe878fc@oss.qualcomm.com>
X-Proofpoint-GUID: OgpH5pg0TkhacM4KJEinibZTc1y1o7xo
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68da32fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BhyvDIzQExNxkBz7yboA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OgpH5pg0TkhacM4KJEinibZTc1y1o7xo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX5BOPJeQXsP1f
 nsr7Km6cxvThwUFDCpVzAkKKXAQUYjwI/c0hIsk9rvEhR1pVmfa8ukaRduhgwpz0ES1y9uY5uOu
 qSlOYi2vVMjY6G2O9Iw/NIhOcmgwP52dlYgUyBIpt2Z/Ggc254ougUAbvvGOIsoaUBI/sAT2cCB
 yxJR4bvwIsW04lULrXewjMQXRaX0UdKlmNko9Ihu2UjkRzf1y0kK7zhKvSvQTUYtZeQbqrOC3z/
 GBBZtX8qvW+N78qkDl479vftaoMNlhtbL+7V4ku2LXybfQjDQERQbSNCf52VktuTxL6/dSkIIF4
 eesoQJZYN4iX9XhVim77TAt/tohdIZSoFCjt7sexQF4Pq2m/rc0WS/ebTR/cmb87Kx2Q1JOM2Tl
 M4+7jjcd01JornuXoqRvq8QuKZG3ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Mon, Sep 29, 2025 at 02:06:28PM +0800, Aiqun(Maria) Yu wrote:
> On 9/26/2025 10:47 PM, Rob Herring wrote:
> > On Fri, Sep 26, 2025 at 8:21 AM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 9/25/25 11:31 PM, Rob Herring wrote:
> >>> On Thu, Sep 25, 2025 at 08:57:56AM -0500, Bjorn Andersson wrote:
> >>>> On Thu, Sep 25, 2025 at 10:50:10AM +0900, Krzysztof Kozłowski wrote:
> >>>>> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>>>>>
> >>>>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
> >>>>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> >>>>>> (rev. v8) and M31 eUSB2 PHY.
> >>>>>>
> >>>>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
> >>>>>>  1 file changed, 155 insertions(+)
> >>>>>>
> >>>>>
> >>>>>
> >>>>> Second try, without HTML:
> >>>>>
> >>>>> I really don't understand why you created such huge patchset.
> >>>>
> >>>> Because I looked at the logical changes that went into the big squash
> >>>> that was initially planned, and requested that some of those was kept
> >>>> intact - because they where independent logical changes.
> >>>>
> >>>>> Year
> >>>>> ago, two years ago, we were discussing it already and explained that's
> >>>>> just inflating the patchset without reason.
> >>>>>
> >>>>
> >>>> We used to add things node by node and that was indeed not
> >>>> comprehensible. Overall this adds features in large logical chunks, but
> >>>> there are a few of the patches that could have been squashed.
> >>>>
> >>>>> New Soc is one logical change. Maybe two. Not 18!
> >>>>
> >>>> I can see your argument for one patch to introduce the soc. But two
> >>>> doesn't make sense, because that incremental patch is going to be the
> >>>> kitchen sink.
> >>>>
> >>>>>
> >>>>> Not one patch per node or feature.
> >>>>>
> >>>>
> >>>> Definitely agree that we don't want one patch for every tiny block!
> >>>>
> >>>>> This hides big picture, makes difficult to review everything,
> >>>>> difficult to test.
> >>>>
> >>>> The big picture is already obscured due to the size of the content
> >>>> added.
> >>>>
> >>>> Comparing to previous targets, I see the baseline content in 2-3
> >>>> patches, and the remainder of the series being things that usually has
> >>>> been scattered in many more small changes in the following weeks or
> >>>> months.
> >>>>
> >>>> There's plenty of features in this series that are yet to be concluded
> >>>> for SM8750.
> >>>>
> >>>>> Your patch count for LWN stats doesn't matter to
> >>>>> us.
> >>>>
> >>>> I agree with this. That's why the QRD is 1 patch, and MTP is 4 (this I
> >>>> think should be squashed to 2) - compared to 13 patches for across the
> >>>> pair for SM8750 with less scope.
> >>>>
> >>>>>
> >>>>> NAK and I'm really disappointed I have to repeat the same review .
> >>>>
> >>>> I'm not sure what you're disappointed in, this initial series is larger
> >>>> than any we've seen before. I really like the work Jingyi has done here,
> >>>> aggregating the otherwise scattered patches into one series.
> >>>
> >>> The QCom folks can review all this first because I don't care to review
> >>> the 50+ binding (just bindings!) patches sent all at once right before
> >>> the merge window.
> >>
> >> Unfortunately this is sort of beyond our control. We don't expect you to
> >> review or apply these patches immediately.
> > 
> > It is *only* in your (QCom) control. I would love to have control over
> > receiving patches to review, but sadly I do not.
> > 
> > Then you should mark them RFC at least if you know they are going into 6.18.
> 
> We can take your advice for "RFC" for next situation for this.
> 
> It would be ideal if most of these patches could make it into the 6.18
> release—that is, get accepted before the merge window opens—since the
> 6.18 kernel is a very important version for us.

Most of the branches related to 6.18 tree should be already closed (and
were almost closed for the last week or two, depending on the
subsystem). 6.17 was released several hours ago, which means we are now
in the merge window towards 6.18.

> 
> While, we fully respect the reviewers' perspective if some patches are
> not yet clean or ready. In such cases, we’re prepared to put in
> additional effort on our side, including backporting as needed.

I'm not sure what do you mean here.

> 
> > 
> >> The platform announcement just happened to occur at this and not any other
> >> time, and we can't just ask the entire company to shift it to better
> >> accommodate the kernel release cycle..
> > 
> > That's exactly what we expect. Companies following the rules or
> > preferences of the kernel community is exactly what is expected and
> > required. Companies that continuously fail to do that result in
> > requirements that all patches be first signed off by trusted kernel
> > developers in those companies.
> From my understanding, the community is intended to be open to all
> developers—whether they contribute individually or through a company.
> Imposing a strict "Signed-off-by" requirement risks excluding developers
> who actively participate in this community effort.
> We still strongly encourage broader participation from both individual
> contributors and company-affiliated developers to foster a more open and
> inclusive environment.
> 
> That said, I do agree that companies should aim to conduct thorough
> internal reviews to reduce the burden on upstream maintainers and
> reviewers. For large patch sets, perhaps we can consider using
> "Reviewed-by" from trusted kernel developers within the company.
> 
> In fact, we did perform internal reviews before posting the Kaanapali
> patches. However, we also respect the community rule that "Reviewed-by"
> should only be added based on public review within the community.
> 
> Lastly, the principle of "upstream first" and submitting patches as
> early as possible remains a key guideline in the current kernel
> development process.
> 
> > 
> > What would you have done if the timing hit in the merge window where
> > you have trees which have policies of don't send new content during
> > merge windows? Just going to ignore that?
> > 
> 
> If some of the patches aren’t clean enough for the current review cycle
> and the merge window has just opened, would it be appropriate to resend
> them after the merge window closes—perhaps after October 12th?>

No need to, most of the patches will be reviewed. But the ship for 6.18
has already sailed. 6.19 is the earliest merge target.

> >> We do have an interest in sharing the work at the earliest time possible,
> >> and with all the legal knots included, this is what it came down to.
> >>
> >> I (and many others) made an internal push to upstream any pre-requisite
> >> patches that we didn't need to disclose any platform details for in
> >> advance, so this patchbomb is actually somewhat reduced.. but of course
> >> DT and bindings are the main course size-wise and we simply couldn't do
> >> it earlier.
> >>
> >> Give or take 80% of the bindings will be "boring", i.e. "add compatbile"
> >> or "add compatible and adjust clocks" because our hw is rather
> >> standardized and the interesting changes often happen at a level beyond
> >> bindings
> >>
> >>> One comment on commit messages though. Please explain how the h/w block
> >>> is or isn't compatible with some existing platforms. Many just state the
> >>> obvious "add a compatible" or such. I've yet to find what kaanapali is
> >>> in relation to any other QCom chip. It may be the next SoC for the smart
> >>> toaster market for all I know.
> >>
> >> Perhaps this would be useful to have in bindings commit messages, but
> >> the cover letter of >this< series states that Kaanapali is the newly
> >> announced Snapdragon 8 Elite Gen 5.
> > 
> > Patches should stand on their own. I'm talking about patches in other series.
> 
> We can add the soc introduction information to the each patches series's
> change log and resend after merge window October 12th. Like:
> Kaanapali is the newly announced Snapdragon 8 Elite Gen 5, and here is
> the document link for reference [1]:
> [1]https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Note, you have been asked to explain the details regarding IP block
compatibility, rather than just marketing details regarding the
platform. A proper commit message might say something like 'Block foo on
Kaapanali is compatible with the same block on the MSM8960, use
qcom,msm8960-foo as a fallback compatible string'. Or 'Block foo on
Kaanapali has different register stride between ADC channels, as such it
requires a new compatible string'.

> 
> > 
> >> The product page states at the very bottom of the spec sheet that
> >> SM8850 is another name for it (although the shift to codenames
> >> happened precisely to disconnect from specific SKU numbers,
> >> because e.g. both SA8775P and QCS9100 are 'lemans' silicon)
> > 
> > Sorry, I'm not going to go read your product pages...
> 
> 
> Feel free to let me know whether the above suggested updated statements
> in the patch change log address your comments.>

2c from my side: please work on declaring the _actual_ dependencies for
the series (as in 'patches in the series won't even build without
changes a, b, c). Use b4 --edit-deps to declare those dependencies.
Remove unnecessary dependencies between DT bindings (by using ephemeral
nodes instead of actual platform indices). Drop long lists of
pseudo-dependencies from cover letters. They do more harm than help.
Work with Bjorn and Konrad on how to better structure the DT patches.
Make sure that all your commit messages describe the _reason_ for the
change rather than the patch contents.

> > Rob
> -- 
> Thx and BRs,
> Aiqun(Maria) Yu

-- 
With best wishes
Dmitry

