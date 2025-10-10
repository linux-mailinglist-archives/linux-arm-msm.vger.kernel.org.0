Return-Path: <linux-arm-msm+bounces-76784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E125BCCC46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 13:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12CDD4059D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 11:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F15A286891;
	Fri, 10 Oct 2025 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJfYdRqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF67283683
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095573; cv=none; b=PhxuHpNJ4Eejb0ksue0ga6J4B2/17O7zsfbGXeGCT7zOiFNpz6AWKn/q2/Ik9skMmCU9ECw4bc4TxlHs5cuoiEeyLNvcf9A3/vfG+958u0S/8sssPObs7uywUj/OSQA3J3Twn/4Tbo/aowgK2ZhK0Gc0InlvXhlyKhKPPCB940o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095573; c=relaxed/simple;
	bh=6Bo+dMWznz6CJDgAuZf0pbGRVn+qJJMsLq70jo+7uKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ul8fsA5jIr201JrvxNYW4QNBWBAppVb0YEoTTdH5TI8QdNTjUq5/IyyI6coWI4Cy/fNtZQ6KV+vFf0Cb8gKfh6fkTTogDpfPjmkyALPeqC+wrzwnr/V4YbpVocs5EpXrhx2t6PoPVmYJD7aFAyn3KRMQRaNAKCvlyP03w0/8v8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJfYdRqv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6X2vr010103
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YjTw6cwvf+EzwrFNp2yvtWeK
	crxuiK34bX62Yekptmc=; b=EJfYdRqv43zJzHHh5+WgoHWxdiTWNzNlS0HBnOIg
	WqZswvhtNKttoifT8pHJc4PoxHiiu8+kMLRcIXWodWPaHdbok1VParxpWo2cINO9
	JUTFSM2njZI9jllMYDg/QRtO3++g6g6sLbsqEWR/1xGOEhcSjE7PVYpZeA9UIgDK
	3IPUH9GF6KaDTDAUmeB4get+kLDX9IsyX2OV83o/VTNeovIuTMrVY+BAWl5fXp3M
	8nBHU4xbZHqhYuloWFsp4Lovq7vq+PaSCpgbzFqscV/F7oLQRL0rezfqd9ZmzlNE
	+38jB5Qd5lIyfxtybLy3CkYl2IMeIq2/BUP6YEAxWAltkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nx5vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:26:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6ee6so40563075ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 04:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095569; x=1760700369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjTw6cwvf+EzwrFNp2yvtWeKcrxuiK34bX62Yekptmc=;
        b=Qrqcr6zRdXomH0Qo1ybR6PCcw55yBmOvOBkYJCiQrkqUZs7VzZN7ZLhYeM1t6ic8I6
         lmIvxS3OpH3h0MsYqlsVA59RGqcq3D1Ow3sdaRRGYZv3XqrMeP1Kr+eW3R6XUAxRKP4I
         bjAGnNu8lUMb0KjFhob9ZFiZ1HSmXz0fyB/s6Rsujl0jZx7dC4WYgzly51J73t9Bqj6n
         UqG7aX902/6Fs/nLeUu1lgruIQoF860JSiIym3zp+ejROf6/HaPFvVX9By63mpoWk+A4
         yjHQseV5+NB0IneoSjlR2M5Q+YsMoNtB+sldGjb63aWveb/tshxzTyew4H+l9fsdeKfk
         38GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1X0J5/urp/pKJFZFuh9a4Qd5Whoo/3dbAycpOUe0hLYjjuLlE/G5HlPv6SAI+ZHtRyUj8CMZwMmvMfdO3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+duKIs0G4xmN3dDIsraG36V/7WZvnpLZpmszt6dHDYKnwwbgL
	wgc+kZJaUWNL/drWS3CVHiZbCvfJ5q/bd31aUbHYxZJyAxSkV0+3vgRNEf9dUdJ0RlucDEf/BWx
	MTXRRvMjtmEbC8K7EakKfk2XRmTb1YWz4/g6p8zaaDW2U/jyAZ5j83bV9S7PgQDN1er+U
X-Gm-Gg: ASbGncsi668FyfQVobC2k3td7OiEA7ZR92NFuZHg/AqG3XNpSAljcz3smO4GFtaVIEO
	4EZ72mtYFQ7O61fG7GdA/Q/SJ15wsIq73jrKTgt1leYdeMa2M6mBy9kdhDiRZg4MzxNi+DiXx8x
	Nv/5GPMFHM+8BS6m4xgpKHuJKs4KprbiS9D3Zy1QSp4gS9wpE3VN6tcKlbL1UTd7bAx3R+quDaX
	U3OjtkaCVV5cn8w/5QcS6EX+vmz4pPs1Jmawy9IHRJFitu6JP6o2+QkVysy1nGAtqP19TcoJ8ag
	fnMwSv6dGAvmIJXyvBmDhPLngU9+1MCNAH+HCVbWC5UoKzFNQK+5OnzpygMClCoR/Yr/iro21pt
	UR8V3yLqiGRJEpAdpkvNbkMSU1Q==
