Return-Path: <linux-arm-msm+bounces-86161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76822CD533F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB4213014B4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AB61AAE13;
	Mon, 22 Dec 2025 08:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4Q7tXT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f18vVC6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB1530CDA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393655; cv=none; b=emdtgZw2M6P/iMZeSw633TDnVX5R0y8aLcYSPwZggmGylhPzQ0MBT4eard3LRX3t6roh5JJ4HlSg4ZG7Z7hhj5BQjKyQeFzuIPlIbydshUk3/xh5LkMovicDx+pHZecmDulnIp6kvq7cq6YwwjKulKBJik3jHfVmM5mUeD4Cd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393655; c=relaxed/simple;
	bh=cgoaDWkxfXfW7nzecRjtHI1LpQJ8ATp7YLREMJwrxlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+AQCcZn2uuNM6j2BN55CuQQSSLCSIz3yFt8VsSVGyhR3bCv/R1tmhgbNNwux7eaV/afmD8oTMMIuKTlO8IE1uU2LE5im8oDFuL/HRngxSKbNmfk6ht+nxUarDecgRZCA8Cehgi+kx0O2zMJTIOqq6a+COkAdAB0c65EW0AhWuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4Q7tXT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f18vVC6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7qIeA3955964
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgoaDWkxfXfW7nzecRjtHI1LpQJ8ATp7YLREMJwrxlU=; b=O4Q7tXT3uVXpfogi
	iKuy0Smn8zP06DQLp5ghG1mI4C6FPMmrxNYmNGHke7c1XNHOCpEBMS0LljBaneKL
	QT6zxlJ4/gTAsPyT3CxnForfDDrgJuIT4VnWS+QZ7NJF2U1t7PPM/SFa8JIs3oHe
	Aop+5rlFjuUX6n5/zMLWiaoymPQYCEoINfV5cr0Mf/eSAF4osDgSoR2p0PuSdwhJ
	kFRgc2qyXrSXxrR0IAdXi6bpoPDDWHgxo7GBKFs9YMWXJz8rzF29iO1LPNs+TbPK
	U3umWN2d7MMhhpUUSUy29n4mLBwyu6MUGk1Ktjb2oW6flSFeyYmAMZmhKfQM7doM
	9LPfWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmbxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:54:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c6e05af3bso8090721a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393649; x=1766998449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgoaDWkxfXfW7nzecRjtHI1LpQJ8ATp7YLREMJwrxlU=;
        b=f18vVC6b/JuImq9TL1ARDaIgOzYioX7HBikJYnmV6SYtO4eiGFHpn8T/gqVeTF/yWN
         rD33+H/W7IUYKYypiDp063EqnY38ErpYlPU5ypgqWoMXO098P9LVGQcsKVqo56jEf4me
         RAMx35ao8obzGpXIXGSCwk/V6W+Ll6Hl6IjSnRZWSxp0t10RBOqHPDOY2ahL7yPIBlDA
         vhzoF2OLmiy69Hfk6NbzblvJXOIq7hch+JAZFTa+xpimNOuOMMAZtgkGfq4tjSr4Ni7W
         lredRujf+ewCHPJBBRDVpWmm8XSUA68/AstI8WltDWTnq3c9DLEQj1gcSrRkh5jGImIs
         R6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393649; x=1766998449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgoaDWkxfXfW7nzecRjtHI1LpQJ8ATp7YLREMJwrxlU=;
        b=vCF9eq5UpJ5L0SDtuM9SouV6Hr+ZfI0KOPl4JiJuEGNrDjVdHpJh0s4b/W61oQbGlI
         brdnc/aYf+aIH+Nlzh1CXy32mxk6Ew94RhoPz9DHOCg8L+9NUHtI5QxVeggIskWeBAp8
         OqEWByP4zm+hdCw5WFMylE8jCRI6Ovenxo/YIcA/NMkmm/yUoViw8tkaklF85sRPfjfK
         M4P79UvW9yuvjLyplJlgr+58Hu7/PGgDIo48EX5pITGJ34H1gcEsn2Jlt7wLCwQe4xPn
         4lmjaPDOacXR8V9GR/tw4+6bAQ4ESdJFQQH6mJ3CQo283hYEqPjW+FkHMkJi+LfqvWAQ
         g7iw==
