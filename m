Return-Path: <linux-arm-msm+bounces-75496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF1DBA8CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 12:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052C716AD4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 10:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7265D2F9D86;
	Mon, 29 Sep 2025 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAmWDxN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91EC2F7465
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140198; cv=none; b=gupDwy/6Aeeih8zjAtgf1Mr/ql5x61x7LReglWBzwJ4eVx8zdKjyx+cDbTElmqwRB1aCLXJMs1t/FjtkCo1KD6P9MaNqBhYzUzfs2L+9GVVHYa7YXMCXqLPpJjXc1y+9gvz0j1awJenOpYoYfjb7dIE1EQ/WjKI+P69Th8dF2qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140198; c=relaxed/simple;
	bh=vb4zRbPoWCVNiJSGPFPQY1JkB5ZYsuOuCoh1Ay5Mp/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uW4ovR73QcZj80AN2Tk9fydzu5fnHAjWR9QHOczRhk6Ox8TLZEQFGCyGB3G85/nORhu5HlE1FQv10XprZWzme7AgJ2j/k9AlUdB25Zw8tJAz0DPIfRLXJuYe0AJVOBmJjuWXdv4jkbwp676ORy5SGWzkQ060cM5D3D+4u9QicJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAmWDxN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMs9ml023667
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2xu/IuB6UpN3J5TmykYO0LnsIFMlTlgxYPOo4VkD0U=; b=mAmWDxN1tYeIhC7z
	xKjhEN64GNh6L2NLd4hMn0em1lhLcq5UI3dctz/eCUrCRh192Znxno6NPuqjtWd6
	7WOgseRI8AOvihEq9xVPtE4s6TlBlMU51KaMSZUArH9h3TTNRIky4P4+rfIp8u7l
	86Ze1YE2591IKdLTo5L2oOpeaceSQYI9hmzooqd9Xd9r/aEuz5OhROyPl8t/lC7W
	wowZXVdogn/8qGbovfOdiKV+hwre54UtIvPkihwvr5GdXyZ+gg1DUMCUa6Wnse4l
	QButClLNZZeEuXskrQ4MRWcaaECSu3Xsiwk43+JDd0ZjTQFsNlUU8ByCndCUMcJt
	SGawDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mw3rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:03:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dd6887656cso79754471cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140195; x=1759744995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2xu/IuB6UpN3J5TmykYO0LnsIFMlTlgxYPOo4VkD0U=;
        b=eZifL0zV77sbiuESSuploNohjvKsrATko0aQMKiP/A8S+lclJvWWA7z4bMOINfXOpr
         1e/9F10KURN6L5TXQ7Gc7tMuC46rEFJpWcbY0LWesFQCPArAFHVthu/G4WuRbJrg7JCq
         vI1PbBZByS1Msipuy6ePbGafh25Z7MvZcwtHqLSK61qDKyr0yG/BdVzlcunaQaR5CHH6
         KvFgaI0IpTz7No28GsIOTY7IvFmPo1CldRIYiSVDPqbaCuSs+ffifOdtoDYBbxFqVkCg
         oybSSKDjoXQVIjw9Aj/gg6SIvupjRJlH6pMwuMccNanJNutUlyaeFhAHfRuPR1R48zWr
         2l/w==
X-Forwarded-Encrypted: i=1; AJvYcCUoXgGtzMbXYGXvVDeYcHies9k7oTaMZSGEdLYO0yeA3LDvS2Ap0rW3Bx7DD09ypzvsVMoB/7KCBsNaPrcE@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQxeLJ/Q7lqhqzoYgFcsYoCllD1kTUfyajlPhC25rMgWdzDJs
	lT2BOY5H9J7kzU63te0n00Eh6i9UbScKhhDx4xgtRhNaVB4imxTjxZjM+psJNttk7HBHqyY6uTs
	Q0X+fWh/Yj0MeAzYYYnO2cMqLtPtxclCJmdO8tzEzveqyJMrZk6AfiZbyJU2EhYuJAurs
