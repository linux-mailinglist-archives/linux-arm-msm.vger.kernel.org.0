Return-Path: <linux-arm-msm+bounces-57275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE6AAFD92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 754F87BE55D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055F22750E1;
	Thu,  8 May 2025 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhBz36HB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC126FA42
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715391; cv=none; b=iG6BKwxKYW5WkHi4aVI93RJq3n/jrLKLhDdwDDIu1PMggI0rJJ4RaXTcoXr1XFsB2JV8ovSHbLOC8qa9IlYScbmFC8HCuJLJ9pglnmCoFJQWglkGoSZMAGrdH9BKhBENJTlHs0b9EOIjns3Cm/fyazhvbjRC4/lkEPq8BRuU5rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715391; c=relaxed/simple;
	bh=f568pbAx7mKUVyVgW6w2g088VmARJllh8QoWO30N0uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNlpSxnvFH8IPg89GDFSmZFbL/DpBSDbK5bpSD4vsqh1oLQ0QMW5xFQDpsidZu8Dyf5iC4H5oy/aXGVYq3Jl8iXAy4nucbssAgf+oNWT0gdf+6hKZdhHgWMpbRLfXzlokr7SwcRNjKr18Pv597r1hT3NLmXpFMzL6C3jzkcTa4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhBz36HB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D4vmk002336
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTC3vuWt5RQ4AmGS1OJjvC1wx2knq2oIlkpbuOBdIZM=; b=nhBz36HBlwYTsk2s
	wxD1kT7zvzzoiDt6/Bro5WotUE7hI1HQ8GQs6ELapDMkpJP8Jwgc9rXbiglGfO2s
	Hpgi3n5Ea1aBCckZ1LDpg35JoU4dhDKQtK8LrSZc9XFW2WIKML/SIKx8ejSiHlNd
	Q3tWESt1MtqkMd16f8vjXmzRYzUddm/l5xeXEHIcDNyatd1JHx8PGXFCCrsTVYMI
	ouKXKz7QPFVE9/SWTrHiQA0CwIwMB3EyG8nNlRE/ZQEEA1yy0aZkva91DPsDzVAF
	hKBDAqRuOm80ie9xYspAE/K3We+ckvFnODp4xT3P5O8Ky8hN1ZQULzHp39vyH2BW
	K94llQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59ncr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:43:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c76062c513so25858085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715388; x=1747320188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTC3vuWt5RQ4AmGS1OJjvC1wx2knq2oIlkpbuOBdIZM=;
        b=Xf1mpedUXZ61TvJvF8fXSOWktcXV7+XTeibB9hQzoNKQJ0IXth8y1WdkSDzU5BKbXS
         Y9V219bEwkeejLVV56PPf9AzPILEKKe6R3+7/6IFFnnvcm5QepJtUmpOGOJguZXIBTl+
         JwaTMSM6C7XXltROAaG3POSiFR8ZAfnSEPRiUZywDI7U6Yr94lcCNOmJvesRLL5fr6/u
         071xtLPDhKYmFU119DVLXNRE+43t3idWQJql0Sg9dwf1jNr3BDNqWpgYKbSYz426PBxl
         SXZpWlHeXlRlud9hF4yCp23Efp9l98gcFtp//ajEgO1+7qoJMytNQsQsQDMSUGT3icFl
         fjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEmdYw8fxlu1J3HAXLasDrnaR63gCbF9w52/NdAkLWgD6j+J9GaDrKd9/uQPnPgHetM8YS2xxDT+KywPnt@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZyy/JUwA1Ni2EPmL1vl0IvP8eCLQYxsC6g7bFudZERxXNvE6
	Q24n3ZeTQA/+n2BxcMVG6Sx8V9eD50W9ogvwhmr0iOi2GIxGGpXBQ6aPW9XObGNEAlRb6uodOVw
	tXSXOj2UxryYHyAPh+DdFR7sW6peLCOOF1ReatdWQrKFcwhCX56dKdAr5keqUrMuM
X-Gm-Gg: ASbGnctaeG6vFKLXfT44mV0gaaQkknwAjXM/j7+80EOz19Rk6W8xT6mK7bAdRMEiZE4
	RGwucQ09KBoArXH0GicyHyekapj4rAy5negmoORoG4yaY3v4PgGPP5GKWp046QuvYqdsQAYFwb0
	7hWnrkfuqN+JGZIX0fh5qWgVb/ew2surhA/o8vhhbfBmG7faYJsLprdP1s+3xfv3mXE7Jxnj6MV
	DEFZiVPOnCOAYBWL80U4y7pROD2yKTPN+NEMn3MX4NRYw/FpXYidW8E6ZOs16gghIb/55mh8D3b
	LYe/OuMzN6mKYxmdrCdg94idXaPu/FaAwQVKX/DSicM6fVpnZVpBYsXjF6JDASb3Ka0=
X-Received: by 2002:a05:620a:3909:b0:7c3:e399:328f with SMTP id af79cd13be357-7caf74079a8mr386379685a.11.1746715388454;
        Thu, 08 May 2025 07:43:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELEl4ogSrPxozRoWetBNvU9LdP3GlTW/6PjQ4l3hnTs4G94EVNqSCkQCz4LpTOz6QR65diDw==
X-Received: by 2002:a05:620a:3909:b0:7c3:e399:328f with SMTP id af79cd13be357-7caf74079a8mr386377285a.11.1746715387927;
        Thu, 08 May 2025 07:43:07 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146f74sm1108396666b.17.2025.05.08.07.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:43:07 -0700 (PDT)
Message-ID: <b0e66369-5f67-4fb4-add4-5b5439ab4f62@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-5-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-5-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681cc2fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jONUQADHCp84k9KtN9AA:9 a=QEXdDO2ut3YA:10 a=85N7vG7B_AQA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4uJMdvynqKV7672hkXG-U5O1uAl6CCqI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNiBTYWx0ZWRfXzo8QlQsagEi8
 Kf9nbE5QRM6VTPz6RhHdmFR/HfE3aGB9ShN6XKRSFqMdHgR4WeSPGcNE8mLw9/fur5JH4Bl3MUL
 U/YRDLeKwq1ZCTQWxAFKCiUifJClKH7UXkAloJ1joX9AaxvV85fTgmHpVFhnSdC9Z9BNUc7pCGM
 tQuwf/b2PF0/Wg1EauEyb+7vuqtEA1c0hsr12DsuWVD565u4X1aOpTtGyY5J7NnEh6ii3Mg1c4O
 5QjgC+wZp6+Z48mLGXVxYC/40hAOgx1Z73dLajAtDqcFmODb9KMhMgLSjeM7JmqhPpbwKbuOT1V
 i6m2dWIPMJYgnpRxoeCrm9omCGxslSK2haORPDou0DO+zZhh5NF/3cuTckiNqXrNmzeHFyGIpXV
 wOWcp4KmjVwrHcDbpizZE6APmAe6iQOn9bJvn90+oFZ009Lrn2f8uw8VC78g+mzBIzRAj4ws
X-Proofpoint-ORIG-GUID: 4uJMdvynqKV7672hkXG-U5O1uAl6CCqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=615 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080126

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> remoteproc functionality.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

