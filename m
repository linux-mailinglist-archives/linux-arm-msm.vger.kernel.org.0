Return-Path: <linux-arm-msm+bounces-93998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPM6A46qnWmgQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:41:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F75187E3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 558F030054F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7A339E18F;
	Tue, 24 Feb 2026 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYUSxdyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ztwkw7mH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4D39E177
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940489; cv=none; b=dxK3UiByav2bltRIF1dgrWtdik3cl/W2evaYf74FGbsP0JxuGmRbXY8SSyNEsx/9ywlsUnevYFpBDQ6z+vJ6Af7Y0H5djt3vY3dQH2SNjYTUfVxLLeOxzSgwujHOOlASeZPxiLgs6LyenLu4r5v+u+vEXXjoj7PaTLTn70TgrfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940489; c=relaxed/simple;
	bh=r7BiUeIBfewUZ5pTC3H6dpfvxK/A2NLbHqH1U+2yQ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAjjOjtTu1YNzHh8g9AJQm3aMMqXQd/y59JfewUZrJJLCVEqtbgaWJAKriK32xOb/LlImAu3iNQZR/xmR2NKPXn5j8EhHjo5M2AoCw7OXAXpkg+SxLQn+Qlbexeq1OoakZlBve3Kx892r3G23HiC/xlZIkAo++5UU4LTRiKNjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYUSxdyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ztwkw7mH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFSR72006479
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GCmCIvGjw+0aYnHJUo5qfc96
	HyQB54zOIU3mzx1evxE=; b=iYUSxdyVsyH3g8BXsOL8UMF9TNv5I1RzePmurFD3
	XV8ahykewziEWT/9yafl3lSJjS4XDKb7R85kO3T9NjqnV6kg0pNFCK9Ub55cxhw1
	JpJ46NgH1JlZg0i+FcvD+x/WxlSamOFX5mcxlcizib8dG5dBZGb/ycSUnkKMnLAV
	Sv83cSXTIB5sUW9B7bp4RxK/rsnrBF2D/Pmw7x7mPCcOOerkfVRL5oaXBEYqgTyE
	T943Wj0oku7YRScgQfwvcNNIXE+yGlKcg9VNFi5z3b5QpVJsbyb/uYoJpqFwDi0h
	pgp67xGfLrDAL0p90lzI+GVUs+gK3YY4M803dwrgiKbVBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4569mrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:41:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso3959276085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771940486; x=1772545286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCmCIvGjw+0aYnHJUo5qfc96HyQB54zOIU3mzx1evxE=;
        b=Ztwkw7mHT+dWjUQY9taw80UnDKKOldBWhLgT0Eh94UFLw6nl1TmnKozj89YbeNOX8S
         cOaNXUs19PT/F1STBA9mSHLS8qMaIxKkiq6eVgxOkFUVa+btjcE/krgWHkjaypReXNrH
         1vjL4lhizia57aEpWupS1nNJeqH7pK/6zhc4EOuXNC9NqU06stgtPjABa/FHeaVk+WF3
         Hfqr3EHXFPX4/kH0TGUCprahML9YPjKLXCImiIojBceE/tvbVz0BkPcbXIx42lZ6U5Ei
         kegaKWp4JaEeoRuhRRkJzLye8ISHT9VE8N2p/EMH3FvIDyCA9WU+KyNL7RBWX5dHvZTH
         0p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771940486; x=1772545286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCmCIvGjw+0aYnHJUo5qfc96HyQB54zOIU3mzx1evxE=;
        b=C+z9+rBec6+a6IWt7Tpdh3De+CLsYYves+UpSpxSLKO5WU/NOIpW3x4QbNZGTVvF6w
         iDQB2mUFGPK0awYjp9i8BvJDNRrl25tAAX8JuKWmiSqj9tcqfKMZq0pBR3jvIyplwkEA
         M/xBdyQ6Tk3D7XEgt43YvnYlfuYJShfHdteTa+L8GV+VBe1EOHGecNWHHxE00zIpbWYE
         f4Bylxp0KHnD5djHC/akLOBhqogV4qtsXovP7BH1hoDiiabKS7REwgoQIO2CQvtsmSSQ
         L4te/N76VGD4dwp+iiKXOJfe3suVJf3oUfDE+wabBR9s1EIEVpIOJYB1Ntrw2ylOiRDZ
         KmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJeS4TUwL+wFR58jdqy0sg27rvC5EzfPvHKQKwq1rEtir2yVOh99fcP+G+ZjWW6uOpggeBlyu2Lj1L7PlK@vger.kernel.org
X-Gm-Message-State: AOJu0YyHt97WeQZZ9iucpJ8PDvEqdayH174dDnd9Q9ePW9xVomOXTkLw
	Qc1ng9VmstfShXkX6TbJ4S3+wEOhaewoqcT92skd9MyAiqTNgWGd1cUvOnqeuxG23QIQckqUWuN
	cLU5PeKNM/bu8tZCrMVspVu06HY6RB3vxuw2iby3qElvFh8m3gojRE5vhbtzPlnVIWjeo
