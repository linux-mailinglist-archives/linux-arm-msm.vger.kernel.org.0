Return-Path: <linux-arm-msm+bounces-102577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNHIGOB02Gn9dQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:56:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 682693D1F81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A3EC3007A71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271FF3112B7;
	Fri, 10 Apr 2026 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcFlbh20";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+d50V33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93B22F87B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775793370; cv=none; b=OPExXe7FzdoezdNduPQHtejTPjo4ybSLT6MyD7OwYIOQL1x4INmxrTLA+guZI+4Tf3cgGkCINMVg2WlytFgLosQiqOWixumAFZVwdPsi0SDRBblYLGto/zV/JPvmAHnaw9FBoTcS2Ypc5fsoy88NicFZTzjW9b7HoNjWSnI+Ax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775793370; c=relaxed/simple;
	bh=WqjJY/klh55jK0KVz3OZ3Y2GpCClr+Hz8v90/ALvZ84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRvQZRlJFoELCR9T+VPViIglCXwO+S62uI2fOlESKuAI8jf6O3iwr6LI07oRNUKih/x/iyzyxUplfEG7tJ4LE6N5Pms2c+3YuQMiYFMjIaDcgJgW4shCSI5l3UQzieFQzlW67hSZRjeRheVRyHxxxw1lcoKs0DtVRUYRYYQmc90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcFlbh20; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+d50V33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639MUR5p3935245
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=; b=jcFlbh20MjLbhYiw
	dQqOf+oykWWbOk+ogXpUm+mMLyHslRkqQt0ncnh2rsVw/VOv+WToYoGnRnnPOUFd
	ChbM8I0FKStJHrScjXaDwFkpEMMw6uyEDY5aZ4eJyD0kq/y2rHSPbvKJi0cw6CzW
	JSEDj0VT5whWfeB1fOb/g39OHEMmGEHyitpoBY8wXHZIwSp1/zgfwDU1iSvgOJ86
	mqfbcP0CagLV5Z23YgXqP5gonhUz0JumWdSCEbkmZuFwCDanQIz3YTg2JBH6R/Nq
	rMAS1AHowtzVibo2dPbWkYXa7SwPBCvYvVhvd0ewSjz0xjFLwV9E2VWWwI/z49Em
	cIw/5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sae8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:56:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2497cc190so8151025ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775793367; x=1776398167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
        b=M+d50V33bLrurEsKan210o7tlS1UPHvBVNOXOYZeLCLqMD6Hd+/kBKbXvFLXWu5ssd
         ufUcDOpc1ejbwB3+ZtNpiy7++rwywe18yn1qpBQRfsoHTaSGyF9COTjzMNzK5sjAJeDJ
         slXMqQBGU4i703fiDqfKbsT6JOk4MWmsyTU8bh5owcGexJrZSyMfByY+hBsBebAuOtvw
         OZ2FyzPlthY/Usw+HgiJwf65UTcimtnGAIipFn+Io2ZghhbGn55kQGi9QeQpQi0rbVwS
         fdpgCq2tgnNHK7bsOrxngEIbigLmP/uLQlZ+/VUopWa4HYVXLtNN42/Ob+U3PpAQLtea
         KrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775793367; x=1776398167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
        b=LapmzfxQc8rD18Mrs0Ikl/9pZXdMK/lH8CVRCtxHCnWKDWXNvmFU9MZ7CbkWYImmNE
         JjkOwExwb2iBpbj1MCIvFEI6rH06djEHg2aoFLCW+u3rX9GH2EJHXgU9X8B1noH9K8w2
         tQrFIXIZZyaDejOX1MADE1dHaGM+kwMhMgBP5S0KgvLz84Y+6Li9pYIammprB/bAwfCa
         WuZu2olm4TjL+94kSlMoUuBejS5tLVTRGE7v0k30I1cwJYtRZmcVb4V6pdAJGkV7xIw7
         YvmqTTxFXQINMuWY4jE+r/wViK3IcnSjsA43B0Rkxo/NVzi8MTjaWh2/nKfWJB6qecV1
         bBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLKzRUAtuqmQrGJwHVFVFXGtQNalpkbXCZW097l8MZjvfgcUJNhmwo2+NI674iXESxGgtSg74kTCymwK4a@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFcU/mB8OatNeTRICSZRFNQ2Ujq/NeB5RaFzUuTxFklAmNr2R
	/wgQ0Titkom3uoM+lZfnre2qft2oFTeo7QIQYjK0kpKsRq987n7K6x9c6UW5P37S5d/hTaRWFUi
	QfhVERJzcLp0pyi1J/FN7PTqn2A0xakAYghE1y9Qth3fxZ1kOETz9hnoboqkZYzNJGKKz
