Return-Path: <linux-arm-msm+bounces-62911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4473AEC81B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 17:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2691517A223
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 15:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312DD21FF36;
	Sat, 28 Jun 2025 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8Ja3cqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C414883F
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751123028; cv=none; b=Ljfz9xbVVAbXNWa+sbdnLOmqKUH6z49c9Sw9Vu4HIL/dBrc6I5sld9+boB8ZQIFVgzyCSPiO/HyqjnF0xzHF3JDsuuuW6yEOd1QOYF2NzdfYw3I0JGAmkgdYf0uRZorLDwqDaVoD0zi2h8pE7jQ5MRet7w5ilYTUOc8//H04g68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751123028; c=relaxed/simple;
	bh=9ZaYjkfAVE3FPlngX5oiDDJMbHGyV6hblS4UA9vmZjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc7Gw2FYZHiPwQ/Yecyfz8D2HcPA7YNCze6pHh7+hbO0mvCcxHp0qrlPy22e8ulVwHrY4TKuJaB7phLtOREDkDHn8+dL6eQURrmAeflDkN+fjzOKlwrgbcPFpQieAW2OePTMRINCExk3lFlPkzyysbiMAFR8qCklm5PQEvtr1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8Ja3cqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S4nnYL010467
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 15:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xqTnJowqwZlwhCR/o2bpgVqV
	sVhjsA/GLdTuLcpD2JM=; b=D8Ja3cqWPMp98+fkVTOK0iM/7Bue3sYWcaujTilP
	kJ/3u5FYXxUSTPGMXZZMaHgX/lgusYFtXfmpvHZZnzzUO9eLX7qPx4svNWMQBrCE
	jfEvGBYOnpCo7tZEDF5kexkExXgHOt5O4cgL40j5dsDpLHdiFU8NmNPKOC9x5iMK
	TEaFlgebFaPh9ERwsJGaYeMc3G5jFd3+Bp5cIIrYqnXMgubKogGhD2SiF5kH7nAi
	6pJeZdX1miHKh5eAL0Hj7wyq4t7YryTFASHs058T/z0/QyPDQaozZ8AktvVotEfj
	HK0O168nnqkm2emOTrgLD9/ylNNhmZMe0yj3o2YzjkGAJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801rtwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 15:03:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d44d773e23so203647385a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751123024; x=1751727824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqTnJowqwZlwhCR/o2bpgVqVsVhjsA/GLdTuLcpD2JM=;
        b=u2i8KImlbv9mpO/LaB2L20Us4tbLbvTO/Igkgn0XQIUx0twGNIvNWrzfrIrk+ol1lu
         rl7JQnSWEWM4Cfb48ezGKNOd6eaWsxUEuDjSdUOD6bNNZOH8S0NXv6bK6EbGrjCpxEQ9
         Q5CFAOO0mZ2pQTem2aoUJBWTWz6/HKB9+MxLdZROfHBmljuvbETgZ5I41CtqPisJrU+x
         Lj9c7LV2uXIFdFcVo3CCyGz9G62xAsi/jKOHhB+/yzEwz2Q+O0xXAnbZ6IptB0qnnkec
         jrSe+GfZNf2BMl5shNLU7QXsdgGRSJaQ3pa4kfoOdvTLe4qSIufDNpafdJrak0aypy9K
         kJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVo1AyoPAvgXq0bKPlrILwIsxCSw0cwhjxHN62gq1pWmSNyh6xehj0I1n3rCFO7rJt08xYQkfOOz24G5KJ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy54mt8gmrPFS82lNdvzkgcZkjgt5dKFZwKEgrwfHky0ajfFZ1N
	Co6C22CsZW41SYRr4zIYGo6wT7HRDBBjE/BEEDZvDJrHb6OF1Hw1QE0yuTM3cyBUvyIBsZLCsKc
	8o+EKt0IYkLcxF6oBw2RnECEMXBf4zKS9iglOku9VoDPdRObVPafdBA3y6KvuWWgF4phK
