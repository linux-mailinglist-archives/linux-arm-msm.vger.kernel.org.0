Return-Path: <linux-arm-msm+bounces-103826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK2MEQJw5mmBwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:27:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A85432D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 618F230D1D38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38F33A8756;
	Mon, 20 Apr 2026 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5fOjvZM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNpqkQkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE083A7F4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707825; cv=none; b=Nizn3nf8vYL3WSOgm/DTs2m5Th9V6Gc7uVpRbNdFc+TRbIT/660hl1lPa8o6qN8V/sF9NpQA6rlhvtxGemfNY61jyTfJstReHCSPoFkLuJKX+EgYNkzdvhCvUXSisLjjX4qTvy3vhyk0bv8za95v+DqxAIScEDMclPGR1Xu79fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707825; c=relaxed/simple;
	bh=mA0cosl1Y/UKnS5y10aDzdtF+S+d+4NJ48Fw+uJpY+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooEManX11j3TjOEwrPE5pFBC593qCSuLk8DtYLQ8Fnz9t4sqqfb+gufMth0LIZDmhfAUjkLmijOAlrzt/ebW792BO+C+PuCIxYWJi5tBYzRnLV2p0YvuYBQl18gxCAk27Fckrt2pdowBuYTd799ZdQBnYFxbPfqPqziyoTd380Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5fOjvZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNpqkQkf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KGLbOd2980856
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lJedt12Ka/Xa0EGY392YLMx6
	0quQ8TyR8f08LkpHbbs=; b=h5fOjvZM2RiFhmgAgBdxV0HPKW05h/nqXsfQJLUh
	H+EBZDUz4lye5WDJy1bgmO5hZQRuVXOz/BRyIK7cSL7D1qta8SuaBTmtfNn0AZ5e
	6CzIpb8gxAusOI+IU3x1G4VIiZwLw+genz9RODklxmraGfdgkXzKwXcAEXb4wOJ/
	++ChKTkj4USBwG3mOTRj1NlWJ46s5LRQiTyxG1UYRkHlOtQmsc1wAADKTb+B6LPk
	H9hjMNygJ2p1jt1YKBls+krmh4IEnr8dpkc3P3kjRYfe0mVTCjsGbGVVzAG5JVXC
	1OotTtAuTkNHHBiUDDgj0gAkopVrDgy69Il3p0EZC9xf7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2psr4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:57:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so74010801cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707823; x=1777312623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJedt12Ka/Xa0EGY392YLMx60quQ8TyR8f08LkpHbbs=;
        b=eNpqkQkfub7k8LNi76IFwoIpMRpGg4SjU1DXyZevOqNt8aVzesKaYD5wXJr5PewVAI
         3okBpOBMBDgN51K/rq9qYFmthaJdbYyeI8rkbLnUStl7ev737+BXFoWXMUdqIar0UwCn
         /kMBHROxdwhJoKBcub9yp++MIfnbjv0eJ7IuwY0618eFUCxqUXjbDkOtLV1OGAHknV00
         zSWFT+InNk0adiLL8AMb3RgMdwqlu71pMsB0CPQ8+zPzpXrp0m/QOofBpH7afqQ1Nt/X
         cvUPH0ajEc0DMJS5GUcNPBsLwy9FCWJe9hSzGrd71Uuo6mtyD8gr6Ow57TP7/UL6i5tf
         hRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707823; x=1777312623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJedt12Ka/Xa0EGY392YLMx60quQ8TyR8f08LkpHbbs=;
        b=moiULASRZnO2PXiun6G1fj1j1fQCM8Ymmf51oN6T4b5O2n/wk3npV7CYatXyEAGnhv
         wz2ZVrPcoy5UoTnZEJECwJJcPEBUkO48hOaOgT1n3jB8nMsIEp1LaoKpZKnYqZWYAweI
         kmpADHZSTJAOtsHYU/IiQccND08380osX3MBrI/kz1Jxr2WreeI9v8e8SYIYZAQbRvX9
         zN3tB64X99EuAGi5MLK+fn/VVukoot7EMebCNfi6U939FJyTSgCyxVLTzaQ75iTLoiYA
         no7apFbo7qn7paCFcjT8rPPMNWBzMZyz2ILnBLndTP1gmwMSPtlgylqeo6ZQFt/MKP7m
         VEwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+otSZG5iAPfWcR/QYrhz0ATVTRhEeqSvXj5dc1hpNfDWJPWC58YXALqifCo2wMfahWqzoAO5i29LaHWw6J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CUKzYknJKpxx2mhozni6DI3UP0JZkBaFClWpDxQcVS+s+Wn6
	OxH0OqnoE7ry8AVAU8mdajzIEM58maduf1t/XTge6ECXcigPdvqKboYyaTbXqLtNtyifrt8OwKp
	kKdQHLpC7jJOe4X4G87NE1MHW+72MhmpmzOnAjTqMDNTjvs79zIcChRdaDLaBUi5hy7tf
