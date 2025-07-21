Return-Path: <linux-arm-msm+bounces-65925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AACB0C84F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E00B545675
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 15:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030492E03FD;
	Mon, 21 Jul 2025 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoXhyD+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186442DEA79
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113486; cv=none; b=e0ZRMYC5lUdEB8I71q5phIgRah3yPUf3Z8Nohb2onmGjznykLKdfhUONIVUzwGvP0t6Slxcl61JJMLMr6VpS6PqbmOf3Zh6dI2ndp3YUNsxa1bx+znqQ22inrJbBOD/mjRZAxHo7h2NvucWF6hdnfmpGXIq16G/SJ8NLmeau5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113486; c=relaxed/simple;
	bh=Aeb+cBaDP6mCJ/kvpMM3pvMOYo5DtWUCf8qOisApiNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzNN1/HNKlWtZVCzUbE8Gx48pcMHfr0lK1RcnUiMhWQ87n5Cl3F7POZ/pr4KKa73KMcVa1ReYiGg7rQhP760+XNnpydsaiT1TsAe2nlIwzBZwzr8sDtK5wjeZBigo95RfAmtSEHnkciVe/37FXrKywcXMszDfXj/TCJ/Wu+KK4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoXhyD+Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L9pAMF016582
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 15:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eaykh2jpr4tDzQ/ml8eASCLk5tz1CCA/grPwuJlCtA=; b=GoXhyD+Qx6sZ84f5
	Lw9+R7ToqBXi7jfqR+wvz34jza0wQeaCbxhOP36MJNguhVMXL5LymKf9pLVjeR6/
	/csboVapjS5vGcrZ63JRIA0EeuTNuLM5rdUA6kw2hA1eYMEdrUunMSFtxkacgLnr
	TaEEXoguHDC7Dc+GUcFnb7NEmhfFYxaiXzdLp4a6uRXLGPat0uqdYV509Tvm0VQH
	fgRlrUs6+Lj6mrt6aBXml2tAAMEykShAi7Jw1bT3fkV94eHfxAPv0pqbIlUIw5Yz
	FLqIS9Y/Knt5/TBTOeAMEiCxIWvHtJ1rib1DWX3iSseOPWDJpUYYO4r/t/uiMeuJ
	QyPHqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rx3f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 15:58:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23692793178so36899185ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 08:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113483; x=1753718283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eaykh2jpr4tDzQ/ml8eASCLk5tz1CCA/grPwuJlCtA=;
        b=sVo5xLv7a5kQnbCutUSvAI0J/WsOY7Goqtt9U0yOj+7l218V1w1HFQGhFNfXtlLlg4
         3iXlIgZ1VPaW0KBVpH5Md2gm6H6539Ue9yhsH9SUgC5us9wz4IYRmkQQaH3ywvQFnqH3
         FCYm0IV8BdH9DR2WJlUU8HIX42lBha5j5Dc5NOPy3ozG7Ir6+0UWvzrG36Uuje8f4BPa
         7pnBgZo+X5GNo/XrsQTI/LKIJAywCUiHC6S1XR7U3evbr/SlFQir03bLEPLNd+DRC7vx
         lGjsV0kS4kUNf1hJx6BF9rIF+YClVuidT1ZWqaRwncSfe24RwNOpW0zHMkLraQhR6q/0
         xb5w==
X-Gm-Message-State: AOJu0YzSaJWU63lIRREoZMBQn6Ofcf+hBQjrxHXecy9+ua5YqxkOC6G1
	HlxI2OgNCGJ0RDm8yoLF0dTJBaBHyS7O7NT0yXSmsDnG877NLunRw+YIvL/6ZfWmZMSfaRlviSM
	ag1ekemtHM4LxtHv0jBjpxi9lyQhpVxPYNB/9MQ4Ps/SfLLdmdrxNuQyTXBBzyjStjyPD
