Return-Path: <linux-arm-msm+bounces-63209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCEAEF7E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA820164C6D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4536F272E7E;
	Tue,  1 Jul 2025 12:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbUbHnCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9B0270ECF
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371775; cv=none; b=MdazQ9agTUXbGHfMgiov8JQxWRUqbH18854KPY3bfsNPR8sRi6lqbeerIhxtXkqMBv4TZfA+275gQQmJatYT/O0EaZUN8AW05qSDx7ZWKx2UlLNVtkfzBYlQaFoP+AY78/WPf3DXBwGw0erLge4/0BsGHHRNiVZ6qX+4fiLyEFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371775; c=relaxed/simple;
	bh=WDRgfXWXGfe0UH9qUXWp4TgglhR2HVl6KIlxsZFWhTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhyWq9ChNh3vg4bgUXpr0Ss1NC1SghxViUvnVNnzCdtIzkennKqPjZIXk08CFS1SFvc4WngDvBpeMeAeVR0/wElrZoNfMFSbyoMZGdDixWY6AgWH1U9/WO8TYJYeyIUUMCyV2hi3WZHkLorIRXUhOUVT2/oQBvjAKJoSZ4pS5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbUbHnCS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561ATImq024944
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 12:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lf8Jmyio+SLdCvkpCacq2i+KFuRD1jwhGH5OllRLLL8=; b=ZbUbHnCSdKJCie0w
	1MOcIYiXdG7Z2EFwtFGjxvH4/X3fhF3KgvqjZO96vEiG1r065QMVrFFuVfcyzzoJ
	GZvU3Q6WGb76ODHDziuBorpqg/rlvdHMZHyYzsXjKKCiGRswNK6hvuAsCcxC7tNO
	tKAIaRwo2hz8jekaTv6UaFdAG6WMGiroOhDdJfYhlFtPjSPqK8maCjs4MgH+OgEd
	z0gS8k6rGEi6xcKNjfd0fe5bYGnH82soTeo/AHWnOK/JoIocjfNm9KkogJZeg9Gt
	eVwesQZed3zZac6fAGZ/9TAsCZ5FYStunXL0qos+fZcFB/2+oC+xFBJtdqBrdjUY
	nyiRXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8020q87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 12:09:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso10566521cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 05:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371772; x=1751976572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lf8Jmyio+SLdCvkpCacq2i+KFuRD1jwhGH5OllRLLL8=;
        b=d5fubZsB5tIi1M4UoXbX1yVtpb5y3MqhVnvY3ZNoBmg3YOk9oonY/zu8RoZZBxC4yc
         51fETnzE30shqrj5m3/+q0huaIZP5sxbHUmUDOw2CtwQ1jYbVXzypxbrUycWfsM0/4sT
         OHpTXXPgkk6oaBC2vMYnlufQB2s17UOO6YFpulI/Rf2c+9LLawvE/UfQsO65cYh1RnCD
         Jqz6TyEdEHl4Fe3FkEQ7Z0U0LyuW+KM4ezc1Omi+9xeFwpcNIeP7fhICIcm+APZOpf7U
         BJXQphjr4U4ARajVaPaLXzf+LFTR7GweXS+NE8rmey0T81RTIn56DWMo+AZ34GcIVHlO
         yxxA==
X-Forwarded-Encrypted: i=1; AJvYcCWlJBG57N3mLbwAm1diM7JAZOr5g2plH9MMoLWyuiPzPCCI0m1I8spPqAcFY7/PyQsLh770uKMJT/TcI0bV@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2A/1gDrNcXtqcRqDdh3jnJadus3+QbSeUGG24tCdKO8c3sD6
	+/J93fnZe2vKRDuJU6gXEFXMwJkeVJn/Ezu97cmK/C69TwPva2sMgBQdStJ4rszygT56Kwr8Pjy
	q/EEtTD5DTNQA8jpvzoR31v3o3ck7sK7oqJMGCENCyI1nYKiFc3aWtYWotaNfr+APUpdO
