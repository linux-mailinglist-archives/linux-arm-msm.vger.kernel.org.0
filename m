Return-Path: <linux-arm-msm+bounces-64893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB368B04C81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 01:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43F804A6DCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 23:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AE5279787;
	Mon, 14 Jul 2025 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOogs6hZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B32528F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752536515; cv=none; b=sxCTYUYIGY7Zdz9UnoKkgf3jQ/I7Je4VdaqkcHu2dro2DnAqVDgBaqLk/N0mwt3LiDlV54Nq4qONUzNahHTJQR2dNZ4gi/zcgAmqrxMKuk9L1yCoi4ViCorNdEo0MbeLiNPs5jaE12ySMGrHji8B3TGxOkZx0e3X1DrUco9VaTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752536515; c=relaxed/simple;
	bh=ey7rY+Bde2mCktXqa3uo8y+vyr6TGOt6Ny2N+VLQwmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+j2ZraVgpnDjYA4PTT4zi7WZAEbHC2vrgFyuMlpyUm7Vd3UGGp3dy0VRFKn529V0hNAQmpQdepSiyyUF1/v9RwPFfWOBfHMpv5rizD1wy6mdhGj0YOGbeBjyxTYgKvuHqv2etgmFqbRWkV/IXQzP1bo4V5PExhXrZabVZo2Fic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOogs6hZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EKIe5d009120
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=; b=cOogs6hZKzC35kE+
	Ei4d7dTfIKS+kLdyr+YXzjV1e202w3IiHFk7GE3C9VkxfXBMI0lxvB/6Qpx7IVzt
	lYV/5Zajz8+aDwtACN2aqgFjv79iTXy5Nxu/bquJKGEClJhaZOWYVqb2EB0npdin
	KdHoXwtCPj1aKqKs7J7ga6LYjBVCCHop2A5pYCglBzg+HqB8mZlKex0lenxeruFd
	/BWqWEJc87yXcuDNlXNKmUxFTMywZXgss+ULgcLGVvIufxHpbBeJ5kEHex9k8ltB
	++86XwX1XNNcDyBgc0ytgON0ZWCLsyQBeUMkpYCxjpDVFh2hjgqPnby6i9SGi8BO
	QWjg2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut63x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:41:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb030f541bso17286386d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 16:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752536511; x=1753141311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=;
        b=isI/v0prwN6WmmH7Tsjoe9bgtXv4gsqwWYomP3Ztx0zrl/KNRq4rlMO6qj6/9QpR8o
         VrpMY8d3yaKqyQur6pT6uZ/jC9KBAXQtnsgq4qBr3dxanxKVVHomg9u9/8Svr+/UYMy5
         5Oj6b7iYchVbBkEltmuSgVrLsnx0+ehkhT+i6VcLYTQeyJ5Tigh4uoBJzxi9+MpEoUhI
         bZ3nUpbwG8xnGEwI76/uJ4YtwRorTExX76jqxGcDxi3DbcLakQEp/p+k4KexWsOEWSQP
         H3yOjGeoqEZJ7U/Mwwhv9cew/DswLx/I4kTrvNkHRPloSXyIpIBC/MD4HfvEugawRstv
         /9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/7V11bH0b1LVD5ZtNsKDo+KaoIm4grZogEe76XJ1W20WKS0tL4G3VnNjDmwwhFExER3199+UNBaogBCrs@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXR6dLIAmepJXIGFM4vCjCxw2hTQDV8zhPro1XJUlYWts5CHR
	Bt+5Kky5hm42EpQwyJPPwCOStgNIaLpwI9xif0ygIBkYJgTmyFXGwAjRL+pxC4ANdTDUQ3Pn8ZN
	l5JqdbzMzXrHkw+UFs/ZQtHRr5+DJ2euS6arjpwnw66wA76AGc7yZQRcmQZ+QMEVzjIE+