X-Gm-Gg: AeBDiespirtgF1dLBOuR8LSdRYEU+YCjX8rjSZlQu4zTyK6c5zKLdx3Va/O7i9qQgg0
	D0myPLw+70KZy48t3QjrlFVyajNHcRVXJAI51Wd1Bkbq3lHJTEyRXdNOi+JQapjckHfhi44vNq4
	onfHQ/kmUAHkgxCcRgMO3veV5iXkOcV8nSFI9CzziFgJKxM3r64KbXxtuHAk7JZUKffsZayX0ki
	y97RBYbSWS4uV2uDMgIXMg8c8lwKXSN5zpBrgsHHBAmmDmZM8VdEF8c25jCRkyMnXYYNzwsGK0a
	6ZmsiDV6ZleTLCeGck5oq1HUV89WSWgno8gGXKOxyB+2k1qSQ9biv2ChkfobfaGFBh3pvOZ5qks
	db8/v3raMVnqShhdnd6Vrudp7dMDTj3H2cl0N/ajIbHqB7phwLKSvO8O5YjrkJammUksy5qTehH
	EXNf3k0E0gPYvHLXVFo/p9MnV2tWpdUPdZ0A5u8xTXSr5y7g==
X-Received: by 2002:a05:622a:a64c:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-50e5fe290c0mr48699781cf.12.1776707822369;
        Mon, 20 Apr 2026 10:57:02 -0700 (PDT)
X-Received: by 2002:a05:622a:a64c:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-50e5fe290c0mr48699181cf.12.1776707821844;
        Mon, 20 Apr 2026 10:57:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187eb5f1sm3049040e87.72.2026.04.20.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:57:00 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:56:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
