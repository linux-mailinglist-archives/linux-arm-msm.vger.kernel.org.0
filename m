Return-Path: <linux-arm-msm+bounces-60437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24541ACFC8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 08:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7051169ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 06:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702B21E32C6;
	Fri,  6 Jun 2025 06:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aw51M0gK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7741E8337
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191146; cv=none; b=fAlCF7kGNJCaFPiz70xhvt46xRYysnR6z6dB9Ypn+WDTUctatcNIeFd6pI+xsqfPmrCTZpnSfYPj6BBiu7nClTOcntnnzWy0mEZhjAiahzcQ6AQEPd2OxXtHznZ/NQiBJQzAmpgmZGVm5UNxlOuCH5aW+AasiKzszPyIC6d8c0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191146; c=relaxed/simple;
	bh=0VpfxtmCgm8EONY7kqxEBvyTvTG61ATvEPB0aU8y8q0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=E45V9pylnyqIhqGGwuiNpodwStEpS1tW73C4eTb7+k3MNi4tU//ufzGJ/x9zPRmsZiLSQ++PrJq9Ey+sUpeMnS80kmDaMn2f+/HXQuZP2LKsfsEoT9MBw9CGu2UNfiSGYpb6WQ4VDgNIE/xNkYl6YeCLCHjFKLh+fKovN4iSKeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aw51M0gK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555MAhgM013007
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 06:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v7gKZGrusJQeegBsEU3P4m
	a4FsT5JHpcucwRLrQvV84=; b=Aw51M0gKWnncDtk8iLhugqw29FDs4w3iZeCwuu
	S7oVJSh5xtUB38PeBAA60l7Oj94Y5OC/jvWD3+U47GXpmHJ8J39P++bFfy6UtdDA
	Tdt+GF+gKLzKzHvcy4YdZUndy4nEpoCVmzeheFeGtK9DFtPJ5WoHNXuc157cPylV
	Aj8ZNnrtpOFKKP7rNpY/ESVTLGA1lyiCBQY7Xh0/90SRpPIYrt55RoiZVraX648P
	pkjUXxhAtELUy1n9ePmdLuCUuWO5HsRh9UIvSV6e0qDdt7FaBsQzaM3PM/uDe/vC
	Q1Ky77PmtkZ9dKzZyC4duf9Zmy3gMK3kflKub6zha4EGrTEw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tbnm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 06:25:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b115fb801bcso2026665a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 23:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191143; x=1749795943;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7gKZGrusJQeegBsEU3P4ma4FsT5JHpcucwRLrQvV84=;
        b=d+vOirV2bclgzI5uAIFN5NEKUm2yudirdOoVz5l5EOV0UxYoUgWlBdFkaZXoyQvJNt
         Wmfca236DtANOxQLTg3jIP9zv1L92d4/5zVCouCniKlPduo0KW9PDBYjhzhg82DEnspY
         EhA0Lj71fVH/YxADiW5tLwK0M8oZpZFWSOh4OUz2skgj8FqrL7E643F5dwxUNhOx/O44
         N+10aPBb236ZkTx3BqgfAAROURaIF2ZfJvuXowsoajtHmSKHJ400UB8/9JR30TE1jRO9
         bLp1JetdQzK+H/aK/LJjfJCvQ7GdTfehxrXUNxnqZd88S+vBExIpDZ0D9kgGUoEsUKw2
         kIiw==
X-Gm-Message-State: AOJu0YxL1ZVCIGvL9HgF1o53fIQhc9wnafIsIDUD/pooNlSgw8QlFJX+
	JsQsi5zfx2O2JHr5kI5sUfwXbv67acOUj395RGggSu72G99G566Usjln1UpT2lDRIwfHmhF0jiP
	ZPhoxKzsSk0c3hFsdR1jFHaKdsbjLguGVJdQ514Fyu3iGV5HVlSIiQLRUaBzmAdmmJ+ag
