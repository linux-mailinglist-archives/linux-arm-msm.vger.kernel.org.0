Return-Path: <linux-arm-msm+bounces-81898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E805EC5E70C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 18:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 306E13A8B08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E07E33B6FD;
	Fri, 14 Nov 2025 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o23z3Jtf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoKrFlfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B5F334C0D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135286; cv=none; b=p8qEqSXDzr9sQ6L3F2Wrd3uxZ+/2nk9cOFJVlSu7FnJm124r2RQEVBGlA6rtydOebZPqXCRGAI6lgU3Fx1CNFqkEYT5XM9anb94cNzgs+YzCbTCMnc6D8Hr/0UgmK8jwn9Hm/HgAhlg2uzuEAYhVc7kUzA52eNVgmiAaW5h93Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135286; c=relaxed/simple;
	bh=Wyu9DfM8m+/9Vxr2XSGjko5bALmHnWPB4iRYcBevGQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaLN155/wb0pPgBUmkOZMz0e2wVqinIF0jq2fr5Aeh8QwE9Cpc0paH0x8+kQuCVTnQR8e85MNJMHFqApYVcwxNDZq11CTknkmDRJ6NDWCYoJJlX+1buK4IXPTEK794senk8Wu2dlm6yDxwdyOd9WQzMrvkXUT5WWJKdmAypaSKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o23z3Jtf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoKrFlfR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8iOsm1426033
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 15:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bCKeQ+Sluq0XkbM/rIfYZbhzlSoOWjCoZWm9XIaaYs=; b=o23z3Jtf80s0HHqF
	ErYSjH70IM1C57vkzo1mOGDfXmlOU/0+SjCpFbccIynjlPoSwmbT8pTVGna2yW5x
	ZIoJNYovDmICd5nIBmJUs2YWu4RqSY29G+xk0xTNFtqM1M+4Em0EQWl+oGqskH+B
	2/S8eXTZMQE6iyR6+aouVtiAdLi1Asp38PoZDyy0FQ2+D/0yGYYH8UCCgZ/d3vqw
	h8FFQEcSrbhrpJCSVWiXFoqCb9ECUQSFQKhXBvehdpx/PAI2+z8CdShLrDIEz9Iq
	H5s4469FkN+HvqM3WYV6j5gI0YghbRDxJKi2evUhbzi7w4Ccu0MGk4S4sccgg8Oy
	iXiVZQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g2p8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 15:48:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dde580c8so64390325ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763135282; x=1763740082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bCKeQ+Sluq0XkbM/rIfYZbhzlSoOWjCoZWm9XIaaYs=;
        b=hoKrFlfRpC/4SSfWgxR0d7WLjzzT+Drwq1HOdLLzfbH2WqLa8uwvwMVY7rkrQdVDjt
         nldE2hR+A5aka5t0CcjudTOAJGwPL73gDYO753l4p2wNmuMCdGrBKTrHQZgw11ainCxp
         2B2vMJvi1A9sZZJcoZ0gPXmfOwtssP6cQp2/+92yYAZP6HFy8Kui+a49Ncf2X9NHpuNX
         01ymQU0VBbrieUjnAxRcxXIpEEWfWp6Pko7UobjrgNK9wrzFimPyWkyEfVS6oyOhpHis
         O9QO1UDp+NNdgkJFwz1voJwJ7MHNA4IwSNZt/rCGmWlzPj9VIS1+qgbQLHLashdcjmRa
         OQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763135282; x=1763740082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2bCKeQ+Sluq0XkbM/rIfYZbhzlSoOWjCoZWm9XIaaYs=;
        b=lEr16NU6+2m/LMp7r0n2OobFTLFR2bhIyWNFswkNoNwS8cjr6HHGz/AlYlZmbDNUhh
         QT2SMT5lriG2+FQcdmE0e/fn0SIKnDQPnZ6oOGQA/ExKUFNi0GSSwDs//DbStlC8dfPt
         af0jyMYkeFrkuOq600BTw94Zp1VKET1LxKF3PgvSfK1olN+D3TtNdn3u+u9gRA1SrdUf
         SoasC5DhZbvEv0rxLoeqPhZxET3xPwcqhQcCf5enwzel+eSi8PNX8Qu81vWRYu2/DfiU
         zGA97SQJDJKh5o/4rIrGpTJnfZBaoEzJXZbBfy6FuSy7GBYickHrfliTSm0KT+ZHTV75
         QDQg==
