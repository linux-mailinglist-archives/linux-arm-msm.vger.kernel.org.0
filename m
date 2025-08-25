Return-Path: <linux-arm-msm+bounces-70619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E5DB33DD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 13:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE5887A3B66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57282E62A0;
	Mon, 25 Aug 2025 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NnKSb+Ra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BD2E5D3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756120808; cv=none; b=ZfsQ+L6D1i1ayOKPYAG1rtnM3yd+KMKUWQAaR77V1Uv0LwOi/trcQf7/V+2H1q4Ct9QGlKbEqrL7khwoIVw/D/Qmw2qs5emBY+gmWhxcpbGfp/vlSEp0RB4kazUZYLrLivQ/eopU/VxOpavzsd4JuuN6C4UorRuGC0JvYnyoda0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756120808; c=relaxed/simple;
	bh=+rNmARvoUsx81zPl8mnxUC0DlhJt5hdF0XkXtON3tZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea8EDj0GTo+uLaZ1vujAW+DiaqtQ95WSHHlOC84r2/vzj1zAgzR/qQPjUdvNGG2UprYjlgSpkH1eACMTHgLgzie37Y3FryMO9UInflD92Qi8jgeWgwWR+8V82wI2X30ZI+PCJLJ1JBekOk1I5P2VS0/IWyxOLQant5VOFYkpTBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NnKSb+Ra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8dHBW000562
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dJV3jDri6m2VUuuYgSnRwX/Y
	qWPFzt/JBR2NM4x+YUY=; b=NnKSb+RaW7BriKCAgliAf3qLPWIm1DeuC4EqaZFB
	A2YaMP3hWS+JQKhaTkF7WGw+9BtVegMJdtYUuv8/0I5ME53qE7Ll4o1apBKwp0d6
	xqePH2y3MQ5Otf9hsQbfAYUg8GRrYb9NGfW7l9l++dJWCSJUyMBElCHE5pX3NVjz
	kkDA0EwgXb3+5L+qVIiyzCf3r0ps+OkmfnF+oSQVHb0Q6/j1b/Pn3DtHQQMjRZsC
	v86hi6YmApnOmmJOyJpj4Z3v/9b9xWHWHYjNGxyq/FApIpMAfoCwx6QDbWEzWSnz
	BjQXa4bqReUCAnv35XNzjUOlMdTTYTcdaFoSByCupJHfIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cs9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:20:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-325a6573e81so857613a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 04:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756120804; x=1756725604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJV3jDri6m2VUuuYgSnRwX/YqWPFzt/JBR2NM4x+YUY=;
        b=ijKqw9tYSty1633h5XUMuMkE0ngSc4l8oe904khsV/xmggjHrSn61pN26oFO7oQHfG
         zlg/Ztkiv68TutUDhDVwlqhErzDNr7dZ6AAtNQ0PqvhWapfbPgpXJ+EQvM+SWK1fQGfK
         WaJcS7unijc8zpvTpMr1VJD9ZbAbLeQYl+Rx2ZUdToeIdIe0da5hCPquUL9Igt2keRxt
         B/aruBbE+U2vLoGSsEfWeZ4lH/86W2kOvIsdjv/FqouAb3sklXspRVf5XfpHJl+U31ZT
         uKKSgaPEtu+47CvKeLlALrlTSJLlIziNMZm5CHMYdyseBJCTD38Rfo6zaoiFXs6hNkb7
         BXDg==
X-Forwarded-Encrypted: i=1; AJvYcCXhOua99PuE66MIOraCI9n1DfhCK9mCbzQHFYGd+ZAVUyiO2PEPdWJmnYBnnbd+WhsMcfs6O1bQriUUTXuD@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXFyUaeP24V4eSMPuhtqNOWa5ISPbMOvk8n+nwUtWZSGcC4EN
	t7veXWVFBtYQx57yaT+PZSvxQeL4sTh6LxS6Kwk40Iu8L3wHDfJfD+GCa23pbY8pZJvIC6R3hav
	rrUMK30pxCsR5F/5nV0pEVjpVrE+QurFuULscGy9bNa6qcZY/yeS6QmliekodBsSCaPln
X-Gm-Gg: ASbGncvGe+0ATgw2Zd3oFEbfNxBeOpdnM1+RCMZsZYN4wthRJJhIwOrWlkfjgdkBOu4
	9ii1U3+BP93Fj+rQOVj5juJIJLS+E37LUuqs4LGlvHt9UW4MsKzM7bu376N/uqeJG5hU6Fg0dal
	g7tmRT4Q8sMMOsEybKMCtb7ofwqaUEp2AYl8uTyo5w/Z4xemLr1yMOLtS9EfRGzC6kPYEpAttM5
	1/1EBmLb/ejZeuM1UXXWNGkHcZ4VLeVLGqXGhBaSEz53BwFj2TGyWgy+Xge2+k0jtGD9kdc1APn
	YJD0zuz7SZ7V1bMshz/0ctzT4YVgPlXYgG3hRME7phAdpXLURB3a3wH92ctEe3N+P/k=
