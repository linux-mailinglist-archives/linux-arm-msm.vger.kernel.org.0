Return-Path: <linux-arm-msm+bounces-53910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5BA84DA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 22:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB02E1BA2872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 20:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE8E290094;
	Thu, 10 Apr 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A59ek5qx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8528FFDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315207; cv=none; b=kDEAUrPgbu7Ged4SKf5md+nw2cDxKN8ZqAHVUBj3SMbcjpMbHJjY95C2Td3OvDDSo33wxzawKMG4+oIDpAzK1rJq0ly8F3yqJXvBV0+BEI8jPMYCfVXgFI6gu/3UBe00P77nN+Nupb+FjY7cuKtMOtyu15EkZMeWHdtDLaXe/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315207; c=relaxed/simple;
	bh=4rkEoKO7cOpPwalBZQ0NDwQXAXKjo95y7RRThGYk3HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAsFonhvMG4N4s3tnenD2dON6ouPdZs1S4aw5NSgePoi3MDe+vqdMgBBeGhtD0pu7rd2/ews0S/PFdymL5ztrzFnx/Aez2BfJQumnv/oeOkSs9AkodBAzX73oS6rQz8UmySysuGOqoxwZ2k3IxN19cE+xP9AKFUh7DskW/hDrHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A59ek5qx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFsroI013887
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wNOMTHHhh84q2ykF2gFHwWOs27+2UZ+5K0uavlTb4U=; b=A59ek5qxIIWSti7h
	nWpKemMgWinIJ7C0yo08N3L7BjrHadcpKO7HlTORiHD7e4RU17C2TkohpaO3L4O2
	R9QQEk81o0l/DNTFE0exm2YOtwE/AeZHjKlzS7I8doYJMEpJGsGU8s0fDSAzMt3i
	7KORbelMo51s887ncKQwLslvJE6Q2YTZUtoF+e6MBgNib6pWUMvvArdMRbPB3YRJ
	3MZPZPPOio/+JTGGYNjJWj99ztiVgO/rJGEc9dRI3E+hF9jhIQSDEvscUCMT72ev
	1MWlc8gxap997qb7onH7knhyo3mWmiWUqGMMN1eowCmAw9U2WdMdMtfkGkXzI4LQ
	5xF5rA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbeg86v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:00:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so264390285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 13:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315204; x=1744920004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wNOMTHHhh84q2ykF2gFHwWOs27+2UZ+5K0uavlTb4U=;
        b=KsbAZDcnkdck/hRPVGO/J+dt+qqmMgnxRzu0mdCnFbNRi9FedoYOYrj59oXvAyoVhS
         OLpWg8+5sGIG7vnw+KYOK6I/dKCh2MlBIdmh0imxpFY2NsY008XIpegiJeIWHiZikHx3
         6yHb7rgDv5Vak9b6uNs5pzJIIJAmO25KdyY2u1q8AYbqPXyDRR559OZnsM62Lqegy6B9
         dAKaaitQc6Rq265pgU5NunRqWXRK8WK20+OJGVQDM+ezT7Xy76qNNafOHwAuWdfYDD2l
         zwbP5vUlOJFpfRMmIRjoVTtUi/OAdG7vCqxmHJd8/LsO+41HkC8/BIszQLJPrds+Efmz
         iaAg==
X-Forwarded-Encrypted: i=1; AJvYcCVNwNkVnyPBjayqQu9J5xHluAJiVcvGTUUvybm/LNkTXvjme3aHxV3cRQH6nXMoNGFG/PpeJe7IsluoqmEH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4faCxLZb/zGg7l2ZyD5WYxcQuzAKJojTmaCwavKGfQVRHS3oQ
	usv7fIGorOMoPi+tF72WUvsETH1SIJWs2Mrd0+64/RmuZnemfORKzz8MZqJocOucfO1Mn/0JwNI
	Mrbh+N45wraY5DVoDhtCl1WMQG5MAayXhh1dgD1++sU3qzRfhP1+P7phYKE0gC9Mj
X-Gm-Gg: ASbGncu91RqI2+h4GyEO/09DCnO+9twBoO9+JqxTQRuTgPuteRwwP9Ic0JvKQE4HltS
	DBcsjckZFZBAE8jQmyLZF9Baa4+4UPIMYgQkaQCuddSVDHbWGsi1iL0U2y+JmSpjl/pjOyaYVNW
	OYPWObtp3wFC3PSFbCpfWE8b2Yqw/MNtFiY7d967PqTTc16Le9YtB4OU8mHM6m8b6NzBraDWgjS
	JpcU9sSEO3S7BGVQhXRqFG70M7Cbu9HU1JNvWJzJW6GyGKWmtHJszUTcM/SNz7mMuNLcRXejf2/
	G3rspGyFctZmfogEXKTUoDo6J7xfNWq02N9VXNwQfVM2k0ua0QJnp2qg/ZC8oDq3BvpQ0biSTRQ
	=
