Return-Path: <linux-arm-msm+bounces-117325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ml6CLO4BTWqatQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:41:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382471C08D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:41:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OXEWGN9u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="dGl43/vz";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117325-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117325-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E67C9304757C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E1E41D4CA;
	Tue,  7 Jul 2026 13:31:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C041A77B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:31:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431107; cv=none; b=mv/nun21zvlpl5q5wBhvj5Kz+0FJPSK7f50c9t2NrtqN7qY75E0pLsQ4I+UZ+1SkpNvIltpjTcFzUZI+ju2a/vWuMdSgAzhwVPbWTBY5AY36uY5919nB6SSC2UZUM640d9X8+xpZ0ZhMStCvUPfUAjgEESOHJ3p1eTFVFV6inf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431107; c=relaxed/simple;
	bh=ULfQe5MuSmG/ChyJXgBYdASy+MulJK12QmcjURkE4Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2rtbxf6QsRK1KKSdszdmgv2seLe6H192iNLbRleDGIlQE9eO9e9Y460ucNap7R/CgVrFSuG/GwpelaSswEokd2MPMGzf0Y8FI84HtLU2tlh/gFgTCizc4X9oAmp8++eunGYrt+XyztZHiTvsV6oj+VF3m8xOehEIPruFSOH+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXEWGN9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGl43/vz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8al03783396
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bo4OHvStj7qVIcGrqBnjjOWrOPC/PkfmhXpPZFgogYs=; b=OXEWGN9ujeVewVQO
	ZxGzSWwFLbXiMpbGzgq+udpJbIbjNjKFaClgLIOWKEYj0S8GyNe4/YS2ZZD+VGbp
	aHpFHMJJUO7kk8LiDnNqPTYciNd1antTggsy0V1KX7t6ztJ5Q+88PGy6h5J4vnYX
	Zl7fQpS6bjcLbt8mE5V6gzB9u83B1WCwHD1CGU2U9iXQg81MtLWZGjkQPkun2PLn
	7zzlOxhREP9MbKUe8NfvZGPAqOgqGJAoHHH3avBhfgQByfFJ9XIOwhecrc+TOnsL
	AexAEClabFs71WPeg8JW1W4g5NeNFNQ9DeShuRADRwwuRDqAp7xAXxqN3ql4wvcA
	+7pwsQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11se20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:31:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so7114861a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431105; x=1784035905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo4OHvStj7qVIcGrqBnjjOWrOPC/PkfmhXpPZFgogYs=;
        b=dGl43/vzkGrkQ9ztbHfYolBl5f5SmVsfyvp4IyeSL8zVzH0Xqkea27T4TlrRGtdCCn
         EgW2/uDuIh8Aw+IuZaCAY3CR4vKellhdBBQpaDpqFp019Ct2yZLPkuElFK5zTrUFUI46
         T4xDtnXcypgMorVAkP+gnvvobd5OYSTpBlHvQ0fUHbi4Mdk83AX0/ZcuTe1x1Zwm4Z0H
         aLDO7pFAvqSnCFWhXjfOw8ITfUZKeyOgqcFEOE469Q7PdGil+Xeb/IwAaIuHuY2OjezC
         Pp/vEK0h7ygVMut8mPTLGWOtlXB/kiBU/XB+A4zv6489L9/KMn8q2A4kpjzB4yyMMVCi
         h67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431105; x=1784035905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo4OHvStj7qVIcGrqBnjjOWrOPC/PkfmhXpPZFgogYs=;
        b=CIRuG6BoNLp5oZFDQHiFGafwlwU32cxH5kism93b4GNO414Xkh/z9sWERun6ZjCRSB
         QD4Y468l67R4t/BVTv7FlmsIkup89RxhP7qrWkzhUwMWUfvZAt3BUWLIVYoUKMj7Rx9Q
         PP6nZwhzt3xGxMXmqCvUsyhZB/LL/rULweNtkqcNEcZa4eL7n2Ku96b29h94BrBHZNqI
         EprtU6ulkaKDeatRQGY2okmkLp72a3dGrQfATfmsOTzxlmmcq0ZZ8/3CoDUt+NPQbK2L
         a7hDjWsaxDtaCbeWHWulWVXBVLz9XBUV9U7XadN4aIimuuRUEkKRMtddwzGxvjBFne/J
         c+tw==
X-Gm-Message-State: AOJu0YzMTwexdrgoycB8le5F8hD9e2FmaCdwKLUTCKgQMdZJcI9GqiI8
	rvGW2B6wT+HyNQI5G80nvoXJqPU1o8EzGXpDaIhwxP4YAlivhNIMNVuiyUb7Ms7z7gl1xRQE6sT
	olflZgNX5RRNwvq/+ft89NVgcfXQtCBV3e39YfL7sQLtcKD2NUFrBp4DxmMuAPtuaDWAM