X-Gm-Gg: ASbGnctUH4EBCbZPpIkICP7KAMiB6uaCUMcgkFroPYwtKPaReKNNhrDBwnEr0b/Lk1R
	LJJBWqi4HPGDl6zDl//ejANBScBuhKeNL/W3xyClm0Du1WtQmM4K8Cufx2hMa3L4Lqxs9IkJvcc
	7/9J95/Hs/RNeIF6CZgi74DMGKtZJf2Ck3XGDzEHefbJYpzu8P344ppfGZiOHhyQRaKVpDd9fMf
	eqNSMJ7y9YdNrATlpGas8pStC5O1Il4OZt3iF5ZO/P36DBjXKBky84l18C9g7ND7VoAsYe9bfWx
	ebp6IoVhV62qQ2MB+QVKX09M81w6Bf430iRoc98jn0uD+33nlXr2FYF03jiYqWpL3qtW/Jc+IyA
	Gl0FhcR0CRW4kMSTdI1vgr4xmsmTbqDt0eWo=
X-Received: by 2002:a05:620a:6983:b0:7d3:d53b:35cd with SMTP id af79cd13be357-7d4439806f5mr1050280085a.40.1751123023943;
        Sat, 28 Jun 2025 08:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfO4TB+7Z46znGl0aUe2Imd6wWNuSoz55SF/Y6iEWVjGqIkJQKxpsG/BhaTNLU7xneYus/eg==
X-Received: by 2002:a05:620a:6983:b0:7d3:d53b:35cd with SMTP id af79cd13be357-7d4439806f5mr1050274585a.40.1751123023434;
        Sat, 28 Jun 2025 08:03:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec6370sm8213641fa.59.2025.06.28.08.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:03:42 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:03:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/8] firmware: qcom: scm: add modparam to control
 QSEECOM enablement
Message-ID: <7jjxjkk6qwym2mt6xp7t2t4wckyrvwaj2ydubkimnx2oybitab@u4nhj5mib64l>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-6-aacca9306cee@oss.qualcomm.com>
 <aF0cyOpkjUI4R3bv@hovoldconsulting.com>
 <gqoba4uu62sh4qxapqkhlufxnliatevnsqcxvijvb74tposf2b@iyonh347aext>
 <aF1EDMsw1KQTlteX@hovoldconsulting.com>
 <cjinqyqn7qgvdoltoywxa2lq6bjyfrotmon3iv24tqt3bpdlpe@3xb2k42ffegj>
 <aF6Srse7BhDJkQiH@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6Srse7BhDJkQiH@hovoldconsulting.com>
X-Proofpoint-GUID: Mc21WReDG69A50xRre_QDIoa9NVv_GTY
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68600451 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=GPfsrgj4I8Os2nzgvcMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Mc21WReDG69A50xRre_QDIoa9NVv_GTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEyNSBTYWx0ZWRfX3cashTkaaLwk
 ylesEqbray0Q6NJcJRB0zLXtzJ2MEWytsL3xP6v7+2mzZN0vuaBKZuQqSq1EY5GEWMNXfP7DT/A
 PtZR6DYvVyUrkl5ilD5XaFiuk31vZeiYlfXHVitGYBJRZematstd3HPa6QdEJmr2uJE3+38AXGb
 LhqywLxhkzTDoJSI38Y0vUjWC7O1+gvj6HLMGSzM9hjU774ieOMdKj6h7KuCHOBjUAT7nZYBU8A
 Bdd57sf1BktjuBPcMfogxN++rzC5q9w81SkEmg3O1NhT9Pr6OUbeUOIJRup5lXvTba307LNCRik
 cFGJwheFy4F1rohSxQ+AILCrkurkc5v+kNF9k6+TToss8beYrKHCOPEPLylpeTDkaWkY71h91YJ
 wNGEIR2r9lpJX1sg0yXL1uj8UU95tTH7Ozu2sLCC48EowCscPEZD0vVGCNhOIHNiZp430HuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280125

