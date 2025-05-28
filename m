Return-Path: <linux-arm-msm+bounces-59703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC9AC6B85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04701BC5787
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C2A1C4A24;
	Wed, 28 May 2025 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHUtPla8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2713BB44
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441743; cv=none; b=m9VAAIiZh4psD28jjDQYoH+EDqGaZ4QBYUxpOIBkOsj+pvDFq0r24x/YH8GkfYf497j6abMWvmGkgpIzIviHtEuPsj1RKLbkBLAAKUTIrB1/RVJR9HbuAHFhqg6zdacRuBeIa2P60MgACKPA6hSuE+joL1xJGwk6a49LvhQxCCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441743; c=relaxed/simple;
	bh=oH5seIgO7GikF7klnt9IfbiX24eWzPldETBsqQsbdgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmMd58DwHR5creSHzqKovaX17E7MEKrhQTs8yguB8tY5wArjj4E/PYLbu5cDBc0asXxYTMW1bUpwBWcE24WatCe/SOC2ZfS+uzeEIggucJah8DxCxWsEBEhrsWGXQTNCTXyrm9L215BmExoxE8uJkYkXVdqO8Nc+8sWL91Zf9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHUtPla8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S78B3h001576
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 14:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PKKIFVUFjBYMIYlOdCe4wRf/
	gEEm+3cc8dZgEMLxB3Y=; b=OHUtPla8m4LJ8EO6FaK2J/jO34HZo7XpCdeRqzZI
	+85e80eqy4DYaXc166F9v9bHMULmTJzO/vm3OT+ECGY1sF/rsa1sgCW0NkxW1KVX
	5hS9E8cAAlqLwAegGxNzciC5i6/CJyTSnIpWiX/vRhdnVcj+d1SrqxD94V56PrBP
	5if2AJG2tm5HBCF3/j6BQfNTJm3B87B7tQ//3qJstJotYnePjPhAMrxiPYLh3a5W
	MtDPDGkYf1t/4Ebb6GDZZS0hqn7plCK00DkYhu+Wq7jX1e0HxIZeB1fGQxM02tfM
	pZiITSdgaPzglE4bBiaXpe61OKXuSjQgwXxo1Gk6efO0QA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkv8bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 14:15:41 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc9d335fffso69446295ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 07:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441740; x=1749046540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKKIFVUFjBYMIYlOdCe4wRf/gEEm+3cc8dZgEMLxB3Y=;
        b=IrqiP/ZzeBcUiTSrw2xDaVc+NdhSAPPYeAnxNfMnZUA4t/sGws+r0gi7VDgnPIBfcN
         mZYp84RqMhnq1e/SJFUOxXYeWerRCCGYC/e6P6CmB0U54V4PS3tvesIEwevXJ5HSi971
         vDvJ1cZ0y5xLOlorrggCgTOf1E+1oeeRI26ZS2qW+pih8JG0ND+aGHnlhGK6j5Y89wev
         wQ/wLIkAYnW7os99cNFmdhwDSwtCXlM81XDaHU4ewQQ6CjqfgfOYHbx55adWQB7PwpIx
         du0aLl/wieTAX5ufnwhsBXixpiaSoxs5hCng/bY4Zex6QGSYzyftuOgPzTQueJCAshUc
         tL+A==
X-Forwarded-Encrypted: i=1; AJvYcCXSzVmPbB/brTmPXz1l4mlva78IEd4C28vRWtI5NmiKqKbPikbXQLST6S3cAmHBPZUqnmPN5oueGX8ZmAxr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn962OGUxk/To0dDYoTrQuSCQD5i9qc6+1sBCh4sGi5z+sOygR
	wNK5G1OwN6SdVmIBy0PlsSCF80vdathYEzF3rA7eEwvMe1We2EZtfnuBkBfHjUTcT53xUEtxoeM
	ShxTiVdWhhyYSRhS4CfEQQOUfDwxGQi16KMvcCirvFQUL+a+t1YnY8kc5PjTyMBeXNEKQ
X-Gm-Gg: ASbGncu1vRZ1WD07eUklFwbkyIyOqKVJsW2xZYN0GrTbrRTcHLbHzZDgx9oJMJ4s3jk
	CRuQ6g+5A5RDzoDHlQK6MZsSWVoaAaj8R8ynKezq6A/CzKMRelHfPrqK4rphCAQG5/yuN8clM8G
	npxg202wmb6/S9kEYrYoo7YRi8KHAE/LWYG3JZLcN5nrps+sZ0saXTSUrMvGxhYETr/2oz2XZiG
	DiOO+kVzzBN7KK4jufZqph4qAUOIKGDcMtTugcwp5Hwph3o76QRJGoPQ2GXMsosWd/9MddA+kVR
	ElR0dE7Csdu8RH3BGNuPA8Um0AcRM+6EbeFRWGhXqL3jqCYqX1jJ1nLUaRK4165Hb1oKbZp5Uqo
	=
