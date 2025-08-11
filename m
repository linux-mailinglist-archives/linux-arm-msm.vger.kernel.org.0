Return-Path: <linux-arm-msm+bounces-68325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAEB205C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E77842345A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4B126FDA5;
	Mon, 11 Aug 2025 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+J0AC6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D426E711
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908628; cv=none; b=q3Ge5bStP4ppaW+urvLL52ipToLW5xtaAq+4xCb7E2d2EPZV68kbbzcNuzYHaU2NzEgPHhffY6aeuDdkivZjbp74ZJFZaVG1HK+lR4W6LA2Dm1/xHvqwpOXmvXoOwlFYQiq/FFUMKfTFiCMgCoF+lJ+8qRTO8ohxvsQSeAfXJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908628; c=relaxed/simple;
	bh=QikfI1Y7UGLrmo/VJcTOMNHQlyxpRldmUGBXg94jSG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/RhcUWZR7osQYVEpSDCxd3ESGbPfGmyGxQtLU+DMr1BJqsZRdRyVV1OYzaSJwnS+6culqwMYTq0qJXhPOND4PH1jbbBka2fIz5YemqRBT3YKPX9/b2PSZacyuPoCa6GhwzvFAhHqkHwDPs9hDEMgh+1pUHce+PNCgkrrDMz/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+J0AC6q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dEcT007682
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J24Z6vXIRBkYsnNDEpJUSa0Kgse74Ef/BzsEOsA0z8=; b=S+J0AC6qY0UYJMaJ
	M6vU6EDV5FPItVmIwf9NVBwbc9o9Codo30mkWYwcVGQWyxWl0jgPg18uBGyrwGb+
	Fy2fYPQnM2bKZOaIfSNMTM0KYtvB9nzs369FK0U6yKZnDJzs1jJk6LjRMxEWAe4B
	GOXFT0lBpwMDEep43ItDthHT0PzePvyi35j0EjRDIFdEe1iwAo4Mgk9+T4nBEf4+
	jfAKE2iX7wrPOEcfzOJy8VB0yXXeLH59HMGO6Pp9Y/Jhc0g4ogGoLWV4jNWClhzI
	9za1XRVtzlyJAfn/p08lkCjwJInQ6bndEb8zsPv2U94+eN4hY5kCqSCP4u0w2aZd
	y4Hf8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm818-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:37:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7092ca7dae0so11720826d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908623; x=1755513423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6J24Z6vXIRBkYsnNDEpJUSa0Kgse74Ef/BzsEOsA0z8=;
        b=iEhMkfZ5QuQNmW9V1NzfHNAtgTfNJPiVBRj+HAHT7o/yZX63yM2yXJM+Rv4UDeM9g7
         ROH8jvzV3wulfele9FhjhTJF/Y5PWglz1ITCP5GC9kiUY3PwvGGXAZ+ZY1dm8577NMXk
         XW60OEaRn+C4aDRfKSlNNIUxg8kuZZk1cVOevqpmAcT6IbrkMAHLEEx3BXXYt+wh/ZXz
         dL0+zwIebEuCN2Qj2mZPYBrDmllkZ5u8KUFBweqvk4bC1K/vS+WVLSJnH96j1zcDWUCI
         GWBad11WE7nlnpln9Xe2XmwkBWKqyVrd9VI6DxRlvY0Ng2Lu3QPEqSFMK6cBAl0qeS6w
         Tm8A==
X-Forwarded-Encrypted: i=1; AJvYcCUUkQCrnvzeXwc/37zKdrBzbi50OGFHvrWcYgtF6MqGhV2ZcapPyupNnAxhKHEPx7kcXvJf/i+v7rJPNY4M@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSFf4lOrc5EYySJzgulZG+1sjspn7p1G9DVhO/4kndMYGmRAK
	kuZRl8zuX34qd+1SWrz6aYiKSd36JZc/kDhI7uehEzlZRtz4+0L7FCX5F5EMdstz/3EpBxJzYe4
	hx9hdSw15C6HqhzgeZFlXYijmVaH/p4TGykFgTl0iM0xxBfMPcOMiZxF9znT2RffyJYp5
