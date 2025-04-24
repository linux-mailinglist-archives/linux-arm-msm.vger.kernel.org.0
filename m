Return-Path: <linux-arm-msm+bounces-55527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F16A9BB23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 01:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739241BA3E4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978091A8409;
	Thu, 24 Apr 2025 23:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPXtDxfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A67A93D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745536649; cv=none; b=Jd1obzEBfAxLWHA5B9iwa8Y0f16KuQ7jefs8zqqAfKIot6Gs44nEG4okbzQC8UMdQpZXiQODWMGTMFN+3DcJbs8xslH05uBZYcB7lYp4C+n7VJIl/IJnVSuL1GxlteZGjP9I+QxC4c0pKmoj0GmYn4VBWHO1A6UBHp6IHgHTz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745536649; c=relaxed/simple;
	bh=xuBNdBaDtoK9PUIk07YmwqOIvCjfqiMbpRQh8zcCEnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqrG8oz7dMF11Ot+xOlgCxz1OSRM/ALCLBcP+yzihP7H+DH/Mv7i635d00rnQSytc51k5RmJjhoQ9CC82jxRqwhAxQ4UcsfZxC2x8VHUF9+ApRbbidDemJhHiRDSyH5/RVrX4Pz4IHD9ZAuBmRJpiUQNjLSf//pKWOonOKvI264=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPXtDxfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJn2BN005612
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zi78O5WbxVRKiMoABrInJVSACYsCJLLIPTs7LoDla78=; b=XPXtDxfJGoyg9mvS
	1PWDaXIin5QzK7YNqN8tHHx/D2LWbLNohlhLjX6R4WAPRSRMlIJe6kFEfNEiZotl
	w87emtDd5bead2nduArq5DR1V7TaDEgqYpxlx7FNjzbXJVCBqXDPurMskSBfDi7M
	PIan4bURnzV+kSzblYrqd3dF89r5SiuplgF06xc9cHpzLqOzpf2RTb6rws3B4jrl
	muEpUp8WvRHZ1Hwi0ACniTzl0/QDxjX7OjkfDuZJgHr0jPDIYzXPe9d/4mXWIwBd
	HoyvLJikSrqkXtl9JV92irgnKYBKu8KAqvGJ7NqyVfW0rZJd0NeAXyERQVxaiTZN
	xPL8Ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh074s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:17:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso3835766d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745536646; x=1746141446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zi78O5WbxVRKiMoABrInJVSACYsCJLLIPTs7LoDla78=;
        b=J75hRWGLNDd+knTYodLD89PL7g70VhOc3BrPQvn7lZTjzqFjqpGoOsAK1USIoRQr81
         MW1/JUnBLHuYExzT1uuHf/CxRUXUdD88d4XS17LEmfrTU8risSofsjfIgkYJkABDbQ3f
         HEpzwQbjTTH3RP+wIY6GVkUafw+0HsqpshFiwt/sNzQ83J5qThWqAkseOv0s+MzaVW/E
         CAjgxzpmH6BFVT17xZuVnVOW2ijwhYvIZfCKGCEre4O1SaAp3pWdTISbRIU5mDSxtz9l
         1a4pW1eqyltS8+6723cvfXNgz3jfNZxXpUwJhlpfQKMr9GDLx+XeWJ9h2gtSU9g2WcSh
         Lqsg==
X-Gm-Message-State: AOJu0YzKZjNtcSwkGWcKM9lJMYCC0eIGqVHK2YcIarKsvylimY2vnS4I
	zPzdoAaOS6e0zkyX6aSEBviEaT0qIz0cjc31NPVEXHq9rDohpmY5dnxx/JW9GoYvZkY9TN5ZCGi
	vJELwfxr49j45bdFS0hq7sar258p9rUxTipKyQQb9jBm9v1FkmmQ+M/BohbfzlZkL
X-Gm-Gg: ASbGnctsBHsJb98sXTw6BXAQhvT9nfDn+8V+Cd7YxTUzU9dgyoc5tTn0gmKW+hczjsw
	QITyq/gKqCcLIRhfoCccvbuwv+F/wNLAnWa5zx444hNZGrWw4Rbj9vysjRx4t7PKP6tNDn41AWE
	OT6B9q73jAkZPsbc8l0BhHSjhx4VvxtB1KGuDvaAQRnY9xonu7GsNvUsbsDX03+a7FwJGRZlwep
	D03U62W9w5i0Fx8RYJTjQnSC/lcevfl2El1c58GatXdsTH7OF/LaXGx8805n6DKe2D5xDmV11g8
	gd06n/7rCgh82bRGLpZ14yU8yYYacqPT1O0mpT3N2L/giLgDDvkd7ySSHqdRnpkpSEA=
X-Received: by 2002:a05:6214:21a7:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6f4cbb7cb69mr2191256d6.10.1745536645892;
        Thu, 24 Apr 2025 16:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDZmAS7DYVWeiSkMuy8GfwZYTNe5JvZjTC0/L6j7VV4QyQaPwFxEfacEvvuXKFduP20LB3BA==
X-Received: by 2002:a05:6214:21a7:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6f4cbb7cb69mr2191016d6.10.1745536645591;
        Thu, 24 Apr 2025 16:17:25 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm361610a12.22.2025.04.24.16.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 16:17:25 -0700 (PDT)
Message-ID: <c6a7278b-9c11-4cca-9400-c8ccbb1473a2@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 01:17:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: add UFS operating points
To: Neil Armstrong <neil.armstrong@linaro.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-topic-sc7280-upstream-ufs-opps-v1-1-e63494d65f45@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-topic-sc7280-upstream-ufs-opps-v1-1-e63494d65f45@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2NSBTYWx0ZWRfXzgMqRwAbVPbR IRq5y3Ksjpcg3couYcY+KFXQvnCm9wsUzk+FAL27GnwMsxkmmct37aYEVpOeaOu4E00tAcNELOD 7PIbk/t3mFZh9qTN8C3ihy05DKvqFJOI4GaRmDPQ4Zqf3/u0ZM9IS2lu5ykCBKAK0AXcN4WgE/7
 Y8odeEIgRzNclJ3ljykm6yNVGvRht0XrUqkL9znvIa7untcr6znhEOx4bkcu7z1Bd9Tk96ByLsL vitTM43xSI6AK1xlH/kCoakvAfRBLs1AvET16o4NEC95gwF4Z6L5JCKhUyCT9sjd1AImPsxCjVk 9nZ+VXZaoDt1WKkjYua+E5Rd4wwUIapBq5L3KeJltmSXzIlUtMlB6NcCAPbriC3Yi9dzJvQC57e
 z9+O54NCQXH58GD+UCwPFv5hUoaZw/lKiTVHNPE9dkuxL+4sA1WZaCmGU+Ht6N9VZ4Tzcy0j
X-Proofpoint-GUID: uG5cMiZhA0e3ZKJ_cdXnqtmzKV8deJRZ
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680ac686 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DVEdH54ji4F9k0XG-nIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uG5cMiZhA0e3ZKJ_cdXnqtmzKV8deJRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240165

On 4/24/25 6:31 PM, Neil Armstrong wrote:
> Replace the deprecated freq-table-hz property with an operating
> points table with all supported frequencies and power levels.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

