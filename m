Return-Path: <linux-arm-msm+bounces-62815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86AAEBB58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34A41897206
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0AB2E8E10;
	Fri, 27 Jun 2025 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgeYq4NB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698092E88B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037031; cv=none; b=RziE8vbSI536GQCNoOOMKYO2kUEomJVub1b4xwXCV/z+yuMfZbhRDQHG9rUl33swof4PI83t4wGdBWPLOKUpifqOPMSU0WHMp/SmDvItAK2rg4bcaC5V+tyg6T3xmEiuawHLU8uInC2O+R5E/LlXe3kkhk3xQZx3mzU9ZJ3DPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037031; c=relaxed/simple;
	bh=MWOFAHHtN7/qggQnBgYoOfr8mbDkE0qE4SD4dw5rBus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KciSotrWqPdJ2un/i5ab6/C684nelbpYMzDoRI5plEJi4mTcNYc+stQNkrwIFK/LezaTx+cmczsEHe/JlNSEWmyq86vcAo8uv11Z+ufecHBU6kYTpSwGQiGtgjkMN1CppwDC+bhRExlBA7mnFDpcBSr2xTrUpHL7eILUbjb+Qoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgeYq4NB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMbtO009891
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOLf37uyXC+Xhgnqp1gpIpFUGmLHpCI73UUQAx/mH9M=; b=IgeYq4NBC9HCybCt
	lQalD6M2OzUujYzgb9RKXdXzCvyAqcfOIoeMhk+lNX1Jy4fPkz17P9iB0Pb9sDcP
	XImdGcrY7CaEjVQDB/teqZGDPSoWqGYfxz/Y4Hy5YHzZbh559E1PIa6MYZ67TC3k
	t5JRGKkyfDSFLXDXcG0Sn/GGy97WALDbqSbk5kEmPcMWF3StxVBg9eNKVNzJvw2E
	9G/KPQkdR2jazPlGlxCfpABzws6mN1Hdiv0mqfqZVo4x8hS5Pabu3CRFJ4iddjpi
	r66fLXFOEtlXmqB+7GHg0tI/znt3mBT6NUfWuc7iFX+kFo3Eayt/DTnxd2hPC5Qs
	GOZLMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgyg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:10:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ba561898so24718685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037028; x=1751641828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOLf37uyXC+Xhgnqp1gpIpFUGmLHpCI73UUQAx/mH9M=;
        b=l13AHexYmUfnJ67TPkj+BGqy2eCfY9+dVG6N7eMlp8cRLOcoV6rcUWLkqVz20ZhKrT
         BMb40bI1GhMePwLjp3IUKeCA1fs9QBfEhmF+81iavSGuub2/bEdJkZOeoS+lh+yEhy/7
         OELVVEyPP7EuqzR0kx+1QFsanxYz+D7TIJWTJH7qWkQ08THl7fKYvkspJInNBa12L/LA
         gRTuGPFF9kVuAB+e1ns5uPc939f96zr/S9vPr7Hl2GtUupDNsldNNI5pfpKRj63c88/+
         DiPpGgYSE3ZRIjAvb5gEPj6BAuYEXnJkJDA2xUujHSd2tOZOzombOyn0hDz+XjfqDWa4
         ZIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtKLDKTj38CJCePtnkedRQmjCtkFivOK1e4m/DCupsoW0z6c5xOICK3xN/LPnX+drO9T9ea2ae+fZK/fy9@vger.kernel.org
X-Gm-Message-State: AOJu0YwLq2bL8NzBkF/pqN9p2aBzzbuokgXbGVFyeLuBFVy5ZwbTOVrp
	rFKsXxl8R1XhvNUdeS9Ua780xLIQ2wzLXOfw3tPxGbPcBFALfX6BEfpiXWknjDoZUEskKZS1/uL
	hbYQOUuqCO9gZHuHZe+xF5d7Sfr4ie293K5tZVZtyZWNb8MfGEy3mzoz3CVf+nP8TR0nL
X-Gm-Gg: ASbGncucY2nrV1zFlEW1CUs+xPaesgy7GcTB38kLBceuuN+AZDkxAPZL9ramL9EAZaT
	Rwxky0cu/c/Wtded4ruFzUEenS5l3t3zgX26xUj7R+Ikh3KODTpGFLccSRvRc3KESoZJh9FmsxG
	csSrid3R9xrvAdigO174ZfJKzaexWfDHHcOcZZ+MKpGGs8xh7mZ45mIWl92yduuU/3pXVevW4Wx
	8iDqn6UYrE8HvpmSj0ykyEZ5iltp/FJuw9TSoMYc0G0Cd8a8RVMQ7tE3D1DImrcowXq+IA6NyvU
	tREMqeUOtNjPIHvT+gqOWoABWkOsO2MwHcjqX7nXzfxKOG2oAXRavdDMiRU9xQ7LtwO0Th6rXCe
	rVo4=
X-Received: by 2002:a05:620a:c4a:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d4439de410mr197141985a.14.1751037028308;
        Fri, 27 Jun 2025 08:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpSklDN1x+K68aLym6g//jIbf5D14idxyGAGdjsMuKKGvm0HIepobTHT7v/W2zzlZN6PsD/A==
X-Received: by 2002:a05:620a:c4a:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d4439de410mr197139085a.14.1751037027727;
        Fri, 27 Jun 2025 08:10:27 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6beb8sm139311466b.132.2025.06.27.08.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:10:26 -0700 (PDT)
Message-ID: <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfX9LZKMZlqXOXK
 JyfilMoOhyeXXXql2cMybfTHQlfkMqaG0mWVIZ8e/0wescpTCTlPHcSb/mzemihyQs6VkMfWmb6
 vhMzsJqeExCJ/es99j+UH/LC/q4ODXEpW7QnmY221AwAdr7xGW7qi7LQnkB+zsRWM/nHnjhBj9U
 +P1SZvUNydGhz4OjHbkSlRbRWOdtIa1PB3vkF3rntlTdsAji1jaahN0Sk74wcyPLiayU3k44TST
 Tm53qXAQzP1NS85nBnRwKCfTgl0xa2qgDRud+28URbudURRE6KZtYraGuQgoSyT+5WVYjqlvsQ6
 elt31r/Ayl9RsxPNtFLYm+nsxhiGDnI18WfhH7zsncOSMSG2VhLgTEqOa9jGuDJtUXUacM57OHE
 yllQ5v/bsAtR0+g4RMUhjM15Re4+JXDC1Su0Otp8Rcj8P/xl41m1Xd8pTYt4NoMwcfOVuPNr
X-Proofpoint-ORIG-GUID: 1REbiAbdhSZA3u3dR7t_W9wi242T6_tk
X-Proofpoint-GUID: 1REbiAbdhSZA3u3dR7t_W9wi242T6_tk
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685eb465 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=Z-jg4G-D8Sok9OT7mQQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=907
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270124

On 6/25/25 11:12 AM, Luca Weiss wrote:
> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
> VIDEOCC on the SM7635 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (10):
>       dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635

We had a massive yak shaving patchset go in this season, please move
the magic settings in .probe to qcom_cc_driver_data {}

Konrad

