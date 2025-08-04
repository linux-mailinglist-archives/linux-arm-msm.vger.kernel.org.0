Return-Path: <linux-arm-msm+bounces-67683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCFAB1A22C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C023A4F72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 12:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD17263F5F;
	Mon,  4 Aug 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4a5TFGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808325B687
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311782; cv=none; b=JRLz+BjF5PpPYQ+LWdYQ1mXztrOk3jqbIcjcLGbc2JRgI9Ywq3przwrFPAFdGB4Jygf4zNhEc+dBll+PJ069Cro+AyksbvbGKLoQShTXNKe1dHvSzoc720XXJmxMkeMLwJGbKfG+WzWO//hcYMXdjjWioO+QXsuakP7eAPjO+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311782; c=relaxed/simple;
	bh=gs2nTfQ71K1FL0/3F/7V99owAG7ux5t21uHkSyspMbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJWVHwEUg4OIHGbr3A0+LquTc45VHae5xLqXrT8zLJr8upEL+Q4afBF+cLvL64Scq2eoaEV3XmpWjMOYXM3+cAaC1XNPaUX+X+GpMdzbtPU0dufgnsyOu4SWkL1jie6ZROKoF+B/Ct/h4AVp0pnYwJ7H+qrxrsVRdytWnLmerT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4a5TFGg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748RKXC022505
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 12:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuG+AREz8e9iXy+P66bDzIEPjOCAA2V0u2W3LH+qvX8=; b=l4a5TFGg+aw10qzv
	wNto9gUanW2Wh0M0mArmgfngm8ImtSmbM0h+a1rDPOkS4/qNy7RE66Q+6ljwH72s
	YsQqwj+ByOWV2EZAnOknRG2NLU1iL0z2p4f45SjYoxVAl6YpnMy0rCNP6qhOLE+i
	Fqh6JPBD6XuSdjtVPWRNRID+pIf2aJnIZxi3RipGQ395vVFETD57a0DtZmD6Og1y
	gQsTGC74Q60P7crsBOASFjKy5yC9r2cx90JG5DdmFdK+23Ea97Phxk9o44a8NRlh
	TbLyRxmoxXgiavBa19EiwqzrOTlJff7h/m398tjEMB21KavuwFc7R6JByh3Q3ptE
	ux4PXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke33v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 12:49:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e33e133f42so94393285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 05:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311779; x=1754916579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuG+AREz8e9iXy+P66bDzIEPjOCAA2V0u2W3LH+qvX8=;
        b=svKcHOp2lTS4keF9Y1CDgex8nxlu2RpB0Fxf9lH+LoARBjKevDGCW1PzxqoYbtuu+d
         QWwPp9IviF2MYpn4PlWP7dv8llpiLWrYp6RjlMNOpJKpRg+2AimlyEghepb+acO/ICx0
         6q9hMqVNhaFqWCnLJEvww7RdYDzF2OhneymAAgSBgap6XQgfNgvMLfHjPmuiqhmJrYnK
         J+RsSiPbzsTuHuXRU0uD0Qpjh1szDY4YGmXRD45xubpCZLDWvfRUPc4fakbAuR4XVN0i
         OY/+CuUEyk+3Eu+/08rIyl9ItD/UL9SvqmUZj47MpPqfe0XCsdPUpCyIgnVC1Exj/1yG
         qfdw==
X-Gm-Message-State: AOJu0Yx8ooYCNJi6Y+F9d5V1bNxf0vb5IgEab7PQuSk63Csxo0O9HVY8
	h74DKbw63BB7Vlhvh1cEA1nMDVYNsVawpwIfj17uxeurkISFbk8Kt2MrzeeEY7qQ8U1f0Lao7Ky
	ZMwaYsN178naXmVsr39UERz7mOM+A/TYQcH4l32BxQcrL61lXtsMJkekShVxRQvP1KgGN
X-Gm-Gg: ASbGnctAMz96ypCtUC6v9XBIP8MhL9wXcC9J3McpF219xlsdMCf6Yr/GP6V0Plo8z52
	Y3rgSyE/Nf5xJR/k2FmmDApb+MZMd5pMdx7tZkbmK2MAK/WxFjSxnffzYRU2CBE6yT/hN6Ev/8b
	apezW1zKYeI1ALsEQfvV/ANKpv1zA4VDsY8z1z+oRZug2FQJzk8cMKQESb9+HAnRiBZpQcbeF0z
	ZKRpFjG7JEQIvKI8HrjPMQuTB3N5PHynNkYbIAFgleBxp+9atJit1s12nBoNijIze0cfVB2LKQI
	l1Qsv+w6cWxznV1kfRsoFXYPGfh6VvAqS4P5wWqvtEpYldGtViNo3KcC8yldAVAZRCcWdVgHRBv
	FcX+PuhHnLdC88bRXcQ==
X-Received: by 2002:a05:620a:4083:b0:7e3:3029:44c with SMTP id af79cd13be357-7e6962dc3eemr595492985a.7.1754311778785;
        Mon, 04 Aug 2025 05:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXy5F5bapQn0nO71JHnWJEf1UQ9qqolIof6CqE8t9CRANM4N77tCxcRTH3d0X9coKAQaNVnw==
X-Received: by 2002:a05:620a:4083:b0:7e3:3029:44c with SMTP id af79cd13be357-7e6962dc3eemr595490285a.7.1754311778224;
        Mon, 04 Aug 2025 05:49:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2436c2sm717085566b.141.2025.08.04.05.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:49:37 -0700 (PDT)
Message-ID: <c96df6e9-ddba-43f7-acea-191f19d5484a@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: lemans: Rename
 sa8775p-pmics.dtsi to lemans-pmics.dtsi
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
 <20250803110113.401927-6-wasim.nazir@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250803110113.401927-6-wasim.nazir@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KcGfEx6peoRSeHWw1_nY87HwoStCUXzV
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=6890ac64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=SmZcuDTjAAsXslZR8aIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX9ud+wOeOwiDW
 qiMGRbyv3YAnjriAvvSL7i9RZ2U7XD2ebNEpKrSlfziCdp8FqNzy0O7aQm2oglYLXZ3KPamgrOm
 WAYToBRPBKmM5kKJhz5KOPDXe83tUIuu12AN/J4mp14B9wk46iuFUujRHG+1Q6ISNlsO9+bq1lz
 TqWBGh02UqMY3bqAaZ6KWgRv2IcXjHSHPi2ui4rjqWY2f6E7zDLyNKOz0aVNiy7Jrwu48387WA2
 Eu5gjpJjE9EJ+SlzTcOrX/9CeVTjJLZs/E/8TDaYz+6tZ4bmofKkzWT5pQS6Kx9hYe23pd/Kb1U
 CSnr+Pzt4yA4GySbn9btb1jq0LdH49FhOOhwxdGQNGoHYRzLynSFFsb7TzQsLTpeWQ9ldYSKw7V
 s1APcBXDu4R9lekiFKKfONE9bQ4+Xy++PkjeI3ydFXLgZDUK5T4iCMbfxFgPQiHkU2J7VOMM
X-Proofpoint-GUID: KcGfEx6peoRSeHWw1_nY87HwoStCUXzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=737 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069

On 8/3/25 1:01 PM, Wasim Nazir wrote:
> The existing PMIC DTSI file is named sa8775p-pmics.dtsi, which does not
> align with the updated naming convention for Lemans platform components.
> This inconsistency can lead to confusion and misalignment with other
> platform-specific files.
> 
> Rename the file to lemans-pmics.dtsi to reflect the platform naming
> convention and improve clarity.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

