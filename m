Return-Path: <linux-arm-msm+bounces-75891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8F4BB6C55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963E91AE0282
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9805B2F0695;
	Fri,  3 Oct 2025 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="If4+Xn0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3352F069F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759496596; cv=none; b=cGYpBd4BdBc6sOLVbdDTY3xj2d2CeVvHntkW7rsyu3rK9IiXj+lKCtlOxf6ADAWtwnA6PuC+46PkeEjGZU5SxllQoQGggvrL3/3FOcSkLIDb97HfZ0ZEvBSGJHaWvX/vIILFEIIfYZ+E3rNmBK2iEhgK35fN0cq09pahy9MdsME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759496596; c=relaxed/simple;
	bh=/+vzANEWukvpwKeEiEZiIlph+tgYWtmfH2k1oDiry4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2KghsOmE314bxjfUXfeuRX8UIQ59F20TbSGjv4+Yo9GDjwYGPCBzGuGdqk+iY74eq+aPSwKM3nhJtw1xEYVUDb1WJnxxY1Q/D3m3riIbBHqaFPn+SBVRZC61DMKCl+H9Sc4PtL0Ap9Dtqt4x8ASniTuqOSofjdUPbrMKeSmjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=If4+Xn0N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593A9MgX024148
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 13:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUfToON4fuL/wPZ4KQXRYs7Yvx2Y1KhbqwkK/RVyoQA=; b=If4+Xn0NpPkjXR+q
	iPcZfBJOHHUVUM7bFWxsOqCb/a1a5VERnqavHzrBldJ7wbzvHFz+ZyfqXVVRiagj
	3jTrgrX2wzCfpO4FVWtY0uElLaVkByEZ9xr7/pKT0oiFsVLlZ4cyiM+NhcRjGNMb
	ZzcaNIr++1ybss2zqdd4PnMC7R0SoX9xB4VerSEvx5BBS7uuODnYTsM4H7lIvpF2
	OODhypSap//3Q8DS0vpCwjmLjoF02MOVBKPazbWlDaCf93h3MferwWyLRaxhmFVM
	fvEFv785yiKeNYFsPkYZdq+D3iU+F7xv1pPSTwG77N6v5kJ4Fd6DFEi0bkheqBC+
	AzvCSA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6av66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 13:03:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-8ef43cceac2so11626241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 06:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759496593; x=1760101393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUfToON4fuL/wPZ4KQXRYs7Yvx2Y1KhbqwkK/RVyoQA=;
        b=CsojAeXlMHGtHv8ZJYbNjWr5B3Ja1f4tR0fsPkuZtl3eo4exDT72FZHhgWP7R8ZPYU
         i8KUBCqpAoa61D3n7Flzxnzow+rdDL5J7PXJ0iDqFiE3BuJvFWC+Av3mwvWvTRnFBMpf
         RXTa1oF5XAvHFLt279SbU2r3pdRB0hQbim90LUPCvkCdRjoesO3evotVziLVxD7VdEnS
         q4/r4lx6O0/Y2BeB6WCoDwsEKJ3BcUiVXkkiIuk++tlQHl9Yi/FwXiC69g1FCJbmIsQR
         KkouVkqXeVoG4o9c2qbyATS30p9IdGhyJZ7quFi91jnqMw/YfYnNL0bdi9RoxI5NwMc9
         HXoA==
X-Forwarded-Encrypted: i=1; AJvYcCXTLr6Vii6qZ6Gllac/0+Cj+jJwx83CrjQjgcat8rWlXc7vT6MgiUVJexOwXue1jpVwhlUYpUXzjJQr8OCK@vger.kernel.org
X-Gm-Message-State: AOJu0YypLL4b5e5S5N6u0+N1dHkutTZL/4CAIk6pGDHEt7bAi52v1gQ5
	knNvsMOS2OzKrqGu/LIDPRHtdp/JaHx29We/z7nD9Vl35D+PeNTef+aP0PuslBkLss3QbQBQU/c
	YAUpnDWJu0hx17G0rPXOhJudWuH+wbZ+jnoL+1P4eSyOEuE+zugbGDTmFpnGbJp7Ofkt8oPYGS8
	GO
X-Gm-Gg: ASbGncutbxqp5QyG0wutCvPqHp1JMDBmfvmkP/NqLrvvPtwz772v8RtGrVfy+SspW8Z
	+CphG8rcO46DQQ15Rntx6YFzPi0CVTmSXbZbHJZmJIFIAoxYq49G8/D7qTFG1bK/NxIxCDgMINJ
	xgPFhWUqEO1t+jC5TAB4UB6NSf2AnZ9AyvjzQBjOoM3C6LEsvj9/ekNdPU9AWw/Huy+YuFvtD7e
	BByrf9huG+YgR61dxd0e2ycgZAwZD3Iv8Mih+aS3a2R1ar15DWhUH1GhGvVlpzObCdyf3Z+0ywR
	mkhf3vfxNLoR3BpWSykqCfRD2AbH5EYJUDsmm0I8Pg0L4YycIlFMkfV/TVpD2LlWtGfr0NX2n+j
	df+SbTbr7Cwusd3bRtnAZGUdR3JA=
X-Received: by 2002:a05:6102:809c:b0:55d:b35e:7a67 with SMTP id ada2fe7eead31-5d41cfe36f5mr438313137.2.1759496592688;
        Fri, 03 Oct 2025 06:03:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL615tEydfIMsGqpnM6Kt93SV8jnAC5FaGdRPAbgaQXeVQAavYg+Y9iihBDoT+UcVp78gOPQ==
X-Received: by 2002:a05:6102:809c:b0:55d:b35e:7a67 with SMTP id ada2fe7eead31-5d41cfe36f5mr438254137.2.1759496592041;
        Fri, 03 Oct 2025 06:03:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3ab167sm3923312a12.10.2025.10.03.06.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 06:03:10 -0700 (PDT)
Message-ID: <46b25c1a-066b-4983-ad8a-d4f5f3da580e@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 15:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8250-samsung-common: correct
 reserved pins
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251002184459.15742-1-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251002184459.15742-1-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dfc991 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=RUP1UBqQREs9RzM9fpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: vSZTBLXQ93RTnrgO5Gfk4TM1SSrv10mU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX9s8E8mI7Tt5B
 6dAfpkOy3zw9ljNYRG2trQo0xtnYzYqIAqIJi3FbEb0Yy59//H1DpmaRupN4tUI+kOugVs9SWYO
 slcs3Q4biSxXoeBEWf0svkzaN1rr3/1Ha6yTE361Ik7YOfN+OJh+duOxRzrZEnt7VRHSV7VfLhE
 pd7rt94oAj+mfKdls2FDGQMk/ceI9+yks1frSUnIT/AVShU+Okj0lwFioCnvDpQt4sf0YkXjiI8
 aI0OF3i0Pzw2CFYsOSQrfzJm3jkYXm8SXK9a4ShoCAooyRoivjz/YCK5ExfKQ4CEwb4mS2hiKRz
 NQcMCxqU4fESJYsIK0dNJpADOouDrtaVKWaiya6m5cBNTgr4uox7Onw6u5OH7SmaI6GvpWdojmo
 XFki5jkcWMkjrpU3SFRgiSNM3maMCw==
X-Proofpoint-ORIG-GUID: vSZTBLXQ93RTnrgO5Gfk4TM1SSrv10mU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On 10/2/25 8:44 PM, Eric Gonçalves wrote:
> The S20 series has additional reserved pins for the fingerprint sensor,
> GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.
> 
> Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

