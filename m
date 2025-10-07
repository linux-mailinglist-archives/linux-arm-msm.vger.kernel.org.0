Return-Path: <linux-arm-msm+bounces-76207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BFBC1742
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D38384E291A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9081DF982;
	Tue,  7 Oct 2025 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItS18Olb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BF92E0405
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759842969; cv=none; b=NHVF6zS243d670GH5AjL4/9WhBdzk+49jde4IWPdC5s9NQT2EJ6r1ldf1Ii+dMEW4KNGiQJ+alS2qCXuCbSYS7aT6ITkkEPjfMVN/lGrZuZtNrtnqI4BekVFC0EYmAByrai3r6l18WtPEjrw/ddbjkVNkBpne5joCTSZMyoHrGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759842969; c=relaxed/simple;
	bh=D3vC0/amDTtK5+1RhDAP72M4Lfvxbv46RZauQGSK73g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwN/ny0Yy+SP1HrTGQSAuFJ8BsICnG9kdHJ6wl6T0M/Mj42VUy4GMiGYsVY8+OB51NRZOJjC+BlNXRnCx1bBnZGMcOBIEqIKs5UWcEYBsdvXSHTv4SltchTNrHApxUwAKix2xjFWyfuANRNENX6N1guGeQwjiESN3qAEyMzvDKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItS18Olb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597B5YRb003547
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lQxVJqZ76V3LXvoCzGS4pSFF/q525kWkrJKuP9Z+Zk=; b=ItS18OlbznN65fqq
	cfEQQlOWFMoXdHypqQLJAEqB0qBtnYAfmguzpdCH4mcp0jWhDGjQOXHQPHwF4nU+
	OXiGpoCRkRiTCKsf01oXGvHkpEit9QMqtlkvutraRCM4CgulpAbHM0mw4VjbNHOu
	xARhJdOK6FkcdtfgeZC5ieGhVYZ1D9rbrr2vVrKDaiDKUEmB10AGk38q6UFOWTzy
	nS37JXHARkg/HceTCQc7t0cUohsapG6LlEgYzpFZcTEyEd1oVyDVfIKHFtYsH0R8
	KpvMqyo2b09tnudgilE1qCNUMKeUSRXg3EIgEfDSzz8q2ZN7O52a3UhySaQO3EI/
	iLC8/w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu79rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:16:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54a99db9dcbso683337e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842965; x=1760447765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lQxVJqZ76V3LXvoCzGS4pSFF/q525kWkrJKuP9Z+Zk=;
        b=doHX7ScSJuMNK2aM2vwhMocS2owFWopknTB0Rr3M/GwApKYsHvWIx/p5ehuxs6bmTL
         V8uT02fqiczzNtTY2B/c2j45jAhYyzVqht/G78cD5yqrBtzl1TaIpzRkwc84C2Ixsn2N
         T6zxDwGROHVLREzl51Xb/afib/QNxYmyQwwdTtQMjRilsi/W0DPMOfEl9ffnHtE0OWaA
         efW2VCkp5OGf3UXlQJDmyfuCMWngIE7zBHoYC69hCiQEM3r18Dz29LuK6qI5/BhRnPBC
         M8mUeqA4UCctka4uATq6nFM4mNLd5WC4h/tkUZk83zDvpNPfb6wEb94jFE6CwkaFG1Ne
         MNgg==
X-Gm-Message-State: AOJu0Yy/r+w9u9g9fAqA0kceDPJkdMyzZTZiBRKYfBQ0HBVdEaGWkWK2
	ZcGe0nogxyRSeIj1gLaZgu3BqHChMD6ZYLFeQoZMwjYoA+V4wNWRnDddLNamQQC8NQGwv3uBrKw
	XzcfayLLYeLuloTLxn9uXktiuk07cjcHGHZYOItamF6qTIQ4Zr+UXgfYK1QBz0GOXaQP2