X-Gm-Gg: AZuq6aL0yFzAyjdDHuIKW5NKaYxIrBvYHVXXOfozSMPNagz+2JCf6d24OEX3hnLxnta
	zaBJKrHKXLcXIUwPsUwPNdGJAecQK1c+kpHOf3Pcc7vCK0hbJc9o/RdfWDXsyBUPvOOsVRyctYZ
	pm1RTuCQSuuO7aNcqx/4j7jHLI272TvvdBbRbKN1z+Bc/txhEl6tR9xPmXQhyU5jbqwZcwrsPEy
	3xs6lrS79fvybbyAc62uyijBEROOaFddwmxfdB7mLved/4HVGRiF7NapamX0ZQdd2pGN6vM4CE6
	fIQty0bABoO8rW05dukRmwPMdGvxFOidZa8CSz4Ad2dw3if14ohXcWoLHPDKD5GoNp8lKkzMj7M
	xeIJvyDl0GAVHB7FNZ2OPNTiByyWiM1neoElj
X-Received: by 2002:a05:620a:371a:b0:8ca:2cf9:8197 with SMTP id af79cd13be357-8cb8ca6d928mr1569703485a.47.1771940486467;
        Tue, 24 Feb 2026 05:41:26 -0800 (PST)
X-Received: by 2002:a05:620a:371a:b0:8ca:2cf9:8197 with SMTP id af79cd13be357-8cb8ca6d928mr1569697585a.47.1771940485811;
        Tue, 24 Feb 2026 05:41:25 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b8195f50sm29415055e9.0.2026.02.24.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:41:24 -0800 (PST)
Date: Tue, 24 Feb 2026 15:41:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power
 Domains
Message-ID: <woypnbzsvu5h6rycqolvmcom72ypgg2324yhhpu7vnnpb7fld2@4qf67agnjt52>
References: <20260224-eliza-pmdomain-v3-0-6e13d3aa70a1@oss.qualcomm.com>
 <20260224-eliza-pmdomain-v3-2-6e13d3aa70a1@oss.qualcomm.com>
 <f52f3f86-5ec2-4d3f-98b2-5ceddc7b71bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52f3f86-5ec2-4d3f-98b2-5ceddc7b71bc@oss.qualcomm.com>
X-Proofpoint-GUID: 8hWgAaENO_dQaFTJcdUovlpzQMsI-wfJ
X-Proofpoint-ORIG-GUID: 8hWgAaENO_dQaFTJcdUovlpzQMsI-wfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDExMiBTYWx0ZWRfX86CzaaOeo21i
 SumdWerNj6zOtimC++Vgz4YRuF3uTaFvPN0QfkozJK9l6iAqaAFt9vg1rE2XgsNKQglufH2aTxv
 HmIJdxh9VfsAbV7kbYXd9BJrqgvOCLuD8o3H+wrYHHhQaKQ11Yt4fRSPdc0giJVgH1DshdRn20v
 AiINYjC34mQC829ha3JWWM7O7ifpGtx8YRvv8yujY0jHsOAkbMreLtJkIm07aoOZwPzNrRVn9/1
 dmSJVDwr8U00lEchdcZcnWvfd1ewBFCSbXoCgRZ+Cxy2yZZak7JLXvBXbNdvd9i7Cq0pRFmKc8X
 s0FKFMBju+Sv/QaCj0G17xogReYUbp7VuMQhWfw6ZgaIjqLPIYOvl7P/m7jkrRCbvNm+GGJavUk
 dZhgEJ/vvsFbwdDwuJW6qdsseLhZTXKMeihPbNOnI3R/oIcmn47evdWECaqFPO7A8lUc+Ebq1AX
 DCJQgQbdGj22+C5MNrA==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699daa87 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zciMAKYT23bm1hcWLKAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93998-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9F75187E3B
X-Rspamd-Action: no action

On 26-02-24 14:38:29, Konrad Dybcio wrote:
> On 2/24/26 10:49 AM, Abel Vesa wrote:
> > Add RPMh Power Domains support for the Eliza platform. The list of power
> > domains is taken from downstream. Even though the cmd-db does list MMCX
> > and MXC, they are not used, so they should not be describe.
> > 
> > Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/pmdomain/qcom/rpmhpd.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> > index 19849703be4a..ef2e08c6b454 100644
> > --- a/drivers/pmdomain/qcom/rpmhpd.c
> > +++ b/drivers/pmdomain/qcom/rpmhpd.c
> > @@ -217,6 +217,27 @@ static struct rpmhpd gmxc = {
> >  	.res_name = "gmxc.lvl",
> >  };
> >  
> > +/* Eliza RPMH powerdomains */
> > +static struct rpmhpd *eliza_rpmhpds[] = {
> > +	[RPMHPD_CX] = &cx,
> > +	[RPMHPD_CX_AO] = &cx_ao,
> > +	[RPMHPD_EBI] = &ebi,
> > +	[RPMHPD_GFX] = &gfx,
> > +	[RPMHPD_GMXC] = &gmxc,
> 
> GMXC should be removed as well
> 
> > +	[RPMHPD_LCX] = &lcx,
> > +	[RPMHPD_LMX] = &lmx,
> > +	[RPMHPD_MSS] = &mss,
> > +	[RPMHPD_MX] = &mx,
> > +	[RPMHPD_MX_AO] = &mx_ao,
> > +	[RPMHPD_NSP] = &nsp,
> > +	[RPMHPD_NSP2] = &nsp2,
> 
> And this one too
> 
> Both are OFF by default ICYWW

Will do.

Thanks.

