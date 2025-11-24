Return-Path: <linux-arm-msm+bounces-83041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44CC7FEE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 747003A413C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BE81EEA5F;
	Mon, 24 Nov 2025 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3wTCNGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XW3IThr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE692749C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980510; cv=none; b=M46+Q7TKfUiMuDYKQB7gvMA19i4ek84kDETa3LGAfp3kGGvHrSVqU6GpQeH0g35tj7t5vOK7iCqtteaTx1BgzYebWOjqReuZgvcHx+nQL/GWSIMjjnkp9lbhgOc/hRUTIJkBM7cky0xSSMlEJkXpyfD94E2hLzNS1iGBsMNn9Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980510; c=relaxed/simple;
	bh=9dxvi6KoMGPBZZAnaRtn9yzkwtnaekoCmUbkXAhZRvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7n47CiozKYIfzUzsV/uLWSqLjVXOg2RMFFsjeY4psp3aLIIppqhlaugBmaDr/d/7tC0j/85XLeKSRc9cRlvSIbvFUOnr+G4YqiVp6zsTrIOob3BRvN4LkX+ooalwybixIgXdN08QleGZ8pRBy7oCLj//QpOHmSYhl1kMn64Jq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3wTCNGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XW3IThr9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO89o4H1912255
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdZDb/iq6LyoJ0q1NY686SXV3zJDlxna6I3nChlzhFY=; b=Q3wTCNGjmHqs6aE1
	sktYunB+pfASFqEPFthURi+1f36UXUcApxTj5WpKSDXSmhZvWhjCGc0ukqW+T+Vz
	xi2i+gVypzsKPQjTaLYxx7zKQ3A4lFGeu2WD+7BjtKSnrnwygIlNYPiPdu5WaiX8
	0b/qSQDSWBxfFXfvFlyLFheAbmArQ7NPyV0kdE4Po9WLDJfYO7gK+I4tFbggoHzs
	NP0u86a2+6AVq3S2mbDCmUxOas83QgJFUhKCpQiiLBJMHu7YpCLMMVa+b9x4BeOs
	geC1PDMTe1rsoyF34YR8Ki61ShKUAda/FMxwi2aiph4IH6ywIc/cVCDKAPxVfQGj
	WkRuDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama099nuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:35:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b184fa3ffbso141210785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763980506; x=1764585306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdZDb/iq6LyoJ0q1NY686SXV3zJDlxna6I3nChlzhFY=;
        b=XW3IThr91+EETGq8MiaWKqXQ9nH0wEXTUp6M/TTDt231JFBTNADq/YO8xO/kGuzFzc
         FKKMQSvlGtp1w3IasbRBiTOA9GHEz+CcOzZ8b2yJgekERHhYjuybcIHErlI4HhMFVQi1
         xh2CV9suFwqFc/YAM2g1CVy4ZHmwls0TZlb0Fjgh/pfvsWB+iN7KBPnReszkvGzNoTHz
         Pfv1g9/ETBM16YtvwBtgcYlPtUdU+l4VMD96njHBW6jrzsTUSSNkm1VQ0Lik/sGp9DEg
         B+LFBvrm0oxaPT1NTGkMAmWllDPSoNc3GW/yrOlj3J72P50ckIZR7sRsty1YPtZq0BLe
         Ut+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980506; x=1764585306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdZDb/iq6LyoJ0q1NY686SXV3zJDlxna6I3nChlzhFY=;
        b=d5tJW2gsr/RWID/4Fr8nuwCTrWJ1OJ56oIzcVYQul5gs5yes204l2kma2jzDkMl6kA
         vQjyX42l3Eff2xDXlKUo2wI6sQblX0ubc4St1nV0VXLWLJDgdXpdOtjZ6bCyLw3OEZz1
         T+E/3RahBDATS6Ed5890hXDKuEyUfiUji6szZgsTN2kywEcAFDZlQwO7mRsJqhnk/N+a
         k03x0D6AA/CqMzGMTjazkf2UM8/N1hPk0h/qt3wf8UTbZdG/DOnoIR+uWdhpJBkWx+7w
         eQ68H/xIQTUHhN5dMt6wbQJY9Mpx+PCxkyczhuP104XwrmbN/FhRnpfFZMRoH83QM2dP
         TS9Q==
