Return-Path: <linux-arm-msm+bounces-61485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E5ADB684
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1343B2F03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30919259C9F;
	Mon, 16 Jun 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8F29TXY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8436E2868BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090855; cv=none; b=jNcF8puv9JZdf4+uIVyF6UntrSieUhAR+G5666ywllaFHCXTobXOZxSOmQMJ2bCZ1teGwaYGyNddB0lpLzJkiBnv/ECftei0Oa8jUUIFD6Z+v4moxLyLpVqlvUnIYUHCGHQI0hnltkiE9nzSwPLHUWztI2I3ehphKrQFgZsY25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090855; c=relaxed/simple;
	bh=NDEkmxPGrGCG8ArtMUMwszjzAXpcPJOg3oxz2zuKJt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSNm/nPzhOG1acETQi0dnXMaZAXOo2BTDQfM1yaaq7Fphoa62+L137lmSW9bxwmIDzkIb+kD2+jLq+JLoOu4kdM9iz5AEJYHhx4RINzPYq1DnsXq0e34iVAN+x74CP3U47LyH6N1lH6ecGUkt01zuL9QQUKWcEF/HU7uJoJLUSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8F29TXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8oofI030300
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mu+psP+X+UUrmMw1teQblkErLFop9Y7rtZWa3PcMk9o=; b=K8F29TXYiy/ZZ9zu
	3y1vn87x7SCZcDXLwM/nsiTixg/PcGr2OEd5nTv0yjevUZi7DVAF1dy5jCE9ouLs
	EsMCWMFWPByBLg2sWIqB+rf75HvfJUSoOA4abKrSHn8udoNU8keMAWTEsIJOKsop
	plcW4jHkdyftDZurJb/gbRlr8xD7dihLS1SdFu9YfAkZ80AQfVjgp04jRk8OW815
	OLfrHShVyuhXoFSU4vCi7EZx17TYk8H9jVwH2wokhHpCBUpMkQD8MuNE7YMLeS/2
	t3CLt17W6WTOYmo9ue8SBFl4JstcizeWy1ycwyzIB87Pg7X9wCiUUxvi246Hw6BO
	35pX7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791end6pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:20:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso10631551cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090852; x=1750695652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu+psP+X+UUrmMw1teQblkErLFop9Y7rtZWa3PcMk9o=;
        b=O0B4L1eJpi7zJEO+dbNliA6d6NJea2Dkh07ai2SjNyeM+hGLPvl5C9wP40rKrrQ1lb
         meqymW6/GcHBnfP9dSDm6yAsoFT3O8Jwno9zlnJ5FOk/aphqO8bkU+sX5pv2+V+Ugnhr
         d/jbc2IlcI8RxQOofYql/dlv+1bz13QRwc3i0CQzBKWiZJA/RZHMXah+5OeW/4dLZex3
         5tncjWJ7sD9Jr8/vfxr1f+NwzWj5CNhMF/yLarhAbcbcRXaOAwEPmJCD4BKUpV5JOifq
         3RWp7IybxJpuId2NQGtwZRpGATntOMQtgSOsAqst7Tx3ntvyVAmf8AIPIjBtjDFP0Ww1
         BM8w==
X-Gm-Message-State: AOJu0YyYbqQK2sw0gNzpN+cmgcjcFjb4Ivnui7vTtD+YxQ2pZjtSTWFn
	FAGaroRo6K9/CZqY/fq1kOTKfsyuS7iymy3jXzPoqPx7XFGrDYftJniOPitQc+EaE5yQNOsCEkX
	Ylr6YlPlFKSUqfquLSUoDninNRBWnMcMYk813LDJG5PdYbko0OEk6P+zo1d0dPoOAJ3gC
X-Gm-Gg: ASbGnct/FGxs+YCxA4Aok45/2PZT/aG+8aP81JLIqKhlZPRTllDb2Ya7wnPoJApl9B5
	m8/KZw19XaWRtt8XLghhCQGtwb15DBg4gB/NXqcgO+QkScHCHJRjYzvoAeR0nlw48IFtap18CQ/
	aYO1hjwGTjrmHq6wJWVhl+yZama8XHAFv8T69+B9o+Vgi2P2CTlZSaX2beRAVOzK9ksVy4d5BEA
	upc0ZmM2HYjpRDcqOfeEhQQmmVS/qg+NPlDbZv/IpDqp9iRSAYGId+Xqmg98j1E5BXweMxv67So
	0TjJYMickrG1aCnLmss3Ui6wxnwnYZ0AkcOANDL3e1kOWmcoUWU7v4X+By0DWg+g641Mjbd3oLB
	RMQQ=
X-Received: by 2002:a05:622a:451:b0:4a5:a4ad:c55b with SMTP id d75a77b69052e-4a758bbb5camr1770011cf.12.1750090851514;
        Mon, 16 Jun 2025 09:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN9jae6FOVYKQqSYeEw38hAiQvkYtCqfi+CbDM3+x5+zp/5SRgo/YqSvoVNOrVijkqA/tVJQ==
X-Received: by 2002:a05:622a:451:b0:4a5:a4ad:c55b with SMTP id d75a77b69052e-4a758bbb5camr1769861cf.12.1750090851050;
        Mon, 16 Jun 2025 09:20:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48f27e1sm6496194a12.29.2025.06.16.09.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:20:50 -0700 (PDT)
Message-ID: <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 18:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO
 ranges on RB2
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250616143341.51944-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250616143341.51944-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dm410Vddt6bEqN8hX_xrq_R5lOO_naEB
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68504464 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=Uobm0kU4YoDV-O0PfCkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Dm410Vddt6bEqN8hX_xrq_R5lOO_naEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNyBTYWx0ZWRfX2chUXOo8ZC+9
 kgfh6b9wQdEtZWllo8/ny3DcMrqpso3FaHzQYteKANTUvcRW95u7bWdXo6W1G3KU53+cW29Q9OG
 zGppQyL6oYl5i2F3HVHplouz/Vnq3zYda4SKLTq8SueHx9sJfiszf+77upYccvCKOK5rXl+vUJ+
 gdKiPBo0SnpedCSij8Q0oJjaaZzqJqbrU1lfRp4Yqz0wOLSOc5v6OrifWEYC4cO/N/J/xFGmvt0
 CkStkPrhtGdE0AIP7HhQWyg5xuwKav7GwiodGm9Z5lCBSRqz55WtThkesiveZlXJroxgBQl6k8w
 OTZnvG3XGhrAVW9avNhRg7yQEWGnvSQWno+SIrOnzjVs5+dJI1xvedt0BVsHCvBcXYe0tLzPPzY
 YPLbXQndeV+HbVtl96EuF7vxUM9n6zDrFpjNNwmjLXCgxD4Jqi0OHy+dxO/Cgo4XcNpgw3Iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=833 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160107

On 6/16/25 4:33 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> GPIO12 and GPIO13 are used for the debug UART and must not be available
> to drivers or user-space. Add them to the gpio-reserved-ranges.
> 
> Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

That also makes them unavailable to the kernel though, no?

Konrad

