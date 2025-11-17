Return-Path: <linux-arm-msm+bounces-82025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF8C625E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 004583AD5FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AC830DEB8;
	Mon, 17 Nov 2025 05:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPqgjPXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7Olwj+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151D254841
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356342; cv=none; b=QF83GG0MDnPCo3Aih2AjC2FWthWZNW7g2youmw/iIlZo3/t6Ib9Ka8Xmt5kRXsPYWXv0vBC6XitwBcE5lKZkCBOq5k0xe4BWzvYed4tVG6Dc0C/1ktt37T84UdXN7AIs3W9w2U0EBP0KlRjqmTgvN9a3+FDdbhWLKqH/y733Y5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356342; c=relaxed/simple;
	bh=J8z7X1x3/ScI35iGGWKTEX1fEK0jJHLhUm2IbIlXq94=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aQrdib3rymsda4J3dqSod+7rRMzmH7FkRhxw4jGCLZIoZvpv4hF/rmY3z3SJ0HmWyqftOsB3Pwkq5/+tJNuGfg+258A7vboW5p/a31POqm5LHfnJ3w6RVLzfzttyc2oN9km1biGs9frhY4MsVN0RksHzF5Ooo0vxby9NYB/2wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPqgjPXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7Olwj+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o5lC3189657
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWr9n67dO1c7n4hq7B6wcG0DtGSgKlDPwTUOrm2oxug=; b=RPqgjPXfZp3lwZnp
	QNZw5EePej+GX+myojewUgzoIuDa5IF0bUjp89eEoQjRai2YZ0XgWot8nsINV2kX
	nP2xwKVbH/Jf61qBGjkFMHSK3kaD1ub2kMyR6VlT2LeKoofkBbulOq8gB2qrxl3D
	YpdBW7m1IJt4PYtlHx13MZxjR4Ss4S2h0fhytNfo9rOmUPbezx4yI0KLYU1ePYE3
	uyoJoABjXo3LsDBQrcVZ640lDQSLYh5puNBL9wKo5ZjjMrMjKtPJg5ULpmFGzxO5
	6rSo0MVvkcAiIU5Cfl9XmgsAXOyCTc3rXeDSQySg94EPY9dJ+xgaQPDlgAMw9reF
	VIeJPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkmbdq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:12:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2954d676f9dso31175545ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763356338; x=1763961138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FWr9n67dO1c7n4hq7B6wcG0DtGSgKlDPwTUOrm2oxug=;
        b=Q7Olwj+IwnJQ6oheKc/mBNr4vPQtSMNHxBAcqAUEAB8tF6vR09m1du+tzQEr6ghf1K
         CJD3Wop4AKe3QKEiMEO6608gqtGyIYNdNqXSxMLWJWvMsGLzASsVERwK1CtWmIVu7BqL
         dfd/Kad26BDtZut+GiMmzHzNzybbUfF4fNPmm/y7NNzrnsEImCmgIkpz7wV0Hf0JAO4y
         Zixz86dSTxLb9ACdEWvceepCMN27PiRvkkMG8tZaARz3UyAU+PH9RTUB0MjKwIYnQvSF
         I2gNv4movz1qCAADfpGYe6vNpRUcXKRBDIMaZLGls/4d4UaJ3vJyUpCh7lgar9Oer+yF
         6WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356338; x=1763961138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWr9n67dO1c7n4hq7B6wcG0DtGSgKlDPwTUOrm2oxug=;
        b=gs45NNcfU5iOBJDtRaTmlTqF6jGUs4lecQFFpxZxy9jPp1pJ5EbF5k4bmR9DaW6x26
         2T9eufFtulQRJ94bYHIOTTClr0E0AZ3l2J0G89aTKJ3ZIWqfXJvCRaZP6AQLX+oRHPNi
         n5rMJniklp7YQOm6K+/6tZfOQ9T/askum0QbbIe+fKlV8Nf8vNWszPYPOLoykm/itCk1
         VmxecOh9x2n7SqLzb/KAevZ4S/Tfq+fKjDyXixbNYuwciZq75izF0w3PnX6qeSfnu+5A
         RGlmYT1A3kOh2OYhOlXuqK0YuARIqzRaM7hAiTeXyVPJ+QonqKpZCwvh7/RalwNIZpI7
         4f8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXe3TycprcY9/zzZslbHwZHOmMKwUpl0e2oItvSgPXVKCFbDTgto5LqNT088NF+Kms52nzGShZyh/Yn0ePw@vger.kernel.org
X-Gm-Message-State: AOJu0YwgF8mN6qEfV82vScM38G4U26TRjburyAIBNVEsGuX0qBVarWC8
	t5uZZjK0PtwIhKew1viUx/oj8rqQTiMxe0zmX8kOr7/ct0Dkxyhui+DPIzc5EAYtCLmW2jmrYKE
	HAmBGHe/RDHxKCUKOwt3mP4kpNTebG6NEJUY8KC/Mg3lC5Ks6Co4NEkWKqUHU06j3iO25
