Return-Path: <linux-arm-msm+bounces-68759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229AAB225F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74A047AB9C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBB92E9ED8;
	Tue, 12 Aug 2025 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/0OW9j8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E12EA162
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998490; cv=none; b=RiyKHP89AkioPyroXnoZoPTa+aiHg5HkO5pFnNFYfVrhmiYe2X/RMw5QnRt3wBtwT5rbktf6ngBmFSSleGso6hCAaDGr/riLqe7RV1ZwZ6gimXwhOkIUhjdOQ7N+rSXUEBPJj/WxeaXS1echCbmm3kQup09kqCqzmLX2007HVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998490; c=relaxed/simple;
	bh=l6AqCHJZBSuWqDTHRUXKjCevAPLUlPN/JFFEsQsXJQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFya5EmlkOCbD3sUL4EqhIgOED0jZ1GkN0NbDPYemohpZHKe+LmLrCpJirMs8b7zOOn0BcgNp5D+tsFKDgON7RtU2V1uSNGZvOE9vbXBhq3NB1mruR3YygvbwmM9aTG7h53TncvjvMltJy90JiQiKSRFFNYOwv/8/LWRv15Hg28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/0OW9j8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvam6002359
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7EwvYjw7Dpgat/rbwEy3MVniY54/bim139PINd6hgo=; b=g/0OW9j8WJ5IumSw
	7QkgsIlkhtHhcPfhmUEOXMrL4kWrwMkjX0nd/FK0HrklOEmqbQJOdjkBncl6YEff
	I2GSZw4nxlCNC7iBtng2mG6iHFhvfTYaScWbU36zyC37L8GB2iXGPz197/YQSoDh
	ABWsHkWpJ4F1kF3DEkz23p/piV9T+4b29XzeSWbxO3VPfJQjZP1Ru8mYVivDspys
	q9tlW1cQJyMzd/T0CJsnsJF4Jv87CDQrmLdM8hFM2E4pHdtde0CsWvEvV5SNNSBt
	vzlGwjzdB25H8Ous0+KsQqMWa1zfQZkqIWv0IMEr+WxhLG469C9aZzkzSfpqdPQ9
	CliSow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj47xyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:34:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7092ee7f3cfso14016676d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754998487; x=1755603287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7EwvYjw7Dpgat/rbwEy3MVniY54/bim139PINd6hgo=;
        b=qVsWcLfChxiDF3C5XW2CSMjKGlt1iwyQGneLqd96Qa9FxN3dzYacFxnzwWFnHNcVVz
         AeMTjS6b58Pnrjv444qHL6aoV/M0/besyQcEF/3EvgrDffv8oESo7nVt9pZurDCbYY/B
         QSgutyzRGo+AHbXYuEBnJ9zN1D1OWPShuIL/KHsuKV/KWm1T+XUyVgmBSK9nKohF1Rrs
         D4638GHPxz7LfNRsVoWq96IOUd04ABKalCe9nx/GfH02PbrPHVLQrU3blal5+uIMamGC
         lCXXVjgk79ZXlkrmP+spxfwxjy3Hel0iU8oaUfcmvnyOeTAhQil5+6MeyJRVpFAv85LQ
         KM8w==
X-Gm-Message-State: AOJu0YyDbpkHCthPVnnNAb2/Len1StX3cHDGDdiYbZyhMK2PB7fSdWXj
	ImPEA2WVbGocYyIUbCvEDJTZwYrKwBw/CFpov//bQvd+ldaE03FfC3eZ+mfO4Kt+DEtZLboX/Tz
	nXQrThK52JY4ZrpWoo/H5BKX/6bDLQTOfDI/aWQkMHkNnwQq7tZW2wVmjVXc6Sk+Ib1p3
X-Gm-Gg: ASbGncsgIzTMOJJIx0Z/I5mQcwtDXpQ/JEPLHp2HWaTuZmnmev0X0W5SHP8wqSEmSHF
	FYUsoFzw6PQ6N0IfoeG93QgzJkUQUKsLQH/1atL1VDyPsrANuDpziaTZ1Hr0hk/ANPuzY54OLz3
	HnEZzmDIgYWvBKXDqMXluhyKmI/Uoefy5Z5TOz7E4XeHHhnHEhLOUPBhK1FLpNO6IJCEsl+064A
	d8k5AgiKn4HbGuMOzKRnXChubG5v1BD8kkS97mCARUUuzQ0khtT6q2QNhcCnxz6fAASC9WWS13X
	1xkC2dg73WBp/Q8MyPCF979ddq0VAuZGSEvCfM2Hb7+8t8t4/+EnJLbnPW/UoPuvKyxUZtNy7jS
	c2JtDT/bG8YsEZ+Ri8A==
X-Received: by 2002:a05:6214:20c3:b0:707:78ee:a179 with SMTP id 6a1803df08f44-709e269c1afmr4198886d6.7.1754998487468;
        Tue, 12 Aug 2025 04:34:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzDvAWuO2IQGQEI/z13SjmiVl51pWaN2v/9l3OeXHvu274wGmTIjjFgvx0MxKANWmQJcS/Zw==
X-Received: by 2002:a05:6214:20c3:b0:707:78ee:a179 with SMTP id 6a1803df08f44-709e269c1afmr4198696d6.7.1754998487036;
        Tue, 12 Aug 2025 04:34:47 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffa3adsm19991188a12.50.2025.08.12.04.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 04:34:46 -0700 (PDT)
Message-ID: <8d5eb27e-e299-4fd9-a591-2d90f4693838@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 13:34:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Describe the first PCIe
 controller and PHY
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250811-sc7280-pcie0-v1-1-6093e5b208f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-pcie0-v1-1-6093e5b208f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX654xcFyzqf12
 TrwODaug/n8Or6BMsv7P4XyuJnU8xxMaiHYnDpD7SrPmwNBKerouEEYLLZESwprS9DoRoXD9Drx
 O5nAqhVA4DseSacy2S60YeMSmjyq8sS6alr6Y7HrJn+sSONPofdoVM0N71Az7ba3xNz7BHblvFc
 SEH8v2sFVtNc5KFtNCyC7HCW7fNxgLN2ELf1Kf+cIGvzkT9r/nDEn5gTY1akee4CIrA1rhmN+a6
 3odU5TsCW27t+R6w6+S+jvJ87fsr1oMsM4jnFrSv2yKzzeYga1xpHmgFX0FKl4VXlfjKfdMQ/ow
 jOYv7Z8qa//09ZWPslwkfFOE+UCaBokVhGB8YZou/I3cwXAr0vex2A3QoTmLkadmkPEIc8R4FEE
 fjAkQFW/
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689b26d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KrzbkVIKgyrcCw90480A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: GIjcwu-9oS2WDZwhvN9fPFxmwHktIGzY
X-Proofpoint-GUID: GIjcwu-9oS2WDZwhvN9fPFxmwHktIGzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On 8/12/25 5:16 AM, Bjorn Andersson wrote:
> Only one PCIe controller has been described so far, but the SC7280 has
> two controllers/phys. Describe the second one as well.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +		pcie0_phy: phy@1c06000 {
> +			compatible = "qcom,sm8250-qmp-gen3x1-pcie-phy";

:(

BTW I noticed that Krishna also tackled the same issue just yesterday
on the internal mailing list.. would you prefer him to take it, or do
you want me to review this patch instead?

Konrad

