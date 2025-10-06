Return-Path: <linux-arm-msm+bounces-76087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8ABBE67C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A308F1894972
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354A2D6E61;
	Mon,  6 Oct 2025 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZH/dAeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48B2D663D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759762322; cv=none; b=azf1FOzosUW9f/hddojELuNXi2ZFoujWfoMlRGJXHCgppsCnQyFv0jY82pqDX5StfVyKfryQdRcTN39nb1fIe61PkowNHfNXGdFGHKtzMWfxsFl8IK3ys6rPrqZ+oYPx9yc9qpRug+BYayOhgOBf2EUVW2o0dRUuxa2+8PaFSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759762322; c=relaxed/simple;
	bh=10PEtw6twoEMwTGl0F8JEVM35Pm4DuZVOVadFVAmEhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAIMWtaDiDtaAhu52a61e/FPs6VZOhVReRC3NlcgGeKxzmOywip7w3uoI4fwXceCKjyFHJ0aid1sHvZX11f9NtcfWaVFTtFHuonraOQBoq3U40CQ7d3RLTofa1MoFhyHqdY9Tbnhh8UhgKqHS04J5t83q2DpFm9DWG38/IK4yME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZH/dAeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59607Bqf013320
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uykABRp9hc8kRbSBpNRtLJa1EeJ+2rYcJ3127irL/TA=; b=gZH/dAeAjED6Djdw
	l2qx377PkuBGVZiofC9iJ1qxudZMCcOp7IH2VV7sJjAQ8KIcXHChf4cukIHDXK33
	MhJyXCjS4F9Xy9aEMukTffYsbc6KadkyJ3TKrDohhJfFyJ6D89DSVIarjO5D/Vfw
	GnVXkemJ+22pRDFPjKnZEL8fALTgx31mjK21z/5JJA6FItTRPp5f9EYxKQ5d3gHE
	/GESbJ+6AYpak1NZKFiuWL/UlhOXM5nMAU7RfkTtOtzFPgBmQCLQpgrLhNeawmFR
	md1hgwKbG1yGqIjeCEUw7QhcgFLuExUn3zszvpRHYjru8olWjh10HKdK88T1hEDy
	9w1lXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgm84m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:51:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e015898547so9292971cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759762318; x=1760367118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uykABRp9hc8kRbSBpNRtLJa1EeJ+2rYcJ3127irL/TA=;
        b=gPfksJQmkDmWnVo7q1VJdE5RWjcp2c411RanORS0WfpPY6ShcPtee7PRanVVXxOGHH
         TONsvlIFuxhIkH8u3yWwuKEASMSKAj63gE5RafIO6IEAc0S67u9qtAuRmowZcT8hgeyx
         nqcwO+GvMLLVOxNr7+jwt4zGjJfAZq/AwRGUjrfw4HRZm8fNxQuVt3A6gzn1WDyFPGD6
         t14AFqPrd4UEZtRrzBOhdqlGygaHlrtsw6Zsuut1uPGBNVtFmizpYGfT47QiCgT9odTI
         oytoWme93TA3cqjrkFnufBFKUIzJ6zG56o+7JaMUwQgSSrAjWcU4/liDdiyqjAssqY26
         MuQQ==
X-Gm-Message-State: AOJu0Yw3jcoV1VQ1fsT0tT4+PjQ22eit5TJkvgTMUn5lGqgi/WAVnYKH
	w8b2LGnoklqZ0jeqtLosxL+s2uc86kRhURT/9tvh8RoVdOnuEp0RK6qy6pZ+rUMPXbbFUjH6oGC
	U6+6mQ5R/vayYjWt3QseKuOYaK65EHRklCe8TxQ3JQh/i2mbZd4KXYWL/cSKvlv0sO3xT
