Return-Path: <linux-arm-msm+bounces-76309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86FBC3A37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 09:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F65D4F7CB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 07:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855C22F619B;
	Wed,  8 Oct 2025 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOC+N/pU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286F2F60B4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908694; cv=none; b=IFrKQedqkAw47EAiAjPRcpabfAEAZAkGTiobnplRdjx2osNvkTbWHc//U0dmq2ZuY2n3emdQnDfMja5q3rbm0C2bQ0RKYQ26vLo6pd0xOYH/Xg9YOfLgIMSS8LS5P0aPGhC2/OnrDiM0eHePlsLnBf6grqe/LQqeIkh/y5lu3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908694; c=relaxed/simple;
	bh=ln6sKcZOKPZ+XGO7m2rvWcGsZmm59wEyyrCSMtyXxXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX+mn9a/zx043Shk35w6laAQVip9h0euyR7qeFyTGNQSFzJAuFFufQcd+F2+wTY65h4cq66lgldl65Kx9cO2Vf++lksa7RVWyRXEHCHk4zLQEigY8XyzqtKoduA6KX9MYQ1lg4RUDNYZfmCj4mpoFHzJyVipMkLl7K2PRitIrCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOC+N/pU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803VSJ023188
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 07:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cv0p3chaZUKm1oNKGTLwDf2U
	C5ikXunO3QBpHUXSjv4=; b=UOC+N/pUwDHkEKXf/eRqgIaR+H6fwZjE5C6mMe6c
	GwjBpjeM+WXMB5JkBMYCUuSlDuKh/L0zb8CAuuh/V9Q+NXsnrq0Z/MAu/GxA/4/I
	nUBTeOHAafA988dwhBnYROp3feBMTtFnSbKUzzOijEXN3Vc3J8aNwDaycd5LO/+E
	RzJaS/Q++D4S+FneSqFXUdkIc9R6WrA/ZVwmZliCqGMZZDLOy4I9liWke6iHbeoy
	Cv9QLu7jpLYg0V+3i03BfMt5DoFUr9Rh0nJ62ZE1QWssSvpeEzBdpD337S0X9Jf5
	vQlAc2BnRYxdTeb3n0EMnsHdwLeFGbGHSfqWmOzjtWMS9A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk71py0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 07:31:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7810289cd5eso11718212b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 00:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908690; x=1760513490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cv0p3chaZUKm1oNKGTLwDf2UC5ikXunO3QBpHUXSjv4=;
        b=M2kKcRCYMtvg9XAEXpQP9u9pvcoJ45q4Apo8b4KCgQ5LicSypkVE0JZ8ujHKuVF6I7
         nlERvpDUlbrM8qHgLgjScnZDYJy62dHfI9z4i7wA9+G2c2oHfKVW/PhRmZuQCxmdyQkh
         25pqdx9wdoyO56vQlNd2Z+8Ao2zNILE+PbTfvr8f5MliuoxOjwUM61A8hpEap4mMMULs
         47yxXqvxcc5ZMsCUg/c6aW2p23VN/HmDCC5/L5gVKNWbprcYhD3pR8mjgWRNYSwK04Tb
         wOcfT9a1t6mMqXzNlXXtpEZOsR5lIupXcTNUg4ZXGvfY6mh94sDCaGk2awHFmtO3kziW
         fYpg==
X-Forwarded-Encrypted: i=1; AJvYcCXOK7/C7+mvysBRWbQYWMsIUdt6fj2T0+IyJzzXT8uO/Hm98WjoPPJWsGJdH1Tk4mO4rdAwfkygeNA1J9B7@vger.kernel.org
X-Gm-Message-State: AOJu0YyBvWjm15E6qqyL/dqlop/7p2i6bGg3256NlUVwPD2grG0TmD2/
	9eX+Gh8hJEsm/FZmi93ypOrc9lV3SASjD4csToJDXgg2VIHdBB1Q3kV6LpzbvuVw6IgYbbMtjub
	2hnD4aQjcwOw0b5uX9Ez6Ji5na7Bjf/CF+RHWO04Y+WmW181Yt51yD3eOuZqvghBHQSZt
