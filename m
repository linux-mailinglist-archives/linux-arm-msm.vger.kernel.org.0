Return-Path: <linux-arm-msm+bounces-72412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03398B47843
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 01:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB9685814E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 23:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38942848A9;
	Sat,  6 Sep 2025 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CthncvNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9028136F
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Sep 2025 23:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757199780; cv=none; b=Mu6i2Bc/I3XisN+968oPJV10f1n8+hf38WbodkuUQxPx3FrNnuSFrYll7ChAnV6iteBWZuyjG1zKSjDnyLljT35tIzTe/UyubSaV6S0gUacqh03jqiA/yMwtOB0RtMPcG1BGv/+yiXJTzgcxegCGpQFo2Y5t6684x7JHrZYfURI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757199780; c=relaxed/simple;
	bh=bwiYXRNGcoiajeEM+Tw5uBkd8tBUcQ8HypuC39S0bi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbCx8KErbdx02AGZwWLD5VHwWFequ1+AhldYwc9qIScOCrq7du7XYCmfYXfc1Q4O7g9oemjWu0Le7clhRDZakUP/pHRxNrFcya7yKX8brY6fnuGpKJQcwRXjm4MKT1SnKNkViMMAw4omJmjftdUEEYqBPxuCs5sg1enCogQLZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CthncvNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586LSmCc006772
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Sep 2025 23:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=7tSKwHt+Ek7jPABcGiy8/Q+CLwEcgRigyVjo1Zw5A58=; b=Ct
	hncvNWlMgzrXgTeBlvJleX/TQnEv0gWDzpbuHTLcAP1F5iF8ered8rp+ZJNQgp+F
	Wg8u1JXm2yYwCSiRygdMJWhVbHaOyQs6c3kq3nnKdxg4CdDx3b1uDk+tkzyjepdu
	fYTk1kvJLA59Ndsb00fb2wiVn1yGPnNzZ5tsTw+/VXoE50Sp8TSBg/ca7g/J6tcw
	HSyiYXWFfPyCCow+9xpdSEiQjeL+Gj+nyZ8YquEZf5NkQgUjNeYtU/iJ8U83ft3E
	Ptolv2skC1Bx0R2eMs/+vKQlcKTYsZiYGvG9UhcpYhuGV8c8CyBa98fxiSS/xzyp
	NntjyvLbZ6d96tmaxeUw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j1c4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 23:02:57 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-30cce8e3ceaso5381939fac.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 16:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757199777; x=1757804577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tSKwHt+Ek7jPABcGiy8/Q+CLwEcgRigyVjo1Zw5A58=;
        b=B0s1vST+wbf74ofVCRkvpDW20b32IQY0guIChBNO8OYfjh0MLVtqpBIMrhXTbY8O2y
         ErzSsBV+Pq2HeDLhh+LvmaKEts4x2yFJSjvvfDyR0w1dXRTbUWI/1CjxxBzI4+rQ/nDI
         7tm2vhjdJnYrgNbFTpn5PMfp2sjy3gHF6tfU/RDfbL6J+OMEEBJ/VmC7tkeRMcw2bX/y
         URn2SPBHtOxIG/VDeJ9MPYe7dj9dPcqTyta+wBvDgFL/qXo0sjRjyssJstbtJ4hlwgfX
         T9ekDlK/IglOc5MPTRS8UyflBtK65cwNoDasY/aJ5S1ixb1mGMWuAa2gRFJvxqbWEIFq
         zQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1w4rfqofhr79ns9h9uP/WvWpLX3rKngO2OPYeLx8nieOUwgSQuslwHP+pzMOruJG/0VJ56cw2QsyXogeU@vger.kernel.org
X-Gm-Message-State: AOJu0YzNA/q+x8io+GyqrpcW/vbc5gX83vXI4QRfnM6tp18fDQnhXn5E
	EqT+dQTj9rxLKxPRG24lNFcnzyfH1i3UE1VtNcTmA9AuY7IWr6UpPgqSPkkD1G0ak8NzaxLx17K
	h7QY4GnzOCgFB/McMGtWLfb/LZcaAARsI1dS6gNlOCRxPa0fBEwF+mUgvrLBe/zo4kSBL/jB3Oh
	v95WTwFwUNqOV/Pd7vcov+2y6aX8bQ7ULjJmFm3fNQ7E0=
X-Gm-Gg: ASbGncuhKfOQZeSGwAwyqEb1hG3BksGPKdxwZxuRevVrasOSgFebDxRqm/Hp3GgFaMI
	Kvxu9KH2d3Me44Ypd+mUQHozmzGfLYr+yArxRQ0sb4TzeyDjxT418z1FvkNGn4EJZtsKVIxcGrH
	sCkZppcwOkvC8MkVorlNxvzId9eoZSScxlGiaq6lLCm0UCpCfG977x
