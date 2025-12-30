Return-Path: <linux-arm-msm+bounces-86985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866BCE9E32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D8BC3015966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FBC23EAAD;
	Tue, 30 Dec 2025 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5CqhybS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J907+xMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635925D1E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103929; cv=none; b=gOfRi/vg4d40jvYxlB/6JI5cXTJmDBoZYmIOXq1d+a3r6RVKbjNBbb9idyKd07ki8L4cFnKwJASQL33BMdCnDaGXU9yWFukNz9/PTLKZM2KywWYRRUXuU7ZxGt1SSvbtYlipgMbAnLuAUdZuSEZknWJzuCYUWDFsHrrol2k/2IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103929; c=relaxed/simple;
	bh=HalORjCi33QNYWGs58aPCOmGJRqijxJwJRs2c65YiPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwZQwpvtzLhUUBqAs8UHdxLQ1tBVL+blNAGf9+w+dUT2yvAK/Ts/k13hhmhYzAEfZ06bERon9VsZ+Rb3wE3HfB4I5TeuWET05KPboLY8MNQs2k9pwW1xq81WdgUyxOHYGrfkpqPnX2RtDxvzTrEp4QUz5BjigZSdHIcOHFKc2VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5CqhybS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J907+xMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8TZox2013502
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=; b=c5CqhybSYs4lu27D
	BL0ATI7xRfF5THO9eETo0uIn9M9+EHPhSRv+15qAisAZ7XVA/CiHc83nJO7+Lx//
	iB0qS8uMeOh+ffFPrZg60+13q4/1eoLvol17wW6n/k8XVWxxqdJNgFQJKyMisOy2
	xezZsjQY6Ycu4d4fF+yzEBWBeilpf+9RE3NrNXKzY1tAV5Qlt9LhMPILXqveGujR
	ngzLKPJOn37ks6UWPg3NfH0e29mQqOR/CO36cH9bXDHL+/nvdNgbj2NRjm7Fv6gS
	XnP79OQfo0wQBOOzFOaT6m6t4Xy5HsFx1WWXhAhyO4Xu1b7HBIrg1fKTv1Bh1vq0
	XQC89g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1bc8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:12:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso39763591cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767103926; x=1767708726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=;
        b=J907+xMyYJqu0YvFAgF2LFOO+CdwnuIkcOR8bfQ+7QpHwavyViU2S8kwPvH4yaFEk+
         NbSpcmoImtkyMUw/PnzGp8y/fa9BtTvsw00Ap+WkCUjUjGpxOYkPs/ks8OAf9vIPSiuI
         mhqsSFUhbuS73CpTUHkNcJMDlufmibBXkl4n7cwaw0Q6DvzSu4top74k8cH3Wd6FzWbX
         qpBptsf0O3AMzLQgnyb1XlaTUCRb4lCAcFRkexOzseARPp9m9iFB42ktooxGn8xqGlyZ
         g2hGOu6TQ5vKeoBjvwIL0oFrTNwj5rtzVqX5PO9tbqzyF0tfiVXeP5XYNWNJYz754g7k
         UFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767103926; x=1767708726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=;
        b=e9v/9+bkHwuUSAOP9XlVIt9vvSqVQht4P7H910zTpAabAG/cHANkvUt2JRLJfz/BR3
         yochFX+hIgo9CE2i+uiCH82T8f6a/xZaB2PGcr5Cymk681ua/iwCkI2g7LBw9+hfCTVk
         XfS/0sFFJmDcLXpx7KAaAhsbODJb8p8Cxv+aQVPlGiffBx5tTFGRFDUCBz3HRCN0HiwU
         4FOQhVuPi/V5QcjNzdaI0Nnvxj9zRTs+PEcxUDBTIIQG9HNkAyPVcpADfKU4vjQJv8MC
         75HCfylYubWwLRPkhls2zEZgk2rDMipO5tGaMZUJFUs7Q3hLnDS2HJ42inZEVc3gnfj6
         7Pdg==
