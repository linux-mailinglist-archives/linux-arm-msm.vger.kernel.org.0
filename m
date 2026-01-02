Return-Path: <linux-arm-msm+bounces-87251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05933CEEA9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 904C0300AC65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 13:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E38EEB3;
	Fri,  2 Jan 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nq3daW5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QlCYRl1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37B130E835
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767359982; cv=none; b=rLlVklXtKuLqlRiW1jOq79DkWNGxyiV8URkUIHJaM3vtQajlyFQ8YDUvpOS0ivkRYEFR4DBg9IROY6ZDd5xYMFHugEcJ0qs0suYI79jpUR8naQ8qtk2xozKCxmcg77Du/CSvc6vGHXpy6ZF5ZtiEkmRSwAl0Pt8nBz1M+qjR2zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767359982; c=relaxed/simple;
	bh=LSAf/Rk3TdAEWsr3WqS6XJD+Y+HBBtBELhHh+tH2vUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXQ//Ef+4/W/iSnCRknEMMjQ/BIfhdtGitVF4pV6RYMK5/Yuwnep32o3HBKEmz4PsrV0pfhoMf5RecydSJUxWvX34Muy23xwC0c/+18Ytj1ds3kSqVGnqhIIaJOIKhBU5qC01gc7uf5xWS712zuxvIBU71jht+yRp0JFHpoRaWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nq3daW5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QlCYRl1B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W09Y3960195
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 13:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZw/JJiAn3POXEdzsiw5cZbc4vxiyR7ZYVaBih2uKcc=; b=Nq3daW5Dr+ltfedU
	ClwLEDz1gERd71jL3x3HMIya9oQUymeAtf/WMOUFWX+oGODH+dQ7YqDeGP3z+2jb
	LBqPVJ84Ti63+zMDI30CmDvVjT0E3RsnyroK54ijTUB4ro+43aGBFif5dRNUQ2Mj
	1SPvtXCQ8zJYTZNgEEZf5/524ltCZslP55uiuEfgFhpfUapBgimBodgVAdvVX4S7
	a+mW46+rAlu9RlZos+ssYtYO57P2J8Z0UIARAEkFTYBYizGNMIcNdkGFTFVEm0Zz
	GJbQhskDQ4QE5ddBymvJE9lhrXLRApu7/SjBxVzrRPo46fBzdcQhS7g6pFJ3FpSf
	jjeHlw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v3h5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 13:19:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f2b45ecffso198110425ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 05:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767359978; x=1767964778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZw/JJiAn3POXEdzsiw5cZbc4vxiyR7ZYVaBih2uKcc=;
        b=QlCYRl1B6YO+t+IP1BIK392LiKo4Q6NW6BvUlMN7vZavuivOrr3f+zS+3eM8Kp4muK
         4+dsQZ9wTsaG3MMx/rflsdEec5mYBhT8NLs8lllVZcYX1Os/e2Yx9VTPngz6qfjfLcav
         JxD/Pketx77NupMOHCp8rIrLhSZMiMoIHJPAgtKWE7iW+x2I/bRNMcF9iUpICUnaLbdN
         njh9E+pA3C1d7Mk578oybS5SFtoyPJ9zKCbo5EfPUhmAkOTOg/d/WphcOB4fAJvCoKKu
         Y09RwNJZ3kXLJ/40zZ/J0/OLR9ILc5gl3MitQ1FEN0tBL7ubtFkUZLVJluKQEJZq3Bi2
         MA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767359978; x=1767964778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZw/JJiAn3POXEdzsiw5cZbc4vxiyR7ZYVaBih2uKcc=;
        b=E8c2vRKTRNW5s67SuEI4mzA4MhjCGhCOjkAmLNrByK7MGkNruFuORhO7RIc6PehFNF
         AiEgxK8BWt3PobGq8PCbnvVhVQNh+WTcIGL56onvYtZNP+dVnUYZyUtx0cnMPLvGOUaA
         YnM8SGH057gpeJ+l8xJtQcMuu5i6fSjIDU91k6ne7KqGr/xbqMQ233djzbnNBU6OB30c
         40mN6FrMttdYxrZYoa3ugO08iBIvcN1NxlrZrRxvTEzlZOEW6c/jeLQanPq19A+isl16
         Jq0iD6T3+K8AudJLeh01nwnkUpJuzYM3vjWC10sfyfXgxf2Jpk7fKc+3OPYwqlLbMYoc
         h2Mw==
X-Gm-Message-State: AOJu0YxPpa9Vu95N9zNydCj5+tj40Qz+1IudMS2NBJXj8HQKPCSCL+1/
	qP+lnTjc80kfbU/AQbOQ6izEaUNS6pJDcWp1SWnnxpAQQxXTBU8GFQpIGbjE1XNAgTfB4Oqjbqs
	GyRMZEKcMKrmrZ3B4PYmihE07Gv0RXgLDYLhiKiNKI84fjm/CdDJDnO/zCKvoFfk+SbqE
