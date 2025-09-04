Return-Path: <linux-arm-msm+bounces-72047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97DB43B94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0BB67AAFB2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B62ED17C;
	Thu,  4 Sep 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JN3bF89Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE12E92DC
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988900; cv=none; b=J1drvcCCVvgkndeEd6uaP4VVirBQ7JY7m3x+m571rpc5oGv03zCd5u28xkdP3DKV014xwQmNWS3uQmHwO+gFrEp3D+wM8fo4bGsKTNbfkD8gWs2mRG3mSOLSGvS32tsiPNkNlWGLZHIogGhFpCW7kBjb8loQ8VF8LUt5A+jeoVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988900; c=relaxed/simple;
	bh=iZ1yconFgP4SU+f/2nEV3Iq/VVfOyxDTTCJZle5egt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2nZz5pIR1CVWw/hF6mJhMuB7VhSGV9UX9bFnz6h/q2r/z9q7ePuIK5DHCRUm/Y4ZmnacWpjAMJ7WOnA7EIz2wa5BAfAvX9RWelFVLGWFcWmiralugqxWfHQqvoC6jcOSUujuAkR0bY7Ika6AUknPZQmlaNJxx9cA1wl3p/j/8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JN3bF89Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XAsN008141
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 12:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTkNPIlvtexAzRNVdxPe6P4Vsr6y+Ml/PHeKH4/6EBc=; b=JN3bF89Z0/kGEe74
	+d+OkDoXnmO7Pt1aqyPMYxptJs630LQsAAxVl7AGY58FHfo0+PgzoTBBdVlKBItm
	FOBXShPAWqxRb24FQZbr+YIa5SrT2/ljBq+xbJYxoXxCMcgOkrd2g+qlMBEErR35
	rEn6JDu3kbXZgOQPe92kx4drtyKt7XyrVoTOAzlDgo4M9yze1D68n7ivrpEpbzDO
	odHfTAUQd1hYws9+5ERImSeOQOJzLdJRAlPZPd73P6sddwMH6Rya5yvyBJZ5BEi+
	GZaqaJ1mjmS5jES+/e82FjacbksNdUjEfwjJ+ie14HajZDhzTG12TNKDYcFsqstZ
	Q5LRqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjqd5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 12:28:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b307e1bef2so2434691cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 05:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988896; x=1757593696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTkNPIlvtexAzRNVdxPe6P4Vsr6y+Ml/PHeKH4/6EBc=;
        b=H6muWlNo3I4GkOOuMwnLDdhP+aR4sw4CFLyVoa3wqZHFU0Th4zmqiQNipRgZJjjqrn
         eO2uZWEsAbg7eSNCqET6RFpABFlFHtR+wvy4lW62Bi1D1slLAUSRMac5bYsYC7oG2x8l
         oULqVvxMvHk9GqMJR1GG5gEtcfEu9/xGt4eiO4FD9lR7JIEShyOG3OVKg+Lx3a8DK6ju
         4JsNp0NcWSLHxTnj5YNPSXxK3HcmiSx41kJmb25l1cV5b5SCwa6Wbr9ftTlX24LLpPSV
         RrlUZIhQE3cVG/nS4VSwhZqvNnjb2tpbp8Ux753S5OdrnCxXQpwxYJ/QrD5koZlnz8iR
         LAEg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ35wWtus3bMs0BlSjSfSdouA9JqvvTopc9DMfIKBV1J41lJxUhbR2u8ctyQW6ch/d2+jJGL3VUd0bfDta@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4cf7p6aHpKHQ2i4mSIsz41neXtXwGjBKlDxX0OiqYtiEgk/jc
	l4IL9V2SKkHIhQ7llXXx7OZS8KIIvu0rkZaG3IVPbXue1AK1UCSgTZSF16nZQh3bQ3Kx8Zn0ilD
	FD66h14pHzYYLSzPmwZdBNLbnJ893HzBc8Omqh7HObE9EYzektrVe7Bz5IsDeltDjsSPS
X-Gm-Gg: ASbGncsiBwanDWwoCHrNl2eLWC1KkhuynThWiMc9MuXUl5VT17KnjQzk4fcEgljRAwk
	73HWGeXUDMXjrU4DWVuNYGcJhBS6RfDINY5E6RORYW9hs7gdTpv1PcpsSiS/HSKtFlY6uz3m8hs
	7LSQzPRrdEWxxWtL9BfTGUAy+7eb4b2tMBDAbLgSMT3Z4b2VWzMQ/dqWpFw7sS3yaZjs6/V1SSL
	WTZdWQjpEiIPjrt1c1p46CFKDvJ6yu35DItQn4l/6DhyjmE9gGqTHPYN5WKZaikgA8rGZGTNorr
	GtavzjsuEvLjxU8ktBW0k1z45dRwBITRIOBCiD1BIL8KVnhYbtzI4i+AtEegFUHHlcMCY6Ktcz1
	Hx9jw1fOWG7KdOJSNaQvz0Q==
X-Received: by 2002:a05:622a:5817:b0:4b3:4b14:b421 with SMTP id d75a77b69052e-4b34b14bacemr76921981cf.10.1756988896016;
        Thu, 04 Sep 2025 05:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKNLr2UG0L6qxbC6a5kcKv9i9FUtalfXAqyO8H2z7P9qA2jLyWbD9ZRvkUjs8xg0e9iD5JmA==
X-Received: by 2002:a05:622a:5817:b0:4b3:4b14:b421 with SMTP id d75a77b69052e-4b34b14bacemr76921691cf.10.1756988895551;
        Thu, 04 Sep 2025 05:28:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ade4sm14078747a12.45.2025.09.04.05.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:28:14 -0700 (PDT)
Message-ID: <105b3ce5-8934-444c-8cdf-e338af3e3552@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:28:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250903151337.1037246-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903151337.1037246-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b985e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MRceF3MI-pe3xWiB1lEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: F7xoN9x3Fzhvr2sQxUsRo2Iabkvx_eQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX+P4uCN57OzeW
 WqL3XUtSmCDGwMmA0ejZkE81roLivLPOVrt4c0LU9xSpIKRqcNeipjbcZnLYl1JUAeh3aEts/gN
 j24gcr1TL54ne9/zpDncEzP5EZh9cYK8ff1Yrlc+Ey7GHEx+WrwyOV8f2Am9Na9qvwHBpw6/Kz/
 jnDLV4mKWHgswVc0OWY/mX+PvzAIICw5gz9EAbzacEdZZa+M9J3x2IkSYe4kT2Yp7cH+jIsfGmM
 2IpXPmCIEee363Ll615J11LCfYB1yoyvWsJrYqaP6zw596JDJyYTsiV4A3xQzudDHWdpAhYXHBg
 XXXkKHfzOT8TzeNa3PElLWvIPI+MIGd2fWvicwJ9rK5u7yS8A5r/Nf2+bSrQWDTsbq6ob4O/gNZ
 geMBCT8B
X-Proofpoint-ORIG-GUID: F7xoN9x3Fzhvr2sQxUsRo2Iabkvx_eQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/3/25 5:13 PM, Mohammad Rafi Shaik wrote:
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

