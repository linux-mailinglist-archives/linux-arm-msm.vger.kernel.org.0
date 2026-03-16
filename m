Return-Path: <linux-arm-msm+bounces-97773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M11DBRit2l5QgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:51:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA44293A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FD2F30055BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F003188735;
	Mon, 16 Mar 2026 01:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5jdMSAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuwNYlVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D81D54FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625872; cv=none; b=rYq2ufa1i+ToiDwvMz/1ag7dA2IEauRZJzXR0pw6yfTSYLGpLl7Gqx8ZuD5O2er7S7nIhTI7VZMDQB2hucIqoVEuVb9Qx1UzNHx3l06UYXhM+UM/WDZ6BtQ1RR/p6+nBGLbJOorSGZ+oMZtPasujLKzegcxzUjzS8IrBs9Y/Pv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625872; c=relaxed/simple;
	bh=X5A8/9pdjaDPymjKNoc4a7PsRTH9RZ6+m/RVS79tNQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npPkBgZQWNOQBTK1VMNpE242cTkLM8FmerXZNCRegNKBHP/awBkSHs6EyfRKsiq3ra1w0jK9KIultl12q/t2UPJB5p22lFnXWbvdkbSUPu5PkGz1YVglx1SKe/cb73BvFlWor9x5VYxziQ0htbT02UQYzAaElU5kruNAmr9+r/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5jdMSAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuwNYlVr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FDUjFd620439
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Chyyx58qykqbbM/NbZozHdwyy5DiINB753rlDMdCFiQ=; b=d5jdMSAiK1ZVC3fW
	KFGxhPCctBEy6wMCuUwn7ht6XPH+scXsUC6K7IQfytA1Sglu5pl0HaMuAqYQpLMN
	Dn5zupR57+35iFOHcAVqW9BS4qclpaZsSQ0t2qsEwHzu+f9rg69+IGs1SbouRl36
	SV5Cffnrm1v3Vohjs8NY2nfuLq7g4mdlx/LhrA65LkjEt44+1rfku4lkyDOTKLfM
	S6SGDuI5n2iCHRU0rLWgduEe7NOci7YcuT0ZsKt32ZoYyhsJ1P8C/bycb6jiH0KB
	IzuP/Dd34PP+9SmkQ9zOWL6iMrid+C0RFe2RTkIE3Xusa4JiVJQ3tu0oOgcLwTff
	9+I61A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xkrvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:51:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c738f71723aso2460977a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773625869; x=1774230669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Chyyx58qykqbbM/NbZozHdwyy5DiINB753rlDMdCFiQ=;
        b=JuwNYlVrYml1scf0DlizJGgkWSPDpShR4dvMsF/RIT5anyOJo7BqqL436QydqvIRaY
         pKlJHpyH469gH9ZuBbLZ49gS2jM4yFI05Tpn5XtvykcUc0sxUoP03yqMRT4uqvbxJ9xe
         MoQs9xfM326g1GnzXMj4SRnGceC0GKzStZYlZiCV2SxH7wgsfC8C2s5jYgipfyupSReG
         u/FWg/dIG5vnJrGpFj941BdfjxDOHrdGD85qdS/7e4Q40FQHE+dQ6vdDckvjdIb6poi4
         UtkfDu8ncZDlgh7CTACRf1EMPcoAfF3T20J+kZQTMf0Hy1Arl8p0aui64wF29EArVwTl
         C0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773625869; x=1774230669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Chyyx58qykqbbM/NbZozHdwyy5DiINB753rlDMdCFiQ=;
        b=GmtJ0BxB4kgoqGxCdlA4/L4pDXIi7BGadcXOMG68XKFm24sSBSE82YBHvVVIk+zuw0
         DCGVFQa4+AauvxIeJ6czNbI1oTGf5jWfFUKAtR9Kt7KKu/IXl7PMn640vJC41slZZXDu
         WZsUS5UDLLz6+k3K31IOCexHBF8Y+NGSBpsFyDDAIoljWctRy9cWkq1cGK3Z232tw5px
         wmnKS9cwVOL7GQNDNo/xV15OYQ/7l7QksOM4DKCh5yN0aDRLkSaLCKuim8P/2hHPu6pT
         gNejKJQ9UXSHFf3/cs7Dc5VCYZfBsJoBNMUKev7GfEX4oVSJVkeDEz8jnxBbRXI/W9bI
         P8pw==
