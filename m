Return-Path: <linux-arm-msm+bounces-107861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFFINjsMB2oLrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:06:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929A54F0C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC881301CA60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A41E47A0AE;
	Fri, 15 May 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0G1w3ii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/1kNENn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E308A477992
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845022; cv=none; b=da27CRkYkd/H+8SqUsyF2GampLkiIZwEzpMZ181/zhzkCq1wmppdSJQyrC1zFj2lXDjTT7/Pkyd7KTv06xS5Xo0ebsRqmteKsVRW93bioH31f3XLcqvPcRjQS/m20uGjjGISjgT/xyiE2XOEG7EIGw/YSPGTTeyLsDznc156S70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845022; c=relaxed/simple;
	bh=K7GQXD36bXo61eFP6JjAaraLbWF8snMbl3eEJjCrLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IR9v+XLD2MNEdNN5R0q4hQaHVmQNII95YgIc9zXwhr0edJkF57DLzQGY2KzCJNEUIpaN0SPI4S5sqMQmrP8HIHEVIJH+MRMyBATOuknX9cq5W++7GJ/7YuBHFIIXtpWbwkHPTVtkslsnMr4jbBKMDKdsIO2ZsYvXfwjfOTl3WW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0G1w3ii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/1kNENn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAsqXM4008602
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HM/NbFmiLEWAvYr+8+d3jB+4yBVCuFLqojVlv8UBMsM=; b=i0G1w3iiGt+l1TH3
	oYS90XLBaq84xhdxf3DYyTEdRej8PWnKPfut5Bd5uhKdnuLLJXBpmMXtBgLYijYg
	rGPMrcCzzn0KybjeARKrWT5M1dVXX+0S6Pt0xjXr4XJrAn5TIWZQAOoGzY3nKYKZ
	30OqePFCjBec2SkYBtiRXR0EBoyXlU10P+JNqvEEJkB/5xQaZuBXvMwRaTmfwF81
	7Cd2SyHEsn6tTQcjePIQBuxP7aTuSoMYVBA8o2Wk9oyCaMUFyytNrDVq1UkYdtcj
	3wMdvXsTHL1hUPgckIttp7PVgvKo4EHqshxLpNaTPkCvLxtfM8iDqJP2zJ5X0v7I
	7sj8AA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su36d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:36:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90e0eae822dso81090785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845019; x=1779449819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HM/NbFmiLEWAvYr+8+d3jB+4yBVCuFLqojVlv8UBMsM=;
        b=R/1kNENnFKG+fwzlOaTjEYns7dhPA1HHVN0+iFMeLk5A3ne3PNuBiKI2vtMVuf0IIu
         x5CAGKp3G80mL1fCvyP0ZSFPlAoAQUWZ3DfAFZjCG0GeCfJahOr595FrU8uzgWXGJWR3
         +SdxNGaphudgyKIXOX1rPAoj82Yq49yyy09yIXNJkrmGqA+RSu/B7CO79+0GxwYijaqu
         GbwsoLYhnioirTYCkkOs1MXYeonCjvQ56T03uECrsVDYVRtht85b2mEr4hRNy9PUOOPb
         GnTjzkvDWbQEZ/2Duo9DvEDLBgQBvHQsiNxL/4+J7gqTWECl91kJ638nrbI0qNlX5wLf
         Y89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845019; x=1779449819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HM/NbFmiLEWAvYr+8+d3jB+4yBVCuFLqojVlv8UBMsM=;
        b=P2xGFnKm92KaR7Tz38CMu0Yn9EtDqPg25qF8wM/s8GgO4z7w21yRNQrIi7nnrxneO0
         0T1Ww1AUHtNNBfUM+PdioQZG/s1W8oZP2R9Nq94bg9QN5pVbRz61oLivobaEzoqHxxS3
         nmBe5FBSNqAHuxmKgxoW9Bab5OPLILsRrJ1j77s28xLgTIiYnP7+vcZncbEPK8c/5mMo
         BOJKIT/j+XN3cwCq+VQqnOHKGFWqA5mnR5FBcXXV/SoI3mM5v1v0bhaqVEjqKWKMzikD
         44xTObZP4L7HUZoRLh7okXNc6z4h64e3gO9ucj8EwiF89nNCuax5n2V7sc84623kgEzJ
         zu1w==
X-Gm-Message-State: AOJu0Yx2PV6Hf3Ogr7bKf+4rGdMCGDdHtNVsLiBsQ/QYdJOb9zQc0MtJ
	MCzUCNCQdnGIlMgrDCDHvqi6tUTqjY+9hT9c58Eg3CE1V9pSJPx4GNGzv7jo+Tpe5kp23GHqRDE
	c0yAE2qE7l/b19EOvTjxdkhNcnVjtEMsHGWhb7jx1+6Xdq9HXrZr+3z35Y9rOB3y66he5AO7rBv
	Z7
