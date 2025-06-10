Return-Path: <linux-arm-msm+bounces-60829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63597AD3B87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BB9C3A8495
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619A91A8419;
	Tue, 10 Jun 2025 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9JoBqre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751B1D9663
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566675; cv=none; b=jHyPcLQGndf9+w81itrDSau7cEc3fTJ8DbthcmoHFIpcFlBC5Acwp48E2qWawRQtSbeuNZfwxNlYDW3hoglw9LQUs/qjndrZn7PLeCVOBjL+o1K1w1wPuvmdwPQDxXYyukZCuSaAC7DDNlINk6fw8tFOUIfRzX2WGWJ1O4Jljvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566675; c=relaxed/simple;
	bh=ElggMui8jF9y9EX7wOkS1Ek+i49TcttuLUv2qYZX3dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/NT5Tf/DNfiM+q/L3NLJNoTWV1nOSOQj/J/6LcEzTCvBe2mFySDtlCirbT2aBFt5YwFd5RUhnzLVncVzaCksdn50kql1nqGPOUJ65gbkYPT6TpiVICp2MF5tT/tRJoLAXxEwIVgkRxeNSVihJMY2GDT8DTGZUdsrgTqO7PUFnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9JoBqre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8FIqK015384
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dmArcDtz/VBFaWXVD5inOnUO
	fF68N2U1yWnQMvw/igY=; b=I9JoBqreDfv3bobmrQgTMwMhEXziUQaiTUvUnSIl
	t4Hlow89ONddw7ZgbwQ3QghY2Ajdznv2pigh3V/qeMmbOV7BWgoX7yHH/cqU7lYx
	iqwOgbRh97BI52b/drn55ku7KA+IvVmo8QJBthvseeBt3Paqv4mlhQYNqJvVK60X
	WcVyzu9KEb0VPiVbftYITr9klv8oFDkPD79ENXpGaUj4a2HqfvpRcPIJBiteaIA/
	Yleuc2J8Yq7458Hs0mv44KpAUY7jtVhk9wPptGvljq1aG70Yi/1R8uzWBq95IWel
	dnVNWIW63lg4kWNYXhHOWtcIZbPifeDYXXpPoXnWXeQSeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv9rg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:44:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fafc9f3e1bso76502156d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566670; x=1750171470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmArcDtz/VBFaWXVD5inOnUOfF68N2U1yWnQMvw/igY=;
        b=wkiSleS87GF0ANxjjzh5jqNE9jEXtjRw6WPXwUH+F80Edt9zJKTN/FYWs3iYSKPy1R
         PF9H62JHqBsfu90qGWwEf30cPOgBtLLYuvk9TVFhYHGYU8hk23WNiiLBUpToccaUwWZt
         btCKkxSkk1bIXt+n44o7g3IvIH/EiVJ1Rng6kyHbIKlcXlptoTc31pzzcBswiolxzit/
         B5licp+t6v2oeubZucj+HiqR2zTCwb53f3WLAnnxBKFOysxm8V1CmsOrWpZfPgyuAakp
         0PbrapBhhldhH07AiuCKfdwGst/oEjepyzVcqYYNUDK8VskkV9eaKHwmzqbsvynZMeMB
         nkgA==
X-Forwarded-Encrypted: i=1; AJvYcCWyKMh0wfm9VsCQQXsvHSChcsBMRcM1vnQz06Mh7FuzOCj0PkFEQbxUvkPCOpt1BZsWPDwAYfDuvZ3JkypU@vger.kernel.org
X-Gm-Message-State: AOJu0YzzK+mTyrAIjZmmGPcD8qi3qyF4srp0y5DU75jRmkxgWlhMSUpa
	Reo1ik2oBMl9NBww4aPtYcjDqsroDhlHZtXwjV9y4HZL2n3nSC7rDAOaSWTdYqFwSDDCJdGmY8K
	uUateu/UznT1evd0RZid+QnL2/Tx9hz9fv/Az7eIZXW/D0W42n1ylu5cNYwAdG1zR3Ne/
