Return-Path: <linux-arm-msm+bounces-64174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08BAFE5AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 567B717098E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F12428CF49;
	Wed,  9 Jul 2025 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPoi1nFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4247A28C5DC
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056671; cv=none; b=rDT3xfrLuTOxP+szwTjpFbQV2Nzeus23mobrnSWXp1Jv51LxDGRZFHwmgsQ6fQVYEFFkQmYD//Lkbo6udM0pgtDsRDfEhpyZ3E7SxplcPE1oSsD+9dNYHfo/nIHKe7wG1qyDzMk/q8ixoMIX+AoH3mUtH/eoagRowSZPtpC2BFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056671; c=relaxed/simple;
	bh=iVry2JyCcu7AKZu9v6f1maMzGydag0Qd+QdMuPJxkYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKAxTVQ7ESS8uj/MLn1Jhm1/wXulyMZTKsblYchVV/ng4qnB/LJ7OnTX7TrTTtQqboSpqcdWQOJ4ainwIORtSmvhBVv/wtqdEam1O+X0dds//KhAPwkpbEiQXyRoYVOw0yY4P4f/o+NE2qyCCJNnQOUvP3DZZ808bYl4OIY+jaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPoi1nFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697grlK004556
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 10:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lNUtv6pJqxHYa2M0wcQ+2mlhPMafKCL2RFFU3mc+cMI=; b=YPoi1nFIbFqIu8JK
	fZdB2dgP6zTl5p0Dcl94+SdTyeTH/IJvPubDgnJx/fJ1Sxd9krpI7V1ajGC3Fmn3
	pVUxHfGcZxsD7KKIr7WvDb4Z+SEsr/8bKzzkx1IDjMCHnqJT2MP0f4ZkPm3zC2ud
	3JwZNUbowNkHTDQDnxN652RlIViHCHvapnB0XeFmxjKL1quxt1fgiUMJ9NICBRbu
	IMkE/EgAEGNX79h6s5XOBvFfhXITYpZEB02yBbDqpjt0TIVVnb836pV3AGYZzQ/o
	VK7QudGzBF11exzHlc/3IZ2m7esRdOOl3pksFFy7lHAz3BaEkx7MXaa0GNGHZl/A
	UmM7Bw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9drgaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 10:24:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a9af669a0cso10007661cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752056667; x=1752661467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNUtv6pJqxHYa2M0wcQ+2mlhPMafKCL2RFFU3mc+cMI=;
        b=Z5/e0KnqJzb+Dwb9WlJNtrr9jVJfCZSYisXPtylQDjj34HcikYM8wW5Ewo/RHHnrWV
         9EY8PJkmLS2NJDEE8OwkpeWEHHU4SP9qEPMuMgPCjF2JDpgCXuEQg2u/653vL+GzPnq1
         ZeND2FL6OgIM5Jn0k1qa4IJ5r3FRD9xuj2R8O4MdOPLJYNUyRMTSvlXu5bamKPgCEJek
         FzXU/xmhUzUFsN6LWKYD2RcnAAYBLBYW0a4TSsqHmkPS5VFmz2CdwC5PQZ5rFVKNLQi5
         Qi+H2AvlzVClzmhENFGKL1IRzbb6ghm2xOYsNljzwpIaN1e/7vcUY8pP/VNXdDXCw9uy
         nd2w==
X-Forwarded-Encrypted: i=1; AJvYcCXZTY+zQ3Vm3Oa3ED62q8F8EenfKdtiShN5V44GmNziXEznMpEHCMoQAMy+9JrDzrWa77JghVpKLMRmk27v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbn5DL5GhegCkkSd7D+RVcnhcc2MNx/lQJJY2DAyj7/YgKLa4V
	y25nPbvANlfzEc/wUeuM98YfkI549aOoBrDSk94iKEQ7HtBY5xXfs5e8G9GXx7OXfAUoLmXftei
	qQXsnxBi9vjH5GmeN8y1mmr/eyndJOfS6PmwuZzC6m4R2i4wswOHopPYvoORHeB435q/D
X-Gm-Gg: ASbGnctzMIxfILJYa6SfHsj1OVp/1q68IU0jQ1dCi0+ulHuRh3eTamQQIw4v2mMczUd
	JbgvWOYHRSVNXLLn8IiDmlh48YDlD+ZMDThwS+iSo+DvzZovvMgzEqv03NrEgku8FsyyPERSB0O
	koiwc74pu8xlehnxsiW5s6DTTSYJ4clRd7RNcq77g78XAs2DavEbZsssRZ6jL5DkZ/p/ih102gU
	VHKMtBmCv+7klKt8txkPGbT5pVTV73LpZNpQkoTE04JMfeTfxVdalFcYYKNE/R3aEOI+CYkGyW/
	29fsdkR7ysYAtdQRQZjnwyNhiwMW/ZWj6CMr7zXAVS1+haD4TVpy2MZF74fTf3ZIaR+5U8bhf/i
	N9rg=
X-Received: by 2002:a05:620a:2b8a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7db7db75713mr93682685a.12.1752056667162;
        Wed, 09 Jul 2025 03:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEREjGHO7hyySUVs4E462k9QGMOzS+RTEfsdDUihtz+3BINf+Xle9j6Glc7VDw6cWwpuUeoBQ==
X-Received: by 2002:a05:620a:2b8a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7db7db75713mr93680185a.12.1752056666658;
        Wed, 09 Jul 2025 03:24:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6976f6sm8712648a12.20.2025.07.09.03.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 03:24:25 -0700 (PDT)
Message-ID: <950b2bf1-9d6f-4b96-8879-fd693ee68965@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 12:24:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: x1e80100: Add videocc
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
 <20250709-x1e-videocc-v2-6-ad1acf5674b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-x1e-videocc-v2-6-ad1acf5674b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z5hBz2FEw0bX12lS3YBxHkeHCLQWsyB5
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686e435c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VobtZvVdalDbsM2SP8wA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: z5hBz2FEw0bX12lS3YBxHkeHCLQWsyB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA5MyBTYWx0ZWRfX5ZsMlytncyfq
 7c4GJ7noCR/le3Zc8HGjoXiKfSQh5By5NGOnc35fLP1nOw+4iwG/GB5lohKzcSQa1eWQVaKcTSf
 v69MNTN3jK+/vUpcyoRtCaOb516McjQBaYUThnYytgm7P33/oGQtZRqwbgqLPUoXFmjnFZ73IY8
 wqQmJk9PNGR9Gbo5wMrNyPHF9tzwYg/kK6CGQsAZrFy3AVhRn4wz5edmco799ORj9aX1+ZlBOR9
 kEH6jxmGLZKEgDksKZZ3qyo9aJvEVvIaApjYYd/EzV/B4VqK4vPCpJ2DTBxUH7mghYqnwOzAqkc
 Yb5Wps6o+KP+bwdMUKNzzrZwwSsDIo1ZBTPBXPFgxmNgogRFWG7tSdcD7KUQpOTB0NsKZ6xMvRf
 In2zBD0uCXgAAtkL7Z3gGWw2NOiSZyWL3Ey4SOfYIiZ1/4udzlXDNZFl+IIWBeUhqLH0i5Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=754 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090093

On 7/9/25 12:08 PM, Stephan Gerhold wrote:
> Add the video clock controller for X1E80100, similar to sm8550.dtsi. It
> provides the needed clocks/power domains for the iris video codec.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

