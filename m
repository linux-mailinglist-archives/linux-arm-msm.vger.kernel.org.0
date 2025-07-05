Return-Path: <linux-arm-msm+bounces-63828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD7AFA0C2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 17:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953E617F705
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 15:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE48156237;
	Sat,  5 Jul 2025 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUmoXLhD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88A71D5165
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730764; cv=none; b=jEYmQiPIOy+xJTlIF9PbQSzQdR1sgKOG/ThfSOcVTZnFAh52tFZ0Yi0hbibddnqMgDdt7hIaUJ/adr6txu3/3sCdRWPVkNwgjcNIYW0yck/Sab4qRFBpN8/miep9JuoyhuqKY8vBlkaHrYhODbLTodzufRQPoaFIg0P3zkR4p5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730764; c=relaxed/simple;
	bh=xhWwgrpgmcVVry6NuCIENP9udmw+xY1OYwdHA3H7Jvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=re2Cu29kCRrPyEFK2w6tY0zWy7dYSWnFlQMM9r/giXZEK4EMu0x0gmAaE0bqVIJlmC0Nq74ufEQKX1pT0HEM+99BhDOAVX0q8kVWnw59gEW3pyI2/bSYrz/SJ/Uvl8A2equqmFCIcg3MJ2qeVkf6KlcG9NsMPU7FvcLfmK8w8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUmoXLhD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FjTrs025336
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 15:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6nEgEic99UhCA7mg8krwNctb
	NQ0OLwPSREGsrjw5rak=; b=OUmoXLhDdqoxYwgyY1EnvQq4cl2cjjaLQhkf9VSQ
	XNGK6nyfhqQFlpBC/ObNAAqcZ8bcBZx31lU49FXhX0hOl0etwCZDEZCtcOsjA+tb
	00gj9hjh/URsiSx7ASnKeC/d6qvJOdlQKCsb6StJVfmKZEZIBV95d/QAjPZu/LnG
	A2++q/h4P1QTOfsfl7yMF3nltsNGdLUFefsRrLkauBG7ZJIYqPgjc2pcG4vTaOU0
	ryuVjsdSNRPrQoOpw8zDpVIrchdzb55ISvF7sdSiF7dX9NixFACSnwcz0TkjAg9L
	ozUfTCJGIHQeo7Mbz70niKkSMdbWC17T69OLZ+fjiLqZ4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun21fk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 15:52:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d5e345a3fcso131526685a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 08:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751730761; x=1752335561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nEgEic99UhCA7mg8krwNctbNQ0OLwPSREGsrjw5rak=;
        b=brVqN44R4vUhwiNrD8vQ/8049RdsC/kt6UFM6lFYsAUItx6CTAsSFgzt2i2pyyUaYT
         76V0W+c+3hDsdMjhCY8B1ghr8Ug2XVHkI9445ou0matnTaqxGQ4XMi9Zvwyh6JJuU9R+
         AQZPJcfZ9rEdyxF/66d7Kbjbbp+lHs965VMLujS3F7lL1vB67B0Dw1uBm9MwXDI0d/3J
         eM5zvpHf8FST/fR0Chyl4KYscTkiVcitBqVLwb2+fcLUEofolEav8g4oTIHjQqHIry5t
         4WsEPJDvFm27bQsn3Ts8kBB6q4TrmmTiPO/1WuQJyx9W54I1wicp37DGKjp6RDmM22zD
         /yJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhg4wxlP94VEJPBZrqODtPdNa+YhNck82jCZTpGa6geWiO1VM00vdIeRwZyoA4jBGOI7Ma58ePIiuoF0JV@vger.kernel.org
X-Gm-Message-State: AOJu0YwuOgxSMZMA3hIr4D1xk2Vk1SRQbBT6EeOqItwnkHSWiKvZp19Q
	R2or7W1GboGO5/IGTAig3xyT/DFXuXClhnS2jdcBVzX34aRwgYjPhlMmvGf0fXTkrnXOaikNyY9
	qDr1f86xCXc+/rnhgKkW5AVcH8kubvPpadnmG4D+mf/zEpMP5vQ4g8+fRCsL6iYHMvMHG