X-Gm-Gg: ASbGnctKPBeyOVXDISGaMJshCeueptcivl/KR4Ca8w+7SXMhB5DLk07/ItkAJKp0TCf
	+ezJrCMgY6bWeANIyTVheEMjLDHfpPxpIrjJfxBV1Y6NU4C2IVqoT3sXFiIgsRYdHg/ZkHmfXOC
	QqsoQslZw2k3taWkfwRK3XzHTNHGeTMQ+l5WS0DwjB4Oc2bVkCjgxBF3IRN4EcnOfuDykfSY1x8
	7Gtd7pInIz+vXmbPVMDs4cy4RFrbe7aqLMkXgrYoe27rXocNQM/jQakYbyOMFnK0Ac0gbHhOLlR
	92wozN1U49p5/lo0bax0OvL6i3FOVxusei4uDrQf1HzdUKxrolFiNkwNZJGyvSOI0lAN6ebubFC
	7qM06rbNn+WJhPnnleWhZfiPnjHhmWfdU45M=
X-Received: by 2002:a05:620a:31a1:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7d3a7e388eamr13584685a.33.1749566669633;
        Tue, 10 Jun 2025 07:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWOd7xuhrf5TwkieWLFC54AS4om1PhF57nn/qY8jxb6FBJjibaKyC8aIYrg6fhy1wK9IcBnw==
X-Received: by 2002:a05:620a:31a1:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7d3a7e388eamr13580985a.33.1749566669251;
        Tue, 10 Jun 2025 07:44:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d04d2sm1564236e87.33.2025.06.10.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:44:28 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:44:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Message-ID: <tlaf6k4pblymc7zrsglgiugn4ft3bd2wwpmcghysmtnlb7grml@p6mqjkve3dvj>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <20250610111145.zp62zx5rjmezvmkb@umbar.lan>
 <26a0a50a-849a-4a2b-87f7-af11b6f91ea1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a0a50a-849a-4a2b-87f7-af11b6f91ea1@linaro.org>
X-Proofpoint-ORIG-GUID: 5WjUMFAsJA1ukhATeYrKbYpmPdri_3iM
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684844d1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=orh1W3nBkB3DDOtbTGQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5WjUMFAsJA1ukhATeYrKbYpmPdri_3iM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNyBTYWx0ZWRfXwRFvjdKoUDfd
 xJGn+2szPUkmtzHJy1FptvIAXbxmCh5DcuxZPwSwCv7Beh/Siw7q5UDlp1sZ8GWXGb0JTmgefiZ
 t0q+7fs8pv15P7lKy7RjiKl8YQsqejSbc5PZhnczhTgyz+OepbFn98cCM+TtLgAwfET6Tk894yc
 khWRJzadAZnmNX/cPd2HX23ysIz4b3Ry5kpjJ62ESDdNP4nSsv8hKpMA1jBACkg7JuDFbFL5iS/
 ThxTac3VW4e4vlbQucQfbzIi9F6a/L7Yi+1Cl4WTi+DdlrU9vBcLMS6okNoenvZ+Ob7E7hN5rFD
 bxaI8XTTG9RQVmd+4+Y7b7iM1kpvx7PQcnBY9y4+1xMZ+bVnOXkcSL0a+d+6I1+7RoHTcyIGHlu
 FQ1Bikvd8cN5g6jNeVLT8wRDSofVd/b8lLHLHR4H0RsVNVK8hNip6Pq+rqaP2zOrfh8GrDkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_06,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100117

On Tue, Jun 10, 2025 at 03:42:05PM +0300, Vladimir Zapolskiy wrote:
> On 6/10/25 14:11, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 11:33:17AM +0300, Vladimir Zapolskiy wrote:
> > > Sort the entries of interconnect and interconnect-names lists in
> > > alphabetical order.
> > 
> > This looks like an ABI change. At least you should explain the reason
> > for the patch.
> 
> There was a number of comments and notes on the mailing list that
> any changes to dt bindings without users are acceptable, i.e. no
> users implies no ABI change.

It is still an ABI change, but the one which usually has a waiver. And
that's why it should be explained in the commit message.

> 
> Also it was used as a justification to accept dt binding documentation
> changes without the correspondent .dtsi changes, like in this particular
> case. So, I believe the room for fixes is still open.

Yes

> 
> > > 
> > > Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > ---
> > > Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> > 
> 
> --
> Best wishes,
> Vladimir

-- 
With best wishes
Dmitry