X-Gm-Gg: ASbGncuMwZDbXE3vDxVPRQJ3ohcIlR3H4ATFO3WOvqignFHdNmmKKIAW9ukQ/osfvNU
	ZBW9l1mS9DxPfai2fgA/dmLl48yFpz2ilUSlXbJhm3A3maBH6NlwTiTOlEjjavLk6bofjb4Sw5U
	Q+VAUl5xSo///cDnrVZs8Gw7m5p4L857B8VYq0qjBnRc7RiEqIRP6It99t302Suu9UfyKO1jAHQ
	FDYFF5DAIkDD8HNWcDdzijkrRWmw7ueNnGi/qG6MReekbmZk8XajAlwpVwYCQWD07g4cL6l6H7O
	2YHYkQyH84koUjr5hV3ESos/wxc/pbxaAg+HJHFXn/oyVDqla0oHphcI3FFHtLEFZkEuVofiO74
	1/lc8gnLiQVP3Rz+EKUeUqY2GkuFOUFVZFh5Jrj7JQrefxqPkf/X9
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr209498205ad.44.1753113482589;
        Mon, 21 Jul 2025 08:58:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfxVD4xFyUDm77aId4Mxba2CamnraZ59KFcCKOXsR0AXPmtHwmcTsp614S8u5McuJQ6G4ayg==
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr209497835ad.44.1753113482146;
        Mon, 21 Jul 2025 08:58:02 -0700 (PDT)
Received: from [10.50.52.170] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6eeb9csm59786515ad.186.2025.07.21.08.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:58:01 -0700 (PDT)
Message-ID: <32facbb3-3cdb-42dc-9e65-3daa0b3899a8@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 21:27:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
 <20250721143037.20983-3-pankaj.patil@oss.qualcomm.com>
 <21c75060-eb8b-45f8-bddb-816fce787240@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <21c75060-eb8b-45f8-bddb-816fce787240@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0MSBTYWx0ZWRfX1zqfQWVzqmbB
 x0H15QQ7Uu09UdSotkltY9t6gLJp+HS9PBhKdC7mVrF4RR204DYQPRlawY2pl8dkan3VMNb+1M5
 7HjNpnF+LZtvwpHzCc+zCk5mTnC34gganJIdpQXeY5BeHZtWO+jwMCqpixDXD5dzwGCmNL0xU47
 eOKNBYszDPTB0vCpj9Bni4LyYKeMrhBVE3h1POcwxiewpa2wGvzD9U25Tuc9QJ42pFiPnS5dZZ2
 51BZttFPPf1AsuLtJTcX+rgm/aDY+ML+SvnfMTT6b4aixUe/d0rNTZoKsiXcoCJrE/6E/TrlZ4D
 qNjMAgF5qOlhNFI7iWBOkir1Bm2Ja1RlCDYWVg52rgVu/SCN2+3RWHpompIcgGYrOQzk5GqfACY
 IVZrBS/NHHTGNFSKl9gPMktjqRcMrSzTwrooZNdZcKbiKK8DVLPabFHOXV55BcVpaQNhmVJ9
X-Proofpoint-ORIG-GUID: JxmCfo2gua3OyD1-OWNPt4H5tfpp2lhu
X-Proofpoint-GUID: JxmCfo2gua3OyD1-OWNPt4H5tfpp2lhu
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687e638b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TZC3DJ3nR-gMiTPXGEMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210141

On 7/21/2025 8:21 PM, Konrad Dybcio wrote:
> On 7/21/25 4:30 PM, Pankaj Patil wrote:
>> Add TLMM pinctrl driver to support pin configuration with pinctrl
>> framework for Glymur SoC.
>> ---
>> Changes in v2:
>> UFS_RESET macro updated
>> Removed obsolete comment for msm_pingroup glymur_groups
>> Update gpio count in glymur_tlmm struct via .ngpio
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> As Krzysztof pointed out, your s-o-b is not part of the commit message
> (include blurbs under the --- line, which Git will ignore)
>
> [...]
>
>> +static const struct of_device_id glymur_tlmm_of_match[] = {
>> +	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
>> +	{},
> Nit: "{ }"
>
> (no comma, as this is the sentinel and we most definitely don't want
> the list to grow beyond it)
>
> Konrad
Fixing the review comments in v3,
Formatting issues in my setup, will take care of s-o-b in v3.
Thanks