X-Gm-Gg: AeBDieu766Vt35Nv01vVWSQutX1TAc0cUTZM+gU/bIIwNePt9qO4QuosBKpouWzWqNF
	5b/xG7HR2UuxFnERigC95XYtegmJu4Y/AssruY/Q5QDJekgtWWf7TcvZ0/MhP6Q0pTdSq/sS/eq
	hYBW7tz+5GvnKEfu0O7+WSvhPn9wydUov/ElpnKpPg3FgYayRxOcVZyCJPllBWv91WvRH+Ks62L
	IGnpIbIuyynmDyCT8OBChM+SlooPPkx4jT/sL932DR/vWS4eBawsTBThaLLRmvfJLgYZCBmD0Ls
	UkRDmcmDMiXY2r+6uLpAXNX+51DzX40o08ixPoUhM8KRBOhbI1dcBq3iFYimc8ypWRgBDP9T/0P
	pUH97/XfWZxchsz4awhYcCavKVh9ZgUMyrc5SRncsDRiqURVzRA==
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id adf61e73a8af0-39fc928c9damr5656585637.2.1775793366750;
        Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id adf61e73a8af0-39fc928c9damr5656555637.2.1775793366257;
        Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a1d0d2sm802544a12.27.2026.04.09.20.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 20:56:05 -0700 (PDT)
Message-ID: <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:25:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EjI1LPKJ5ALUXoVkKB60FnZ7DXX7X2_A
X-Proofpoint-GUID: EjI1LPKJ5ALUXoVkKB60FnZ7DXX7X2_A
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d874d7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=km6amy0AK99uZQ67LAIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMyBTYWx0ZWRfX6V15v1CJdXmh
 cy/tHd6Q1VFhV8uUo5DB0atIHmrWDSQEwzHi0E24nBrrYX1Q8jTD835GlDaHcmB6ma67S3DlY9x
 WhVsGS4ROXfWJPjCbaKbqY9ZNj3zf2AQxqy09/yxD7AbwQAnKgvtYKJpq2na6en2aExoYwGA219
 NaN41kBKCOHmW+InpQWx7v8aSrLLp0dJrb4IvdUALhj3JScBDdhviof0jXsT/6ozPH2QujZ68hW
 dsXawh4YPnBh/e1HcGqOkg3sfh/nISgT2R0iX+RnvN4JxCsc3IQcEwYE4CM6UocGQeyfMn7dVN8
 IuwvMtI4SZPPMRCuZ6kiBD82wjx9cGkpCapY8rfk0nY5HS9CxpQckwO+aDgls4QL6oG9H/zJczN
 qmwqqpD/q4vV0c+sCQfRV/DmsEpEUnGafcYSoA+5mFOC2ZtXdwPs0PelhUVoRSKT6j/MyjEXEJa
 C73v/REZeHsloS9hPAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102577-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[nxsw.ie,kernel.org,baylibre.com,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 682693D1F81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 12:10 AM, Bryan O'Donoghue wrote:
> On 09/04/2026 19:10, Taniya Das wrote:
>> +		videocc: clock-controller@aaf0000 {
>> +			compatible = "qcom,eliza-videocc";
>> +			reg = <0x0 0xaaf0000 0x0 0x10000>;
>> +
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <&sleep_clk>,
>> +				 <&gcc GCC_VIDEO_AHB_CLK>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,eliza-camcc";
>> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
>> +
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&sleep_clk>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
> 
> This looks odd.
> 
> Why do these two controllers have no power-domains ?

Bryan, on Eliza the videocc and camcc are connected on CX and MXA.

-- 
Thanks,
Taniya Das


