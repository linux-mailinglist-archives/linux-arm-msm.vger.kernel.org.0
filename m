Return-Path: <linux-arm-msm+bounces-82657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB48C736EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACEB94E77FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1892B2D8779;
	Thu, 20 Nov 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHxNet9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kovEkjLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0523B609
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633820; cv=none; b=ukY6uO8/rkHhbyDGdCfw3Ch5syEM9XYc7tUxyk0ZSJ9QtDBkmWJL22rqhYDqegwLEirIgj5qY1lAI2GiMEDSqO6iveEZ4yNnPMsHf/UmRENCS+UmGAL5cuTP+2FO2aJuSN++BH7BFhb5YZHX8WQOxU491Z9QZmg6OxUVsEG6dtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633820; c=relaxed/simple;
	bh=wBiq2MFiNo/81PAk7HAierFm5Yioo1YWXCKxQv22uwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtY3Bwb/qvs+q6Kz1POjbpPKx1tZiSR2PtAz4NddqdHbpzAy9Y9TOrCJbrehv/Jn4PRmZJc18jXVfZK9HuIj+W+DmLZUHdr2Q6RnWfuIEWsKYyQimmbZ30ANyZYtiXgznfy+DdesSgCtWjzUL+5p/bfAfFFiFrN0wYCN3aoDMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHxNet9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kovEkjLT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK7atoT082034
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vre3EFjuLHiJX8S9GqOtNbbj
	mKhCxQpX6xaU6xfx9Uw=; b=KHxNet9iup2je89Sai2m1NBPR67Q1Bu5O8Lpz69i
	Fz1q1Wt0bHxy2uvkll+AwA8tV+o6Wwu2nbdpsi+Grlr+HHuC2PqTgJjLRTXIAVPM
	yZg2Wk4R4aJ9vk0rdiTRHPZDxscgf2SrdO+na+njTMQVlew1DnGn3CfAhP1rYZMa
	Iw5F+Hu5Qwk1S8FctU8b7Ba+YHLwhayYfVGY5OyXlLQL80voyHMdtavGvdaTySiW
	WG8/nDPrFmYBbMjf4dfd9ivog30g0eGv9c5yzJNBQ6LNes6satpQg6Ch0LZ5cPnj
	/yzftQ6aiRNNdX/SRo2IpXHxNhS+tofg5XNPMUpR4/PNcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahxrn8gu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:16:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958c80fcabso23313155ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763633816; x=1764238616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vre3EFjuLHiJX8S9GqOtNbbjmKhCxQpX6xaU6xfx9Uw=;
        b=kovEkjLTlgTRaZmj/sVJq4k2aJ9XShIoaJyUetNs9mF0f9bAag8t8flJwn5fJUkyhf
         yyIJoqtqFC8+He8DQY/aZ68pt69TCpDmnQiZsQmGwMoXrhLzhaDXqlVl75AaNmYk29CT
         NEFLuOud7lT98lL6fNdm5MVvqbXLUc0YtfY8XKX+4P2q42ItBt4v5Em5vP88AM/IgFyZ
         PfvCDiePogNW6eHxboaCYRRVEcwabcWkw9ciSGX8GtPjTmsf5fE5APvVjqw2TXhiVftJ
         BMktvffJZZopQHqBKn/5rRGy2gaBwAz8jKczkQenwGHzf+JamTBnEd5gBYuIuLZFht4a
         lMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633816; x=1764238616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vre3EFjuLHiJX8S9GqOtNbbjmKhCxQpX6xaU6xfx9Uw=;
        b=dvqwpYz+/HkzAjqueWx7IHINzg5FE8mdluOogeYA31wZ8QE6Pdn9GuonYcC2vx4243
         AAHG5Hp/ICMUJ6YrxAvaXpzNHoriG6F/RQybpegbzJhJXWm45RYcJWeGcaL1kDLJn9GI
         hixWMbPbPvYfu7NNjL4EFmaMM1xGfurZg1zhRWDwHMIHeufCwe3Y0rhGDp3fo1txmdA1
         r3MoeSF5x01mnIEtdieKpXJS+uKj4FZLsIH9saolfkYb/PzXWF8f+eX9h0VoSBqegOtx
         G8c2yKQwJQXYvCSmr1hUG3ruHNKS5Ew3aZAQbtBXXWmrRiS6DRcHwDGfONzXEnoSeZPc
         wLdA==
X-Forwarded-Encrypted: i=1; AJvYcCV611I9FuNzjbB1JOcDHoIbekCV2ZnULSDBa/JvFJllUG6IJZuBJ3w2h30ayJqVOHmjZMOSMEEYDOXUzcGv@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhZAtAPPElFN1OC6LeCqaCD8bJwXjVjrZtuSsFuycA/E/RRe1
	+JlCxBJHk1o7AqwokpfUVdS9MAI6szrKbMdGsnCTjFv9Q8aaUU2qyNVijVHFtyH1sYYlIcZwBXg
	WFbs/ltjEb7iqfksnFwRTaW6oMGj+cN7qBQgDWmPvxxlYwcsGhf22s29I2kfjs/1nMfpy9rBati
	zT
X-Gm-Gg: ASbGncv3/j+wek0c3e0gCOa7qSEUcuYs/95Q+3ONsxxRKkhV8K8271B6TTnQfqPYp4J
	skOAeBYwX/vib+XHad82SyA7euNkOmGIADFKMjmLS+PmUXOrd2C1zipSZ5VDeN+nQLh5Zj9PQ5T
	d0DeK6hjLZB6UZc/7M2JSvREFYyhM2nnb6VeFSgpr3x7wMs9MGJKp/IAuN0sZZnEJpfhPnjo8YX
	qBDeayTSRY2HFVUbhBeX2Yd+hhT3Np+QZaC+HipA1xjWe3nnCxGT0s9d2sXGCG87s85mz7Q8r3g
	irfvQHazH0GzehZL7yhI0Xz5LDT69UKN1quKbKhYaZaLXoifgHOnTQXBUQYw9wte3bdu2prSMwK
	FMcdUto3yg0x3wEEN7MWiGxThChFAInUsj7P5SOk4PHwoUF4=
