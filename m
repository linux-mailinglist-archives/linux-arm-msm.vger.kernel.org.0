Return-Path: <linux-arm-msm+bounces-86468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19063CDB4C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 05:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 451C7301AD0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 04:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19F3328B7C;
	Wed, 24 Dec 2025 04:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTlYP3xM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6+bjr8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5962C11C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766550087; cv=none; b=Ck+sucOLS9xXGfG2VRPl62Kq7+hekQ7xUvsiaqgtosHPG/wxQxVy3nBYs52jFNgtV0vE2aUfrgCZNf/kdEd9Q38UmJcIGqrlAOLE6ZSyRqba+gdOyGl5hBSbbgmUIJ4BAYVrYbLdMbevo52eeDldILLp2kzaKzAKGBRxjPGtJMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766550087; c=relaxed/simple;
	bh=YZmyL0O2bZVM9gC0do0mjqjp+/8OdloFSspnxeJ60is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jv/dzQR70ZiOQuPOFPk2t5nXuVqDA9dTnCy6ZTXDU/gWifKtZMbRt1H46McCO2+LYDvTmN2QQD0okjE/UXFzHpgsx6SIWLZnqyP31HzupuIUV7xwSvIGZZkD4/YY3E/4aqBi4dWcQpMkQ9StBOtlAEWPAgoF8wqeX5QjHCQvZJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTlYP3xM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6+bjr8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO1Hiwo559899
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ofkguQf4TvOS9O0WufJ0bCuv
	Rtu8pSF8nHAmXM2OSw8=; b=lTlYP3xMQV7J9VLP4eroRhlq1EIyoKxujdBYzxHd
	YBe6Li+m7pS0CYhw2kMotswgtVQbDHYat+mHWEjo6XkqIc8uxbnmNkyRfAPgUDdV
	9QevWQ2VpUbD92aAOLauiF69liUsU/Vx3BzEVVbCCtEaJ0bhWSK9Uoa8L93T3oCe
	yNoByyjhss8ekzLytaxyNZTbDqKVxSFcGIaLfGfNA/6pn23nm5Wul5P8RoI71CDR
	nqiW9ptp1Dj7Tl0OJ2YF919Grg6j8rSjqZNboPBBwp0f0g055OTSgqe9Wgz+I5eM
	IHayCHmsoyjxQhfpefNTB6rqXL4AsrNxJwtDXS4hoViQlA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9ctdb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:21:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88fcbe2e351so65599326d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766550084; x=1767154884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ofkguQf4TvOS9O0WufJ0bCuvRtu8pSF8nHAmXM2OSw8=;
        b=K6+bjr8AFIWxNMN0BcQewUUpI6AoF4iG6gH0W1N2t4FeE31MkRnHl0D9T1J4jVI82E
         ox0SaCh5XGhQafc/sP+ktITP+TOjS+9R+GnZw1gmeGAcVfRvcSy0quzQVgzUhXmIhGhS
         p1TN0R4nNfE38VtYVI4vswZ6XV4b4421BeQ0MIO9eTASevL+fBPymmDdRhK2vSF+eS9S
         p4PBJd574f5fEzZukJDEqO9YU/O14YIuwoDn1jQLEz/yuS+HvX1/n3yZ9T/l++FqBnkf
         90a+97r3josmh73ydMDWvQMCsnqNy9UCuQ53RU2ZHSXKF6LyKWZnp3agURaIOxcdp1vu
         3LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766550084; x=1767154884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofkguQf4TvOS9O0WufJ0bCuvRtu8pSF8nHAmXM2OSw8=;
        b=vddaLL9DAJxeBjCBZEt8PINoq/POvwVxgTZIdD/ig8yLPfbQmGCLF6xqEp3I8DXpyR
         ynUVlv4+ZW3sDTQn24uouD7fZ0BHmhiVm3q3tLPrhBePrF984FbcLhb8eAqdffMe6tE4
         CVQrYfORjyUbinuKkSeqRCzcrOECPEf8psGm5NT0iNCKdviXfI/bHUhEnNXHmwKVqng2
         AThIga/PWNqDl2DwexxAqahkZuIVVwZPgDvPyCdMtOwbI79qViuVQ+EPCmZM1jc4h+Ny
         +AVSEG0nPRqFera5bIau9D7Nolo9Z6lhvbiIEIsepwR+D4pJMl8t9KWzDrDkkzad8S+2
         d91A==
X-Forwarded-Encrypted: i=1; AJvYcCUqv4FQkrmju6vQQ9ZJAkmtUyM/HYKPyMhMsUmpYBP+L+T6ot6eGmctPMkXkuzMvIqojYHPQeLW/IqxC0wf@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwIHOUUyTIFO6hCo2TLWQyJ+MTyqVc7Ir5uBaI49ELh0WFVNV
	6FDMtIs5zgY4zqfVdcjq+onzHi5dUapQBCvJJDXi4DcD6YN8ey31tqLKp66zNjreoC64y2WeJbx
	NzFPScGOUkBdZkZH4iTIH1zDNCr8sZI8XDrKMpZGVNdBzAKyYF2HKsCYVMkGi8yWrFGpZ