X-Received: by 2002:a05:6871:e7c3:b0:315:b768:bd1d with SMTP id 586e51a60fabf-322627465d3mr1588938fac.6.1757199776941;
        Sat, 06 Sep 2025 16:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGNyPtWK7XLr6Z6Y8/0D04LJKsr8cN92FCpDHkSHR8k+zYD6ZV/6YLC5AI8gQTcKpJUSvoMi6UIajR6FAY6mg=
X-Received: by 2002:a05:6871:e7c3:b0:315:b768:bd1d with SMTP id
 586e51a60fabf-322627465d3mr1588917fac.6.1757199776584; Sat, 06 Sep 2025
 16:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com> <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com> <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
 <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com> <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
In-Reply-To: <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 6 Sep 2025 16:02:45 -0700
X-Gm-Features: Ac12FXyzTpMUMaTsNWSW0MM7Xxq1e9X2ZKWgxsNm2xNI9hIOPJ9JgBv0CoKpoCY
Message-ID: <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX6N/eNvV4zn3r
 7QwDx+ZYBN+9ChXnzpEdiPiW+emu0dK9Hp+awbwY8n/2LsBHA3KRiN7fh7XmO8xDUbDOc3MnGxn
 9G/Gg5zj+moPI5xNtXaaK6/X/itB8BiwirBYqcczn1sb1XF5aAJuZW0kBa5l+/guyG2vhTbgyvZ
 wrSkx2p+NSSweXh7gll8PpHC5L4+V9/y7mFQwIHDnNc14O9WDZTcrOfmFU89RNXwMxC5vP0J0VK
 O1mLoBjVpjmiNWIwdLlBHiO035UqM800oO/QtpskLkcGxTlTw0ON1nkIja+oxNKQaww1VqoPKn8
 Fs12bOrrW5uBsty+k8te8ns1LFsA4GemijpSvcB3GcAvaRNOBcODTe4xU6AXIcbfUW7rBrNDi4b
 MSDA3O+3
X-Proofpoint-ORIG-GUID: 3om76gE-EHdJ5cHCE0MfEeufRvYafwvk
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bcbda1 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=M6CliHif6jTRLK_rbtEA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3om76gE-EHdJ5cHCE0MfEeufRvYafwvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On Sat, Sep 6, 2025 at 1:56=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
> > On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
> >> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
> >>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
> >>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
> >>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> >>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>>
> >>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
> >>>>>> SKUs have the same GPU fmax, so there is no requirement of
> >>>>>> speed bin support.
> >>>>>>
> >>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 ++++++++++++++++++++++=
+++++++++++++
> >>>>>>  1 file changed, 116 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boo=
t/dts/qcom/lemans.dtsi
> >>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db923010=
5ad93ac22287850b6b007c 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
> >>>>>>                          #mbox-cells =3D <2>;
> >>>>>>                  };
> >>>>>>
> >>>>>> +                qfprom: efuse@784000 {
> >>>>>> +                        compatible =3D "qcom,sa8775p-qfprom", "qc=
om,qfprom";
> >>>>>> +                        reg =3D <0x0 0x00784000 0x0 0x2410>;
> >>>>>
> >>>>> len =3D 0x3000
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +                gmu: gmu@3d6a000 {
> >>>>>> +                        compatible =3D "qcom,adreno-gmu-663.0", "=
qcom,adreno-gmu";
> >>>>>> +                        reg =3D <0x0 0x03d6a000 0x0 0x34000>,
> >>>>>
> >>>>> This bleeds into GPU_CC, len should be 0x26000
> >>>>
> >>>> gpucc is in the middle of GMU, see other platforms.
> >>>
> >>> This is not the case here
> >>
> >> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU C=
C
> >> registers directly from the firmware.
> >
> > Correct, however this is only a similarly sounding argument - the DT
> > describes the hardware from the main Arm cluster POV. The GMU Cortex-M
> > core has its own address map etc.

but the firmware is part of how the hardware appears to the main arm cluste=
r

> We have been keeping GPUCC region in the GMU's reg range in all chipsets
> for the purpose of coredump.
>
> Can we leave this as is until we have a mechanism to dump these into gpu
> coredump (via gpucc driver??)? I recall you proposed something similar
> sometime back.

IMO we should keep this in the GMU range.. if in the future we have
some other mechanism to dump gpucc state, then for future platforms we
can start using that (ie. new dt but old kernel should be a thing we
at least pretend to try to keep working), but for current/past
platforms we should stick with keeping this in the GMU's range

BR,
-R

> -Akhil
>
> >
> > Konrad
>

