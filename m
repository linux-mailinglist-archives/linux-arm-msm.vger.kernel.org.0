Return-Path: <linux-arm-msm+bounces-52472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71062A7047F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242DD188D5A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8663F25A62C;
	Tue, 25 Mar 2025 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbjF+1/1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBCE18A6AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742914928; cv=none; b=WnEby1SUHuVjZM9CZBIju6tvDqltgnrHGmUzqAveHqm3g41Ou6n7sRhriOtK7dx5Cb1RRnCqteLfbAnbCi1OwWHXNylGqONRAF2xAqBWIR+CX1cYPAGRc6xQY9YkKEKRvJP7dqB3301qx81ZuLZv3aZlkjKmabRJHpYVteXSdRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742914928; c=relaxed/simple;
	bh=BmAU/M5ltULQKNyysUK+FmVAyg56Vw499pyMf97QL5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2n4+136v32SgofNgLxDZ/SSlFsTC8Tm1LomAe7fPP8zKplfJHYdioiUDqatcu13uRoyLwrgJq+mQ2mZ+vUT3pbuY5iQdU+nOSwcM9XTwKCinuxCcu5iLODgnqAC0dgOXbhdqJ4z5cXo0aJDRpM6EOo3mz+LYJnB1RecQSi1zsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbjF+1/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDj1pq024709
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 15:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0k0ZQD0agrNiXKZUYp0FW9zfWl3toreXjsE9ra4O2g=; b=CbjF+1/1Yq2dywFL
	jTy5EfswbVcrbTsyoOiogEiuXi6vLEZ3ysbQTQFGkcP85VA0O6O4zJ2Bs+E6QSY3
	q/nieWTGT102AExd81FHM2m3c56ZWseJCupiNFocqDh11W4TDlflboFdzTFN9yRX
	lbXNcVeybmOip2WTA3ftTiSHlxvAklDYZ4duF1xc5whNNkcz30PtzUFQm968tg2h
	EOuvNvnrTBd1TvImGyafZH1T/DZkaA5+pFYLj2rTunVa3m6++igiCT27heOmU8U8
	3rZeynf0IQ7hl4Ln1WJ88ZNnn+yUWTUad4yMGTSyC1IBcD3R62azPl2sniOaXqGk
	IUDLZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjbxn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 15:02:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227e2faab6dso15094115ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 08:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914925; x=1743519725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0k0ZQD0agrNiXKZUYp0FW9zfWl3toreXjsE9ra4O2g=;
        b=PvXCQ5WoRZg6bmVhsOv8QgmWh4/hr270CS+d9w78lEtcRhJiq59up7dSyYE1637vu+
         5Huntw1NO9xA34pbayHTx6FFJJuZwa4RvwHU6nFj8f29fphwJPXDOBwCg90e1oxByANC
         iFy5AEpG6OYUy1m4fKXB7YxzAtoEfUN9yyKNJNBwPNAIPYJHEwwveEgCiOA6+KYSkvZM
         ormwnfarZ1kcPq4+LD9wN11qGp9I357ar4whGHYR6Crw1zbNxIw6axrwtfwbNfNvae5x
         Eq3sz9wsb/RpL6XpEDwOsFOIyC55de+DshE98WuMaYwofoK9Vjlq6HkSzSiQfx4g7n8J
         Do+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLGwzKD9AYD/eYt7gzONlL6tACJfdPe9ZGCiQz956aK9+5cpIRXfsw5WWgf5AOBIa1PddQaJy8u9XvWI8S@vger.kernel.org
X-Gm-Message-State: AOJu0YwsOc/2px+vlZbvKhR9+DmBpzKD9GC4djVN2+gBMErNrcMK/k8v
	DFDX9U1IUSZhtRJm7NWf1djO3k7om5avFGmPG5rCzOIjCHH3OnVtbxMC/bE2kaglou7mpPxEZmq
	Ds6zDVU0rOswo8CdupUs5guh9siJp9CvS51CzZS2NH64v8mJADLxcRHX2n39T8nMt
X-Gm-Gg: ASbGncv60MG3WBQ/aiVYWILo7ZFOF1Q4auWi5WeH/t1Rw6ODWYgbbfalWZk946M8/VJ
	wxnODcCcWkCweNtQFUdbKbfx02BXg0IiKU3YtVxVw+OjGxnllN5zVXop6Ste6mJm25TB5LJctoa
	q/VrzwW5u14O4UT84U3xx8RcOV4LZp3kWgMz2rY1VlWA+QPVWW3i9KQig2JGgubdt0K8awG+vat
	Ri1kx22Z/hI84J8AdyScP7aCM3uiOGtqeXuwXz1mCARgG6TrfYqQYeyoHGrB+b3jraFh2PKM/OH
	rjhiqsSX7sJGWsUgLNaydpp0RHYZsO/L+mO3ZI1gqQ+C
X-Received: by 2002:a17:902:d542:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22780e3d70fmr304420145ad.53.1742914923482;
        Tue, 25 Mar 2025 08:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1mPbYXqKt9EK8jIlWkvsYFnh2mt5OM6+fZ3t2Lqn9JZtCj2QkLKlfrd0drlQM6CvsRA1YVw==
X-Received: by 2002:a17:902:d542:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22780e3d70fmr304419465ad.53.1742914922936;
        Tue, 25 Mar 2025 08:02:02 -0700 (PDT)
Received: from [192.168.1.149] ([110.226.153.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f60b919sm10390715a91.27.2025.03.25.08.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 08:02:02 -0700 (PDT)
Message-ID: <7029a455-47be-475d-b429-98031d227653@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 20:31:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
 <ee0848ea-7a06-4f4e-9115-5e3c0ab8bf95@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <ee0848ea-7a06-4f4e-9115-5e3c0ab8bf95@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7rIuQVQRU2tRIU5R-rKx7_-YFwTpsi5e
X-Proofpoint-GUID: 7rIuQVQRU2tRIU5R-rKx7_-YFwTpsi5e
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e2c56e cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xCN+fvAPfuA1Y6DlmAlLzA==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=izccJD69kMcyVaTehSsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=943 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250106



On 25-03-25 08:11 pm, Konrad Dybcio wrote:
> On 3/25/25 1:30 PM, Prashanth K wrote:
>> During device mode initialization on certain QC targets, before the
>> runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
>> register write fails. As a result, GEVTADDR registers are still 0x0.
>> Upon setting runstop bit, DWC3 controller attempts to write the new
>> events to address 0x0, causing an SMMU fault and system crash. More
>> info about the crash at [1].
>>
>> This was initially observed on SM8450 and later reported on few
>> other targets as well. As suggested by Qualcomm HW team, clearing
>> the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
>> write failures. Address this by setting the snps,dis_u3_susphy_quirk
>> to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
>> on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
>> and hasn't exhibited any side effects.
>>
>> [1]: https://lore.kernel.org/all/fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com/
>>
>> Prashanth K (3):
>>   arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
>>   arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
>>   arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
>>
>> Pratham Pratap (2):
>>   arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
>>   arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk
> 
> Are there more targets affected, from the list of the ones currently
> supported upstream?
> 
> Konrad

My initial plan was to add it for all the QC platforms, but wasn't
confident enough about it. Because we have seen the issue only on these
targets and hence tested only on these.

Regards,
Prashanth K

