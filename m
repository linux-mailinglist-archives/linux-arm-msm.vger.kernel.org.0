Return-Path: <linux-arm-msm+bounces-97867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH7IMJXGt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:00:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD529691E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FB230057A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8066638238B;
	Mon, 16 Mar 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEX2PrQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHQmr/Mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423F2382395
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651492; cv=none; b=pExGCoAuJjeFEqTZE4rlKKkIvb8HHIquyCSzqMfNICNoSAkieoAqsdHYk9CQmIDUz9BORb5I9cZj+yZMCsBcls2WV55uaE/wK3LeI2seipmI7Wl5HnyBsR9wpR3yzTYnz3GtgNJINvZcaezfffIUg5mHs9zwj7DsLgfXpj8z7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651492; c=relaxed/simple;
	bh=WYEOtTpKJKbVcM32oVrlyRCNjAkwiCmSqVpChK7R73M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sd93aG+DLK3TzDcKybqw7HYWvIOlI0UwpmiO5RKOzG8VhhV/xXrLMuZeRcZx+MVp7yohOPdGmMLdA/A4XEBzjKa94EH91d00hTSXq4nkrfQUOdGD31UYFT5BvsVSpkV7k/FX5B9ISHK0uMaLm+SwfzwfKpeBPhTt71E+zPvSIgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEX2PrQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHQmr/Mr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G65F8r2584676
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=; b=CEX2PrQpnsH0GmTT
	DPYwpfXotdf94WuXr9weW7ykDEqYV97/z+IN3jWGhHEZR9N4DZ6k8OSNTXAdxoUj
	ywFNYavlXfakz4FrdBYdZ2CAPJ4kUJ8YkhWyjs6daN/X1Zrz5AwQBg6T8sOPBxrE
	nc8LoM+mJfR1ev0p5Y8adF6y8MiktWyTcSdYVNz8dYysV5l9gLfrCMuDTv/y5ill
	srIEd21eUoaLFWseoqAJNS95KadaEe0T2xdsgta1y7TZJBqx5vbD1kv2gp6bRb50
	oIZ7rUuFnrHDLCpQqFgURkVsiYtnpL60awQ2jzqunzj5dLcMKvo6U6NqMD7LP38+
	/ZgjUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0ecctv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:58:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so36926535ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773651490; x=1774256290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=;
        b=RHQmr/MrGkwHQ+Wd2ciVJw1x3Zg80YcSRpq8o7V4iFz+oOZoEKqlFL3b/URvzO9syo
         3kAUnEvk0CW4n6WPiaxfkdZMu8H06tLpnW7FvSJofMjepfPXlyrpMF0FYG1Yxxn0IU62
         Q45sHHytRBJORC2A1Bn/G6h70rgg46EGX10lQsCQJB8LgW7Oz4XT0178Eto0IiiJdkJT
         fy0ABapIO2ST5qJl9+Cp/kNYuN113oXdA62rxntvIl3dUMAA5uJYP4skJAo+9oA8VLCc
         t8LmBVo4B+NRMKrJ0hyh9Amt5lLHryoz7JDazu66uk56Fv/YWxmYQFyMUIL6pjwRmnTB
         vzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651490; x=1774256290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=;
        b=Zm+zZp5EJb708X1n4PSasMHHARDzIDtniWhqG9hL9MpEnkV5JvftWibQc9nsGARGvt
         JEzFXlFOqD/36joGISFk3AOpBWgs2ZdC816g/d8vy+3Yit3lWpyRmnZQdN0/S+J1YSci
         0w0gP947VNPo0F7ZkFXCpa5/04M/Mz0UmO807FrGGg9sfbiQqGcpatnZ2IokMSQj1vTF
         7CdizyDo2Al9gmrTK7OOf/0j3uhJKI5i+I3DOfHTCNZnbgZ04yA1EyblZ3K3qpNq6Nk9
         L8tnL2CCGpxHGKqZ+2qWVtUgvK6FBEuneYduQQR5teCU1KiJOLdfCcSt11DW8WVnIz5A
         ct3A==
