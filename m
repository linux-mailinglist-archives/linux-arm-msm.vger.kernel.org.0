Return-Path: <linux-arm-msm+bounces-79555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD66C1E389
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 04:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18348188E755
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FA02C0278;
	Thu, 30 Oct 2025 03:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwRl5gtH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmFjKyXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BD2C1585
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761795554; cv=none; b=Xni56NzZloqZEc9WKeArRqJ3ikwzAKh199FtzfK6+C3d2u/7egncYpnW+xpktlE0Sv5Z4hwZUeHX2MjMysj+3AZ/twUgn3QNq39D3Qv+x9p2gkaEmBai9G4fFPxNxE8yRvUV+SsUi/wFvviRH8pM+iWhD6FQTxoPkVv2YzD6Dvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761795554; c=relaxed/simple;
	bh=w4b7bMYZQ1lDA5SR2sOhvAp6iXdLS4+/1bLZLHD6SDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa41PvcC9ei4n64l0z36nYSKGlHdRU1Jo2RGcirfS5db1PG5ZpMMHwtLCnSrZhY8WiL0lQc/BfBQZDaMnF1KxCT3gl9/5aHMny2fK1tKkuf0JnYiN5eRUkCi+Y1URTQM4JQPVlcTpyXgI9R4tUZ8e70jAxB4tZsYzSCnUByIoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwRl5gtH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmFjKyXw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TL7Bkb1578910
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhYPs7vpcUnJsvDso3Np9kelujWCWr8tqGZf4I83GIE=; b=mwRl5gtHBK+PfKXe
	oxxbsWD0u+UUtaO0ETxqmp20A/rNxi9lJzuLRPLgHmSSCAm24Gmiv3WBKCHCSH1F
	FFdkHgpKoa5xCqt8HnSqIw/cYw3soYbFUHgZQIC5KhH+xwd1hWoAIx1H0EbNcBM6
	KrUP8o1QIR1NVE0MmnQlE0eVud0TC5GRPLLnIKj8KtyWDfYCRu/daUQWefdm9o4d
	kA880vQVjEWl4aVNRTEgKkRxniUNFCEK5qWjbyBQaNNUbq8T5n8GpYZdgclTScf+
	c9CRh4u32hF4AlkdnMhlg4N1ISkv/o8addhlR1AlRDeuzWlROzVkFGX2oEQ+N+hW
	kRyzeQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjegx33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:39:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28eb14e3cafso9895015ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 20:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761795551; x=1762400351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhYPs7vpcUnJsvDso3Np9kelujWCWr8tqGZf4I83GIE=;
        b=XmFjKyXwXDMU6dhhGx/gp/I5ToTj4/GUiegyydQOL4UF03RD8f6IVixHHvtIis+1Ya
         3ZCAi6z2ZRUhEWQcEMPLXmOvC2lsmEa9nqcpX3+KOB4p0NikSbHnZDYqUt0+wZdRomGi
         wO0vFCtFwm9NRpChONYyK23L+pMjOXyJBMIjNygUHvz6QjL7Wi5tjTSHg6EnVR4CYwVF
         nvqwxDDx6VbIqzkDSKl5/yxaeIACaogsZCSbsS7+P8zQgFUuEg548e0w1O+1wETrl9QB
         o4sFno0cDFEQuTEyN5GMzv51MWfSgobEqgQ+b0vrzoNIcKSFK1WWFAzHnVWKvCDQSx9H
         GyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761795551; x=1762400351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhYPs7vpcUnJsvDso3Np9kelujWCWr8tqGZf4I83GIE=;
        b=bVGvUpaypasg5q70JqzAQQrQNjUNa6uAnxyvTJjwIvf1SOjlr9d/LaigKDZEq5Ah31
         FVgJnFqU8W8LQvqnYynf3mfgYmXu3ENrvGrWVsEqGLFOXJNT4qXnDb/B6PvFmZtSjZSx
         P10QW5sGmES9YLGgxdqKzqylAM6gkzDz8E/ksmQVd3tNrOVtVTbhaN8o7/nVTeyXvRyw
         OLPELmwuqO3wKzec4uy9Q7OZzdniR5ttBKsnB91HlwbXOg2T08+ACLi6TAYX3DOKPg1K
         OFR0LB5Y9zIOsionhSPXNIcde2UXUOtoJlh1MdGNMuYcXNuTyvpwjz32CSKH63Dmay5y
         hRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNePygJRaxfYMmC7FUQNHlCgEE9SUhtoO3kpUxM98n4fds+oFjJo6lephbcXh0P+cEV03t7bToJKB8Ac1j@vger.kernel.org