X-Gm-Message-State: AOJu0Yyq+//HcEplscRgTONxWKq8NqORGn2JrhXDikR6v1kFp+o5IVeR
	rQwbII6uv+l5sd2owhWa0ilJWlaLTuL4AhStmzYzsoJ7ON7vGejQV/BP8cgsR1i7yHTxz+p9luI
	4Z5t/kvle301x3aGhezVcP0Wlba+qXiyP4jrCZmLRtvsANrdBVhJN+20O5DwwQyLuqvla
X-Gm-Gg: ASbGncu5Wh3iz1eoA/y5KN8t6JXINpcH1BqTdLyUVL/SIRfCaqAcbZcnEI99yztyTuW
	n8qBmCnv75v0+ZUwqWQ9lBcpELANmAh48WF/wwLTbD+A386n+r2lA+0QXARBPp3bbLjobFi48um
	gevXHL48fa2tK3ZiRrHthDgelVAIqA0NlXIAK1X1l2x/xR4+Q8wkqXFfNMfYP21GB6BInKgKaX5
	zIx4SYkyv2arhuf/9se3U6zS13JamNvIBX4TOXk0PY+VxteTKtTcDviPA9Sam5TFBlpq4RHpbe2
	y5b+YRceuXMJhMEinVSC5p6rSRAM5Wet1+FHk+f+8tig8Bp4m7kOtl0J1zJlXiLeMDhiPtnLK1N
	v8qshREVk1HS5D6JO+EdRVN9S9nxZWzTBFFGQ9fwQbSNQ929zz3e2/T3nW+3rqd5ZNTM=
X-Received: by 2002:a05:622a:1447:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee5b7272efmr95407831cf.3.1763980506234;
        Mon, 24 Nov 2025 02:35:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnawLLakIQuDOxIvuZbVFALBYPtEcg0Igdxpi+j+gVarrGoPWUbG9mN06DefnoybfsgdQsOw==
X-Received: by 2002:a05:622a:1447:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee5b7272efmr95407631cf.3.1763980505805;
        Mon, 24 Nov 2025 02:35:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453645977dsm11813254a12.30.2025.11.24.02.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:35:05 -0800 (PST)
Message-ID: <c732d44e-3282-4d93-a693-f0efdbcb9091@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 11:35:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: monaco-evk: fix the SerDes PHY
 regulators
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <20251124-sgmiieth_serdes_regulator-v1-4-73ae8f9cbe2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-4-73ae8f9cbe2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8CPUGWJWhq2BroQmbZ4WWP83UoZYYM6A
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=692434db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W-RQcwYIOX4xafuqNJMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MyBTYWx0ZWRfX1ICzUZGXWsNn
 gUVdEW+S04j5Wtrg7eczShAXdyGnBH+K+95EPEt6VwXRoOXXvZ9hy4CYsbIS+YcszSnsMo39Ccb
 LX2UuuhVQBbe7LAhY52n1yVX6s36kMeftpOjd7vpdcr/G0IJPXajpaXDKYj4VcOB0MZW3zwGu96
 YqC9FToaaSqJP0j0OXkVvTKxW0bhhwapUDcYllKJAfeMfmMuzGLprPhNy4+g54VI/dWdmcVzcMu
 FOJzg+IgeSNrs2frEH1Kc9t8AIa5ZZElbBdjBWj+SMaABkKDdUSs8NWPfnCvmF3CiKrVGfooIk0
 TotxuJ+Kk0thRYzylM5VnIukP36T0zO8Zq4sT6fcsebkNElitbuPsqoTMPrTd2LwyAvZC5Dqkbr
 Xl+uVa2cy8KOaVTsb6BvXQlo4ZaiRA==
X-Proofpoint-GUID: 8CPUGWJWhq2BroQmbZ4WWP83UoZYYM6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240093

On 11/24/25 10:25 AM, Mohd Ayaan Anwar wrote:
> The Qualcomm SerDes PHY, present on multiple boards, has two regulators
> providing supplies of 1.2V (L5A) and 0.9V (L4A). Update the node to
> reflect the same instead of incorrectly voting for only L4A.
> 
> Fixes: 117d6bc9326b ("arm64: dts: qcom: qcs8300: Add Monaco EVK board")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