X-Gm-Gg: ASbGnctjSNLKGiNXJ8D1IyHaepZLmR7rYLDC7Rnf0jaQLTuVOnUGhXw7gaF2sC44Vco
	95vRKLyoGcq54WhLEKRBRE2qNAsuLuZiF0iwpDfY4H179LGJ7YgOBpX6SgaNDJ1Eiu/MpmtP4xn
	WLaN4gbQEdqf/kn4HkMeuPy4gwGTeKKWcRVDqZjDSLxFssyEOcrSOekmiyKRsB3C7rBEKwuVOOl
	JfQwh0y0gwUHSARy2vefk1gEm2KcYVPv09zqCAMagz6zcA2UpuK6wBnjnjtiQH4l2XLpKI7caJj
	h8EN3PfWUGrf8eh+xvpzTzkzJqquwXrJktgrlJ8BrSwoAJBc2s3pc8YtKp6SX0kH0Dpq7f/UhuI
	hp6GWdNnw9HJvtcd0DiPOP54YbIE=
X-Received: by 2002:ac5:c0d0:0:b0:54a:9952:5572 with SMTP id 71dfb90a1353d-5524ea1456cmr1667123e0c.2.1759842965305;
        Tue, 07 Oct 2025 06:16:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCc0SPWEj1jSNBeOVABr/xb0UslG0Djb3P/yBaYz0NGqCuIh1r1LTgML2OmBHUgAZiBZDsQA==
X-Received: by 2002:ac5:c0d0:0:b0:54a:9952:5572 with SMTP id 71dfb90a1353d-5524ea1456cmr1667091e0c.2.1759842964699;
        Tue, 07 Oct 2025 06:16:04 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b30asm1435265166b.59.2025.10.07.06.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:16:03 -0700 (PDT)
Message-ID: <335be224-88b9-4241-9e82-d7c03a4a0ed4@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:16:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pmi8950: Add missing VADC channels
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251004-fix-pmi8950-vadc-v1-0-3143ecab99e9@smankusors.com>
 <20251004-fix-pmi8950-vadc-v1-1-3143ecab99e9@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251004-fix-pmi8950-vadc-v1-1-3143ecab99e9@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r6XWpg3ah8XV80KU2hUH373-iE6D6hjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX9e8xBRyZAPbB
 zXxkuOwkW2/flgPgRZ5crPEqdLwrq86pDs8cYUs9+oTBJLYmqUruFm/ZzcLaJxj0jLPbmJfQAgn
 UMkenxgkgvuEeKBZbDYrDlqPyVkHcdvVu85hK8IzfRH+jq8VKj2sHd+37vfvCM3KlANu4X3Egqo
 Zszua2+VErQQEaKZ27wPHzTW8+NOMTIjzQjv8EQecBx76U5AF8SG1PDED8ejuk2PMlbIazXteGh
 HwoYx4brZFDzWDez9I/pJntQvUjBi68kcjGSipgiasJd+9F07KTyDoc5f15uSe9leb2Q4VdczsO
 cGMMQoX1uM8HiE4bf6i2hcwwWpjZ+j45c43EZd3EWViYdDRlt1fw52gipaGIBT0nucVu4JWb9iL
 r4TuZqMc/Gnw7kUKbCA5YOVehogfDg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e51296 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=-KJxd_0Hb4jBXpvf9vEA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: r6XWpg3ah8XV80KU2hUH373-iE6D6hjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 10/4/25 3:12 PM, Antony Kurniawan Soemardi wrote:
> When booting msm8953-based devices, the following kernel message
> appears:
> [ 13.090800] qcom-spmi-vadc 200f000.spmi:pmic@2:adc@3100: Please define VDD channel
> 
> It turns out the pmi8950 uses same VDD and GND channels as other
> Qualcomm's PMICs, so we can simply copy the channel definition from
> the other Qualcomm's PMIC dtsi.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