X-Forwarded-Encrypted: i=1; AJvYcCW02Nt7Gp8+94C/5Zv+IFtRNxcWQM7Upl/Q8F1Ss/mi9zFChKNd5eqijDPfvQNZppwTtxA4Mei+15nnDXa/@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjLx2sJvq1gmxXyRYvWk7FZt99pw60bLiOV9ES5XC+blrdQ/S
	5A+gc0Ej2p40t8UxCmfEooUnB8rP6ePKp3vQqM6/xiW/LOLQxWnlDJ71ap5RaJJ6s+M2+WmK2gW
	WbftF4hnyoc1bhcWK+2aZu0J7jlVwp1utPcoPT14M66/fgJvgqKDJO97qbfB1NGK9DUhlYBK6DC
	Mpo1dbt+atTFZ9YR7UK5gXjfVE3ji9TK+WuxDoBS93OWQ=
X-Gm-Gg: ASbGnctqSTT6aNq22fQ1PNhP5yK4pAWprPsk+KmGGHSfsVF0ct+xc0/0ftvmviE9DCg
	UdET28mzjR7imlIHzXEPoSQcrgblB6HRxIegiML2obrcqe0PYWRAyzFYkdEvuSYP0Ldue/4iSbz
	jaGx43GNQqSFvmVXxvA3t5mOJM84j1WsxDdfn7SFYNlgXFTzNNiFC/2GR9BNqFcpBqcXdACG5+N
	V1KLiVbBZs3nMyR
X-Received: by 2002:ad4:5dee:0:b0:7f5:eda2:a54b with SMTP id 6a1803df08f44-8829270f697mr55790406d6.62.1763134542990;
        Fri, 14 Nov 2025 07:35:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExGxEGmy9Wk2SjtsDFfxtyAb1s1oReldG8wwbI9CQL7zQX5yUc49Rsa2RzromxSUyKG4JlavwELKEgFtW5Ew0=
X-Received: by 2002:ad4:5dee:0:b0:7f5:eda2:a54b with SMTP id
 6a1803df08f44-8829270f697mr55789456d6.62.1763134542286; Fri, 14 Nov 2025
 07:35:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-3-loic.poulain@oss.qualcomm.com> <740b9e7c-59bc-4a35-a268-526d92db372c@oss.qualcomm.com>
 <CAFEp6-12qN0=cv5=tPeVq3bVDLkaQDHLLCVQY4dtCTSvx+dPOQ@mail.gmail.com>
 <c1269f38-ab90-40d1-b5d3-39f546829d6c@oss.qualcomm.com> <CAFEp6-1+inMhsgjSqAZ+UDBMuNc9DA-jXFyqB=gkvYpSzW9Ukg@mail.gmail.com>
 <6daf722b-6b1b-4c91-b108-74793d930319@oss.qualcomm.com> <CAFEp6-0sbDj0C9KAMxq1mrGO9jGz4YDMqnf1AGVU49PyGzLi8w@mail.gmail.com>
 <4e9d15cd-1ef2-464c-b421-f8a333c53825@oss.qualcomm.com>