X-Gm-Gg: ASbGncv49boMvYb4kjj9YCRpqWomUYCge3Va7h/BJHXOJxBDxV/Ibd22prw3/E90YKR
	hGU1uGvOZUwAza3v/b6X945LXGjGbPY3x/TH/XbeEb/HA9NnrZeSAKf2rg+8cNVn2yky+tlzV0G
	zMaXsEAO05cIsxv3cg2QQt4KdVnf6v1uzkHM0p9Hp5D7kQWh21kQqoBx5QfXjaRr1f1YEEPI3sE
	U6MT0Ll4RnJIxr+S2w7n8MKUMEOMKHUO1RN+xH3h6fxU9Wj/bseKfupPOfnFjZqxT18y3SNgO2u
	MRw+EhpL1tX66lLYjmCvP9JOPUoDK8qEuqTV6jNaygXrrARl0f2E/7Vz3rC6ty+XCm3qNeGwNnk
	JC2hwOWcryVZqV7ycyA3GWOB+7EE=
X-Received: by 2002:ac8:7f08:0:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e576ac746amr103555481cf.12.1759762317649;
        Mon, 06 Oct 2025 07:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNQFQNaOw+YDqi93+F/z85X3qTNZ4A1Fy6bJXByTp8nf40QE5W21EnEc61g5O03NMlZ9vJFw==
X-Received: by 2002:ac8:7f08:0:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e576ac746amr103555261cf.12.1759762317030;
        Mon, 06 Oct 2025 07:51:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4c855585d1sm441287466b.67.2025.10.06.07.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:51:56 -0700 (PDT)
Message-ID: <9d503228-2a54-40f3-ad6d-500144e14b2a@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:51:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Correct gpio used for
 slider
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
References: <20250927-slider-correct-v1-1-fb8cc7fdcedf@ixit.cz>
 <babe2e5e-87a4-4871-a836-ddbd9cc8d868@oss.qualcomm.com>
 <8a21a653-4dcf-4418-9bb7-76e940ddcab2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a21a653-4dcf-4418-9bb7-76e940ddcab2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX57ZjufgHfJHY
 AomAgnhhm51H7zdlVhKLsYHRI3z/EAQiuSVDq0epVJ7TAh0bfBku7dXgx/xCgTxRYX8l0NS5Xhr
 Mcuz6Pk+ysDb456UxHYHK0NGHiAo2uS/LLMFfOZmvSPZ1rgGTs1r+nnl1wrT/0n1pvmkuker68u
 B0Z/7SgQaXQqcikSbFZvKBTPLa9sdF6fChHF1GDSKh3ueDh4fOmgoPGo4Sb8zuPaTXQJbB7vuKw
 FkXoFI3k3iBqFXFwQCsYNg9cND0zk3zd8265cu3aUWZ0r6/4RbTYXbMIEZQDFEexz8yKtdnou0b
 1hvTjTv5QDbNvxqKO7AtW7ZaKlD0cjFlO/3fKXuZ4MgxGrzoQbQ1Eoa4PCNBo+708x9wEojK7xb
 uju4TXHaY2YfnYQ7N90kqU9sx6zfUg==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e3d78e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=L94DSdHg0uYc9iSAjtcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: oBfTS3vF3l_RJh1GA-Uo4_tRnM2Po909
X-Proofpoint-ORIG-GUID: oBfTS3vF3l_RJh1GA-Uo4_tRnM2Po909
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/6/25 4:32 PM, David Heidelberg wrote:
> On 06/10/2025 16:15, Konrad Dybcio wrote:
>> On 9/27/25 1:20 PM, David Heidelberg via B4 Relay wrote:
>>> From: Gergo Koteles <soyer@irl.hu>
>>>
>>> The previous GPIO numbers were wrong. Update them to the correct
>>> ones and fix the label.
>>>
>>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
>>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> This is currently unused, can you bundle (or squash?) this with the
>> "add slider" series instead?
> 
> The seriess didn't received any attention or reviews, so I hoped in least fixing the upstream device-tree before someone will have time to look at the whole.
> 
> Would you recommend sending the "Add support for sound profile switching and leverage for OnePlus 6 slider" again, just with this small split improvement now?

It's been a good 2 months, so it wouldn't hurt.. perhaps wait
one more week for -rc1 to come out, in case anyone you depend on
is *that* pedantic..

Konrad

