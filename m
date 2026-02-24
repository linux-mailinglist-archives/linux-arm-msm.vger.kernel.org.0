Return-Path: <linux-arm-msm+bounces-93985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHkVAwaZnWnwQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:26:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA20186F02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6441430E5677
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44401396D21;
	Tue, 24 Feb 2026 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MprzHPvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSfrlqMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F1396D07
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935856; cv=none; b=jQ777tqtHrfKLg/JePJz/U4U2RTxtj3PYQqXd9I3k50j3gFVWjyFaAKEeieOahEeTmj9AqGALRVEpLr4VR0d4CrUEMxT5lu7I+H5Mt1ZRPkjGYvlwMMnlQ8nwO5ndR21E+MnzYEmEOaoyN/cHI9UF1pNUB94t9X1BZkymJzhhPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935856; c=relaxed/simple;
	bh=bTmr43BdPtnQel3ZtNlnujKGUg0Ca2H9aOeE5g/etK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFhRTHczo9j6mCYbRdA1sOKzD/okY63GsgAjDsdfTgdGP7Qw+v9S81bEHWd4/piCSfLnNGfbf/8lDTX9cT3zUPBZX9is8qHL/YmCy0DphMYqhLwu9htidjbmjfeEb4ILpsM06X6sF5qxEckqdVHS0TTKQjkDlKuY+QUwaclN8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MprzHPvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSfrlqMU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFfwC3324928
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bN1o5+44eJsv48N4PPw9qTAcmAEf/hUsoOucZ+FPRXI=; b=MprzHPvAjg+HgcoL
	Oc73QWdAKn11zYvGbu7Tv8qQMLrex0M0aUHO/KHEA8uq8nQnc+SBZOBXiyS1Fgbi
	Qjsh0Qm9jYw3yWz3VLRzJ3dmUJHKx1WhkZ0ggakyOqQeGAdz/WNf+ydzUlqcHHX4
	BCQ8jKnfZPrmVgNYNUlAQRhiBa0tLdEx7wCnVYU0YOIYGlCchxrfx1EcPhOdFA+z
	Wa623MNcglwobldYpFa14iOVQcF08Si4MzMGzll6RZWr4M+Vju3k7TFmyr/UmAWo
	3hBMivMx2rn300GNNtPjB3nWqvDsnwAfDi06qX6xplugZ58DzKMUCXO0LmZMK41S
	GdiqkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y4578-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:24:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38a5dc3cso543680185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771935852; x=1772540652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bN1o5+44eJsv48N4PPw9qTAcmAEf/hUsoOucZ+FPRXI=;
        b=iSfrlqMUOu0gBBDrcFBI+aFCc/SAOyxPqu8KOMxxVyR3oeQ4NU8imj3lassOguh78J
         lNHiBFnwfKBDa7We7rujNWMmUcucJ/vMVGPDcYQ4tm/pNwXm8dq9DdbDtwvfkDg9wPLk
         Elhd9y2lglQrVomK8POXkMRjBDL6zqE3LmkCtYwBUD+2OLqs/LJPuzuam8NIk3kCcb4w
         OVFoNBqbeQPK4fIJFXCdPvvkr40eVf3KFotqzXlD5pA2AftM5EUPqGNrfNzJ/BJWDMFL
         db6VPz+XxHUiz1z3J8p3c7gaB/phDbc+/m/PBeziQqYICEls0QHF6hxPMhrqQK5QDhuw
         LgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935852; x=1772540652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN1o5+44eJsv48N4PPw9qTAcmAEf/hUsoOucZ+FPRXI=;
        b=l30tINo/hMbhlM6+n+BQ69Bfvt1wqkp1gK56CRk8xxCmYUSy3xgLpyZ3sePFmjjUSj
         7Kf0kW3eSCvkz51JDhEfQ/YlhdJo4EpzIO8ck5CEy3xptVtqKiyfE0uWfNv6UM9JDfS8
         IrwVCx3ILWqdd9aDjtEJ4K3qOR/+CRpd4hB1T9hBRJlCmdQLyIszWp2BO8iDFubwBX2W
         JG+nDGsRW+GNDqMAQsPknTjjz+8eXZhMXz42U5JCcrR2ERnsdgr5aUyijhtJUpBNsnbs
         fKhS8k2pGbuJt8we7hVwU+N4FzRaNfGPR5PeucfPZI4BQZoKFGUmF9vQbYMoKCzw3uxo
         i6Uw==
