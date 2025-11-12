Return-Path: <linux-arm-msm+bounces-81367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A237BC518F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAEC7421B63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDCA2FDC5C;
	Wed, 12 Nov 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mw6t/RvO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZiBoTSo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05777280025
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940876; cv=none; b=keRIn2yRO899otkcJjzYuW1nyDg3BNxgsK3aMMF5ziJPHIfuj/+QgT1ANhXr21tBRlCH1ni6SxpZFyPDSmT6whvZZd5TsZjHCP7NOEu00IiKMPjz8v4ZfPD7Ok301zQLxmPXR8Ve3uOckebu/AhjfZqUZ7QMwDj19+QBRsmVmRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940876; c=relaxed/simple;
	bh=x9HZDMX3Zl7CIXyTCe51Kaaysc210oZGR++rzbzttjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMTnlza78mhW5CXY5BwFp3nqVvQ8vZiGsAdoDIyQGztijUsGwMeD1JRJExj60Da6b44SqT6GO0c0SYotlhRAEff+i4fvh/EZujgOktnQrxIp0vhFOhqZPYvdSvs87tZVLOu7fiMMur2hknvuBRhe8RCcsZb6R/WlTV+2WGCQG7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mw6t/RvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZiBoTSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC7coBS3502230
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LP0rQwhtBnPbXDJLLh9Cb7GUk7T1lPnHvrnhjlBK9gk=; b=mw6t/RvOzawLe/O7
	jAaHOnYA86/+4455aXIAk3wk5pIXd9CPeqaqhzPOkjVd7nvagTiMlJS3L2v5CLAE
	hsB5REIrLL952+Qizg25AnjYyfzR3w6Rje+XDXF+Vxp34FkVVM+tnXXdMBecmoyR
	HKdFSzB8LwByF4LNE/OcEIKbO9TK1aj6ezf6xGTUFckHl3wkXYsyrSAcIYdSIH6A
	KfqY4sq3KKZSrSQrTnFNYFQ/P3tigo77ofhIxsNZz1EP4wbqBB02+rMoievKdhUN
	56K5OsWXlSezcx9adFwde7mf3b238ffq/cL9k9jlwvqHH3AqiCGMAfTAizcU5bLa
	FNYYVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc1x66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:47:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295ac7012acso2766405ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762940873; x=1763545673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LP0rQwhtBnPbXDJLLh9Cb7GUk7T1lPnHvrnhjlBK9gk=;
        b=dZiBoTSoTukf1ObcIRJ9CNefIAHrTfVwCWvwCNECJwiBjVJh3me8pN3t8ecBfRVcH3
         zETUj/7tbMoAzt0zd54RukVxqv3AEriS97xVzDej+4RYRWrmAm1+HfX0yGDh4YbnZnFJ
         c1raAogLomPx7+c6+Du2Rn31TVbDNi8TpD0ZYBkfgBwmiDF+cD0Z4aD8fvVe4gfs0ZYH
         ZAQsUtDQC292RplM+I4d3dcfmQXCrv8mYOIeaT/uKw59sjhb6EY338Oh7emGlaMSvEFj
         AL8rvcyAGV2brD9XFz+BHkfrxkivy7SglP4OC+iOA26kfKJivKPWZKsAbpONDmuVWic2
         yeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940873; x=1763545673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LP0rQwhtBnPbXDJLLh9Cb7GUk7T1lPnHvrnhjlBK9gk=;
        b=HVq8QqOFv0JZLdg4OgxQS+1gLfnxU5Cab1wiWokrQQ6/5nHnrzxVVeSbUaVXHU3wGD
         Nk0/cTDTiYHcRTuq7X2GbTXNrehhnsM/PrWea01p0RpOTugRirDmwPEtgvX9fKDfHdpG
         LIj5izD6c9DIh/ztWAlArtsnDW9FJL1szySyQsAa5z9AXpEvVrNig80bWB3KvEl0jFCv
         vcZDpCtMmbECqnmYFMytaLhZhQzrPTcN4LruUvNv0/rLPxO9aeqYEr9Jf0/H6tI/hJti
         tAEhbHwcW5cZCxivv0HIof4Gmc8FzMhb5we0282vgYfnOyhijpWgMlMF5dsjEj3uL+qY
         2+7Q==