X-Received: by 2002:a17:903:2292:b0:24c:bc02:788b with SMTP id d9443c01a7336-290272e3debmr164034965ad.44.1760095568887;
        Fri, 10 Oct 2025 04:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvO0FpYgQp0IMGYkL5703GWUNeNWrKfycoZKKdxfWaUNBM4IUaJx77lMkJGl5GXHmlCOnO4A==
X-Received: by 2002:a17:903:2292:b0:24c:bc02:788b with SMTP id d9443c01a7336-290272e3debmr164034505ad.44.1760095568365;
        Fri, 10 Oct 2025 04:26:08 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f99fbfsm54548675ad.128.2025.10.10.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:26:07 -0700 (PDT)
Date: Fri, 10 Oct 2025 16:56:02 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 14/24] arm64: dts: qcom: Update the pmh0110.dtsi for
 Glymur
Message-ID: <20251010112602.GA1372587@hu-kamalw-hyd.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-14-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdQH2jXcEY6ZpkmixvUt26SqdzYgDAiJ3RHMG7xkPyi_A@mail.gmail.com>
 <lcbcjpoazpwbltedkiqlw4l3aomwvi3qsfwvmwghb6uf5wvnme@kh7qdpunfuwr>
 <CAJKOXPcyhDdFW_u4YQLiHYj8gM7wYB-LOmB_PJs+5OOgn8WZFw@mail.gmail.com>
 <mzoctelzfp6h2ezzkc3j7gnghsaf67flxqlvfhtlpdfxtddsvi@zqihmnygvdjk>
 <20251008073123.GA20592@hu-kamalw-hyd.qualcomm.com>
 <799374b4-0c41-4ccb-9f99-954c7ce6d044@kernel.org>
 <b784387b-5744-422e-92f5-3d575a24d01c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b784387b-5744-422e-92f5-3d575a24d01c@kernel.org>
X-Proofpoint-ORIG-GUID: Gngu9_Jnr5vlo8HSSQ8-NTeA4djxpKPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0eA4VoJfxINE
 mL3lJjU1D+2kvvmh+r/9zzW39N+/vAja/+5k+tAp6dnzwzNAdjreCE+IyTLa9JFqLJRyq2dx+i7
 HTmjbQLXVYInTQIwDDAKx0OJ4scwderhdlkf2HNECR8nGSS0yBa4vFsnJTmm9URzIc4BQG59Xo7
 tmouD5Gxtar5Botk+74+BozFacvrLAHbmCgG15jWAO0yogSFX4KO32Y4uGZGNZT5ruHeGovTaQK
 41JBYhodIxLTs2ZAnJ8Px0KPU3xOqD2X7Tj2ER7bTlaaj6f6QkwR7KpNT2STKt/32cbJsBbPxRm
 7DoRPzdjmMv+9Milzj00iVbGEV37VwV05V41xFvvESU9oEAjQb7mYx6ofR0CnKSIErawLQSDYL2
 grdhoSQ4trVz0+gouSqKSmC64SeBdQ==
X-Proofpoint-GUID: Gngu9_Jnr5vlo8HSSQ8-NTeA4djxpKPu
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e8ed52 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3Sf0hwScZu_tUxBfG8oA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Hi Krzysztof,