In-Reply-To: <4e9d15cd-1ef2-464c-b421-f8a333c53825@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 16:35:31 +0100
X-Gm-Features: AWmQ_bmHKjXqy5StN-3NHcR0_n_1EHGaga7QeKQGrwp9P5rHIgF40H3TwxpF0Ho
Message-ID: <CAFEp6-0q5ERAm3femWn8ZLbMN-e60jceh+rHDBJ=V0fM_7bAWw@mail.gmail.com>
Subject: Re: [PATCH 2/5] power: reset: qcom-pon: Add support for WARM reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69174f33 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=Ch0LA8A4dSxzT6VuE1oA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNyBTYWx0ZWRfX6JOxCATc05Au
 9KMO7bjmJUVjG8Vs4vaXfS+WbPpRWAwElcTIl+kEf783yd7Uy2AaF4F9T6ZnybZCwwjkz9VI5Jd
 tWjFMaMq7a0yxjJrZWRYbzJTLB06WqW6kh0+qACuf4jd+cAFMXtrPS+EtTnudbs2T5LQQQfzW+X
 1IcBsWCghKSUalIjQVnMDxDzjYfGyGLvYgNXLJwUaAMmQRi+HAe8CiXiWL1IOoeUqiXTVrap8ey
 6A6Bv1Cl+zvqvbJjcQT+haAdEONqbYbGKtKIohVxt1I/KbBV1GuGTwtXJYeupeb+dh28jQMT03A
 9ReBHs/B6kckDAt4YJl4eAyADtnnwIJU89Ff31gDG0tCXpPikbzb5p3K4tUVHTjO1rDEajPaLRA
 96b/Y/vOnEVNu6ZrudOlRtLaxx57Eg==
X-Proofpoint-ORIG-GUID: GNPUI9KZhyZwMrjYPOek5ffAmqGFEQvF
X-Proofpoint-GUID: GNPUI9KZhyZwMrjYPOek5ffAmqGFEQvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140127

Hi Konrad,

On Wed, Nov 12, 2025 at 12:20=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/12/25 12:16 PM, Loic Poulain wrote:
> > Hi Konrad,
> >
> > On Thu, Nov 6, 2025 at 1:50=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/5/25 10:44 PM, Loic Poulain wrote:
> >>> Hi Konrad,
> >>>
> >>> On Tue, Nov 4, 2025 at 4:20=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 11/4/25 4:01 PM, Loic Poulain wrote:
> >>>>> Hi Konrad, Krzysztof,
> >>>>>
> >>>>> On Tue, Nov 4, 2025 at 12:50=E2=80=AFPM Konrad Dybcio
> >>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> On 11/3/25 7:20 PM, Loic Poulain wrote:
> >>>>>>> This mechanism can be used when firmware lacks proper warm-reset =
handling,
> >>>>>>> for example, when the PSCI SYSTEM_RESET2 function is not implemen=
ted.
> >>>>>>> It enables the warm reset functionality via the PMIC.
> >>>>>>>
> >>>>>>> This fallback is only enabled if qcom,warm-reset property is pres=
ent.
> >>>>>>>
> >>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>>> ---
> >>>>>>>  drivers/power/reset/qcom-pon.c | 47 ++++++++++++++++++++++++++++=
++++++
> >>>>>>>  1 file changed, 47 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset=
/qcom-pon.c
> >>>>>>> index 7e108982a582..684e9fe9987d 100644
> >>>>>>> --- a/drivers/power/reset/qcom-pon.c
> >>>>>>> +++ b/drivers/power/reset/qcom-pon.c
> >>>>>>> @@ -19,12 +19,20 @@
> >>>>>>>
> >>>>>>>  #define NO_REASON_SHIFT                      0
> >>>>>>>
> >>>>>>> +#define PON_SW_RESET_S2_CTL                          0x62
> >>>>>>> +#define              PON_SW_RESET_S2_CTL_WARM_RST    0x01
> >>>>>>> +#define PON_SW_RESET_S2_CTL2                         0x63
> >>>>>>> +#define              PON_SW_RESET_S2_CTL2_RST_EN     BIT(7)
> >>>>>>> +#define PON_SW_RESET_GO                                      0x6=
4
> >>>>>>> +#define              PON_SW_RESET_GO_MAGIC           0xa5
> >>>>>>
> >>>>>> Going back to msm8974 where the SPMI arbiter first showed up, thes=
e
> >>>>>> values are all seemingly valid, so I think we can drop the dt prop=
erty.
> >>>>>> The restart reasons are set in stone too, and you can find more of=
 them
