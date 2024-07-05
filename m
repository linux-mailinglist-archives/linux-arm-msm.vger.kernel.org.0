Return-Path: <linux-arm-msm+bounces-25393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF584928D20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 19:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A01E51F23314
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 17:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3E616D9B1;
	Fri,  5 Jul 2024 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DuphthjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96E16D335;
	Fri,  5 Jul 2024 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720201249; cv=none; b=LaOAftfDIOI9bqfkJHYC8QYO0Et9SnqPwasMQUuE4/4YCSb015a/JshwF0g8+BAfOKPSrkC9j+HwMaFvWkl0M1nZp98XwLo9QZ+SHyXkzawXdLQscsUclnzRNua/7B/mJF5SidC3ybcYGln8Tf+oMWtEOsT3aLWs0dXdYKNGGxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720201249; c=relaxed/simple;
	bh=YVERLXjAWTnjpgGoXP2vtWfh4hGbsd/kvEEuxew8fLE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfi4HfeKlm5JCqoN2o3gfm+sDz2qMrMRefwHpYLLaRal/mCDkbMZ2a53xDrKseKiQNJTfewJ/lazqgKWnB+b22KuUUytpRjCq+rP2yF1u8BhxHMvWzQXj8RYV6Dvp+D/p6xZM94ImOUFREvml1YYW7wIsNHJZylrMuk0wVKhG2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DuphthjM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465GC8j0019670;
	Fri, 5 Jul 2024 17:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IsTw9wDSB4eye4Tak2+2kWKV
	Lfa0j88qW0yeQi+xj9s=; b=DuphthjMaO0VGtZCXUE8tBrfjXk+4VXlZONjbp6I
	tcYypuAv4XY0OyWgeg1fB+1SRzdyT7ep+9A5vYw6Vpg/78Li6aO++ILcZL2kxfgq
	azBtBT36t9syRD8tZ11PDrqWqzeByA/LzgHn/4FXUAU0SFQzzD9/WxAK9AG24C1O
	YJMLcSuxiLL6YOtlaNVOdVNdko4eCaucKji0h5UHWUx15OOInIfb/dQRdGD4VM1d
	saz90zIolhaKAEhbfmbdJJA2DNsh8hj8dNfqOv0Ejo4JDGrWxmrIFODj3JTV0q+q
	5ZmsQt7gtfQREl1koyl6/P++Bb4uC34ok0ovMO9fE4qGug==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406cww9nb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 17:40:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465HefvH006784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 17:40:41 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 10:40:41 -0700
Date: Fri, 5 Jul 2024 10:40:41 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: qcom: tzmem: blacklist more platforms for SHM
 Bridge
Message-ID: <20240705103820587-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
 <jdfuvgaty44kg3xm63l765eueoy66qp7yngmf67nxqh5oifuzq@7gbzytqn5cj7>
 <16e542bc-b0bf-474f-b421-60e99f42a803@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16e542bc-b0bf-474f-b421-60e99f42a803@linaro.org>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yIQh21gbAne2aQqeY_FdWHALG5LsxNDy
X-Proofpoint-GUID: yIQh21gbAne2aQqeY_FdWHALG5LsxNDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_12,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050128

On Thu, Jul 04, 2024 at 06:36:23PM +0200, Neil Armstrong wrote:
> On 04/07/2024 18:03, Bjorn Andersson wrote:
> > On Thu, Jul 04, 2024 at 02:12:46PM GMT, Dmitry Baryshkov wrote:
> > > The SHM bridge makes the Qualcomm RB3 and SM8150-HDK reset while probing
> > > the RMTFS (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on
> > > corresponding platforms using SoC-level compat string. If later it's
> > > found that the bad behaviour is limited just to the particular boards
> > > rather than SoC, the compat strings can be adjusted.
> > > 
> > > Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/firmware/qcom/qcom_tzmem.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> > > index 5d526753183d..c715729f071c 100644
> > > --- a/drivers/firmware/qcom/qcom_tzmem.c
> > > +++ b/drivers/firmware/qcom/qcom_tzmem.c
> > > @@ -78,6 +78,8 @@ static bool qcom_tzmem_using_shm_bridge;
> > >   /* List of machines that are known to not support SHM bridge correctly. */
> > >   static const char *const qcom_tzmem_blacklist[] = {
> > >   	"qcom,sc8180x",
> > > +	"qcom,sdm845", /* reset in rmtfs memory assignment */
> > > +	"qcom,sm8150", /* reset in rmtfs memory assignment */
> > 
> > What confidence do we have in that this list is now complete?
> 
> AFAIK we don't but at least we're sure with this patch, it successfully boots on:
> - db410c
> - db820c
> - rb3
> - hdk8150
> - rb5
> - hdk8350
> - hdk8450
> - qrd8550
> - hdk8550
> - qrd8650
> - hdk8650
> 
> => https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/91268
> 
> Without this change it crashes on rb3 & hdk8150:
> - https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/152722#L749
> - https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/152723#L838
> 
> Neil
> 
> > 
> > As Bartosz says, we booted RB3 successfully with an earlier version of
> > this series, what changed?
> > 

Is it literally same device tested? I wonder if different firmware
versions behave differently.

- Elliot


