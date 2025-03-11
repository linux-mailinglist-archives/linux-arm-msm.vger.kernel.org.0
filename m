Return-Path: <linux-arm-msm+bounces-50945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658FA5BE99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D8F171D39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED5825484B;
	Tue, 11 Mar 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKi00e/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6117238D39
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691599; cv=none; b=BOfOVqawDZZor7fBwuaUfMSYBZF/hAUoeb+VSsft5zPiFqq8GWWIh/sEXPogrn7B5tTmlN30N2sMjFP5gAChzNQVrGTPbd/aN1xQbXW0eaGygoAEhMTIMnAJUmm1jtqab+FMCGr3vygIP3t+TkFkCTsY0r5nzfip9BqeQmy/Ggc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691599; c=relaxed/simple;
	bh=Ra6+7lJrUIPevP7noIKenkar5W1k++Vb9ESz2RdB9PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mu0X5v/afWLA5i+sbixJa96rvS96IlHP1TP62lejlOFSYXfiA0xsR0KbaOiDJQsOMYMEUm54juS918RmEbeDqTF4bwGBAnYki8aYvhzBPvEeeZb2IzOZhrKi5xnUXKeEWEX+dp3sEKG1tlWgtIzB3I9keEsHc7YFZsPUVU9zbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKi00e/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7i6kT029349
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/N286/YyBPtB8/Oipndi0mCxpCa8oeflWDE7Iwumw0=; b=IKi00e/sEKm99vla
	iyYsYHGAHHTPDpKbjQPGFee7KyLGWkisG49lxJpAG2FHNg4KOPBFhEVyc7S8usnL
	HvKwSTEfJjuLQrdLlsoEI2NG1ReYqjmj3PHJiCkeEsa4VSHJ8tMZavWTGSjvw3Mz
	zB852qAeCJTvUqWXsMFGU+shoe7+txXuIcufBswqbEcZxM8Dg6eYLUfHAOpanqcR
	7DddfGpXo/hZtzhPAZzCYBaGJoSWwDQNVJwWTiyWgfDt2CwMLXhqsEfJyMzW77pY
	Tc5wjaehZnjdf8bXHeLKjZm/KQNxJSc4xtxbzNMukI0aVdNLnWhAGRATM+9ItD4D
	o0BFMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah1y8ncx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:13:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5560e0893so29189285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 04:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691596; x=1742296396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/N286/YyBPtB8/Oipndi0mCxpCa8oeflWDE7Iwumw0=;
        b=RCDSphUoj/zBlcaOR3iAmFt+rHazS7Ona8BN6Jhk50lBOzc2CJuUpwxVlMPYqsXkk6
         d33YohX8iVgUAxp27wXt1CE8Mo4vLA1K5o32mSH1lKdvIhdX97Rl22R/WJ0jRoy09AvM
         R87w4gBQN88udyPOFbfD01hTI/2/d8FiDknuTxhvQur/INngc3qSEgvqKDHTQFKbDszT
         ZZrORVz9fPO86nGa4D8nfjNF82KFj+VMCnKNBP4T/CVbJ1GTkD40DjXXEKyoe5S/LuGi
         PCFfrxFD/ERlMbqT6/BP4NsIWoM/OinGLxtWwGxUyKbjUE5HHQbOIgf08MrexMWTiPg7
         tRSw==
X-Gm-Message-State: AOJu0YxS86IH73/z4H0/Xrn4Jpxw95c2DqBrzo2afYMXsYN+qx/6cedx
	xfWJ/CzEn0DhNNfesurB/c13LsxA8/HF7Qb1TT+hxu9OvY8kkjs/o0YUk1fv/6qRaa6SABKuK3n
	CVmpO8DzAjgmXZDeZKyTdJ5wh08BrpJSbYim0fzYvIpkrwznvZYVRrBKTrbcJDuKa
X-Gm-Gg: ASbGncslFTuw1TjgvacDJLdeXbKOaYxL+WkML6Pd3c4O9CLFvew1W3FElfb6lZWuFBb
	HFBKvA930YDOZ6Sr68STOMOEhua1LLADQe13r5lw5byYke7dPiZMoq7u9VIXIhbBPE6/TEOtn0u
	cqAypRG4E4112qDt+9/E1evSjJ694nk0r+R/P8No18SmxY74YWhWKK63B+NAC75gV0emuZoP4BJ
	LX5Oc6Afq5YoZ93t1bVg6r8V79BmcIo+VbKN+lhfuFtvH/c9jmd+sMhyg2+D0YqHluUUIUjxRr3
	TMXZ3ENpS0sYsMRLbDZb0mcn8jXNgW9j/1qrS6Xqg3YAoOOSVbVQ3lUy1KgwVSy1eyKI6A==
X-Received: by 2002:a05:620a:2681:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c55e90cf5cmr174343585a.10.1741691595837;
        Tue, 11 Mar 2025 04:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1jOQ3Fr9/vIuI0mJfYp+Lr0Hm4fdkmWnfp4OkO2xn0v01ZBJ5KvygN9gwxqSMZC9qQqoHkg==
X-Received: by 2002:a05:620a:2681:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c55e90cf5cmr174341285a.10.1741691595503;
        Tue, 11 Mar 2025 04:13:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2811e5b32sm507919166b.159.2025.03.11.04.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 04:13:15 -0700 (PDT)
Message-ID: <3332fe69-dddb-439d-884f-2b97845c14e1@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 12:13:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-1-8eff4b59790d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250309-ecam_v4-v5-1-8eff4b59790d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q641Q3WZNEoh3FRfGSPqYEsVlUsJOMnY
X-Authority-Analysis: v=2.4 cv=aptICTZV c=1 sm=1 tr=0 ts=67d01acd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=lN5UOK94kOf-3Ws_NdwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: q641Q3WZNEoh3FRfGSPqYEsVlUsJOMnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=731
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110074

On 3/9/25 6:45 AM, Krishna Chaitanya Chundru wrote:
> PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
> maximum of 256MB configuration space.
> 
> To enable this feature increase configuration space size to 256MB. If
> the config space is increased, the BAR space needs to be truncated as
> it resides in the same location. To avoid the bar space truncation move
> config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
> iregion entirely for BAR region.
> 
> This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
> of DBI and iATU register space in BAR region")'
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

