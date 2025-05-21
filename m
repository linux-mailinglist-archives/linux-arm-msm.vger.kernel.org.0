Return-Path: <linux-arm-msm+bounces-58952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C4ABFBC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 18:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7938C5014B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC25023A987;
	Wed, 21 May 2025 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHd88Bz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2771CEEB2
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846632; cv=none; b=I0ub5E4SCFk3Ca2qZRHwvEgdoL0YEKgtRw5Ukj6WfndVaz3AeizqTLoUVNxECDuCP9fdcUTFt7jPtmSIJM91PsWZBfcSH80Oj3ZjjrlAmojN9y1e2LwBcCTD0xRqRurwA6ZLyDNsNKixIpgh9E8qjFYdZpU7BWHAt5z1w14FC3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846632; c=relaxed/simple;
	bh=N+R43E/1GfThpPsMXWgpoPu8TipZoSa08sDYQEh3dXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n05lKlII29/LP/NYgGMqFYG+1OXQ6Y0lAsnNC1iP3tQws2Serl+ynCm2QjrmYsc0uQB0GDAH5OsmeepcACIfR9wQnoa2RsdenF857mI5U7rXLi7q0sCmE2VhrsYLOuhdciqaX4IyaX7ri1U8GGOFeT4rMzJEi+Nf8Ikxt507wNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHd88Bz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJSR006589
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 16:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIq+1JAfS5ENiun1dMLKC83h/in6cMIXd2ivDAqCPHk=; b=iwHd88BzSUv0Ldw6
	N0ARTR496xyfzKwNSgf4I+P9ihsCDM5bjBXoANJZwzmdoCd5+cGl+pJ78cHXPmcX
	9nrgOJmpaFwrNbnBzyfWrWrqZscQUXvFu7UP1nV45VMpoMgTt/UZ1cTyxmkh2lqM
	sLP3HnWN/pOjuGXsm+TlLk0TQlqk5mU0eL+4oO2MiGjFgyVfgqwrWXeUI7o4qCvJ
	dCPP0koacHqJPwbK/x0x44QtrBh3bBNh3sov1SFBqnPCXvWoJgK8P/jDt/iuzHzA
	sqIMXQ5No9/St+dsSu2ye1al7sPwk1enEHT1WO3bzrDHmQ9gP76rc1sUz6VWUSkl
	4cTHBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0kq7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 16:57:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so181917285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 09:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846628; x=1748451428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIq+1JAfS5ENiun1dMLKC83h/in6cMIXd2ivDAqCPHk=;
        b=pw8/IvHbSctHIZvkzbLYrpoTlQ4BooIfUwgQS6W29nw3OuEwvX2H4H7TfXGmhGTiyM
         CuH7ZV3uVVAvsteNHQy68mw3cWW3Wr20l3ZNDd/NVXIyflrTdDtSPJxaPIOHtYkWC3Im
         e/s0gbKjGlW33orQWFmJuXfFI9vfdSnShW2ddTftCJrnxEE5VVRrZTYp1Wa0TOakkAoU
         UyaFD2QWaL+EBbANPGGCthDypbc0qE8bimH+o3TYaWbTIjKqI8DCkFQPgpFZzytfuUsJ
         0ZOsqMxMNv0ZprKzTa44gNT0Q712o1F6btVFai7ogAZRRCqW1zBsWDkNwFPhYMou6O8M
         TRgg==
X-Gm-Message-State: AOJu0YzPY/E26J17ZmFEGhLXyPKHin1g15y9C2Chy0cUKmSmxFOAW7mp
	q/R4oxThWiJmBByOCP3p6A2K4aWd50eoOVOS3M3R5pdMoHwSPOpXuYhIpKk6dgu+QkSo0ggqVyo
	M9oUNebOLR9iuSbbR4FKKC1Mtx71BmOI20IEFz44o7eixLX/lEQ970K0PWpvePpFG+w5B