Message-ID: <cucl4m3h2wkosvzuyxdwyjec3v5n6vpa5g3osvo5y4farpewtn@jw6kzf3f3eyj>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
 <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
 <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
 <bab7f899-dc05-7c9d-aed5-fed1910aa32b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab7f899-dc05-7c9d-aed5-fed1910aa32b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Jb5elXIFUt5fH0sLUa4rdOJRKuwthkjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NCBTYWx0ZWRfX/cQHVvaZsQV+
 MtypCoq5k70Kq98Bgx+uHW+4cjPjB8Cu+HLBtNJR0t7n6RO/wgSHhizdMdkpuUH/ZE+ZUoAklmv
 jYNYMmfOATbIzx2UDxyN+eX0cqCuooCyoVMSN5Qqw2VwW4E7BKXq93I+E315cSR/XnYV/8HjNGI
 Wrhk22Sg2O9ztHgqc2j3j7UxHqA/OVoURmTbff4xCGB4g2K/sJ/A1IZOwQ1Mk3gebqn/QDLWTiX
 x6VQZbvP6lStIjzssiFhdbzcQNkweVv1QeH3L4E4zs0qMX7Sgo3ltEfQjqDrHRY03JuxwuOCEVw
 HPnk+dG+eR9GRBk3p+w9Pb0RyIYFdGTdGfQn+U4nSp9w82/FPbrYRuBbdEvtWPgjLEgbKLClbRR
 8Jv3LOJ4hNex+9Ym7SLyBMVCXzZ+YwUaTf9XbFocubV/Mscg+AegURG3WRVXWKy99tz41wV4shO
 uRx7HLV6PatOWNpPYGQ==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e668ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XurYlQOUMRzH-DkKxKYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Jb5elXIFUt5fH0sLUa4rdOJRKuwthkjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200174
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103826-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42A85432D1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 07:33:01PM +0530, Vishnu Reddy wrote:
> 
> On 4/17/2026 11:53 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 17, 2026 at 08:49:44PM +0530, Vishnu Reddy wrote:
> >> On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
> >>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> >>>>
> >>>> Add a helper function to allocate and register context bank (CB) device
> >>>> on the iris vpu bus. The function ID associated with the CB is specified
> >>>> from the platform data, allowing the bus dma_configure callback to apply
> >>>> correct stream ID mapping when device is registered.
> >>>>
> >>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> >>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> >>>> ---
> >>>>   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
> >>>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
> >>>>   2 files changed, 34 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> >>>> index 773f6548370a..a25e0f2e9d26 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> >>>> @@ -6,6 +6,7 @@
> >>>>   #include <linux/clk.h>
> >>>>   #include <linux/devfreq.h>
> >>>>   #include <linux/interconnect.h>
> >>>> +#include <linux/iris_vpu_bus.h>
> >>>>   #include <linux/pm_domain.h>
> >>>>   #include <linux/pm_opp.h>
> >>>>   #include <linux/pm_runtime.h>
> >>>> @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
> >>>>   	return 0;
> >>>>   }
> >>>> +
> >>>> +static void iris_release_cb_dev(struct device *dev)
> >>>> +{
> >>>> +	kfree(dev);
> >>>> +}
> >>>> +
> >>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
> >>> Please move into the bus code and make it generic enough.
> >> Do you suggest to add a wrapper to pass the varying inputs to the generic
> >> bus, something like this
> >> struct device* create_and_register_device(dma_mask, parent_dev, *release,
> >> dev_name,...)
> > Definitely not the release function. The devname is also not that
> > important. The rest, yes, you are correct.
> >
> >>>> +{
> >>>> +	struct device *dev;
> >>>> +	int ret;
> >>>> +
> >>>> +	dev = kzalloc_obj(*dev);
> >>>> +	if (!dev)
> >>>> +		return ERR_PTR(-ENOMEM);
> >>>> +
> >>>> +	dev->release = iris_release_cb_dev;
> >>>> +	dev->bus = &iris_vpu_bus_type;
> >>>> +	dev->parent = core->dev;
> >>>> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
> >>>> +	dev->dma_mask = &dev->coherent_dma_mask;
> >>> Would you also need to set the of_node? See
> >>> device_set_of_node_from_dev()
> >> It might be needed for FastRPC as they are following sub node approach, Iris
> >> does not need.
> > Wouldn't it save you from passing it to of_dma_configure_id()?
> Iris will pass parent device of_node, setting parent device is enough.

Set the of node and pass NULL to of_dma_configure_id.

> >>>> +
> >>>> +	dev_set_name(dev, "%s", name);
> >>>> +	dev_set_drvdata(dev, (void *)f_id);
> >>>> +
> >>>> +	ret = device_register(dev);
> >>>> +	if (ret) {
> >>>> +		put_device(dev);
> >>>> +		return ERR_PTR(ret);
> >>>> +	}
> >>>> +
> >>>> +	return dev;
> >>>> +}
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> >>>> index 6bfbd2dc6db0..4a494627ff23 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> >>>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
> >>>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
> >>>>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
> >>>>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> >>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
> >>>>   #endif
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>

-- 
With best wishes
Dmitry

