Return-Path: <linux-arm-msm+bounces-84691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA03CADBE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 17:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29FB6300C0D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 16:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A766A2E6CAA;
	Mon,  8 Dec 2025 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaRRCjzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U26PHY+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D461E832A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211053; cv=none; b=Q9Q/DkZ+Ac3e/07xeCTQQb22OkDpJfG7Alb+DEG6e711WSvKYZ8DPtOxuG3LNj9aiOJgaX3adFim9EPndBtBW5zBPp+Ba5/vyRPGksr0x/DyZ298bS6t7+8YfQUi0U/OmlJIBY7BV8djwByXwutUIAFiveCqsn7Re4YXTPNogwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211053; c=relaxed/simple;
	bh=33+Peg5HYkGZKq0mvxPaKBI6bc8EUzKOfFGlWR/VMPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LU9bSX4DqqjYrMV6yZM30rGo9uIwYpcN9ZhLNpHKAGDjCL6f/QBJiKRSCsX0A47sKfgTjgAEyVcqqgc5eCDx7ZJmrxb4m+zj04pXfpicWw1FdKMScpi2o+3LcpCkMkKZMu3p1uclTicuIDvGkZpEJJi21Uu3l8KzTL3r1RtN5vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaRRCjzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U26PHY+Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8ChZQ2850717
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 16:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7vR9Q3VG97elLPquMgn5NqLeMYBwAyjYuoWbAtipQ4=; b=PaRRCjztjG9AC94f
	qa8K3Yglh/bmlNpo/k1xRoOQPEAU3VjUVMHxD2FD7I+Fuh7AgW/BT0ynoyjQUccY
	Ri2ldg/Yz+C440NEL5UZZHgg99+Rn4nKoSii7RSTwVcSq5wdlZr+xHHvj5egwczq
	vjIVT6Muap0LnsIoKan2o3gj3reKQTI8v8bcXQ6VO7ymNzdDF8ApoItG89NJi0uD
	V6jOmekGhPr2RL3nM8mYSMwQRrSJ1WCtbCdno2wtdi3ZB/W07sX/XuZMdAbaODCJ
	LavCjY5i9AlPZ6Dk6X9RiPE5JDxRhUBJZBW31dabiKJR0tdzmm9TtKZA8DKZfH0/
	3q2wFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awxxc0n14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 16:24:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f020ce145cso5525821cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 08:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765211050; x=1765815850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7vR9Q3VG97elLPquMgn5NqLeMYBwAyjYuoWbAtipQ4=;
        b=U26PHY+ZniaWoL7cyG7x+kA8Fy4W5aUk5riIRAugb/u3oYL62KW9qxrU4DJOegGmji
         HpM1VXtjAxewP2/EU/en6g1zM/Lzx7rIwZsMNRJcb4f3p1a1onmWgEyRpD4r6+VD2Q9q
         WpNYNt5u72SdHFJcIpCgusyrxMH7PYYrDCRBufxK4AZqlr/52e9mPk0RfR6UoEieRW5k
         miWcsX4PpiVYfy8JbzuYokbBf4vVE9Oos9x+F8R+3GcO3vNsh0OzYOBUfH0YRas5NLsV
         OKmBstCsKUrskNF7teP035OY4Wjwl2MtU9VcJbwyuwBbWU4WWO85dr04fJYJpPIC/WIM
         z22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211050; x=1765815850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7vR9Q3VG97elLPquMgn5NqLeMYBwAyjYuoWbAtipQ4=;
        b=W7OFacjV11mN7re6nmOjd7mDWso2xmIpakAZZYIW1ak6uoNBqGtxm/42d8efshbC/z
         nx0NUN9QaGTgPTqVPvZTjJwckMQEUuDRFs/GDpObW+qsYq5+abXQ0KtyQVgLYx6hpfko
         M/LdFnvapgrKcztZ7VxqzeSoFrSJDOmscnu3ZRUcsQ3blmZJLNmHz/8bGpoL0a7+7KuS
         WqKfiwo7thOFCDQM+HoGblhxs6Kg0Rm3C2pyVP57xrkEhJbX0j51su85q5Be/fThO4x7
         yqjelDrEgw5FsyOYGwFPGvZ/OzGH6R6+K0m8uZ9RzzkPx2nOIvcEpmrtbq4S6VhWRY9q
         fqcQ==