X-Gm-Gg: ASbGnctCOgazdronmCXqqZdswZ98PvwO9IHfRAziGdMIe9J7Rakm+f2Q8wDI3BlWW40
	oyRcLr6ZIETQe6lJgANSg/wVFUqgy5IlLm8gZ7bd2bxlhsl+8utcZftncf9Eqpq6eXmFjkFyvUe
	uP4RjWYWEycPrZTefYPW1YyIu+3b3eHT03wnVu0gVMT6xcMRB1tm/+0TqMjCn7HBMfzhTns6GEL
	YtNk3eyhOuKwExQ/Z0sdoqP+ADvBE7WCgJs1yh12wIMcLK4+1Xx8tXlKUQMkFYVsXwXXf0F4RtD
	JB0LRy54J4QM9KJ5Sf1Z/Nz0WlpzcXHrSe1f6AedQR8WZHrOzFI72U80uC6pi4M+abfEXs5vpvt
	2FkrrNyzrbSV+TkwQOz0wSEJEq/1KL4k=
X-Received: by 2002:a05:6a00:8d5:b0:793:1b79:ee61 with SMTP id d2e1a72fcca58-79387434292mr2799350b3a.22.1759908689534;
        Wed, 08 Oct 2025 00:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0PtpfjSD+k9WPCixY0Bm3Le9er/Wn83Bo+pYbYYWeIL3zSfYVwydxkKlBtco/P3dMcZCISg==
X-Received: by 2002:a05:6a00:8d5:b0:793:1b79:ee61 with SMTP id d2e1a72fcca58-79387434292mr2799323b3a.22.1759908689052;
        Wed, 08 Oct 2025 00:31:29 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9daccsm17552074b3a.16.2025.10.08.00.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:01:23 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/24] arm64: dts: qcom: Update the pmh0110.dtsi for
 Glymur
Message-ID: <20251008073123.GA20592@hu-kamalw-hyd.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-14-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdQH2jXcEY6ZpkmixvUt26SqdzYgDAiJ3RHMG7xkPyi_A@mail.gmail.com>
 <lcbcjpoazpwbltedkiqlw4l3aomwvi3qsfwvmwghb6uf5wvnme@kh7qdpunfuwr>
 <CAJKOXPcyhDdFW_u4YQLiHYj8gM7wYB-LOmB_PJs+5OOgn8WZFw@mail.gmail.com>
 <mzoctelzfp6h2ezzkc3j7gnghsaf67flxqlvfhtlpdfxtddsvi@zqihmnygvdjk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mzoctelzfp6h2ezzkc3j7gnghsaf67flxqlvfhtlpdfxtddsvi@zqihmnygvdjk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX1ImHIUuBqm+T
 pk76ny+0UYLhzsfHXSpXkC3mDCgnQIrlqbCSw1VN8muF49M2OhK+RGg5HKg+5L0pVyzN4xNySDd
 g+DrHlV2mCmnZlu00xjRICQO2v0ULtiY5tSWo8tuctidKfKwMet6OsGOBUkwf9ndOU1S2xbXvYO
 eHkZclcDGEkLNrlzw2pbTNxkuCHnPkRtfONh+fhUuCvGNgHvyNdfcU2r2yEisXi1Tt34x2HkxbU
 kDHGP9ePd3kTG7VdkXWOAQml7pbbFDHJK1Ogzg1na1e8jJM0EMheIoOQro1I/RRTc6G9Q3Twwkx
 ubVop9AVVDtmXM6AQl2ysaQDRIcrjGseTOgRCLcKMPq7MoGWHkGwNr3aS3kSHf9/n+IeEhCH9mM
 ut3860RpD04FChVOhH4uAdj4x9j7hg==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e61353 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=CcCa3DaCAM46YlkYK6gA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: U0MY59KzlQdZjG03SR5uo0VtW52zMhVk
X-Proofpoint-ORIG-GUID: U0MY59KzlQdZjG03SR5uo0VtW52zMhVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

Hi Krzysztof, Dmitry, Konrad,