X-Received: by 2002:a17:90b:2d81:b0:323:7e82:fcc with SMTP id 98e67ed59e1d1-32517b2c440mr12632732a91.36.1756120804085;
        Mon, 25 Aug 2025 04:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFADtCNqrwyF4XQgGgh0eU5gCL1yvEMoXU9chdNpsVuvdTx4h1ybYpVZzRb8aHgMYQChzCWVA==
X-Received: by 2002:a17:90b:2d81:b0:323:7e82:fcc with SMTP id 98e67ed59e1d1-32517b2c440mr12632698a91.36.1756120803496;
        Mon, 25 Aug 2025 04:20:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254af5ed54sm6616168a91.20.2025.08.25.04.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:20:03 -0700 (PDT)
Date: Mon, 25 Aug 2025 16:49:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
 <aKooCFoV3ZYwOMRx@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKooCFoV3ZYwOMRx@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXz1JGePosWjnR
 7V1Zj2Z0nHG3BbfgQKmJ4OJI26lSCv4E4i+vzcdTonxpf00THhQZWzGFdpRjdj7FOaZg200/5f/
 WFIATsNu63vGx8XVROVvsbxfGruuFSch9C40VK3NubbOrZg8VWKVFgXor7AO0eugELyWhmOZNnk
 g91N7ThtXfbVtObVy1KVZ2vqZS0f65FWM1eYIkcCMtSLLSRQSLGjMJ/lCVCwWophlMnisWC3QJK
 XeeOUOjKfGEOCp1p3NwJiDgvOTffCUepV59qT0SKFCJ9TvmRydZA25ct2k/MPd3EknVOVzxIVdf
 ZBoOeWACzH670ulE047otDRAa50oPwVA5s/iGSdcfA5JQh/XBsT5Yoqxx+hhuvTA8qEE4iWqxCn
 5ZPM+1nC
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac46e5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=tj64Tp1_vSzIHxN01GgA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RB7QI6LKnR8KONDulC57zIaEGzTOjc-x
X-Proofpoint-ORIG-GUID: RB7QI6LKnR8KONDulC57zIaEGzTOjc-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Sat, Aug 23, 2025 at 10:43:52PM +0200, Stephan Gerhold wrote:
> On Fri, Aug 22, 2025 at 10:10:30PM +0530, Mukesh Ojha wrote:
> > On Fri, Aug 22, 2025 at 06:26:19PM +0200, Stephan Gerhold wrote:
> > > On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> > > > On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > > > > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > > > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > > > > >>>> +int iris_fw_init(struct iris_core *core)
> > > > > > >>>> +{
> > > > > > >>>> +	struct platform_device_info info;
> > > > > > >>>> +	struct iommu_domain *iommu_dom;
> > > > > > >>>> +	struct platform_device *pdev;
> > > > > > >>>> +	struct device_node *np;
> > > > > > >>>> +	int ret;
> > > > > > >>>> +
> > > > > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > > > > >>>> +	if (!np)
> > > > > > >>>> +		return 0;
> > > > > > >>> You need a dt-bindings change for this as well. This is documented only
> > > > > > >>> for Venus.
> > > > > > >> You are right, wanted to send device tree and binding support separately.
> > > > > > >> But if required, will add with the series in the next version.
> > > > > > >>
> > > > > > > You can send device tree changes separately, but dt-binding changes
> > > > > > > always need to come before the driver changes.
> > > > > > 
> > > > > > Do you mean to update the examples section[1] with the firmware subnode,
> > > > > > something similar to venus schema[2] ?
> > > > > > 
> > > > > 
> > > > > Sorry, I missed the fact that the "video-firmware" subnode is already
> > > > > documented for iris as well through qcom,venus-common.yaml (which is
> > > > > included for qcom,sm8550-iris). I don't think it's strictly required to
> > > > > add every possibility to the examples of the schema, since we'll also
> > > > > have the actual DTBs later to test this part of the schema.
> > > > > 
> > > > > I would recommend to extend the description of the "video-firmware" node
> > > > > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > > > > TrustZone, so the description there doesn't fit for your use case.
> > > > > 
> > > > > I think we will also have to figure out how to handle the old
> > > > > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > > > > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > > > > handles IOMMU from Linux). Simply checking for the presence of the
> > > > > "video-firmware" node is not enough, because that doesn't tell us if the
> > > > > PAS support is present in TZ.
> > > > > 
> > > > > I have been experimenting with a similar patch that copies the "non_tz"
> > > > > code paths from Venus into Iris. We need this to upstream the Iris DT
> > > > > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > > > > which doesn't have functional PAS when running in EL2.
> > > > > 
> > > > > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > > > > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > > > > or directly with the registers. I don't have a device with the new
> > > > > firmware to verify if that works.
> > > > 
> > > > You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> > > > but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> > > > used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> > > > video-firmware's iommu property is also important.
> > > > 
> > > 
> > > Yeah, this sounds good.
> > > 
> > > > > 
> > > > > I'll try to send out my patch soon, so you can better see the context.
> > > > 
> > > > Are you saying that you are going to send patch to support IRIS on
> > > > x1-el2.dtso in non-secure way i.e., non-PAS way.
> > > > 
> > > 
> > > The background is the following: I have a pending patch to add iris to
> > > x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
> > > was to disable &iris in x1-el2.dtso (because the PAS way seems to be
> > > just broken), but then I saw that e.g. sc7180-el2.dtso does have working
> > > Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
> > > code as-is from venus into iris works just fine for x1-el2.dtso, so
> > > disabling &iris in x1-el2.dtso just because the "no_tz" code is
> > > currently missing in iris doesn't sound right.
> > > 
> > > As far as I understand the approach you use in this series does not work
> > > without the TZ changes for older platforms like X1E(?), so adding that
> > > code in iris seems to be the best way to move forward.
> > 
> > Yes, this series has dependency on firmware and will not work for older
> > platforms.
> > 
> > > 
> > > I started working on a patch for this a while ago, it just needs a bit
> > > more cleanup. I'll try to finish it up and post it so we can discuss it
> > > further. I think the IOMMU management in my patch would even work as-is
> > > for you, you would just need to toggle a boolean to use the PAS instead
> > > of accessing the registers directly.
> > 
> > Sounds like a plan.
> > Thanks, please cc me when you send the patches; So, I could test along
> > with my changes and make dependency on it.
> > 
> 
> Krzysztof raised the concern that we shouldn't model the IOMMU specifier
> for the firmware using a "video-firmware" subnode [1], similar to the
> discussion for the "non-pixel" subnode recently [2].
> 
> I mostly finished up the cleanup of my patch, but I don't see any point
> in posting it without an alternative proposal for the dt-bindings. For
> this case, I think a simple property like
> 
> 	firmware-iommus = <&apps_smmu ...>;
> 
> instead of
> 
> 	video-firmware {
> 		iommus = <&apps_smmu ...>;
> 	};
> 
> could perhaps work. (XYZ-iommus isn't standardized at the moment, but I
> think something like XYZ-gpios would make sense in this case. There are
> many other possible approaches as well though.)
> 
> Unfortunately, I won't have enough time in the next weeks to fully
> implement and propose an alternative. I'm assuming you still have
> ongoing work for supporting the "non-pixel" IOMMU, perhaps your new
> approach can be adapted for video-firmware as well?