On Wed, Oct 08, 2025 at 08:25:51PM +0900, Krzysztof Kozlowski wrote:
> On 08/10/2025 17:02, Krzysztof Kozlowski wrote:
> > On 08/10/2025 16:31, Kamal Wadhwa wrote:
> >> Hi Krzysztof, Dmitry, Konrad,
> >>
> >> On Thu, Sep 25, 2025 at 09:57:02PM +0300, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 25, 2025 at 10:34:52PM +0900, Krzysztof Kozlowski wrote:
> >>>> On Thu, 25 Sept 2025 at 22:14, Dmitry Baryshkov
> >>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>>
> >>>>> On Thu, Sep 25, 2025 at 05:08:54PM +0900, Krzysztof Kozlowski wrote:
> >>>>>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
> >>>>>> <pankaj.patil@oss.qualcomm.com> wrote:
> >>>>>>>
> >>>>>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >>>>>>>
> >>>>>>> Add multiple instance of PMH0110 DT node, one for each assigned
> >>>>>>> SID for this PMIC on the spmi_bus0 and spmi_bus1 on the Glymur
> >>>>>>> CRD.
> >>>>>>>
> >>>>>>> Take care to avoid compilation issue with the existing nodes by
> >>>>>>> gaurding each PMH0110 nodes with `#ifdef` for its corresponding
> >>>>>>> SID macro. So that only the nodes which have the their SID macro
> >>>>>>> defined are the only ones picked for compilation.
> >>>>>>>
> >>>>>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >>>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >>>>>>> ---
> >>>>>>>  arch/arm64/boot/dts/qcom/pmh0110.dtsi | 66 ++++++++++++++++++++++++++++++++++-
> >>>>>>>  1 file changed, 65 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/arch/arm64/boot/dts/qcom/pmh0110.dtsi b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> >>>>>>> index b99c33cba8860f1852231db33a127646c08c1e23..4a5c66e5c9fbc35cedb67601f4568844dc41fbea 100644
> >>>>>>> --- a/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> >>>>>>> +++ b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> >>>>>>> @@ -7,6 +7,8 @@
> >>>>>>>  #include <dt-bindings/spmi/spmi.h>
> >>>>>>>
> >>>>>>>  &spmi_bus0 {
> >>>>>>> +
> >>>>>>> +#ifdef PMH0110_D_E0_SID
> >>>>>>
> >>>>>> NAK
> >>>>>>
> >>>>>> I already explained on IRC in great details why.
> >>>>>
> >>>>> A short summary or a link to a channel / date would be nice in order to
> >>>>> include other people into the discussion.
> >>>>>
> >>>>
> >>>> Of course but:
> >>>> 1. You were there so maybe you remember the arguments, and:
> >>>> 2. I'm offline, using phone, not having laptop, replying during my
> >>>> personal time off just before merge window so any emergency time
> >>>> should be spent on important matters instead these two huge patch
> >>>> bombs adding such usage I already said: NO, don't do this.
> >>>
> >>>
> >>> Well, If I'm asking, it means I don't rememebr the discussion. And I
> >>> defeinitely didn't know that you are spending your personal vacation
> >>> time in ML. And if the discussion was with some other people, then
> >>> somebody else can drop the response to the question.
> >>
> >> Just wanted to give some background on this patch.
> >> Even though PMH0104 and PMH0110 are common (b/w Kaanapali and Glymur),
> >> they don't share the SIDs. So we tried to use status="disabled" to handle
> >> this but we observed that because of the node name being common in the
> >> two included files, it ends up overwriting the previous node with the
> >> same name.
> >>
> >> eg-
> >> #include "pmh0104.dtsi"  // assume contains pmic@4 { ...};
> >> #include "pmh0110.dtsi"  // assume contains pmic@4 { status=disabled;};
> >>
> >> Here intention was to use the pmh0104 on sid-4, but it gets overwritten
> >> with the pmh0110 on sid-4 ( with status disabled). This is why we ended
> >> up using the `#ifdef`, ensuring that we can control the exact pmic that
> >> gets picked by using the PMXXX_SID macro.
> >>
> >> side note, i did `grep` in the `/arch/arm64/boot/dts/` and i see a lot
> >> of instances of `#if...` present in that.  Assuming the concern here is
> >> about the use of `#ifdef`.
> > 
> > 
> > #if are not desired in C code, so why would they be acceptable in DTS?
> > It is not making the code easier to read at all.
> > 
> > On IRC in these older discussions I was very strongly against any DTSI
> > which depends on some sort of outside values, except basic usage of
> > defines. Original pmh0110.dtsi from kaanapali is fine:
> > 	pmh0110_d_e0: pmic@PMH0110_D_E0_SID {
> > 
> > but doing ifdefs here that this define depends on something else makes
> > code ungreppable (lookup unit address from sysfs and then git grep
> > pmic@4) and difficult to follow.
> > 
> > My recommendation is either duplicate code or change DTSI files to not
> > contain entire node, but its contents. At least these are
> > recommendations I remember now.
> > 
> One more recommendation:
> Different DTSI files per SoC, so pmh0110-kaanapali.dtsi and
> pmh0110-glymur.dtsi.

Thanks for this suggestion.

- So for the common pmics between the Kaanapali and Glymur, we are going to
  postfix the soc name. 
- Files pmk8550.dtsi, pmh0101.dtsi which are exactly same between kaanapali
  and glymur we will continue to use the same name.

This is how the #includes will look (after dropping #ifdefs)

+#include "pmk8850.dtsi"        /* SPMI0: SID-0                         */
+#include "pmh0101.dtsi"        /* SPMI0: SID-1                         */
+#include "pmcx0102.dtsi"       /* SPMI0: SID-2/3/4/6  SPMI1: SID-2/3/4 */
+#include "pmh0110-glymur.dtsi" /* SPMI0: SID-5/7      SPMI1: SID-5     */
+#include "pmh0104-glymur.dtsi" /* SPMI0: SID-8/9      SPMI1: SID-11    */
+#include "smb2370.dtsi"        /* SPMI2: SID-9/10/11                   */

(hope this is alright now?)

Regards,
Kamal