On Fri, Jun 27, 2025 at 02:46:38PM +0200, Johan Hovold wrote:
> On Fri, Jun 27, 2025 at 02:33:27AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 26, 2025 at 02:58:52PM +0200, Johan Hovold wrote:
> > > On Thu, Jun 26, 2025 at 02:08:23PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Jun 26, 2025 at 12:11:20PM +0200, Johan Hovold wrote:
> > > > > On Wed, Jun 25, 2025 at 01:53:25AM +0300, Dmitry Baryshkov wrote:
> > > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > 
> > > > > > In preparation to enabling QSEECOM for the platforms rather than
> > > > > > individual machines provide a mechanism for the user to override default
> > > > > > selection. Allow users to use qcom_scm.qseecom modparam.
> > > > > > 
> > > > > > Setting it to 'force' will enable QSEECOM even if it disabled or not
> > > > > > handled by the allowlist.
> > > > > > 
> > > > > > Setting it to 'off' will forcibly disable the QSEECOM interface,
> > > > > > allowing incompatible machines to function.
> > > > > > 
> > > > > > Setting it to 'roefivars' will enable the QSEECOM interface, making UEFI
> > > > > > variables read-only.
> > > > > > 
> > > > > > All other values mean 'auto', trusting the allowlist in the module.
> > > > > 
> > > > > I don't see the need for this. The kernel should just provide sensible
> > > > > defaults.
> > > > 
> > > > It does provide _defaults_. However with the next commit we mass-enable
> > > > QSEECOM for SoC families, which includes untested WoA devices. If the
> > > > user observes a misbehaviour of the UEFI vars or any other
> > > > QSEECOM-related driver on those platforms, it is much easier to let
> > > > users test and workaround UEFI misbehaviour.
> > > 
> > > You basically know by now which machines supports qseecom and which do
> > > not, right (e.g. UFS storage means non-persistent EFI vars)?
> 
> Do you have a theory about why on some platforms, like the one you're
> currently adding support for, writing UEFI variables does not work?
> 
> Can you please include that information in the series so we can consider
> alternate routes for replacing the current whitelist with this black and
> white thing you're going for.
> 
> Is it related to UFS at all, for example?

Strictly speaking I have no confirmation (yet), but there are two
theories:

- UFS vs SPI-NOR
- a edk2 PCD which controls whether SetVariable commits immediately or
  whether it just buffers data until EBS (or other call).

> 
> > > And it's a pretty bad user experience to have people trying to write
> > > efivariables when setting up a machine and then spend hours trying to
> > > debug why they don't persist after a reboot.
> > > 
> > > I don't think that's fair to users.
> > 
> > So, is it a user or a developer, trying to port Linux to a new hardware?
> > Also, R/O implementation makes it obvious, that the variables do not
> > persist.
> 
> A developer enabling support for a new platform can patch the driver and
> does not need a command line option.

Yes. But it's easier to debug things this way. Consider all ACPI-related
or UEFI-related kernel options that we have.

> 
> If you enable it by default, suddenly a bunch of end-users are going to
> have to debug why storing efi variables silently fails. That would not
> be fair to them.

I'm enabling this only for platforms where all existing devices are
listed in the current whitelist.

> 
> > > Let whoever brings up a new machine figure this out. It's just one
> > > entry, no scaling issues, and we get accurate information (unless
> > > Qualcomm, who sits on the documentation, is willing to provide it
> > > upfront).
> > 
> > And that's not really scallable. All other parts of a particular device
> > are described by the DT only (that's especially true on the PMIC GLINK
> > machines). If we are to support new laptop in e.g. distro kernel, we
> > need to provide a DT... and a patch for qcom-scm driver. I'd very much
> > prefer to do it other way around: provide a DT and patch qcom-scm if the
> > laptop is any way different from other laptops. E.g. we know that all
> > X1Elite laptops support R/W EFI variables.
> 
> But this is just kicking the can and putting the burden on someone else.
> Now a user or distro would need to pass command line parameters after
> spending time debugging why efi variable updates do not persist after a
> reboot.

The original developer for new DTS will have to do that anyway, if
something fails. And once it is done, we can add a quirk for that pure
platform. However the majority of the case can go without extra quirks.
As you can see, all X-Elite / X-Plus and majority of SC8280XP platforms
already are in the whitelist. Once we sort out SC8280XP-CRD issue, all
SC8280XP platforms supported upstream will have an entry in the
allowlist, which means we can convert them to the wildcard + quirks.

> If we know with reasonable certainty that all, say X1E, devices works,
> then that that's one thing.

Yes, we do. You can hand-compare the lists too (I did).

> But if this series now enables broken EFI variable support on every
> other device then I don't think that's ok (even if you provide a command
> line parameter that each user now have to pass).
> 
> Then I'd rather see a proposal for how to determine which machines
> support this or not, information which was not available when this
> interface was reverse engineered and where a conservative whitelist
> approach made perfect sense.

WIP

> 
> > Except for X1-CRD, which deserves an entry in the driver.
> 
> I think you meant my sc8280xp CRD here.

Yes.

> 
> Johan

-- 
With best wishes
Dmitry