X-Gm-Gg: ASbGnctDdmfnNZbvzgHpRe85Hnlr2JHyY69Ji4euuKBi3kGHz09jzO1SfMRKY+VaHzX
	6eemV/sSsAJBu+nqV55A79sPGx7AIkG0lv42jTczpYFfczAsQGC5QIc9cUHkGmsGq75xgU7iFqE
	69K607ciucyLWbxB5uhbFE9J0HBD0r2sxLJY6U9Mb6O6lrV90a5fBZyju3dpfORoDXwGiFJn8P8
	MyWI+jJdxO2NAmc/0ORlkdJQOSVIvph1vARtG6LJrTYQ7RVHUMzPYNCHSf0T0WDigZyJ3PT0yJ4
	Z0GYz4pitrLvna2JgACuU4UrL/AxQfbQBuQzoi3XLISSLvWI/frCtTZzI9mOVlk1vBzEhXbY4fW
	orPhywpS5tIbgdwoo2WObTsu+WEz/62RXXOgLlTsv6RkTra4q7KTFPks2v4hPnomLIvl5
X-Received: by 2002:a17:902:e546:b0:295:9b3a:16b6 with SMTP id d9443c01a7336-2986a752896mr142438595ad.49.1763356338218;
        Sun, 16 Nov 2025 21:12:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkAlkBUSo3LAwVcndFhKY2cG2oUKDb7mcn6f+LmxOgD+wNzYVQ7C4MBdXdViSscfftKCbAVA==
X-Received: by 2002:a17:902:e546:b0:295:9b3a:16b6 with SMTP id d9443c01a7336-2986a752896mr142438315ad.49.1763356337715;
        Sun, 16 Nov 2025 21:12:17 -0800 (PST)
Received: from [10.133.33.145] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b11b4sm124284545ad.73.2025.11.16.21.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 21:12:17 -0800 (PST)
Message-ID: <faa9d74d-63d3-4569-ab36-5e0ee0241794@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:12:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] power: supply: qcom_battmgr: improve charge control
 threshold handling
To: Val Packett <val@packett.cool>, Sebastian Reichel <sre@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012233333.19144-2-val@packett.cool>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20251012233333.19144-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Gey8o12uBYSH8G2RHN6K-P4OxeYXA19g
X-Authority-Analysis: v=2.4 cv=N6ok1m9B c=1 sm=1 tr=0 ts=691aaeb3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8
 a=-rvc63fW53tOKHq7dmUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA0MiBTYWx0ZWRfX+aOxZFMFSmTr
 4H9pQLo97kzBg02iWj60ZPbIvPqDhQrbIciTt9aJUaa5IDL+O39BlzBGPQi9Tbv8pI+hkkenqe/
 4wP4moWCWbWvJtxtzGnzup9utLV6wVsP+P2EphEMjaIKu94o3o9mO/Dc1PAXans1NBIaZDqyAL1
 c4/xJHfIwonDMjN9VIDx90NM+3PWSvNdNl57UqrrNkA4e9T+JvYtmcvt2+JL3XBC3Z97eHr4Cre
 WHWQOs6S5A26P0yraYuofEvtPOhbZkPZXHni0Ybz4DdS+4fv8KRM8CdQE37pNZ83O5+nY49KAOU
 P2DZxTY7vsaRryP1Roz+w2vR8iTo8DlPKhX0/OWe94sKlrluXQFdrqOcOguYj92BywPgitS0Rys
 9/UllteInI/2DZwiaAtWQg1YOb9zXA==
X-Proofpoint-GUID: Gey8o12uBYSH8G2RHN6K-P4OxeYXA19g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170042


On 10/13/2025 7:32 AM, Val Packett wrote:
> Currently, upowerd is unable to turn off the battery preservation mode[1]
> on Qualcomm laptops, because it does that by setting the start threshold to
> zero and the driver returns an error:
>
> pmic_glink.power-supply.0: charge control start threshold exceed range: [50 - 95]
>
> Kernel documentation says the end threshold must be clamped[2] but does
> not say anything about the start threshold.
>
> In this proposal I've special-cased start==0 to actually disable the
> functionality via the enable bit, and otherwise made both start and
> end thresholds be clamped to the acceptable range. Hopefully that's
> fine?
It is fine to clamping the threshold to the acceptable range. Thank you 
for making the changes.
> Or should the [1 - 49] range for start actually be rejected?
The minimum charging start threshold was set to 50 to improve user 
experience. If the threshold is too low and the system keeps drawing 
power from the battery frequently due to a large system load and a weak 
charger, the laptop will only begin charging when the battery level 
falls below that threshold. If the user disconnects the charger at that 
time, then the device would be only having a battery below 50%. Setting 
the threshold at 50 ensures the battery always stays above 50%.
> [1]: https://gitlab.freedesktop.org/upower/upower/-/issues/327
> [2]: https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-power
>
> Thanks,
> ~val
>
> Val Packett (2):
>    power: supply: qcom_battmgr: clamp charge control thresholds
>    power: supply: qcom_battmgr: support disabling charge control
>
>   drivers/power/supply/qcom_battmgr.c | 26 ++++++++++----------------
>   1 file changed, 10 insertions(+), 16 deletions(-)
>