X-Forwarded-Encrypted: i=1; AJvYcCXivveGIQBZu674N9tQKKlPVH8hiXvUSOgBjcK97Uv3iBRoU6a6swYxUCCtN3vhkdNd/CBOyomVFIEOhGqr@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbr+B4B0pXIZFhz07kh6q/IcMj5vXg0bowlCxleh0Oq+sjXze
	X5o08npngSa0zaDup2iXNI90XeJvsIaXCVolkKhmgTFDK/mJMne7B/aoha3adOvh2guzDPZ27Eo
	8Lyr4WJrCpaDes4MwazoxltdRzlUuYEu5bwD5xVwtbVydafnCGfx3St091KGXCECbEKIK
X-Gm-Gg: ATEYQzzUL6ASkm6Gs9bEZezl/D+5sjjcGAgHzHCsI7FN2nfMiwpiF+l0xiYgbMR+QCX
	WbVNeCyo7Ayi+XLndAMkQF36pEJkLdCPvoRWdnmkjCO4PDpPdJ55/JO6UzyeH9W0Q4iFCUP6TQ1
	sE49PPeY+xmYXnW84YbZPRP8THPZmP2FaTSsqre50ewLKqZZ6xVCkxCntjIaRFJiVAXMz8t6B8f
	KERw4EE1zzYLz3xReUJ0RWXw4zwpxgzibZoOT+eocivQdJAFr3yYqqVKiqL2VsdWYTjdJEjleMj
	CMXESTiFkn64feolbt4aec9TqRs+4qSDji9AEzPB/XfhPTW6mA64Ge8vheeEWMv9H2cKsvf4+JZ
	W4Qx03jqbX9tQF99Ay8IuWyVxfbhzili1DuEDtRghY+o7Am06fpycAfJFMNazpf4QgFhH1ZRGYz
	8skHdY3x/u4mA=
X-Received: by 2002:a05:6a20:3d83:b0:398:6461:6879 with SMTP id adf61e73a8af0-398ecd9770fmr10646409637.57.1773625868618;
        Sun, 15 Mar 2026 18:51:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d83:b0:398:6461:6879 with SMTP id adf61e73a8af0-398ecd9770fmr10646372637.57.1773625868109;
        Sun, 15 Mar 2026 18:51:08 -0700 (PDT)
Received: from [10.133.33.137] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7402214f21sm2046131a12.30.2026.03.15.18.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 18:51:07 -0700 (PDT)
Message-ID: <80b8ef5f-95e6-4c02-8a5a-07295d0ebaf2@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 09:51:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxMyBTYWx0ZWRfX8mJh/UXZjcod
 X6JiYEHg6zN1xkzCm73tX3pXV8Yr1vsKsKzJkGb//vSh8Hs7315+DONJr8/KsOkBCmj4tvOR8mf
 wbj4TcEq4MpFZwHo0d4wme6KfXMajg3WHIGE0wv5hdeyhauUsB85Vxq5Z7VslIo5kg7qxn8dEm7
 uj1GeSoBbeJSMMLxuUp7u1DcGaFRFPzV+3yu7WPBmP5D8WyQqcRqHWyAMnLa6ujaykaIPaVLUIU
 zaeKmo7/XzNZdbgt9uKqUGdYyPTraop762NzRzowqxNp90QzQwK1wuaF4mCLU1ALwpNHAPgA5Dh
 +ibneS0yX5nDT/nBlEPs6Fg188WgVWAkWELKP22uWf0ppPyQHyk9+z1bbO3UZWtT3d4jCyiNIoW
 EcUPZ2xxqCDukE/cSRGjFWGfn4kETm12KIY+sh4tKtkzalaCZHAjjYdEm9zVOeCPirGpvEhMUr7
 /hBEdsPbs0Rxrmg7BDA==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7620d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: JPZUcc92zWKGzqu2TBLZZ24Vs3ths7A1
X-Proofpoint-GUID: JPZUcc92zWKGzqu2TBLZZ24Vs3ths7A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160013
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97773-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAA44293A9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 

Gentle ping.


> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 


