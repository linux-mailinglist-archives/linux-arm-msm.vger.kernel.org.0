Return-Path: <linux-arm-msm+bounces-89431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56ED33271
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32D0030216AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0EA336EE0;
	Fri, 16 Jan 2026 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVJjBioS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRwka4On"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E02B272E6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576735; cv=none; b=XgsYcrfyJdDTxIrt41JjEmZZq+twQEG23yXneveESIsUOiw2kZxml3o0iy51/lD/IyR68mqGGfFVuCNgyNa7XcJPoEzpe9vy16s7NBKJIniSPQEp3aByG8W2gO6Z8T5/2wa6aadxBwmkc7p5d6ojp/5dvnJMkMEv2fbAUIUqKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576735; c=relaxed/simple;
	bh=q/2i4QMctXHF+dDhlqSpXa8ULXx0wN8PBam97iLzyx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/umnNNlyYzHxlNgPxxruJisWGVS5NCqtKAbtxRDRgy7yaL7pRsyMcD3zybhHVLJIQTsefhvH//HrX/+FNp8HATulmOsj0RDAjeAZJVCqu0Mo1NuUjbvFnlsAyhwkkY2ATBsFJ4MupTtDnNU7l4Mc670M+7EygNcCTutOEReLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVJjBioS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRwka4On; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G891Po3892688
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRcRwBypFQShmuN0jEyzBJtIwf6t2aDrIBCTyHNhTLs=; b=cVJjBioSxB1YM+YY
	RD/27+OD87cRm4c4XZ/ogHSNFlOO8viEL7BYEuV7xyqP8RUVuydBEEiazoWosaUe
	9Abv8bYRdOhVrWCtF2SAgUfncEMV50B+RqA/TYTk7TPa2nncozkQjPgWi8bsgHWK
	GA/kB4+nGUz9VhuXS5IMarQHEA9f122rrrTy15vq4f/B1+/bF4zzDmwil/je60Gq
	Y2+HNvObXdlUfEpGAE3gA/TMANX1D/GWoQZ3pc5xOXrBgtUID1NGIp5GmV8CjGrE
	XvjYFnBZikD5fE4uSa11axV1i05KIGI6xwQCtNXpddTFis2V4APEtLy+qNe0opXt
	1+j1oA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b0am9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:18:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123308e5e6aso3940981c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768576733; x=1769181533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRcRwBypFQShmuN0jEyzBJtIwf6t2aDrIBCTyHNhTLs=;
        b=gRwka4OnfqkmCqwHfOo322XVwx4GjXUdUVOU5HggIn4ohOLEDj7kRQNwZDEOEnCBcu
         OcXOsnBMCHyAhbiODgMJhrl4wFdJmBaJwStfV/74t7k+nfSkeXUZIhXteDFloqR9P6wR
         +WMQCpLxdvarlKqWW0Ol7Nerg9cYdkrQSMgDpmel77XpJsFRY5iulYHg+UrHS3TojyyR
         clPwkqzb+Hf5euA/H9dNGv3CfhytMbi+pFTKEHdL1M6IwyD+ybL0hWpB08t3e3gUy4I9
         9JkydzcTBirXZiEDRJKfeCyMH6H9GulHlgTEreTiJYRwDUxBSfAzxiqagONyBeTSl74S
         otQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576733; x=1769181533;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRcRwBypFQShmuN0jEyzBJtIwf6t2aDrIBCTyHNhTLs=;
        b=QRX2gIJ0prP06bcZHMOkfCyFpyEIGAAFmF+tOfYV3FUdnT3XfzXbEl2+d9Ci+/TWa3
         IBpwooWfpM7m5g2TYQhclLKOAJ1HFC9klBXK3C6DUYz1pr4bOg1PxXI3u19VSwl09khh
         R3hlJnorDPY2KM0/nMdfmogcRbrLuvH9wrgtbnMq0XCZpFZlKynGLQxF3+u5hwbS0dMK
         3x/vkC0/e0kIYx0u74QqGmCEVad2m/uUXNv95mt2949oFvvf3WunnyYRdXPLV9nJCpEW
         8YadjpjDUREa12BWXsBFTP6wcQ+kLN6wS+F1Ng9WUlBr0hruG1v6hEzdxcQ6hwpDG5Yj
         edGg==
X-Gm-Message-State: AOJu0YymmZ4m+FanpAcfGYairHDR84QdulY0q8adavbNBBBrSeXShhu8
	bxYwGNZYeOXPLAWXO0uTzuHKsgBTR068IHt1A4GEu1S/HI53QoTidNA2cEkJEKkxdTJQzigDyjZ
	yN3zT+0P+NmgNfTSQNqu9cdX+76nKFd30QdazrLB5lbokHW+CCRXrM37jiSgkHi+EA+i9