X-Gm-Message-State: AOJu0YxkS5h0HbjWYTFiPm8H+2gA5YQzTcE2pwjrAfP4e8KYno1olGAP
	D/4TPNuRtOaIPW5HqUdBgk7tddSvUjcVuIs7D3DNDBmbh14Q9cMT6LxV9ZgBSai8gDskQu2IxXI
	y3QbUH5vzGgof4H4lPw/zzTn6RmhKpT6OhEtJ4xGAel/yhcJbBC5Y53qaCezaN8dq7H7eZNRa2F
	/s
X-Gm-Gg: ASbGnct0b32EKrx70dO2T04i8a0f9OvM9buwklVy19Njfgy239LfdHNqbc8DwWhDQaM
	jsy/5xqVOs4rRGJVvNgb0j6J/4T/xA3GCpKqr949lgaKlGqjtCgGceFdaq+Rm5s5IYtFdTMYSXw
	R3mtcUynb6iPc2kx60ig0ntqAWxsjwcnsN/Far3BfLDBQCpvYxE0WuYE2G8pJzDD0kepVCXGfde
	Ld4WnpKYpWqtS8mKtCXfoEDr18dVvStd1B8Z43BS8OXDr8Aa5/LXayCuDpJKyHxBc+dlg5xZz8+
	CbdCBV5zAJy+GsN3KceWCvNaaU/2W2CBW2P3QGnjvGndHtdwH5AcRV8B/YACoOFZtFr6itfrktN
	0sU2omFYt1KpzGmFJ8/mJkqRHR98NgASpM72Pbo37/zhysGlSAv34AFRe
X-Received: by 2002:ac8:5dc7:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4eddbc9b895mr18101681cf.4.1762940354058;
        Wed, 12 Nov 2025 01:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCn/jV7wFdg3W1AVfUFL8B7J0xd9T8o01wXhaCJP9H2hJuRKsMlSsXgVFBDzEZebZV6pBNAA==
X-Received: by 2002:ac8:5dc7:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4eddbc9b895mr18101571cf.4.1762940353655;
        Wed, 12 Nov 2025 01:39:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcea8csm1551575466b.8.2025.11.12.01.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:39:12 -0800 (PST)
Message-ID: <db7ca9cc-46e7-4edf-8419-eb03782c2346@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:39:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Add backlight support
 for eDP panel
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iH7_CODpAB1BHpxU2sZZFtOvTGkoP1W5
X-Proofpoint-ORIG-GUID: iH7_CODpAB1BHpxU2sZZFtOvTGkoP1W5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3OCBTYWx0ZWRfXzSTVyxavixT3
 xLYPRIF5rg0Qe75h6n8xiUBrZhmwhHW+EithjzgD+dH4EjvMP7lAblxg/4bizLMUuWDUmvGby1F
 E2HZkDkzwJHgaGRqbv4eEGM0apdOkTcCT8zEXYobk5nRVJ88PUo7anuF5WumkgNYZbDI7xSEZ2M
 /5BL+Ajmi1a+L15dE6YWrv4fslL4fdIegmm6p27pRLQQ/gmVxZPFsMpPgyE+InMi5OdExrn7tI0
 b2S+TOQmJ6e8f6UINkdZ7R8NR5OwGWw39Ow1kmlBG9W9NkvxS4oMCaKDNXRQaG719DlXqcnA3+H
 WHSpbfUiuEXxABZfrFNRWMlXlwPASFY1kNrHZbcGWWfrayFFklxsKPs3hCldF7tSzwFtPidaHDV
 XQ0ALCBBqXgeHCbf84WjYTJqpHvJpA==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=691457ca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nPG1Do-yNho4o320QkMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120078

On 11/12/25 5:21 AM, Yongxing Mou wrote:
> The backlight on the Hamoa IoT EVK is controlled through a PWM signal.
> Aligned with other x1e80100-based platforms: the PWM signal is controlled
> by PMK8550, and the backlight enable signal is handled by PMC8380.
> 
> Describe the backlight device and connect it to the eDP panel to allow
> for brightness control.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