X-Gm-Gg: Acq92OGSj2k7xgKGn+putslHg3uZ5fYl4EadP/8qUjTEw4yCz/N4DnrqDzimOqKu4Ht
	KIQ83XUuc6d3F0RxXz9dclykbL9iFH9h0LbV8d2DjugY1G2d+qTSeaP60DLafLtqbqO+9MVpYZA
	Maj91E2JUR8DIfmW6ICDe/T939PLbZ/1arZxnMREygaBb61EjEuT2PoR20/vplPfCk+0hh5d75X
	DC/X7DFBfn9nM006SlG5KsC3Ty09OOEdKqdJhJxgk/DsrFDq5nSog1zU4XBFSShsQFuOnw7hzoI
	B6XON1LHQYhutHey1cLz/cH5TXQSzwqYfM33Yt1PBSCr5G5KcHN4rqtqgTOpX2g5Zxd8eH76FDG
	p+rLdSeyfsfFEsv57WtMn83ulSQUCguXZbFqeGL0bs9in9VrYzs7gJmoltBn77gmTOlvDUVCVQR
	nGWb0MgPzXqFy6UA==
X-Received: by 2002:a05:620a:408d:b0:8cf:d953:b4ec with SMTP id af79cd13be357-911cfbd4627mr364063585a.3.1778845019128;
        Fri, 15 May 2026 04:36:59 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:8cf:d953:b4ec with SMTP id af79cd13be357-911cfbd4627mr364060585a.3.1778845018636;
        Fri, 15 May 2026 04:36:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670e02sm1821078a12.22.2026.05.15.04.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:36:57 -0700 (PDT)
Message-ID: <3552d1bb-5d65-4036-8768-39fbfbadb046@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:36:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
 <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
 <bf37cdd6-b863-4e59-9459-3247080955a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bf37cdd6-b863-4e59-9459-3247080955a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mw4C7EFE4dI7AnC4mlxikGFAFu3g47uH
X-Proofpoint-GUID: Mw4C7EFE4dI7AnC4mlxikGFAFu3g47uH
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a07055b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x6jRW_0nKRSPf4FljCEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfX7WcfQCZUF0sv
 ivuotten/O23D/tSyu/Hmt50SZibnESkqQbEvYkCuhlsru03yF2ycR0WSdWePajvhCx4HjmFzUk
 K4+We+kBRzKHBGYNKNsmU59gwC7NHEui3r0BnpBwgkNpowC55ts59mHvgylRrp+MBqPBKVR0cOL
 odYfJGCdFkd2dFQ9cCPCUX8jP+QSUiXuaainrBiR45HhyUPSHLgeKUkanA4wlrvDY1q84pZBmAA
 bLufk3q6dfYHokyX9k4phgbN5/RjuEs/wC4SpbjDWXmMDbY3atJXxr6ulRqsivPSJFiYWeAx4Pp
 K3952p8rVUnMuwU6PEm4MVwFFtzVLc8hWJaSPen2mof+rbt2UEkZTlZzF2qBiD7XfhFcIfMlZcc
 g7QomBk0e5Yx5ldCs1J4cTkv0wJ5FwmAYE2Zlx4/WVixj1cWo+i81iqXiBq11f5syHGV93Mm/9c
 P7NnYjlYmx2Nfz8LCSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116
X-Rspamd-Queue-Id: 7929A54F0C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107861-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/29/26 6:10 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 11:06, Konrad Dybcio wrote:
>> On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
>>> The drivers for Qualcomm SoC components are covering a basic or
>>> fundamental SoC blocks.  Usually they are required for booting or to
>>> achieve basic expected functionality when running Linux.  These drivers
>>> do not represent any sort of buses visible to the board
>>> designers/configurators, thus they should be always enabled, regardless
>>> how SoC is used in the final board.
>>>
>>> Kernel configuration should not ask users choice of drivers when that
>>> choice is obvious and known to the developers that answer should be
>>> 'yes' or 'module'.
>>>
>>> Switch most of the Qualcomm SoC drivers to a default 'yes' or
>>> 'module' for ARCH_QCOM, to match existing defconfig usage.
>>>
>>> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
>>> multi_v7_defconfig.
>>>
>>> The change will however enable by default all drivers for arm or arm64
>>> COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
>>> logical: if one selects ARCH_QCOM then probably by default wants to
>>> build test it entirely.  Kernels with COMPILE_TEST are not supposed to
>>> be used for booting.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Please also add:
>>
>> QCOM_RMTFS_MEM (required for modem)
> 
> It's in the patch.
> 
>> QCOM_SPM (cpufreq-adjacent on some platforms)
> 
> I assume only for arm, because none of arm64 compatibles are present in
> upstream DTS.

There will be a couple arm64 ones too, but due to their age they're on the
back burner.. Whenever Dmitry can get some time for the museum pieces

Konrad

