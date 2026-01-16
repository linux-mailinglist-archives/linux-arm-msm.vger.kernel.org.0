Return-Path: <linux-arm-msm+bounces-89302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D2ED2A80F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 04:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0EE23027812
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 03:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6DE34106F;
	Fri, 16 Jan 2026 03:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oU5jInwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXPaiv6Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26079335BBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768532715; cv=none; b=fuQQBGpvo7NMhtFkU6BQfC8w7xwZ1//70tEu3FtROGoubjv3f1hdl7/d6MMg5N2u/XrELMpFQV5tv6A2lCEk2hh5LuW01WYnQSzWoTXZzfvTSNZPs1/WiGRAdR2qeH/OQL+7FyUlObPEnQaeqr1M1VpssJYI77jHc58uz9OgK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768532715; c=relaxed/simple;
	bh=MYYn7IBaiF71+cjYabc39BcuWiYd9J/fPB9kVpjfuS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHnDF9P+uYk8LtAXq2+rIolWFJJGCYnisYQOwnQYT7GGeTevHHKlbZl3LekJjCwn+QlEIBWvq+mtbTD8KFFBm8pxyyftxQCo51iydOpEfmIPMQr/KyIMLS5Uo7+tCXQNeTKBX9Rmj3FfVYqXTSjS5oscpH3VxFfu2+JjXNMxfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oU5jInwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXPaiv6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMkrLg3582785
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFWEQtFOz7NRpxeHXeoyM7V/F998/gk69p2GzaGQdUo=; b=oU5jInwQ4Cwn1YNq
	VeH/hVxJfCtUmSCO6RQN6ISLsvbtqPjP1CKNv4L1f7T+8eja2xXfYGlqRNFLPh1B
	NYdokrBBaixTWZEbwRELowWtehX/GJx3Ghd3VOqLWTqdlL7wHNDETxM37RtSuUfG
	bGCAeA8xA7r8Y2/dxQTyo+MB0QaFfEhXVEUowUptmqyKOpkg3pp2WyZmkfax0DIT
	p8CnVIDZCk779Tl9+FabKOvSb5l5gLQzVOw3mudE5vhphc5W98nuvVKjJnohX/fW
	RBuV5ePDtA9eaQPbpHJH8u1AEkr8CXXxcobjLFVThWlJ+q3bIYQHKkyKPyfGVYmF
	tHia/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9ayrhyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:05:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630753cc38so2562755a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768532712; x=1769137512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFWEQtFOz7NRpxeHXeoyM7V/F998/gk69p2GzaGQdUo=;
        b=LXPaiv6ZnRLZgLc8TjzLdxmckA6eXm6gqmeJZHgCokQajS56xMDmKC3YOTAILwln2v
         yqdrUBWatGcdOfH4tXeqCB1WwPmzx7oGFOUm1bxv5RYhYglZKdNP3FXTbqUXnZ5Ko60U
         whkSGBUMI1bYl+YsTmrWiHHePLT3KID1UUdK/LFX/dfnwcD6Csg+rJq5253Iz/OaPmKz
         MjQshS85EKqEBAgUw0/M8ED0znOvmg6TL8TrcX19bnweDCTsSy1fQg1NuCAg7/65DvDX
         RJWeqErLB75hWoB5Gv8MRvcxdUrO1z3Kml4JAdH6aQEDBk+oHP1LqIbWqPI5IoU+fubp
         txNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768532712; x=1769137512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFWEQtFOz7NRpxeHXeoyM7V/F998/gk69p2GzaGQdUo=;
        b=VyCCGAHWTOiD2rtSCgVoz0rlFMSkJ2NdVDghdzzliGeT9VDYXnwC1BGavztsgUB2rC
         cz+g3bqHre7KHrPYRmwqlTIDOWzl8l1PPNmAdIBtKC0ji6AZSI2J61ybAtGWdqDgHzy5
         gzNM9UO4CIll2LuR4Pxi71nOqWUMgoSbb1Zd00onF2AZej93NcecX4I67uGk+ochoiin
         vD4L8+quZoTg52my80TQZdZDIXyAbmGTvfPB4tOiWEqM4lwumoY+iuLoie5qX39lrk/2
         D+YBJsTcuPdRd82/CPTuLT7cBwLvkaV+0KpQPlYP4eDb4kXye+HBwj0nlN3Q0QEzizJE
         Gn/w==
X-Forwarded-Encrypted: i=1; AJvYcCU3sdOX7smtt36wdobgiuHPX3pJUfxWtutgI+IvYbo3Cw+3XIpVlg+uWMBDyRc8XQly6dpRLyYPDNVQO6Jh@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUbLe0ElQ6YopTCepglMvDML1V+tCo8Gbvc4hXwJLX8zy0Afk
	6QCiQHlRuaO9sMGML7zdoOM4XoyK31R6CHCr9zRqMbPIWXl4bbPGVMHFcq3xhmvrrIDn7V9FLAC
	kGssnLWMNgVdwaKf7ygv+FlCV2020IsZzinaJuF8y5/m74DAf0Bk6JF8hxStcfVdhzPxc