X-Gm-Gg: ASbGncsgbe3aw5cWv8i5aZ/QYr2LTxmx33WcUZp1ju1+7Hs4eztk6qQ1J2R8sxaPtT3
	89a8/5qqfZ9/931k9nwCuvOdtHAGyqogYkt43xvy2ytvnid9Hu6LUgprjpBc2GPLMXOkBX9FqrH
	g0vSkDj5HpOIM2vIbC7B7/wMM1NvBgE/o88QqK7OJRcDModzMkbbMOQwodQenN0ck8mV+iwndbP
	wEDI6YT4C5rjNrF9BYfHghAkd+YEE9XnmpbJ+V61vVu3JQxCY4KZ0XfhDk9j8YfuXuoMs9Sv6WJ
	mMyFmh0aHPPC0mk4yDSb8r3pFULb/dQz9oBjp4RaU3KOqrN/Uhrtr/lscuTEwnpaxxyTE1RgUeI
	5oIvPQ9xD
X-Received: by 2002:a05:622a:5cd:b0:474:e213:7482 with SMTP id d75a77b69052e-4a832d99b26mr13892281cf.11.1751371771287;
        Tue, 01 Jul 2025 05:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQVXZRZhEnxAxzvyWJKIWKbRY1rodAvUMKMkXoSRbY/JskzbHVFmzlfJJjTVfgKYRM4buiQg==
X-Received: by 2002:a05:622a:5cd:b0:474:e213:7482 with SMTP id d75a77b69052e-4a832d99b26mr13892041cf.11.1751371770787;
        Tue, 01 Jul 2025 05:09:30 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b24fsm857473866b.34.2025.07.01.05.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:09:30 -0700 (PDT)
Message-ID: <9db5d1d4-1965-4334-9540-fbb66498d7d5@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250701100659.3310386-1-quic_sartgarg@quicinc.com>
 <c7lpaij5f5monr7zfeqitncwnau22iollid2gs7okyorlegtmg@jlq65x7ipp25>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c7lpaij5f5monr7zfeqitncwnau22iollid2gs7okyorlegtmg@jlq65x7ipp25>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fRUUdQ_jGjUl0_TeGUKGKtSFm3cNlbrG
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6863cffc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=NKAVfNCoMK6aC5uGs1EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fRUUdQ_jGjUl0_TeGUKGKtSFm3cNlbrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NSBTYWx0ZWRfX9EDitUilojt1
 Kh6KhSSrHbkGNicv0tPl3PjlXkr+Z2Fqkm61IE3moJQLcEZs9ctVLYuz7+mCfsMoe0oQy1gWBB8
 cBcixz8Odc1437SgS2J+zRdObz+Wgx+y9jukkXCmWlkZq47N3XWUfz6pKmKqGz6dvsnyXHc2AkO
 ZMA4jOs7C/T5AEql92x2IL9uUjgYpynp52JlYh4NyyhP1OwraULbazZ6/wdJrINu/ZyzekNwLLm
 eLb2KqwGFO3xeOW1M6u7CVIRzwAhhU/7/3XirTaRvkH7mr0sQbfhqb8BYvYMX3WvTe7n3FB/nop
 Y6haUjmPTXKilxSB0BwQX5lVcoh6Dtfzw9W14F1Ql3vzIyfazzSfm/M/DhFx/tebDocqQrBka53
 LHsQZL6ocsnrZAwW5mkvbm4+qKB/nJUl/CIDIcerAlNgf4gzMTbDX8JHrNhiZFkj6NmNLyd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=629 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010075



On 01-Jul-25 12:27, Dmitry Baryshkov wrote:
> On Tue, Jul 01, 2025 at 03:36:59PM +0530, Sarthak Garg wrote:
>> Many mobile phones feature multi-card tray designs, where the same
>> tray is used for both SD and SIM cards. If the SD card is placed
>> at the outermost location in the tray, the SIM card may come in
>> contact with SD card power-supply while removing the tray, possibly
>> resulting in SIM damage.
>>
>> To prevent that, make sure the SD card is really inserted by reading
>> the Card Detect pin state. If it's not, turn off the power in
>> sdhci_msm_check_power_status() and also set the BUS_FAIL power state
>> on the controller as part of pwr_irq handling for BUS_ON request.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
> Should this be handled by the MMC core instead?

If possible, yes, but if it only works because our hw-specific
sdhci_msm_check_power_status() behaves a certain way, it's good
to go as is. I have no clue if that's the case.

Konrad