X-Gm-Gg: ASbGncvtD0llo0dOAnJ7ZRtdG4WWHb2Kn9zC3vOMosgjfY5GP7Pw8NT9oT0MJx+6GHd
	da03Lq8R0/sSADjpQH1tQPzcTbiVgc9RheIf3O6NbDDUpl1eKo4s8+vvjFtdXcdLiwW4X06sf64
	zBvEsthl3p8+obphkfqRD1Hykhs8KisQj/4WxvqxYaA2bXB/05jSUqAVbvbXYVHxK1NzR1DQ4kh
	g7axzAX/f5v68EaFfDOod6pRIX2Yp5IWANq256kYHodVnAIj7MCgY0iIsIew8gIuwU/Ys+TPsuU
	DVAc+TS1sX/2m4tG0W1QBlpic7IIHKvqhdjHgUgsXYwWE8QnfPZt6/STT/okuS4Kfg==
X-Received: by 2002:a05:622a:1444:b0:471:ea1a:d9e with SMTP id d75a77b69052e-494ae3f24abmr123174451cf.12.1747846628110;
        Wed, 21 May 2025 09:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKquZCYn79dWnu6RrKESmOaAIB/1rycWKzBH9n0bP2dka2gnc6zuL4fmyd5kx3cDGfaLk9HA==
X-Received: by 2002:a05:622a:1444:b0:471:ea1a:d9e with SMTP id d75a77b69052e-494ae3f24abmr123174241cf.12.1747846627791;
        Wed, 21 May 2025 09:57:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4e8afdsm933402766b.176.2025.05.21.09.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 09:57:07 -0700 (PDT)
Message-ID: <3f3d8c46-e7f3-42d1-a186-29a034d509be@oss.qualcomm.com>
Date: Wed, 21 May 2025 18:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-5-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250521140807.3837019-5-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _9fmNp1GAeME9D-sq8_pwRSqOTSxx5UC
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682e05e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=B19ug8NEUztSQfbU-jQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _9fmNp1GAeME9D-sq8_pwRSqOTSxx5UC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NiBTYWx0ZWRfX1I4SUJVhI7ac
 EY6HRoEOd7IYUIXV+ie2JihlwT0ve3dMveIssCa/jsYLRa+puZG3e39mKDxTNMdAvoPPopFyNLd
 d4UVmB+ChvB0Qs5FKZuqj1OjZiKEwyi3lFs/t+qycT6CWixLovdKHH5bjpSO3ErgLrhvVFzwesX
 LxsXayJbJDuiZDzFuC5cIJdHAc4a3mTKVk6E2bLBoxtVDDElQVOEnaWp754IizZaq01jSY/O4ZD
 6SzKlBtn2CPOAxlrwG8jNxjxDKTPrVu8U5Yxukq9w1A2SKPPboO7tkU/tFNx6tna18wQ7dbtPm+
 5A/6rpEGhrMZalSypJpl1wL6EJv4hNEw2SxNAflBw+hpSw0TYGg0uymfgjy0Y9I/7kQB67pCyr7
 3XG/t6Qb3Y7YQE0Z8vN+ft8nCRzina/D9BXP1Zm/7Yg8AHEjVLJGgxSnWAJO6UYAuQQDospv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210166

On 5/21/25 4:08 PM, Wasim Nazir wrote:
> Add initial device tree support for IQ-9075-EVK board,
> based on Qualcomm's QCS9075 SOC.
> 
> Implement basic changes to enable boot to shell.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---

[...]

two nits:

> +&tlmm {
> +	qup_uart10_default: qup-uart10-state {
> +		pins = "gpio46", "gpio47";
> +		function = "qup1_se3";
> +	};

Feel free to move it over to sa8775p.dtsi

> +};
> +
> +&uart10 {
> +	compatible = "qcom,geni-debug-uart";
> +	pinctrl-0 = <&qup_uart10_default>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a newline before 'status'

Konrad