X-Gm-Gg: AY/fxX7fbWAOoencT82iPq2o9HVKIZUJSJF2lHGE6bCOYMGnWrfB/n9y7jiU4DZK7+f
	0Jlip6TYtX55xFJZ4cKYgQgeGB8bmmbso2dkyyMkZOYqaYrfJuEOL3B676fBOy9JGBYtACVRYyZ
	IE4nObLLGo/g8bd9qdl0E5ulQUZQWOrDHJn/QEHPr3StfS2BBur+WqlRIJMoafHBK9CYNu5J2Oe
	AG5KbAVzjlWgkXzDc1qItSAroyZRV3SmfNdpogRSDrdoNU/Ylg+8ZYJeFfzMm8vEsmxsEJj01DG
	PSWF1lHKLhKyDrQ1+FGKKJyE7H0EYijZza67dQFLyXTILi4Iq0YN4QmQe21vR9RI6H2OFQqVD71
	eJAptnJzNHq6Ew7xoE2nl0Dea34GCF7pfuRwmm+wF4Q==
X-Received: by 2002:a17:902:db12:b0:2a0:9040:6377 with SMTP id d9443c01a7336-2a2f242aaddmr409856125ad.18.1767359978289;
        Fri, 02 Jan 2026 05:19:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1hlYxp7YshVj7hB0XX1WRZM787D0V9PpumPlGwEaLRUxkh8qU8paZNSAZAb4rM53RY4rTtQ==
X-Received: by 2002:a17:902:db12:b0:2a0:9040:6377 with SMTP id d9443c01a7336-2a2f242aaddmr409853425ad.18.1767359973021;
        Fri, 02 Jan 2026 05:19:33 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm374709145ad.3.2026.01.02.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 05:19:32 -0800 (PST)
Message-ID: <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 18:49:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -dBEWCXKmwtH22d4X0yYZfvTetIx9Li6
X-Proofpoint-ORIG-GUID: -dBEWCXKmwtH22d4X0yYZfvTetIx9Li6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExOCBTYWx0ZWRfXxcBzGDGClPKX
 iJUnaIoKm9Ht5iOKUo+spvc8N27HECoad+u+7rpum2yZC9X0aLIxvBomOpRbEhPjavizMtws1wo
 sWoif4zrwmVKDEijX+ioaihwA9GGWw7m1FdzWyxDi+yf7WTUXmUwifB2R3nndywjUy2IPMjwgAa
 OtR/5jNRLNHob9G3b4XXt2C099LGfsplMhDIu19KRjeUSFDyauUWwPfO0K7AKfdtHyEmTkU5ymv
 Pj6kYFvBJ0qejr7fAXCzuscu6sG4cJiE1RRYoFQKyHJ7+k1nc0HJ+fl1wRaO4Ad/N3nV73pUL4W
 sUoZjfi6AvxueB5DZn8hsAilpbAWimLFAUu+N6/pD5k5T0iU9Eyq+r6p2DSDlr+F6YmeS0AAcTZ
 UzeSWySwbrC2d0DJYCnZkeJ+A+nVpGQSHmFV7wLXbG/7BxVQ4y/weL7QQIPwad77QYbg3exAQkd
 2LdYJierTe6/9t6eIzA==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957c5eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=_935WOAJMPqh-kFyC1gA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020118



On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
>>
>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>>> can happen during scenarios such as system suspend and breaks the resume
>>>> of PCIe controllers from suspend.
>>> Isn't turning the GDSCs off what we want though? At least during system
>>> suspend?
>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
>> so we don't expect them to get off.
> Since we seem to be tackling that in parallel, it seems to make sense
> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
> "off" could be useful for us
At least I am not aware of such API where we can tell genpd not to turn 
off gdsc
at runtime if we are keeping the device in D3cold state.
But anyway the PCIe gdsc supports Retention, in that case adding this 
flag here makes
more sense as it represents HW.
sm8450,sm8650 also had similar problem which are fixed by mani[1].
> FWIW I recall I could turn off the GDSCs on at least makena with the old
> suspend patches and the controllers would come back to life afterwards
In the suspend patches, we are keeping link in D3cold, so turning off 
gdsc will not have any effect.
But if some reason we skipped D3cold like in S2idle case then gdsc 
should not be off, in that case
in resume PCIe link will be broken.

Link [1]: clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during 
gdsc_disable() - kernel/git/torvalds/linux.git - Linux kernel source 
tree 
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clk/qcom/gcc-sm8650.c?id=a57465766a91c6e173876f9cbb424340e214313f>
- Krishna Chaitanya.
> Konrad