X-Gm-Gg: AY/fxX6RYoqCv611kZADz9Q+68ZmUc7OaFB7KgIQXxdqNGRY0wWp/3cqfj3E+/EPAbq
	vbeNOsWLC0raKjAoJUNGnrq8AtddygCkYrxJIEl23z+cdBrBIrzlvjR+riewCBNg8loPEp/2ZXi
	5qIBxZd6sbbQ5HmMloq/heMCN8F9RJy5TkJLGmMYxuh3imk5T3y4jdqEyQzhO+5+XTNimFhJpNe
	fnZeqEfvHawl49Ex9AFnDPLNRySyNP7prbUbRQRD++GHY35+AAzKNMuHisiuDiY1PU5kQHyytvv
	bkOb/uo6UVxXEVpKrOV/MRv1TetF8UtlowUlkJ3rY8AR3HjVpup0R9ZG9y+qggDE0mok1Anx6w7
	MHeWx7tvhwieuDR8G/WLcXmobQQyRJ8xB0QEnF59keaKW3Z5RYm5h8ooi+AT4OE8Stqg40R+U/q
	je
X-Received: by 2002:a05:7022:4185:b0:119:e56b:98a4 with SMTP id a92af1059eb24-1244a6e070amr2977284c88.11.1768576732824;
        Fri, 16 Jan 2026 07:18:52 -0800 (PST)
X-Received: by 2002:a05:7022:4185:b0:119:e56b:98a4 with SMTP id a92af1059eb24-1244a6e070amr2977248c88.11.1768576732230;
        Fri, 16 Jan 2026 07:18:52 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac5842csm2773177c88.1.2026.01.16.07.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 07:18:51 -0800 (PST)
Message-ID: <132c34db-07c6-491b-bfda-f3c51462a184@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 07:18:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
 <52b2b799-09e6-40a4-bea8-c7e8bf21cf51@oss.qualcomm.com>
 <15470b51-d398-449d-9017-304df5ad7cef@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <15470b51-d398-449d-9017-304df5ad7cef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W2TCXjgGres9EnKT4kyjQjWr_goj0sM1
X-Proofpoint-ORIG-GUID: W2TCXjgGres9EnKT4kyjQjWr_goj0sM1
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=696a56dd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fl7gpmSGIpyIZsR_3woA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOSBTYWx0ZWRfX5p7rrus6m/nm
 3Rtt1r9ukntjwfPAUqxk8ySx6sQfgYyTUOT598UQ3gOJiR9MTlOW73eR3+c5NHS73EUZc9b5O8Q
 EAo0GXIIlZTTj64IBLukr7KV27Y+0ikwntuO4rL1I7WIz9CLWfinR+qU84skVS2Dlf1kv9GLM9v
 GjtyiMKi+X0cbU5ATxziGWSECY7NS/ylgsn3P8ycxrtsk4J7NkW+SaoxV12Do+BbZ1RkMMzEAOv
 Jx13SuF6ybYf7saVsZ1Ycv5QYEBRwQqU1IiA5iKnlTrLfPKGL1iBETuyJ2jag/L2PxrNPMOy7XV
 tMB19FrWgR1hHiagbhpcmWRAagW076Nb1NHNA1rOR/P6348SuVNAcrQgKmPO/tKhgUX+jD5+b/3
 Xs+N7k0aaFIQxd1fGjgIE3bWWONI2H2/tQcAAEQO1zUyxFXfJ/98Tn+zlUziFRz9BWOLfclGcHm
 D3f1w0ddLr6GiOm/pTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160109

On 1/15/2026 11:48 PM, Krzysztof Kozlowski wrote:
> On 15/01/2026 23:30, Jeff Johnson wrote:
>> On 1/5/2026 5:01 PM, Dmitry Baryshkov wrote:
>>> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
>>> voltages over internal rails. Implement support for using powersequencer
>>> for this family of ATH10k devices in addition to using regulators.
>>>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/net/wireless/ath/ath10k/snoc.c | 54 ++++++++++++++++++++++++++++++++--
>>>  drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
>>
>> My automation flagged:
>> * drivers/net/wireless/ath/ath10k/snoc.c has no QTI copyright
>> * drivers/net/wireless/ath/ath10k/snoc.h has no QTI copyright
>> * 2 copyright issues
>>
>> I'll add these manually in my 'pending' branch
>>
> 
> And why is this a problem? You are not here to impose Qualcomm rules, bu
> care about Linux kernel. You cannot add copyrights based on what exactly?

I am a maintainer that is paid by Qualcomm to perform that role, and hence I
have a duty to enforce the legal guidance from Qualcomm when it comes to
contributions from other Qualcomm employees.

/jeff

