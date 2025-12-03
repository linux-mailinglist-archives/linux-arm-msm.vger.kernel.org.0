Return-Path: <linux-arm-msm+bounces-84211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBBFC9ED5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4096349503
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FA12F362B;
	Wed,  3 Dec 2025 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7SWidSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haH2kNAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6E92E8B74
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764761068; cv=none; b=ZrwsqAIbHO9zKQy2kNldG27F5avVwj1C0dpKnDTmSfJhT1Po2PAM1hgbP2T+/TUOm3TSdpiyRB494dsTruWecExX/rafdUglmF/3hU8OlvALYYZyIDB3dsgOvJS18fSyjUQyjYava19t0DcDxYT2TsFgKKrrl6khAjHRegvnoY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764761068; c=relaxed/simple;
	bh=ji1dONw2LNM94TB9nwze5H8PR0IE5FBS+PMY0gqyW9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnqSz6KJNCpT4h3RmomZWdXdbmNV5YtCgzJEqX1fXZT7vTn1Z0XJ9aLj3Dnp3LMS6C26GabKDcGZt39ceDwstXlBW3EX5BZPVyOT5sXGceZdxdgpomkOaAsOGLO8FeVc5lq1aJInIhx0KqSrEYLPwD2ZVNGzH3C0N9W2xZtcNKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7SWidSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haH2kNAm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3AiVAp1428471
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0p+brFxfrSugope+I1XqLDlsGS2ChZBIMwEp27fsuY=; b=W7SWidSjs7leqt1S
	TDxCwQAIPXBZMQFXNHsO4+58xThsybahbcQhBNHUNm19yZhpFIlUsaYifTUtmGM+
	BvIjX68qYHOVQSbi22nMJVAr+IBB6KiukpZoOy+t0aiS26CnhM+M88DMDR2y2B+k
	YwJCbm8dbHsAZMCU7Wt/mV51bQftoQ2niQdaG9RbbMDC4eJSCD2cnbloSxyQHRrk
	JylMD7ED4CSWo34xb9aQ2+a8lamMVq/FKajMXDGm6AVyfqtL5mEEW6Y7h7pyGX92
	bkZ4MviuiUKISMeOMnJiGVmwp8AlkYJokEPNCKOorgQCzwAM2gAIU3si1h0ibZUD
	yVPsmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ate0jsadb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:24:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea2b51cfso138202885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764761066; x=1765365866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A0p+brFxfrSugope+I1XqLDlsGS2ChZBIMwEp27fsuY=;
        b=haH2kNAm/0u11o85GDl4Fdhus5NyHBnzonK0K7Fbi5yPepto+b9pX+Avqgz2+FDpxA
         nSXlI5/XFIeRTzTeiY+FoRqcNcWytXt7789l9SF1xpRFqWlkYooK8biOBNw70VWw95A8
         0dHfpDOQUw5QhHqo2mfwD7OIDA47M/LXRNSXcvvJmndT3hs3O7Bb4Lr9dVohTL+/jBwj
         l9v0T77k14vvAn2HcoWkx5i5TLUwMC8ucrQsqwsn3Z/NkblVn9JDjgQEBayvlU8hSzzs
         ftK60NbIs0iZ6sj6i3Psj4Pz9tpzTDQbQeKxv2eXWRe8SZpiXryCB6E0btF2ay1NDA0R
         6hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764761066; x=1765365866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0p+brFxfrSugope+I1XqLDlsGS2ChZBIMwEp27fsuY=;
        b=l+QIzmOeLYoSmEZ3vuvgCmVxa5B7YuOuVFfPg7SI8fHOG1fv5u2EaZJ9VOnDPiwq4o
         jY0eAoxVcg6TD8Xhf2Zshz+Qq+YNGGuqNDXwxtYy3loteIAcz4soXpD5N6YAIE6lx7Iq
         ykhjO5sLlgcpMFzyiMh2RWDrjaF5P1jJSzBsdRblxfZy8Z29ahhpBDAqQH0WF+Zn5ll4
         my8pNQOT444ns/3Uwr3TsTrrWvQXkiuZ3a87I7hqab2dDUBBIdwVp5EZky2hCtqs899z
         BG/2UAW86y74JlRDI61MeWIv2/8JtuM9IkxZZr96onh17dUWzi1KIueTSnZmq9TkPBlp
         sTyA==