X-Gm-Message-State: AOJu0YzOHcjNRjfjSxnzrj9CcQeDQJT8zZqx9sVWuopLm5Bdv9dxWOau
	uibClWsopu5AadfhzI7+RRHjWg4MQ9AlTziYgZSETX3nbixiIKc+r7jt6tjsXrx60/MfSBXXEUg
	Nw7L3YacHUSYdn1q068gTP85+EYOpzSAX94tUfBL8tpsX4sTKskpzijEZRFEJzh1tjR5a
X-Gm-Gg: ASbGncu1YDlRJObu28FZApf64jKd4T3oD7268c7WH5SsWATmyYB9WrS5mMZ5YrMcXie
	/jxpGEEMv31BxeiclYPw/4jB6RLYrvOoEVyfS8JHGJypmGyhWrQfY+68uBN8/WTJqREOwi9gz+w
	5/nSZI9y3dufpTf5m/Ax5NNG9uMUc+D9W5W2huRgzzVbSF4Q01JYlZGq9gWhTDIlVWphR/mWrVG
	8AIG6F/dTn3vPDsXGYZ10K5jPJGJ07Uxrds83YwugtBtA4D3YwGwm4S1n0hWKgkFW9kwK2+ztAE
	j/2NxFOEQxpwj9o1STymGoo7ACWPByDf3k6Ss3Zv4t/GlmJLFqb+REPkD8DliZYH7FdvJ7/rlOI
	vyFhJQFkmE0qXnQWeU4rPr3+1UNrV3dk=
X-Received: by 2002:a17:903:240f:b0:274:777b:ca6d with SMTP id d9443c01a7336-294deeeb76fmr69476535ad.43.1761795550679;
        Wed, 29 Oct 2025 20:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDuq6Cy861gKvQjGL7vn7LoqYvAFnjvADCSK6KoaTP0/m4xLO7nEAtd1CcKZenG2kW18zBAA==
X-Received: by 2002:a17:903:240f:b0:274:777b:ca6d with SMTP id d9443c01a7336-294deeeb76fmr69475615ad.43.1761795549359;
        Wed, 29 Oct 2025 20:39:09 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e50dd9sm167674895ad.111.2025.10.29.20.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 20:39:09 -0700 (PDT)
Message-ID: <06a9de6c-c9a7-4c5d-9be3-5c9c9b4a56cf@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:08:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
 <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
 <jjbiamlcof6gttme3crotwyzsxtrguohaib73gcsaabpan5fqe@s5uroqqargti>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <jjbiamlcof6gttme3crotwyzsxtrguohaib73gcsaabpan5fqe@s5uroqqargti>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pL78MbVUqZYQijV-0NZQpVMHzbDtr4r0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAyNyBTYWx0ZWRfX+HQBSiRnoGBy
 VyoiPtm8a61tXtm6Jk02WEtBp/shUdALZMRdJoS3pcYfK9jzNIKX7UIsNpJuZZyaM0xO3flDNMV
 oef6xar4twj8pD828l8gWV4PbyvjXvaQU7NpnsCsNlQaikeWcoTZo+vwI+jgYyS0akt7RCFXJxF
 g+iQQ3x6UHOwcQWL76At7Lkeegwk1S3+5Z+yLRk5IKiZS2bBQjdccLqpwKIzuIk1vbUavSkCRq/
 Y1Iq8nmjAoyPchXcEW/pK17+iJv3xzWlWRRemPQeIH9GKTz7FvttEcoghUqb9e6n5is8ER+DC5a
 9K7YwdbwcZiJq3wd5Iemf18SjafGTU2GdL0v4gjjUIBkpB/ZNALlTg85111TQvLLiOqFCbbSzzP
 Y4k2Zk6OOr8uwpv4O26TLWY4KiahPA==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=6902dddf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eF76SeNzXSV_S8XMPHAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: pL78MbVUqZYQijV-0NZQpVMHzbDtr4r0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300027


On 10/30/2025 5:34 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 05:00:00PM +0530, Krishna Chaitanya Chundru wrote:
>> Enable TC9563 PCIe switch pwrctl driver by default. This is needed
>> to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
>> Without this the switch will not powered up and we can't use the
>> endpoints connected to the switch.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
> There is some broken logic in your commit order. How comes defconfig
> changes come before the driver which actually defines that Kconfig
> entry?
>
> Please reorder your patches _logically_:
> - DT bindings
> - driver changes
> - DTS changes
> - defconfig changes

Ack.

- Krishna Chaitanya.

>