X-Received: by 2002:a17:903:1aa5:b0:262:cd8c:bfa8 with SMTP id d9443c01a7336-29b5cd6ca0emr27866405ad.34.1763633815935;
        Thu, 20 Nov 2025 02:16:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6heeoY3MWUc9B9Bk1vv7Wo07ywl0aKBtYaMfX/3w+92A/U0IlsDHaNG/O0EUBGnxzuGqJKg==
X-Received: by 2002:a17:903:1aa5:b0:262:cd8c:bfa8 with SMTP id d9443c01a7336-29b5cd6ca0emr27866085ad.34.1763633815450;
        Thu, 20 Nov 2025 02:16:55 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e337sm21332285ad.48.2025.11.20.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:16:55 -0800 (PST)
Date: Thu, 20 Nov 2025 15:46:51 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Set ICE clk to turbo on probe
Message-ID: <aR7qkwX12gJa69ya@hu-arakshit-hyd.qualcomm.com>
References: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
 <ep5x4ehq4gcyk67s7fwzcothgqyso4ltt2dd6fi6qdyvodz5mx@gvwmkkslvsw7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ep5x4ehq4gcyk67s7fwzcothgqyso4ltt2dd6fi6qdyvodz5mx@gvwmkkslvsw7>
X-Proofpoint-ORIG-GUID: Z2SFyFewrLWcPY9HDPvXbjX_o5py3GNh
X-Proofpoint-GUID: Z2SFyFewrLWcPY9HDPvXbjX_o5py3GNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MSBTYWx0ZWRfX83eoVFU/xHx/
 OlMzMG1USmu2o3bw63vC3he6mZWtX+n4f7DFRUtXCyCGOTXS6ffITdn5Bsn0PHYJMcu8Vag68kU
 FgirIJktqv+azJEr4ENDLTJOFCrFnnGhLzaz5jVpjQy4a2Bk6ANvypktilHFPbMMA1m88fC19r1
 eUPj1Ny9vC6lkUhoAWz2xvH/FvCb3bOB0q2Vs2BkEAAxI/Jvmwq4CZyYix144HxL41RjydOiyyk
 D1YAr7PDFj2QntlD5p2LYWprwDN/5aeJO5bMuLM4fXMIVeOIIHj5tA50JzvwLRstMds6Yt8NDOm
 aX1odD91GPaRC/r2/IDiZy2686LDS/SNumIFfDrGf3U+n+XGTi0yVIeTc83ocGDMRnnoIc3IB2l
 /GN7gB12WYVpPDwBw7i5dV7hbk5GQA==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=691eea99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QWYJWqraYEHugMdX4MUA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200061

On Wed, Oct 01, 2025 at 10:13:56PM -0500, Bjorn Andersson wrote:
> On Wed, Oct 01, 2025 at 05:44:32PM +0530, Abhinaba Rakshit wrote:
> > Set ICE core clock to turbo (max freq) provided by dt
> > entry at ice device probe.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> > 
> > To address this, set the ICE clock to TURBO during probe to
> > align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> 
> I think this (the snippet between the "---" lines) looks like a quite
> good commit message; but it's below the first "---" and as such not
> actually part of the commit message and will be ignored by the tools.
> 
> At the same time, the actual commit message ("Set ICE core...") isn't
> very good at all, it completely lacks the problem description you
> provide here.
> 
> Please use this for your commit message instead.

Sure, will update this properly in patchset v2.

> 
> > ---
> >  drivers/soc/qcom/ice.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index ec8d6bb9f426deee1038616282176bfc8e5b9ec1..eee06c499dc36a6bf380361f27e938331f1fcb10 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -535,6 +535,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	struct qcom_ice *engine;
> >  	const __be32 *prop;
> >  	int len;
> > +	int err;
> >  
> >  	if (!qcom_scm_is_available())
> >  		return ERR_PTR(-EPROBE_DEFER);
> > @@ -577,6 +578,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	if (!qcom_ice_check_supported(engine))
> >  		return ERR_PTR(-EOPNOTSUPP);
> >  
> > +	/* Set the ICE clk rate to TURBO */
> > +	if (engine->core_clk && engine->max_freq) {
> > +		err = clk_set_rate(engine->core_clk, engine->max_freq);
> > +		if (err)
> > +			dev_err(dev, "Failed setting the clk to TURBO\n");
> > +	}
> > +
> >  	dev_dbg(dev, "Registered Qualcomm Inline Crypto Engine\n");
> >  
> >  	return engine;
> > 
> > ---
> > base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> > change-id: 20251001-set-ice-clock-to-turbo-ecab9ea46a89
> > prerequisite-change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6:v1
> > prerequisite-patch-id: d66f521e5e625b295a1c408cdfce9bd9524ae3ba
> > prerequisite-patch-id: 23934f3fee5aabe4a2324130ed02909352b5cf61
> 
> We do have plenty of platforms that run the upstream kernel without any
> changes, so please test your patch on a clean upstream kernel tree.
> 
> Thanks,
> Bjorn
> 

Sure,
Most of the scaling operations will be a optional configuration, which should not break
existing platforms. However, will ensure that in patchset v2.

> > 
> > Best regards,
> > -- 
> > Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > 

