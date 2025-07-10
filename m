Return-Path: <linux-arm-msm+bounces-64425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5BAB0084D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2803D585B4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E742EF9DB;
	Thu, 10 Jul 2025 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmTGLJWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD272EFDAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163756; cv=none; b=kqtb8jqkzLfLjm/SNTDeYgk0/Y9R+m+iVyOXI4ruIxGYbql4uVqnkBLWDCMQYnF14zABD7Sbb/1cBoECeg+/UvO19vZpADRCYyOqQX9Di+p1nLeX2er6CK4yYGCkKCITSfWbZAl8WUFfw1cf+l+qdZ3qTiZMjywIZx0tkGZ9MFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163756; c=relaxed/simple;
	bh=N/aXBvT4CRm/+YYruIbNGAgz2RyYehB6jiUrVJyElIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7LNJigl76TSI+jGQoOaBVjR5T+UQ3TenFJyM1ktgVEuhMFo8CcignJ807dUBCNCVa9Sh2NAVD7PnLOJREgqd9wFOu08bijPsJIglu3EW+dTF0koPt08Iz8GI67w2rU5kLfi0Q5yU2oF0dPgqfTINzLPTrmbdBbIkmDDYq8v6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmTGLJWI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9FNXV030758
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=; b=CmTGLJWINImAHKoL
	C3DmEyyOHxwXFEHYDYwh9nNs9+qHt9oDnwlEHteC1OnCI6yisLYB4/ucmnYvvLrj
	9Gnq6RF4WjuDnhLew1VVzZh/snqX6sLbsFTDtDT88C0KSOr4Jr9wcZPL9Eg85AL0
	Kx45dAtjgRyOnaoGdJSd7P5kZQCjABqt56jZujpaGtfIVeGs0RuMBAUfcJSAXwyS
	vz75sSrZHISd4DCZLQUP/EVxIiXZYB3tRoFHAQTFkBZMnonxyXEwXKUUMo0Yke+A
	gy9X7lG2p3TUYGL40TOiN0KoHtT2U+B6nJ8XwMK+HwSgGGmHgEC7eAMpNCw7vVSq
	VAOVAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg5jrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d440beeb17so13476785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163751; x=1752768551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=;
        b=d4ZWxtlbPfZ29VtM1nXe6xfOjfNhdOYd5JstQvPaeMUDx5LakBv1PO99jSUt0Tds5y
         3x0AQWd0yCt2AHHTQlRPY7OpEKLKcYUUFJ9WS+DOX+c7tsyYRLOYa+vM08hv+6mLWcUl
         c3bxvOaUWl2hxYmqNA9GfugRciiOnnEllFtIlSI9uHKgZcOLP0ftBHFxgWhaKb1DcjfS
         raBz5ERbnJyw9evCsO1Oae1wWuikvMp+qOIgqM/9XX6Vt2fz5KCHY+YztqmWuXlSnsvD
         j0S8gY9NgvsCrhV+GUZl/kF8JmDL52nhJAAxyBomRDvtyqQ2VcEKwlW4F9OunE6FNVZN
         Enuw==
X-Forwarded-Encrypted: i=1; AJvYcCUyECSvHVoBGgsDg2QK8L1NZDyuCzLJBiMc8ImlCzSAfShizwwIUdTu8vNKNXKT8E8Tait2hI3JTW4K0MQj@vger.kernel.org
X-Gm-Message-State: AOJu0YxmdfdR6mpdxcj7m31Tgs1zn7PD2JPk4kVMhYa75QWqCP3kffnN
	IhCSnjoXQ0KKe65OieR8iukvjzmqjiaH6xPH+KJoa5fkRNApGWQsCMTtvPQW3rWBF8CzWBa90JY
	qUaayYc2gym1FhgQjp8bE05f/y+0x7vHhoapDcA/UhjdUVtZ1aSsPRz6Utjy16K8N2/hI
X-Gm-Gg: ASbGnctxPg9dMdaMh44W6uAcONhMwceByQdtARDP5vsikp5fJDkKTRzDWuVDj73Kalg
	AdfOnaUaeDMu0tC/Yrt+Bo8KyGjSzyZnPg+cHqaialGSRlScYkKuLhBUPVxVXVgpVWzokitZQ33
	irGbAPNpvJjukmAMWtVSla/ccw65DowpevZk9xVN1JOma2Hep2ll9WnqJnhEZE+dCE/WolcjbMC
	DNJHVlF8xrRmvY38dR3uPaQAEV/5Bd2Vgyw9B5v0q6O8XDKHJNjCwpv6ybz4k0ua0Hi4FJUeYlK
	jnQgUSfovtSciqu5gW0Q9KlIRTxhOgbcq2dayZjsCdNvH42VLGPJyux5WQnQD9FbSlcHIdQ55Ud
	Jfb0=
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7282585a.0.1752163750878;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAeeRzlvLfbUeyU2SSOBFEfwuLO+KS9f2E54G98Fl8PmYU4woiYSJtTIHX8QfSQxlGnb4YxQ==
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7279685a.0.1752163750275;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d10sm153830666b.5.2025.07.10.09.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:09:09 -0700 (PDT)
Message-ID: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 18:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686fe5a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=RGHBBWgGYxkf0F71jXEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KxFXu4XfAPff6b6SkLBw6vPC1fMk2ygs
X-Proofpoint-GUID: KxFXu4XfAPff6b6SkLBw6vPC1fMk2ygs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfXzgBuLD2keOXv
 lANfj3Eho+IN+wGqS0Owlxu/LFLs5+K6q/6zG6LsMcv4Gj0Dv+rQ5zNpA0wwwD4AHj7MAmnu4wT
 0M7Z6rPb/OshZLcVrG/Q9lCYBNZvM6v+kbeVOhOi6/X6ROYhU3qTDSo5j90LYqFng0ElAYppbcT
 SprBfWDhyrZNPkdDBAJUEgASUTR8qqRBlC/KyZabIsV7luiquGpqefcIR2E+8qAHDeGu4zS8Ld/
 jbhpvn7wecbB+P03T+83VR4qqYHgOL/ol/IGajQQu3ebWArCtBeIE6DqlZWfIYJ2J23Y+XDyY/A
 RG/GSkvcDq2w3Cjb/drGqMP7o4enBIViUtbe74GbWsMiQL77FLlJBfctfLN9cjnhLK7XTtHBfwh
 3TzQRC5LSwFGtIy3CZ55hcVrIEfjfc9efMEI5/JHiBwnHSZA4am7mJlsv3wo+d5+PSMhaB9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=839 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100137

On 7/10/25 5:51 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

come to think of it, there are a lot of drivers that can not
do any rate rounding - perhaps we could introduce a NOP implementation
in the clk core that we could reference, instead of copypasting
int foo(...) { "return 0" }?

Konrad

