Return-Path: <linux-arm-msm+bounces-56654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA95AA806D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 13:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCAAC17C0E8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 11:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C8B2566;
	Sat,  3 May 2025 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAFPu/kV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F8D1E491B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271247; cv=none; b=gdtmydIOqXtPaDdrvGeeYMfJ7OLoa4HPF+Cbl9hNZvbPUc/HN3P+REbHET5GL70w+BmgFWNYNE45IWxMhs240/QyDZUhgBEj8MV1g4e3k9XGcVX5XQv2aStOilONtBy8RrA0JPpRi6+z6z8FhuYN0WvknqFjB6wxIJZuS3Q5Raw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271247; c=relaxed/simple;
	bh=ZZwm4+3kqdZaoUrJVAZp3I6AuMg2MOE7m9ADXt1bIrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhGSiGavA11SMG3aIB205ivl9/mO3BwkC/4pdIpGASNBSe0+ngUxugYaQZNz76PnPccLgq1OYBzIFzunWRaaZlbfIa1O1v7dNLZYAQF1DngdFvYlBU5QnpA4B/8OESBHmgh+QzrCRYBHUiI90qa3ottYSKHSkzHQWXCdo3uCmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAFPu/kV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434fl2Y007240
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 11:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZwm4+3kqdZaoUrJVAZp3I6AuMg2MOE7m9ADXt1bIrY=; b=gAFPu/kVSF7z2zpw
	JsmfR/Fl+CYVrdezpvlE9Fu9Thwz3L0nnxqf/tRBEO/Ponq0O360EE6/9Eyn2msj
	aN5xZI/IJvtfIQKnoT9wC++Yqfxw6cbxJ8EIqvKRLZhA3OmQFtOIqUDx3POo2wHO
	5SRfa6/5SeaagKEdvoKuOpBK3MVqirzm4OA6waCPv6MOnRz+xM9jBzGr/Xd8LvTT
	BTfNHC/Fmxm0sNv4L9QIcovlumy6c3UbVcNy0/0Pa4yd02Ol5XV3o9SHOzyU0xnV
	tXDGEPFAYJfPtV3jIOUp/cJrx/ikbgPWrmIy10uFoO3TSiHDr0D7s7qwquKrsUpW
	Jlf3gw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakgehv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 11:20:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso8188946d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 04:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271244; x=1746876044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZwm4+3kqdZaoUrJVAZp3I6AuMg2MOE7m9ADXt1bIrY=;
        b=uHBqdJvMW0BPGp8daZwDb7w0i10Is5eHFCSWZ1AKvOtlpv+TBCbmQ4fzvkSKt21ZSG
         cvh7DRWMzYujr0KsygY3mDyeFJiZ00de9ZrsHvbj1TP2DsLj0MKRmML6M9c2cfD4nCwx
         K4s19GC1eAP1b2bShX+/7N2Jm5jyQvgQOaum0ghrVnufDLdiIIZusoQn4rHn04lQtAgn
         wfccNTSgMKXHa8TYpoacVHAczNFETgPsH429IrqL6i9BhaPHV+AKK+p2bOmcpmsPl5V4
         Suqfs2E46CVSrD5xzMpfZMn13ngG0dDKr1DVcUB5sIhNe6VBVZYWfxZ6FkQeE4wq8Mz9
         Ct7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD/yUuk5tlT5QCOThgqYUr+qUivjJzT/ccIUnbNsiVNFIUp05jvXxiZOtu+3n8e8flTzP7K8jI60GwFtBW@vger.kernel.org
X-Gm-Message-State: AOJu0YxvEIXn7zJW+ssa/+eueapL2Xf6FoUe8bDv5thPxXFme+wIEc06
	JQ1lk5+0UHWg9qyUWDjE7BQux9BGSRa/OlY28XZ0+F+fOY/mJ0c6Z3pvz9sZPoAKFutefQSC4oM
	HX/rfA2snODpNEhfR36XnRhApe2IDW58Wyu0Qu52Ap+7mg3h8bTMPJa8gwjhZCTNb
X-Gm-Gg: ASbGncu7wznDvhEyjWKDb2VlsXzw8/bE2TqRSBpAMWG1jgRE9kY3Mi6b4eOJU+whY9p
	4LMr8WFBmoJj8eyOqyi5mEmUfPsWTkTErTMD24e7OmrwASAWfL7Q8nJkykorwgHEL1EoxdiWgfp
	uGhOqztHCBcVqERQFWCb5kivGHhYu2dq0ez5PnpS0vgMQzkptg6zofoBnoq0NIr3z0xs2VknT9y
	hpGwoyQLcKWQFP67KQ7f7zFioo18VOBGm5srH75f8XHcx0rheFjdXkiiHO1WQhyaQkPKdN4MHhi
	g58f0lqLUC3BSDWaMsRf+SHGJ1Nen5wXDERw+fhJCLC/HZ6qAEGxf+Xh/E2VcNGAcCs=
X-Received: by 2002:a05:620a:190f:b0:7c5:687f:d79d with SMTP id af79cd13be357-7cad5b4a71cmr328840385a.8.1746271243642;
        Sat, 03 May 2025 04:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPb7K6LSDWBZT1Dho5YFFLrfHITP13o2fAlVZXPwohh1JHtEdiAWbk/ZWvd2Xrvglqu4P/0g==
X-Received: by 2002:a05:620a:190f:b0:7c5:687f:d79d with SMTP id af79cd13be357-7cad5b4a71cmr328839085a.8.1746271243159;
        Sat, 03 May 2025 04:20:43 -0700 (PDT)
Received: from [192.168.65.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d6esm179999466b.185.2025.05.03.04.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 04:20:42 -0700 (PDT)
Message-ID: <64268903-fec1-4418-95ac-665738435366@oss.qualcomm.com>
Date: Sat, 3 May 2025 13:20:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add support to load QUP SE firmware from
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDEwMSBTYWx0ZWRfX4ZjpjHHLmJnM
 CVUfJtVedB7NAUbFfpI/L3DHGSW01AyCqy89P+0qad7st/z86PcvNNlrHHzJgf+O8MpaH+lTkX1
 9ddRlTw/iNDNfucf8J9jD2RWa2X4HKOfGr2NqEELbX5Hoy7+qBE+4Ev0JyvWd8O7G8HyiKZBtJe
 S7uc+oyuH8jLQ351tf1/iLg6ZiplXU5IZoPK+42NsKjYjIZasE6N6VaIVbT7VlbA3+6tZPBA08z
 MROSWVLsNoOIRBQXDPcKYKxXGBWMr3roYeoQnEy2lb9PUwfERx0Eo0kh7l/7BtonioxS+nPo12+
 cVf8WgZpkt+K8Gvtvz4VfqNUh+3TGvW+LikI0/ytps4utrglhly/On6ozBROa6DcK0fKe4/NTNV
 KUCBdm182nx2/u7jyLzNsM3NvgeGCAwYVWq66i3mDoLSChvnkt+I5eP7tbgOnkEG0lLeATQ/
X-Proofpoint-ORIG-GUID: gRCEdoDHJwjVi3_5_oVxYxN62JGdfXGz
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815fc0d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EGseXkZT_eIdJ_7nNB0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gRCEdoDHJwjVi3_5_oVxYxN62JGdfXGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030101

On 5/3/25 1:10 PM, Viken Dadhaniya wrote:

You sent this series at 1:10 PM and replied to review comments on the
previous revision at 1:11 PM - please refrain from doing that, as
you're effectively stalling your submission because of lingering
unsolved problems that ultimately still need to be solved before
the patches are merged.

Konrad