X-Gm-Gg: AY/fxX6Qw8Uve2jClJv1gKZfjLqsmJ6GX7/2qmAd7TmudB+srwLijxbgsNnw+45QKur
	AUaDLhpxb4CzJl6B5aTGgRCMlJh1JDpK9LaWdt56ie+ODM3H9jUmPbR58Vh5CBnLmtkJQEpe/Zp
	l/8wFHVJlIGbKSeRYFs1q65LF/HDNYLItNKtnNwUL4od01yNktEimSglH8KtacMljoZ1+gDBMhf
	JqFW7AeSGfL5WsBTGpmQPvhxD0Ex/j1a2xx4iPw+PdLn7DTNxICQx55No5ANTTH78aK19WZ6haP
	zJvJUt4CdRJ71Lmzlnw6F6mHTHfAkJuPjzgrD2MfPsiIDFkipgTTgVHM0T40Box1ztmCaMNcc8k
	unCPGxHqrXQuJnpwaeHIDfXso1omy8TYGq0Wkr2sBXrNulZsXH5+SnWrGbn1vdc1H5X4ItIygRQ
	9YawKp2/2F7UAHtoc1SrPNazA=
X-Received: by 2002:a0c:fe4a:0:b0:888:4930:7988 with SMTP id 6a1803df08f44-88d8453a11cmr185926436d6.35.1766550084369;
        Tue, 23 Dec 2025 20:21:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7uA6GLKeoNYYY3Z8kcaDJrou2KXuh4WQp0swjBHy3wu7JegQWMwwG/UFKclXwXpHAcMJzVw==
X-Received: by 2002:a0c:fe4a:0:b0:888:4930:7988 with SMTP id 6a1803df08f44-88d8453a11cmr185926396d6.35.1766550083889;
        Tue, 23 Dec 2025 20:21:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186f957asm4550945e87.28.2025.12.23.20.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 20:21:23 -0800 (PST)
Date: Wed, 24 Dec 2025 06:21:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
Message-ID: <eklzmnlnkanrper7lt46vap54u5giprsmwhwpr4am5ytwyohov@kjqvls5vjani>
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
 <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
 <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
X-Proofpoint-GUID: FxhqBOhPmopTPKqFPw07ivejJ4D-e9_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAzMiBTYWx0ZWRfXxoSCwcv/KEo3
 qa0GA+Z95KT4V/XS7LslLVwrDI+NO+8oC3d79kUWnWoiJR7ZtUuBTRYGwoH8RNWXsugux9UDntZ
 XHtqI2u2/NvJenvl2cpgUhLD0iZ6SSiB8F4MR0SFnjZKO79OvEfIoiKskLyiwpEYu+GlQ77z02e
 EMT21wFkox8ipUvMcimyjSWjw7sMjqgPjZIbjQG+8UX5PwBQAEt4GTgpJv1L4PuILPN++/m4Vd+
 pTDwi40qK8K/a8F547ASIZ4rjVUnEthj8pfwGQDVG76nsUgFz8HTbV711s/ZVr1MclmfZj2syEB
 SyH1ygzjukZQo+nWfObl7KS6WnztVf04bXY98h4537+F26puFh4G8dejzk6XHHBG6JPpKM+0OmX
 8LsgElveU1CTTdtEG4mSeEi4/gVo8auCsrGlkcTHqG3Btr6lVGxYFDuHxiTGlrerOqLKjddt8nB
 sVUY8Z0X5xAUNr2ADBQ==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b6a45 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=loJ5KYtHhvZNDGzOWQkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: FxhqBOhPmopTPKqFPw07ivejJ4D-e9_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240032

On Wed, Dec 24, 2025 at 11:18:02AM +0800, Wenmeng Liu wrote:
> 
> 
> On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
> > On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
> > > +  interconnects:
> > > +    maxItems: 4
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: ahb
> > > +      - const: hf0_mnoc
> > > +      - const: hf1_mnoc
> > 
> > Same comments as before, do not invent names.
> 
> <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> <&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> 
> This platform(qcs615) is different from others. It has two types of sf,
> namely sf0 and sf1.
> The same as it is:
> sc7180 sc8180x sdm670 sdm845 sm8150
> Do you have any suggestions about this?

Which _names_ are used on other platforms? This question is quite clear
from Krzysztof's comment.

> 
> > 
> > I finish review here and ignore the rest. You did not respond to
> > previous comments and I do not see any improvements.
> 
> I'm sorry about this. However, the previous comments did not clearly point
> out the problem.
> 
> > Also, way you send patches makes it difficult for us, so I see no reason
> > why it should be my task to try to decipher all this.
> > 
> > b4 diff '20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com'
> > Checking for older revisions
> > Grabbing search results from lore.kernel.org
> > ---
> > Analyzing 5 messages in the thread
> > Could not find lower series to compare against.
> 
> --in-reply-to, will pay attention in the next version.

Or even better, just use b4 tool.

> 
> Thanks,Wenmeng
> 

-- 
With best wishes
Dmitry