X-Gm-Gg: ASbGncvx8gVRvqtQVIrYh+85qLA8iW86xLOLHPxAI6agncnpJWz9WuwKFvl1YrQ7Gw0
	SbDv3ug4E6mvNn1LB+6RvWngaV7yWNNergP3JmPLfW1WAxUsFecqeVcEFWtMKkwJ97cu0ByAGcf
	fuu6YizWCThXe5791flbcuLYjpwtXxaSAkWTFNsmkJVME6JnagZdAlW3yABMYqfDvr6Iwn5AnCk
	B8sKgFis8wnNbUDQA9oMFM0DlDNC2jyNNEk00rBryVkgVIlr3uS13kocVikAxb+9RnIM5f5CCPu
	jzeljq5L6p2JsST1yJlxVR3agCrsVF89G2CucBjtyVbpCNlNu3Y8yyIyo1LTRSXUJiR9wBkorXy
	Hdrgt4ztyYOLISzj7I0AMHuxeHs1J/DlPIdU=
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d5dcc7603emr945851785a.11.1751730760547;
        Sat, 05 Jul 2025 08:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0YpcL5JVK8jKhh1AjM9vUcniIfH8EhFGQIv0JsaMl3Ukaei3i7V58vlU6Zg2fDsQwqQTfEg==
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d5dcc7603emr945849885a.11.1751730760115;
        Sat, 05 Jul 2025 08:52:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7272sm604713e87.196.2025.07.05.08.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:52:39 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:52:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
Message-ID: <yjz3rxpwgl5u2cmgs3yf3qhkbpflo455pewbkgxe62qp5jjaim@5xpinflzvflc>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
 <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
 <225b94a0-eea5-4061-aebd-da497d349527@oss.qualcomm.com>
 <2e338f72-c676-425c-a96b-1cfed466f9fc@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e338f72-c676-425c-a96b-1cfed466f9fc@lucaweiss.eu>
X-Proofpoint-GUID: cQ111OrJsZ0-u8LYAUf5MeD4rzBdeE0u
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=68694a49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=26E2V3-60KTWSeZm1QEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cQ111OrJsZ0-u8LYAUf5MeD4rzBdeE0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX7d8xtpUK6+ON
 hZeBb0NTrO3gu060vGDHXap92ITwP8b8QcBlCPK8LZJzmithY7cDkZZpwkdl0NaHITGJnXfDXK3
 znIGem060RcQyfj3wnPRFM0wLiSTwsfnxu7Ih8cvi3dMJ4h7FuTnhYh5qq1LOsVGMNXQVg3Iae+
 9GcWmpjVsRUf9Kdbfq5wAibHhQky1swD6Onsj310Hb8BEev42Bk4er+jPTD0kVB9owMXVlUm3vp
 V3j/9lhb61HfvCLoKzH8F2rARalOAr6BEbX1MRhzccGt05mJVAxaPwKP/XCt29vkYSTo9QSGNbZ
 jkLa/PUtngLmzu7IFZmNYM+GI+0K0/r6zsv2RC97xo37A2MaH92QxXkp8E82YiBk98S+G9xwWM5
 U4+nr3nv8thSHo1OGJ5azLCgrYFTEH21+QoMz4qaY4Uz/R3sIcx9g2zN75LCqWdIyBTRjeyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104

On Sat, Jul 05, 2025 at 04:16:44PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On 24-06-2025 11:03 p.m., Dmitry Baryshkov wrote:
> > On 24/06/2025 21:46, Luca Weiss wrote:
> > > Hi Dmitry,
> > > 
> > > On 24-06-2025 2:59 a.m., Dmitry Baryshkov wrote:
> > > > On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
> > > > > Switch over the ADSP PIL to use power-domains instead of a regulator,
> > > > > and have one commit switching over the MSM8974 SoC plus all the devices
> > > > > to use power-domains.
> > > > > 
> > > > > Note, that I'm aware that these changes are not backwards
> > > > > compatible and
> > > > > not really bisectable, but since it only affects the ADSP on these
> > > > 
> > > > Why? The cx-supply is handled unconditionally. A single-domain usecase
> > > > is also handled via a special code path. I think this might be
> > > > backwards-compatible, by the pure luck.
> > > 
> > > Honestly I have not tried and not looked much. I mostly added this
> > > paragraph to avoid the response that this change might break and is
> > > not really backwards compatible. If it does (by accident) work with
> > > the updated dts without the driver and the other way around, then
> > > even better.
> > 
> > I think it's worth checking that new kernel works with older DTS (that's
> > the usual rule). The platform doesn't have many users upstream, but I
> > think it has been used by some PmOS users, which might mean not-yet-
> > upstreamed DT.
> 
> I was finally able to test this, but the patches except the dts patch does
> not work.
> 
> [  170.802573] qcom_q6v5_pas fe200000.remoteproc: probe with driver
> qcom_q6v5_pas failed with error -61
> [  170.803127] remoteproc remoteproc0: releasing adsp
> 
> I didn't take much more of a look but probably adsp_pds_attach fails there.
> 
> For postmarketOS users, all msm8974 mainline devices that are packaged as
> part of postmarketOS, come from the github.com/msm8974-mainline/linux fork,
> which included this patch already since a few releases. I'm taking care that
> all out-of-tree dts that are in that repo are updated.
> 
> Fortunately this is just breaking adsp probe, bootup still works as before.
> So from my side again: I think it's not worth the effort to add a bunch of
> complexity to the driver code and support this use case. I'm not aware of
> any msm8974 upstream users that would require that.

Ack.

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