X-Gm-Gg: ASbGncsUYr5zdFzVnhAb4u9gGQ2lOGm9DJ5TJsdX/aiSVg4Mt95kUP5eqo8QadRip0e
	vMvGJ8JAm5mAVJZcn6WtUd3bZu3xKwoIfg43wYGcJ2YYsMAmWO3tI4SndwGeuWhfUPe8gglua7K
	bmxhIJFVeEMeP5nWFUjbYqG97sTmWZmqw3sSl1fGIa5gpsX7nkqs0xYtFdyNILrA7/qkfvbnv83
	QeWK6MVQsdTKgyZ0W0PTL2IJIMb6PRQFiGvOYN6rMKFJKtnJX3P2uSJeU5pdg8JCi6kVC/EJplt
	RijursXBgHmOvrQRezu/5osy/OZX4Rc0lrTp6bypl6ckRzXVC1eZgAOmbA7EGF75IHako1Tw5Ex
	oJ4+6FEymbrlR3oR5VAhOXsqeQ0mpW/1S/3qJcehxs9qutlCaqtuv
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr122888231cf.64.1759140194756;
        Mon, 29 Sep 2025 03:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2+q7FGGuMsvCVWTzqSjun2cAUChShlnzyln/aLfDIxQUWXJNULzrUScBN2u42qzJl7NWJ+A==
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr122887731cf.64.1759140194151;
        Mon, 29 Sep 2025 03:03:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313dd679csm4031856e87.56.2025.09.29.03.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 03:03:13 -0700 (PDT)
Date: Mon, 29 Sep 2025 13:03:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Message-ID: <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
 <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
X-Proofpoint-GUID: -ugnyrivAUic5-A5SS57cov8e0rGhm5v
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68da5963 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=I1Z6VqxiEuXI--SH4ZsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -ugnyrivAUic5-A5SS57cov8e0rGhm5v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX5pgiE6HvykE/
 FkwIYkLVMc3nAfc3bMWnfLKul4lJHK9Umt9Tm7Snn8kiVCVhXOcBLDF9qmOJCGmlLlIJgg/oSaQ
 H0jhTnonkLBeTPLajkOYfF4HO3zrDWp0o1hOj9h0zribd0ahsb3MR3Avn/bjBfbA9yyDAJ2D50L
 9fO9T+sYzJuUbJapWD/S95sA5e9rq4Gva3n3aUvsPqMR3NXuBM7+Js3AYE29nl0oL8aD9DVJOky
 J7lKElOdm8lUqS92S7MwDUSavZufgjNz8GbkJSpvqD1CHTDQFIIF1fhfPX+pnfYrBU2o5+oC1aK
 k9MALv9JZIhaAvJGS9pTtritWlbpqnIfhJX7YV5ZqPlzFb3ogddwoW8bX2hYKJ6TD5OmrWeNY5V
 yfq/JLHYn7G8i4y5ftCSG8Nx1Zen6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Mon, Sep 29, 2025 at 05:41:10PM +0800, Jingyi Wang wrote:
> 
> 
> On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
> >>
> >>
> >> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
> >>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> >>>>
> >>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
> >>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
> >>>> interrupt.
> >>>>
> >>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>> ---
> >>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
> >>>>  1 file changed, 19 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >>>> index be9e2a0bc060..031fdf36a66c 100644
> >>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >>>> @@ -35,6 +35,9 @@ properties:
> >>>>        - items:
> >>>>            - const: qcom,sm8750-cdsp-pas
> >>>>            - const: qcom,sm8650-cdsp-pas
> >>>> +      - items:
> >>>> +          - const: qcom,kaanapali-cdsp-pas
> >>>> +          - const: qcom,sm8550-cdsp-pas
> >>>
> >>>
> >>> This time maybe without HTML:
> >>>
> >>> This looks wrong. This is not compatible with SM8550.
> >>
> >> Could you point out what is the difference from your perspecetive?
> >> it is the same as SM8550 except for there is one more interrupt,
> >> which is also described in this patch.
> > 
> > I'd second Krzysztof here. Your description points out that it is _not_
> > compatible to SM8550.
> > 
> 
> Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
> difference in interrupt:
> https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/

Interesting. Let's wait for Krzysztof's response then.

-- 
With best wishes
Dmitry

