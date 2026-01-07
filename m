Return-Path: <linux-arm-msm+bounces-87845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC3CFD534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CAFA30D2C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1783930CDAE;
	Wed,  7 Jan 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlTHrkok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h44kNqfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A530595C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782153; cv=none; b=cTXYPEV3ZZ6qWTIYnefwfjbvxqz2kpTYkKdwAcEjjcDdc8U426hDpVnzhQ25Te7EZ7Q9S+lKTnz6nE+UykM5CVwSbGo5tCLFyTo/858jUVkq6rLe8bS3bMUCsjt71B/i5mhRrMSPXLjwFoMtNkT/2W/5nDCr1Z5IEBU6KDA8QLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782153; c=relaxed/simple;
	bh=m2f9qkXUrqcRe4pmfW5ApotX9bq879iYIj7ImYA1T5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCxxHWqSjHF4/lB90S0cbi6Y58AjtoIzaL8AnwOKilvIK29GdXUZT84o6yY9tYHJ6RMCbBMZtpmxx16UONMx/SiXmsvb8WnN0lsvREyOqjURXfNCBbajb80pRlxdAbz2eloLniQfpfKQXyfhrtQDaLpS22D2CqpErTLRVbzQ3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlTHrkok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h44kNqfP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607A0wtH4138123
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jlry1Vt5+KLz/mDBAc5xuvGeW/Uag/fDuxJsNP+G8jQ=; b=LlTHrkok8A9sgGCV
	mRimEoA/16f3JZHGzlRtlX+w4/WyjcmA7odAvRHJgJ0f5nAYN4eI8BNKxjTf3jio
	jtRFQ4CO4NvFFBJsNV+DgvzsBd174k/Vp5Xwlq2C1qaRXGx0ZqD0enTuZn5I8ryt
	OFxnFzQ7qamK57C2RI0w8lXoi9mkEP7Qttoh3B6sIqsttzwCu6dNBjnl1rXRnRO1
	3Kt4QcaJ3lterl6yqlrW51YVWExzXkWDErwFU/LG6+9BcDG1fyU/ISO0Fa6xia1E
	wYl0RKK07u509+nY9eYxItNdEO9rGZGxTJRkaqYRfY/HwR3PcZdzwcSaVctmJow8
	UhpLmQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2xt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:35:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88233d526baso68399596d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767782149; x=1768386949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jlry1Vt5+KLz/mDBAc5xuvGeW/Uag/fDuxJsNP+G8jQ=;
        b=h44kNqfPFks6S37NU6rcuk29GMVezQEkjw67woPRA+ZnJUxjFOnqzAqbzg9ygTf/G0
         5kxruaUWocwuKwaR0HcqDlOG4rL4Qkmnev7Qp5FHeeG6kvFsnNI4i/j4hxuM+OvZWX3Y
         gdh3aeTsmMjv7StExCQs7mUjMyNLBdjLf7Y21DdVXvqsmN6ciwRPRwYR1mc8du2nZ4Oa
         5ynHKDKjYfmUeme8BLXB8QA+C45TfrecFxZn/Ky1mOITFIUbiziktTThlxl0ZI4OZcLh
         wl0qEOzTr5DSDg7IUXnN3zZ/Q32ivcoDD5nbi4r218qGzI1xyNkofnfbK/GVzA4NnlDG
         rN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767782149; x=1768386949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jlry1Vt5+KLz/mDBAc5xuvGeW/Uag/fDuxJsNP+G8jQ=;
        b=SIDlfzWBYEv20Br9feogYZrTGTLR7QBFSVvgC3QJCMqhVy/KQ2ATFE+zkT8mhPa+WD
         sgq4CiFC6bIDoCymJQfhTYMqsob5VkhzabyvdzapgmwdMyXyCm41uUBwK8MM7dGOd+Qp
         5vMdeTO3DRZ63yAsLZjEzptI1mCjTUGW0bd78HcVyEGUx6N1Ypduz251VgOVc5VvGEmv
         pbG3kKiyPBbfhMI/guvfQOp7Vhzh+PYpWaPnqHoHDVuoWJFkUR5x+WLHCVguypW7Nai5
         WvNx+qK6gSjYg0qf8c8K04a8TjAm0KXT/ZUKC6HjlwWAB1bpxhCfQTDkUSkbjxodv/M1
         E7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzgR60SWYQ0X82PbpS5FVcG6vpHrMgeCoMd7jLygxq0CCvLoQl+vwfCZCdI1w3BlB84ySy6sXhQXhK9h32@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQgIiuUbD0nn5DA9bawEr95w0ycrhu9XUktOdq30cMzGS8WpH
	3pZQkIWOVI19h0aQmmgnI0Km5flsRzL+H2YKYkpSgDhGdTQvIkJveCfQ9ScFK6p9+ZHusXJK0ds
	pSU92IxBotYqa1rcpYJuR6h2JpdGxplABK2s8yqJnl/znESVkT1ufk6Su+Kla95RV291TZlnV25
	zj7rbmm/tlErVs6LWaoqKNsPl8OEy+JHhNaH1e2NJU2Uk=