X-Gm-Message-State: AOJu0YwFNy+o4/FkBtQxtHl/0iFtomRS8X7T0BWDIPX7SfxI+YVwLFv0
	R7ZZa/+R7IFWGdHReiFnp85bCIibgURLMwpMDYzy2jfkfBV07NDz3boirC778uiTrkZ7aTCj2Lv
	S1TORD/0XtuTbr/Wilvoztj+g1sJWfcDFzQlJ732n4ZSzbUryo1ashB6h67u1P7AW/QET
X-Gm-Gg: AY/fxX7knh5MSqDx/91bBYj+WJcDAWOvxrl7boyA8XMMwFs+QqXHs0TJlbkActNMJZN
	tDPF28EotRLvQeEBSJyL+DVMpFXN6dGV8wOC85rngva9cbLnCLedj+zoEHbtDS8U07UT4F/y0cB
	IHvMXGGuwjud4Lk5khJbSd5U4FNbbujOvg/I54bcg1OZcta4TtrZxys01F6q9sM+Ho9HqF0jJ5s
	FEMcwQvIfVhrDUdznByOMkLDTQDbdsXHuHnEYD+EM2COrXuYgJBGa9hQdTfHMlgUxVGcmWCSkfp
	uR0AIHsbOULAIhsY1ri27utP9gQ/44K8TmjE3OM3WxYEFC+thFR/b0CRHaxwTXQKsXQiGRRLGVK
	8mzjMqQeBHZt0lLMS9LfUInz+fPwNagwcaC2w8bemzOALc52U3R3b9q2rHCq7u+6U/vQUEIh35g
	xIjYVcO8ISGtHp+in1kwrS/efEU3I=
X-Received: by 2002:a17:90b:3902:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-34e9214b151mr9093968a91.9.1766393648891;
        Mon, 22 Dec 2025 00:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYW/jht8hQ9H2X0IJIfGUYJ2hV/F11tiryEObJTkIS8wlnwJLCJ5gfOXM78S07/h00uZG0Jg==
X-Received: by 2002:a17:90b:3902:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-34e9214b151mr9093953a91.9.1766393648428;
        Mon, 22 Dec 2025 00:54:08 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e92228b64sm9322716a91.10.2025.12.22.00.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 00:54:08 -0800 (PST)
Message-ID: <d300a963-ec79-4f1a-a385-97f1d60897f6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:24:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable Glymur configs for boot
 to shell
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajendra.nayak@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-2-32271f1f685d@oss.qualcomm.com>
 <ee084ec9-31a4-492f-97c7-009dbfd77613@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <ee084ec9-31a4-492f-97c7-009dbfd77613@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69490731 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zKvyQGducjGX7PGqqqsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: uQwD5YBiCUQLTiGBRoHSbqEZQqNPBTy_
X-Proofpoint-GUID: uQwD5YBiCUQLTiGBRoHSbqEZQqNPBTy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OSBTYWx0ZWRfX24q3kb+B0pC0
 s6y9hSbnsJI5OAKmtNu/3Dz5Bf5WFJg1xgK8qgnuCvmL7mrAYzJMLc2nR0nsbMdliygm1gF4/5i
 u8SftefGNN+soP33QqN+/3B1QIxL6MnvfiftgwihUqi5rhoyHsDreiNXToXUOPGcALZuCf7XnSg
 MA9KLWkJKAemhz9M3+5iQaD0rsPr0QKBvDdzIImBT5yuzn2y5p25wj3cGXxOPIDvWX2NoF+wYRg
 oHh7e9oUzBvRJ6fKynjOOlOt657jBZ7Wve6f8wyVeT8qXexCc6aw4eQr60+rrrs3/TUuh4gl8EH
 tXWf1QXPEKoeRGfTahFJt7qWzMw0W7/rRxUSxwiWpCbEk7eBUPWqU7ZaV8LrfWDs6TSoMJpL5Pl
 MvOzApCFxlF4mh0uU4IXGBm5ZEIirTQ9qG4mmsT7r9vV/O+saToMqmRg2/sw/SkPT1B0qMh7LAx
 CmYHIKFJMntRu/aAtig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220079

On 12/19/2025 8:27 PM, Krzysztof Kozlowski wrote:
> On 19/12/2025 15:46, Pankaj Patil wrote:
>> The serial engine must be properly setup before kernel reaches
>> "init",so UART driver and its dependencies needs to be built in.
> Missing spaces before ,
>
>> Enable its dependency clocks,interconnect and pinctrl as built-in
>> to boot Glymur CRD board to UART console with rootfs on nvme storage.
> Nvidia Glymur CRD? Standard comment - you look at kernel and defconfig
> as it only Qualcomm ever existed...
>
> Best regards,
> Krzysztof
Will re-order in next revision