On Thu, Sep 25, 2025 at 09:57:02PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 10:34:52PM +0900, Krzysztof Kozlowski wrote:
> > On Thu, 25 Sept 2025 at 22:14, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Thu, Sep 25, 2025 at 05:08:54PM +0900, Krzysztof Kozlowski wrote:
> > > > On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
> > > > <pankaj.patil@oss.qualcomm.com> wrote:
> > > > >
> > > > > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > > >
> > > > > Add multiple instance of PMH0110 DT node, one for each assigned
> > > > > SID for this PMIC on the spmi_bus0 and spmi_bus1 on the Glymur
> > > > > CRD.
> > > > >
> > > > > Take care to avoid compilation issue with the existing nodes by
> > > > > gaurding each PMH0110 nodes with `#ifdef` for its corresponding
> > > > > SID macro. So that only the nodes which have the their SID macro
> > > > > defined are the only ones picked for compilation.
> > > > >
> > > > > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > > > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/pmh0110.dtsi | 66 ++++++++++++++++++++++++++++++++++-
> > > > >  1 file changed, 65 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/pmh0110.dtsi b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> > > > > index b99c33cba8860f1852231db33a127646c08c1e23..4a5c66e5c9fbc35cedb67601f4568844dc41fbea 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> > > > > @@ -7,6 +7,8 @@
> > > > >  #include <dt-bindings/spmi/spmi.h>
> > > > >
> > > > >  &spmi_bus0 {
> > > > > +
> > > > > +#ifdef PMH0110_D_E0_SID
> > > >
> > > > NAK
> > > >
> > > > I already explained on IRC in great details why.
> > >
> > > A short summary or a link to a channel / date would be nice in order to
> > > include other people into the discussion.
> > >
> > 
> > Of course but:
> > 1. You were there so maybe you remember the arguments, and:
> > 2. I'm offline, using phone, not having laptop, replying during my
> > personal time off just before merge window so any emergency time
> > should be spent on important matters instead these two huge patch
> > bombs adding such usage I already said: NO, don't do this.
> 
> 
> Well, If I'm asking, it means I don't rememebr the discussion. And I
> defeinitely didn't know that you are spending your personal vacation
> time in ML. And if the discussion was with some other people, then
> somebody else can drop the response to the question.

Just wanted to give some background on this patch.
Even though PMH0104 and PMH0110 are common (b/w Kaanapali and Glymur),
they don't share the SIDs. So we tried to use status="disabled" to handle
this but we observed that because of the node name being common in the
two included files, it ends up overwriting the previous node with the
same name.

eg-
#include "pmh0104.dtsi"  // assume contains pmic@4 { ...};
#include "pmh0110.dtsi"  // assume contains pmic@4 { status=disabled;};

Here intention was to use the pmh0104 on sid-4, but it gets overwritten
with the pmh0110 on sid-4 ( with status disabled). This is why we ended
up using the `#ifdef`, ensuring that we can control the exact pmic that
gets picked by using the PMXXX_SID macro.

side note, i did `grep` in the `/arch/arm64/boot/dts/` and i see a lot
of instances of `#if...` present in that.  Assuming the concern here is
about the use of `#ifdef`.

Can you suggest some alternative approach?
or comment on below approaches:-

1. Can I use `pmic@pm0104_d_e0` ?
This may work but looks like a departure from the current format
i.e `pmic@<sid>` used in the arch/arm64/boot/dts/qcom.

2. Create PMIC-ID based pmic dts? `pmh0104_d_e0.dtsi` and likewise add all
pmics? But this could mean creating too many pmic files and end up
bloating the dts/qcom/ directory.

3. Add the nodes directly inside glymur-pmics.dtsi ( not using #include)?
It may make the file too long and IMO it may take slightly more time, to
look at the file and tell what PMICs are present and at what SID.

Please share if you prefer any of the above suggestions? or a completely
different approach to get around this. ( or if the current NAK'ed patch
can somehow be improved still? or share link for old discussion so i can
study it)

Would value any advice that you can share. Thanks in advance!

> 
> -- 
> With best wishes
> Dmitry

Regards,
Kamal

