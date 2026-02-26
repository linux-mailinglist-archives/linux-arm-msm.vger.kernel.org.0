Return-Path: <linux-arm-msm+bounces-94311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLG1GpdcoGm3igQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:45:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D681B1A7D1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B95B3034331
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B20C3D4113;
	Thu, 26 Feb 2026 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGfFXn/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3uX/2Hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954BE3AEF57
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116578; cv=none; b=IfTck49C5ujkPqtmmdNZk4KV1g16u2pOYUutN7EsN6YkvZECeQs9Rg3J/ylKX7vdCmvO80xxDHRNNdXX3y2Gj2958RnYZ9SzTb0jBf9XkLoPUXbsYo4bZ8zY8H7c/JAp1L7D1I7z9Umm9AhPt/DlYYNwuHlIy5jj5gJRP4Zets8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116578; c=relaxed/simple;
	bh=3GyQDEcDUInAD8wptu5W9Mda0bLcOy4n9r+e/8VHmzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZZ9nOHfRHeD1wSI7TH7+umQmvRW0pBUg9+qfI+a3cNURVummXKKedYI2rORVuYAyXbpP8MEJkHTzDhE8vY3gGgvfUh788ZBga8Vyx6BIcovmUYLZ2IZAdBzYbeFvryDeiZptqL1wdu9HQDVnPT2QmXcUJKBLF7+MgJX2hBkHPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGfFXn/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3uX/2Hj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKifH287801
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fPj2E0LEbv6NHZWAliOKMrFcs9XFNVrC+tkL8C1PQc0=; b=UGfFXn/ywG3dUUsv
	oL8LNsBGR5Ha0Fz36R1hV5IMHzAsUsZjsXqBaSxYepykZGwsYWI5rx3DKgFGxDw+
	qVr29NS2jqzFhIr6bfSVAZdzeGOMB/n7PZ8wYzp0uH5c+R5OKH3e5sX/RKM76Pkh
	HOzmphaBvuErd5aICPFLMBWTcZ4rXuyJOOYRSCZOvCAMIHifolC2O5RUAHP6xl3d
	NQj7ALFE0WX1Xuzz75ISUXaHQ8OYN52sLHVCKHtdTjUOwdSUHLPwsPQWrZsaql1y
	CS7jEgQ54vtyaWNzFBS0bp8qqtSyiGDqc9VRx1m5vu9Y5yQ8+RXkZLapB2AaPtHd
	eotwJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u0pk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:36:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso75565885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772116573; x=1772721373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPj2E0LEbv6NHZWAliOKMrFcs9XFNVrC+tkL8C1PQc0=;
        b=j3uX/2Hj+yyMcnSvye+foDINptGuCAcexirB/KZX7jILSzvR78+2SGL9xmvQARRGcq
         W4oWbp1tDo3A7Fre329TncqjJXY7slLuAQehaW7OBI6wij6atYYLiy496gZ9iqt18nF1
         hsJb53ffzqVveexhMMtefaL5+p8Z4hGNfKx7NFR4LxY9nbHIsM7RllTbvxKUWEw+28kp
         IJhTw9XG3oK700EkT4/Hk0D2tQ4Vx5gpoK/qRNweiJ/dAi3SCbfb2t8ldX8t+wF4hXN6
         uACDOYmJ3+X6oMcVv4LNPIrb9AC3sTXfyD+meVYRn9IIVOblZ5kwZP6kWsDWfLAEL4YH
         0NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116573; x=1772721373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPj2E0LEbv6NHZWAliOKMrFcs9XFNVrC+tkL8C1PQc0=;
        b=c/tW2o2JkJde9U2hVZEqWbutBYnwr2aQbs7jRisxf7LT04U8us5xG7xSEMpdxJ60dz
         QO9AoIPVEKu3PcpiSe9uL+YBOXlFnJ/TOhhMaxi4GCPiVW+CqxL08iBLrX+f60Ke/oRo
         ZqqrTORZiJULoVioSLHrbZel+CQh0q4p+wfLDBeFkVso64NvLQCYSOiUjf4vK5IYeHOM
         Pjy8WypdPEJTyhi9hJjyv8f28xlRY2ggnE51XCdw9R7cE9S1bM+2l2s+aTfM6xxzGzJI
         dHsssNCoVtX5DvEtJHAqyLUZIVmn0B81cXe9kkXGXmt64809Otc6QRBi4ng+c2RWXJm+
         yFSg==