X-Forwarded-Encrypted: i=1; AJvYcCVcNT+dyN4ReLDikRegajihlogVMHJYUZbUuEegGpRjVs8A6CpJd/QqOmuDeuIiz3590h4twaQZWTcjCxm4@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3fXWaXmFIWtZt5xHc5NyU4zt2IV16LtUU4/4Ij7cnYhaAloj
	XDxB7qntFsoxPudfDacx1ral4Xjeuxtxi6IkQw30aspO06XuSOZKbvlDAVx7ikyM3eAzgrrKAdh
	n0ygEqA2WTbN14GPJpmsPm0L7QUHF2NPCZNl04TREK0jqEru3B1tMeO8Wv8YchXcvOZ3/
X-Gm-Gg: ASbGncuVj7LJTKmvxdD25mJSwOIZJedIaWwHf3fEjZbLG/5meCi8nxoEAfFSQX9jH+s
	a+WP3DB78E5UOKaR3idYm6Axgh71VK+2dsKyFZ2scJEgz1IlBGdloVP8OoYU4p6D53tl/Zv496j
	WTphe4ly9QjmRpY6yLQp2hFx37xtl6tjuwpNYXOTTw47ucXEHmPQ1yv6Rlpvw+UlvG9gneR9fhQ
	zCZKu68DU7WGdvWQw0N++r/XEVrlhrp8KkdkZQQ7hEmhwcpz22zuI+0COYQwSReOTBuKS/r6VsT
	szu0BmjpphITCwX5RdyvXbORZ+fW/zzfOVpsEhPQoviVNWXHP2Qw8mSG1c13/BSrUNrdkCIIo0D
	vfXqMtbCUa32dgpPzflDdZ6I5ytejIKnLvJ9jz0W6tFywer1sZHRTMGGTqGbg+8ALFQ==
X-Received: by 2002:a05:620a:7008:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8b5f952bbb5mr73148785a.7.1764761065985;
        Wed, 03 Dec 2025 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg8GJlxN8yk6BV/gW7Vu8pEykoa/iBTfz1ywQwTepsfqi1uelVNjpJfRSA+lYOTUVInXu6kw==
X-Received: by 2002:a05:620a:7008:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8b5f952bbb5mr73145985a.7.1764761065581;
        Wed, 03 Dec 2025 03:24:25 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6e873sm18901140a12.5.2025.12.03.03.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:24:25 -0800 (PST)
Message-ID: <62911215-1211-4cd7-ac9f-232e3f585249@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:24:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of
 qcom,halt-regs
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de,
        Govind Singh <govinds@codeaurora.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: linux-kernel@vger.kernel.org
References: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MCBTYWx0ZWRfX/AKIkWGFfNkB
 1lvA+bwek67JmGv5b6sbmTiHVZqw+h1ouPdEmdOUg+h5OGTJpBp16W2cgF8g8qQMEZ1GcldOasO
 vESON55jNBTtR9lu924oVGe31Sfp3oL14oW8Fxa5IHxK+L50bGbC/zT0Zv5xpiUN7mBD7sHsZ4Z
 tT32zKNmcHo/OwC5MZIDhJF7HTJRgZ0IBjk55n6iqO4ogZSMGk7FvgjdqQCWxsf3G4ZflsaKMft
 KLXjOaANe24d0P/AEbMFM9NuRYC/GOw+r58hBKgjdnzwgyfjVO6RnWhnA1r+sJ6JBvH58Id9M99
 BFgk6M8vxKivbRrg3S+sPhatzjxN78ex9XDxZK4TKNLoMKbE+QvFPZPAn6E4FGRXg5LfLKvEzTq
 1+PaB9LbD33L0zJaJgsLxlkeyeH18A==
X-Proofpoint-GUID: OQYmheptnuqFJcNZRhvdAG90O6IqIbDt
X-Authority-Analysis: v=2.4 cv=cOHtc1eN c=1 sm=1 tr=0 ts=69301dea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=0I7aqVnf0aXTppol8EEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OQYmheptnuqFJcNZRhvdAG90O6IqIbDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030090

On 12/2/25 5:26 PM, Alexandru Gagniuc wrote:
> The "qcom,halt-regs" consists of a phandle reference followed by the
> three offsets within syscon for halt registers. Thus, we need to
> request 4 integers from of_property_read_variable_u32_array(), with
> the halt_reg ofsets at indexes 1, 2, and 3. Offset 0 is the phandle.
> 
> With MAX_HALT_REG at 3, of_property_read_variable_u32_array() returns
> -EOVERFLOW, causing .probe() to fail.
> 
> Increase MAX_HALT_REG to 4, and update the indexes accordingly.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

Hm, that surely could have never worked

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