X-Received: by 2002:a05:620a:1a18:b0:7c5:43b4:fa97 with SMTP id af79cd13be357-7c7af1db11cmr41768885a.53.1744315203642;
        Thu, 10 Apr 2025 13:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK3o7FedoTJpZFRy9lS2yc7XNbDtrGzgkkOWmS1wXzrIetzjvuwh9/WyYeycYPnX4h4dKBnQ==
X-Received: by 2002:a05:620a:1a18:b0:7c5:43b4:fa97 with SMTP id af79cd13be357-7c7af1db11cmr41764285a.53.1744315203328;
        Thu, 10 Apr 2025 13:00:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50facbsm233911e87.162.2025.04.10.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:00:02 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:00:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Can Guo <quic_cang@quicinc.com>
Subject: Re: [PATCH V2 2/6] phy: qcom-qmp-ufs: Refactor phy_power_on and
 phy_calibrate callbacks
Message-ID: <xn2oexjb6s7pdh4lpligc47jlyuxvwvuuh6obvr5z3ggqi2qsa@xjttnszx5eq3>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-3-quic_nitirawa@quicinc.com>
 <ab3639e0-61bb-46f0-9e54-f1bbd034b939@linaro.org>
 <c35c37c9-ff5b-43cc-afdd-fff509415ca6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c35c37c9-ff5b-43cc-afdd-fff509415ca6@quicinc.com>
X-Proofpoint-GUID: tTk4AfFhSIw_ICfjmA3UnY1rrmhhO_rd
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f82345 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=_dewA8zSobTcTEY47J8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tTk4AfFhSIw_ICfjmA3UnY1rrmhhO_rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145

On Thu, Apr 10, 2025 at 02:43:52PM +0530, Nitin Rawat wrote:
> 
> 
> On 3/18/2025 8:39 PM, neil.armstrong@linaro.org wrote:
> > On 18/03/2025 15:49, Nitin Rawat wrote:
> > > Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
> > > puts enabling regulators & clks, calibrating UFS PHY, starting serdes
> > > and polling PCS ready status into phy_power_on.
> > > 
> > > In Current code regulators enable, clks enable, calibrating UFS PHY,
> > > start_serdes and polling PCS_ready_status are part of phy_power_on.
> > > 
> > > UFS PHY registers are retained after power collapse, meaning calibrating
> > > UFS PHY, start_serdes and polling PCS_ready_status can be done only when
> > > hba is powered_on, and not needed every time when phy_power_on is called
> > > during resume. Hence keep the code which enables PHY's regulators & clks
> > > in phy_power_on and move the rest steps into phy_calibrate function.
> > > 
> > > Refactor the code to retain PHY regulators & clks in phy_power_on and
> > > move out rest of the code to new phy_calibrate function.
> > > 
> > > Co-developed-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 18 ++----------------
> > >   1 file changed, 2 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/
> > > qualcomm/phy-qcom-qmp-ufs.c
> > > index bb836bc0f736..0089ee80f852 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > @@ -1796,7 +1796,7 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > >       return 0;
> > >   }
> > > 
> > > -static int qmp_ufs_init(struct phy *phy)
> > > +static int qmp_ufs_power_on(struct phy *phy)
> > >   {
> > >       struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > >       const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > @@ -1898,21 +1898,6 @@ static int qmp_ufs_exit(struct phy *phy)
> > >       return 0;
> > >   }
> > > 
> > > -static int qmp_ufs_power_on(struct phy *phy)
> > > -{
> > > -    int ret;
> > > -
> > > -    ret = qmp_ufs_init(phy);
> > > -    if (ret)
> > > -        return ret;
> > > -
> > > -    ret = qmp_ufs_phy_calibrate(phy);
> > > -    if (ret)
> > > -        qmp_ufs_exit(phy);
> > > -
> > > -    return ret;
> > > -}
> > > -
> > >   static int qmp_ufs_disable(struct phy *phy)
> > >   {
> > >       int ret;
> > > @@ -1942,6 +1927,7 @@ static int qmp_ufs_set_mode(struct phy *phy,
> > > enum phy_mode mode, int submode)
> > >   static const struct phy_ops qcom_qmp_ufs_phy_ops = {
> > >       .power_on    = qmp_ufs_power_on,
> > >       .power_off    = qmp_ufs_disable,
> > > +    .calibrate    = qmp_ufs_phy_calibrate,
> > 
> > Ok so this will break the UFS until patch 5 is applied,
> > breaking bisectability.
> > 
> > Make sure UFS host driver calls calibrate first, and then
> > do the refactor in the PHY driver.
> 
> Hi Neil.
> 
> Thanks for the review. I have taken care of bisecatablity
> compliance by making UFS host driver calls calibrate first
> in latest patch set.

_latest_. So if this patch gets merged first, UFS support will be
broken.

> 
> Regards,
> Nitin
> 
> 
> 
> > 
> > And either all would go in a single tree or either PHY
> > or SCSI maintainer would need to provide an immutable
> > branch for the final merge.
> > 
> > >       .set_mode    = qmp_ufs_set_mode,
> > >       .owner        = THIS_MODULE,
> > >   };
> > > -- 
> > > 2.48.1
> > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