X-Gm-Message-State: AOJu0Yy5HDXJo61GAGoYq+uq3DYy/MVkgxHXtPaEgd3W2yr/DsrBCy71
	zVr18s0VjIdBaWuSPJqK+7EPIGhBUoe92+xi/jp/dkeiwXCDb1YMcw1Vbc9hkC7n7HJhUSSOS9x
	/HBdCZq8ogf+KM7TZU+Z+awWmAk8GJ3eIbvGOLSwF7ZRfWpKR8/H0ZF8Xi2BCJqvo/lV/
X-Gm-Gg: ASbGncudhiK69DuEojL+FZZbKC3W83Swn8s04e15fd6cYZ92Fm43MOUaASOm5KRhxxz
	rq8uaB/PEpeAcXveFf5lV+tapEcuuI5SE2C8kfUICkM6Yk1JLfRTAaftTVyX1QN9H30Kf05cFXH
	XnlEMA3Umgm7UWJHfDwLPpup54BZL4W9O3JwcNXdApbAjKKOZ2GkciM+sAEvNFwKXDAG2vnVAQO
	/kiuW5rev+p5kVzUvntSAFMKkwLUCAOKhAT/i3/f1IrUWDjaYQElRiX4PzFjOLHUpQfits4tXiz
	lhzQ9SY9O45F76mTIYSEB5a0vMy2myDMlgvq1X+XhsOW5FQ4xJl09EKvPn092VxppN3jEc0QHAY
	swSo0BTCeEjCYvaD0meoFjZmTr2tIM4bxT2vvWh2Y6PBTUEBtLEauG1qc56i9lD3wfQ==
X-Received: by 2002:a05:622a:509:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f03fe01b6amr90347851cf.4.1765211050345;
        Mon, 08 Dec 2025 08:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7oZhoUx9vxYjx6MTxnmBU3LLDz+KUMXYPKZ8dlUqDEUKzmEhB0kjb3tTUAdsYXnVJIXmmGQ==
X-Received: by 2002:a05:622a:509:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f03fe01b6amr90347431cf.4.1765211049843;
        Mon, 08 Dec 2025 08:24:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm11405525a12.5.2025.12.08.08.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:24:08 -0800 (PST)
Message-ID: <de915480-4aa3-418f-8b5e-198b15db7592@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 17:24:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator
 support for Type-A ports
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UhfVOrY1diIuh41qEepQZXJLZrber1mH
X-Proofpoint-ORIG-GUID: UhfVOrY1diIuh41qEepQZXJLZrber1mH
X-Authority-Analysis: v=2.4 cv=AKf9OaRj c=1 sm=1 tr=0 ts=6936fbaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VfrTVM5IFoUUBtdl8jsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEzOCBTYWx0ZWRfX3qcYze5lTh64
 zvlrHC9K6xoZHNu1oKegE8Y6L5559zwPn6eA/nD2HdurwRvPcsQWBlQTqrQEcRRzqo1YbvYLBNj
 XDfhDBNhTS6mqDuVIfiD83SiET3WJEaKH4dmZ3JRFKJzKv1dr1FFT6eWvFLNpjYLR0KUVO5w1RG
 Sl0u/ezUrKtx96fpkfRKRCPMHQyXohS4hKxNUGcC+4W5FElKZ8ZB9WRorgfYyAX8FoTxwzm85lL
 hyB5IS8/pZIAche/305FEcSIku0NAZJPMbtMArlyqshUW2vH9Gok1cRlpB/jKD/N2yYEb3l+xG6
 FwxHyzXE7bNYF8tT5xsthT9GCNzJeOO6IJmcZpLoB9/X64stt+vR5CxS2iEMYsUaR9+c7d//KB9
 Y/CS8NETOLdIRvp0uxKUQET+/X/5DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080138

On 12/8/25 9:51 AM, Krishna Kurapati wrote:
> The Multiport controller on Hamoa EVK platform is connected to Two Type-A
> ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
> regulator, controlled from PMIC GPIOs.
> 
> Add the necessary regulators and GPIO configuration to power these.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

