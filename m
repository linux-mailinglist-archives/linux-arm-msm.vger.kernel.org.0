Return-Path: <linux-arm-msm+bounces-86176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE05CD54A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28865300E7A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E7D221710;
	Mon, 22 Dec 2025 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o54YCYNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsWOthE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DF2BD11
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395130; cv=none; b=SVrS3iB9LhCtNLiBkPGS7tZXpbfNjdSwkeluZ1GnUKbMy6W+/7qGa8IesZIcQPxUp/66gQlQ/Xb3ovIdzXx31O5wRt8McHJmRERTn2ZfnCzweQGVtzVbg3apMjez6scJ/HMqeVafZj32nmIjtZqF5PO5HViDAw/Sn2An2t/fjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395130; c=relaxed/simple;
	bh=1d/JAVwzlA/+9tYBi+g1Hro2TR6qpmAEWyjI6DD025E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nzgd1pblH5ghDo2IUVqLZ46wE3pcdzw7cXfm8SkZPMbj0KLfnLhkaUKFR/ZFLT9frR2KygNjTLNYoEwhJKEhpHls1Et23E6hn7X/fL5LcvwqvNhPFarh6Vsw3sIG/N3mCRZ+kkVdCA+CNSR1jkNoHZMY8/5L/AZP/og7VIR7g+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o54YCYNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsWOthE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7ihpe3259704
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAvA3mZeZ2Q0GgdO+s33U41pWzM3V2aBju0glgF8spI=; b=o54YCYNTx0UU/kYD
	z5e8DdKACNzzScV1LgaditU+lnOH4Ou5Vg/4ElMR3KCYVUsL1RTSPFqDyt5QK0bd
	jSPqiyENlCD62517Zlnjm5gCBo8+jnELUQ1J4q5q/YNWOr4XM3HLFnpYWkufCVVc
	veJg57goy8kWdVJvIsE5ah7e4x6VtQLnke0IkbOLYI6EIoLR7BRQlS3lNt+wtlvw
	tufaD53RA50bkEb4E2UvZ5YieBtfe2c/w5x51f0fDlkP7jnYL1m++l4/ej47yX/u
	evj8H6/HZ93GdcUFAXqMyO8k6r1KdoK5C0Zxtj2GUh2a0QcNc8EFmzdYE4DqtuMa
	XmIvAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmg23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:18:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea2b51cfso110295285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766395126; x=1766999926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAvA3mZeZ2Q0GgdO+s33U41pWzM3V2aBju0glgF8spI=;
        b=AsWOthE5/qTN0RcTW6WB53W8mV3h3f/0sRhum3EWSHiaYsggYi+vGDzuNYNhJR47qR
         tGSu3BO9YY5oN98VkUYdV7sCOaKCVdA+EAfFZWf2aBQ/+DYXz9yzH0sJtiLgtY7msaIz
         4sCxp6aiiAprYP8UIyVZqU73D3iC+zTC+OzJfLwPn8C8XjowbeKY/ZXMqmU3yodrUGcB
         SMCnPrRcdNAY9mzjYg2v3Epyx+jeW37uQ0zqiJxdTEzp7oTzCq6+sfPSqC8MOGB5epy8
         8jI+hskMxNr2iWDuUrrIIcw6QhabDS47h5Aeus21UGsK/Lx07XI35EZl1TnU6jUbvokO
         I4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395126; x=1766999926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAvA3mZeZ2Q0GgdO+s33U41pWzM3V2aBju0glgF8spI=;
        b=iXdk4aMBRdipOYAgDrorGktKaSV/n+KCupftLT6TaaqmhN7CFMKbN70N3BVhD8Mb9J
         fgVsRVGMcVh0J4tqAKPMy4eRaE+dNDeKcCkK3A7dUwS+texGMPpYHiFg9Gbae7XFvfmw
         doPvo1gTtizDNNuBGYkch8GAnxX4oq5yQyMF4h0TlkTiSPtFOyKRV8c5YHEKOwdwcOT8
         yxtOhYNKfBhSszKmU5iDndzOyh7OchpUW/+J841X8TnvYl8919J2Ls298Kej7A/yXSgg
         NwsYFfJ6kQvDyXmvjuFzwok81luasAoe25HNj8pIWB2DJFlP0ch1Z+jL0O4wnYbRXaSK
         tfoA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Cm4Sw1YXvCesrjK7paYc2RBU8NJ1LV2YPWtkt/+Ly+1gxZlLDDTru1je525jmG0wuvHJBwBvXB6VrxO0@vger.kernel.org