X-Gm-Gg: AY/fxX5SQySuiZhpNmNbdDb+wp1jjuqVTltBRFYIVgvm6kHOGCw43hlC9xVm8t0QPiy
	SNpLwxI+FZNH3g3giBKyGZ7WtDqD3AFaxXMXzpnAiRr7Njd22vc9EOLOZhDIBE6BJmkKLTWj0T6
	3CkRrZ6/tD8/ydmhXR+ekLkO3KvD3s0pdISdpucPUvnrv4X2YOKsta4o5dv7KebiMUyFq461RYP
	oRUqWoVePr+Nn+BKOD7Kg6cUhY=
X-Received: by 2002:a05:6214:3bc2:b0:882:4b1f:a812 with SMTP id 6a1803df08f44-890842a26bbmr24451146d6.51.1767782148997;
        Wed, 07 Jan 2026 02:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV2bQVnOOkUfKi9YLuyJCwO/xFnCEJJVbcyuS2T9YeMsjnl+BzdxTNWnJToYbvGC4KTHNdu8uA2RXyTo97TPs=
X-Received: by 2002:a05:6214:3bc2:b0:882:4b1f:a812 with SMTP id
 6a1803df08f44-890842a26bbmr24450806d6.51.1767782148542; Wed, 07 Jan 2026
 02:35:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com> <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
 <6a74e675-b011-4e1d-860c-4c3232beb2a2@oss.qualcomm.com> <7fc7c14c-a305-422e-8755-22e7c28bcfb3@kernel.org>
 <674b8615-dcd3-4ae8-8433-cda6e8347048@oss.qualcomm.com>
In-Reply-To: <674b8615-dcd3-4ae8-8433-cda6e8347048@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:35:37 +0100
X-Gm-Features: AQt7F2qkT7aMmhrEGPvM2Y2e-bOqSDMUhFEImzULpOu1Lheg37dfANazadn-rZQ
Message-ID: <CAFEp6-2qtws+Zhz7yFHCGK_M4RnBz1_ium2=HkdS4=A6JYeX2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NiBTYWx0ZWRfX2R0QAaVz3Qfm
 idmtQNuuROkxqaweDYJ2iSXK2/KWt1Xc4Ad8FMKFFDECICHoRwftwmNE4unnKve0RdBPgkI5n52
 rBISH7Urmshsa7h62Gaf/g6DItz1dLn/de/z07G/97RaflJNs8nEvjU5TtBzbKzyznHowTuaRZW
 C5vdTjH7IbbmDKfsrOlHbDFA4rhJHbUhtcu6NAUT89grRQh3E8eUcA3fgJUhl4r7ULyctyUGxzF
 y0dnod+P/65SHAc28NKEpPj2V4dJAFv05iHVMLnuzPdE68I+5szqQ+69HJXHMGwlC/SwRO+k0oM
 UyRjUtLBr5D0OEora3A23pjpHLXDiFKABpYBevi0tns2szj5xSwktW/vRNygEZgdGHaXrm3zTdT
 GKo46fe33Vdv1t90FmT4dJxo90PkozfZKyZXkel/Kx1xIObCYvWnASvz0TyyA1PL1wyS1AYPoIz
 oGjUP5BLBx+GmBNbf+w==
X-Proofpoint-GUID: -on3B95-fOyxJwNkh7221Tc6Q8QvxlnS
X-Proofpoint-ORIG-GUID: -on3B95-fOyxJwNkh7221Tc6Q8QvxlnS
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e3706 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=DP5Y6ZztmILrlu424yMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070086

On Wed, Jan 7, 2026 at 11:08=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
>
>
> On 1/7/2026 4:34 PM, Krzysztof Kozlowski wrote:
> > On 07/01/2026 09:17, Wenmeng Liu wrote:
> >>
> >>
> >> On 1/7/2026 4:00 PM, Krzysztof Kozlowski wrote:
> >>> On Tue, Jan 06, 2026 at 05:39:53PM +0800, Wenmeng Liu wrote:
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            enum:
> >>>> +              - qcom,sm6150-cci
> >>>> +    then:
> >>>> +      properties:
> >>>> +        clocks:
> >>>> +          minItems: 3
> >>>> +          maxItems: 3
> >>>> +        clock-names:
> >>>> +          items:
> >>>> +            - const: soc_ahb
> >>>
> >>> Same question as before. I did not see any resolution of this in
> >>> changelog or commit msg.
> >>>
> >> Will update commit msg in next version:
> >>
> >> For this platform, it uses soc_ahb instead of camnoc_axi.
> >
> > That was not my question from v1. AHB and AXI are both bus clocks,
> > meaning for this device the same. You again name the clocks how you
> > called them in clock controller which is wrong. You name here CLOCK
> > INPUTS. What is the role of this clock FOR THIS DEVICE?
> >
> > I already asked to pay attention to this difference.
> >
> > Best regards,
> > Krzysztof
>
> Ok, i got it, just feel a bit confused.
>
> +                       clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_CLK>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "cpas_ahb",
> +                                     "cci";
>
>
>         clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
>         clock-names =3D "camnoc_axi";
>
> If this is acceptable, I will update it this way in the next version.

No, the idea is to name the clock from the device=E2=80=99s perspective.
For example, from the CCI perspective, you typically have:
- A core clock, clocking the logic, which could be named 'core' (but
'cci' here is ok)
- Clocks related to the bus interfaces (such as AHB or AXI), which
could be named 'iface...' or 'bus...'.

This approach clearly identifies the role of each clock and keeps
naming consistent, without depending on where the clock originates or
its source name.

From that standpoint, some of the existing bus clock names defined in
qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.

Regards,
Loic