> >>>>>> in the register description.
> >>>>>
> >>>>> Yes, but this should only apply when the platform firmware does not
> >>>>> support warm reset via PSCI, right?
> >>>>> Making it unconditional would override the PSCI implementation even
> >>>>> when warm reset is supported.
> >>>>>
> >>>>> The point is that psci_sys_reset() executes a cold reset if warm
> >>>>> reset isn=E2=80=99t available. Therefore, our PMIC reboot notifier =
must have a
> >>>>> higher priority than the PSCI handler.
> >>>>>
> >>>>> So maybe the alternative could be to introduce an additional reboot
> >>>>> handler in psci, with the lowest priority, so that warm reset can h=
ave
> >>>>> a chance to run either from the psci main reboot handler or from th=
e
> >>>>> PMIC reboot handler before falling back to cold reset?
> >>>>> [PSCI-handler]->[other-handlers]->[PSCI-cold-reset-fallback-handler=
]
> >>>>
> >>>> This seems like a common enough problem, perhaps the framework could
> >>>> accept EOPNOTSUPP or similar and try to delegate further, coming bac=
k
> >>>> with a normal restart or so, if unsupported. Trying to make a specia=
l
> >>>> contract between qcom-pon and psci silently will be very fragile
> >>>> otherwise.
> >>>
> >>> I tested the following, as described above:
> >>> https://github.com/loicpoulain/linux/commit/5c34ea54e1a21ff1192c3c341=
877b24eff5f80b4
> >>> The only special 'contract' is the handler priority.
> >>> If you can elaborate on another/better approach, that would be helpfu=
l.
> >>
> >> Thinking about it again, it'd be difficult to grab some sort of a hand=
le
> >> to the ""parent"" reboot mode, so what you propose here is good
> >>
> >>>>>> That said, we're circumventing PS_HOLD this way - is that intended=
?
> >>>>>
> >>>>> Well, we don=E2=80=99t have direct control over PS_HOLD since it=E2=
=80=99s managed by
> >>>>> the firmware in our case. That=E2=80=99s why I considered using the=
 PMIC
> >>>>> software reset as an effective way to achieve this warm reset.
> >>>>
> >>>> Hm, so is there no longer a way to assert it by writing to PMIC
> >>>> registers?
> >>>
> >>> PS_HOLD is a SoC signal, and we can maybe assert it via the
> >>> MPM_PS_HOLD register through the msm-poweroff driver if needed (well,
> >>> if access is allowed from a non-secure world).
> >>> However, this would also require coordination with the PMIC driver to
> >>> select the correct PS_HOLD action (shutdown, cold reset, warm reset).
> >>> For that reason, I=E2=80=99d prefer to keep PS_HOLD based logic abstr=
acted by PSCI.
> >>> Using the SW_RST PMIC register allows us to perform a reset without
> >>> additional signal handling.
> >>
> >> Yeah of course we should use PSCI where functional and available
> >>
> >> I think PS_HOLD used to be fully manual on old (msm-3.10) platforms
> >> through PMIC registers. I see that e.g. msm-4.19 has an SCM call to
> >> (de)assert it. There's also a "halt PMIC arbiter" call.
> >>
> >> (via drivers/power/reset/msm-poweroff.c)
> >
> > Yes I could try the SCM call to deassert PS_HOLD, is it something we
> > should prefer over PMIC soft reset?
> > Asking because the implication would be a more complex solution
> > (though not yet tested):
> > - Adding reboot mode support in qcom-scm to activate ELD mode
> > - Adding reset-notifier in pmic driver to modify PS_HOLD action to warm=
-reset
> > - Adding reset-notifier in qcom,scm (of lower priority than PMIC)
> > doing the actual SCM ps-hold deassert
> > - Ensuring that PSCI is still used for cold-reset and warm-reset when
> > supported...
>
> My answer is unfortunately "I don't know". We should loop in some
> PMIC folks that would know the difference

I think I=E2=80=99ll start with a simpler patch to add support for qcom,scm=
 reboot-mode.
Then, we can discuss the PMIC changes. I=E2=80=99ll also check whether it
might be easier to fix the PSCI or EFI reboot implementation on the
firmware/U-Boot side so that warm reset is handled correctly.

Regards,
Loic