X-Gm-Message-State: AOJu0YzhKN2R/AhpgxlWHUdRjqGn9cKFHptZqJ2azF9G3zu/XYMjixwT
	JJi64ykHgqtURq65JXMwVqLQhsJfQeWQDZpeW7Ku00E3fOYU1rVxp8xOvsDULlnZ4F7IrHdUR9g
	jQqfqT+Xu6/P3jBXcylJBAgtpf4/dRWkyQhTZNY2nAgVFxZ95dRNGcsBUBFKG6im1lxt3
X-Gm-Gg: ATEYQzwsnxaIRcYMdszU6VtY79gf8JWLoAbOYUqMN83fGCSos4dQgr6X3a9f0GK2pd9
	tWNmPPMW23xJplz27Gr4lGv1huaIraiQ8ZUovmTcuBA4HdvMNZzc7iUN+kbmTwih9hv/30kP1Qg
	jPI0fXc4HPqWpKuVbRz0QzqbY619JFqOrOZZGLNbUt9FtOMWFdZgxrG8DFPJgmXRYkYS44LPX3f
	/dAg+Rw61C7v7rP/UjbWGFfauiA0cGs9z/gSnaKGkgwQ9dUCaOxlZL6OTX4zKv0XQniwOgMfBmk
	dFGx3zlDbLh0ekibN4PWO9VCsab2RWaBC1x01Pzyq44zySM5/U/zig4KfrAuTXv5r7dgqpiM9Jc
	HguUrK8WsnmhVAJH3ZtHldPcMXw/RHJP3oDtBH166pLGBdQny/WMRgGYYKBJ/eT/U8A==
X-Received: by 2002:a17:902:b946:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b04f162497mr29870945ad.16.1773651489968;
        Mon, 16 Mar 2026 01:58:09 -0700 (PDT)
X-Received: by 2002:a17:902:b946:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b04f162497mr29870745ad.16.1773651489142;
        Mon, 16 Mar 2026 01:58:09 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8363b4sm100193485ad.76.2026.03.16.01.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:58:08 -0700 (PDT)
Message-ID: <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:28:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OgqYdB-K0S7FFexNvDpUHIlrfW2ZjlfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2OCBTYWx0ZWRfX7EApBhwkxnx1
 MRn9nZ+4kExVB+AFEG1VVRyizkMkyE6GGO3xKv9/+EgUbPMJbIdtqy413e8G6Znaq66G2/A4l9K
 qDtocLe7huc7xXeMKyQVI4uKGBf2y2MkGEir02lfgp5o9dvY6CkFozA0MxY0iJzxLw2KopAC29t
 38KwA+LE6/l3JJfY6py0OR0e0t7lThSZ0zPaE826NvT9U0LV1UQCgjVTngn6ZhXjfdQjj9xlRgS
 +FLBaYb5T2KiuSDkqmeIhYgtbbP6TcaC6vg63FkJsP2EaxZtjpSiNkL4n2PPaCNHNDYNrIF+N2D
 GeD44PZ/syQIXQwGJJQgqEfKvmM3uRcws85QXese+IvVfI9PgSqvkQ/ZkBawuNi73f3UxmihYsh
 ySSs0QsUNUoeXLuAWbNe5eXrdDDdcI16PFQ6HmjQ4VUkHFttq9SIYKtVlOK/pIYVwftubwz74qt
 1CqDHF0Tstf+g/Wm7XA==
X-Proofpoint-ORIG-GUID: OgqYdB-K0S7FFexNvDpUHIlrfW2ZjlfI
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b7c622 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=B7sYG0t6GpuNDl58wUIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97867-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70FD529691E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>> so add a driver for it.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static const char *const Led00_groups[] = {
> odd uppercase


Yeah,  in HW document also only this name has the uppercase. So I just 
left it to align with the HW document. Do you prefer to change it to 
lower case to maintain consistency?


>
>> +	"gpio23",
>> +};
>> +
>> +static const char *const led01_groups[] = {
>> +	"gpio39",
>> +};
>> +
>> +static const char *const led02_groups[] = {
>> +	"gpio6",
>> +};
> What do these 'ledN[012]' functions represent? Are they muxes for
> getting activity/status signals for eth/wlan ports?


Yes, that's right. These LED functions used for the eth/wlan status.


>
> Konrad

