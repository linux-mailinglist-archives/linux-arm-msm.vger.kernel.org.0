Return-Path: <linux-arm-msm+bounces-78004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D9412BF12E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E82F34C221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE41E30FC35;
	Mon, 20 Oct 2025 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUMiDsvs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279B2F83DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963400; cv=none; b=FtqViF4NjcVMQeE2xK3szJBdQQ/IZnUGl8pjSwIhyMnEPLoliDjXhK4MOS7frckPxePCHrRfSVH6BKmvhyRQZR9vcyjaLmMrSO6gaGrHHaxic7IFvtaqA1IrRkRaZGdCfwAhvzuSbccdxJJfFV++KkXPHHZBG0zvtVLc+GSZnLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963400; c=relaxed/simple;
	bh=kY5bwD/tin8m/07pjzzS8+MlMr6Emf//C8kVMc1Wo9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lisoB1RqQTh+UvfvXeLvZXj88ESZDtKqNW+/j/PMzedVnMYXORR/BTj119YJWQ835CyXr8TR/e//2X+9bGOHlwLzytc9XrBSIdjEHJEAnT+xGckiom1ldupvx4caFH3ns5zo6IUH9CreDEoiESyySptG1G8QsrNM7MAGFlrnOcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUMiDsvs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KAPSui017483
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7cbAVS4lpZ6y0VRAxwtzCg6TdsTtz80a5PJ9G9SBSQ=; b=MUMiDsvsE2UXqS7W
	yZr2DB1p+cbEdkt60KZkhWxmpokYEh0tHEz9eyDagjqQFk4lUV/himQoBqh6+PxR
	D89/uTMapz3H5g7c6EgBLJwR+CHTBIQi0B4O334JZoN8vcZF+EGFaJVGacuomRbv
	fgXphJO4cIw28hTpwVcj6nS1XCvbvi2za9wX9p9N4l1PQtnyYeIc6xx9xy3mOLAy
	k2R9qRQVdnPy24VkYNcb6wPfqH8HSKVWF5rUVTBnRZ44Pa0kK2u5mQweNSf4J5TM
	PLUqGbJ6bMkW9LyrvV9EMg2sfZ8kfh7YH6DPphiY/M+vJoc3K2MyYicVb+zTn63O
	XfAMuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v0kfcymg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:29:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-890921c382eso126590185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760963397; x=1761568197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7cbAVS4lpZ6y0VRAxwtzCg6TdsTtz80a5PJ9G9SBSQ=;
        b=ae4lvjLQT6K/K0v8HrqIJxRRkSagMZUTVG7hCnROoskL6es4w/yXuelVtefACbLd2w
         2Ym7tfa0T+Z/irnI/gDOsaZmNHZS1Enhb6d5VkbdERzo0fb+qmec1wP0/Cmcj5coLBgJ
         bdPBRBbOSjYwa98RKwW+PWYpC3YRzkTH9ZElO1aLorfEand1JZ6bBj9laWs+DIhqcdNo
         3K+Zd1qr6LXURpiimUcA+jGSqsl7oh0sNwKeb1HoowAT941PKH64ZUxDA9f7WaxepX8S
         EOZmF82IwRKO9M8XRpSMGBUVt+x+CmvO2maJjfPZ+1/LV1dUoQdcJy8PpKtg/l65VVp9
         XGSw==
X-Gm-Message-State: AOJu0Yyg0AjEyM+tz/OM06hExgS4DNuqVinnRcOBEmhroXhrDyDAS9Jp
	bJGnepJmEVJ9MMrVbAaC4cCJIeF/wmRaaaVVkLbEmNTVsy+flotZj0dAgQelfkTlyjfOdbgLaBd
	9x02p+gHqd3rSJS/iP+jBmrpWeH9nD593R4Xp6adBJxwL/Vg2Fmjz1UdPolXxOA2gsGsJ
X-Gm-Gg: ASbGncuJ+AR4OLSHWC1wZpC1YgOFNwUHbxvTsiaLFU1wh0u7wd5wbU3MsXN8roYQreJ
	m7pKwT1t5mFzllBPqnPCKEqS1vjqw8On/XCzIsYpoi/jre3EcS6SNKrQtD7AN5G6OyT3VJFSBGI
	hYP1KGzqxYm+fFu771+f7oBL4QYtETcPBbv8x8tIfVR+J8ikLPo8vC7ODtIUnLNxArHSPVVWPtA
	A0E9IOfseEpglwLgLZD84ohw/9iRCtr72zvagh5+p0pn89GdfYn7BAuNEgKC7FNVnqGCYSdjiKd
	zm0wl7Y3FmViV85oJuirjGU3URv63BGoyQNAHiEiwD26pB/QByaz7MjFO41JW8E/M5ThJGm2kdB
	S0ivsC46TcvVJ9zOBqWj0J75Yc4pi7sYLTERtb1lmVUoSA7j+tlbRXdRW
X-Received: by 2002:ac8:6210:0:b0:4e8:959e:440e with SMTP id d75a77b69052e-4e89d35aecfmr80596931cf.10.1760963397473;
        Mon, 20 Oct 2025 05:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNR/XkjXBAoi3RveOS5rUu44E6/AP4/g0pKZRGBESs7vUDC7aVr4PCy8sCjlDaEHLvbU971Q==
X-Received: by 2002:ac8:6210:0:b0:4e8:959e:440e with SMTP id d75a77b69052e-4e89d35aecfmr80596751cf.10.1760963396955;
        Mon, 20 Oct 2025 05:29:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm771820366b.40.2025.10.20.05.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:29:56 -0700 (PDT)
Message-ID: <8e957768-f03d-4204-8eab-e3f8ba3bebad@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Drop address
 and size cells from panel
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251020-shift6mq-dt-v2-1-d8fc3ec71281@sigxcpu.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251020-shift6mq-dt-v2-1-d8fc3ec71281@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E6LAZKdl c=1 sm=1 tr=0 ts=68f62b46 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=JIWnkRdvRZ92eSO0A0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-ORIG-GUID: 9RZr0091X0EUQWq1eS7SjwRHRt_1VAyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMiBTYWx0ZWRfX9zRnmneyHDZC
 afuaAKuY45oLwHw+6jpFFbX3sFHNAuYFasgdVsoWoWPq6lUkkURu0nGHBDoph5Hp8Vmcx8ZFvJe
 pTtTZeBzOchLrRS21W0dSpWDAse0viWwSEVfuVxjxJJX/OAtuurEeoTweLpAaOlUdr2ATBQcKXH
 qEOJVEVtarxTlnkjE+FyORSUU32OYWZTux/xypW7uoHERrmEbX+2b1UpfChqXZOOQSYZ0ZwEByw
 Gj2Xm+9B6aMOUlC8LvC3FBerrOySkwsfyoETmu6pEqqnPzMB5XB3tEd/kzaaulBxukwxprkVdRo
 KM17pUZZt/jzB/gkWXWasPTy8bdUbMVLc3MilVBqrd3H1sW6InaesED+SEHX4dCD2rxmwYrxaTm
 EPqqoICRRMy7e2N+23D5/AYme7bvrA==
X-Proofpoint-GUID: 9RZr0091X0EUQWq1eS7SjwRHRt_1VAyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180002

On 10/20/25 1:58 PM, Guido Günther wrote:
> They're set in the parent to describe the panel's reg property already.
> 
> Fixes the
> 
> linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> warning.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