X-Gm-Gg: AY/fxX4DFKnAA5BwDN6j2w/McAx1RPuks+CuvbAD/+LpqTj2QTYDeaT5ihKRhoGzMu5
	UzlptDz5q/0uKJlzKTgTyTRkbnfq7B2ZhMDb42Utcq12+2qqxYTbxFrmrqFAuz2TokcnwxerRrR
	0GX1I3HrIW0mNG7KCnj9EX9OBT07cua05Hz+sxCPDFEAULBhDMfqqZrAeZihBrx/zVZtJukRJpS
	UTGJ7YtXS/EvbxBbzds0HD2wzIKNvHZYcG0kDHPnihIzceFzhDZ63kt5oQbLaxgGbodNS+b/Ufv
	GRGrppBLALm53r8n3Qm5Lzz2Sadm69iCCePWRXaST0M+r5IW2nyKvZ0yE88JtAkjzc0nlRWSju8
	dHUEFXR4VhSvH80OkLG6CN+IctIaAiOHpDANOOigWFTXD174PmuYNz+sT5lmuQgxh0TtHljGtEw
	Vr8YQl
X-Received: by 2002:a05:6a21:4cc1:b0:389:8ebc:e105 with SMTP id adf61e73a8af0-38dfe62a41cmr1883561637.12.1768532711889;
        Thu, 15 Jan 2026 19:05:11 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc1:b0:389:8ebc:e105 with SMTP id adf61e73a8af0-38dfe62a41cmr1883533637.12.1768532711477;
        Thu, 15 Jan 2026 19:05:11 -0800 (PST)
Received: from [10.133.33.232] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d68asm619507a12.18.2026.01.15.19.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 19:05:11 -0800 (PST)
Message-ID: <8ebf95d7-c401-4480-8613-b52ff0726cc4@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:05:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: kaanapali: Add support for
 audio
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-5-a6cc9e45de93@oss.qualcomm.com>
 <vyvijzse5wb4bhepmo63gfljfhya3oqi52ndl3l47hgtdmch3k@yj3aj6ayrp5g>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <vyvijzse5wb4bhepmo63gfljfhya3oqi52ndl3l47hgtdmch3k@yj3aj6ayrp5g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NWe0ipHW0PR3ppYt-Gb76DlUbhcwChwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAyNCBTYWx0ZWRfX5LznTfJGQJOy
 QhDoY94mFY4fsIAdjoj+4TScU/y+1IGzi4BhdRTVxapAb2ZOvKQtAP/BPUqsfCV+KsEuCgI4+dl
 48AOToOiJaSFoUQ5KzzzJ4LRn+74Vt7jpWt3MlVzANumxMNfSDZEkBP53N1ccEjK0TmZuxEkcPa
 +VB3Ct32R2Xq2L4d0wZ1j6swr1SqVhjV7U5yX63+i9ExOIvi7F5R8LJKC0JRZhRCv7rYJacOIBZ
 RWiPlY9+WakiubMNHCmD60eJ1WAaoJBm/z9PuwX//7A70042IY0PKuX/ABgDTBq9KqO8teoInSc
 gxTI7rnpTAihOex3AAyhBBWUkdhhDILTFhBlyYsLhZ4SYjywEn4q88lmDDBxKJqyto1u4VB1Cpu
 J5vWEG8LZaLtXNMgAOE7K53VJJBHODTiRvL6VuUVCHlLrMO0j43/odMCHgmvFvx5BE3TxgQE+xB
 qgORXiwDUGALgE57gUg==
X-Proofpoint-GUID: NWe0ipHW0PR3ppYt-Gb76DlUbhcwChwO
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=6969aae8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QNZxt0m00xnFyskCP_sA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160024



On 1/15/2026 3:12 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:49:07PM -0800, Jingyi Wang wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Introduce audio support for Kaanapali SoC by adding LPASS macro codecs,
>> TLMM pin controller and SoundWire controller with similar hardware
>> implementation to SM8750 platform. Also add GPR (Generic Pack Router) node
>> along with support for APM (Audio Process Manager) and PRM
>> (Proxy Resource Manager) audio services.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 396 ++++++++++++++++++++++++++++++++
>>  1 file changed, 396 insertions(+)
>>
>> +
>> +		swr3: soundwire@6ab0000 {
>> +			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
>> +			reg = <0 0x06ab0000 0 0x10000>;
>> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&lpass_wsa2macro>;
>> +			clock-names = "iface";
>> +			label = "WSA2";
>> +
>> +			pinctrl-0 = <&wsa2_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			qcom,din-ports = <4>;
>> +			qcom,dout-ports = <9>;
>> +
>> +			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
>> +								 0x18f 0xff 0xff 0x0f 0x0f 0xff
> 
> Use a single long line, please.
> 

Well noted.

Thanks,
Jingyi

>> +								 0x31f>;
>> +			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00
> 