X-Gm-Gg: ASbGncvzErBHGeFFemlSLp+Bb8YzeB0SicJc4npjRXHCjWRHVjKav8KnFrnUL98N5kn
	Le3ct650OgSyrK4KGi+5gpE4sUO8gNoIKQmRkgwd9mSOywrERdevZkdRQ4MeWapsdu9AO6Duygy
	7cF0mwfRO09QyES81dEo0bv7p7mal1ayFAFffxqZyVfPWottbqjHI5q/xftI+tUK4dTxCXo1Huh
	gH+IJc+S5lLG+CjpB16MiPraPREMLuOnF9XybA69Lr7sGw6z42IEgyR/7+up6b3v0VfYrkQmtX7
	OVqmhETBMERk2P7aTP+z329i+bDuJ6ZgeH9Z48PyBlJL1hxm/AQ0SsEbQYquNysSCl/SRrxF+Ps
	oQA==
X-Received: by 2002:a05:6a20:d80a:b0:21a:efe4:5c6f with SMTP id adf61e73a8af0-21ee24e7774mr3496099637.2.1749191143040;
        Thu, 05 Jun 2025 23:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLtUUS+InC0Q4lxSx1iaKa0BYfPrSzKIk+E0v0Lv2PKLampg16JpOrnqpxs7yHyIgoWD/Ydw==
X-Received: by 2002:a05:6a20:d80a:b0:21a:efe4:5c6f with SMTP id adf61e73a8af0-21ee24e7774mr3496069637.2.1749191142651;
        Thu, 05 Jun 2025 23:25:42 -0700 (PDT)
Received: from [192.168.86.35] (syn-076-176-048-107.res.spectrum.com. [76.176.48.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0f28a2sm625140b3a.174.2025.06.05.23.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 23:25:42 -0700 (PDT)
Message-ID: <ae3eb699-4501-430f-8a2e-83a25aa18c95@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 23:25:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From: Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: devicetree bindings acceptance criteria
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=684289e8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=1dT-6cFf9uBOoVfp4lYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: DY6X96e_-uPFTddUNUgmR-0KDDuGoFzD
X-Proofpoint-GUID: DY6X96e_-uPFTddUNUgmR-0KDDuGoFzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA1OCBTYWx0ZWRfXwu6eOg61nA8u
 Sil4zMAhXQN8P2EqymxA1Uos6ALh8Hew+GaxjHwjbeDBvL9lkoRkVyIGs8uQ/F7QT/Iw9AgcO7B
 8CjnDRxnzQN8mi8WZydCfB3VAgtI803YDVYUfNjWcVsWGeJjEiShxWHOUh+SjwMgPD1Vn7KuZI3
 lL6KBlY/Pje/nSw0nr43XtbklWLM8Yisc38PWXZlwxLy9zSoy4CujuPTFZ8clgqUTx/S2yO6/71
 xKGqaOmrPF79vV9PNcm+AOR+1OcQP/TdthUdAsRYhPabFdoI9NUc3JchmWj+5BjVbX279pOIEaP
 SNeXe4imvVSjYwXGIm2kjzXiXhZkwq4yW4THMMsdJlKNkaso/V2Gsfn0Db8TXR6WN2Ga85W2KGr
 /g0GUsR/XMWVF5IU8k7l6k84EMUROU6zFNDR3kBWUnaRgTqjZdZSnMmc1IZVz6+610AUv3gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 mlxlogscore=959 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060058

Hello Rob and Krzysztof,

I would like to inquire about the devicetree bindings acceptance criteria. 

Are you okay to accept only the devicetree bindings patches which describes
the h/w but developers are not yet ready to submit the
DTS files of that SOC-IP and the relevant code in the device driver.

Please note that driver code and DTS files we are referring here
are actually open-source and they will be available on our website like
codelinaro or github.com/qualcomm but they are either
written with the downstream usecases and not ready to be submitted yet.

By submitting and getting devicetree bindings being accepted will
help us to make our downstream drivers compliant and later will have
less back and forth when we submit the actual patches of downstream
driver features and DTS patches.

I am also trying to find and submit an example to the community
here to give better context for the discussion, but thought
of starting a conversation.

Thanks.

---Trilok Soni