X-Gm-Message-State: AOJu0YxNL8dP5I0dvG7Eo800mygXOJQ0Fp765urLsn3NZSGM4S+aQcAw
	b6glmRWHse2PIm+yUXEd3BtOWG8nsxOWUUa4/bac9blkf/KQACakTunu20pF1HlojhRCCC0Sw3p
	9kyM71Xci4Em73SnP6CgzYMx9cqZjVDzFATjQ/yHP5I6v6sXMWTPk/t95Zb1t8xOuDL8H
X-Gm-Gg: AY/fxX7SM+8U+dk/CqeNBbeevQLCp9S47wFxkSiRwcqxYnhYyJWiXTR2F3R728xSRa0
	4yh4XDuT8791XGdxnw60NDQq83B3EsJqOqA3Paqaifa1eFNZP74v0kqj6Mp2xH8j3H6GqXGmph2
	mdleJdeataCfBVczXkhc/Ded/T3pldySmNNcdvoPzVAq6QkybNLRlIhU6Sw5sXRY5GU+y1QVbEJ
	Ib80Tn+CE2eT09OA+OfAb3KgI3IRwhAPND/X6eRykTXVtiv6ipY7vHIeN15htF9QeVUABnLASDi
	pEqvOJ8t7RbgSZ6ZdyNcDQQ+bLyiG5Hk4+UZ+GMe/9sSF1gOhudGBsl7I6vADEajQJ1hJ0mhYTQ
	fOm4CjFDeecnaQ49KC/CzohOGNREoUHWv2L+KOk79/fYpME7j3i4bnagvzNqfZWh09w==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr119858451cf.8.1766395125888;
        Mon, 22 Dec 2025 01:18:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzz7ND2Qg9PP/UI3m9HQXYVf/0AKYGPMsstozA6wVCxvhjMvxQRErpso0zoeIbFSYwX0JS4w==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr119858321cf.8.1766395125476;
        Mon, 22 Dec 2025 01:18:45 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm588823466b.31.2025.12.22.01.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:18:45 -0800 (PST)
Message-ID: <42277e53-b159-435a-bc76-5aabfc00eaae@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:18:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] arm64: dts: qcom: milos: Add MDSS
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-5-4537a916bdf9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-mdss-v1-5-4537a916bdf9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5OWtzvzMJM2gvFHFAE7gpGnEvI9gnifu
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69490cf6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=ejjXnbaoI3aoak-AvoAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 5OWtzvzMJM2gvFHFAE7gpGnEvI9gnifu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfX2pOiDt5uPJYC
 f+U3iVcSf3p7wHH9ISrZokSJB2flGZZRV5AQnsvvj01UxzGp659eSnFVnHMuBctPDFoR2QufXPa
 rwLIeDKy5TEoXFY81koFvK5dPPHAywQEgtm2NP/ubuhfWRfmvieqgxIaKVwhHPNJHvAZoydQNA8
 eKDXrv7HhFBmX0mpKUvunkJ7JaKiHME+rUtOMN10IoAsbuywfIKI9FQRXJhQSHThdHjt8XRl9Mi
 7zIKIuEr2cT0PN1GlgoiqgTUHgCK/MGs1Lludiq31O8yNWmbce1KGGwX0UrSsroUG6uYSmbU+KH
 BC4Mr/KxeuKufpcBDyIzKmWGEOJ8FsTxoP53lnc+RxaTZb67dsA8kuAwUFyAAJaex/GfgY+wOPu
 FRGCCV6umTztZSt0A70/peT1Svo5JepO3vBFNenUW01MZEeVvOohuBXh0wb1H3NQdsKbzijiYYu
 e2fkZPGsozOaP2LRQxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083

On 12/19/25 5:41 PM, Luca Weiss wrote:
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Please include a commit message for the follow-up submission

[...]

> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,milos-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;

len=0x3000

[...]

> +			mdss_dsi0: dsi@ae94000 {
> +				compatible = "qcom,milos-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae94000 0x0 0x400>;

len=0x1000

[...]

> +			mdss_dsi0_phy: phy@ae95000 {
> +				compatible = "qcom,milos-dsi-phy-4nm";
> +				reg = <0x0 0x0ae95000 0x0 0x200>,
> +				      <0x0 0x0ae95200 0x0 0x280>,

0x300

Other things look good!

Konrad