X-Forwarded-Encrypted: i=1; AJvYcCWFBwDKEYw9aFKavVNIW9MA8nGYVRbmEGr0Ct0hHOXYE/w+tOc9YP9ZkfNXNzB3qRyfPD1gg1+4R8anC+cO@vger.kernel.org
X-Gm-Message-State: AOJu0YzWpOa6puZZDvuSZYEN/VvRq5uZ5HiO68zS98tZIUwLoSbQv58s
	zDYiPBRuzbgF7nxyTtb3eaGWeXbKVEKtf8ArEFphvpqkNLaIohHuJIa7CHTZJtz/qNNvCE5coSb
	XlEDf+889H3qJaLQKR6pH/lKVV3totCIzMck378a2sjQ+dvXjPf4HdootTuyWsXP06OrO
X-Gm-Gg: ATEYQzzQt5QUfk6ri7urhjNSyTYbl3dT0M4SQcaJ+0mkeVKtL2fNZ6JIDbpWGxWRAed
	2Tq95kk2RQWc345PE6AkbEtNdB5vS8Z+fewcTkky8WcXSsr+7iz+ATg+FREqelx9tbO0FzbAHOF
	CF5ctiioP3n5H5hr4vxF/XiXhcJbMLzNZkMGmMC4vdJQMOgFOa3skJ4wedu9FE+sh0m+rlMKIOQ
	my/2+DeLEmXPZZnB2Km+y2PVbG96LfVuAoI8I49zcsawIzwcO0AF6Cy7/ndw4zL5XuTMA3+Y79x
	WoPYbGlI2lFvxhM48e/vwtj50fZLoUg4igyZKGn3r7BK+PysO6f0YIj0xUV4p/Ue1pLn+A8kKhu
	FAUxA3OYiI/aQDPG6hqQn9T4A8cbpvq+O2JtpAy6me4YkP0OIjqj2xGOezfwrM2o9LzneKxS3MR
	ebLAg=
X-Received: by 2002:a05:620a:4628:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb8ca65f96mr1975465485a.4.1772116573170;
        Thu, 26 Feb 2026 06:36:13 -0800 (PST)
X-Received: by 2002:a05:620a:4628:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb8ca65f96mr1975462485a.4.1772116572668;
        Thu, 26 Feb 2026 06:36:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13d64sm66282566b.8.2026.02.26.06.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:36:12 -0800 (PST)
Message-ID: <b321921b-aa75-4c2f-ad2c-7ac34989a54f@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:36:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: add missing denali-oled.dtb to Makefile
To: Tobias Heider <tobias.heider@canonical.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226140429.232544-3-tobias.heider@canonical.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226140429.232544-3-tobias.heider@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMSBTYWx0ZWRfX0gN1JVjTOGOi
 6KS3LKPw73ntkLiZNx0pODSYTZUpWju4az/TF8RKzFJtYrvk+S3ciRoYKbFZ0PKWsf/gNKdffaI
 R+GS0VhDdKPGHhfFrGJJswOdLhhYQKGb+1u6z+dghUJAVoCw4BmBQ8zxdUWNv7DC/gBo0cGLSLW
 vPzW022Zjpe8I13RC4LpJ+skGoWW8X/TRsw6tsC/xAf9M5M5rDT2Cko1QGxUtV4BnmxbFLso9mp
 fIliO8VibOF8bNzZuJZ2rjhXkUuOrCYYm/JQVSI0tIEXVceyrqKMteEut9Kml2PhBP3cfokmh06
 3VDkmnGkDEneTTGJUS1QFauyyHHk5FPUhqE+V2kaddjpsTiuuj3rHui5I2DGRSVsQTm8fSci9ay
 /EImyDTPosMIE2Rfkyyk6WBcl2GFOspGfHobdCoEZW3muCT4MCjNo1p7waQUZGy4XttkDywT4zy
 PIAl5IucvHJO/cwZE7g==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a05a5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=zBF0mF75Ukjo73aVmcMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-ORIG-GUID: RxRhI0XL4ulwLD3ti7cWr0Fl-_v-_quT
X-Proofpoint-GUID: RxRhI0XL4ulwLD3ti7cWr0Fl-_v-_quT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,canonical.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94311-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D681B1A7D1A
X-Rspamd-Action: no action

On 2/26/26 3:04 PM, Tobias Heider wrote:
> The device tree was originally added in
> 0d72ccaa1e840b4c8723a929b2febbedcf5f80cd.
> The original patch on the mailing list also added the new device
> tree to the Makefile but that part seems to have been dropped
> (by accident) when it got merged.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
> ---

Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