X-Received: by 2002:a05:6e02:1c0c:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3dc9b6d3b48mr187418825ab.12.1748441736792;
        Wed, 28 May 2025 07:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO/qLKlIuHWvcnnRm0piuVuCFI+VpDYEPSMU6XOu9GU61UnMzyorzXe9JnyOOAIzHoUfmr3Q==
X-Received: by 2002:a05:6e02:1c0c:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3dc9b6d3b48mr187412855ab.12.1748441732235;
        Wed, 28 May 2025 07:15:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a635sm297843e87.86.2025.05.28.07.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:15:31 -0700 (PDT)
Date: Wed, 28 May 2025 17:15:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Message-ID: <d7gvn7awccrhg4ie2c3vicxpknqteo27rxnlh4lfsecobz2zpp@vpwug3qhufkk>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
 <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
 <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
 <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>
 <aDWZmJMIOVyzu1Lc@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDWZmJMIOVyzu1Lc@hovoldconsulting.com>
X-Proofpoint-GUID: TAKObkm7HGjrMIR3-tD4PwZ5FeIjqwSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNSBTYWx0ZWRfX4oqnkdEtCk79
 uz9JVjPPXtkLY8Zc8yqxZp3G9+90yrxRpaJwDF/G4RpgjkrqP+IIP26D6kdUKVl4XAKOmlr9YBK
 imTsZEgIBV/gWndprEHgZZy/ri+XakLoucnbDQc4SkIVq2tpKQ3dFSL608fegSlRjq33T45xoVU
 Xo7VWP+dGz+J5vpAU663UDr5qqXlQ3cN2hExIpK5Xtj9XFHmlwqbbkovUT6RgQaDyswh+a6QIXv
 SMop8nBLrBJSCqX++fT71JnwmbR1wxmp6hjZyvwyVkL/cgTU1UBAY68hopwQhOz+CTCZU2RYi4C
 mDVZwK2K2zT9JRY6BSXL58wvwXfRuHybIF7FLUNjcKnWzmljoQu8WZow3nO29vMsS+n5xLDWWEr
 nHFLQJRfB6kHwEkAlNN5zkamMaiD5WIu1lR3Stbm9fAfzeRndi2sJnpSlL5F6mbIVjIvr14r
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68371a8d cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=kLdZMHmJudiyi1bg_n4A:9 a=CjuIK1q_8ugA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: TAKObkm7HGjrMIR3-tD4PwZ5FeIjqwSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280125

On Tue, May 27, 2025 at 12:53:12PM +0200, Johan Hovold wrote:
> Hi Bryan,
> 
> On Fri, Apr 04, 2025 at 10:02:47AM +0100, Bryan O'Donoghue wrote:
> > On 04/04/2025 06:24, Vikash Garodia wrote:
> > >>> How different is this from sm8250 which is already enabled on iris driver ?
> > >> As far as I remember, SM8250 support in Iris did not reach
> > >> feature-parity yet. So in my opinion it is fine to add new platforms to
> > >> the Venus driver, that will later migrate to the Iris driver.
> > > I would say, from decoder side all codecs are there now on Iris. H264 merged,
> > > while h265 and VP9 dec are posted as RFC, there is one compliance failure which
> > > is under debug to post them as regular patches.
> > > If we are mainly looking for decode usecases, then we should be on Iris.
> > > Preference would be to stay on Iris, otherwise we would have that extra ask to
> > > port it later from venus to iris.
> > 
> > Right now venus represents 9/20 - 45% of the patches being churned for 
> > sc8280xp.
> > 
> > https://github.com/jhovold/linux/tree/wip/sc8280xp-6.14-rc7
> > 
> > This is a good debate to have, however my memory of what we collectively 
> > agreed both in public and private was to continue to merge new silicon 
> > <= HFI6XX into venus unless and until iris hit feature parity for HFI6XX 
> > and to continue with venus at that point for < HFI6XX.
> > 
> > So merging sc8280xp - HFI6XX is consistent with our agreement, the right 
> > thing to do for our users and a big win in terms of technical debt 
> > reduction.
> > 
> > I will post an update to this series ASAP.
> 
> It seems things may be moving again on the firmware front, so could you
> please respin this series so we can have video acceleration support for
> the X13s in 6.17?

And thanks to Mark, we indeed now have qcvss8280.mbn in linux-firmware.
It would be nice to get driver bits reposted and hopefully merged

-- 
With best wishes
Dmitry

