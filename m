Return-Path: <linux-arm-msm+bounces-64795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1EFB03C02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2F5F179FEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 10:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B048244660;
	Mon, 14 Jul 2025 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPJvzfiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A0242D82
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752489510; cv=none; b=AxtbccyfPbsvpBZPsT38i8W9+GBzwmI99QKd7j8HEF3yoSbDjFxCf+/K0Ufj7h9FQaybgV8VQ9o/Lf6D98QnSfBPkecNeLPmYJajDZWoeDrLUCk4Lx+1HF0PosqVdZDf/yunt2YMh/DgJhVkgAs5/vU0BmeDIJVuyp1bb3sZFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752489510; c=relaxed/simple;
	bh=GZ2HGTWvnUJlQg65o+LqMmyqo5eSrqABc5KMQTX++6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n316r35jJTry17c7qR0KNP6t3/SYToYXXLZ8fxU6qK7JeGFNzTBuXHROW7G7DaGTYtJ55MUzUgCZDTmcBTJ3RP+XuZvfbOeKHJHAOFe6uU44zU+dyEoPoTojf4MQ5dTgL6xYaG6OKH6q4M3XK0mDUoKoDeDnXlhHeuhmWJ765og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPJvzfiv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA4qoL032297
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+pEamc9vV5xI2V2tpf5IYZyBkoyhwgtCvGmaF6cxpY=; b=iPJvzfivcslC8vxF
	9HUN3hO3mzFF0ee/o0RcLf+koZZ0vn4aaILSc8EtMtXNLduA35GhRDuQG8oi/7u5
	GtSqOK1iB5MHE3z/HSMtsqrake91ZwyYx94wK3F4DTY6hAt6E5IFQ7ACAmw9sb2X
	zKtdp8Vh9eh64wSe/qX4NBj4l/oUbjUFXcv3/RWi0d8Jb5xyUHGDwd7jmbB2XM+g
	BQ+ebwUaVSa4PxKGYxqTHqNRsII0irpgYgdYZ/b+9wuAsy+CSxYMBNzJKNiHNiBH
	LmxfDj+0nXQbN6NVfhjvjZfqMtT+rwOOY89Rogh/xlLVF405bVjl30MfjVRDrWSc
	9q3GbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbcb72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:38:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dea65840b8so33366885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 03:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752489506; x=1753094306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+pEamc9vV5xI2V2tpf5IYZyBkoyhwgtCvGmaF6cxpY=;
        b=UOdA1JocoiqHx0ASwlGOpIEb8i04fnaQnGF/jZVqDhgP4allIthU7dvEh3u9xfu92u
         ryU5ZQwT2G1hyg9UAf/1hQsXXJDUqqXq7WGEMy5CxAlQ2up9P1xxaiwndA5rILsblt58
         aMPyS+uRxlnpxU547vM8SAK4DP/r7MKmdXMK/7x1S8Maf/8MtFvkGo6MI3m1naSBcmIF
         ZlLlDdPMxQ+kRd8L0NZIW8wVrmDPiXJ40CArpOuUd1HMPUyN25bHoqnPkgdobk2gArfY
         GVhIC8KeUHqmwwPs/K6ZP1PtjD6ktwwK33vznF/D/5DnpxV9UGUhEXRBKEYdaiMCBVe0
         uxiA==
X-Gm-Message-State: AOJu0YwpTtu759fb4fjXuyrKQhp33VU0LCASbAnKyyNQQpe66HYqtcLs
	mTSPRK7U7HbctuPEWlwPapuI6Ndbtvefwzz9+ldMLbD9VmU3i6QH8sncqIiOU+aHoUdjgMVteHM
	dIQkDmVU+xJTrinspijYazXlWLeInuPhtQ94Qr6uLABStB3gnfRmoOY/pN/AH2uVxjoKB