I believe, non-pixel case a bit different and thats not depends on whether
it is PAS or non-PAS.

However, I liked the idea about introducing something similar to -gpios
for -iommus as could pottentially solves at least this issue. Here, we need
to create a platform device and its domain based on firmware-iommu
property.

So, its required change in device link to put supplier/consumer dependency
and addition of firmware-iommu binding for IRIS and little of changes
over your existing changes.

But I have doubt, whether @Krzysztof would be fine with it ?

> 
> I've pushed my current patch to a branch in case it helps. It's similar
> to yours, but it has no external dependencies except for a fix in iris
> I sent recently ("media: iris: Fix firmware reference leak and unmap
> memory after load" [3]). You could use the non-PAS use case as a basis
> to add the initial implementation in iris independent of this larger
> patch series.

Thanks.

> 
> https://git.codelinaro.org/stephan.gerhold/linux/-/commit/1e068f5864d958ab9e807e6e3772b778cd0edea8.patch
> 
> For the PAS+IOMMU use case, it should be enough to set core->use_tz to
> true, plus any changes needed for the SHM bridge (and maybe resource
> table). The IOMMU management is independent from core->use_tz.
> 
> I'm also happy to add the non-PAS approach later on top of your changes,
> whatever works best for you. :)
> 
> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/r/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/
> [2]: https://lore.kernel.org/r/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/T/
> [3]: https://lore.kernel.org/r/20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org/

-- 
-Mukesh Ojha