X-Gm-Gg: AfdE7clwxiDPr/M2BawoBSHBSt+XL/cnW+N94Q42zOpWx2pCZdNO8Smgqo4P1TVQzLa
	dBsyFLxFEHYZ8/aLoUZVRMWTt6N2FP7BkUTntz/E87dBmdG6APXxnIhE1z7mjGwUqj5p2N/vfkR
	obUVt+WcXs1cF9w3ewbzhXZx9g13mJKOCU7nMt9Y2l5vr+OHSjtItfuKpWfJ5tbFPzlyNjnWtbA
	m1XSkDHJZUqxgJ0utczbWfMj+O3lQNnAd0Er2lBjW8dyn5y1G608pXViaxReqbCrrk3LMCLK7nm
	B9mIRD4978yzhnKWgf5nVAzPKaQfAiiThgX9VWXpQ6vCfsIN4gK4iwI8Nm31il2/wjY7Lq27wcC
	GuR+RNqclsRf+sUYqwQnpKsNoFJKwDa99NB98oLxE0CQ=
X-Received: by 2002:a05:6a20:2d23:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3c08ef0525bmr6078130637.28.1783431105087;
        Tue, 07 Jul 2026 06:31:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d23:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3c08ef0525bmr6078091637.28.1783431104586;
        Tue, 07 Jul 2026 06:31:44 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm974409a12.31.2026.07.07.06.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:31:44 -0700 (PDT)
Message-ID: <df99766f-5c5b-4e29-8672-1dc3dbec8905@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:01:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support
 for PMM8654au
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
 <4571c6af-2a5b-49ac-903e-b158d9cbad16@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <4571c6af-2a5b-49ac-903e-b158d9cbad16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cffc1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Tx_GAtjeg8paHK5gnVgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: M0C9fC_6sIy0clpCzrCVIYFeXJc8xUUk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX7qY5go0cCC76
 RZ47lvT/p60w7s0cmN687oIrEQaFUJO7cqoOJQuUkNr3k5VzYPrYuPC2oZk+FXMvS4T5OCKs4st
 kSTh8LpWuJaZ6VbLCbMpzcI46MJh5vk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXz/T22Y3RgIDa
 g/1K/fYwAxbdFG1SYob6nlKfLCiEsq0CcIf5faxNGdgbsVB7+0q2cPRCuYnf94xogFdG08kMVif
 gkx0NBhAyGHhugt6EvW+NCZa09BPYp0qqWHahvlTOwS32auPw8E55oZuiF7TRhVUK7fa6jAKRzT
 2QZZ+Z7gx2PWEgcOwgQueJ1g2b1z0wNXaDVnG8qsUYHgo2D0OqHAaO3OiR9NlsMscZklN6R3w4m
 eX6QPJy/BQJolCcHIJSBeKx/0HMWxYYVcdsSWATgfAYQqE8ozcI0HxYHVAfO6VNevzBFpvNKhj9
 GikFWzGyQVlR5EwpItMtpy09jhZoE0jcRau4P7dSN2sdkcY6L5IeryeTioVGG8GvgSkZdDsUWOq
 ifTpAMuVcbK9In9xDrNJKYbYPMHFRTCY0aFh40MiQ06EBKJRwVtTv+8NluGKWqNM6eeSGr9kWBR
 Vnvu7B+WOZo0pFSLFlw==
X-Proofpoint-ORIG-GUID: M0C9fC_6sIy0clpCzrCVIYFeXJc8xUUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117325-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2382471C08D

Hi Konrad,

On 6/30/2026 5:34 PM, Konrad Dybcio wrote:
> On 6/14/26 10:05 AM, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
>> pmm8654au_3) on the Lemans platform.
>>
>> Each ADC node exposes the following ADC channels:
>> - DIE_TEMP: PMIC die temperature channel
>> - VPH_PWR: Battery/supply voltage channel
>>
>> Also add the io-channels and io-channel-names properties under
>> the temp-alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		pmm8654au_0_adc: adc@8000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x8000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			#io-channel-cells = <1>;
> 
> Same nit as patch 3
> 
> and only now I realized - s/interrupts/interrupts-extended - this is
> necessary for !Linux, see
> 
> 2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics: Specify interrupt parent explicitly")
> 

Thanks for sharing the reference above. I'll update the patches as you
mentioned in the next series.

Thanks,
Jishnu


> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