X-Gm-Gg: ASbGnctee/+4Ad2kHAIsPXSr8M9WL7V++OS44nE1sJEs0WbqJ2LQm3HPjVi6ePBvi0l
	6GROB/3w6cUvuzuqdAd2PfcYquW5L/tnPYgmvikkLdQGoY3o6OH608U3VsNJXvP6huLB8+1svWQ
	DAdWKYJgBCE/QVOJZEfhPbHqaMnbXg4qT+uuKwycrFsG110pzfCwFvE9dRqIBRJhWOsQsrxBZHY
	U1yS81Xcqpmrf6JPCnc3agbocHVCp343sKoNV5a9Se8/1KY71wB3WlvpaBRm7NY6YpbaCjsvo61
	XVOQ3zcWdDQo5jM+FDBOryXve6yjzkP36uSROyy3Ap4O/eeqMeJtXlmhDC9Ui5ZNUyOTshEdyEn
	uTwYtRUtbjr1Xyl8wp3rY
X-Received: by 2002:a05:620a:890c:b0:7e1:5c99:28ff with SMTP id af79cd13be357-7e15c993e83mr330822985a.5.1752489506580;
        Mon, 14 Jul 2025 03:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdHimNvkqNJF3cWwL5W/XfGk57FmjaL47RCsELpgNXpxCvIvqKwTIbW2FY0d+dH8dVZxn3QA==
X-Received: by 2002:a05:620a:890c:b0:7e1:5c99:28ff with SMTP id af79cd13be357-7e15c993e83mr330819885a.5.1752489506030;
        Mon, 14 Jul 2025 03:38:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9542fe5sm5779560a12.35.2025.07.14.03.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 03:38:25 -0700 (PDT)
Message-ID: <75cab14e-e57d-4d1f-aaf2-ca75dd37154f@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:38:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] PCI: qcom: Add support for ECAM feature
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250712-ecam_v4-v6-0-d820f912e354@qti.qualcomm.com>
 <20250712-ecam_v4-v6-5-d820f912e354@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250712-ecam_v4-v6-5-d820f912e354@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2MiBTYWx0ZWRfX59LXw6iHRRu5
 nu5yubJRToxYGvD137pG6pytQD47aUMuQ3iB7RPGQg/GYAQkh5yWspvT/LGQ9Znk/+fqnNT+0rJ
 KyMOoNFySOuh+cX2SWJiUtufd84j2xA76Gs3bIbEkLbLtVjNc9llnocel54mpjP0MBbI1cTmxFX
 zaDHLtxl+FozGHcCUrOXZj9gfHtgsojDciSyPdKdvx5Rne+/jW3mdh8bF6e6RwOZnYp3bRQe6LA
 BO3PvGLoZYiLZs7TFJveGo+GLjsT61/BIwdbAnwAC0Yq/f5t6IjTrI/jmKzkPzMe9HaKrL29TlG
 uPONA+EQDXFy1c7GP9GAf6wk7OIx6nYF+CAsGsv5sMuJkOIEkoqsClmbuX8u5zro9qwaPe0ZBC+
 pQOUNs8ThwMOyoCKBwOUPul/wI9PbUvzdpavtHtceG8JoH11zfuEA+zA8+whRGQNgQH039gC
X-Proofpoint-GUID: TEGUBuW3tDsKY4fcnGD5wwmT6jAuKEcv
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874de23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=obKXXINtG9EwW41erPwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TEGUBuW3tDsKY4fcnGD5wwmT6jAuKEcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=710 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140062

On 7/12/25 1:42 AM, Krishna Chaitanya Chundru wrote:
> The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
> gives us the offset from which ELBI starts. So override ELBI with the
> offset from PARF_SLV_DBI_ELBI and cfg win to map these regions.
> 
> On root bus, we have only the root port. Any access other than that
> should not go out of the link and should return all F's. Since the iATU
> is configured for the buses which starts after root bus, block the
> transactions starting from function 1 of the root bus to the end of
> the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
> outside the link through ECAM blocker through PARF registers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +	if (pp->ecam_mode) {
> +		/*
> +		 * Override ELBI in ecam mode, as in ecam mode
> +		 * ELBI moves along with the dbi config space.
> +		 */
> +		offset = readl(pcie->parf + PARF_SLV_DBI_ELBI);

I see that the offset is supposed to take up 12 lower bits with the
remaining ones being reserved. Out of abundance of caution, please
add a #define SLV_DBI_ELBI_ADDR_BASE GENMASK(11, 0) and FIELD_GET it

no concerns apart from that, I think

Konrad