X-Forwarded-Encrypted: i=1; AJvYcCWvthi+r5V5BhCgvdRD9YZTcKcODbYPM3S6iKY4mHU/U/+hT6NPSpU1ClQ1Nc3YqX7plwYtLflhMJ0z9cKh@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0xEOoQbHkBwMli4QzCvivhj86lof6D/Ch0L2iewm1/V4Lpw7
	aTCt4XJeIZ6lC41rgTgnmwOtvRAFjGGEN+9TKH9esM5ROLxzj4CDQj0jF3H5gIE0kNEKD1yCyb+
	u2r+hfK2j+9EQZXHdok5Jph37iq9OfNWlHVoFMYOzOUsKnDGbyM09b5mYA0BXQcY/8780
X-Gm-Gg: AY/fxX7cMWlbFGo8DW3TLlRuPsYTJ9wa9wxuhHTmR7WEDt2crsdLMp/3JYE70oyGTJl
	DObsB/9K/JHp4AemJVZ7UOrFCmXPv59h52GQWoLPuaT/ClJ1SNrBaN3BQOHmxvMtEkiF0UkfqQI
	A4vr6dAehrw9lUp5eYAc37FJ4/Eb+zpB7B+ZK9wFoLwVJhbknkg/umM0xGJjwRE4bVxMdAjHUI5
	12o2qorvIVsMzFWXj9f6Hc55ICbFxro/aqrjykaO3u0E0QSjU1pV1dmlBxCwK6Ogw5b//rdhx5E
	hvSgldfC/qcuWo4+DIpZ698BSqhq5fN9XwU4tDSyngD3wRiTAMb3FxS4u2wyyo5x74cTfa7oNt7
	6E3CftnyJibwOxhfBV/fuNwhU7dIeQ4GlVUcyU4sQqPm7DbE4yG7TLFEJEFyG6M5q0g==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr344777981cf.11.1767103926431;
        Tue, 30 Dec 2025 06:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjqp9PxLRQ/4vjh1lhSfvZgUJ/bKmJeLnU3Q+HtKB9o/HKRUhKyUByzv3/wHYsWz7jfIc6Dg==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr344777461cf.11.1767103925985;
        Tue, 30 Dec 2025 06:12:05 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b830b5fe8cfsm2133862566b.59.2025.12.30.06.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:12:05 -0800 (PST)
Message-ID: <0d3e5f9e-b9ba-4c2d-940b-de25ca8fb208@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:12:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
 <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PwO-nNlCIHMl7WoAYSNmqunKItwX4p3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX4jreSmmJdbf/
 bYCsO44TX5tBypNmHP5UFYIPzdKRex05uriQ9nc73gIJBRQbGDlHFBlfhCDz+IW2WlJhvAaBZtE
 4TbH+lQzRalqvVZHfDUjmE6xEueazZE3rP3RgJ7YLkgMQ1cya7fHW+aUCtpvLJ7zxjy5Q1OaAlA
 Jmf/LrE5S7QyahdVJDlGTJBzMUV6wexsBgyjBKdJVKUrEjnWgMs2OBYw38hql9gClT+XeDB0xrZ
 jZdGw9dtvgoJNvPk7LDk52uFAXtsMjofKNqGhuqR+XMCwolwGb74XMTBvZsvFzI0DfxWmRrakbv
 VQwkzaho5DEeKFiwkNhWI+5EPSgQdZrI5KoS6q2tZAGCjPSmzezWh3Uzz1Rc0KcvbNpAFz5myJD
 bpGmN4wrTeRo2OD3FER+qaI8neBmh2gw4JUFptY+OmALvDEqmXvIWF5MNCZ+P97PSEcuc5hSRnG
 gYojfBywCGPqmJqEYuw==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6953ddb7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=be7_MNJoD_q9xFtD3CEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: PwO-nNlCIHMl7WoAYSNmqunKItwX4p3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128

On 12/30/25 1:33 PM, Akhil P Oommen wrote:
> Enable GPU on both qcs9100-ride platforms and provide the path
> for zap shader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