X-Gm-Gg: ASbGncsjEXTbdcvymmiM2GlfApOcK3Y2Dy7TsFx/g2aif0OG5DjoXis68GFZuoEGhGa
	0l5d+uT62AgH0Q9l3JKP9DX6P4KQy/FlpKK+6htP2MxHeR3zfOUQrJQ2fHrl3+glzJRgW2TWxOP
	geiPPvo41gQdHxfuawVtpysdvN4swP++YbyeQIxZyQ9t7ena1xRSEs1gHVJCNjkNJ/9RQXR+WkF
	dMw4ecfU26Z+QTEVwuUzKAbQFHTaHmtmPvW7FHe9QSi/e8g2AAjRZVxvLeNNBWcr9gf6z3Xx27Y
	V9ztjF2ywte7gZbj358L9AbC6WHYTDtH5bERImEp9FEiAOJ0ArLFi5A78zEQOoLYlF3XmiHP7jA
	WB5g/BsxKRq8XvJ4e/w==
X-Received: by 2002:a05:6214:e4c:b0:709:5007:9f80 with SMTP id 6a1803df08f44-709abcb6b7cmr55987266d6.0.1754908623540;
        Mon, 11 Aug 2025 03:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTrAinsHS3lX6lpHjYp65jzzXK4FwsVNqOAIzUsaWy9noN4VK/hftIl5eBF7ttkBFQYzjclg==
X-Received: by 2002:a05:6214:e4c:b0:709:5007:9f80 with SMTP id 6a1803df08f44-709abcb6b7cmr55987086d6.0.1754908623021;
        Mon, 11 Aug 2025 03:37:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f245c1sm18271623a12.22.2025.08.11.03.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:37:02 -0700 (PDT)
Message-ID: <619efc83-37f3-4b4e-b756-c53ecd2f6867@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
 <20250807-topic-4ln_dp_respin-v4-5-43272d6eca92@oss.qualcomm.com>
 <ibrupwvn5frzb4vo3eukb7p7pzonaxwhygshz743wmyrbprkcq@xcpt4ryzvwqr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ibrupwvn5frzb4vo3eukb7p7pzonaxwhygshz743wmyrbprkcq@xcpt4ryzvwqr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KcPTxRcITMfB8wyCOlG6vNzr_vM73dMN
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c7d1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ZHkuymcytaaAwfHE7G8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX9JtB5fQspjNO
 oO8W9fYuX0wACxUUjwkyfxSo1Ov7/OTN2acDz0WHgOOchPfckuS5NzDnY36lKhw06Wza/oZ+Hms
 j946yM0GHQVN8D7sqYXYrWPkTdGw/3mUXhJRKbt1WH3fQ7JFPRn+nBxS/wQOEES83wV9iT+TDgd
 ulpnclkG3+pehj5Xv1b7FOd40BCMIiaaIc/rCsnZ5IEFk+0NKiqBDK9cauoELmKiG1kGKjAb0fG
 pdlu4KWDxYbqcQ0fA0xCkLnLHbTYYIvGNs4pEy66ecEV2hcP4VDpivmJl7XSAbuVBGLPzh0oSCR
 jxCqSdxxGSqPvsDmVOoBxt2d8xXjtmofPCS8hjxo+/ibtOE+6enU1br4WGNbpinF9IzLcjgQZ5L
 rtZTu7xh
X-Proofpoint-ORIG-GUID: KcPTxRcITMfB8wyCOlG6vNzr_vM73dMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On 8/9/25 10:13 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 07, 2025 at 06:33:23PM +0200, Konrad Dybcio wrote:
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Register a typec mux in order to change the PHY mode on the Type-C
>> mux events depending on the mode and the svid when in Altmode setup.
>>
>> The DisplayPort phy should be left enabled if is still powered on
>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>> PHY is not powered off.
>>
>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>> will be set in between of USB-Only, Combo and DisplayPort Only so
>> this will leave enough time to the DRM DisplayPort controller to
>> turn of the DisplayPort PHY.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> [konrad: renaming, rewording, bug fixes]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 118 ++++++++++++++++++++++++++++--
>>  1 file changed, 113 insertions(+), 5 deletions(-)
>>
>> +
>> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
>> +		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
>> +		return 0;
>> +	}
> 
> I can't say that I'm fully happy about it, nevertheless:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

IIUC we'll be able to get rid of it after the dp rework?

Konrad