X-Gm-Gg: ASbGncv4xKke8Bfb8DvILvwIrqTkAwEkJYqIY40lQIGi7rTupQv4KXMhtC+8jtQQGa6
	vSTQMLvnAZUTQTdS6m2CdeqrdGKGH7vF/KKaYcMXksdF7YdyuVjq+qKz89ENX8v34uPRnIZOl07
	gkR6jqBlI2kh0XDYJ5xYxvNcYdL9YqV39lMKM7LZLXvE4+3g+ZIxJs8Lx5Vip0PFqaGFcLUQiSL
	PuanwwuWLi2clRsUY4F3AeYAng0WNFB+kZlRc0s5otQkqX3NNII6kef95I9dOWXecmlfSRQm9cX
	2PKTqkVuxHRFR1ka9hesOpaE2X0PrHCuDjHn9bme4NeyNZRmsvZHbKBfQSa1kxQF71CEPKDtGV1
	gXtxkYI4XdEOkP6DXGere
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793406485a.2.1752536510682;
        Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG7XfqmPDJb/D49KYu7FtbuASdqoalUiWXMFW7Y9kAKQLdst5o2Dt8cMYPxnLj3lAeTolOpQ==
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793403785a.2.1752536510136;
        Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d10sm893953766b.5.2025.07.14.16.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 16:41:49 -0700 (PDT)
Message-ID: <3ae51350-61a8-422c-8e39-32ea6d8b2e9a@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 01:41:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
 <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
 <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687595bf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=ICpbbQuAY509VL3I2goA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: RijkHANGhsa6Frwm7Uhn4Yo5DGRC1t5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2OSBTYWx0ZWRfXzyw0ExBcR+u8
 D67LsuNJxUokq1TREGNLpKCCzpm4Mw2k4D20qDysvvXb4wwOMR8thxOKjcFu9zq9h8o97odAudP
 f7mvIF5BJJ5+JL0uAcAE+JXMYVUohiWDcNOJX6NtA0fiuRG25jDV3Zm4d7w/CHX1yr19paKrN4o
 5uAwmTF6Zfi7/dxMkaHnTTD1I4jPZlx3unwdb98YkE4MjY+a0claxCHB4qcz34c4Odt05DwjL28
 A9IUHHB4rrNoVryp0RzLCG3s7EFG3fOG3uRTp0oTIaixAAer0+ZWr/ZY93PSBHXA5QdhxLYSrs5
 R8gMiSgQpZwKZbVBXfbkCkCWUMtzLnVWnmCxGyKct4OoTDnApjHcuCQ2VdoF8w7uNCCjlN+TKKU
 oPqwPH5iWtDnx1rCD4k0WXDznmsQlTApKy7zump+HvP1eaSpDAvg8wucXIZWwVFjeS5xCco8
X-Proofpoint-ORIG-GUID: RijkHANGhsa6Frwm7Uhn4Yo5DGRC1t5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=815 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140169

On 7/14/25 10:39 PM, Brian Masney wrote:
> Hi Konrad,
> 
> On Thu, Jul 10, 2025 at 12:09 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 7/10/25 5:51 PM, Brian Masney wrote:
>>> The round_rate() clk ops is deprecated, so migrate this driver from
>>> round_rate() to determine_rate() using the Coccinelle semantic patch
>>> on the cover letter of this series.
>>>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> come to think of it, there are a lot of drivers that can not
>> do any rate rounding - perhaps we could introduce a NOP implementation
>> in the clk core that we could reference, instead of copypasting
>> int foo(...) { "return 0" }?
> 
> I'll look at that for a second round of cleanup once all of the
> round_rates have been removed from the tree. From what I recall about
> the ~200 or so round_rate implementations in the kernel tree, there
> were maybe only 5 or so that cover this noop case. QC seemed to have
> the most from what I recall.
> 
> It wouldn't be hard to make a Coccinelle script to look for the noop
> determine_rate() implementations.

Thanks!

Konrad