X-Gm-Message-State: AOJu0YxyVy2AXXLdw4C7SVaYUH0lLoIXxQxIcycBO0FaMgnVvEtLD9B3
	GojiEg9xilRoIPVIiiYPtu67TiYzeT+QLxRBYbMrI/dajonxuplhkV5jIXcEaKnkoTgEk8RZGR9
	kL/T0YUmosQpCVMsneoRpI+MX943MS1QDEvfxGHWIPENFLKXvrei7h0aqZQaLlLwMFlT9
X-Gm-Gg: AZuq6aKHfHnj6LZjUB4yevjAnEBo1b6KzQkHmxQhlQGxlxPmnzydv7+hNSvE9gFeApO
	sd+kpJJ7+WElUI/iuwbdvReXFFsDoRVlVfQ7xu7dUjcMNj1MuctnLDo4SUvlBWFdtR92FNU32ei
	1o0W8HpS+LC0lclSwbUiP5/U7ROOAkjOT4fIVZFux/HS4mSA+7Z+KYuxsyHccAdIgjBlP+uI4Sa
	6c5H1/CatPqNANRxJ1JBnJq4SW3ffxaTGkTRHlENIPkBUKFMIdLMy9pXWA8F3F8xWbTiG4eIqE8
	dso8zaF5ToW9gZKIwH8k4CNV6wQMgrYgV/4Ls8ku+pXPHTZ7ppHSdxzfGyiUBSSKfFj/ljtwHq0
	E8lBG5z1gEQjK8z2/qT/nChe1IaLv8dNry7tNHlhirCSc6u9d1BifGcR3d483kmtkpitYeoHCIM
	ZM6rc=
X-Received: by 2002:a05:620a:1904:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cb8c9c4163mr1143461385a.2.1771935852120;
        Tue, 24 Feb 2026 04:24:12 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cb8c9c4163mr1143457885a.2.1771935851673;
        Tue, 24 Feb 2026 04:24:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c84c37sm414449166b.23.2026.02.24.04.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 04:24:11 -0800 (PST)
Message-ID: <91bc264c-5f5f-429a-9d0d-63928edc675b@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 13:24:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwMSBTYWx0ZWRfX46WW5vK/WJV4
 p5hOqDgLmztBRnPqZlFu65umjk6jaNM/kBJ/OVK1U/VuvX8NnjH+4F/+y2T0/nrb310CGaegiZz
 27wlyZulgll2IoDHlS7UQvusy/ChA22CSzifrsIW2XnfurW6fbvDpiMiuiEmy+kXoBsVhsLkM5c
 jZieonHEls+dCZgyHXx63eAOqitcCys6RkNhUZhBNSSBfKtbQoDfZi7U4U5O93s8EUCPpE+BxeM
 MI50zu5qgeMdNiYDasCB8HPm38OoddsYaMhN4PCQ9n4y6J5EcJncbkVHaF8bOESLAse/5Tp3er+
 u2gdD3DOvSBV1mhLWTHxPBDo7AcNXOZ3s5BJmfLORCTjZ08DhiEOigNMEi1UduA1bHlKMpGGonh
 xsxn+0smrqgL05HkYvz5VsyqtyO2fA+Xw+QhTMdDEcRYoR95ShlSZVrU/e2OmjqhI1ukwDkkigb
 iC2fZfDWe5UwiCk6exg==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699d986c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qm79auVd1PL123FFa2UA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: n1eesLLVyRAzNZCMOIUpC_cvqT2SQlbS
X-Proofpoint-ORIG-GUID: n1eesLLVyRAzNZCMOIUpC_cvqT2SQlbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail,a610000:server fail];
	TAGGED_FROM(0.00)[bounces-93985-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,a610000:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DA20186F02
X-Rspamd-Action: no action

On 2/23/26 2:39 PM, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> +		swr1: soundwire@a610000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x0a610000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&rxmacro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpass_audiocc 0>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			label = "RX";
> +			qcom,din-ports = <0>;
> +			qcom,dout-ports = <5>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;

I believe you'll hit the same issue as described here

https://lore.kernel.org/linux-arm-msm/DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com/

with both soundwire controllers

Konrad

